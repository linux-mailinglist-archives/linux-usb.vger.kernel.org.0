Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0617D3962E9
	for <lists+linux-usb@lfdr.de>; Mon, 31 May 2021 17:01:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234393AbhEaPCk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 May 2021 11:02:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:51026 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234149AbhEaPAj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 31 May 2021 11:00:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4606160FE8;
        Mon, 31 May 2021 14:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1622472599;
        bh=US+o5yakSgDlDIXjsQOdUyCsJpd2NsknS55Beb7nDB0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EBH3SLaGjAsS/uNvM8nMg0GjOqiCbu1e6Tn8nblqn1hd5b15rRvs0c3T++x0572Xl
         Auj+z9TgIef4SBNH5l5n2UzYLa2umQN92o7lbeLyjWbUlEe8x0G+kYTJaOkmbmbISH
         sCYngV6C/+WkO2/yyItS85P9miaMSohH32QXlUA8=
Date:   Mon, 31 May 2021 16:49:56 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        USB <linux-usb@vger.kernel.org>, Ferry Toth <fntoth@gmail.com>,
        Wesley Cheng <wcheng@codeaurora.org>
Subject: Re: v5.13-rc3 --> v5.13-rc4 DWC3 breakage
Message-ID: <YLT3lHWFimB3GiHy@kroah.com>
References: <CAHp75Vc1BHSOfzUg2a1EEV_hNQK_MNNnVKA4wG_tWAWgTmnE9w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vc1BHSOfzUg2a1EEV_hNQK_MNNnVKA4wG_tWAWgTmnE9w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 31, 2021 at 05:33:02PM +0300, Andy Shevchenko wrote:
> Hi!
> 
> The only patch that made v5.13-rc4 effectively broke USB on Intel Merrifield.
> 
> My reproducer:
>  1. Boot with switch in gadget mode
>  2. Enable USB ethernet
>  3. Switch to host
>  4. wait a bit for device enumeration, etc
>  5. Switch back
>  6. No gadget mode, kernel RCU stall detected (USB become unusable, so
> does the system)
> 
> [  115.792620] rcu: INFO: rcu_sched self-detected stall on CPU
> [  115.798410] rcu:     0-....: (24089 ticks this GP)
> idle=886/1/0x4000000000000000 softirq=3796/3797 fqs=5240
> [  115.808333]  (t=21000 jiffies g=6505 q=12158)
> [  115.812847] NMI backtrace for cpu 0
> [  115.816472] CPU: 0 PID: 23 Comm: kworker/0:1 Not tainted 5.13.0-rc4+ #213
> ...
> 
> [  115.977913]  add_dma_entry+0xd4/0x1d0
> [  115.981760]  dma_map_page_attrs+0xd8/0x220
> [  115.986063]  usb_hcd_map_urb_for_dma+0x3b6/0x4f0
> [  115.990895]  usb_hcd_submit_urb+0x98/0xbf0
> [  115.995263]  dln2_rx+0x1ae/0x280 [dln2]
> ...
> 
> 100% Reproducibility, revert of the 25dda9fc56bd ("usb: dwc3: gadget:
> Properly track pending and queued SG") fixes the issue.
> 
> Please, fix it properly or revert. Thanks!

Care to send the revert?

thanks,

greg k-h
