Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F91B76B7A1
	for <lists+linux-usb@lfdr.de>; Tue,  1 Aug 2023 16:35:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234773AbjHAOfV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Aug 2023 10:35:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230507AbjHAOfO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Aug 2023 10:35:14 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B6E21BE9
        for <linux-usb@vger.kernel.org>; Tue,  1 Aug 2023 07:35:09 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1bb775625e2so37585605ad.1
        for <linux-usb@vger.kernel.org>; Tue, 01 Aug 2023 07:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690900509; x=1691505309;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=lJtekU7iYNArAtsU7VeTyVGW5swpEORD91LFWRVt94s=;
        b=ryLp7WXFaj2drpBSmRl2LGHfP927CcAO+W2SGZwWnslyTyLf6tuJ/FkYPv5nc8KInX
         SM2WXe3D8HC44OIadFt9xgwYvFt+15NN0MrPsuTsgAkWdxTr/ifcVIgq5cQucF72kvf+
         FR5DT79DLc3ADHmwlJ6ycL0RRHQ9ZdAAdXjNY0MLKVM2Ft0ajcuHwGNAofZqHJgrh/+n
         teYboJ2OwprRH0/BGeOG3SJAkzkx4jIz+QKpgbthSk1SDbNyBVvw0Vxo3XdpP2Ly9WM3
         iwsvofjn4JPjUgaE3w6KRRWfKpETgKX6B7Hk6pf3sXyt4MX+HO8NDc5E5cqapx5sKXCi
         EzkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690900509; x=1691505309;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lJtekU7iYNArAtsU7VeTyVGW5swpEORD91LFWRVt94s=;
        b=KSZYFUNXpoaDDcBJzWl4DtxG/8xrzJjdNlmAzVrYu+VtaomQGsusVIb0fDkeNZOCKy
         rRt+G65KyDMsclxqqs/0uW0t+taNv18H7vllaU4bWKoYNmoISIGzPmnsRrOhurANo7wf
         U5ZAxFBPW2Y2LlNruHuJToNLbx7W7zfcORE/B8kAP0vIONt4S5/uEjmrSFZqA9aWRIu4
         +wRaP087zEyE4TYq3RwOtrKFT6dbiIBctu1eUGClulRXyhAyT7iL6WEsN1NiLNmqMCBM
         FLeXbhBeMz05zmF7Ww+bdnKnPclaWdiuKVwCGRNCvgaSwm3e35nm1Zz/Azyv7NnU0Bkr
         /nlw==
X-Gm-Message-State: ABy/qLZ2939lRKd9X0ebX2AIlzxRWj/142U0HxLLo0wguYS87oGrALf+
        fMDxsO6TJ7TUD2pCsqvdIhc=
X-Google-Smtp-Source: APBJJlGEjU1esn5ww96Q26G5Cjme5PbcxruiY/d4kC2vXu8zIBXMIO7z1MRjwF6FyQASNB+nJXBkcQ==
X-Received: by 2002:a17:902:e745:b0:1b8:8682:62fb with SMTP id p5-20020a170902e74500b001b8868262fbmr15825031plf.4.1690900508862;
        Tue, 01 Aug 2023 07:35:08 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id jd20-20020a170903261400b001b8b0ac2258sm10570705plb.174.2023.08.01.07.35.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Aug 2023 07:35:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c8d0e527-b4ea-8df2-fb78-4e8dfc5d7b93@roeck-us.net>
Date:   Tue, 1 Aug 2023 07:35:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH -next] usb: typec: tcpci_mt6370: remove redundant
 dev_err_probe()
Content-Language: en-US
To:     Zhu Wang <wangzhu9@huawei.com>, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, matthias.bgg@gmail.com,
        angelogioacchino.delregno@collabora.com, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20230801122834.89168-1-wangzhu9@huawei.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20230801122834.89168-1-wangzhu9@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 8/1/23 05:28, Zhu Wang wrote:
> When platform_get_irq() is called, the error message has been printed,
> so it need not to call dev_err_probe() to present error messages.
> 
> Signed-off-by: Zhu Wang <wangzhu9@huawei.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/usb/typec/tcpm/tcpci_mt6370.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci_mt6370.c b/drivers/usb/typec/tcpm/tcpci_mt6370.c
> index 2a079464b398..9cda1005ef01 100644
> --- a/drivers/usb/typec/tcpm/tcpci_mt6370.c
> +++ b/drivers/usb/typec/tcpm/tcpci_mt6370.c
> @@ -147,7 +147,7 @@ static int mt6370_tcpc_probe(struct platform_device *pdev)
>   
>   	irq = platform_get_irq(pdev, 0);
>   	if (irq < 0)
> -		return dev_err_probe(dev, irq, "Failed to get irq\n");
> +		return irq;
>   
>   	/* Assign TCPCI feature and ops */
>   	priv->tcpci_data.auto_discharge_disconnect = 1;

