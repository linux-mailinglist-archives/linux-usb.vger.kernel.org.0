Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 815AD1281BD
	for <lists+linux-usb@lfdr.de>; Fri, 20 Dec 2019 18:59:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727402AbfLTR7W (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Dec 2019 12:59:22 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:53316 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727391AbfLTR7W (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 Dec 2019 12:59:22 -0500
Received: from mail-io1-f69.google.com ([209.85.166.69])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <dann.frazier@canonical.com>)
        id 1iiMYZ-0000Uq-Cu
        for linux-usb@vger.kernel.org; Fri, 20 Dec 2019 17:59:19 +0000
Received: by mail-io1-f69.google.com with SMTP id c23so6505164ioi.12
        for <linux-usb@vger.kernel.org>; Fri, 20 Dec 2019 09:59:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6Zj9j8AxyB5E3aqyzwEacyDgopyS0WLEgNa4XNIp+HI=;
        b=dpIB2FulI6CXL1oVwx8WSOF9iu8+iIyzoWFY4gKR7XVmLjklnMCrzaiQKToO7BxKHD
         ZUkNDW1kaUv6NvszxDTHKNhdLntztxIR6BAKL81Ty2gaoESluhAzAeb4IOTNQ+rGmuN6
         0r6Rj2k/eI8bQOlegq1F9j2IJ0MmYwJGhKYdi+HAHkgQDbFj3B4BYz0n161eYRGozdPe
         yLOTevWC1T2kWWGFGRSdQsbxKMNjOUbosTBRPBmkLw6Uc3O3dWcarOdaDYxuOvLvcjfK
         41hT20PFQSAungjUNXZb8F386d+33Rcn0pvWMxdvY9KxMNrWOyiW2CQo3ri26XDx3zvP
         IvOQ==
X-Gm-Message-State: APjAAAX7LA1xmHrZWMn3AHFPPynROzBc7gjUS2sy5zm5PPCfP8M3sh28
        /eh6kwGFEF+L3aBoJ+kc/iamHrQOlb8OtL8sToSB611zPk9/Aq1na1L0aLMxE3laEGidYIa9rfi
        CnNWwrXJveK+876wp2GUKw+rHtFdRVZoNqLNyDw==
X-Received: by 2002:a05:6602:1c5:: with SMTP id w5mr10499791iot.129.1576864758107;
        Fri, 20 Dec 2019 09:59:18 -0800 (PST)
X-Google-Smtp-Source: APXvYqzbQ7i2xx3RBSMww5xZCnf9VVL4Np8oQFyQulkWBVCODZ5YUkla/Ym6srFnnD0R2dGG6oK14g==
X-Received: by 2002:a05:6602:1c5:: with SMTP id w5mr10499777iot.129.1576864757744;
        Fri, 20 Dec 2019 09:59:17 -0800 (PST)
Received: from xps13.canonical.com (c-71-56-235-36.hsd1.co.comcast.net. [71.56.235.36])
        by smtp.gmail.com with ESMTPSA id d12sm5064124iln.63.2019.12.20.09.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2019 09:59:17 -0800 (PST)
Date:   Fri, 20 Dec 2019 10:59:16 -0700
From:   dann frazier <dann.frazier@canonical.com>
To:     Jan-Marek Glogowski <glogow@fbihome.de>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Jon Flatley <jflat@chromium.org>,
        Oliver Neukum <oneukum@suse.com>,
        Matthew Ruffell <matthew.ruffell@canonical.com>,
        Heitor Alves de Siqueira <heitor.de.siqueira@canonical.com>
Subject: Re: [PATCH] usb: handle warm-reset port requests on hub resume
Message-ID: <20191220175916.GA78572@xps13.dannf>
References: <1549025551-4306-1-git-send-email-glogow@fbihome.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1549025551-4306-1-git-send-email-glogow@fbihome.de>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Feb 01, 2019 at 01:52:31PM +0100, Jan-Marek Glogowski wrote:
> On plug-in of my USB-C device, its USB_SS_PORT_LS_SS_INACTIVE
> link state bit is set. Greping all the kernel for this bit shows
> that the port status requests a warm-reset this way.
> 
> This just happens, if its the only device on the root hub, the hub
> therefore resumes and the HCDs status_urb isn't yet available.
> If a warm-reset request is detected, this sets the hubs event_bits,
> which will prevent any auto-suspend and allows the hubs workqueue
> to warm-reset the port later in port_event.

Hi - just a heads-up while we continue to debug - we've received a
regression report in Ubuntu after pulling this in from stable. It was
bisected down to this commit and still reproducible w/ 5.5-rc2:

  https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1856608

  -dann

> Signed-off-by: Jan-Marek Glogowski <glogow@fbihome.de>
> Acked-by: Alan Stern <stern@rowland.harvard.edu>
> ---
> 
> The original thread is "USB-C storage device not detected on USB 3.1 Gen 2
> host when plugged in after boot". A different patch, suggested by Mathias
> Nyman, didn't work for me. This patch was just rebased on usb-next, but not
> re-tested. Original tests are based on 5.0-rc.
> 
> v1: This always warm-resets the ports in hub_activate, independent of the
> "enum hub_activation_type". Just had a single device to test.
> 
> v2: I had the idea about the working device, if there is already a device
> connected to the hub and that a resume only on "type == HUB_RESUME" should
> be sufficient. This still works for me, but I didn't follow all the
> hub_activate callers everywhere and I'm definitly still missing a lot of
> knowledge about USB stuff. There is also HUB_RESET_RESUME with a slightly
> different code path. I don't know how to trigger this.
> 
> v3: code unchanged to v2.
> 
> v4: instead of handling the warm-reset directly from hub_activate by calling
> hub_port_reset, this defers the reset by setting the hubs event_bits of the
> port.
> 
> ---
>  drivers/usb/core/hub.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index bb0830c..8d4631c 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -108,6 +108,8 @@ EXPORT_SYMBOL_GPL(ehci_cf_port_reset_rwsem);
>  static void hub_release(struct kref *kref);
>  static int usb_reset_and_verify_device(struct usb_device *udev);
>  static int hub_port_disable(struct usb_hub *hub, int port1, int set_state);
> +static bool hub_port_warm_reset_required(struct usb_hub *hub, int port1,
> +		u16 portstatus);
>  
>  static inline char *portspeed(struct usb_hub *hub, int portstatus)
>  {
> @@ -1137,6 +1139,11 @@ static void hub_activate(struct usb_hub *hub, enum hub_activation_type type)
>  						   USB_PORT_FEAT_ENABLE);
>  		}
>  
> +		/* Make sure a warm-reset request is handled by port_event */
> +		if (type == HUB_RESUME &&
> +		    hub_port_warm_reset_required(hub, port1, portstatus))
> +			set_bit(port1, hub->event_bits);
> +
>  		/*
>  		 * Add debounce if USB3 link is in polling/link training state.
>  		 * Link will automatically transition to Enabled state after
