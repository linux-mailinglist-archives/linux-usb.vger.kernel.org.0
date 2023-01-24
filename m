Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36CB0679D39
	for <lists+linux-usb@lfdr.de>; Tue, 24 Jan 2023 16:18:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233949AbjAXPSA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Jan 2023 10:18:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234471AbjAXPR6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Jan 2023 10:17:58 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41A5865B1
        for <linux-usb@vger.kernel.org>; Tue, 24 Jan 2023 07:17:52 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id bk16so14196987wrb.11
        for <linux-usb@vger.kernel.org>; Tue, 24 Jan 2023 07:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P2VSIRQ0sM1vpHuf8rla2J/YgrIDXTW4aHVMtNxKuzs=;
        b=E0vtUfGK8Xgmn95qAj3P+4mKS2op5T6PfCq/IoA3n3HfdQ143BRpsqzwpCdU1JDSoR
         XdkZfIWTqv7xfBwmxEmitd7mqjwpIc3/onc81/cvxT8LyUYQkAq4pd1bq3Hoikqzw7t+
         ZdzRdS3gBlWoTpM5jVLcydnUdC4DcYfpLrYD9zehs/8ZDjbq4ABgjs0NrtRCbg97z9aq
         gY0UHZdcwvYYIpGgszUQVqNUDCD6wp0VGQxk81C/4RMEiTiynDbQ3yYd05FEWDASMrsM
         CnntpL95bt90ccpOBbj8xwehvPTRoaTaA48VtgIzU8eisp1XvloCZJdB5uwP+D7xLXO0
         fUug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P2VSIRQ0sM1vpHuf8rla2J/YgrIDXTW4aHVMtNxKuzs=;
        b=uBglg6HU8C5bPMtIKMMtXP0juJkwClDH+AaYNQDbDCRFucKIkx7XgGgkYe1a41Tc2Y
         ajpY3c0/dlcYdiNrHQ2k/23Z12Bc30zRjM+SQ1fv+UahJAg+FikQumhzKQfk3lwXvOsw
         iZbnd54lHxetavoUvxtdULAP+TiOLueb00Fg/uVF3UNSI0YkZsHEFmqsdXyoLIyX3unO
         TgoSvJMYQGaYtKC8gCG1ghBc8A4jid0HI3Yxi96TmSNgCFeMRCcKExvCDYyAvE/rxs7/
         2pQ0pQDwzUVuVmIt5PQqbTTX5ig8Vtm4m+5j7itHRcUqbGDLYfmG5Vcv5UuWIZpBfBhY
         Ra1w==
X-Gm-Message-State: AFqh2kocU4HQqQ/Pd1zSDGzfphAxTukTkoMPXLJh5QLrMkQDIQdco/ag
        5calrsinBYTX478e8XYUSBIz4g==
X-Google-Smtp-Source: AMrXdXsf+Cciqhme9ccOuJdxb626GrgOW7aBLMFfulcKCQgwB+siVPDLksLuWgH9yLYS2T/mc64t4g==
X-Received: by 2002:adf:c7cb:0:b0:2bc:48b3:f6de with SMTP id y11-20020adfc7cb000000b002bc48b3f6demr29408935wrg.0.1674573470736;
        Tue, 24 Jan 2023 07:17:50 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id r1-20020a0560001b8100b002bfae16ee2fsm2024181wru.111.2023.01.24.07.17.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 07:17:50 -0800 (PST)
Message-ID: <f14428c8-d059-2bd0-49f0-5b05cb5bc7f8@linaro.org>
Date:   Tue, 24 Jan 2023 16:17:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH linux-next v4 4/4] dt-bindings: usb: Fix device tree
 binding for VL817 hub controller
Content-Language: en-US
To:     Anand Moon <linux.amoon@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230124144054.13556-1-linux.amoon@gmail.com>
 <20230124144054.13556-5-linux.amoon@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230124144054.13556-5-linux.amoon@gmail.com>
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

On 24/01/2023 15:40, Anand Moon wrote:
> Cleanup by removing unneeded quotes from refs and
> add maxItems to reset-gpios and fix the required list.
> 
> Fixes: 31360c28dfdd ("dt-bindings: usb: Add binding for Via lab VL817 hub controller")
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

I think it's the first time I see this patch. Where did I review it?

Use subject prefixes matching the subsystem (which you can get for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching).

Subject: drop second/last, redundant "device tree binding for". The
"dt-bindings" prefix is already stating that these are bindings.


> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>  .../devicetree/bindings/usb/vialab,vl817.yaml  | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/vialab,vl817.yaml b/Documentation/devicetree/bindings/usb/vialab,vl817.yaml
> index 5f9771e22058..23a13e1d5c7a 100644
> --- a/Documentation/devicetree/bindings/usb/vialab,vl817.yaml
> +++ b/Documentation/devicetree/bindings/usb/vialab,vl817.yaml


Best regards,
Krzysztof

