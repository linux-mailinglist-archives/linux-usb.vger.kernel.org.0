Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB322216F60
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jul 2020 16:53:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728137AbgGGOxY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Jul 2020 10:53:24 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:43483 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbgGGOxY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Jul 2020 10:53:24 -0400
X-Originating-IP: 81.6.44.16
Received: from [172.22.0.20] (unknown [81.6.44.16])
        (Authenticated sender: hansmi@hansmi.ch)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 15957FF806;
        Tue,  7 Jul 2020 14:53:22 +0000 (UTC)
From:   Michael Hanselmann <public@hansmi.ch>
Subject: Re: [PATCH] USB: serial: ch341: fix simulated-break comment
To:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
References: <20200707061957.17425-1-johan@kernel.org>
X-Hello-World:  This header intentionally left blank
Message-ID: <9909b288-294d-16b9-9f14-51eb79c63b6c@msgid.hansmi.ch>
Date:   Tue, 7 Jul 2020 16:53:22 +0200
MIME-Version: 1.0
In-Reply-To: <20200707061957.17425-1-johan@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On devices which do not support break signalling a break condition is
simulated by sending a NUL byte at the lowest possible speed. The break
condition will be 9 bit periods long (start bit and eight data bits),
but the transmission itself also includes the stop bit. The safety
margin of one bit is kept to account for timing differences.

Signed-off-by: Michael Hanselmann <public@hansmi.ch>
---

Hi Johan

On 07.07.20 08:19, Johan Hovold wrote:
> I reread the break-end comment and found it a bit confusing still. The
> below seems more correct to me. I'm assuming you did not intend to add
> an additional bit period as margin?

The additional bit was intentional, but I missed the start bit and was
off by one. As such your fix indeed addresses the inconsistency between
the comment and code. Considering the general quality of the ch341
chips needing the simulation and to account for timing differences I'd
instead prefer to increase the delay from 10 to 11 bits (1 start, 8 data,
1 stop, 1 margin).

Michael

 drivers/usb/serial/ch341.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/serial/ch341.c b/drivers/usb/serial/ch341.c
index 0cb02d1bde02..580aa5833091 100644
--- a/drivers/usb/serial/ch341.c
+++ b/drivers/usb/serial/ch341.c
@@ -603,11 +603,13 @@ static void ch341_simulate_break(struct tty_struct *tty, int break_state)
 		}
 
 		/*
-		 * Compute expected transmission duration and add a single bit
-		 * of safety margin (the actual NUL byte transmission is 8 bits
-		 * plus one stop bit).
+		 * Compute expected transmission duration including safety
+		 * margin. The original baud rate is only restored after the
+		 * computed point in time.
+		 *
+		 * 11 bits = 1 start, 8 data, 1 stop, 1 margin
 		 */
-		priv->break_end = jiffies + (10 * HZ / CH341_MIN_BPS);
+		priv->break_end = jiffies + (11 * HZ / CH341_MIN_BPS);
 
 		return;
 	}
-- 
2.20.1
