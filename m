Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EC424C07A1
	for <lists+linux-usb@lfdr.de>; Wed, 23 Feb 2022 03:10:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236143AbiBWCKk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Feb 2022 21:10:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232031AbiBWCKj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Feb 2022 21:10:39 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 608FE3D49A
        for <linux-usb@vger.kernel.org>; Tue, 22 Feb 2022 18:10:12 -0800 (PST)
Received: (qmail 993346 invoked by uid 1000); 22 Feb 2022 21:10:11 -0500
Date:   Tue, 22 Feb 2022 21:10:11 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Subject: Re: [PATCH] usb: core: improve handling of hubs with no ports
Message-ID: <YhWXgyJ4lk8OpT57@rowland.harvard.edu>
References: <994d8963-ca4d-d4cb-a3f6-988d6aa9bcd7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <994d8963-ca4d-d4cb-a3f6-988d6aa9bcd7@gmail.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Feb 22, 2022 at 10:13:09PM +0100, Heiner Kallweit wrote:
> I get the "hub doesn't have any ports" error message on a system with
> Amlogic S905W SoC. Seems the SoC has internal USB 3.0 supports but
> is crippled with regard to USB 3.0 ports.
> Maybe we shouldn't consider this scenario an error. So let's change
> the message to info level, but otherwise keep the handling of the
> scenario as it is today. With the patch it looks like this on my
> system.
> 
> dwc2 c9100000.usb: supply vusb_d not found, using dummy regulator
> dwc2 c9100000.usb: supply vusb_a not found, using dummy regulator
> dwc2 c9100000.usb: EPs: 7, dedicated fifos, 712 entries in SPRAM
> xhci-hcd xhci-hcd.0.auto: xHCI Host Controller
> xhci-hcd xhci-hcd.0.auto: new USB bus registered, assigned bus number 1
> xhci-hcd xhci-hcd.0.auto: hcc params 0x0228f664 hci version 0x100 quirks 0x0000000002010010
> xhci-hcd xhci-hcd.0.auto: irq 49, io mem 0xc9000000
> hub 1-0:1.0: USB hub found
> hub 1-0:1.0: 2 ports detected
> xhci-hcd xhci-hcd.0.auto: xHCI Host Controller
> xhci-hcd xhci-hcd.0.auto: new USB bus registered, assigned bus number 2
> xhci-hcd xhci-hcd.0.auto: Host supports USB 3.0 SuperSpeed
> usb usb2: We don't know the algorithms for LPM for this host, disabling LPM.
> hub 2-0:1.0: USB hub found
> hub 2-0:1.0: hub has no ports, exiting
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/usb/core/hub.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 83b5aff25..e3f40d1f4 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -1423,9 +1423,8 @@ static int hub_configure(struct usb_hub *hub,
>  		ret = -ENODEV;
>  		goto fail;
>  	} else if (hub->descriptor->bNbrPorts == 0) {
> -		message = "hub doesn't have any ports!";
> -		ret = -ENODEV;
> -		goto fail;
> +		dev_info(hub_dev, "hub has no ports, exiting\n");
> +		return -ENODEV;
>  	}
>  
>  	/*

How about instead changing xhci-hcd so that it doesn't try to register 
a USB-3 root hub if the controller doesn't have any USB-3 ports?  I 
think that would make more sense.

Alan Stern
