Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75C32115101
	for <lists+linux-usb@lfdr.de>; Fri,  6 Dec 2019 14:31:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbfLFNbO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Dec 2019 08:31:14 -0500
Received: from mail-qt1-f202.google.com ([209.85.160.202]:42820 "EHLO
        mail-qt1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726171AbfLFNbO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Dec 2019 08:31:14 -0500
Received: by mail-qt1-f202.google.com with SMTP id e8so4992904qtg.9
        for <linux-usb@vger.kernel.org>; Fri, 06 Dec 2019 05:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=OuMl2Padgi2F86LngiXW/rNKGPqLqyPoo2tKLqo+OZ0=;
        b=aq5hmJ8/VLFT+W7QgPHzcpnRBd7dANE61topUxdtfQql1yj91FQAEXDVn9EicxiMhZ
         xurBhpeq7rANhxnf+7uxkxe5txTE/ynIHd+exOTEYUIi7PZ2I3qgF8qYRPL6XP8Heg9N
         hFmzWsK1AXYnb1Du/Xh4YAUS8f4bf2LzzSD4c1KzHAMkrZKBfpbb9hqXABIjgn3Hji6H
         bKL67YNg6+sGguM3Ar83PaxGR3x7Yhx4t/xJ07wStJOSZBDnPMNF/1JqB+P16ZjNbQaY
         c/EhzeWtQyPQkLzFS970HBgRD2k8IyVLkfQ6l7njD6M8COrqs+RZer7RDPvH+Tueyqli
         jQxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=OuMl2Padgi2F86LngiXW/rNKGPqLqyPoo2tKLqo+OZ0=;
        b=Ju86F0xnSd//zRrlgsyzgQfZm3tVh8RceF6kGPZI+vVvMN0LkA0UAEiSuu/WP57m47
         +AZoeCyl6nhOovxHmf3UCOfxidfzqYmFGiIfBHH2p3taHk4/pJH9S2Q3O5RsFF9lDhAL
         NuLpuW3ScHSb1rb+pcHEIA7yuScFPY7zns8wokPWJEHlEPBZz8V4B4Z6oIR2EzkXjrWK
         nmVtkpFDsh5gfL1XT6Gr1ukgd7pTwCIQLTujNjL5rfSiY3Uzqv7FiEtYEdAydfS++Nck
         ePizRH1lO2qdEXz95NnkRGIYmasccKL8UNKkbOfDyLo9vOwAu1Nz0qdz+LRweom4g58J
         UDFg==
X-Gm-Message-State: APjAAAWFSWQL4xthDKyH2ZeZj/IOG+6P55ujOKGTpOD6O5eVJs1lUxTU
        6Fxy+QCExseYrFOkpi7zmlqW/4wIaLtf7Xgry8K4YnO3YZV2nupL1AVpooUSv1bTmRvB4S2pQy8
        tP8dZaKqZKnOtuWwhjgEtxZDCnPK2evX5C1lVQF/KsUPPMB+y+dKh6u6prxq3UccT0AsTrptHTy
        /6
X-Google-Smtp-Source: APXvYqzMp0oW8UTSsFXrzpQYp4Gyrxm04PWtL4iunaDNSy7yDWnj6tE5mH3i/jWKt7xBBt3heTmpptyZOljrCFJX
X-Received: by 2002:a0c:b455:: with SMTP id e21mr12584924qvf.72.1575639073416;
 Fri, 06 Dec 2019 05:31:13 -0800 (PST)
Date:   Fri,  6 Dec 2019 14:31:09 +0100
Message-Id: <9e91020876029cfefc9211ff747685eba9536426.1575638983.git.andreyknvl@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.24.0.393.g34dc348eaf-goog
Subject: [PATCH v2] kcov: fix struct layout for kcov_remote_arg
From:   Andrey Konovalov <andreyknvl@google.com>
To:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        "Jacky . Cao @ sony . com" <Jacky.Cao@sony.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>,
        Andrey Konovalov <andreyknvl@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Make the layout of kcov_remote_arg the same for 32-bit and 64-bit code.
This makes it more convenient to write userspace apps that can be compiled
into 32-bit or 64-bit binaries and still work with the same 64-bit kernel.
Also use proper __u32 types in uapi headers instead of unsigned ints.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---

Changes v1->v2:
- Use __aligned_u64 instead of adding a __u32 reserved field.

 Documentation/dev-tools/kcov.rst | 10 +++++-----
 include/uapi/linux/kcov.h        | 10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/Documentation/dev-tools/kcov.rst b/Documentation/dev-tools/kcov.rst
index 36890b026e77..1c4e1825d769 100644
--- a/Documentation/dev-tools/kcov.rst
+++ b/Documentation/dev-tools/kcov.rst
@@ -251,11 +251,11 @@ selectively from different subsystems.
 .. code-block:: c
 
     struct kcov_remote_arg {
-	unsigned	trace_mode;
-	unsigned	area_size;
-	unsigned	num_handles;
-	uint64_t	common_handle;
-	uint64_t	handles[0];
+	__u32		trace_mode;
+	__u32		area_size;
+	__u32		num_handles;
+	__aligned_u64	common_handle;
+	__aligned_u64	handles[0];
     };
 
     #define KCOV_INIT_TRACE			_IOR('c', 1, unsigned long)
diff --git a/include/uapi/linux/kcov.h b/include/uapi/linux/kcov.h
index 409d3ad1e6e2..1d0350e44ae3 100644
--- a/include/uapi/linux/kcov.h
+++ b/include/uapi/linux/kcov.h
@@ -9,11 +9,11 @@
  * and the comment before kcov_remote_start() for usage details.
  */
 struct kcov_remote_arg {
-	unsigned int	trace_mode;	/* KCOV_TRACE_PC or KCOV_TRACE_CMP */
-	unsigned int	area_size;	/* Length of coverage buffer in words */
-	unsigned int	num_handles;	/* Size of handles array */
-	__u64		common_handle;
-	__u64		handles[0];
+	__u32		trace_mode;	/* KCOV_TRACE_PC or KCOV_TRACE_CMP */
+	__u32		area_size;	/* Length of coverage buffer in words */
+	__u32		num_handles;	/* Size of handles array */
+	__aligned_u64	common_handle;
+	__aligned_u64	handles[0];
 };
 
 #define KCOV_REMOTE_MAX_HANDLES		0x100
-- 
2.24.0.393.g34dc348eaf-goog

