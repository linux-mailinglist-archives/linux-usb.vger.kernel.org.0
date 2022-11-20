Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC3E2631382
	for <lists+linux-usb@lfdr.de>; Sun, 20 Nov 2022 12:01:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229490AbiKTLB4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 20 Nov 2022 06:01:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbiKTLBx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 20 Nov 2022 06:01:53 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADFAC8FFB7
        for <linux-usb@vger.kernel.org>; Sun, 20 Nov 2022 03:01:52 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id w15-20020a17090a380f00b0021873113cb4so8473947pjb.0
        for <linux-usb@vger.kernel.org>; Sun, 20 Nov 2022 03:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5u+1l3xncFMNx9kW4m/v3DfGWE7xX2QmfZdWlEuwiyY=;
        b=qFVfUmy4+HtQsoZkTo+TiZ0qsVh5Jcr1o6GKvIOrgqX0TPu6E+1ygTPC4iNOrxnFll
         tztSIsbvrJmMilK0nyBOvU0R5iA3oR1OoxKi8I0bpRHC3Wd7yJU96iwSa9rApnvCj7Hx
         hWDdu1doEyDKVKTRsCouSXzoB4kO4E7nyBFjjxOw0cHU4oyRD0PQ85sLSEGOjsbYDqrq
         82imlyG/X+3wiB4tU8d04x81kS6GqOpRNF98cB88QINSMZTwOw+F5BT1ON0u1R8Dyoq9
         eblLM3Hu90BZWkXHLmZlYweszWQ6KFeLcdgsqXNGdt7DiA+uBNdXUwA27bO8q4iwXB65
         9mhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5u+1l3xncFMNx9kW4m/v3DfGWE7xX2QmfZdWlEuwiyY=;
        b=Pzgd9o2ZP9kdY+rPAqnPcEo7GQvC3jO71x2VFV7I/mrCTg2RJIkRiVo5a6tQOdD+EQ
         +6pfLc8mZ8TXju0HEpv97el14l38r2pEoxvGvzAKjSlot5twDSH5b6M5nFGdumgcMMUD
         mxKXexM0DdWK40/ZhxKybroyWeUfjIBX8QJiskDLQWUYjKtgrsSkS2l7lI3TxGJM/3ca
         PCfPZByiIMEaMLIuLHSfN3RNSDKQIiooeLrZd4ZFloDspMITSfMxiKfVrFK//PAs5tT5
         vo7rxXDwWbxc3BTzhSzW/OZiUENOYHlBJVG1Ox7pt24DZZw+HbFuSSLj90022CgTUei9
         Gxgg==
X-Gm-Message-State: ANoB5plyFc2Y14NJjod96ebbCZhGUqAOVxvZ7vAtdretuQ9UyVOcZrdS
        szQZ/NaHYYQNp5NI26cjLbf0H8Ibky6BEesaStGttcpyqr+qtQ==
X-Google-Smtp-Source: AA0mqf5zpNr47Q01uevpC1F2wT+1npXD+WPBwsfGPnPNIgx6otAxQK6AB0rR5vQvjL/wJrr6t7KbkdZ4CiNKq87GXgk=
X-Received: by 2002:a17:90b:3d0d:b0:1fd:5b5d:f09d with SMTP id
 pt13-20020a17090b3d0d00b001fd5b5df09dmr15989491pjb.69.1668942112103; Sun, 20
 Nov 2022 03:01:52 -0800 (PST)
MIME-Version: 1.0
References: <20221120061242.261839-1-cuigaosheng1@huawei.com>
In-Reply-To: <20221120061242.261839-1-cuigaosheng1@huawei.com>
From:   Dongliang Mu <mudongliangabcd@gmail.com>
Date:   Sun, 20 Nov 2022 19:01:25 +0800
Message-ID: <CAD-N9QWDG=CyM9CWHcko5uUSkWf+OKSc8-HCBvXKbfAveONfPA@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: fusb300_udc: free irq on the error path in fusb300_probe()
To:     Gaosheng Cui <cuigaosheng1@huawei.com>
Cc:     gregkh@linuxfoundation.org, yhchen@faraday-tech.com,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Nov 20, 2022 at 2:25 PM Gaosheng Cui <cuigaosheng1@huawei.com> wrote:
>
> When request_irq(ires1->start) failed in w5300_hw_probe(), irq ires->start
> has not been freed, and on the clean_up3 error path, we need to free
> ires1->start irq, too. Fix it.
>
> Fixes: 0fe6f1d1f612 ("usb: udc: add Faraday fusb300 driver")
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> ---
>  drivers/usb/gadget/udc/fusb300_udc.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/usb/gadget/udc/fusb300_udc.c b/drivers/usb/gadget/udc/fusb300_udc.c
> index 9af8b415f303..c66a59c15003 100644
> --- a/drivers/usb/gadget/udc/fusb300_udc.c
> +++ b/drivers/usb/gadget/udc/fusb300_udc.c
> @@ -1432,7 +1432,7 @@ static int fusb300_probe(struct platform_device *pdev)
>                         IRQF_SHARED, udc_name, fusb300);
>         if (ret < 0) {
>                 pr_err("request_irq1 error (%d)\n", ret);
> -               goto clean_up;
> +               goto clean_up2;
>         }
>
>         INIT_LIST_HEAD(&fusb300->gadget.ep_list);
> @@ -1487,8 +1487,9 @@ static int fusb300_probe(struct platform_device *pdev)
>         fusb300_free_request(&fusb300->ep[0]->ep, fusb300->ep0_req);
>
>  clean_up3:
> +       free_irq(ires1->start, fusb300);

Hi Gaosheng,

it seems you need to add the same free_irq in the .remove function.
Refer to the following patch,

--- a/drivers/usb/gadget/udc/fusb300_udc.c
+++ b/drivers/usb/gadget/udc/fusb300_udc.c
@@ -1347,6 +1347,7 @@ static int fusb300_remove(struct platform_device *pdev)
        usb_del_gadget_udc(&fusb300->gadget);
        iounmap(fusb300->reg);
        free_irq(platform_get_irq(pdev, 0), fusb300);
+       free_irq(platform_get_irq(pdev, 1), fusb300);

        fusb300_free_request(&fusb300->ep[0]->ep, fusb300->ep0_req);
        for (i = 0; i < FUSB300_MAX_NUM_EP; i++)

Fix me if I make any mistakes.

> +clean_up2:
>         free_irq(ires->start, fusb300);
> -
>  clean_up:
>         if (fusb300) {
>                 if (fusb300->ep0_req)
> --
> 2.25.1
>
