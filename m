Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69D816D0B5D
	for <lists+linux-usb@lfdr.de>; Thu, 30 Mar 2023 18:33:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231521AbjC3Qdd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Mar 2023 12:33:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230427AbjC3Qda (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Mar 2023 12:33:30 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6358DC167
        for <linux-usb@vger.kernel.org>; Thu, 30 Mar 2023 09:33:29 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id d17so19692853wrb.11
        for <linux-usb@vger.kernel.org>; Thu, 30 Mar 2023 09:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680194008;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uTAy36BLiNsY+GkgrBrUwBdOqLgTRdyYQkO3DlArkGg=;
        b=ykj9ItrhNGUbv3CLkEnrHIDWenINsrAnNwTGgbRlrB7UtpwbpGwUJG3pPRS0Q3Gjsq
         C0za0JX1ykye5t24XjVKO+IxqsIgdWPisYLm0N3ihpp4+IEzA49R7J/xoRALzmX1oQG7
         LKKTPxPyFWJUnxsDF1aGcfKxEwiWlHRNle9zG2xIXb4VumSEuG00LzhyJaeDmmu1APrA
         l4h0dSuOwE+DjnK7DNPSX+x+cW0zXAkxsJZ5PMym8eb7s5rnF6mRNzFCCQoii+JKEjTI
         qpPNAm4oGkElOk/1g1b+gSN4eocx1J8w1cc9cds4XalHSK0cxhMyMLq9XdwuIKHE4Lj1
         J5Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680194008;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uTAy36BLiNsY+GkgrBrUwBdOqLgTRdyYQkO3DlArkGg=;
        b=m3mohIkt+PYOStT6uRmZAf4+mBdzByv2H0LjsMQL9eY+Uj1CKqXpxoCL4J55nVyxey
         jgDWF2Zh9yXyxJKNGZCjbuHET1K1MQ581jYUR+hnw5DJ/jXDU6u/0whRHkwAamdra6VM
         IwmjD9K5ClIDJzXzh14+6ji18G0TOKSF/thc/EcOMIkUeGwZlW/zM56HAJ6dHivjAVAC
         6STxNFOG16Dz4ggKhn8tT8dLcfT84/1mY0Em4qwuyueZi6yoheVqMDidxIDug1Lg+8dE
         YnPVOwPL5s4MfK0ZvVvzadUbUN8ztC3H4LGNp2xQ/giT+4nnAnTssOMCFaJDP3jYhzCO
         DeIA==
X-Gm-Message-State: AAQBX9ch7PRqZQvIGfmE7Nv7lzIPwZdug4Zy4I/jscF23LjhRlP42rqQ
        w3r5WEhBYeqcHDTxCM5ODJQxDQ==
X-Google-Smtp-Source: AKy350bcRapicwm5w7+VNlWB7IP7tnaAHFf7ULeuGrQbhL5+YP/wpni6b+q+nRFmJNuZzpji+lzLxQ==
X-Received: by 2002:adf:e4cb:0:b0:2ce:bd2e:1fea with SMTP id v11-20020adfe4cb000000b002cebd2e1feamr19906723wrm.26.1680194007864;
        Thu, 30 Mar 2023 09:33:27 -0700 (PDT)
Received: from [172.20.10.2] ([37.166.66.243])
        by smtp.gmail.com with ESMTPSA id a4-20020adffb84000000b002d322b9a7f5sm33209463wrr.88.2023.03.30.09.33.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 09:33:27 -0700 (PDT)
Message-ID: <d099f038-7c73-9765-fa4e-c245bf8d0951@linaro.org>
Date:   Thu, 30 Mar 2023 18:33:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH 2/4] arm64: dts: qcom: sm8350-sagami: Add PMIC GLINK
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20230321-topic-sagami_dp-v1-0-340c8bce4276@linaro.org>
 <20230321-topic-sagami_dp-v1-2-340c8bce4276@linaro.org>
From:   Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20230321-topic-sagami_dp-v1-2-340c8bce4276@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Le 21/03/2023 à 23:12, Konrad Dybcio a écrit :
> Sagami devices, like other 8350s, uses PMIC GLINK for various
> functionality around battery, charging, TCPM etc. Enable it.
> 
> Worth noting:
> My USB mouse is unimpressed when connected to the device via a
> non-powered USB-C dock. Microsoft HD-500 dock refuses to estalish a
> PD handshake.

That's interesting... perhaps UCSI is required here ?

> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   .../boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi   | 60 +++++++++++++++++++++-
>   1 file changed, 59 insertions(+), 1 deletion(-)
> 

<snip>
Anyway:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
