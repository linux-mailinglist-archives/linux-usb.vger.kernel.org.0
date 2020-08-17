Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F381C2472BC
	for <lists+linux-usb@lfdr.de>; Mon, 17 Aug 2020 20:47:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391630AbgHQSrP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Aug 2020 14:47:15 -0400
Received: from mga11.intel.com ([192.55.52.93]:46455 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391616AbgHQSrG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 Aug 2020 14:47:06 -0400
IronPort-SDR: 3oiV5GhJYWGHKHHhwYA+Jd67hQpKArtIyeIxfRvWHdube25g9iiuP/1GZEhSp3fT72xtKsURJl
 D+uOixhVF6IQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="152409953"
X-IronPort-AV: E=Sophos;i="5.76,324,1592895600"; 
   d="scan'208";a="152409953"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2020 11:47:02 -0700
IronPort-SDR: 79fxeyZtIp2RDRU5KxJboLT6uCp5CZUFMBtvkDX90LZ75AEcyT17MNvJfCIqnXhCn5WQ1yt9Iq
 v8bkgNOS/w3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,324,1592895600"; 
   d="scan'208";a="496574793"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 17 Aug 2020 11:47:01 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 66C7D1A3; Mon, 17 Aug 2020 21:47:00 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jussi Kivilinna <jussi.kivilinna@iki.fi>,
        Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH v2 3/8] rndis_wlan: Make use of cpu_to_le16_array()
Date:   Mon, 17 Aug 2020 21:46:54 +0300
Message-Id: <20200817184659.58419-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200817184659.58419-1-andriy.shevchenko@linux.intel.com>
References: <20200817184659.58419-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Since we have a new helper, let's replace open coded variant by it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jussi Kivilinna <jussi.kivilinna@iki.fi>
Cc: Kalle Valo <kvalo@codeaurora.org>
---
v2: new patch
 drivers/net/wireless/rndis_wlan.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/rndis_wlan.c b/drivers/net/wireless/rndis_wlan.c
index 8852a1832951..06850ee6d6dc 100644
--- a/drivers/net/wireless/rndis_wlan.c
+++ b/drivers/net/wireless/rndis_wlan.c
@@ -859,9 +859,12 @@ static int rndis_set_config_parameter(struct usbnet *dev, char *param,
 						int value_type, void *value)
 {
 	struct ndis_config_param *infobuf;
-	int value_len, info_len, param_len, ret, i;
+	int value_len, info_len, param_len, ret;
 	__le16 *unibuf;
 	__le32 *dst_value;
+#ifdef DEBUG
+	int i;
+#endif
 
 	if (value_type == 0)
 		value_len = sizeof(__le32);
@@ -901,13 +904,11 @@ static int rndis_set_config_parameter(struct usbnet *dev, char *param,
 
 	/* simple string to unicode string conversion */
 	unibuf = (void *)infobuf + sizeof(*infobuf);
-	for (i = 0; i < param_len / sizeof(__le16); i++)
-		unibuf[i] = cpu_to_le16(param[i]);
+	cpu_to_le16_array(unibuf, param, param_len / sizeof(__le16));
 
 	if (value_type == 2) {
 		unibuf = (void *)infobuf + sizeof(*infobuf) + param_len;
-		for (i = 0; i < value_len / sizeof(__le16); i++)
-			unibuf[i] = cpu_to_le16(((u8 *)value)[i]);
+		cpu_to_le16_array(unibuf, value, value_len / sizeof(__le16));
 	} else {
 		dst_value = (void *)infobuf + sizeof(*infobuf) + param_len;
 		*dst_value = cpu_to_le32(*(u32 *)value);
-- 
2.28.0

