Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CECED2472C4
	for <lists+linux-usb@lfdr.de>; Mon, 17 Aug 2020 20:47:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391631AbgHQSrV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Aug 2020 14:47:21 -0400
Received: from mga11.intel.com ([192.55.52.93]:46461 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391619AbgHQSrH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 Aug 2020 14:47:07 -0400
IronPort-SDR: egL61fmZD8KnEKevHHf8O1Zy+HnC7Cg1O26VxUNCjN0ikhyYJrPrP0r1EK0/X73ZS/+r9NrP3J
 Qab6RBCzZ2sQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="152409957"
X-IronPort-AV: E=Sophos;i="5.76,324,1592895600"; 
   d="scan'208";a="152409957"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2020 11:47:04 -0700
IronPort-SDR: BR9WGLrTtE04rvvqaDd5SGftfv2f3/R5k0PBljCTQrf0WxApARI04vJGt1qB3JMIiNwY5Q4RSn
 pTtqA7dmDu7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,324,1592895600"; 
   d="scan'208";a="496574798"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 17 Aug 2020 11:47:01 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 5233616D; Mon, 17 Aug 2020 21:47:00 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Anton Sviridenko <anton@corp.bluecherry.net>,
        Andrey Utkin <andrey.utkin@corp.bluecherry.net>,
        Ismael Luceno <ismael@iodev.co.uk>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jussi Kivilinna <jussi.kivilinna@iki.fi>,
        Kalle Valo <kvalo@codeaurora.org>,
        Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
        Sylwia Wnuczko <sylwia.wnuczko@intel.com>,
        Jesse Brandeburg <jesse.brandeburg@intel.com>
Subject: [PATCH v2 1/8] byteorder: Introduce cpu_to_le16_array() and le16_to_cpu_array()
Date:   Mon, 17 Aug 2020 21:46:52 +0300
Message-Id: <20200817184659.58419-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Introduce cpu_to_le16_array() and le16_to_cpu_array() for existing and
future users.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Anton Sviridenko <anton@corp.bluecherry.net>
Cc: Andrey Utkin <andrey.utkin@corp.bluecherry.net>
Cc: Ismael Luceno <ismael@iodev.co.uk>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Jussi Kivilinna <jussi.kivilinna@iki.fi>
Cc: Kalle Valo <kvalo@codeaurora.org>
Cc: Jeff Kirsher <jeffrey.t.kirsher@intel.com>
Cc: Sylwia Wnuczko <sylwia.wnuczko@intel.com>
Cc: Jesse Brandeburg <jesse.brandeburg@intel.com>
---
v2: split out of the USB patch

The idea, how I see it, is to push entire series via USB tree as a main
target of it. The immutable branch can be used for others to pick up.
Of course maintainers can propose better approach.

 include/linux/byteorder/generic.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/linux/byteorder/generic.h b/include/linux/byteorder/generic.h
index 4b13e0a3e15b..24904ad79df0 100644
--- a/include/linux/byteorder/generic.h
+++ b/include/linux/byteorder/generic.h
@@ -156,6 +156,22 @@ static inline void le64_add_cpu(__le64 *var, u64 val)
 	*var = cpu_to_le64(le64_to_cpu(*var) + val);
 }
 
+static inline void cpu_to_le16_array(__le16 *dst, const u16 *src, size_t len)
+{
+	int i;
+
+	for (i = 0; i < len; i++)
+		dst[i] = cpu_to_le16(src[i]);
+}
+
+static inline void le16_to_cpu_array(u16 *dst, const __le16 *src, size_t len)
+{
+	int i;
+
+	for (i = 0; i < len; i++)
+		dst[i] = le16_to_cpu(src[i]);
+}
+
 /* XXX: this stuff can be optimized */
 static inline void le32_to_cpu_array(u32 *buf, unsigned int words)
 {
-- 
2.28.0

