Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4833367167F
	for <lists+linux-usb@lfdr.de>; Wed, 18 Jan 2023 09:49:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229694AbjARItS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Jan 2023 03:49:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230060AbjARIrv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 18 Jan 2023 03:47:51 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EDA494C80
        for <linux-usb@vger.kernel.org>; Wed, 18 Jan 2023 00:01:31 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id l8so6893210wms.3
        for <linux-usb@vger.kernel.org>; Wed, 18 Jan 2023 00:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=llEHH2X8WYjCXN5EajkQx0NmyFU5CB3GauQfrzlzUfM=;
        b=DzCw2fte32eiG1bD/c2WxEJDdqc03pd/smpQy5Xe69dqzm+v8lnNYVIhQMh3DDA++D
         WosxvAmUePjR1aTlOKTGRl6v/dGGlHgqP59WKv+5JEZtnboRqTuMzDXOA/ARGMEbVdHM
         1EFLiWrnjODDLQi6qmdtgr8UpZcC5OHQwkEc7JJJpBSH3Ki0YGFCjUfKOOK72BsGQlDw
         Zpxw4YQ64NMDmwxXDcrfxBQR0lOc/n4ZMbBHpU/TgyLf3RhUnA6phj0veX1Hi41+jVkH
         Zbrh75qZnE+HrVS/Ovw3c1PQiSZiLLAyLfEBJWK0ocpKIBMF3syNF9DReITDQ2jUxErO
         DH2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=llEHH2X8WYjCXN5EajkQx0NmyFU5CB3GauQfrzlzUfM=;
        b=DjCf9ecKliyY+0J5SaIo55ssbNW3TJ70/RFR7ddpuz0Pd+oqvL5M2iRPdhp0H6gSkx
         d1ukzhat6n9f1XXaf3C+NjPqYf0Xdo0A5+5nkFVcto1nTN7HBr/Cv62u4paancXoEust
         JrJVmP0DDPxo0KxgmaRXnkoaRwiPBNu8YTU+JZR5ATau2w5QwbtPHYe5acYGEBhyJ1nR
         sSteAPtPupn+AIxtxOH1/o++9SoED0DNpRm07cgBOCzs31xyHfx9139rZvKq+nLwh/vN
         sS+TTf5mu/weVTaAe4NFyCoLRIw4eRkxwQE4MqxGTIEXzmCetGGHNtvxnmwN4cHvPWfz
         rkfQ==
X-Gm-Message-State: AFqh2krug60sNz84sW3724fDpsA/i4jZJglq18u74vNn0s1sXFOHkBUK
        I0Zi75lKIbcczfiW5NJnYSL1Yw==
X-Google-Smtp-Source: AMrXdXsBm07vZ/d2UAeyEvvURmGEk2oDPIpzcB6e7R/pDb+FAB2KhifAcPkhBzmj2IsiO5Ng5pv5Ew==
X-Received: by 2002:a05:600c:1d92:b0:3da:1145:2196 with SMTP id p18-20020a05600c1d9200b003da11452196mr14278480wms.39.1674028889776;
        Wed, 18 Jan 2023 00:01:29 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id j17-20020adff011000000b002a64e575b4esm31092111wro.47.2023.01.18.00.01.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 00:01:25 -0800 (PST)
Message-ID: <5d8fcc52-a1ca-e23b-02a6-120fbe9c30d2@linaro.org>
Date:   Wed, 18 Jan 2023 09:01:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/7] dt-bindings: usb: Correct and extend FOTG210
 schema
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Fabian Vogt <fabian@ritter-vogt.de>
References: <20230103-gemini-fotg210-usb-v2-0-100388af9810@linaro.org>
 <20230103-gemini-fotg210-usb-v2-1-100388af9810@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230103-gemini-fotg210-usb-v2-1-100388af9810@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 18/01/2023 08:09, Linus Walleij wrote:
> It turns out that this IP block exists in at least two
> incarnations: FOTG200 and FOTG210. The one in the Gemini
> is FOTG200, so add the variants and rectify the binding
> for Gemini.
> 
> This affects things such as the placement of certain
> registers.
> 
> It remains to be seen how similar this block is to the
> third USB block from Faraday, FUSB220.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Drop stray word "bindings" in description


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

