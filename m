Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3683D3A0EB8
	for <lists+linux-usb@lfdr.de>; Wed,  9 Jun 2021 10:28:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237165AbhFII34 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Jun 2021 04:29:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:36388 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232333AbhFII3z (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 9 Jun 2021 04:29:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 607E361042;
        Wed,  9 Jun 2021 08:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1623227270;
        bh=mU+6m94m+AMm1pYeUgG2BY0KQAanw0ZzBPDVxTz7XZI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pZusCf0w/HrLmNN2pNl9z96u4oMNQMAWgpv8CDmoSg7bWj1qA6RjNrkjk/st4Hu+a
         RLXVhRf1KQfbuY3zwoMflCyQmESfEyaMVzx7/DIjjTfN21lGn9XefcGJuRNCzg5Tkq
         bnpXO/RqRbJZyZeWop4NCmHsFi73wn+vRvl+C+hA=
Date:   Wed, 9 Jun 2021 10:27:48 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Maciej =?utf-8?Q?=C5=BBenczykowski?= <zenczykowski@gmail.com>
Cc:     Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>,
        Brooke Basile <brookebasile@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Lorenzo Colitti <lorenzo@google.com>
Subject: Re: [PATCH] usb: f_ncm: only first packet of aggregate needs to
 start timer
Message-ID: <YMB7hD2fLwlHY4/t@kroah.com>
References: <20210608085438.813960-1-zenczykowski@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210608085438.813960-1-zenczykowski@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 08, 2021 at 01:54:38AM -0700, Maciej Żenczykowski wrote:
> From: Maciej Żenczykowski <maze@google.com>
> 
> The reasoning for this change is that if we already had
> a packet pending, then we also already had a pending timer,
> and as such there is no need to reschedule it.
> 
> This also prevents packets getting delayed 60 ms worst case
> under a tiny packet every 290us transmit load, by keeping the
> timeout always relative to the first queued up packet.
> (300us delay * 16KB max aggregation / 80 byte packet =~ 60 ms)
> 
> As such the first packet is now at most delayed by 300us.
> 
> Under low transmit load, this will simply result in us sending
> a shorter aggregate, as originally intended.
> 
> This patch has the benefit of greatly reducing (by ~10 factor
> with 1500 byte frames aggregated into 16 kiB) the number of
> (potentially pretty costly) updates to the hrtimer.
> 
> Cc: Brooke Basile <brookebasile@gmail.com>
> Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Cc: Felipe Balbi <balbi@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Lorenzo Colitti <lorenzo@google.com>
> Signed-off-by: Maciej Żenczykowski <maze@google.com>
> ---
>  drivers/usb/gadget/function/f_ncm.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/function/f_ncm.c
> index 0d23c6c11a13..855127249f24 100644
> --- a/drivers/usb/gadget/function/f_ncm.c
> +++ b/drivers/usb/gadget/function/f_ncm.c
> @@ -1101,11 +1101,11 @@ static struct sk_buff *ncm_wrap_ntb(struct gether *port,
>  			ncm->ndp_dgram_count = 1;
>  
>  			/* Note: we skip opts->next_ndp_index */
> -		}
>  
> -		/* Delay the timer. */
> -		hrtimer_start(&ncm->task_timer, TX_TIMEOUT_NSECS,
> -			      HRTIMER_MODE_REL_SOFT);
> +			/* Start the timer. */
> +			hrtimer_start(&ncm->task_timer, TX_TIMEOUT_NSECS,
> +				      HRTIMER_MODE_REL_SOFT);
> +		}
>  
>  		/* Add the datagram position entries */
>  		ntb_ndp = skb_put_zero(ncm->skb_tx_ndp, dgram_idx_len);

Nice, hopefully this helps out a lot on the systems where re-arming
timers are slow.

greg k-h
