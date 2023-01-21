Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34F1A67681E
	for <lists+linux-usb@lfdr.de>; Sat, 21 Jan 2023 19:52:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229744AbjAUSwc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 21 Jan 2023 13:52:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229636AbjAUSwb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 21 Jan 2023 13:52:31 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0002C1DBA3
        for <linux-usb@vger.kernel.org>; Sat, 21 Jan 2023 10:52:30 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id h12so3484751wrv.10
        for <linux-usb@vger.kernel.org>; Sat, 21 Jan 2023 10:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ngf6C8Ou5uJHgmljPhG4Mf0c9oFhFgcZFIr9zgd3T8c=;
        b=bYaqz0tj/Khn6++kyaUpS1/DBgHHbdkXu/iYga3bJujcGvaNivFLj/wCCwYshgmKXh
         SikdpW5/jueLQs/LlQNXMWq3DmUQLI8uqNmjo/9Brafxd1AIKLcPhOFfPJ1qsU2shB1Z
         r9DIjgsuDBGX/vxZvfYqE3BlM3WSdXyl6XNSAk4cDv+8dBay1oDwim/fQyv7QktQ/V/p
         tfLm0xLmlQyIvrmhq4CBWdntwVyIEBNFZI6E04rBQwO/4YPCdulPs4KgkvTFk/vnPgRn
         3YfImXnEli83KmYTWx25u2DMqmXyX/ME+g8IU44tnNzoNdsIsGPSFnEsj7MXs4YTgNap
         XmqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ngf6C8Ou5uJHgmljPhG4Mf0c9oFhFgcZFIr9zgd3T8c=;
        b=LVonbponC5QGky0FOI+C/m2Io0FRI4jeP9cI0CL3eZarlPQjHQgZJILkpux2z+BLqB
         t6QRDIMq5NJ+c5ei0eZMKCWiY4RLNTTC739vhumU9h7WVacgKNC+8C8yWGIfIJ+UCeIm
         5yMtn3WVuyQzTv/pR4pglpV2ExfbgGaq/xbVfEfreLtT7zHcdQbD56SV19mejNErcgkY
         Z6bcK0Xm61ILhZmylvy2lyVVCiOsyEjXrUwFZp+uYu5OOYcL6g0LEc3AsDOjMRaGQhTR
         aDtMjcn+8rmfOx16I9yWbCtDM6uPFhFxWOlVttTa++z9o+OiKsx41hwz0qDhEKIZCAdR
         TvnQ==
X-Gm-Message-State: AFqh2krifwrYB1NeR5VoRUYt1Y+YPjKaWGI9aQsCdMdu8BwQyny/xE5v
        igCy36W4TJfdZAX7sFqqQ5zEGw==
X-Google-Smtp-Source: AMrXdXv8n66dcnGj8QTsiWJKzX1M9YdavoiJFsFZ/FkXTfi2l2iPlyG1ie/uLmMptiuTN/VmbYyZcw==
X-Received: by 2002:a5d:548d:0:b0:2aa:438a:2165 with SMTP id h13-20020a5d548d000000b002aa438a2165mr15730125wrv.24.1674327149444;
        Sat, 21 Jan 2023 10:52:29 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id bw26-20020a0560001f9a00b00241cfe6e286sm245062wrb.98.2023.01.21.10.52.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Jan 2023 10:52:29 -0800 (PST)
Message-ID: <df1c8545-01d0-3821-0c19-07a369e40472@linaro.org>
Date:   Sat, 21 Jan 2023 19:52:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v3 6/9] dt-bindings: usb: Add Via lab VL817 hub
Content-Language: en-US
To:     Anand Moon <linux.amoon@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-amlogic@lists.infradead.org,
        Matthias Kaehlcke <mka@chromium.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230121175639.12818-1-linux.amoon@gmail.com>
 <20230121175639.12818-7-linux.amoon@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230121175639.12818-7-linux.amoon@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 21/01/2023 18:56, Anand Moon wrote:
> The VIA Lab VL817 is a USB 3.1 Gen 1 hub and USB 2.0 hub
> controller that features 4 downstream ports and 1 otg, with
> an internal 5V regulator and has external reset pin.
> 
> Add a device tree binding for its USB protocol part.
> The internal LDO is not covered by this and can just be modelled
> as a fixed regulator.
> 
> Add combo of USB 2.0 and USB 3.0 root hub using peer-hub.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> v3 - address review coments - Krzysztof

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

