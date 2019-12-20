alias jq_nbstrip="jq --indent 1 \
    '(.cells[] | select(has(\"outputs\")) | .outputs) = []  \
    | (.cells[] | select(has(\"execution_count\")) | .execution_count) = null  \
    | .metadata = {\"kernelspec\": {\"name\": \"python3\", \"language\": \"python\", \"display_name\": \"Python 3\"}, \"language_info\": {\"name\": \"python\", \"pygments_lexer\": \"ipython3\"}} \
    | .cells[].metadata = {} \
    '"
function nbstripout {
    for i
    do ls $1 && echo -E "$( jq_nbstrip $i )" > $i
    done
}
