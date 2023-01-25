Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A4C067AB17
	for <lists+linux-usb@lfdr.de>; Wed, 25 Jan 2023 08:40:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235097AbjAYHkq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Jan 2023 02:40:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235044AbjAYHkp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 25 Jan 2023 02:40:45 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BADD7DBD
        for <linux-usb@vger.kernel.org>; Tue, 24 Jan 2023 23:40:43 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id bk16so16099525wrb.11
        for <linux-usb@vger.kernel.org>; Tue, 24 Jan 2023 23:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wd7gzCX71rjuNYdlTHla5Ym+Gcp1RjzGYtvczmvc1+8=;
        b=btWMU7bEVv3UrLRfMmw8ezB26D0pC8Kwa/5Xpx3l9K1KTg0cd6Rs9HIStVu63EvDY0
         paTuzw5U6YQJC6lxV+m02dUneuSaZeJG2jyk56RcgIFzkbCrhPbpz4pOPQ3wAld7HEt8
         Y28QFuTJ/mKWB1jA5yExhvnc3cKY/hypZ7KlMRpRSb57S62ggYUfYc6iZ02dish6f23n
         ozq3mXD/bR9b01kGF8sTPGMtLg/85ZPk24HODBR9Or06DBc7xnaI2hiWHEcF0Cz8HB1Z
         8TQ8gs8g66pgkm4SuN5U/U5Rqs58vCXvo9800W7gfCSexXFru1oz98PJGyJVRgN6zQ8N
         daHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wd7gzCX71rjuNYdlTHla5Ym+Gcp1RjzGYtvczmvc1+8=;
        b=PhpOpxHzgubbE2gHsDBkffvAV7vuEbkjkdlWxZODOzk8SQwDoDWZe+eOlsy03xWGXw
         aEsjUptBJMze6omm1Ia+AT689z5Jki8Ny1ih/kmUIVVztJ+zONnFKUHSJZB56CMqSz56
         3CDfbymHJ6wk6yzW/0uGdQeZR4ny9i9kZgq9yLSUOUI2JUTtxPnEAEFVdwuRZMsPuTcE
         iHaUpGIqaYQfgLakknhH2gBLyQ75S2ZXrhMCFdqhKx+zYDAJZ8tpEF9FkrfdIvx9xha7
         TEX5wOwGdB4suGRVYZS91PJKxBpWzglQGcBb2JzEuvddCZQkRlSaWCS1v186Nl9kA3aS
         GWhQ==
X-Gm-Message-State: AO0yUKXCOmvrqWt032CuPSVlRM03bvxBFjBZg4YTA6HUK2tZuhGrKI8v
        61kRfdGY0zT16gZiv6jqvrXQg62hHJL9w5JX
X-Google-Smtp-Source: AK7set9MGJM5OP1q8wasTpuKj78pQJjsANObH5xYeJOBh8Cb1RjSwSB+qvvh3JFGzmLws8Rtz4kekw==
X-Received: by 2002:a5d:5229:0:b0:2bf:b54b:6ed9 with SMTP id i9-20020a5d5229000000b002bfb54b6ed9mr2708575wra.15.1674632442069;
        Tue, 24 Jan 2023 23:40:42 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id s8-20020a5d69c8000000b002755e301eeasm3662273wrw.100.2023.01.24.23.40.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 23:40:41 -0800 (PST)
Message-ID: <bd29cba9-fb1c-051e-e10e-cb3e73ec5ff9@linaro.org>
Date:   Wed, 25 Jan 2023 08:40:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH RESEND linux-next v4 4/4] dt-bindings: usb: Fix properties
 for VL817 hub controller
Content-Language: en-US
To:     Anand Moon <linux.amoon@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230125072605.1121-1-linux.amoon@gmail.com>
 <20230125072605.1121-5-linux.amoon@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230125072605.1121-5-linux.amoon@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 25/01/2023 08:26, Anand Moon wrote:
> Cleanup by removing unneeded quotes from refs and
> add maxItems to reset-gpios and fix the required list.
> 
> Fixes: 31360c28dfdd ("dt-bindings: usb: Add binding for Via lab VL817 hub controller")
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

NAK.

You ignored my feedback. Please help me understand how my tag appeared here.

Best regards,
Krzysztof

