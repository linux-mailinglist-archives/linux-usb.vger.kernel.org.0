Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C14752CFB5
	for <lists+linux-usb@lfdr.de>; Thu, 19 May 2022 11:50:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236287AbiESJt5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 May 2022 05:49:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236279AbiESJty (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 May 2022 05:49:54 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95F806EC61
        for <linux-usb@vger.kernel.org>; Thu, 19 May 2022 02:49:51 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id bu29so8228214lfb.0
        for <linux-usb@vger.kernel.org>; Thu, 19 May 2022 02:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=3HichTrqN7F9p1vtnqjU5qG7qAFUNf2AyIapQ12NpO8=;
        b=pj52zUeXesTLyc14JaXUdAxTtMtGZg3T2DIN7nnsHPu4wc7dPGcrZgTVR6iYcfDcEV
         0KHIB957wnozL49rQMLpSyaoT/OxqPlNgY/1TtBfop9FgGdEidY1e+g3aLmDcE3WyuEf
         AeJiSSJrjqV+sD3efpF3U55A8l67ZjfE/p/FbYBYzeNWCajdGFi8xZBgMTZBl52SlqjR
         B/AV/ORXHNl+c7f4YUThrLOVDVfGs5+v0yXM133bZAuzgCPehiDH+ir9f/HT3VhRvbva
         ABJPXYJczVzo9npFPu0g1whzQBoFZQUH0oXbTk6wfkOz6A68etpse5pby80OUhDfUrQs
         77PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3HichTrqN7F9p1vtnqjU5qG7qAFUNf2AyIapQ12NpO8=;
        b=QMFFYj54TJfkOulspoamu5YiCNUE29BvFbBCGkT0yxIQKc5/yf93PbsqQpW61MQAzb
         LN8I4T4oQyxq0fCkkDEowc4DljE7riEzedWmGSW44bBqYgiIRdfVqMYJ/AKTgoYQUp1y
         tncpER8qI8Qh0VlQYQQXawGY9Pch+IF8zajhdFuAfjFQcoKy7/4ExxYq+0PQp86HnfZr
         u0JycAmNtTNbLAopsSjEqVf306+EtxN6s3QCsx/6e+/Wx4YHoPLEq8b9s4xolOfHNiG2
         9JS2u0JyYjlQKqoPQj+tyR1vHHG3G6c5JyXoAjzMF5SmEUtNmDWq5WyYbA+Rut8NXOSc
         dv5A==
X-Gm-Message-State: AOAM532CM9UZIOvf4zgjMzBl3hAlIDhBlH7iO+qOm6ju1N+HK9ArYpSG
        jnM2LaSP1Yn1b6cdDRcIaJIQdQ==
X-Google-Smtp-Source: ABdhPJwbFiP8G5XIBQ8Y6aMcJ9tjLVMxwvS1jPlinGma7O6miaJ7rs+vKHNMkbhuXXrYedSK3N/XsQ==
X-Received: by 2002:a05:6512:32c1:b0:473:dade:84e8 with SMTP id f1-20020a05651232c100b00473dade84e8mr2704281lfg.652.1652953789533;
        Thu, 19 May 2022 02:49:49 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id j9-20020ac253a9000000b0047255d210f0sm232517lfh.31.2022.05.19.02.49.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 May 2022 02:49:48 -0700 (PDT)
Message-ID: <4183e3fb-6fe2-ed81-2d75-1b3865b191a2@linaro.org>
Date:   Thu, 19 May 2022 11:49:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v6 1/3] dt-bindings: phy: qcom,usb-snps-femto-v2: Add phy
 override params bindings
Content-Language: en-US
To:     Krishna Kurapati <quic_kriskura@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, quic_pkondeti@quicinc.com,
        quic_ppratap@quicinc.com, quic_vpulyala@quicinc.com,
        Sandeep Maheswaram <quic_c_sanm@quicinc.com>
References: <1652934489-23386-1-git-send-email-quic_kriskura@quicinc.com>
 <1652934489-23386-2-git-send-email-quic_kriskura@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1652934489-23386-2-git-send-email-quic_kriskura@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 19/05/2022 06:28, Krishna Kurapati wrote:
> From: Sandeep Maheswaram <quic_c_sanm@quicinc.com>
> 
> Add device tree bindings for SNPS phy tuning parameters.
> 
> Signed-off-by: Sandeep Maheswaram <quic_c_sanm@quicinc.com>
> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
