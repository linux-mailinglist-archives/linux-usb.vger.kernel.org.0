Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1111B781CA6
	for <lists+linux-usb@lfdr.de>; Sun, 20 Aug 2023 08:31:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229869AbjHTGbO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 20 Aug 2023 02:31:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbjHTGbH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 20 Aug 2023 02:31:07 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 843991A2BD
        for <linux-usb@vger.kernel.org>; Sat, 19 Aug 2023 23:17:53 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-51d95aed33aso2812769a12.3
        for <linux-usb@vger.kernel.org>; Sat, 19 Aug 2023 23:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692512272; x=1693117072;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZQ1nYRNuKzvXKSJ1ECy3gTgL6Jh2qhzHxGDRD89KDO0=;
        b=UPnKsyXlucd7fKb/inJXMLnvSgc6dC0QJ4o6Xbk5yFefaG+r77JSWB9Fx7uto38wim
         gYv5PN6bPkOfichetuCwBApoMwbBsM2gdmSV1oMTPXcmjE9OFmFJ7dxxGAMMdvnYsuDR
         lsuScZch56UB4jknTSkDn0mnYyNw3hl3Fn7gUPPT57/5Qab8Jpr/7heo2Oa2yGSoOEG5
         RUNUA7GLqxhCzw6izKqTRudQcjNuqtpLuyK8TKWoQQiatIB6mgSrNv+siDMjd8x+7s/z
         bH+vPmKEIqqljf7IqHbVcAPSik+ufMM9HxRau4hLO5oXtVCdINhL0DV4dN4rKDiool4T
         Drow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692512272; x=1693117072;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZQ1nYRNuKzvXKSJ1ECy3gTgL6Jh2qhzHxGDRD89KDO0=;
        b=MBUQg0aaoCXrvf0Y1TuwA5aXd6IRm/OWkFvxVL+468n0XC3s/JTS5S6cKQ9orwmhba
         9Awsg2dME3RMpu9KWXrOSRtFdbdBidxIi9h3kTB4CE0wjOixMIDyLKK/9SfkoSOJghDW
         SOBtO5g7Hak7vbQ59z9RIUVVUlWFiR8wA3TmhTJd52oBfCOMZx1cycY8I3aAZBEUFds+
         DpYUPiATlxZoVVgJuWA1SG31c1v8X/nz+j6AIMDr7hYK6BlL5hKJEnz+5oSyrx+5Owev
         eETThNJqK5m9l5kBpTepn920VVXE2dUu05VorfmLirbke4WE7gifokEG5EvEHZ+H7LSF
         Z11A==
X-Gm-Message-State: AOJu0YyvaMYFilBmKMH1VgwYiIQTocOHi8O/avUMwxb1TXvYodKRaRdU
        Og8mSL/wPmvtgJ4Zucu4OkUUlQ==
X-Google-Smtp-Source: AGHT+IFjAhY9gZh9XQvcNI+E9OF/IidDB2rKdNsi5zZd1MIQSV1+pS6nhSrNZb9rtyxhjGkkLUVlxg==
X-Received: by 2002:a17:906:257:b0:993:f349:c98c with SMTP id 23-20020a170906025700b00993f349c98cmr2588851ejl.4.1692512271808;
        Sat, 19 Aug 2023 23:17:51 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id fy3-20020a170906b7c300b009894b476310sm3958202ejb.163.2023.08.19.23.17.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Aug 2023 23:17:51 -0700 (PDT)
Message-ID: <6f5fa43b-e9ec-ee7d-867d-c75bb0adfe6a@linaro.org>
Date:   Sun, 20 Aug 2023 08:17:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: Add ti,tps25750
To:     Abdel Alkuor <alkuor@gmail.com>, heikki.krogerus@linux.intel.com,
        devicetree@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        abdelalkuor@geotab.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1692507038.git.abdelalkuor@geotab.com>
 <fc8a793aad8a84ee4658e630b7be2b04925a66c5.1692507038.git.abdelalkuor@geotab.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <fc8a793aad8a84ee4658e630b7be2b04925a66c5.1692507038.git.abdelalkuor@geotab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20/08/2023 07:23, Abdel Alkuor wrote:
> From: Abdel Alkuor <abdelalkuor@geotab.com>
> 
> TPS25750 provides power negotiation and capabilities management
> for USB Type-C applications.
> 
> Signed-off-by: Abdel Alkuor <abdelalkuor@geotab.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


---

This is an automated instruction, just in case, because many review tags
are being ignored. If you know the process, you can skip it (please do
not feel offended by me posting it here - no bad intentions intended).
If you do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions, under or above your Signed-off-by tag. Tag is "received", when
provided in a message replied to you on the mailing list. Tools like b4
can help here. However, there's no need to repost patches *only* to add
the tags. The upstream maintainer will do that for tags received on the
version they apply.

https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577

Best regards,
Krzysztof

