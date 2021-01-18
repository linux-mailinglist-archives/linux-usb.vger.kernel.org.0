Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A9062F997E
	for <lists+linux-usb@lfdr.de>; Mon, 18 Jan 2021 06:47:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732240AbhARFqH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Jan 2021 00:46:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55036 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732163AbhARFpr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 18 Jan 2021 00:45:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1610948661;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VOf6YYpsCCTW0hOXZG8vk+4qqe4zPxwo1VVrYS7gvyI=;
        b=LYmcWupOFvMy4HiY7jqIpmPOTQTilDuZ0kP9ssh9B5AZ+GaQFNr8Ovf38CXXjNjRJg6zxF
        mT36lnHfxB1QXM3nTTaWyOwFvQdwnLfxJb55V39tN9AJp5Ie7Ay4qD/xHUDjY/x93bHJ/h
        WLxDNyof/I2YeSYcoSxcmmbj55VuiYU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-DQQMn__uML2-xZcj7ALBkg-1; Mon, 18 Jan 2021 00:44:18 -0500
X-MC-Unique: DQQMn__uML2-xZcj7ALBkg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8417815722;
        Mon, 18 Jan 2021 05:44:17 +0000 (UTC)
Received: from suzdal.zaitcev.lan (ovpn-112-202.phx2.redhat.com [10.3.112.202])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 28A4E5D720;
        Mon, 18 Jan 2021 05:44:17 +0000 (UTC)
Date:   Sun, 17 Jan 2021 23:44:16 -0600
From:   Pete Zaitcev <zaitcev@redhat.com>
To:     Jeremy Figgins <kernel@jeremyfiggins.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        zaitcev@redhat.com
Subject: Re: [PATCH] USB: usblp: add USBLP_QUIRK_NO_SET_INTF flag
Message-ID: <20210117234416.49d59761@suzdal.zaitcev.lan>
In-Reply-To: <YASt5wgOCkXhH2Dv@watson>
References: <YASt5wgOCkXhH2Dv@watson>
Organization: Red Hat, Inc.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, 17 Jan 2021 15:36:39 -0600
Jeremy Figgins <kernel@jeremyfiggins.com> wrote:

> The naming is designed to mirror the existing
> USB_QUIRK_NO_SET_INTF flag, but that flag is
> not sufficient to make these devices work.
> +	{ 0x0416, 0x5011, USBLP_QUIRK_NO_SET_INTF }, /* Winbond Electronics Corp. Virtual Com Port */

Jeremy, thanks for the patch. It looks mostly fine code-wise (quirk is
out of numerical order), but I have a question: did you consider keying
off usblp->dev->quirks instead?

How about this:

diff --git a/drivers/usb/class/usblp.c b/drivers/usb/class/usblp.c
index 37062130a03c..0c4a98f00797 100644
--- a/drivers/usb/class/usblp.c
+++ b/drivers/usb/class/usblp.c
@@ -1315,7 +1315,11 @@ static int usblp_set_protocol(struct usblp *usblp, int protocol)
 	alts = usblp->protocol[protocol].alt_setting;
 	if (alts < 0)
 		return -EINVAL;
-	r = usb_set_interface(usblp->dev, usblp->ifnum, alts);
+	if (usblp->dev->quirks & USB_QUIRK_NO_SET_INTF) {
+		r = 0;
+	} else {
+		r = usb_set_interface(usblp->dev, usblp->ifnum, alts);
+	}
 	if (r < 0) {
 		printk(KERN_ERR "usblp: can't set desired altsetting %d on interface %d\n",
 			alts, usblp->ifnum);
diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index 1b4eb7046b07..632c60401d53 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -205,6 +205,9 @@ static const struct usb_device_id usb_quirk_list[] = {
 	/* HP v222w 16GB Mini USB Drive */
 	{ USB_DEVICE(0x03f0, 0x3f40), .driver_info = USB_QUIRK_DELAY_INIT },
 
+	/* Winbond Electronics Corp. Virtual Com Port */
+	{ USB_DEVICE(0x0416, 0x5011), .driver_info = USB_QUIRK_NO_SET_INTF },
+
 	/* Creative SB Audigy 2 NX */
 	{ USB_DEVICE(0x041e, 0x3020), .driver_info = USB_QUIRK_RESET_RESUME },
 

Please let me know if it works for you.

-- Pete

