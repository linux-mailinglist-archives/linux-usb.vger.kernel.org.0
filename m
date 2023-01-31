Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B33FC6839B9
	for <lists+linux-usb@lfdr.de>; Tue, 31 Jan 2023 23:55:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230303AbjAaWzE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 Jan 2023 17:55:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232120AbjAaWy5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 Jan 2023 17:54:57 -0500
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A873753558;
        Tue, 31 Jan 2023 14:54:47 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 32C8F2F4;
        Tue, 31 Jan 2023 14:55:29 -0800 (PST)
Received: from slackpad.lan (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B82343F71E;
        Tue, 31 Jan 2023 14:54:44 -0800 (PST)
Date:   Tue, 31 Jan 2023 22:52:53 +0000
From:   Andre Przywara <andre.przywara@arm.com>
To:     Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Icenowy Zheng <uwu@icenowy.me>, devicetree@vger.kernel.org,
        soc@kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v5 02/11] usb: musb: sunxi: add support for the F1C100s
 MUSB controller
Message-ID: <20230131225253.04369efc@slackpad.lan>
In-Reply-To: <20230111015332.172021-3-andre.przywara@arm.com>
References: <20230111015332.172021-1-andre.przywara@arm.com>
        <20230111015332.172021-3-andre.przywara@arm.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 11 Jan 2023 01:53:23 +0000
Andre Przywara <andre.przywara@arm.com> wrote:

Hi Bin, Greg,

> From: Icenowy Zheng <uwu@icenowy.me>
> 
> The suniv SoC has a MUSB controller like the one in A33, but with a SRAM
> region to be claimed.
> 
> Add support for it.

is there any chance you could take this patch (and the next one,
ideally) through your tree? And not sure if the binding patch (01/11)
should also go this way?
Patch 03/11 is a cleanup, so is somewhat optional, but Jernej acked
that recently.

The original series [1] is now almost three years old, and the whole
series was mostly ready in the previous cycle already, but got stuck
in some dependency chain, which should now be solved, since the PHY
patch series [2] made it into -next more than two weeks ago.

This would help to unblock the rest of this series, which are DT
patches only.

Many thanks, and let me know if there is something left for me to do.

Cheers,
Andre

[1]
https://patchwork.kernel.org/project/linux-usb/cover/20200309204326.27403-1-thirtythreeforty@gmail.com/
[2] https://lore.kernel.org/linux-arm-kernel/Y8BFwPZ0DRGImo5O@matsya/

> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/usb/musb/sunxi.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/musb/sunxi.c b/drivers/usb/musb/sunxi.c
> index 7f9a999cd5ff1..4b368d16a73ad 100644
> --- a/drivers/usb/musb/sunxi.c
> +++ b/drivers/usb/musb/sunxi.c
> @@ -722,14 +722,17 @@ static int sunxi_musb_probe(struct platform_device *pdev)
>  	INIT_WORK(&glue->work, sunxi_musb_work);
>  	glue->host_nb.notifier_call = sunxi_musb_host_notifier;
>  
> -	if (of_device_is_compatible(np, "allwinner,sun4i-a10-musb"))
> +	if (of_device_is_compatible(np, "allwinner,sun4i-a10-musb") ||
> +	    of_device_is_compatible(np, "allwinner,suniv-f1c100s-musb")) {
>  		set_bit(SUNXI_MUSB_FL_HAS_SRAM, &glue->flags);
> +	}
>  
>  	if (of_device_is_compatible(np, "allwinner,sun6i-a31-musb"))
>  		set_bit(SUNXI_MUSB_FL_HAS_RESET, &glue->flags);
>  
>  	if (of_device_is_compatible(np, "allwinner,sun8i-a33-musb") ||
> -	    of_device_is_compatible(np, "allwinner,sun8i-h3-musb")) {
> +	    of_device_is_compatible(np, "allwinner,sun8i-h3-musb") ||
> +	    of_device_is_compatible(np, "allwinner,suniv-f1c100s-musb")) {
>  		set_bit(SUNXI_MUSB_FL_HAS_RESET, &glue->flags);
>  		set_bit(SUNXI_MUSB_FL_NO_CONFIGDATA, &glue->flags);
>  	}
> @@ -815,6 +818,7 @@ static const struct of_device_id sunxi_musb_match[] = {
>  	{ .compatible = "allwinner,sun6i-a31-musb", },
>  	{ .compatible = "allwinner,sun8i-a33-musb", },
>  	{ .compatible = "allwinner,sun8i-h3-musb", },
> +	{ .compatible = "allwinner,suniv-f1c100s-musb", },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, sunxi_musb_match);

