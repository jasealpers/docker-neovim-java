#!/usr/bin/python3
# Function to find the size of largest subset
# of anagram words
from collections import Counter

def maxAnagramSize(input):

    # split input string separated by space
    input = input.split(" ")

    # sort each string in given list of strings
    for i in range(0,len(input)):
         input[i]=''.join(sorted(input[i]))

    # now create dictionary using counter method
    # which will have strings as key and their
    # frequencies as value
    freqDict = Counter(input)

    # get maximum value of frequency
    print (max(freqDict.values()))

# Driver program
if __name__ == "__main__":
    input = 'ant magenta magnate tan gnamate'
    maxAnagramSize(input)
