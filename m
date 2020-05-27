Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CF9C1E5115
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2020 00:19:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725780AbgE0WTe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 May 2020 18:19:34 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:42881 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725385AbgE0WTe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 May 2020 18:19:34 -0400
X-Originating-IP: 81.6.44.16
Received: from [172.22.0.20] (unknown [81.6.44.16])
        (Authenticated sender: hansmi@hansmi.ch)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id E67DB1C0002;
        Wed, 27 May 2020 22:19:31 +0000 (UTC)
Subject: Re: [PATCH v2 5/6] USB: serial: ch341: Compute minimum baud rate
To:     linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>
Cc:     Michael Dreher <michael@5dot1.de>,
        Jonathan Olds <jontio@i4free.co.nz>
References: <cover.1585697281.git.public@hansmi.ch>
 <55c53ab4650ecabd1a6cd619ec72eed2e00d5dd2.1585697281.git.public@hansmi.ch>
From:   Michael Hanselmann <public@hansmi.ch>
X-Hello-World:  This header intentionally left blank
Message-ID: <de39436b-ba4d-73be-513f-72ccff0fec1b@msgid.hansmi.ch>
Date:   Thu, 28 May 2020 00:19:30 +0200
MIME-Version: 1.0
In-Reply-To: <55c53ab4650ecabd1a6cd619ec72eed2e00d5dd2.1585697281.git.public@hansmi.ch>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The minimum baud rate was hardcoded, not computed from first principles.
The break condition simulation added in a later patch will also need to
make use of the minimum baud rate.

The (1 + ((x - 1) / y)) pattern is to force rounding up (mathematically
the minimum rate is about 45.78bps).

Signed-off-by: Michael Hanselmann <public@hansmi.ch>
---
Rebase on top of usb-next and wording change in commit message.

 drivers/usb/serial/ch341.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/serial/ch341.c b/drivers/usb/serial/ch341.c
index 97214e1ec5d2..202cfa4ef6c7 100644
--- a/drivers/usb/serial/ch341.c
+++ b/drivers/usb/serial/ch341.c
@@ -147,6 +147,8 @@ static int ch341_control_in(struct usb_device *dev,
 
 #define CH341_CLKRATE		48000000
 #define CH341_CLK_DIV(ps, fact)	(1 << (12 - 3 * (ps) - (fact)))
+#define CH341_MIN_BPS \
+	(unsigned int)(1 + (((CH341_CLKRATE) - 1) / (CH341_CLK_DIV(0, 0) * 256)))
 #define CH341_MIN_RATE(ps)	(CH341_CLKRATE / (CH341_CLK_DIV((ps), 1) * 512))
 
 static const speed_t ch341_min_rates[] = {
@@ -174,10 +176,10 @@ static int ch341_get_divisor(struct ch341_private *priv)
 	int ps;
 
 	/*
-	 * Clamp to supported range, this makes the (ps < 0) and (div < 2)
-	 * sanity checks below redundant.
+	 * Clamp to supported range, making the later range sanity checks
+	 * redundant.
 	 */
-	speed = clamp(speed, 46U, 3000000U);
+	speed = clamp(speed, CH341_MIN_BPS, 3000000U);
 
 	/*
 	 * Start with highest possible base clock (fact = 1) that will give a
-- 
2.20.1
