Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FBAC52EC98
	for <lists+linux-usb@lfdr.de>; Fri, 20 May 2022 14:50:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349547AbiETMud (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 May 2022 08:50:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349537AbiETMub (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 May 2022 08:50:31 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A450166D61
        for <linux-usb@vger.kernel.org>; Fri, 20 May 2022 05:50:28 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id u23so14173162lfc.1
        for <linux-usb@vger.kernel.org>; Fri, 20 May 2022 05:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=rw557JuqqBfkrIeMqm9Q73SdR1LCTiOOmhhgFZlhrWo=;
        b=Nps8png1xqwqaXRARrrO0C+DfZYSf2bntdBhj+6Ri1e5U4zbqewJS2ReLdLXfNseaJ
         +GR6dNvZ9KmcKDqw/yAl8FIa9T7xhwJrHW8hzzaPVmLQCh/qJMZcx7lzHVsCQPn1W+jN
         DY3inZbdl0olc/vIN+nPO2SEXkZ/nAdDnYFkDBVBqn67nzFjwvq7zc4ClLDNHVW/ycJT
         51cR7UgzrqLkUzOO+ME7jdVLz2vTdnOdejHIyBsCsg5Ww6kYnNN7TRp+1SkD80OcTU15
         0qCO24dIDN7iM9RzktkTAHwFacxgYU67R9uEPwvleLP2sejndHkw8Ios1VlFVDa7CZwe
         JN/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rw557JuqqBfkrIeMqm9Q73SdR1LCTiOOmhhgFZlhrWo=;
        b=mhuTmbV8aymSaoWwqNoatxsEF2VaSCk2S3kKZQ2CqB01MIX99isMb34uUCZHJPAsGP
         KlR6CeGUWA8tCP3V9L15XoDxmAkwOV432mwYPABmrl4hgJbRC0yc4NXzNDKoFP2RYJFh
         DL7a5BgpyNrBYzXquMV5O60eCcO6tlJL4ac1b8vgowjykEKfWZmELfP8IFECa1Dgr2sI
         fg7LY9iol/b9d+GLpDa67aaSg/yg2hfjZIOtJDcjPY1rq0TN8mzZcB/AFOwDcfSKIpM1
         9pXYSjF/kcaszQMUcUjnfzDu2H2ayNfIs5UD+GF8xZax0tGF/jDBuz0Z3pVOpkL3CZM2
         aHpA==
X-Gm-Message-State: AOAM531J8A89l/jo29Jw6bffO2uBE0Ik0mI6RSsJPbP3nGrSwxAprII+
        cfeB9dGxNgKqalRy9iCen6XRrw==
X-Google-Smtp-Source: ABdhPJxEkqrTB396TYyemRowxMKtKjQKYNzjkppAXp92YM0ZAbZjILr9av0gjhay7sjVxpd9D2tQjA==
X-Received: by 2002:a19:5e55:0:b0:477:bae8:e5fc with SMTP id z21-20020a195e55000000b00477bae8e5fcmr6671440lfi.14.1653051026539;
        Fri, 20 May 2022 05:50:26 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id v5-20020a2e9605000000b0024f3d1daeaasm309855ljh.50.2022.05.20.05.50.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 May 2022 05:50:25 -0700 (PDT)
Message-ID: <01b31a02-523e-10bf-3b46-5b830e456522@linaro.org>
Date:   Fri, 20 May 2022 14:50:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 2/3] dt-bindings: usb: atmel: Add Microchip LAN966x
 compatible string
Content-Language: en-US
To:     Herve Codina <herve.codina@bootlin.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Horatiu Vultur <horatiu.vultur@microchip.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220513105850.310375-1-herve.codina@bootlin.com>
 <20220513105850.310375-3-herve.codina@bootlin.com>
 <8f0d4127-7e66-cf50-21c9-99680f737e30@linaro.org>
 <20220520133426.3b4728ae@bootlin.com>
 <b087c34f-0e2f-edd0-a738-3ffc2853a41b@linaro.org>
 <20220520142109.57b84da2@bootlin.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220520142109.57b84da2@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20/05/2022 14:21, Herve Codina wrote:
>>> I think it makes sense to keep 'microchip,lan966x-udc' for the USB
>>> device controller (same controller on LAN9662 and LAN9668) and so
>>> keeping the same rules as for other common parts.  
>>
>> Having wildcard was rather a mistake and we already started correcting
>> it, so keeping the "mistake" neither gives you consistency, nor
>> correctness...
>>
> 
> I think that the "family" compatible should be present.
> This one allows to define the common parts in the common
> .dtsi file (lan966x.dtsi in our case).
> 
> What do you think about:
> - microchip,lan9662-udc
> - microchip,lan9668-udc
> - microchip,lan966-udc  <-- Family
> 
> lan966 is defined as the family compatible string since (1) in
> bindings/arm/atmel-at91.yaml and in Documentation/arm/microchip.rst
> 

You can add some family compatible, if it makes sense. I don't get why
do you mention it - we did not discuss family names, but using
wildcards... Just please do not add wildcards.

Best regards,
Krzysztof
