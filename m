Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD2955FC605
	for <lists+linux-usb@lfdr.de>; Wed, 12 Oct 2022 15:11:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229745AbiJLNLO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Oct 2022 09:11:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229808AbiJLNLK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Oct 2022 09:11:10 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8B2CCBFC8
        for <linux-usb@vger.kernel.org>; Wed, 12 Oct 2022 06:11:04 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id g11so5461877qts.1
        for <linux-usb@vger.kernel.org>; Wed, 12 Oct 2022 06:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UqyKv0XYLPEVdA5JJtsH2C4lrk87Khcgzczr+S4ad18=;
        b=MqaobulmgicuadCCH89dsRp8x/x4N6tzQugx5DMzikid18PoYnadVJtRbEBLfCHQiI
         5q+YNh97Jl0AMjtR+qF+0/0MmDwIbxcx1S/6I+1GpsBeZHziTyVpa+jCosnto1B/ZzaW
         RFoGKMS96CNXAwFQiCMez3Qpfy54SL88JGWTHka3+pwu31uXlsyZazC3JBVQduXYWny0
         +cd8wdxYySw2thR0pRlI0Q01XqY6a11wR9NiLT56MULAkxoPjvwS+RvdVsNEjWC2z9cp
         VmOyZQ40hL7RToidel5+andZTNlrzWXP4ayK/4922wBQN8SABAYOAx9RC8Kw/lf0vHd3
         DyBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UqyKv0XYLPEVdA5JJtsH2C4lrk87Khcgzczr+S4ad18=;
        b=fri6vICF+5c+riZvQSrOWglUhQ2h7Y80xitsIvXo9Q6w/Q5OS1Ns7B7PIZddQtJsIh
         rFs9i4SL3EgY8pKHPsyM0vjFL3qHQwxz2K4V0h3faQ3UtH32nrw2MPM/u9uTdY4iK7Xw
         lCKvyTxm63zUF5B5MkfAJPPY7tc60O44aQUU0x+6qPBCg50og0tk2ew9CqHE8OB83LdB
         y3FlLoU9Sr9FA0nJMSvNYOwIikoxQcntxcbSsk39YrBFQ3VeBbJ3T/EKfpGA9vqwdsYB
         Gnpy86HzY7TiA8EiHpbjNbcLHoeq0hCsDg7J1ScCda9UPmUiy9yrhMxS4RVLiIdt/2xH
         RpYA==
X-Gm-Message-State: ACrzQf3MSIakTAo5RKtQzGVW9TvLXeycdWZQtXbs8glRYzj2RjMVkt1R
        IHqA/jndWkUCy3BiOnai0gmVcg==
X-Google-Smtp-Source: AMsMyM4tx+xcp7HZkRDiMRLGc4Qh39k6W10pp8XbW0JoxyTNqsJPbm86beuyuM1vWEooI9gyiiMTZw==
X-Received: by 2002:a05:622a:2d0:b0:395:e96a:8eeb with SMTP id a16-20020a05622a02d000b00395e96a8eebmr21894460qtx.176.1665580263754;
        Wed, 12 Oct 2022 06:11:03 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id m8-20020ac84448000000b0039a1146e0e1sm6826054qtn.33.2022.10.12.06.11.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Oct 2022 06:11:02 -0700 (PDT)
Message-ID: <cdbcf5a3-3bb0-4270-1211-a45a0596224f@linaro.org>
Date:   Wed, 12 Oct 2022 09:08:49 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2 08/10] dt-bindings: vendor-prefixes: add Source Parts
Content-Language: en-US
To:     Icenowy Zheng <uwu@icenowy.me>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andre Przywara <andre.przywara@arm.com>
Cc:     soc@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org
References: <20221012055602.1544944-1-uwu@icenowy.me>
 <20221012055602.1544944-9-uwu@icenowy.me>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221012055602.1544944-9-uwu@icenowy.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 12/10/2022 01:56, Icenowy Zheng wrote:
> Source Parts Inc. [1] is a company that makes a series of SBCs, SoMs,
> etc under a brand called Popcorn Computer [2].
> 
> Add it to the vendor prefixes list.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

