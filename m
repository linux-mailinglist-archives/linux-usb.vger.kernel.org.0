Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 979C6748939
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jul 2023 18:28:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232767AbjGEQ2e (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Jul 2023 12:28:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231862AbjGEQ2e (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Jul 2023 12:28:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A3BB10EA
        for <linux-usb@vger.kernel.org>; Wed,  5 Jul 2023 09:28:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D3E6361607
        for <linux-usb@vger.kernel.org>; Wed,  5 Jul 2023 16:28:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAA53C433C7;
        Wed,  5 Jul 2023 16:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1688574512;
        bh=UekY+KrohU7z0srghdzHFLTFVOai6keIVhcjckbSOpo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=0rQGb6Ky6pOoGc4JQul6COr8/PotzL4Vw/HM7O2+gxHc23/YxhXe3wSgeepzlOX7O
         kL/X9ijaP7qhNF70H5EJd7oGIy7R6o5sMItTUgtIyj9yUrdiiLVnMyLJR4y4gToAFZ
         k75OSBvcXdv6TCp1UalcBouZqQmN8Y9uwVfNAXAA=
Date:   Wed, 5 Jul 2023 17:28:29 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Li Jun <jun.li@nxp.com>
Cc:     mathias.nyman@intel.com, linux-usb@vger.kernel.org,
        aisheng.dong@nxp.com
Subject: Re: [PATCH] usb: host: xhci: fix coverity checker
 CONSTANT_EXPRESSION_RESULT warning
Message-ID: <2023070525-underpass-brought-11be@gregkh>
References: <20230705105743.553052-1-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230705105743.553052-1-jun.li@nxp.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 05, 2023 at 06:57:43PM +0800, Li Jun wrote:
> CID 28889612: Operands don't affect result (CONSTANT_EXPRESSION_RESULT)
> result_independent_of_operands: urb->transfer_dma >> 16 >> 16 is 0
> regardless of the values of its operands. This occurs as an argument
> to a function call.

What does "CID BIGNUMBER" mean?

> So convert the dma address to be u64 when extract its upper 32 bits.
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>

What commit id does this fix?


> ---
>  drivers/usb/host/xhci-ring.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index 646ff125def5..847a1eadd17a 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -747,7 +747,7 @@ static int xhci_move_dequeue_past_td(struct xhci_hcd *xhci,
>  		trb_sct = SCT_FOR_TRB(SCT_PRI_TR);
>  	ret = queue_command(xhci, cmd,
>  		lower_32_bits(addr) | trb_sct | new_cycle,
> -		upper_32_bits(addr),
> +		upper_32_bits((u64) addr),

Is this really actually changing anything?

thanks,

greg k-h
