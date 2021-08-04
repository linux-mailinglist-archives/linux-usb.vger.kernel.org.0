Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 902733DF94F
	for <lists+linux-usb@lfdr.de>; Wed,  4 Aug 2021 03:38:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233811AbhHDBiZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Aug 2021 21:38:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:41654 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233389AbhHDBiZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 3 Aug 2021 21:38:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5A38B60F43;
        Wed,  4 Aug 2021 01:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628041093;
        bh=bk+spCsV4AgC1emyrz5YNXIRikPuxzecGwY4jsyB5y8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OTgRclDdCe9kNNC/9ldoL/1fzXVofXEaikXmpBmjZaOP7Ok59ROE18ZnBsVcjv2tN
         XFKCfoJHzmedCSORJnKChaveejcClE5fv6rLdCGFkv4PhbcAWliTHn+oAwevaIXM+W
         wIlf+4XwGqhPKbHZ1taEl4OT0hPonSsxpRgCVONDoSeKMyuAOVJXyFF97neZ8zSwNR
         5VYcYcqb/8GPIgXI1zz49VP3AZp8FDPsOCW8GGuPBnMF13X0CXYaoO1geTNrEY/Elp
         4eQXng7qrlu4Xey1cg2SMSsS6IegPkw3YZTQVCupcN0IVnaYXJJ437Xrn1H8H40jC4
         L+j3nWFJPD3tw==
Date:   Wed, 4 Aug 2021 09:38:09 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Salah Triki <salah.triki@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: chipidea: get lock before calling
 usb_[disable|enable]_autosuspend()
Message-ID: <20210804013809.GA16676@nchen>
References: <20210802215212.GA1350820@pc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210802215212.GA1350820@pc>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 21-08-02 22:52:12, Salah Triki wrote:
> Based on the documentation of usb_[disable|enable]_autosuspend(), the
> caller must hold udev's device lock.
> 
> Signed-off-by: Salah Triki <salah.triki@gmail.com>
> ---
>  drivers/usb/chipidea/otg_fsm.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/chipidea/otg_fsm.c b/drivers/usb/chipidea/otg_fsm.c
> index 6ed4b00dba96..2d4174250432 100644
> --- a/drivers/usb/chipidea/otg_fsm.c
> +++ b/drivers/usb/chipidea/otg_fsm.c
> @@ -518,12 +518,14 @@ static void ci_otg_loc_sof(struct otg_fsm *fsm, int on)
>  	if (!udev)
>  		return;
>  
> +	usb_lock_device(udev);
>  	if (on) {
>  		usb_disable_autosuspend(udev);
>  	} else {
>  		pm_runtime_set_autosuspend_delay(&udev->dev, 0);
>  		usb_enable_autosuspend(udev);
>  	}
> +	usb_unlock_device(udev);
>  }
>  

Acked-by: Peter Chen <peter.chen@kernel.org>

-- 

Thanks,
Peter Chen

