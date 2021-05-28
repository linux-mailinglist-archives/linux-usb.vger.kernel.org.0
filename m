Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC2FE394528
	for <lists+linux-usb@lfdr.de>; Fri, 28 May 2021 17:35:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234338AbhE1Pg4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 May 2021 11:36:56 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:51399 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230201AbhE1Pgy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 May 2021 11:36:54 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id CDA4E200006;
        Fri, 28 May 2021 15:35:17 +0000 (UTC)
Date:   Fri, 28 May 2021 17:35:17 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc:     Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tony Lindgren <tony@atomide.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] usb: musb: fix MUSB_QUIRK_B_DISCONNECT_99 handling
Message-ID: <YLENtd45ly8ZFJO2@piout.net>
References: <20210528140446.278076-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210528140446.278076-1-thomas.petazzoni@bootlin.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 28/05/2021 16:04:46+0200, Thomas Petazzoni wrote:
> In commit 92af4fc6ec33 ("usb: musb: Fix suspend with devices
> connected for a64"), the logic to support the
> MUSB_QUIRK_B_DISCONNECT_99 quirk was modified to only conditionally
> schedule the musb->irq_work delayed work.
> 
> This commit badly breaks ECM Gadget on AM335X. Indeed, with this
> commit, one can observe massive packet loss:
> 
> $ ping 192.168.0.100
> ...
> 15 packets transmitted, 3 received, 80% packet loss, time 14316ms
> 
> Reverting this commit brings back a properly functioning ECM
> Gadget. An analysis of the commit seems to indicate that a mistake was
> made: the previous code was not falling through into the
> MUSB_QUIRK_B_INVALID_VBUS_91, but now it is, unless the condition is
> taken.
> 
> Changing the logic to be as it was before the problematic commit *and*
> only conditionally scheduling musb->irq_work resolves the regression:
> 
> $ ping 192.168.0.100
> ...
> 64 packets transmitted, 64 received, 0% packet loss, time 64475ms
> 
> Fixes: 92af4fc6ec33 ("usb: musb: Fix suspend with devices connected for a64")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Tested-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> Cc: stable@vger.kernel.org
> ---
>  drivers/usb/musb/musb_core.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
> index 8f09a387b773..4c8f0112481f 100644
> --- a/drivers/usb/musb/musb_core.c
> +++ b/drivers/usb/musb/musb_core.c
> @@ -2009,9 +2009,8 @@ static void musb_pm_runtime_check_session(struct musb *musb)
>  			schedule_delayed_work(&musb->irq_work,
>  					      msecs_to_jiffies(1000));
>  			musb->quirk_retries--;
> -			break;
>  		}
> -		fallthrough;
> +		break;
>  	case MUSB_QUIRK_B_INVALID_VBUS_91:
>  		if (musb->quirk_retries && !musb->flush_irq_work) {
>  			musb_dbg(musb,
> -- 
> 2.31.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
