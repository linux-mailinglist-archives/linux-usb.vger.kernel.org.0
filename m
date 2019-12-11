Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FB2B11AC58
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2019 14:45:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729664AbfLKNpg convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Wed, 11 Dec 2019 08:45:36 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:41607 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729460AbfLKNpe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Dec 2019 08:45:34 -0500
Received: from mail-pf1-f200.google.com ([209.85.210.200])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1if2J1-0008Qv-VB
        for linux-usb@vger.kernel.org; Wed, 11 Dec 2019 13:45:32 +0000
Received: by mail-pf1-f200.google.com with SMTP id r2so2128727pfl.2
        for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2019 05:45:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=kq+q9UoCbJWekUGal6VdA3tM3gj9G0YEqra+olhLR4k=;
        b=aDL/knHuepj+Kph0WqfVTPjYhGFwIImF1A5slag8AOht11eTBM71c8/9jJIfWTugK+
         Eu+0J3rrkFG/po++f5Vn26LQU32OGZxvxcUxRbAENTw76Bc3fsyY3IS36UyX95o3Q+TV
         b79XjebzG58KrcVFiBB/2Hx4Ohh8nJCe9EBqEEiJWo1RFGbb6EumnglN7UnPSlqmjjl+
         kZrm1lPIAkOC0X1xL/26whUjjeRWD5yvfiib3/l8dOxZrP3U+Qa8XysPEl0I8m4J8Hze
         QWtPFSIdvXtp8tymmliiOtcBlYqrsRCJlnbk84p5uXneT3SamdWD+PAZnQpjUapTL2kX
         6GBg==
X-Gm-Message-State: APjAAAWy08zUDcJ2qOIJSJCV2TC0MQRSVu41iWwHbRUF0ZnPllO9V239
        DfcUGa3ygq87JTBCNgNHBmqYX+jadDi+ldKyCh1dnGxBBgPB3fqvwTRUBMfo/WJqfKOWNlOszaW
        nVIM8gK1MNZeI9g4Ma25ySMzFuJJvMNszuRQayg==
X-Received: by 2002:a17:902:6bca:: with SMTP id m10mr3367183plt.212.1576071930529;
        Wed, 11 Dec 2019 05:45:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqz084GCSMaapgObJICUVeCPfP8dI0/c9sjZURFS5lhO9QLqyPNZGQCUenriObwSiGGR6XaFUQ==
X-Received: by 2002:a17:902:6bca:: with SMTP id m10mr3367151plt.212.1576071930098;
        Wed, 11 Dec 2019 05:45:30 -0800 (PST)
Received: from 2001-b011-380f-3c42-bdac-6ba6-1bf8-ef7f.dynamic-ip6.hinet.net (2001-b011-380f-3c42-bdac-6ba6-1bf8-ef7f.dynamic-ip6.hinet.net. [2001:b011:380f:3c42:bdac:6ba6:1bf8:ef7f])
        by smtp.gmail.com with ESMTPSA id k101sm2824765pjb.5.2019.12.11.05.45.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Dec 2019 05:45:29 -0800 (PST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: Re: [PATCH v2 2/2] USB: core: Attempt power cycle port when it's in
 eSS.Disabled state
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <20191129174115.31683-2-kai.heng.feng@canonical.com>
Date:   Wed, 11 Dec 2019 21:45:26 +0800
Cc:     stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <62C4527A-5231-4A69-BE7C-9844E2123A90@canonical.com>
References: <20191129174115.31683-1-kai.heng.feng@canonical.com>
 <20191129174115.31683-2-kai.heng.feng@canonical.com>
To:     Greg KH <gregkh@linuxfoundation.org>
X-Mailer: Apple Mail (2.3601.0.10)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> On Nov 30, 2019, at 01:41, Kai-Heng Feng <kai.heng.feng@canonical.com> wrote:
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
> despite the warm reset attempts. Accoding to spec this can be caused by
> invalid VBus, after some expiremets, the SMSC hub can be brought back
> after a powercycle.
> 
> So let's power cycle the port at the end of reset resume attempt, if
> it's in eSS.Disabled state.

If there's no objection, can this fix be reviewed and merged?

Kai-Heng

> 
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---
> v2:
> - Lower dev_info() to dev_dbg().
> 
> drivers/usb/core/hub.c | 16 ++++++++++++++++
> 1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 6b6cd76ac5e6..a2e6001046f5 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -2739,6 +2739,18 @@ static bool hub_port_warm_reset_required(struct usb_hub *hub, int port1,
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
> 	struct usb_port *port_dev = hub->ports[port1  - 1];
> @@ -3601,6 +3613,10 @@ int usb_port_resume(struct usb_device *udev, pm_message_t msg)
> 	if (status < 0) {
> 		dev_dbg(&udev->dev, "can't resume, status %d\n", status);
> 		hub_port_logical_disconnect(hub, port1);
> +		if (hub_port_power_cycle_required(hub, port1, portstatus)) {
> +			dev_dbg(&udev->dev, "device in disabled state, attempt power cycle\n");
> +			hub_port_power_cycle(hub, port1);
> +		}
> 	} else  {
> 		/* Try to enable USB2 hardware LPM */
> 		usb_enable_usb2_hardware_lpm(udev);
> -- 
> 2.17.1
> 

