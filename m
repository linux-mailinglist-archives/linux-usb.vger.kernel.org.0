Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A9D477E417
	for <lists+linux-usb@lfdr.de>; Wed, 16 Aug 2023 16:47:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244912AbjHPOqp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Aug 2023 10:46:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343935AbjHPOqo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Aug 2023 10:46:44 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E8D72716
        for <linux-usb@vger.kernel.org>; Wed, 16 Aug 2023 07:46:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AFE086293E
        for <linux-usb@vger.kernel.org>; Wed, 16 Aug 2023 14:46:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6125C433C7;
        Wed, 16 Aug 2023 14:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1692197202;
        bh=VxUkfn8qdKK37TRhUdT+d+5Bj0Ur96K9UVSTRMjT6tM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ftkuN4G8oElV3NMKx2f0c3ziige0YDWEx2CbSibjc0QEGudguLf3twEGDKo9r0DLG
         WiCwvdKr271FsHkGtLx7IDvYtXLsvFfjZqSy4uInlXWMLg7z6LBacSv44LejO/ztRD
         xVd9LRaTiuYj6Ic9aYnXW1XG7qiCSYlOn5wrjbz4=
Date:   Wed, 16 Aug 2023 16:46:39 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Ruan Jinjie <ruanjinjie@huawei.com>
Cc:     linux-usb@vger.kernel.org, Olav Kongas <ok@artecdesign.ee>
Subject: Re: [PATCH -next] usb: isp116x-hcd: Remove unnecessary check of res
Message-ID: <2023081659-bakery-ladybug-1a35@gregkh>
References: <20230816073432.221665-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230816073432.221665-1-ruanjinjie@huawei.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 16, 2023 at 03:34:32PM +0800, Ruan Jinjie wrote:
> The resource is checked in probe function, so there is
> no need do this check in remove function.
> 
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
> ---
>  drivers/usb/host/isp116x-hcd.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/host/isp116x-hcd.c b/drivers/usb/host/isp116x-hcd.c
> index a82d8926e922..c95a9b004412 100644
> --- a/drivers/usb/host/isp116x-hcd.c
> +++ b/drivers/usb/host/isp116x-hcd.c
> @@ -1540,12 +1540,10 @@ static void isp116x_remove(struct platform_device *pdev)
>  
>  	iounmap(isp116x->data_reg);
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> -	if (res)
> -		release_mem_region(res->start, 2);
> +	release_mem_region(res->start, 2);
>  	iounmap(isp116x->addr_reg);
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (res)
> -		release_mem_region(res->start, 2);
> +	release_mem_region(res->start, 2);

Perhaps, but now you will get in a fight with the "auto fix tools" that
will notice that those functions can fail, so the return value must be
checked.

So you are in an argument you can't win, let's just leave these as-is to
keep the static-tool-checkers happy.  It's on a remove path, it doesn't
really matter.

thanks,

greg k-h
