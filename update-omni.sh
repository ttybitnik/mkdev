#!/usr/bin/env bash

# MKDEV - Boilerplates for isolated development environments
# Copyright (C) 2025 Vinícius Moraes <vinicius.moraes@eternodevir.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.

# Update Omni package files within the boilerplates directory.

concat_pkg_files()
{
    local env_dir="$1"
    local omni_dir="$2"
    local env_pkg_files=("$env_dir"/*.txt)

    if [ ${#env_pkg_files[@]} -eq 0 ]; then
        printf "No .txt files found in the current directory.\n"
        exit 1
    fi

    for pkg_file in "${env_pkg_files[@]}"; do
        local pkg_base
        pkg_base=$(basename "$pkg_file")

        [[ "$pkg_base" == "omni.txt" ]] && continue

        if [[ -s "$pkg_file" ]]; then
            cat "$pkg_file" >>"$omni_dir/$pkg_base"
        fi
    done
}

update_omni_pkg_files()
{
    local omni_dir="$1"
    shift
    local selected_environments=("$@")

    for env_dir in "${selected_environments[@]}"; do
        concat_pkg_files "./boilerplates/$env_dir" "$omni_dir"
    done

    for pkg_file in "$omni_dir"/*.txt; do
        sort -u "$pkg_file" -o "$pkg_file"
    done
}

ci_output()
{
    if [ -n "$CI" ]; then
        local status_omni="$1"
        if [[ "$status_omni" == "true" && "$RUN_MODE" == "push" ]]; then
            printf "::notice title=%s::boilerplates updated successfully.\n" "$0"
        fi
        printf "omni=%s\n" "$status_omni" >>"$GITHUB_OUTPUT"
    fi
}

for omni in ./boilerplates/omni/*/omni.txt; do
    omni_dir=$(dirname "$omni")

    mapfile -t selected_environments <"$omni"

    if [ ${#selected_environments[@]} -eq 0 ]; then
        printf "No valid omni.txt found, skipping.\n"
        continue
    fi

    update_omni_pkg_files "$omni_dir" "${selected_environments[@]}"
done

if git status --porcelain | grep -q 'boilerplates/omni.*\.txt'; then
    printf "%s: omni package files updated successfully.\n" "$0"
    ci_output "true"
else
    printf "%s: nothing to update, no omni changes.\n" "$0"
    ci_output "false"
fi
