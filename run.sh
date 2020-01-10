curl https://dumps.wikimedia.org/jawiki/latest/jawiki-latest-pages-articles.xml.bz2 -o jawiki-latest-pages-articles.xml.bz2
python WikiExtractor.py ./jawiki-latest-pages-articles.xml.bz2

# Word Frequency
find text/ | grep wiki | awk '{system("cat "$0" >> wiki.txt")}'
cat wiki.txt | sed '/^<[^>]*>$/d' > wiki_removed_doc_tag.txt
cat wiki_removed_doc_tag.txt | python ~/Gitroot/datascience-sandbox/kazuma_murao/common/lib/text_normalizer.py \
      | python ~/Gitroot/datascience-sandbox/kazuma_murao/common/lib/morphological_analyser.py > wiki_removed_doc_tag_ma.txt
cat ./wiki_removed_doc_tag_ma.txt | python word_counter.py 100 > ./dictionary_wiki_word_frequency

# Document Frequency
find text/ | grep wiki | awk '{system("cat "$0" | python remove_tag.py >> wiki-oneline_remove_doc_tag.txt")}'
cat wiki-oneline_remove_doc_tag.txt | python ~/Gitroot/datascience-sandbox/kazuma_murao/common/lib/text_normalizer.py \
      | python ~/Gitroot/datascience-sandbox/kazuma_murao/common/lib/morphological_analyser.py | python unique_word_set.py > ./wiki-oneline_remove_doc_tag_ma.txt &
cat ./wiki-oneline_remove_doc_tag_ma.txt | python word_counter.py 100 > ./dictionary_wiki_document_frequency
