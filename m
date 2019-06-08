Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECBC939B42
	for <lists+linux-usb@lfdr.de>; Sat,  8 Jun 2019 07:13:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726083AbfFHFNq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 8 Jun 2019 01:13:46 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:36836 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725804AbfFHFNq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 8 Jun 2019 01:13:46 -0400
Received: by mail-pf1-f193.google.com with SMTP id u22so2304264pfm.3
        for <linux-usb@vger.kernel.org>; Fri, 07 Jun 2019 22:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references;
        bh=R9VTYP9/7G32Whru1TU/7RuR3qM+5MQe8FDzCDdKFAw=;
        b=RSOoZ5Iac9s1Q4lGwVAVCpSMT2Zc6qQkNQbP9qGOOzj7HFdolFSE+aWL+TWmw9bADw
         M8QSWv3+et/pTO3gjuo8JKtB8W2a9KA3/fIupun/Mf3mJQU1zkAig1LcTC7EVeKriCLK
         XAXeOMtrf9XV2vz3Ab3AUI0QnEFcMV3NdGvqYyIE2TvO5MxYVRI+8L2LNyTLGT1Gchcq
         FzGZ8KthzV/bqjkbLRjLGgvXyEWPfIek+9WRJEcy1pgf5SXn0SN1uSGHq+8pX1mcmdGt
         qD5LSoU+7a0qhZ6o+dnRUO+4WQRRBH5ycnMWpFREUdjMTA5usS4U4ZOYEQw3zcIrANVU
         QbhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:subject:date:message-id
         :in-reply-to:references;
        bh=R9VTYP9/7G32Whru1TU/7RuR3qM+5MQe8FDzCDdKFAw=;
        b=eFhJC16bhAfduTrPyhdcy5vo2wUEr2I1VNdkL1sMmrJbnVf9ybhrKmC5XuWzyqNwyh
         tnM+i50dr7o9JoqubIwhuiIOPO7fSVm30O1rzRJWiW5ljZlh3DVEnFgrr/Ke+qcSbOLk
         tURwXnlht3GMsSckkmxfX1bI2RTt7K21x/8BCSHkEj5d4ep/MA83Xiblxnj+0fzrpz8V
         aBqAKOThSkM5yC9S1qJDAUbJ2BQAaKTvTi6kJo2X3+3nKc8h0gWZJtWRd1qqPJ+4KZ7L
         eougU0XJdLg2T1MP4wvW/ALJ31XvwHOoHxXTzm7Gg7xYEOgyF8InVzN/vpu6HyhOn7gZ
         HH0Q==
X-Gm-Message-State: APjAAAX34WTaK4RAgis3zrCYAqz3tZOEHjSKvYEcbMNwKOMLkgAIqJdw
        sx1ajdcHIuqxMq2BM+UIrkSe+WkudMY=
X-Google-Smtp-Source: APXvYqw7HTC3a8U/x/PfSzSgw75YJIm/yKQL/4lkZfCy+GyxBc7FKzqb1TFf/MR26lKvcvP2Flhh0A==
X-Received: by 2002:a63:3c9:: with SMTP id 192mr530384pgd.90.1559970824731;
        Fri, 07 Jun 2019 22:13:44 -0700 (PDT)
Received: from jontio-desktop.hub ([2407:7000:9c2a:7b00:58e6:a4f8:a6f6:4bfe])
        by smtp.googlemail.com with ESMTPSA id 133sm216676pfa.92.2019.06.07.22.13.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 22:13:44 -0700 (PDT)
From:   jontio <jontio@i4free.co.nz>
To:     johan@kernel.org, linux-usb@vger.kernel.org, jontio@i4free.co.nz
Subject: [PATCH] USB: serial: ch341: fix wrong baud rate setting calculation
Date:   Sat,  8 Jun 2019 17:13:09 +1200
Message-Id: <20190608051309.4689-1-jontio@i4free.co.nz>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <jontio@i4free.co.nz>
References: <jontio@i4free.co.nz>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

For some wanted baud rates ch341_set_baudrate_lcr() calculates the "a"
value such that it produces a significantly different baud rate than the
desired one. This means some hardware can't communicate with the CH34x
chip. Particularly obvious wrong baud rates are 256000 and 921600 which
deviate by 2.3% and 7.4% respectively. This proposed patch will bring the
errors for these baud rates to below 0.5%. This patch will significantly
improve the error of some other unusual baud rates too (such as 1333333
from 10% error to 0% error). Currently ch341_set_baudrate_lcr() will
accept any baud rate and can produce a practically arbitrary large error
(for example a 40% error for 5000000) this patch does not address this
issue.

Signed-off-by: jontio <jontio@i4free.co.nz>
---
 drivers/usb/serial/ch341.c | 45 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/usb/serial/ch341.c b/drivers/usb/serial/ch341.c
index 3bb1fff02bed..7cd1d6f70b56 100644
--- a/drivers/usb/serial/ch341.c
+++ b/drivers/usb/serial/ch341.c
@@ -54,6 +54,9 @@
 #define CH341_BAUDBASE_FACTOR 1532620800
 #define CH341_BAUDBASE_DIVMAX 3
 
+/* Chip frequency is 12Mhz. not quite the same as (CH341_BAUDBASE_FACTOR>>7) */
+#define CH341_OSC_FREQUENCY 12000000
+
 /* Break support - the information used to implement this was gleaned from
  * the Net/FreeBSD uchcom.c driver by Takanori Watanabe.  Domo arigato.
  */
@@ -168,6 +171,48 @@ static int ch341_set_baudrate_lcr(struct usb_device *dev,
 	factor = 0x10000 - factor;
 	a = (factor & 0xff00) | divisor;
 
+	/*
+	 * Calculate baud error using the 0,1,2,3 LSB and
+	 * also the error without the divisor (LSB==7).
+	 * Decide whether the divisor should be used.
+	 */
+	uint32_t msB = (a>>8) & 0xFF;
+	uint32_t lsB = a & 0xFF;
+	int32_t baud_wanted = priv->baud_rate;
+	uint32_t denom = ((1<<(10-3*lsB))*(256-msB));
+	/*
+	 * baud_wanted==(CH341_OSC_FREQUENCY/256) implies MSB==0 for no divisor
+	 * the 100 is for rounding.
+	 */
+	if (denom && ((baud_wanted+100) >= (((uint32_t)CH341_OSC_FREQUENCY)>>8))) {
+
+		/* Calculate error for divisor */
+		int32_t baud_expected = ((uint32_t)CH341_OSC_FREQUENCY) / denom;
+		uint32_t baud_error_difference = abs(baud_expected-baud_wanted);
+
+		/* Calculate a for no divisor */
+		uint32_t a_no_divisor = ((0x10000-(((uint32_t)CH341_OSC_FREQUENCY)<<8) /
+			baud_wanted+128) & 0xFF00) | 0x07;
+
+		/* a_no_divisor is only valid for MSB<248 */
+		if ((a_no_divisor>>8) < 248) {
+
+			/* Calculate error for no divisor */
+			int32_t baud_expected_no_divisor = ((uint32_t)CH341_OSC_FREQUENCY) /
+				(256-(a_no_divisor>>8));
+			uint32_t baud_error_difference_no_divisor =
+				abs(baud_expected_no_divisor-baud_wanted);
+
+			/*
+			 * If error using no divisor is less than using
+			 * a divisor then use it instead for the "a" word.
+			 */
+			if (baud_error_difference_no_divisor < baud_error_difference)
+				a = a_no_divisor;
+		}
+
+	}
+
 	/*
 	 * CH341A buffers data until a full endpoint-size packet (32 bytes)
 	 * has been received unless bit 7 is set.
-- 
2.17.1

