Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92C6463B9C7
	for <lists+linux-usb@lfdr.de>; Tue, 29 Nov 2022 07:25:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235682AbiK2GYw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Nov 2022 01:24:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235691AbiK2GYs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Nov 2022 01:24:48 -0500
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22460532C0;
        Mon, 28 Nov 2022 22:24:47 -0800 (PST)
Received: from canpemm500010.china.huawei.com (unknown [172.30.72.54])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NLsf3756yzqSlv;
        Tue, 29 Nov 2022 14:20:43 +0800 (CST)
Received: from [10.174.179.191] (10.174.179.191) by
 canpemm500010.china.huawei.com (7.192.105.118) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 29 Nov 2022 14:24:45 +0800
Message-ID: <3c8b9e41-dabb-f6f6-04e7-778c91a6b432@huawei.com>
Date:   Tue, 29 Nov 2022 14:24:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2] USB: FHCI: fix error return code in of_fhci_probe()
To:     <gregkh@linuxfoundation.org>, <linus.walleij@linaro.org>,
        <mailhol.vincent@wanadoo.fr>
CC:     <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1669704115-40011-1-git-send-email-wangyufen@huawei.com>
From:   wangyufen <wangyufen@huawei.com>
In-Reply-To: <1669704115-40011-1-git-send-email-wangyufen@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.191]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 canpemm500010.china.huawei.com (7.192.105.118)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Please ignore.

Thanks.

在 2022/11/29 14:41, Wang Yufen 写道:
> Fix to return a negative error code of PTR_ERR(fhci->gpiods[i])
> instead of 0.
> 
> Fixes: a4efdb8a423b ("USB: FHCI: Switch to GPIO descriptors")
> Signed-off-by: Wang Yufen <wangyufen@huawei.com>
> ---
>   drivers/usb/host/fhci-hcd.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/host/fhci-hcd.c b/drivers/usb/host/fhci-hcd.c
> index 95a4446..ca4b311 100644
> --- a/drivers/usb/host/fhci-hcd.c
> +++ b/drivers/usb/host/fhci-hcd.c
> @@ -639,8 +639,9 @@ static int of_fhci_probe(struct platform_device *ofdev)
>   					NULL, i, GPIOD_OUT_LOW);
>   
>   		if (IS_ERR(fhci->gpiods[i])) {
> -			dev_err(dev, "incorrect GPIO%d: %ld\n",
> -				i, PTR_ERR(fhci->gpiods[i]));
> +			ret = PTR_ERR(fhci->gpiods[i])
> +			dev_err(dev, "incorrect GPIO%d: %d\n",
> +				i, ret);
>   			goto err_gpios;
>   		}
>   		if (!fhci->gpiods[i]) {
