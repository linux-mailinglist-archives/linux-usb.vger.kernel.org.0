Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47FD555B06B
	for <lists+linux-usb@lfdr.de>; Sun, 26 Jun 2022 10:51:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233269AbiFZItw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 26 Jun 2022 04:49:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbiFZItv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 26 Jun 2022 04:49:51 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C426B11455
        for <linux-usb@vger.kernel.org>; Sun, 26 Jun 2022 01:49:49 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id z13so11571216lfj.13
        for <linux-usb@vger.kernel.org>; Sun, 26 Jun 2022 01:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yEGDBxIrxLnZhZc+wkclIQTRrLXd7F46K6vXNtU2YDc=;
        b=LtVmvH0sEbW7l7lbVsQJUVz6qFVlvSIdjlWRhR6MDBzyRwCeecj0RK0ipdewP4yJ1H
         7mgcf1d5B8io8PMujQ6eU7b4DPW5oiuWfvQc37jby/FSbmOzemLaZLvQyp03ew6Ap+2W
         1c1f1HrcIEmaiYnW0HKwbNClAzIk1mXhMGaZ7SuCeaJG6boZKu2fNskWdHe7GBxPGyk6
         UlYWjb/FwL7S8mfD6YzQuEerjjft9hffZdEw+MOHVyUoG1KjcO0gjP2w8KbEmaTJ5NGb
         WqXOi74OaQDgRMUVuNo0xoCPhvCjJzAdtROdm6sAot2DpioRIurBLvcQIhip1I8ca3OJ
         eijw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yEGDBxIrxLnZhZc+wkclIQTRrLXd7F46K6vXNtU2YDc=;
        b=w8S0s713J1n6/VtTZAuzXhmgBm3PHll5noQT6Xsrj7xb98erIUSFdw8qK5f4VSJW39
         46BeeuEM6AKQRv687wp1rMy0fFiBl6uyDR2II8YvRnVjxptVnpyhjvd/0sS/NCNAmJio
         THr0F7Oynd6dBCo8i+g/tOH2cgPUeyZoHttIr9UA6lmhAYbKVshcHeGhvrlBrQWKauKx
         ILcGpE6zEFfe0ePIvbZ2csINMaAi6X+GOa75HBwSKeW5bIeMOAgvBdpKq8aoQpn6V6zS
         cDsziFPfIBSc/9ZdsIxRfksgKCv1tkMVdDW6su7UOIzdnLOMuswN+i/XhsgJzeQPl1LW
         t1TQ==
X-Gm-Message-State: AJIora+/XbSUe5vo5ehgFL+USoT3Ho2rXo6HKtt3KpPfqEAXH10FRSGZ
        huidh+ZCQ6Ko54i5p4mjNGs5sVv1qkA=
X-Google-Smtp-Source: AGRyM1vV+NgxcIUouLKwJqKqWew25IGPhu9Nm7WUJ8BJKaKrGf9eCzzh2qLf+oVaL/i611FO9BcMFA==
X-Received: by 2002:a05:6512:475:b0:47f:a44c:e481 with SMTP id x21-20020a056512047500b0047fa44ce481mr5180849lfd.670.1656233387984;
        Sun, 26 Jun 2022 01:49:47 -0700 (PDT)
Received: from [192.168.1.103] ([178.176.72.32])
        by smtp.gmail.com with ESMTPSA id r23-20020a2e8e37000000b0025a72ee37cdsm920370ljk.24.2022.06.26.01.49.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jun 2022 01:49:47 -0700 (PDT)
Subject: Re: [PATCH v2 RFC] drivers/usb/host/ehci-fsl: Fix interrupt setup in
 host mode.
To:     Darren Stevens <darren@stevens-zone.net>,
        linuxppc-dev@lists.ozlabs.org, oss@buserror.net,
        chzigotzky@xenosoft.de, robh@kernel.org, stern@rowland.harvard.edu,
        linux-usb@vger.kernel.org
Cc:     shawnguo@kernel.org, leoyang.li@nxp.com
References: <20220625214151.547b3570@Cyrus.lan>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <947e4583-fe0b-b8af-61b3-2d120357727c@gmail.com>
Date:   Sun, 26 Jun 2022 11:49:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220625214151.547b3570@Cyrus.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello!

On 6/25/22 11:41 PM, Darren Stevens wrote:

> In patch a1a2b7125e10 (Drop static setup of IRQ resource from DT
> core) we stopped platform_get_resource() from returning the IRQ, as all

In commit a1a2b7125e10 ("Drop static setup of IRQ resource from DT core")

> drivers were supposed to have switched to platform_get_irq()
> Unfortunately the Freescale EHCI driver in host mode got missed. Fix
> it. Also fix allocation of resources to work with current kernel.

   The basic rule (especially for the fixes) is "do one thing per patch".

> Fixes: a1a2b7125e10 (Drop static setup of IRQ resource from DT core)
> Reported-by Christian Zigotzky <chzigotzky@xenosoft.de>
> Signed-off-by Darren Stevens <darren@stevens-zone.net>
> ---
>  v2 - Fixed coding style, removed a couple of unneeded initializations,
>       cc'd Layerscape maintainers.
> 
> Tested on AmigaOne X5000/20 and X5000/40 not sure if this is entirely
> correct fix though. Contains code by Rob Herring (in fsl-mph-dr-of.c)
> 
> diff --git a/drivers/usb/host/ehci-fsl.c b/drivers/usb/host/ehci-fsl.c
> index 385be30..8bd258a 100644
> --- a/drivers/usb/host/ehci-fsl.c
> +++ b/drivers/usb/host/ehci-fsl.c
[...]
> @@ -92,15 +89,18 @@ static int fsl_ehci_drv_probe(struct platform_device *pdev)
>  		goto err1;
>  	}
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	hcd->regs = devm_ioremap_resource(&pdev->dev, res);
> +	tmp = of_address_to_resource(dn, 0, &res);

   Hm, why? What does this fix?

[...]

MBR, Sergey
