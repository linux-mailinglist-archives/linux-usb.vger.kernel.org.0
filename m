Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87EEF6898AF
	for <lists+linux-usb@lfdr.de>; Fri,  3 Feb 2023 13:30:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232838AbjBCMaV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Feb 2023 07:30:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231616AbjBCMaS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Feb 2023 07:30:18 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9301277DCB
        for <linux-usb@vger.kernel.org>; Fri,  3 Feb 2023 04:30:10 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id k16so3751980wms.2
        for <linux-usb@vger.kernel.org>; Fri, 03 Feb 2023 04:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oliUtLWESo3lQu6iHKqwx+2QOwN2sNCjDu921E6eImU=;
        b=PC6jnhprbBOYA5gQ8hht4uhJybrq7/0C64ACU2Gt9qfbW1pk9VfapwtzsEQiHMXbWG
         1JppW/crId+0Ce/5NY+vbYD8aQrWah3VOr/cgyiKfrz+CsV1xjGADT9tWMUyPppehNBX
         SC0wy/PcQSuekQwM7g/y6t2SL8B/Gkosz5mtmibN43bNv0b1mD4tCXB0banPcItFJwfc
         i54CE0XoHTzA+jAmoTtBHleO+mnp2xAR7FyjhdHzEDNwwY9TdNXm+ghb8j6ArobpiwRR
         9hn30hxFYj4ol+bMYzOz9KNKlsouP5G6WIVr/nA+qavbwuBMicrP2QKe1d5rCLF7jiXP
         ViLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oliUtLWESo3lQu6iHKqwx+2QOwN2sNCjDu921E6eImU=;
        b=Gy530cWbTYgb7u20XmPq3VjJdIRJNHvBZxq/8ZoDMB1WEFk4B6sB6xAfcyh+vaDygp
         SFb0O16P48/Du+zn3+tNBoAqaS+6UqMQ4Mb5jYGzLaoLLF0Af4vgRaey7//nDgkE69uE
         blsACU/NJnBW5yFadpxX7D4HcmQ3qwcsCQm4Ak2+o+R4BAsT6DFAAXD42svUxrc169fs
         m8rnz7DtWRS9HE3dTkEz5bGhww1skYR8B/TM/R/teF9dXOPBY4X2+5BJYr50nUBFqF+y
         bOV2mjF4qUudNcPj2igjP2TeWBrdDuGPoRG12YQrBXpfathI/41eIRlevOT8ZWSQ+vgr
         hIFQ==
X-Gm-Message-State: AO0yUKUpfokizlyIjKN4EQE3RBKrnrbUq1D0tIQfyxMwGwHAYN242j9G
        ZT+1qO2gNWhtEDee00tLMJHOAg==
X-Google-Smtp-Source: AK7set8hvfzN5yvSx0vn3SHDYBE0Cu37jFl12DeSADMr5lTBdrNCrV6wJaZ+esFXBrp8t+sFKTfd2w==
X-Received: by 2002:a05:600c:4395:b0:3df:9858:c02c with SMTP id e21-20020a05600c439500b003df9858c02cmr4411370wmn.1.1675427409090;
        Fri, 03 Feb 2023 04:30:09 -0800 (PST)
Received: from [192.168.2.104] ([79.115.63.122])
        by smtp.gmail.com with ESMTPSA id h27-20020a05600c2cbb00b003db12112fcfsm2871505wmc.4.2023.02.03.04.30.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 04:30:08 -0800 (PST)
Message-ID: <e50fe7d3-0c73-d4af-9a61-74d1279202cc@linaro.org>
Date:   Fri, 3 Feb 2023 12:30:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] tree-wide: trivial: s/ a SPI/ an SPI/
Content-Language: en-US
To:     Mark Brown <broonie@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     trivial@kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org,
        netdev@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-mips@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-wireless@vger.kernel.org, chrome-platform@lists.linux.dev,
        linux-rtc@vger.kernel.org, linux-fbdev@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-usb@vger.kernel.org
References: <20230203101624.474611-1-tudor.ambarus@linaro.org>
 <CAMuHMdVeDbTGLBAk5QWGQGf=o6g25t341FjGTmNsHw0_sDOceg@mail.gmail.com>
 <Y9z0bQ8TeFROA0Fj@sirena.org.uk>
From:   Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <Y9z0bQ8TeFROA0Fj@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 2/3/23 11:47, Mark Brown wrote:
> On Fri, Feb 03, 2023 at 11:28:03AM +0100, Geert Uytterhoeven wrote:
>> On Fri, Feb 3, 2023 at 11:17 AM Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
> 
>>> The deciding factor for when a/an should be used is the sound
>>> that begins the word which follows these indefinite articles,
>>> rather than the letter which does. Use "an SPI" (SPI begins
>>> with the consonant letter S, but the S is pronounced with its
>>> letter name, "es.").
> 
>> While I agree with your pronunciation, I believe the SPI maintainer
>> (which you forgot to CC) pronounces it in James Bond-style, i.e. rhymes
>> with "spy" ;-)
> 
> Yes, I do.  To the best of my knowledge most people just say "spy"
> rather than pronouncing the letters or anything.
> 
> In any case as I said in reply to one of the individual patches English
> isn't regular enough to go with hard and fast rules on anything, and the
> letter rule is much more commonly used where something is needed.  Using
> an here looks wrong to me, and the fact that a is so widely used does
> suggest that usage has escaped whatever rule there is.

Indeed:
$ git grep " a SPI" | wc -l
131
$ git grep " an SPI" | wc -l
88

Ok, let's drop this patch.

Cheers,
ta
