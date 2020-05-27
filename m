Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 765F61E4FBA
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2020 22:59:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726798AbgE0U75 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 May 2020 16:59:57 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:61119 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726129AbgE0U74 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 May 2020 16:59:56 -0400
X-Originating-IP: 81.6.44.16
Received: from [172.22.0.20] (unknown [81.6.44.16])
        (Authenticated sender: hansmi@hansmi.ch)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 0C69840007;
        Wed, 27 May 2020 20:59:53 +0000 (UTC)
From:   Michael Hanselmann <public@hansmi.ch>
Subject: Re: [PATCH v2 4/6] USB: serial: ch341: Name prescaler, divisor
 registers
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org, Michael Dreher <michael@5dot1.de>,
        Jonathan Olds <jontio@i4free.co.nz>
References: <cover.1585697281.git.public@hansmi.ch>
 <65cfdf4a0600e86e89b3a3fb839e733ecebee688.1585697281.git.public@hansmi.ch>
 <20200514142434.GF25962@localhost>
X-Hello-World:  This header intentionally left blank
Message-ID: <2e80916d-1be8-dc0f-abf9-adc0feea1803@msgid.hansmi.ch>
Date:   Wed, 27 May 2020 22:59:53 +0200
MIME-Version: 1.0
In-Reply-To: <20200514142434.GF25962@localhost>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 14.05.20 16:24, Johan Hovold wrote:
> On Tue, Mar 31, 2020 at 11:37:20PM +0000, Michael Hanselmann wrote:
>> Add constants for the prescaler and divisor registers.
> 
> ...and document and name register 0x25, and put the LCR define to more
> use. I still thinks this should go in its own patch as your not
> replacing all magic register constants (or at least be mentioned in the
> commit message).

Updated the commit message with more details, see below too. Thanks for
the suggestion and review!

>> The 0x25 register is only used by CH341 chips before version 0x30 and is
>> involved in configuring the line control parameters. It's not known to
>> the author whether there any such chips in the wild, and the driver
>> never supported them (other registers are also treated differently). The
>> alternative would've been to not set the register, but that may have
>> unintended effects.
> 
> How did you come to those conclusions? I see this register being written
> the value zero in some older version of the vendor driver, but not in
> more recent ones.
>
> Are you sure it's at all related to LCR?

I am looking at version 3.50.2014.8 from 2019-03-04 of CH341S64.SYS, the
vendor driver. The function configuring registers 0x18 and 0x25 starts
at offset 0x119f0.

For chip versions 0x30 and above 0x25 is always set to 0. For versions
before 0x30 the values stored in register 0x25 depend on stop bit,
partity and word length settings.

>> -	r = ch341_control_out(dev, CH341_REQ_WRITE_REG, 0x2518, lcr);
>> +	/*
>> +	 * Chip versions before version 0x30 (read using
>> +	 * CH341_REQ_READ_VERSION) used separate registers for line control.
>> +	 * 0x30 and above use CH341_REG_LCR only.
>> +	 */
>> +	r = ch341_control_out(dev, CH341_REQ_WRITE_REG,
>> +			      CH341_REG_LCR2 << 8 | CH341_REG_LCR, lcr);
> 
> Keeping "0x25" here to indicate that it's purpose is still not known
> should be ok too.

Considering that the purpose is known (now) I've updated the comment.
I'm not going to attempt to implement the appropriate configuration for
the chip versions before 0x30.

Michael

---

From aa597afe1e9cf5641b94b377ce63248c2d0d677a Mon Sep 17 00:00:00 2001
From: Michael Hanselmann <public@hansmi.ch>
Date: Wed, 27 May 2020 22:56:54 +0200
Subject: [PATCH] USB: serial: ch341: Name prescaler, divisor registers

Add constants for the prescaler and divisor registers. Document and
name register 0x25, and put the LCR define to more use.

The 0x25 register (CH341_REG_LCR2) is only used by CH341 chips before
version 0x30 and is involved in configuring the line control parameters.
It's not known to the author whether there any such chips in the wild,
and Linux' ch341 driver never supported them. For chip version 0x30 and
above the 0x25 register is always set to zero. The alternative would've
been to not set the register at all, but that may have unintended
effects.

Signed-off-by: Michael Hanselmann <public@hansmi.ch>
---
 drivers/usb/serial/ch341.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/serial/ch341.c b/drivers/usb/serial/ch341.c
index 89675ee29645..97214e1ec5d2 100644
--- a/drivers/usb/serial/ch341.c
+++ b/drivers/usb/serial/ch341.c
@@ -59,7 +59,11 @@
 #define CH341_REQ_MODEM_CTRL   0xA4
 
 #define CH341_REG_BREAK        0x05
+#define CH341_REG_PRESCALER    0x12
+#define CH341_REG_DIVISOR      0x13
 #define CH341_REG_LCR          0x18
+#define CH341_REG_LCR2         0x25
+
 #define CH341_NBREAK_BITS      0x01
 
 #define CH341_LCR_ENABLE_RX    0x80
@@ -246,11 +250,20 @@ static int ch341_set_baudrate_lcr(struct usb_device *dev,
 	 */
 	val |= BIT(7);
 
-	r = ch341_control_out(dev, CH341_REQ_WRITE_REG, 0x1312, val);
+	r = ch341_control_out(dev, CH341_REQ_WRITE_REG,
+			      CH341_REG_DIVISOR << 8 | CH341_REG_PRESCALER,
+			      val);
 	if (r)
 		return r;
 
-	r = ch341_control_out(dev, CH341_REQ_WRITE_REG, 0x2518, lcr);
+	/*
+	 * Chip versions before version 0x30 as read using
+	 * CH341_REQ_READ_VERSION used separate registers for line control
+	 * (word length, parity and word length). Version 0x30 and above use
+	 * CH341_REG_LCR only and CH341_REG_LCR2 is always set to zero.
+	 */
+	r = ch341_control_out(dev, CH341_REQ_WRITE_REG,
+			      CH341_REG_LCR2 << 8 | CH341_REG_LCR, lcr);
 	if (r)
 		return r;
 
-- 
2.20.1
