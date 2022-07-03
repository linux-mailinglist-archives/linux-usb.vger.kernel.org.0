Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C5B0564384
	for <lists+linux-usb@lfdr.de>; Sun,  3 Jul 2022 02:42:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229932AbiGCAmQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 2 Jul 2022 20:42:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229688AbiGCAmP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 2 Jul 2022 20:42:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21400AE51
        for <linux-usb@vger.kernel.org>; Sat,  2 Jul 2022 17:42:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A704661124
        for <linux-usb@vger.kernel.org>; Sun,  3 Jul 2022 00:42:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C391EC34114;
        Sun,  3 Jul 2022 00:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656808934;
        bh=gJNXkGKT7qhU8LZorTfijZuBWgXu9v+casaBQuTUCps=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=h6efNON1l/4q0RwIf5voz72edUeYogQiZ4BXWUeOVHSlN4ii2KxKYOHqxAaQqD9sz
         W6BCdJe71w4S8JmXEsDyHaFu6KkuCDfIJGpJB5dKALn/IEaDP8Mo4oxWo5VI+VFaIH
         4DeEch6i2XcyrZ0FBCIUMGXuruscgu6nKM9Pjjb3vheD5VQ6GwH6s5NNoiZCQujwaO
         MgSvOXNjYN/F7pI//V+e5U2att8DqhPBmssYqNOTWe6DDQ5zSB50bDXhCQAhDJLAQ6
         v1Ci3s+Z95bmaBSi9GhCiCJf94ewIax5+subZG1Tdsi0BjwVN4OJJIGd7tcjFKkwUE
         Xu206u6HzL/Bw==
Date:   Sun, 3 Jul 2022 08:42:09 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        jun.li@nxp.com, linux-imx@nxp.com
Subject: Re: [PATCH] usb: chipidea: udc: check request status before setting
 device address
Message-ID: <20220703004209.GB1382015@Peter>
References: <20220623030242.41796-1-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220623030242.41796-1-xu.yang_2@nxp.com>
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 22-06-23 11:02:42, Xu Yang wrote:
> The complete() function may be called even though request is not
> completed.

Would you please explain more when the complete() is called but the
request has not completed, and this happens before set_address has
finished?

Peter

> In this case, it's necessary to check request status so
> as not to set device address wrongly.
> 
> Fixes: 10775eb17bee ("usb: chipidea: udc: update gadget states according to ch9")
> cc: <stable@vger.kernel.org>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/chipidea/udc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> index 0c9ae9768a67..8c3e3a635ac2 100644
> --- a/drivers/usb/chipidea/udc.c
> +++ b/drivers/usb/chipidea/udc.c
> @@ -1048,6 +1048,9 @@ isr_setup_status_complete(struct usb_ep *ep, struct usb_request *req)
>  	struct ci_hdrc *ci = req->context;
>  	unsigned long flags;
>  
> +	if (req->status < 0)
> +		return;
> +
>  	if (ci->setaddr) {
>  		hw_usb_set_address(ci, ci->address);
>  		ci->setaddr = false;
> -- 
> 2.25.1
> 

-- 

Thanks,
Peter Chen

