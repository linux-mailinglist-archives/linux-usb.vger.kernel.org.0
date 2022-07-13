Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15FC2572FD6
	for <lists+linux-usb@lfdr.de>; Wed, 13 Jul 2022 09:58:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234967AbiGMH6a (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Jul 2022 03:58:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231410AbiGMH63 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Jul 2022 03:58:29 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71C7FDF389
        for <linux-usb@vger.kernel.org>; Wed, 13 Jul 2022 00:58:28 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id o7so17753043lfq.9
        for <linux-usb@vger.kernel.org>; Wed, 13 Jul 2022 00:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=rq1o28qxJyZcI90zoJpXwu74Pj76PJ2bQ9VI9gVIlf4=;
        b=XWaUVoWuXAJFmvfGSdO7PMUZsh5BaOqlMeJztnm3q0aJW2ZhY3Dx9jC8F+26HjVApM
         3O1KY1yuoQWGB672Pp42Y2517T/WhcvvSdsB3pTNFbBLIP6/BxxjzIjfzIrM0S2Hp6Q6
         hm3pEhImXSOpQ5xm9sS7qHSFltriDYR7P1sp6AhDoqs97UZYvQf/FUZBBYow0U2si6y5
         mvYKlS/18p1eOSP3ffTJUc9AH/zJJwb3xTq+/dznQp373PsS0IvxRv4nbhaHIP4GEYjm
         U02AAExslgp2BErYvb0qXZKa2FgBTAg4/3uXXzNwHtX5mX6X4Bd/1S6GI9PKDwqRNblY
         IVew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rq1o28qxJyZcI90zoJpXwu74Pj76PJ2bQ9VI9gVIlf4=;
        b=1dmdRHj3xeg36RSZBKGDPOROXn6lGppHdTvoBF6F4tePnyMyhX0gbwhN5EQi8o/7VA
         PaHnFMUNCQ6L/vaKfP6wNUReO76+hlCVGfEn9K+8mqwFmEDKgRKDqEKzgTJoD+Pl1Ap1
         W/p/x2Jf5qHW0fDXndizyv/kzynyb5f3u0blC+uO/pMbmUAAfO6iiau0mg5WfrIPVn6+
         Ud7oB7wUZT8NhcHetAsgHXUNVZLM/Qlg3sWpVvFXSq5mGDKFYlvZbvBBOnONUN+uAY9n
         Rzbhr5lcfCYqZj0XGTD7rDqhu+Lc8iM0cG6T6rlU6IPwPYdS7Oy1FYSwxBL1VWbCy8Ut
         D5OA==
X-Gm-Message-State: AJIora8FgJKtwjjNxRI98tToVOYnOd0f6ATuX0pD/0KSvQHQMHvCDebA
        G+d7WSu8LaeOw19jH8uaGRD9Og==
X-Google-Smtp-Source: AGRyM1undO3KB+PstkyxNyjlnzgnT5GPZ39FhG7yap0AtX8YKpRcMsUwtFRgQYbn4az+YD0Wnpo1Hw==
X-Received: by 2002:a05:6512:ea1:b0:489:2930:9f1a with SMTP id bi33-20020a0565120ea100b0048929309f1amr1272396lfb.291.1657699106732;
        Wed, 13 Jul 2022 00:58:26 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id v8-20020a056512048800b00489c59819f0sm2639998lfq.282.2022.07.13.00.58.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Jul 2022 00:58:26 -0700 (PDT)
Message-ID: <49fedd88-9a63-f9ed-0e92-837ac6e7e763@linaro.org>
Date:   Wed, 13 Jul 2022 09:58:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/3] dt-bindings: usb: Add binding for TI USB8041 hub
 controller
Content-Language: en-US
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
References: <20220712150627.1444761-1-alexander.stein@ew.tq-group.com>
 <7c838790-1dd9-732a-e5cb-f2ea6454411a@linaro.org>
 <8966410.CDJkKcVGEf@steina-w>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <8966410.CDJkKcVGEf@steina-w>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 13/07/2022 09:20, Alexander Stein wrote:
> Yes, 'make dt_binding_check' does not raise any error about this binding.

Yes, I know. reset-gpio is still accepted, but the preferred (and
documented) naming for all GPIO properties is always "-gpios", even for
one-GPIO properties.

Best regards,
Krzysztof
