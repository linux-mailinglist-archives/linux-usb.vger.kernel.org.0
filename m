Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60AD61CF5EA
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2020 15:36:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729756AbgELNgR convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 12 May 2020 09:36:17 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:35345 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729882AbgELNgQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 May 2020 09:36:16 -0400
Received: from mail-pl1-f198.google.com ([209.85.214.198])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1jYV4v-0003Ri-GS
        for linux-usb@vger.kernel.org; Tue, 12 May 2020 13:36:13 +0000
Received: by mail-pl1-f198.google.com with SMTP id q7so10082367plr.4
        for <linux-usb@vger.kernel.org>; Tue, 12 May 2020 06:36:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=3QbtWi3wsf1LF3UN0EWC9HG+YQXWbeigC60hrNmNJsg=;
        b=ccXZfcdTlx0O/SpgI4OXhlaS+If3Kn14Hm3PhAiE3U6kHBEl83NjSJNTSgafp1z1qs
         G/4wv29ItfzxO8furVKzG8SC2Adq90+Ok4yqIp2J74gvs8bLKwaBy/z3gP3lvOha+oXP
         /fza7cahZsauE0kSBOSd8/grpGKhgOe1EZNPAUZaFY6f4QMdvFblHrrrHcRwbRqzPxFM
         nF4T8E2yOg9n2GXial/JWZ2bxVNT3oOsprq3X6cGAfV2wBlf0ivOn7b7vB4vB7W7euCF
         ntbW7yaoEU2SK3qoRFt+8bMS/wrZcF6Z95TiAzfPkSLonGLVCb488eQghqtYa6stQrDR
         ofug==
X-Gm-Message-State: AOAM532TuLPleg6htIkK5Ipga/Au2EamaeA55JXdpYVDTXjAwote/bec
        7uAUqNBiLNy3xFd2ioC2sc54M+G6m8qzF6O2oqHVRKWhBFYuM4W9Ar0qBJf/WH5IyKmT7p3/C56
        8VapQOiZEvojQwnes1gV6yecW/zKApThT+BmHEA==
X-Received: by 2002:a63:b506:: with SMTP id y6mr1985670pge.107.1589290571914;
        Tue, 12 May 2020 06:36:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqSJt84eMeBF6JbK0R0JQheIp555UBITFFPqlDRqD6lyOzpGOcD8KLjLO1LppGrr+FeRSA5w==
X-Received: by 2002:a63:b506:: with SMTP id y6mr1985644pge.107.1589290571570;
        Tue, 12 May 2020 06:36:11 -0700 (PDT)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net. [220.133.187.190])
        by smtp.gmail.com with ESMTPSA id a30sm10605469pgm.44.2020.05.12.06.36.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 May 2020 06:36:10 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v4] USB: hub: Fix the broken detection of USB3 device in
 SMSC hub
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <1580989763-32291-1-git-send-email-hgajjar@de.adit-jv.com>
Date:   Tue, 12 May 2020 21:36:07 +0800
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stern@rowland.harvard.edu, thinhn@synopsys.com,
        Kento.A.Kobayashi@sony.com, atmgnd@outlook.com,
        linux-usb@vger.kernel.org, andrew_gabbasov@mentor.com,
        erosca@de.adit-jv.com, linux-renesas-soc@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <73933975-6F0E-40F5-9584-D2B8F615C0F3@canonical.com>
References: <1580989763-32291-1-git-send-email-hgajjar@de.adit-jv.com>
To:     Hardik Gajjar <hgajjar@de.adit-jv.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Hardik,

This patch prevents my Raven Ridge xHCI from getting runtime suspend.

> On Feb 6, 2020, at 19:49, Hardik Gajjar <hgajjar@de.adit-jv.com> wrote:
> 
> Renesas R-Car H3ULCB + Kingfisher Infotainment Board is either not able
> to detect the USB3.0 mass storage devices or is detecting those as
> USB2.0 high speed devices.
> 
> The explanation given by Renesas is that, due to a HW issue, the XHCI
> driver does not wake up after going to sleep on connecting a USB3.0
> device.

Since the issue is already root caused to xHCI, sounds the workaround should be implemented in xHCI?

Functions like xhci_alloc_dev() can be a better place to instrument the workaround.

Kai-Heng

> 
> In order to mitigate that, disable the auto-suspend feature
> specifically for SMSC hubs from hub_probe() function, as a quirk.
> 
> Renesas Kingfisher Infotainment Board has two USB3.0 ports (CN2) which
> are connected via USB5534B 4-port SuperSpeed/Hi-Speed, low-power,
> configurable hub controller.
> 
> [1] SanDisk USB 3.0 device detected as USB-2.0 before the patch
> [   74.036390] usb 5-1.1: new high-speed USB device number 4 using xhci-hcd
> [   74.061598] usb 5-1.1: New USB device found, idVendor=0781, idProduct=5581, bcdDevice= 1.00
> [   74.069976] usb 5-1.1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> [   74.077303] usb 5-1.1: Product: Ultra
> [   74.080980] usb 5-1.1: Manufacturer: SanDisk
> [   74.085263] usb 5-1.1: SerialNumber: 4C530001110208116550
> 
> [2] SanDisk USB 3.0 device detected as USB-3.0 after the patch
> [   34.565078] usb 6-1.1: new SuperSpeed Gen 1 USB device number 3 using xhci-hcd
> [   34.588719] usb 6-1.1: New USB device found, idVendor=0781, idProduct=5581, bcdDevice= 1.00
> [   34.597098] usb 6-1.1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> [   34.604430] usb 6-1.1: Product: Ultra
> [   34.608110] usb 6-1.1: Manufacturer: SanDisk
> [   34.612397] usb 6-1.1: SerialNumber: 4C530001110208116550
> 
> Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Hardik Gajjar <hgajjar@de.adit-jv.com>
> Acked-by: Alan Stern <stern@rowland.harvard.edu>
> Tested-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> 
> ---
> Changes in v4:
> - [Eugeniu Rosca] Corrected indentation in hub.h
> 
> Changes in v3:
> - [Alan Stern] Called usb_autopm_put_interface() from
>   hub_disconnect() to enable auto suspend for interface.
> - [v3] https://lore.kernel.org/linux-renesas-soc/1580838253-31822-1-git-send-email-hgajjar@de.adit-jv.com/
> 
> Changes in v2:
> - [Alan Stern] Switched from pm_runtime_set_autosuspend_delay()
>   to usb_autopm_get_interface()
> - Improved commit description
> - Rebased against v5.5
> - [v2] https://lore.kernel.org/linux-renesas-soc/1580403994-21076-1-git-send-email-hgajjar@de.adit-jv.com/
> 
> drivers/usb/core/hub.c | 15 +++++++++++++++
> drivers/usb/core/hub.h |  1 +
> 2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 3405b14..de94fa4 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -38,7 +38,9 @@
> #include "otg_whitelist.h"
> 
> #define USB_VENDOR_GENESYS_LOGIC		0x05e3
> +#define USB_VENDOR_SMSC				0x0424
> #define HUB_QUIRK_CHECK_PORT_AUTOSUSPEND	0x01
> +#define HUB_QUIRK_DISABLE_AUTOSUSPEND		0x02
> 
> #define USB_TP_TRANSMISSION_DELAY	40	/* ns */
> #define USB_TP_TRANSMISSION_DELAY_MAX	65535	/* ns */
> @@ -1731,6 +1733,10 @@ static void hub_disconnect(struct usb_interface *intf)
> 	kfree(hub->buffer);
> 
> 	pm_suspend_ignore_children(&intf->dev, false);
> +
> +	if (hub->quirk_disable_autosuspend)
> +		usb_autopm_put_interface(intf);
> +
> 	kref_put(&hub->kref, hub_release);
> }
> 
> @@ -1863,6 +1869,11 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
> 	if (id->driver_info & HUB_QUIRK_CHECK_PORT_AUTOSUSPEND)
> 		hub->quirk_check_port_auto_suspend = 1;
> 
> +	if (id->driver_info & HUB_QUIRK_DISABLE_AUTOSUSPEND) {
> +		hub->quirk_disable_autosuspend = 1;
> +		usb_autopm_get_interface(intf);
> +	}
> +
> 	if (hub_configure(hub, &desc->endpoint[0].desc) >= 0)
> 		return 0;
> 
> @@ -5599,6 +5610,10 @@ static void hub_event(struct work_struct *work)
> }
> 
> static const struct usb_device_id hub_id_table[] = {
> +    { .match_flags = USB_DEVICE_ID_MATCH_VENDOR | USB_DEVICE_ID_MATCH_INT_CLASS,
> +      .idVendor = USB_VENDOR_SMSC,
> +      .bInterfaceClass = USB_CLASS_HUB,
> +      .driver_info = HUB_QUIRK_DISABLE_AUTOSUSPEND},
>     { .match_flags = USB_DEVICE_ID_MATCH_VENDOR
> 			| USB_DEVICE_ID_MATCH_INT_CLASS,
>       .idVendor = USB_VENDOR_GENESYS_LOGIC,
> diff --git a/drivers/usb/core/hub.h b/drivers/usb/core/hub.h
> index a9e24e4..a97dd1b 100644
> --- a/drivers/usb/core/hub.h
> +++ b/drivers/usb/core/hub.h
> @@ -61,6 +61,7 @@ struct usb_hub {
> 	unsigned		quiescing:1;
> 	unsigned		disconnected:1;
> 	unsigned		in_reset:1;
> +	unsigned		quirk_disable_autosuspend:1;
> 
> 	unsigned		quirk_check_port_auto_suspend:1;
> 
> -- 
> 2.7.4
> 
> 

