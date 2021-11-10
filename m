Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72F7444BC53
	for <lists+linux-usb@lfdr.de>; Wed, 10 Nov 2021 08:45:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229944AbhKJHsF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Nov 2021 02:48:05 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:58876
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229595AbhKJHsE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 Nov 2021 02:48:04 -0500
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com [209.85.208.198])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1A2673F19B
        for <linux-usb@vger.kernel.org>; Wed, 10 Nov 2021 07:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1636530317;
        bh=N83ESKUHB/kqrmHqZ+hpUE8Wq2iA/YnywAyf4v9xq00=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=wXXPSCVYjdbs+iToRmvDGzHd6Miv6O1tDdodDVe4wa8qGHVfeKUSS5PC78qkezXai
         amgLYBVeA1VtPSJRoi3Iby5rt1LjltMPAJ2QPejvVd5XqnN1eSX3W28kO/O2ff5Tfk
         YX0iWJ7NVO5aG2V7bc7gWhtjgU33bC24zKs+eLShPdqMgc1zrGhVniAWBNMM4Q34OE
         C4mCZXuIBu285I8qHAAXYIsWQOMVAObouAffw+24YxLxaoTXcjPtMZNyNM0ymDBKVR
         nYhnmPCgnYC3gyeK1FR5zujF3MPKuitajUivHrnHNPVU5RQTkcqvjTemCcAgGSzNFz
         q83sqxucguO/w==
Received: by mail-lj1-f198.google.com with SMTP id o15-20020a2e90cf000000b00218dfebebdeso290282ljg.13
        for <linux-usb@vger.kernel.org>; Tue, 09 Nov 2021 23:45:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=N83ESKUHB/kqrmHqZ+hpUE8Wq2iA/YnywAyf4v9xq00=;
        b=SgUPIooldYkwdwEJQ71Ttsma9doWoTcVH7k9cWisnSzRhm2SYxvTZsiRLOaMa//IxQ
         MpkbmPDGO/6sLgo5Ch/AiEDli3bBbV13idICKSO+224Euc8+WP4oisepaa4kSo9puP7H
         yeQCFw5Vg0cC6HlujcHXOwY5SXY37kQnFvH92dTXadpw4TZ7Gomy4MAUKTAdpcNLMfXh
         VthCvr4NFek134pTpkoVEExUG7eknLRPBvLg540zOf9SDqxDLBMx0BFYeTpowF2Zdv2e
         8SaLFUrNQIIusDv3OlhdruVgZkm+WnyzOLI1OPlPu7OC1RvMVIPohsY9Oj56NgzcSCc9
         cO6A==
X-Gm-Message-State: AOAM533x3vlNWtaGvHyY2OqnFOdV7JUyRfOjiFQxK6+fGh/JiNc5B59M
        frcnIVhqk/AuyPVGwU8RQppFyI5ncRJIoTpKITQv8xaOGhSyCRlGNck4+fZx0DgvYPx4wLAWzXt
        jNas3b2Ny9BQfaJ2zk0KdUP1Bzsl8rbn3xV69nA==
X-Received: by 2002:a05:651c:11cf:: with SMTP id z15mr13724611ljo.30.1636530316473;
        Tue, 09 Nov 2021 23:45:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxj/L+35JjL2smH5MiuFZkelZYQSjo3AZ/1hVDezSpzMKpDS3vieitpkj9D1r3Hbn/gkMU6Bw==
X-Received: by 2002:a05:651c:11cf:: with SMTP id z15mr13724596ljo.30.1636530316282;
        Tue, 09 Nov 2021 23:45:16 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id b22sm2384886lfi.67.2021.11.09.23.45.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Nov 2021 23:45:15 -0800 (PST)
Message-ID: <978563c0-95fd-1c76-42a2-5e0ab9cbc61d@canonical.com>
Date:   Wed, 10 Nov 2021 08:45:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 10/13] dt-bindings: spi: add bindings for microchip mpfs
 spi
Content-Language: en-US
To:     Conor.Dooley@microchip.com, robh@kernel.org
Cc:     robh+dt@kernel.org, gregkh@linuxfoundation.org,
        linus.walleij@linaro.org, linux-riscv@lists.infradead.org,
        aou@eecs.berkeley.edu, paul.walmsley@sifive.com,
        linux-usb@vger.kernel.org, Daire.McNamara@microchip.com,
        linux-spi@vger.kernel.org, geert@linux-m68k.org,
        devicetree@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-gpio@vger.kernel.org, broonie@kernel.org, palmer@dabbelt.com,
        bgolaszewski@baylibre.com, jassisinghbrar@gmail.com,
        linux-crypto@vger.kernel.org, Ivan.Griffin@microchip.com,
        atish.patra@wdc.com, Lewis.Hanly@microchip.com,
        bin.meng@windriver.com, alexandre.belloni@bootlin.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        a.zummo@towertech.it
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-11-conor.dooley@microchip.com>
 <1636430789.935637.743042.nullmailer@robh.at.kernel.org>
 <96005893-8819-1d76-6dea-7d173655258f@microchip.com>
 <0d996393-20b9-4f16-cbd0-c9bff2b54112@canonical.com>
 <bd26a633-7c71-b00b-00c3-54688ee42297@microchip.com>
 <cd789074-53a0-72c1-76f0-b2b86a434247@canonical.com>
 <a2ce221d-5ab7-52c5-176e-e64a081a6805@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <a2ce221d-5ab7-52c5-176e-e64a081a6805@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 09/11/2021 14:20, Conor.Dooley@microchip.com wrote:
> On 09/11/2021 13:04, Krzysztof Kozlowski wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 09/11/2021 13:58, Conor.Dooley@microchip.com wrote:
>>> On 09/11/2021 12:53, Krzysztof Kozlowski wrote:
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>
>>>> On 09/11/2021 13:16, Conor.Dooley@microchip.com wrote:
>>>>> On 09/11/2021 04:06, Rob Herring wrote:
>>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>>>
>>>>>> On Mon, 08 Nov 2021 15:05:51 +0000, conor.dooley@microchip.com wrote:
>>>>>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>>>>>
>>>>>>> Add device tree bindings for the {q,}spi controller on
>>>>>>> the Microchip PolarFire SoC.
>>>>>>>
>>>>>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>>>>>> ---
>>>>>>>     .../bindings/spi/microchip,mpfs-spi.yaml      | 72 +++++++++++++++++++
>>>>>>>     1 file changed, 72 insertions(+)
>>>>>>>     create mode 100644 Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
>>>>>>>
>>>>>>
>>>>>> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
>>>>>> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>>>>>>
>>>>>> yamllint warnings/errors:
>>>>>>
>>>>>> dtschema/dtc warnings/errors:
>>>>>> Documentation/devicetree/bindings/spi/microchip,mpfs-spi.example.dts:19:18: fatal error: dt-bindings/clock/microchip,mpfs-clock.h: No such file or directory
>>>>>>       19 |         #include "dt-bindings/clock/microchip,mpfs-clock.h"
>>>>> Rob,
>>>>> Should I drop the header from the example or is there a way for me
>>>>> specify the dependent patch to pass this check?
>>>>
>>>> The error has to be fixed, although not necessarily by dropping the
>>>> header, but by posting it. How this can pass on your system? There is no
>>>> such file added in this patchset.
>>> I linked the patch adding the clock as a dependency in the cover letter
>>> [1], which is why I was wondering if there was a better way to do so
>>> that would get picked up by the checker bot.
>>
>> It's not only about the bot, but dependency when applied. If you did not
>> warn clk maintainer that clock bindings should go via Rob's tree or
>> should be provided as a tag, the patches here cannot be applied in this
>> cycle.
> It was not my (our) intention to send the clock patches via rob's tree.
> And since this is my first time trying to upstream wholescale changes to 
> a device tree I honestly didn't expect this series to get accepted in 
> this cycle anyway.

OK :)

Assuming your new bindings pass db_binding_check with
DT_CHECKER_FLAGS=-m (on top of clock patch), I propose to keep the
header here.

Another idea would be to submit without the header and use raw IDs
(numbers) and convert it later. I prefer the first- base on clock patches.


Best regards,
Krzysztof
