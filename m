Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79E27558F42
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jun 2022 05:46:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230018AbiFXDp5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jun 2022 23:45:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229715AbiFXDpz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Jun 2022 23:45:55 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3878A38DAD
        for <linux-usb@vger.kernel.org>; Thu, 23 Jun 2022 20:45:54 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4LTjhG6JmXz4xLT;
        Fri, 24 Jun 2022 13:45:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
        s=201909; t=1656042352;
        bh=jsJtu4Y1FevocKQtZ83HwdxQgj/3jIDOnuOhO6d0A4M=;
        h=From:To:Subject:In-Reply-To:References:Date:From;
        b=efnQomoyNOVf34yD78w1/H3qBpxmMJeipKtJDM7625+CP6zoTc2kgIZUGyOkgENgF
         0NvJgzlPYw2EoP2iYyHNZUVgG08H1hJuhK95SEit2+V07ydUnAybDeCvJTyuNnw0gq
         US7luJgCk49BhYyV+t2kaZRQ+A0omPxe7t2+d2rLgRA2+TYJGKbuGQaRxZEBp3uJXz
         6pcJRuKc9esYHn4X/JpfXx8Mo2VkbovKon/sAkogB4/Dmjs49RWjh4ry9DiPLz+U+n
         a4nLYpKJiMIzEJlOYx0fY1GS12R5qoAk6D2K4jyQ7KYLll+LARldyy+uPM8W2fu2nr
         SJ3607SLzosOQ==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Darren Stevens <darren@stevens-zone.net>,
        linuxppc-dev@lists.ozlabs.org, oss@buserror.net,
        chzigotzky@xenosoft.de, robh@kernel.org, stern@rowland.harvard.edu,
        linux-usb@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
        Li Yang <leoyang.li@nxp.com>
Subject: Re: [PATCH RFC] drivers/usb/ehci-fsl: Fix interrupt setup in host
 mode.
In-Reply-To: <20220621230941.381f9791@Cyrus.lan>
References: <20220621230941.381f9791@Cyrus.lan>
Date:   Fri, 24 Jun 2022 13:45:44 +1000
Message-ID: <874k0a67x3.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Darren Stevens <darren@stevens-zone.net> writes:
> In patch a1a2b7125e1079 (Drop static setup of IRQ resource from DT
> core) we stopped platform_get_resource() from returning the IRQ, as all
> drivers were supposed to have switched to platform_get_irq()
> Unfortunately the Freescale EHCI driver in host mode got missed. Fix
> it. Also fix allocation of resources to work with current kernel.
>
> Fixes:a1a2b7125e1079 (Drop static setup of IRQ resource from DT core)
> Reported-by Christian Zigotzky <chzigotzky@xenosoft.de>
> Signed-off-by Darren Stevens <darren@stevens-zone.net>
> ---
> Tested on AmigaOne X5000/20 and X5000/40 not sure if this is entirely
> correct fix though. Contains code by Rob Herring (in fsl-mph-dr-of.c)

It looks like this driver is used on some arm/arm64 boards:

  $ git grep -l fsl-usb2-dr arch/arm*/boot/dts
  arch/arm/boot/dts/ls1021a.dtsi
  arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi

Which is for the "Layerscape-1012A family SoC".

Have we heard of any bug reports from users of those boards? Is it wired
up differently or otherwise immune to the problem?

I've added the Layerscape maintainers to Cc.

cheers

> diff --git a/drivers/usb/host/fsl-mph-dr-of.c
> b/drivers/usb/host/fsl-mph-dr-of.c index 44a7e58..766e4ab 100644
> --- a/drivers/usb/host/fsl-mph-dr-of.c
> +++ b/drivers/usb/host/fsl-mph-dr-of.c
> @@ -80,8 +80,6 @@ static struct platform_device
> *fsl_usb2_device_register( const char *name, int id)
>  {
>  	struct platform_device *pdev;
> -	const struct resource *res = ofdev->resource;
> -	unsigned int num = ofdev->num_resources;
>  	int retval;
>  
>  	pdev = platform_device_alloc(name, id);
> @@ -106,11 +104,8 @@ static struct platform_device
> *fsl_usb2_device_register( if (retval)
>  		goto error;
>  
> -	if (num) {
> -		retval = platform_device_add_resources(pdev, res, num);
> -		if (retval)
> -			goto error;
> -	}
> +	pdev->dev.of_node = ofdev->dev.of_node;
> +	pdev->dev.of_node_reused = true;
>  
>  	retval = platform_device_add(pdev);
>  	if (retval)
