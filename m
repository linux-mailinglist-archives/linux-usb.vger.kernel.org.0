Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 197A16B397F
	for <lists+linux-usb@lfdr.de>; Fri, 10 Mar 2023 10:02:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230297AbjCJJCi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Mar 2023 04:02:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230301AbjCJJBJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Mar 2023 04:01:09 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64EAB103EFA
        for <linux-usb@vger.kernel.org>; Fri, 10 Mar 2023 00:56:26 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id o12so17554679edb.9
        for <linux-usb@vger.kernel.org>; Fri, 10 Mar 2023 00:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678438585;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FTc8WfUJS5pE+gJh6hkTmvwpoZgYTgQwLH01UiXhOZg=;
        b=ViN+S4WXuglyR2uBtr+EvRXEI4vCdxTY/d41nwNFME843reyuLNTFuMZIg25I8vuss
         2ICKGF2ls/FrxbadwSh6U3CntGAGTKlBr69PXXsKsHOErXkyX2DAfGcbYohKvGMefCj4
         DpHgT3pGrHiEaNz/cdWfD2DhKVnTurrzJTUhEWty3kLtbWAC5nG3juAH1kUXR0+iq0MO
         Fuij61l9E2zJRK/3AQBh/i41ghpBmuMFs5igmHiij6ZP8VA50sfIqeivDUkiOi9bAeN3
         V/EPm5gktCSIxNbbfKeRATxF7vWzy/nQoOhY8JaayR14VSuXnroe6u0cByFMBLM4CK6P
         UQfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678438585;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FTc8WfUJS5pE+gJh6hkTmvwpoZgYTgQwLH01UiXhOZg=;
        b=3dqQ2dorePUCQq4iYu1psr1i0x0TMC6qHVGWtE2Bw5q8uHsyw9ec2YejdCbcxdscP9
         0ESjyQ6IZmba8tGwYy4x1hoRh78zEhuBkl+8kktUk/Oso/mMBTBUotag/b0r+eDJHUsA
         Zgyedn2JF6aiaNM89u2npXdMz6yLCwEdmY2brqVoU2ATbaC7aeE64WbzeUZEjGVMBfPi
         N/lTZjciG2tJX6YT9N5aGoDWgtlQ5qn+UZfjhwHuPYXs1qnKPKvHWpV9M4tk+F1z9VLI
         FaWsnPM3aZ1LGotRvqq31yZvo+BMgt/Ryezn7mtL2o7pge8UdkUH6UfX/cFZlsOgYiwz
         Mfqw==
X-Gm-Message-State: AO0yUKXJp1E10vSC0U2Y/8R+vyX8NRyaQjKCeaT5/VnbVjJh2d2wbl7K
        ypqLSrxGhynVPV6Q+K0Yt6IlRw==
X-Google-Smtp-Source: AK7set8oQbEa7aHmhTfe/KFEnNmpgd8Cm09atyHmqtwJySaJhkBT/4gR8InAUbnJ3CyZitaM9+lRkw==
X-Received: by 2002:a17:906:cccf:b0:8ae:f73e:233f with SMTP id ot15-20020a170906cccf00b008aef73e233fmr25072593ejb.32.1678438584872;
        Fri, 10 Mar 2023 00:56:24 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:2a59:841a:ebc:7974? ([2a02:810d:15c0:828:2a59:841a:ebc:7974])
        by smtp.gmail.com with ESMTPSA id bh11-20020a170906a0cb00b008d02b6f3f41sm685790ejb.211.2023.03.10.00.56.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 00:56:24 -0800 (PST)
Message-ID: <87f20b22-6305-7590-1dbf-014b5898b15c@linaro.org>
Date:   Fri, 10 Mar 2023 09:56:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 21/28] ASoC: dt-bindings: Update example for enabling
 USB offload on SM8250
Content-Language: en-US
To:     Wesley Cheng <quic_wcheng@quicinc.com>,
        srinivas.kandagatla@linaro.org, mathias.nyman@intel.com,
        perex@perex.cz, broonie@kernel.org, lgirdwood@gmail.com,
        krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
        Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com,
        andersson@kernel.org, robh+dt@kernel.org,
        gregkh@linuxfoundation.org, tiwai@suse.com
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, quic_jackp@quicinc.com,
        quic_plai@quicinc.com
References: <20230308235751.495-1-quic_wcheng@quicinc.com>
 <20230308235751.495-22-quic_wcheng@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230308235751.495-22-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 09/03/2023 00:57, Wesley Cheng wrote:
> Add an example on enabling of USB offload for the Q6DSP.  The routing can
> be done by the mixer, which can pass the multimedia stream to the USB
> backend.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

You still miss binding change to APR/GPR. Where is the USB DAI going to sit?



Best regards,
Krzysztof

