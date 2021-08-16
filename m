Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F08943ECC26
	for <lists+linux-usb@lfdr.de>; Mon, 16 Aug 2021 02:52:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231716AbhHPAwl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 15 Aug 2021 20:52:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:39322 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230124AbhHPAwk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 15 Aug 2021 20:52:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 279A96139E;
        Mon, 16 Aug 2021 00:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629075130;
        bh=4DcMgK4QtX6xHGQbPUKyem0LDSENx5OBLXXgWyoCoZs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MDiD10PPdtrYWyBRG7wjMGhtXZx0mwC2P6KAK32vLfazzawk6sPHLISlTAuMKq+vD
         Xr+RdfX4O4SvLT3PaA8m9fe66e/F7QacyaaNi9JHpbe1jzg0VszKe5IMG/dar89NN1
         FNmXwpS6erlUAXm1nmvSt6KSri1VBp6k9NelnJPhU1QAeiwQkEEL8pFPf2ZD8iR3mC
         SrDn/wP9K3bB0WHjg4EGYIy3Nh+z8jBNzcvc5DLsDSSe29JuNylrGgpdcbAG20XWRw
         zJz10uS7R5ev+u39pAFphAHnskxlL148LYctk2IfuFFiv9zyt1QaG4GsOU6FTpLJGW
         +sQnasWypP73Q==
Date:   Mon, 16 Aug 2021 08:52:06 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Jeaho Hwang <jhhwang@rtst.co.kr>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: chipidea: fix RT issue for udc
Message-ID: <20210816005205.GA3907@nchen>
References: <20210810060228.GA3326442@ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210810060228.GA3326442@ubuntu>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 21-08-10 15:02:28, Jeaho Hwang wrote:
> hw_ep_prime sometimes fails if irq occurs while it rus on RT kernel.
> to prevent local_irq_save should keep the function from irqs.
> 
> I am not sure where is the best to submit this patch, between RT and USB
> community so sending to both. thanks.

Greg, do you have any suggestions about it, the RT kernel schedules the interrupt
handler (top-half) out which causes the USB hardware atomic sequences are broken,
these hardware operations needs to be executed within limited time.

Peter
> 
> Signed-off-by: Jeaho Hwang <jhhwang@rtst.co.kr>
> ---
>  drivers/usb/chipidea/udc.c | 31 +++++++++++++++++++++++++------
>  1 file changed, 25 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> index 5f35cdd2cf1d..a90498f17cc4 100644
> --- a/drivers/usb/chipidea/udc.c
> +++ b/drivers/usb/chipidea/udc.c
> @@ -102,6 +102,9 @@ static int hw_ep_flush(struct ci_hdrc *ci, int num, int dir)
>  {
>  	int n = hw_ep_bit(num, dir);
>  
> +    /* From zynq-7000 TRM, It can take a long time
> +     * so irq disable is not a good option for RT
> +     */
>  	do {
>  		/* flush any pending transfer */
>  		hw_write(ci, OP_ENDPTFLUSH, ~0, BIT(n));
> @@ -190,22 +193,32 @@ static int hw_ep_get_halt(struct ci_hdrc *ci, int num, int dir)
>  static int hw_ep_prime(struct ci_hdrc *ci, int num, int dir, int is_ctrl)
>  {
>  	int n = hw_ep_bit(num, dir);
> +	unsigned long flags;
> +	int ret = 0;
>  
>  	/* Synchronize before ep prime */
>  	wmb();
>  
> -	if (is_ctrl && dir == RX && hw_read(ci, OP_ENDPTSETUPSTAT, BIT(num)))
> -		return -EAGAIN;
> +	/* irq affects this routine so irq should be disabled on RT.
> +	 * on standard kernel, irq is already disabled by callers.
> +	 */
> +	local_irq_save(flags);
> +	if (is_ctrl && dir == RX && hw_read(ci, OP_ENDPTSETUPSTAT, BIT(num))) {
> +		ret = -EAGAIN;
> +	goto out;
> +	}
>  
>  	hw_write(ci, OP_ENDPTPRIME, ~0, BIT(n));
>  
>  	while (hw_read(ci, OP_ENDPTPRIME, BIT(n)))
>  		cpu_relax();
>  	if (is_ctrl && dir == RX && hw_read(ci, OP_ENDPTSETUPSTAT, BIT(num)))
> -		return -EAGAIN;
> +		ret = -EAGAIN;
>  
> +out:
> +	local_irq_restore(flags);
>  	/* status shoult be tested according with manual but it doesn't work */
> -	return 0;
> +	return ret;
>  }
>  
>  /**
> -- 
> 2.25.1
> 

-- 

Thanks,
Peter Chen

