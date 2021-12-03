Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B4164677AC
	for <lists+linux-usb@lfdr.de>; Fri,  3 Dec 2021 13:51:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380959AbhLCMzJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Dec 2021 07:55:09 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:34404 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380953AbhLCMzJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Dec 2021 07:55:09 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5C79D62A30
        for <linux-usb@vger.kernel.org>; Fri,  3 Dec 2021 12:51:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E005C53FC7;
        Fri,  3 Dec 2021 12:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1638535904;
        bh=6GbrfruxenT6ffNBSvvwPfjlTq6wc/eJ05XODJtbrho=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pcqP99gwmL+wuz4buP+WbJp305prikOu1Bzwem4HaSSMuqbHAhorISfn9wibmqx/5
         j7ePV4wKNeWFW2cb/u9TL6bZwzo+VUaSulAv0GW43cSnX/Z5ZJxKX6l0Cx+O/3G7fH
         wdNMSFtdCut3n1i5Fu/vUYK0I1lN43lyLVcRbWl0=
Date:   Fri, 3 Dec 2021 13:51:41 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Sanjeev Chugh <sanjeev_chugh@mentor.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH V1 1/1] usb: hub: introduce delay after usb hub mutex
 release
Message-ID: <YaoS3RoqkGkf6NFa@kroah.com>
References: <1638320288-6465-1-git-send-email-sanjeev_chugh@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1638320288-6465-1-git-send-email-sanjeev_chugh@mentor.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Dec 01, 2021 at 06:28:08AM +0530, Sanjeev Chugh wrote:
> Rogue usb sticks can cause endless port connect change events
> due to unstable electric connection between usb chip and
> the port. Port connect change will cause device enumeration for
> the new device connection and new device processing is done with
> the usb hub mutex acquired. This can cause very short time gap
> between unlock/lock of hub device mutex. So if some thread is
> running at low priority than hub_thread, it can face hub device
> mutex starvation.
> 
> This commit introduces a sleep of 25ms after the hub device mutex is
> unlocked in hub_events so that if hub_thread is stuck in a
> endless loop, all other threads will get fair amount of chance
> to acquire the usb hub mutex.
> 
> Signed-off-by: Sanjeev Chugh <sanjeev_chugh@mentor.com>
> ---
>  drivers/usb/core/hub.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 00070a8..0be2acc 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -5763,6 +5763,17 @@ static void hub_event(struct work_struct *work)
>  out_hdev_lock:
>  	usb_unlock_device(hdev);
>  
> +	/*
> +	 * Rogue usb sticks can cause endless device connection
> +	 * events due to unstable electric connection.

What is a "usb stick"?  Any usb device could cause this, right?

> This
> +	 * can cause very short time gap between unlock/lock
> +	 * of hub device mutex thus causing mutex starvation
> +	 * for some other lower priority thread. Thus sleep
> +	 * would give fair chance to all other threads to
> +	 * acquire the usb hub mutex.
> +	 */
> +	msleep(25);

What normal code path did you just slow down here?  Why not slow down
the disconnect path instead of the connect path?

thanks,

greg k-h
