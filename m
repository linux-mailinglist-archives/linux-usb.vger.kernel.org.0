Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8A37732B79
	for <lists+linux-usb@lfdr.de>; Fri, 16 Jun 2023 11:27:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344177AbjFPJ1s (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Jun 2023 05:27:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344193AbjFPJ1b (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 16 Jun 2023 05:27:31 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 944F044AC
        for <linux-usb@vger.kernel.org>; Fri, 16 Jun 2023 02:26:28 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-982af24987fso73342966b.0
        for <linux-usb@vger.kernel.org>; Fri, 16 Jun 2023 02:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686907587; x=1689499587;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JzbnGZhrNyWzHO+pd630be+eVcaUV9U4dzUTx4TgLb8=;
        b=jvj4ImB41EBwWhl8l+G9DcltqOLh99FsTfocVojQ52wQZGmO8ykxxwnscLMkESPIlu
         XDVaLe8hPlsRvpEatl0lo/NJHsx/St35jmciLyQk45ZLAZaufKkV1mtPgcBPsvplksmZ
         AGnNqKCcPRoiu1NtqoSlY40ckt9S+BtB0RFL3YG52Sj7/0qn+grUgjWlNbjb7tn7SH2u
         a5EjHhbX64xgTn2PVR5w/rX9Ts2Ff/rbWIw6JyunEcE6YqaRz5xtrYU3G7jPCBkxSD50
         dCQRpyP0QJWVCROwWgMTznZJjmv1PcBGN1wpjabRMwyhbCZXaRIdjMwpKvT1hQfwi0pl
         950Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686907587; x=1689499587;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JzbnGZhrNyWzHO+pd630be+eVcaUV9U4dzUTx4TgLb8=;
        b=FIeCJ31sIqk8XKwo/JYDwftauOT+xsJe71VuF98R2xluSd4JcvhMqZMoQfK7k9h1uF
         Z+5pbVoaLOj0HLtwPB5ReVRUA300N1po3OXDxW/oXrkrU5EPmtslLIWawK597KVOGZAE
         /W/Cs23hCVpjWs5pyG3ds6KRbdaXxd+99aJKNCSUl8Zp5BIeH1UCzLVzJyLtmvgj+d6m
         XnD+IuXphatuLB3BTBJ9JiCSUWxdv+PmFh1wvS+GhyctmDFkd5MCrlnN4cpaMOF9O54V
         p/lOFU3NN9SucJLTN6NcyJuAJt2z2ELPJBKchFvETQmu3c149s8HncNcPgNw+nnCutdx
         Da6g==
X-Gm-Message-State: AC+VfDz9pOOMdcO86VeqHR0yQ3rLLAnJEvhaxOMkEPo0DfAzxZPRSMqQ
        9sTLYddITZir4BI4g/cRzwyzqw==
X-Google-Smtp-Source: ACHHUZ5pd4rYYjbrDm3AKYGAfFChi1yrldfZLnzVvqtnbubhK4z37yBpU/rAmMOrHeoRs7ur2/SYYw==
X-Received: by 2002:a17:906:af65:b0:974:1eeb:1ab7 with SMTP id os5-20020a170906af6500b009741eeb1ab7mr961547ejb.24.1686907586845;
        Fri, 16 Jun 2023 02:26:26 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id i24-20020a17090671d800b00967004187b8sm10428226ejk.36.2023.06.16.02.26.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jun 2023 02:26:26 -0700 (PDT)
Message-ID: <0c28b53e-a6c6-908a-0b3f-107b22231a4b@linaro.org>
Date:   Fri, 16 Jun 2023 11:26:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: usb: dwc3: HC dies under high I/O load on Exynos5422
To:     =?UTF-8?Q?Jakub_Van=c4=9bk?= <linuxtardis@gmail.com>,
        Thinh.Nguyen@synopsys.com, mauro.ribeiro@hardkernel.com
Cc:     linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org
References: <a21f34c04632d250cd0a78c7c6f4a1c9c7a43142.camel@gmail.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <a21f34c04632d250cd0a78c7c6f4a1c9c7a43142.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 16/06/2023 05:11, Jakub Vaněk wrote:
> Hi all,
> 
> I've discovered that on recent kernels the xHCI controller on Odroid
> HC2 dies when a USB-attached disk is put under a heavy I/O load.
> 
> The hardware in question is using a DWC3 2.00a IP within the Exynos5422
> to provide two internal USB3 ports. One of them is connected to a
> JMS578 USB-to-SATA bridge (Odroid firmware v173.01.00.02). The bridge
> is then connected to a Intel SSDSC2KG240G8 (firmware XCV10132).
> 
> The crash can be triggered by running a read-heavy workload. This
> triggers it for me within tens of seconds:

multi_v7 has devfreq enabled. Does disabling ARM_EXYNOS_BUS_DEVFREQ
change anything here?

Best regards,
Krzysztof

