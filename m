Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8932E562D5F
	for <lists+linux-usb@lfdr.de>; Fri,  1 Jul 2022 10:03:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235928AbiGAIDO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 1 Jul 2022 04:03:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236230AbiGAIDF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 1 Jul 2022 04:03:05 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58E9070AC8
        for <linux-usb@vger.kernel.org>; Fri,  1 Jul 2022 01:03:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D8DA461749
        for <linux-usb@vger.kernel.org>; Fri,  1 Jul 2022 08:02:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAC9AC3411E;
        Fri,  1 Jul 2022 08:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1656662579;
        bh=dOZR+eKSQioAIE/ks0bLsrBJm1aWt3KIwlxJycUg2+M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=N54j+ocLU/7U4AYa8TjNBK7bSdwbqOLLzAPvbgbFgEOSYG6NQGkzAK7mAlWhLGmLW
         gn/fY0RH1hdLSEcpvMUhpopzwLVdRPaqilZeYQeRxziezc+Oz+ifyE3el5zj0O5M20
         uxyq9Rx/ZH+yvqb+RjFXyfWZwVnUbTlkfZFh33H4=
Date:   Fri, 1 Jul 2022 10:02:56 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] usb: dwc3: gadget: fix high-speed multiplier setting
Message-ID: <Yr6qMFCR4Dmr6oai@kroah.com>
References: <20220630140216.185919-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220630140216.185919-1-m.grzeschik@pengutronix.de>
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jun 30, 2022 at 04:02:16PM +0200, Michael Grzeschik wrote:
> For high-speed transfers the __dwc3_prepare_one_trb function is
> calculating the multiplier setting for the trb based on the length of
> the trb currently prepared. This assumption is wrong. For trbs with a
> sglist the length of the actual request has to be taken instead.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> ---
>  drivers/usb/dwc3/gadget.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index 8716bece107208..0fc3ecfaa48baf 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -1186,7 +1186,7 @@ static void __dwc3_prepare_one_trb(struct dwc3_ep *dep, struct dwc3_trb *trb,
>  		dma_addr_t dma, unsigned int length, unsigned int chain,
>  		unsigned int node, unsigned int stream_id,
>  		unsigned int short_not_ok, unsigned int no_interrupt,
> -		unsigned int is_last, bool must_interrupt)
> +		unsigned int is_last, bool must_interrupt, int req_length)

Why not put this right next to 'length'?

And wow, that's a crazy number of options for a function.  Why is this
even a separate function at all?  Why can't it just be in
dwc3_prepare_one_trb() as that's the only place this is called?

thanks,

greg k-h
