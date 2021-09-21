Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 598FB413034
	for <lists+linux-usb@lfdr.de>; Tue, 21 Sep 2021 10:34:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231186AbhIUIgX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Sep 2021 04:36:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:36406 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230497AbhIUIgX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 21 Sep 2021 04:36:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 09D4D61090;
        Tue, 21 Sep 2021 08:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632213295;
        bh=p4y6s3/PhpFd6ixA63EyoxE9wQGBXYX4UMCN9iX5njY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jNnJLqUMJ0PGT9aPgUyW1AhPkvvlXRoaAS0WFWo4VilHNttqWblBZ/j3NrECVM52Q
         OS4F3Nl4GwQE5VIv0cENhDLzs6XlNtKuUqd8x/Oc35XfCZuSSTPiq/aFs1aInx9Yw6
         5E8wAPaPf0NOshB+GN5RhWFiiZ8vWwYkNy+W9hiAwT29sZrSn9rmSEgXv1u0feXoAK
         yASyd+E4lnVRmXaEdWJTjF52i2WBpIPhP8HETC1d4zcYzQrXmdwZ2MU2CqZVgdLSdI
         NMREKwfdMexjhIcCRgJEJaNXwRafr2jmNW+6XUC/lFd0QQ52i80xfhrdnU7aTegFvq
         F+Q7ObKQgD4hw==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1mSbEr-0001Qq-3H; Tue, 21 Sep 2021 10:34:53 +0200
Date:   Tue, 21 Sep 2021 10:34:53 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Malte Bayer <malte@neo-soft.org>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Possible bug in the cp210x kernel driver?
Message-ID: <YUmZLTapApY57veG@hovoldconsulting.com>
References: <zarafa.6148ae0f.4d56.2bc45ad001615f69@neosoft.neo-soft.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <zarafa.6148ae0f.4d56.2bc45ad001615f69@neosoft.neo-soft.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Malte,

The mailings lists reject html so can you see if you can disable that
in you mail client when replying?

On Mon, Sep 20, 2021 at 05:51:43PM +0200, Malte Bayer wrote:

> > In event mode the device is supposed to replace any '0xec' characters
> > in the input stream with the string '0xec 0x00', which the driver then
> > needs to convert back to '0xec'.
> > 
> > But clearly your device doesn't escape '0xec' as expected.
> > 
> > What type of cp210x are you using?
> 
> Its the Silabs CP2102 DCL00X1612+

I used a CP2102 when implementing support for the embedded-event mode
and just verified that everything is working as expected.

The batch number "DCL00X" might provide some insight here though.
Searching for it gives a few hits describing counterfeit CP2102 devices
which has that particular number. [1][2] Apparently they behave
mostly like the real ones, but I wouldn't be surprised if they did not
implement the event mode.

It seems people were able to use the difference in responses to
malformed requests to determine which chips were fake. The below patch
is first stab at it based on [3].

Supposedly, the fake ones would only return a single byte in response,
while the CP2102 I have hear happily returns the full eight byte
requested.

Can apply the patch and send me the logs from when connecting your
device?

This might require some experimentation (e.g. different request,
length), but if we're lucky the malformed type request is all that's
needed to determine when event mode is supported.

Johan

[1] https://hackaday.com/2017/08/14/hands-on-with-the-shacamp-2017-badge/
[2] https://mobile.twitter.com/sha2017badge/status/1167902087289532418
[3] https://github.com/SHA2017-badge/cp2102-det/blob/master/main.c


From 43cab5bee8b12617d97998fa956553aef62fa704 Mon Sep 17 00:00:00 2001
From: Johan Hovold <johan@kernel.org>
Date: Tue, 21 Sep 2021 10:24:47 +0200
Subject: [PATCH] dbg: USB: serial: cp210x: add cp2102 quirk instrumentation

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/cp210x.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
index 66a6ac50a4cd..51d99d29dde1 100644
--- a/drivers/usb/serial/cp210x.c
+++ b/drivers/usb/serial/cp210x.c
@@ -2074,6 +2074,20 @@ static void cp210x_init_max_speed(struct usb_serial *serial)
 	priv->use_actual_rate = use_actual_rate;
 }
 
+static void cp2102_determine_quirks(struct usb_serial *serial)
+{
+	u8 data[8];
+	int ret;
+
+	ret = cp210x_read_vendor_block(serial, REQTYPE_DEVICE_TO_HOST,
+			CP210X_GET_PARTNUM, data, sizeof(data));
+	if (ret)
+		return;
+
+	dev_info(&serial->interface->dev, "%s - %*ph\n", __func__,
+			(int)sizeof(data), data);
+}
+
 static int cp210x_get_fw_version(struct usb_serial *serial, u16 value)
 {
 	struct cp210x_serial_private *priv = usb_get_serial_data(serial);
@@ -2108,7 +2122,13 @@ static void cp210x_determine_type(struct usb_serial *serial)
 		return;
 	}
 
+	dev_info(&serial->interface->dev, "%s - type = 0x%02x\n", __func__,
+			priv->partnum);
+
 	switch (priv->partnum) {
+	case CP210X_PARTNUM_CP2102:
+		cp2102_determine_quirks(serial);
+		break;
 	case CP210X_PARTNUM_CP2105:
 	case CP210X_PARTNUM_CP2108:
 		cp210x_get_fw_version(serial, CP210X_GET_FW_VER);
-- 
2.32.0

