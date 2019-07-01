Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A12DA57FC0
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jun 2019 11:56:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726375AbfF0J4I convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Thu, 27 Jun 2019 05:56:08 -0400
Received: from unicorn.mansr.com ([81.2.72.234]:53204 "EHLO unicorn.mansr.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726292AbfF0J4H (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 27 Jun 2019 05:56:07 -0400
Received: by unicorn.mansr.com (Postfix, from userid 51770)
        id ECF0715393; Thu, 27 Jun 2019 10:56:05 +0100 (BST)
From:   =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
To:     Bin Liu <b-liu@ti.com>, Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: musb: sunxi: propagate devicetree node to glue pdev
References: <20190228112031.8122-1-mans@mansr.com>
Date:   Thu, 27 Jun 2019 10:56:05 +0100
In-Reply-To: <20190228112031.8122-1-mans@mansr.com> (Mans Rullgard's message
        of "Thu, 28 Feb 2019 11:20:31 +0000")
Message-ID: <yw1x1rzfic7e.fsf@mansr.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Mans Rullgard <mans@mansr.com> writes:

> In order for devicetree nodes to be correctly associated with attached
> devices, the controller node needs to be propagated to the glue device.
>
> Signed-off-by: Mans Rullgard <mans@mansr.com>
> ---
> This depends on 2c1ea6abde88 ("platform: set of_node in
> platform_device_register_full()") which is currently winding its way
> through the staging trees.

That patch is in v5.1, so this one can go ahead now.  Assuming there are
no objections, of course.

> ---
>  drivers/usb/musb/sunxi.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/usb/musb/sunxi.c b/drivers/usb/musb/sunxi.c
> index 832a41f9ee7d..a72665fbf111 100644
> --- a/drivers/usb/musb/sunxi.c
> +++ b/drivers/usb/musb/sunxi.c
> @@ -781,6 +781,8 @@ static int sunxi_musb_probe(struct platform_device *pdev)
>  	pinfo.name	 = "musb-hdrc";
>  	pinfo.id	= PLATFORM_DEVID_AUTO;
>  	pinfo.parent	= &pdev->dev;
> +	pinfo.fwnode	= of_fwnode_handle(pdev->dev.of_node);
> +	pinfo.of_node_reused = true;
>  	pinfo.res	= pdev->resource;
>  	pinfo.num_res	= pdev->num_resources;
>  	pinfo.data	= &pdata;
> -- 
> 2.20.1
>

-- 
M�ns Rullg�rd
