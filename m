Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 322D9567311
	for <lists+linux-usb@lfdr.de>; Tue,  5 Jul 2022 17:47:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232357AbiGEPrN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Jul 2022 11:47:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232374AbiGEPqz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Jul 2022 11:46:55 -0400
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2CDB1A382
        for <linux-usb@vger.kernel.org>; Tue,  5 Jul 2022 08:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1657035636;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=tsHhud5sfQVz9Np8da35W2zVQWtwjMLPWbpgLRPf9Sc=;
    b=jNn+5tgwv2Mwz2d7c/+ymHOlS5zOTOE5jgBBL36leTJZgzdNUHD8DaIT1f7vYyVKxA
    WKINEFN0bQEB4yZc9/ZpcurIKQv7HtauvZXp85y1LSjJdUMCBgkbY7zL9FK4RDDYHRMW
    tIiAtDz4ruj4iKNRhsYQuqWfp+7CNt1l0KVi8o1uiNbFSd8dxWwxwdmjXsoRbmuBz6sK
    AYaJCjGeT1N5f0WrMfCXKuZyrUoKvR3zgLHqGV8sAFiHFi5DvbX3qIFegnOso7s4DgyM
    +hGAFky15Su1DIa8Vbu8bCD/1+3whQqLXitpA5ddM9CcfLH98JW8veD7jAmMrXY5MOVL
    E8tA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBfio0GngadwjW4dqgkobcHPYDc/BNBepImPPJ"
X-RZG-CLASS-ID: mo00
Received: from [IPV6:2a02:8109:8980:4474:3840:b132:e6ea:146]
    by smtp.strato.de (RZmta 47.46.1 AUTH)
    with ESMTPSA id icdf6dy65FeYK21
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Tue, 5 Jul 2022 17:40:34 +0200 (CEST)
Message-ID: <cee04f80-9131-5ab3-7382-50cb5a01fd08@xenosoft.de>
Date:   Tue, 5 Jul 2022 17:40:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v3] drivers/usb/host/ehci-fsl: Fix interrupt setup in host
 mode.
Content-Language: de-DE
To:     Darren Stevens <darren@stevens-zone.net>,
        linuxppc-dev@lists.ozlabs.org, oss@buserror.net, robh@kernel.org,
        stern@rowland.harvard.edu, linux-usb@vger.kernel.org
Cc:     shawnguo@kernel.org, leoyang.li@nxp.com,
        "R.T.Dickinson" <rtd2@xtra.co.nz>,
        mad skateman <madskateman@gmail.com>,
        Christian Zigotzky <info@xenosoft.de>
References: <20220702220355.63b36fb8@Cyrus.lan>
From:   Christian Zigotzky <chzigotzky@xenosoft.de>
In-Reply-To: <20220702220355.63b36fb8@Cyrus.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 02 July 2022 at 11:03 pm, Darren Stevens wrote:
> In patch a1a2b7125e10 (Drop static setup of IRQ resource from DT
> core) we stopped platform_get_resource() from returning the IRQ, as all
> drivers were supposed to have switched to platform_get_irq()
> Unfortunately the Freescale EHCI driver in host mode got missed. Fix
> it.
>
> Fixes: a1a2b7125e10 (Drop static setup of IRQ resource from DT core)
> Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Darren Stevens <darren@stevens-zone.net>
> ---
>   v3 - Corrected resource allocation in fsl-mph-dr-of.c
>
>   v2 - Fixed coding style, removed a couple of unneeded initializations,
>        cc'd Layerscape maintainers.
>
> Tested on AmigaOne X5000/20 and X5000/40 Contains code by Rob Herring
> (in fsl-mph-dr-of.c)
>
> diff --git a/drivers/usb/host/ehci-fsl.c b/drivers/usb/host/ehci-fsl.c
> index 385be30..896c0d1 100644
> --- a/drivers/usb/host/ehci-fsl.c
> +++ b/drivers/usb/host/ehci-fsl.c
> @@ -76,14 +76,9 @@ static int fsl_ehci_drv_probe(struct platform_device *pdev)
>   		return -ENODEV;
>   	}
>   
> -	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> -	if (!res) {
> -		dev_err(&pdev->dev,
> -			"Found HC with no IRQ. Check %s setup!\n",
> -			dev_name(&pdev->dev));
> -		return -ENODEV;
> -	}
> -	irq = res->start;
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
>   
>   	hcd = __usb_create_hcd(&fsl_ehci_hc_driver, pdev->dev.parent,
>   			       &pdev->dev, dev_name(&pdev->dev), NULL);
> diff --git a/drivers/usb/host/fsl-mph-dr-of.c b/drivers/usb/host/fsl-mph-dr-of.c
> index 44a7e58..e5df175 100644
> --- a/drivers/usb/host/fsl-mph-dr-of.c
> +++ b/drivers/usb/host/fsl-mph-dr-of.c
> @@ -112,6 +112,9 @@ static struct platform_device *fsl_usb2_device_register(
>   			goto error;
>   	}
>   
> +	pdev->dev.of_node = ofdev->dev.of_node;
> +	pdev->dev.of_node_reused = true;
> +
>   	retval = platform_device_add(pdev);
>   	if (retval)
>   		goto error;
Hello,

I patched the RC5 of kernel 5.19 with this patch and I can confirm, that 
my keyboard and mouse work without any problems.

Tested-by: Christian Zigotzky <chzigotzky@xenosoft.de>

Please accept this patch.

Thanks,
Christian
