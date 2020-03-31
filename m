Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C23D19A292
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2020 01:37:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731556AbgCaXhj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 Mar 2020 19:37:39 -0400
Received: from mail-gateway-shared02.cyon.net ([194.126.200.224]:49902 "EHLO
        mail-gateway-shared02.cyon.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731545AbgCaXhi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 Mar 2020 19:37:38 -0400
Received: from s013.cyon.net ([149.126.4.22])
        by mail-gateway-shared02.cyon.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim)
        (envelope-from <public+bounce-silo.slz.hanselmann.tv-hansmi@hansmi.ch>)
        id 1jJQRq-00010S-HY
        for linux-usb@vger.kernel.org; Wed, 01 Apr 2020 01:37:37 +0200
Received: from [10.20.10.233] (port=39918 helo=mail.cyon.ch)
        by s013.cyon.net with esmtpa (Exim 4.93)
        (envelope-from <public+bounce-silo.slz.hanselmann.tv-hansmi@hansmi.ch>)
        id 1jJQRp-000qKH-6I; Wed, 01 Apr 2020 01:37:33 +0200
Received: from hansmi by silo.slz.hanselmann.tv with local (Exim 4.92)
        (envelope-from <hansmi@silo.slz.hanselmann.tv>)
        id 1jJQRo-00086O-S7; Tue, 31 Mar 2020 23:37:32 +0000
From:   Michael Hanselmann <public@hansmi.ch>
To:     linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>
Cc:     Michael Hanselmann <public@hansmi.ch>,
        Michael Dreher <michael@5dot1.de>,
        Jonathan Olds <jontio@i4free.co.nz>
Subject: [PATCH v2 5/6] USB: serial: ch341: Compute minimum baud rate
Date:   Tue, 31 Mar 2020 23:37:21 +0000
Message-Id: <55c53ab4650ecabd1a6cd619ec72eed2e00d5dd2.1585697281.git.public@hansmi.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1585697281.git.public@hansmi.ch>
References: <cover.1585697281.git.public@hansmi.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - s013.cyon.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - hansmi.ch
X-Get-Message-Sender-Via: s013.cyon.net: authenticated_id: mailrelay-cervus@hansmi.ch
X-Authenticated-Sender: s013.cyon.net: mailrelay-cervus@hansmi.ch
X-OutGoing-Spam-Status: No, score=-1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The minimum baud rate was hardcoded, not computed. A patch later in the
series will make use of the minimum baud rate as well.

The (1 + ((x - 1) / y)) pattern is to force rounding up (mathematically
the minimum rate is about 45.78bps).

Signed-off-by: Michael Hanselmann <public@hansmi.ch>
---
 drivers/usb/serial/ch341.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/serial/ch341.c b/drivers/usb/serial/ch341.c
index 9407e12d9fbc..c820772e6a07 100644
--- a/drivers/usb/serial/ch341.c
+++ b/drivers/usb/serial/ch341.c
@@ -147,6 +147,8 @@ static int ch341_control_in(struct usb_device *dev,
 
 #define CH341_CLKRATE		48000000
 #define CH341_CLK_DIV(ps, fact)	(1 << (12 - 3 * (ps) - (fact)))
+#define CH341_MIN_BPS \
+	(unsigned int)(1 + (((CH341_CLKRATE) - 1) / (CH341_CLK_DIV(0, 0) * 256)))
 #define CH341_MIN_RATE(ps, fact) \
 	(CH341_CLKRATE / (CH341_CLK_DIV((ps), (fact)) * 256))
 
@@ -210,10 +212,10 @@ static int ch341_get_divisor(struct ch341_private *priv)
 	speed = priv->baud_rate;
 
 	/*
-	 * Clamp to supported range, this makes the (ps < 0) and (div < 2)
-	 * sanity checks below redundant.
+	 * Clamp to supported range, making the later range sanity checks
+	 * redundant.
 	 */
-	speed = clamp(speed, 46U, 3000000U);
+	speed = clamp(speed, CH341_MIN_BPS, 3000000U);
 
 	if (priv->quirks & CH341_QUIRK_LIMITED_PRESCALER) {
 		/*
-- 
2.20.1

