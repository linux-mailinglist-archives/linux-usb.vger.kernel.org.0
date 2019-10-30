Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3311E9791
	for <lists+linux-usb@lfdr.de>; Wed, 30 Oct 2019 09:05:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726266AbfJ3IFy convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Wed, 30 Oct 2019 04:05:54 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:40379 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725942AbfJ3IFx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Oct 2019 04:05:53 -0400
Received: from mail-pg1-f197.google.com ([209.85.215.197])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1iPizH-0008Bg-EX
        for linux-usb@vger.kernel.org; Wed, 30 Oct 2019 08:05:51 +0000
Received: by mail-pg1-f197.google.com with SMTP id k23so1038625pgl.11
        for <linux-usb@vger.kernel.org>; Wed, 30 Oct 2019 01:05:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=4fjfT+X0zdxQp+vm9KtOTYPAl/RrpViMNAYUxI244Zw=;
        b=ELSCqxAG/HtOgr/KIC5Z7OLCj/jYcrhl55qEhnbt5sTreksP4IctaQBdkHTqEVaGgH
         4Hr+pi+IOVF+NfCTdkOG0aAvzrR1NuVj+EKBuj/PApYTIPAqzqm8sV9UKAaD4ICGhPZa
         F2KEIrbGtankltghjvOk9lKCSym8nG2MZp9+ns1Pzv0Uowyf6bSJSrop+RP5n78iGWo/
         fedpZ45CicKfJ4ZBJ4Pj3Rp2rH4kW1GHQZG0AipT1edrCKo0BJ0U+9FVPEw0H29axgPs
         vqkdC7mdmWo+trF9S4bb/4vKd7AEOyfYBHzwS+gn5XnQC9G7FKPtFbhcfjAGrTwgOY1M
         rpMQ==
X-Gm-Message-State: APjAAAV2t5Vb/RC5zX2eiUiT2/3ouCst7XECMFjOYWcjpSAPE93Pxydp
        56HMqegFpjpJBKZI33GedHcpshS/0oJSmdSF1FnHzNZ8TqBRCTnUZMUABt+vWsIx7aY5yNgt0gh
        bS9S+sL4R4RkSyIhJlrKsp2Mffz1ot2ZXfaYFYg==
X-Received: by 2002:a62:2581:: with SMTP id l123mr32783405pfl.197.1572422749590;
        Wed, 30 Oct 2019 01:05:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzJGBAZpI9S5VZ1C0iGWKVALmtKqjZ1JZTa7BVS3KQAcD9BjB82gWmCBgsC0gX7X/FQCA9Zsg==
X-Received: by 2002:a62:2581:: with SMTP id l123mr32783369pfl.197.1572422749219;
        Wed, 30 Oct 2019 01:05:49 -0700 (PDT)
Received: from 2001-b011-380f-3c42-507c-6d05-b0b1-d40f.dynamic-ip6.hinet.net (2001-b011-380f-3c42-507c-6d05-b0b1-d40f.dynamic-ip6.hinet.net. [2001:b011:380f:3c42:507c:6d05:b0b1:d40f])
        by smtp.gmail.com with ESMTPSA id q7sm1739666pff.19.2019.10.30.01.05.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 30 Oct 2019 01:05:48 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601\))
Subject: Re: [PATCH 2/2] usb: core: Attempt power cycle when port is in
 eSS.Disabled state
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <20191007182840.4867-2-kai.heng.feng@canonical.com>
Date:   Wed, 30 Oct 2019 16:05:45 +0800
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        USB list <linux-usb@vger.kernel.org>,
        linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <E70C54D2-89DB-4336-B9CA-3FCB7642ECBD@canonical.com>
References: <20191007182840.4867-1-kai.heng.feng@canonical.com>
 <20191007182840.4867-2-kai.heng.feng@canonical.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailer: Apple Mail (2.3601)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> On Oct 8, 2019, at 02:28, Kai-Heng Feng <kai.heng.feng@canonical.com> wrote:
> 
> On Dell TB16, Realtek USB ethernet (r8152) connects to an SMSC hub which
> then connects to ASMedia xHCI's root hub:
> 
> /:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/2p, 5000M
>    |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/7p, 5000M
>            |__ Port 2: Dev 3, If 0, Class=Vendor Specific Class, Driver=r8152, 5000M
> 
> Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
> Bus 004 Device 002: ID 0424:5537 Standard Microsystems Corp. USB5537B
> Bus 004 Device 003: ID 0bda:8153 Realtek Semiconductor Corp. RTL8153 Gigabit Ethernet Adapter
> 
> The SMSC hub may disconnect after system resume from suspend. When this
> happens, the reset resume attempt fails, and the last resort to disable
> the port and see something comes up later, also fails.
> 
> When the issue occurs, the link state stays in eSS.Disabled state
> despite the warm reset attempts. The USB spec mentioned this can be
> caused by invalid VBus, and after some expiremets, it does show that the
> SMSC hub can be brought back after a power cycle.
> 
> So let's power cycle the port at the end of reset resume attempt, if
> it's in eSS.Disabled state.

Is there any suggestion to make this series get merged?

Kai-Heng

> 
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---
> drivers/usb/core/hub.c | 21 +++++++++++++++++++--
> 1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 6655a6a1651b..5f50aca7cf67 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -2739,20 +2739,33 @@ static bool hub_port_warm_reset_required(struct usb_hub *hub, int port1,
> 		|| link_state == USB_SS_PORT_LS_COMP_MOD;
> }
> 
> +static bool hub_port_power_cycle_required(struct usb_hub *hub, int port1,
> +		u16 portstatus)
> +{
> +	u16 link_state;
> +
> +	if (!hub_is_superspeed(hub->hdev))
> +		return false;
> +
> +	link_state = portstatus & USB_PORT_STAT_LINK_STATE;
> +	return link_state == USB_SS_PORT_LS_SS_DISABLED;
> +}
> +
> static void hub_port_power_cycle(struct usb_hub *hub, int port1)
> {
> +	struct usb_port *port_dev = hub->ports[port1  - 1];
> 	int ret;
> 
> 	ret = usb_hub_set_port_power(hub, port1, false);
> 	if (ret) {
> -		dev_info(&udev->dev, "failed to disable port power\n");
> +		dev_info(&port_dev->dev, "failed to disable port power\n");
> 		return;
> 	}
> 
> 	msleep(2 * hub_power_on_good_delay(hub));
> 	ret = usb_hub_set_port_power(hub, port1, true);
> 	if (ret) {
> -		dev_info(&udev->dev, "failed to enable port power\n");
> +		dev_info(&port_dev->dev, "failed to enable port power\n");
> 		return;
> 	}
> 
> @@ -3600,6 +3613,10 @@ int usb_port_resume(struct usb_device *udev, pm_message_t msg)
> 	if (status < 0) {
> 		dev_dbg(&udev->dev, "can't resume, status %d\n", status);
> 		hub_port_logical_disconnect(hub, port1);
> +		if (hub_port_power_cycle_required(hub, port1, portstatus)) {
> +			dev_info(&udev->dev, "device in disabled state, attempt power cycle\n");
> +			hub_port_power_cycle(hub, port1);
> +		}
> 	} else  {
> 		/* Try to enable USB2 hardware LPM */
> 		usb_enable_usb2_hardware_lpm(udev);
> -- 
> 2.17.1
> 

