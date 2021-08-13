Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66D5D3EB11A
	for <lists+linux-usb@lfdr.de>; Fri, 13 Aug 2021 09:09:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239230AbhHMHJD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Aug 2021 03:09:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:39758 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239066AbhHMHJD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 13 Aug 2021 03:09:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4D1206056B;
        Fri, 13 Aug 2021 07:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1628838516;
        bh=oxf8WCci7T2Q93zPv+Pr+fe3iqhk3sp9dL/qXHwI1LE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uq20cTfVrFkh1BR7ojbyedMD53cNFgcL6qlfzKFQ9FmiJeu2SdtESvpPeCisnQG5Y
         LP0IqD6292PC6HfMjNfp5jEKipHs+AY7XHiD0E/+9G6VwPcbg/y7+AMiPN/VJBQmuM
         oadgHAc74nhJmz7yrSbXsAqUaBM1VIqfHRhSmSDM=
Date:   Fri, 13 Aug 2021 09:08:34 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Jeaho Hwang <jhhwang@rtst.co.kr>
Cc:     Peter Chen <peter.chen@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: chipidea: fix RT issue for udc
Message-ID: <YRYacrx5XH05+x+N@kroah.com>
References: <20210810060228.GA3326442@ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210810060228.GA3326442@ubuntu>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 10, 2021 at 03:02:28PM +0900, Jeaho Hwang wrote:
> hw_ep_prime sometimes fails if irq occurs while it rus on RT kernel.
> to prevent local_irq_save should keep the function from irqs.
> 
> I am not sure where is the best to submit this patch, between RT and USB
> community so sending to both. thanks.
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

Please use checkpatch.pl when submitting patches :(
