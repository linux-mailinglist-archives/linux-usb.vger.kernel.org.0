Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5799E6791E5
	for <lists+linux-usb@lfdr.de>; Tue, 24 Jan 2023 08:27:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232397AbjAXH1r (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Jan 2023 02:27:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229791AbjAXH1q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Jan 2023 02:27:46 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA5FB26BE
        for <linux-usb@vger.kernel.org>; Mon, 23 Jan 2023 23:27:42 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id m5-20020a05600c4f4500b003db03b2559eso10202125wmq.5
        for <linux-usb@vger.kernel.org>; Mon, 23 Jan 2023 23:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SY2Uu2YYyK8Y1xrm2tU570aO+JE1QrmVMEXXdVaDEOI=;
        b=sw74HFM06bEsfSXq4nrCyuxjly4jRqTFONPn5+xcQWEq6HLTV3xGbfvVdlE2nGlYFJ
         DL3gVNtWyTfzG350cJlnb7sbyTVJd27hk+ilbCY4oR6+7qGIjai3G287xsMQuqM3V4A/
         ulDEH8x9MLwBIvt/KIVWyxAkjGwxNSN/xuRD3ZgzZIX3IdNNrdCLDGgr5nQl8CXX58Rd
         VxvrtpWvszJmOMs3qo6fp/hXbEgznjj23B1TQFKC9O+SRNAh+538QaAnpOnJrh+7xulf
         MqxBzF1O+5361JWePjs502T11b1S7IC5+2jCY4pSvrEan2pvW1n1eBdirkA6GQ0pROL1
         3KTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SY2Uu2YYyK8Y1xrm2tU570aO+JE1QrmVMEXXdVaDEOI=;
        b=Y4eOt6QwlPEb/JfKozbTVgKItnv+zD/6iqVsYXtEEnL6FTuTR+TS1eynY3iocsbr7j
         BSCRT1QCCaYwk22+XsPugiE/tIgSJtqQvqu7aZuUbWkrGsQhZeWsgELFxAMY0jaBAARO
         nna8Th1woB6nzkend2YEV6bhSZvbc3hEg+aieYT/rWIPv345CBoc6MLCCyUvl1gMooUA
         ZwbeIQOADEkBcRwsRsU/SbrlPBafNDWHsj7gbgAzKejY+drMKmedY13K6zEOZDF/l2ha
         5fl2yGZfJh0Dgtv1YVJuk5byYmUt+FIfZFHMnXLRE1yJ9fZXhGaVpsRYu1/qr1k3llag
         STfQ==
X-Gm-Message-State: AFqh2kqeF9IsNr6nVclPxkyOwv0mTUAgcAbWlWmB56EtTyM4oeqTMWVM
        fS2wqF7v1HBJzidnWPYMjmWFUw==
X-Google-Smtp-Source: AMrXdXvGo1RZOMT3nHmhJnZ69ybbOlDpzor4orbpkRbTdPNz0soJjirQieVO7ARS2baNdEO8AW7+Og==
X-Received: by 2002:a05:600c:255:b0:3da:f9b7:74c7 with SMTP id 21-20020a05600c025500b003daf9b774c7mr25467863wmj.13.1674545261402;
        Mon, 23 Jan 2023 23:27:41 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id o24-20020a05600c511800b003d9de0c39fasm16814781wms.36.2023.01.23.23.27.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 23:27:41 -0800 (PST)
Message-ID: <8d7f4a8d-a6ca-f66c-413a-ed5fecec2c9f@linaro.org>
Date:   Tue, 24 Jan 2023 08:27:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH V6 1/6] dt-bindings: usb: Add Cypress cypd4226 Type-C
 controller
Content-Language: en-US
To:     Jon Hunter <jonathanh@nvidia.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Wayne Chang <waynec@nvidia.com>
References: <20230119121639.226729-1-jonathanh@nvidia.com>
 <20230119121639.226729-2-jonathanh@nvidia.com>
 <2789cf94-60b4-7e35-50f8-e21b564a1dfb@linaro.org>
 <e39c0b6b-6265-b419-a7aa-18f930bb3a9f@nvidia.com>
 <b86ed174-811a-023f-4a65-4bc0b10cf710@linaro.org>
 <392b05ef-0ac3-dca6-05f1-7201f4f647f6@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <392b05ef-0ac3-dca6-05f1-7201f4f647f6@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 23/01/2023 23:16, Jon Hunter wrote:
> Per the above if we remove interrupt-cells, then we get ...
> 
> Documentation/devicetree/bindings/usb/cypress,cypd4226.example.dtb: typec@8: interrupts: [[10], [8]] is too long
>  From schema: /home/jonathanh/workdir/tegra/korg-linux-next.git/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
> 
> So it seems that we need this as well.
>
Indeed.

Best regards,
Krzysztof

