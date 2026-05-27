#!/bin/bash
# report_export.sh - Automated LaTeX compilation for UET.CN3124 Audit Report

REPORT_DIR="report"
MAIN_TEX="main.tex"
OUTPUT_PDF="report.pdf"

echo "[*] Entering $REPORT_DIR..."
cd "$REPORT_DIR" || { echo "[-] Error: Directory $REPORT_DIR not found."; exit 1; }

echo "[*] Compiling LaTeX (Pass 1)..."
pdflatex -interaction=nonstopmode "$MAIN_TEX" > /dev/null

echo "[*] Compiling LaTeX (Pass 2 for references)..."
pdflatex -interaction=nonstopmode "$MAIN_TEX" > /dev/null

if [ -f "main.pdf" ]; then
    mv main.pdf "$OUTPUT_PDF"
    echo "[+] Success! Report exported to $REPORT_DIR/$OUTPUT_PDF"
    
    # Cleanup auxiliary files
    echo "[*] Cleaning up auxiliary files..."
    rm -f main.aux main.log main.toc main.out
else
    echo "[-] Error: PDF generation failed. Check main.log for details."
    exit 1
fi
