Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A7785BF7BE
	for <lists+linux-usb@lfdr.de>; Wed, 21 Sep 2022 09:32:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229783AbiIUHcO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Sep 2022 03:32:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230129AbiIUHcL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Sep 2022 03:32:11 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACA2B832C9
        for <linux-usb@vger.kernel.org>; Wed, 21 Sep 2022 00:32:10 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id c7so5867528ljm.12
        for <linux-usb@vger.kernel.org>; Wed, 21 Sep 2022 00:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=vm4eJTSpc6O1WAM7eQFYsV4Lw8COabTbtSgO8uczCo4=;
        b=M4G26pUd7wx0NR7FjV1bgtfFDzbOixM/IK3O+a35xXVzku5pXuQKodHrD08QdE+qt8
         MefOjT4B7Byct7QQEu2kDaIWU/JF3Vq+CqX+BqL2h2wyMP8XKG7mBbXM4z4ZJ4vUOzzt
         p/n4FeNjUTN75bmjxVPfFznXAJmOQEuEr/1gAi1hZjlIwKoq9kEupmOHygSI4xb3txLN
         qGhoKs4bOolDaIrymmn1EnZEye9HtczA9Xg0gDSwGYf4BZ+LLNZZFOgD6i6/n8Nh15z2
         JHk9lWPPGYdYzfZ+v/eCd5cfhS2M09hdK655zayT2Mvfb7AnaxqmSP9hkZExle6E2kgh
         pcTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=vm4eJTSpc6O1WAM7eQFYsV4Lw8COabTbtSgO8uczCo4=;
        b=1FectFwz+DAfMfBoY34XVrpPlNqSNDIBQtbVO+ehpLNRW7aPIjSMg+EOxVd4lMEgWA
         K7f+N9xSd5KWMDlEqNyEgvRFhLXNRxaLA/WHgfXnnl6hqIVsQoOeAcKwsu5thaBQKfuR
         3uCF9d1NXThXuWzwmbH7kxwjfA+dgPprcfItDk0D06gY25j1Z1GcO30fVGVmwuRCRMgF
         uxurXcK8BNIYWgg4+euiSy6OZTcnFkO4bMjU5uAp5qZSUaS8a1q1GLwYrILRdVRnLMgM
         strOjRa/0b6a/e3QJFJf18HwtydDR1n2BVpKEo3g5wnLz2DPompqicEr2IHyPpDD1hNS
         gzdw==
X-Gm-Message-State: ACrzQf1OYCat95GY+6pv08JEdxGEezDay/qkvS+QBkenMx5vlsY6+gbI
        /qLK3/C/uuLgqZ5RUv95YRWKyA==
X-Google-Smtp-Source: AMsMyM5FCiOeqrMuyCbj+xsJx+1/Q42dDN95D8GEYUkaF0/eIOZxtFl7SILU6Gi4T7/nzrRRziwrnA==
X-Received: by 2002:a2e:b8cb:0:b0:26c:47b1:211d with SMTP id s11-20020a2eb8cb000000b0026c47b1211dmr5464601ljp.95.1663745527584;
        Wed, 21 Sep 2022 00:32:07 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id p9-20020a2eb989000000b0026bfc8d4bbbsm310139ljp.125.2022.09.21.00.32.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 00:32:07 -0700 (PDT)
Message-ID: <efa1b1c4-655c-ceb7-47e5-61f91d86dde5@linaro.org>
Date:   Wed, 21 Sep 2022 09:32:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/3] dt-bindings: phy: qcom,qusb2: document sdm670
 compatible
Content-Language: en-US
To:     Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20220920224320.152127-1-mailingradian@gmail.com>
 <20220920224320.152127-2-mailingradian@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220920224320.152127-2-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 21/09/2022 00:43, Richard Acayan wrote:
> The Snapdragon 670 uses the QUSB driver for USB 2.0. Document the
> compatible used in the device tree.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
