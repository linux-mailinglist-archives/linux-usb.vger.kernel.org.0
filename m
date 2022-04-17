Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3638A5045D5
	for <lists+linux-usb@lfdr.de>; Sun, 17 Apr 2022 02:44:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232132AbiDQAql (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 16 Apr 2022 20:46:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232059AbiDQAqj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 16 Apr 2022 20:46:39 -0400
X-Greylist: delayed 463 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 16 Apr 2022 17:44:05 PDT
Received: from relay.hostedemail.com (relay.a.hostedemail.com [64.99.140.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1BE92A739
        for <linux-usb@vger.kernel.org>; Sat, 16 Apr 2022 17:44:05 -0700 (PDT)
Received: from omf11.hostedemail.com (a10.router.float.18 [10.200.18.1])
        by unirelay09.hostedemail.com (Postfix) with ESMTP id BC1D923E29;
        Sun, 17 Apr 2022 00:36:20 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf11.hostedemail.com (Postfix) with ESMTPA id 951B12002D;
        Sun, 17 Apr 2022 00:36:18 +0000 (UTC)
Message-ID: <817a2890f5483e9a4b51ff6cc3eaab966e4f0537.camel@perches.com>
Subject: Re: [PATCH] usb: gadget: tegra-xudc: clean up comments
From:   Joe Perches <joe@perches.com>
To:     Tom Rix <trix@redhat.com>, balbi@kernel.org,
        gregkh@linuxfoundation.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com, waynec@nvidia.com,
        rikard.falkeborn@gmail.com, zhangqilong3@huawei.com,
        jakobkoschel@gmail.com
Cc:     linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Sat, 16 Apr 2022 17:36:17 -0700
In-Reply-To: <20220416223921.2881719-1-trix@redhat.com>
References: <20220416223921.2881719-1-trix@redhat.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=no autolearn_force=no
        version=3.4.6
X-Stat-Signature: wuornyiqc99zd7iwgpzr4a7oge57cej1
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: 951B12002D
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18BKswQqLwj8nM6sM5bfVkhWxaiS5zBNx0=
X-HE-Tag: 1650155778-741580
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, 2022-04-16 at 18:39 -0400, Tom Rix wrote:
> Spelling replacements
> cancelled to canceled

cancelled is a generally accepted variant.

https://www.dictionary.com/browse/cancelled

> endpiont to endpoint

ok.

> Compliance to Compliance

huh?  a == a


> 
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/usb/gadget/udc/tegra-xudc.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
> index d9c406bdb680..0aaf01e1551f 100644
> --- a/drivers/usb/gadget/udc/tegra-xudc.c
> +++ b/drivers/usb/gadget/udc/tegra-xudc.c
> @@ -1330,7 +1330,7 @@ static void squeeze_transfer_ring(struct tegra_xudc_ep *ep,
>  	bool pcs;
>  
>  	/*
> -	 * Clear out all the TRBs part of or after the cancelled request,
> +	 * Clear out all the TRBs part of or after the canceled request,
>  	 * and must correct trb cycle bit to the last un-enqueued state.
>  	 */
>  	while (trb != &ep->transfer_ring[ep->enq_ptr]) {
> @@ -1343,11 +1343,11 @@ static void squeeze_transfer_ring(struct tegra_xudc_ep *ep,
>  			trb = ep->transfer_ring;
>  	}
>  
> -	/* Requests will be re-queued at the start of the cancelled request. */
> +	/* Requests will be re-queued at the start of the canceled request. */
>  	ep->enq_ptr = req->first_trb - ep->transfer_ring;
>  	/*
>  	 * Retrieve the correct cycle bit state from the first trb of
> -	 * the cancelled request.
> +	 * the canceled request.
>  	 */
>  	ep->pcs = pcs_enq;
>  	ep->ring_full = false;
> @@ -1434,7 +1434,7 @@ __tegra_xudc_ep_dequeue(struct tegra_xudc_ep *ep,
>  		return 0;
>  	}
>  
> -	/* Halt DMA for this endpiont. */
> +	/* Halt DMA for this endpoint. */
>  	if (ep_ctx_read_state(ep->context) == EP_STATE_RUNNING) {
>  		ep_pause(xudc, ep->index);
>  		ep_wait_for_inactive(xudc, ep->index);
> @@ -3423,7 +3423,7 @@ static void tegra_xudc_device_params_init(struct tegra_xudc *xudc)
>  	}
>  
>  	/*
> -	 * Compliacne suite appears to be violating polling LFPS tBurst max
> +	 * Compliance suite appears to be violating polling LFPS tBurst max
>  	 * of 1.4us.  Send 1.45us instead.
>  	 */
>  	val = xudc_readl(xudc, SSPX_CORE_CNT32);


