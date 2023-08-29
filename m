Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD41E78CA33
	for <lists+linux-usb@lfdr.de>; Tue, 29 Aug 2023 19:07:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237620AbjH2RGq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Aug 2023 13:06:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235531AbjH2RGR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Aug 2023 13:06:17 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 160BFAD
        for <linux-usb@vger.kernel.org>; Tue, 29 Aug 2023 10:06:15 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-500b6456c7eso4229791e87.2
        for <linux-usb@vger.kernel.org>; Tue, 29 Aug 2023 10:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693328773; x=1693933573;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0o7Mr831Nej9FWv2bx2EhMzCwHiFVCqVynGDq67M+Fk=;
        b=HhPJUBP41PMjhbmDGMzh3+t2f38Bv168mCi/sG5tFsMgRYn5jbtO3BmgiRmgCr9poj
         IjfWsOtyd3zMFtNkVeRsqaGEtY+CFSI/Vvb20AXVH5zeFqnep2HNA4Jao0zCuPchPMg0
         ltzWawE6Z0oWD/7KlY7t8WmGZ9qkmeP8JMlWTD+rP40IPC4+e6lDCkRpBJEtecScZciZ
         uowsfByz5WdSD/aXuFK3Flx6N3IAKFMRH7N6/yLg4z4XLuHCfAmA/+oiFiPXaAZ3fXPs
         CY4pvMwdVHJ+rp2mQPkL1gEeXYgb72FI+7+RbJm2TOk812Q+w7/N90eBSRb28MealViN
         Lmwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693328773; x=1693933573;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0o7Mr831Nej9FWv2bx2EhMzCwHiFVCqVynGDq67M+Fk=;
        b=cfcKw+sJ6PjeRt8KwoZ3ytt0hia6oPfckUvCyQXc6R0Ham0PjNrMnUs4S1CXUykeBi
         AyV70vg23WKozu/m+DCc7MH0X1+Aqy9si9SnHTYuJhz9lZQ8cwtnhmIE1hxJXH6FtInd
         +1JR2V6PgVBAgfrQUOHkuS40ZXHtwlg83PnlMVZwbDUc/tSLKQJ5yHLYlril4lyozVyZ
         SNTVYgGw2ys3/f0ZiH9+XszEW4P1awFjn5ERSaLsbfUnKSrscsXxF0RI7s/0fKjjjo2p
         Fc9gcqJKfG37zzpCf9vnSMuJrwZVzh3mqH6BLM/4uJaObbuMUzP8IM6fosqU4R3jea/w
         CQAg==
X-Gm-Message-State: AOJu0YxwqWt1XOddbNekSR4zo/DN2SeoAmlLZ0geoYiyqrLQtIT+BXGt
        2/6LnqSCy8LNJy8W2w9k69PqpQ==
X-Google-Smtp-Source: AGHT+IHDVaqqoGBbn+2ZIUMx1R/FTnYRpx9OPIJdXNfCDCm9rndnP0L3pxBfF44J7EddVs7LBmG7oQ==
X-Received: by 2002:ac2:5e7a:0:b0:500:7fc1:414b with SMTP id a26-20020ac25e7a000000b005007fc1414bmr16439268lfr.25.1693328773205;
        Tue, 29 Aug 2023 10:06:13 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.196])
        by smtp.gmail.com with ESMTPSA id dk24-20020a170906f0d800b0099ddc81903asm6185081ejb.221.2023.08.29.10.06.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Aug 2023 10:06:12 -0700 (PDT)
Message-ID: <395d044b-73cd-d790-5fc6-98e8930acf8e@linaro.org>
Date:   Tue, 29 Aug 2023 19:06:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 9/9] arm64: defconfig: Enable UNIPHY driver
Content-Language: en-US
To:     Praveenkumar I <quic_ipkumar@quicinc.com>, robert.marko@sartura.hr,
        luka.perkov@sartura.hr, agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@linaro.org, vkoul@kernel.org, kishon@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, gregkh@linuxfoundation.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        arnd@arndb.de, geert+renesas@glider.be, nfraprado@collabora.com,
        rafal@milecki.pl, peng.fan@nxp.com, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     quic_varada@quicinc.com
References: <20230829135818.2219438-1-quic_ipkumar@quicinc.com>
 <20230829135818.2219438-10-quic_ipkumar@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230829135818.2219438-10-quic_ipkumar@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 29/08/2023 15:58, Praveenkumar I wrote:
> Enable UNIPHY driver for IPQ5322.

This we see from the diff. You *must* say *why*, not *what*.

Samsung IPQ5322 or NXP IPQ5322? Which boards need it?

> 
> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> ---
> This patch depends on the below series which adds support for USB2 in
> IPQ5332
> https://lore.kernel.org/all/cover.1692699472.git.quic_varada@quicinc.com/
> 

How does it depend? Obviously it is part of the series, but what is
depending here?

Best regards,
Krzysztof

