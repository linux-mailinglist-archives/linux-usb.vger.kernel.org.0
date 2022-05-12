Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EB65524717
	for <lists+linux-usb@lfdr.de>; Thu, 12 May 2022 09:38:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351064AbiELHiX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 May 2022 03:38:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351091AbiELHiU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 May 2022 03:38:20 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 092F45C776;
        Thu, 12 May 2022 00:38:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0BD7AB826F8;
        Thu, 12 May 2022 07:38:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27CF9C385B8;
        Thu, 12 May 2022 07:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1652341088;
        bh=6wZHNd3Dwzsl3XeQvSPKHlk9BV48mA0w4uaiMM/qzUY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wG25XutNYJt8V/a7PqpdejLfX227ATdfzwdmSABzI3fIeMo2AVay7c/NXsz7YocQB
         qPNFM5hDb+5/X/ZaVI/G56+KuWnrBg6Cpnad7PbJ/LyHmhJ6PZL8bUZVEjheiXnAx2
         8ajn6yBqNXsFK+GHaV0lt6tNO5C2C61MzkwR2pZY=
Date:   Thu, 12 May 2022 09:38:06 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Guan Jing <guanjing6@huawei.com>
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next v2] usb: dwc3: include extcon.h to fix compile error
Message-ID: <Yny5Xm+rNkR5bnjJ@kroah.com>
References: <20220511022622.168486-1-guanjing6@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220511022622.168486-1-guanjing6@huawei.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 11, 2022 at 10:26:22AM +0800, Guan Jing wrote:
> If dwc3 is not include extcon.h, the dwc3 driver
> will fail to link:
> 
> drivers/usb/dwc3/core.o: In function `dwc3_probe':
> core.c:(.text+0x1095): undefined reference to `extcon_get_edev_by_phandle'
> core.c:(.text+0x10bd): undefined reference to `extcon_get_extcon_dev'
> 
> Add miss #include <linux/extcon.h> to fix this error.
> 
> Fixes: 0f0101719138 ("usb: dwc3: Don't switch OTG -> peripheral if extcon is present")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Guan Jing <guanjing6@huawei.com>
> ---
>  drivers/usb/dwc3/core.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 950e238c65bf..e619a3ef6c46 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -28,6 +28,7 @@
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/reset.h>
>  #include <linux/bitfield.h>
> +#include <linux/extcon.h>
>  
>  #include <linux/usb/ch9.h>
>  #include <linux/usb/gadget.h>
> -- 
> 2.17.1
> 

As Jack said, this will not fix a linker error.  I think something else
is wrong with your system as your .config file builds just fine for me.

greg k-h
