Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83BCB6F202F
	for <lists+linux-usb@lfdr.de>; Fri, 28 Apr 2023 23:41:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346500AbjD1Vlp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Apr 2023 17:41:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346186AbjD1Vlo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 Apr 2023 17:41:44 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1D712696
        for <linux-usb@vger.kernel.org>; Fri, 28 Apr 2023 14:41:42 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-2fbb99cb297so208518f8f.1
        for <linux-usb@vger.kernel.org>; Fri, 28 Apr 2023 14:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682718101; x=1685310101;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E1Eb5RgOQ6G6T/ToVAmMxv+nVh8+Egk1H9oMyEZ/kPI=;
        b=B/Iiy08dVrTDqQP14DEVLVYhm+dghBPD41nm5Po2ZOuME8qd4mRykxC/KUS1dma/B8
         OYe4mDjjXpKf/mjMk/TINQ2iqlM7f9KPy3QRKOW4LctPN9VjIQFkKZ9bMxW3L71cjS4n
         5Vg0L1BGlUKVQxuvhloewhVnEI5cwoh1WLquTnvm8+uN8LOIW8L5mxApE/yg0hq+CPvf
         AxJx5nX4jrGwm5xKVJ4ZcxJLOV8AzTqeA5Rlp/1R318ochH9XwDOwv5ykAM+4socbTnM
         3GDRpzhwcs1Yc2y0k6suRwULbbgiY2ZDeB51EF4xiUDHCQlaAuVq2nInSiOXRthJQS+q
         hOgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682718101; x=1685310101;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E1Eb5RgOQ6G6T/ToVAmMxv+nVh8+Egk1H9oMyEZ/kPI=;
        b=a2W0hdKD2AzoGAE6kLRh3HtIvLhpPAPDLMRiFBvzOqz07MaHoRX5Ha/jkDgyG+HQ6+
         WNmZsvae/uK7UqPBb8SOiettj3WKGqjabRAphc6s1txXOoFxr6Sb8beoZl2jo24dm2Qr
         +KnqmDODobaj53vQ+5A2HIpYTAdSWzguyCxDGXVv4Jbo5zahBOdxIYGowL55Cu8eOorR
         S6TXZeHouFNc72KmPsvNM/9n4jiAID12aWkaKFjzpXdVU5QVl4AUwvdL3RudS7rvNIg5
         X/QWaeWQvl/tn9jmPBWaonfn+y7yDTb9vfHYo0bulq4n656XbpKzTAyAqWO7Fj+CAlQn
         KWGQ==
X-Gm-Message-State: AC+VfDz7R8dMsRmRxTsiC851okXpWL7+nt/anj9mJW4JhDaT4VPqEgnk
        FFFqwj2V4DbiigQ1vfUsuB7QJA==
X-Google-Smtp-Source: ACHHUZ5RGdr21sjT6mATshpr/YItNaJEnWe3GQDudidU/5n3YX0H1yKJh85dhh6eziC69IuYXUMV6Q==
X-Received: by 2002:adf:e481:0:b0:2ee:f1f0:14bb with SMTP id i1-20020adfe481000000b002eef1f014bbmr5138651wrm.49.1682718101303;
        Fri, 28 Apr 2023 14:41:41 -0700 (PDT)
Received: from [10.6.26.43] ([212.140.138.202])
        by smtp.gmail.com with ESMTPSA id d15-20020adfe84f000000b002fb60c7995esm22205929wrn.8.2023.04.28.14.41.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Apr 2023 14:41:40 -0700 (PDT)
Message-ID: <3dc6e993-bcca-4e0d-5aca-686fcc8b5b73@linaro.org>
Date:   Sat, 29 Apr 2023 00:41:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v1 0/6] arm64: qcom: sa8775p: add support for USB
Content-Language: en-GB
To:     Adrien Thierry <athierry@redhat.com>
Cc:     Shazad Hussain <quic_shazhuss@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20230421133922.8520-1-quic_shazhuss@quicinc.com>
 <ZEcEGJiikEC2wIVE@fedora>
 <CAA8EJpr27=2jAXbamN6J7yF+7G=L5Af8+XReB5UnFuihcEwMQA@mail.gmail.com>
 <ZEgV+H3yZLp48Dlc@fedora>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <ZEgV+H3yZLp48Dlc@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 25/04/2023 21:03, Adrien Thierry wrote:
> Hi Dmitry,
> 
>> Semi-random suggestion, but could you please try using
>> clk_regmap_phy_mux/clk_regmap_phy_mux_ops for USB pipe clk src?
> 
> Which specific clock are you refering to? I'm not very familiar with
> those, in the device tree I'm seeing "pipe" clocks for usb_0 and usb_1
> phys, but not for usb_2, which is the one that's causing issues.
> 

Ah, I see. Could you please try adding the 
'qcom,select-utmi-as-pipe-clk' property to the usb_2 host node and 
running the test again?


-- 
With best wishes
Dmitry

