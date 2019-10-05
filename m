Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E867FCC9BA
	for <lists+linux-usb@lfdr.de>; Sat,  5 Oct 2019 13:47:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728319AbfJELqj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 5 Oct 2019 07:46:39 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:41650 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727990AbfJELqj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 5 Oct 2019 07:46:39 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 8C01025B7B0;
        Sat,  5 Oct 2019 21:46:36 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 85D9DE22CAB; Sat,  5 Oct 2019 13:46:34 +0200 (CEST)
Date:   Sat, 5 Oct 2019 13:46:34 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc:     davem@davemloft.net, hayeswang@realtek.com,
        mario.limonciello@dell.com, linux-usb@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] r8152: Set macpassthru in reset_resume callback
Message-ID: <20191005114634.wvv4yfdte7qchzxs@verge.net.au>
References: <20191004125104.13202-1-kai.heng.feng@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191004125104.13202-1-kai.heng.feng@canonical.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Oct 04, 2019 at 08:51:04PM +0800, Kai-Heng Feng wrote:
> r8152 may fail to establish network connection after resume from system
> suspend.
> 
> If the USB port connects to r8152 lost its power during system suspend,
> the MAC address was written before is lost. The reason is that The MAC
> address doesn't get written again in its reset_resume callback.
> 
> So let's set MAC address again in reset_resume callback. Also remove
> unnecessary lock as no other locking attempt will happen during
> reset_resume.

This is two separate seemingly unrelated, other than locality in the code,
changes. One is a fix, the other seems to be a cleanup. Perhaps they would
be better addressed in separate patches.

> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---
>  drivers/net/usb/r8152.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
> index 08726090570e..cee9fef925cd 100644
> --- a/drivers/net/usb/r8152.c
> +++ b/drivers/net/usb/r8152.c
> @@ -4799,10 +4799,9 @@ static int rtl8152_reset_resume(struct usb_interface *intf)
>  	struct r8152 *tp = usb_get_intfdata(intf);
>  
>  	clear_bit(SELECTIVE_SUSPEND, &tp->flags);
> -	mutex_lock(&tp->control);
>  	tp->rtl_ops.init(tp);
>  	queue_delayed_work(system_long_wq, &tp->hw_phy_work, 0);
> -	mutex_unlock(&tp->control);
> +	set_ethernet_addr(tp);
>  	return rtl8152_resume(intf);
>  }
>  
> -- 
> 2.17.1
> 
