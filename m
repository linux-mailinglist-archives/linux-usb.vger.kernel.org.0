Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5800D135C8B
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jan 2020 16:22:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732314AbgAIPWB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Jan 2020 10:22:01 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:52406 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727945AbgAIPWB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Jan 2020 10:22:01 -0500
Received: (qmail 2198 invoked by uid 2102); 9 Jan 2020 10:22:00 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 9 Jan 2020 10:22:00 -0500
Date:   Thu, 9 Jan 2020 10:22:00 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Keiya Nobuta <nobuta.keiya@fujitsu.com>
cc:     gregkh@linuxfoundation.org, <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: core: hub: Improved device recognition on remote
 wakeup
In-Reply-To: <20200109051448.28150-1-nobuta.keiya@fujitsu.com>
Message-ID: <Pine.LNX.4.44L0.2001091019520.1614-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 9 Jan 2020, Keiya Nobuta wrote:

> If hub_activate() is called before D+ has stabilized after remote
> wakeup, the following situation might occur:
> 
>          __      ___________________
>         /  \    /
> D+   __/    \__/
> 
> Hub  _______________________________
>           |  ^   ^           ^
>           |  |   |           |
> Host _____v__|___|___________|______
>           |  |   |           |
>           |  |   |           \-- Interrupt Transfer (*3)
>           |  |    \-- ClearPortFeature (*2)
>           |   \-- GetPortStatus (*1)
>           \-- Host detects remote wakeup
> 
> - D+ goes high, Host starts running by remote wakeup
> - D+ is not stable, goes low
> - Host requests GetPortStatus at (*1) and gets the following hub status:
>   - Current Connect Status bit is 0
>   - Connect Status Change bit is 1
> - D+ stabilizes, goes high
> - Host requests ClearPortFeature and thus Connect Status Change bit is
>   cleared at (*2)
> - After waiting 100 ms, Host starts the Interrupt Transfer at (*3)
> - Since the Connect Status Change bit is 0, Hub returns NAK.
> 
> In this case, port_event() is not called in hub_event() and Host cannot
> recognize device. To solve this issue, flag change_bits even if only
> Connect Status Change bit is 1 when got in the first GetPortStatus.
> 
> This issue occurs rarely because it only if D+ changes during a very
> short time between GetPortStatus and ClearPortFeature. However, it is
> fatal if it occurs in embedded system.
> 
> Signed-off-by: Keiya Nobuta <nobuta.keiya@fujitsu.com>
> ---
>  drivers/usb/core/hub.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index f229ad6..77f8eb1 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -1192,6 +1192,7 @@ static void hub_activate(struct usb_hub *hub, enum hub_activation_type type)
>  			 * PORT_OVER_CURRENT is not. So check for any of them.
>  			 */
>  			if (udev || (portstatus & USB_PORT_STAT_CONNECTION) ||
> +			    (portchange & USB_PORT_STAT_C_CONNECTION) ||
>  			    (portstatus & USB_PORT_STAT_OVERCURRENT) ||
>  			    (portchange & USB_PORT_STAT_C_OVERCURRENT))
>  				set_bit(port1, hub->change_bits);

I would have added the new test one line lower, so that all the
portstatus checks were adjacent and all the portchange checks were 
adjacent.  But that's a very small thing...

Acked-by: Alan Stern <stern@rowland.harvard.edu>

