Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BF0159F33A
	for <lists+linux-usb@lfdr.de>; Wed, 24 Aug 2022 07:54:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234226AbiHXFyL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Aug 2022 01:54:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbiHXFyK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Aug 2022 01:54:10 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C8947C52F
        for <linux-usb@vger.kernel.org>; Tue, 23 Aug 2022 22:54:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 888BB6189F
        for <linux-usb@vger.kernel.org>; Wed, 24 Aug 2022 05:54:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8688DC433D6;
        Wed, 24 Aug 2022 05:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1661320444;
        bh=HDUT+qItTnfgEqbmMkdBQgpae62F7R5aAS1PEsOpEGk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Yq1asYLqJbZ8HguCA/uvTZeB6HnvDigMIK/pzyDinFHUuRylE/Ar/cYb5W26qv/qW
         zuoh6n5yaXKJ+5WBZmJOEU4HdxRw7ker33plbSxrxVuzu10+Bv18b8Dq7+vJEuyptg
         BAgNBWdEcJ2KwecaFZsiFuwKHJy9imD0nOa2BWoc=
Date:   Wed, 24 Aug 2022 07:54:02 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: function: rndis: limit # of RNDIS instances
 to 1000
Message-ID: <YwW8+hcJ9idgSbwl@kroah.com>
References: <a8180973-3ded-3644-585a-169589a37642@omp.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8180973-3ded-3644-585a-169589a37642@omp.ru>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 23, 2022 at 11:53:26PM +0300, Sergey Shtylyov wrote:
> As follows from #define NAME_TEMPLATE, the procfs code in the RNDIS driver
> expects the # of instances to be 3-digit decimal, while the driver calls
> ida_simple_get() passing 0 as the 'end' argument which results in actual
> max instance # of INT_MAX.  Limit the maximum # of RNDIS instances to 1000
> which is still a lot! :-)
> 
> Found by Linux Verification Center (linuxtesting.org) with the SVACE static
> analysis tool.
> 
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> 
> ---
> This patch is against the 'next' branch of Felipe Balbi's 'usb.git' repo...
> 
>  drivers/usb/gadget/function/rndis.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Index: usb/drivers/usb/gadget/function/rndis.c
> ===================================================================
> --- usb.orig/drivers/usb/gadget/function/rndis.c
> +++ usb/drivers/usb/gadget/function/rndis.c
> @@ -865,7 +865,7 @@ EXPORT_SYMBOL_GPL(rndis_msg_parser);
>  
>  static inline int rndis_get_nr(void)
>  {
> -	return ida_simple_get(&rndis_ida, 0, 0, GFP_KERNEL);
> +	return ida_simple_get(&rndis_ida, 0, 1000, GFP_KERNEL);

Why not just change the procfs code instead?  It's not like anyone
should ever be using this driver anyway.  We should delete it soon, it's
totally broken and insecure as noted in the past :(

thanks,

greg k-h
