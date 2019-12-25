Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7718712A83B
	for <lists+linux-usb@lfdr.de>; Wed, 25 Dec 2019 14:30:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726353AbfLYNac (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Dec 2019 08:30:32 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:36258 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726185AbfLYNac (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 25 Dec 2019 08:30:32 -0500
Received: by mail-pj1-f66.google.com with SMTP id n59so2353938pjb.1
        for <linux-usb@vger.kernel.org>; Wed, 25 Dec 2019 05:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5x8fIOYgC7ab11l5mnzOhtE5QHP2l1FDmESAjR7cT4M=;
        b=tiqnqeFZAIpiL7zllsVZ/0AkX9dz9VD66VJPO97+jlgPBY6T17NVdfXrK5z3rdm6UZ
         K6B3XUXRIasykpBoy1gb+MEJQtXTQ1qyy5qQSJ1B/2nBrtctSn6k3HIRMv+S2b+aJg81
         5TeGMs1iVwtbQfK4M3Cw1YZyp7rN/hBbiQehwnZ+sUnsWsJYye2PPrFAD7eEgi9VcD80
         7q0KHBwkbPlbzgX/6ZaDyA8tUXe5nHWzZj2iKKAyRLfPU1EyK0vTVntbBuBuPtTQCNkR
         RKIRJp48ncMXywxdl5VUNqVaoOIXFXwT8V5SUZx8fAmXEbVWIcpzenynF2ROufv1iN1t
         u61Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5x8fIOYgC7ab11l5mnzOhtE5QHP2l1FDmESAjR7cT4M=;
        b=P+d8QnisRNiiyAcNDbbQ8LXJp7fLDXtaGDASZ2SXGD3/ODveGSzQ7mTpqbl+VmdRhk
         S2gkoAzllSPDvWFxrKcQ15bfmWXk9tyQr1OTC8X6nV3Efa+0rOXmTlPmQeby2gKZQ40j
         nK7ZQTrxeN5j1ETBhQ2bX19Y2o5ct6HED5efhIoJMtA67paxhzIqdmr+2PyufUPM5Dil
         ArVH26BQsAcmlG8ocVuLWuchVTxliP4xGUG39fFvDL8zMUfq3IK5iBKWdbbc0sWAKvvf
         ZhQ5x+RjURbNc7iz4szdxVFpkPJLcb0rRAEYeIY+lSqWAcPL170S1M6MHOJLjzjMsMFi
         +uPw==
X-Gm-Message-State: APjAAAXbGWuJ7Up+DJC6mzYxqND+EkpUw9je+tRuCEgrtz121+7S7t3S
        vgTAmOEPqXRAp54XVTwmuIs=
X-Google-Smtp-Source: APXvYqwuQMhCpjXyKEgd0L0S96Uqyu6Gend4BDXzEHSI9vpEmYda1CKVuOQhXIOziQXYorU+EFKPtA==
X-Received: by 2002:a17:90a:930f:: with SMTP id p15mr13160334pjo.2.1577280631090;
        Wed, 25 Dec 2019 05:30:31 -0800 (PST)
Received: from localhost.localdomain (111-249-6-6.dynamic-ip.hinet.net. [111.249.6.6])
        by smtp.gmail.com with ESMTPSA id i2sm28904451pgi.94.2019.12.25.05.30.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Dec 2019 05:30:30 -0800 (PST)
From:   Charles Yeh <charlesyeh522@gmail.com>
To:     gregkh@linuxfoundation.org, johan@kernel.org,
        linux-usb@vger.kernel.org
Cc:     charles-yeh@prolific.com.tw, Charles Yeh <charlesyeh522@gmail.com>
Subject: [PATCH] USB: serial: pl2303: PL2303HXN can support baud rate are set directly
Date:   Wed, 25 Dec 2019 21:30:05 +0800
Message-Id: <20191225133005.1617-1-charlesyeh522@gmail.com>
X-Mailer: git-send-email 2.24.1.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

PL2303HXN (TYPE_HXN) can program form 1 bps to 12000000 bps and
support standard & non-standard baud rates (Note 1) are set directly
It doesn't need complicated baud rate division calculation.

Note 1:
Standard baud rate:
75, 150, 300, 600, 1200, 1800, 2400, 3600, 4800, 7200, 9600,14400,
19200, 28800, 38400, 57600, 115200, 230400, 460800,614400, 921600,
1228800, 2457600, 3000000, 6000000

Non-standard baud rate (1 ~ 12000000):
1, 2, 5, 22, 55, 60, 75, 80, 123, 130, 150, 180, 187, 200, 300, 340,
400,..... 115200, 230400, 460800, 474747, 515151, 614400, 921600,
.. 1000000,.. 7000000,.. 12000000

Signed-off-by: Charles Yeh <charlesyeh522@gmail.com>
---
---
 drivers/usb/serial/pl2303.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/serial/pl2303.c b/drivers/usb/serial/pl2303.c
index aab737e1e7b6..63d354a92db9 100644
--- a/drivers/usb/serial/pl2303.c
+++ b/drivers/usb/serial/pl2303.c
@@ -565,17 +565,21 @@ static void pl2303_encode_baud_rate(struct tty_struct *tty,
 	if (!baud)
 		return;
 
-	if (spriv->type->max_baud_rate)
-		baud = min_t(speed_t, baud, spriv->type->max_baud_rate);
-	/*
-	 * Use direct method for supported baud rates, otherwise use divisors.
-	 */
-	baud_sup = pl2303_get_supported_baud_rate(baud);
-
-	if (baud == baud_sup)
+	if (spriv->type == &pl2303_type_data[TYPE_HXN]) {
 		baud = pl2303_encode_baud_rate_direct(buf, baud);
-	else
-		baud = pl2303_encode_baud_rate_divisor(buf, baud);
+	} else {
+		if (spriv->type->max_baud_rate)
+			baud = min_t(speed_t, baud, spriv->type->max_baud_rate);
+		/*
+		 * Use direct method for supported baud rates, otherwise use divisors.
+		 */
+		baud_sup = pl2303_get_supported_baud_rate(baud);
+
+		if (baud == baud_sup)
+			baud = pl2303_encode_baud_rate_direct(buf, baud);
+		else
+			baud = pl2303_encode_baud_rate_divisor(buf, baud);
+	}
 
 	/* Save resulting baud rate */
 	tty_encode_baud_rate(tty, baud, baud);
-- 
2.20.1

