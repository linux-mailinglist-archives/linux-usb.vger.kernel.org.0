Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 097B56DAE74
	for <lists+linux-usb@lfdr.de>; Fri,  7 Apr 2023 15:56:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233982AbjDGN42 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Apr 2023 09:56:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231342AbjDGN4L (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 7 Apr 2023 09:56:11 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E51EBBDE6
        for <linux-usb@vger.kernel.org>; Fri,  7 Apr 2023 06:54:51 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id 18so8570871ejo.13
        for <linux-usb@vger.kernel.org>; Fri, 07 Apr 2023 06:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680875690;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z7FTPX9Ju7GmAgjcDYxdZDyYzlJ85mJ0hqTCjsyYPI0=;
        b=HPKISelYuNXOtYDOrGIjk8NHp4cUw9dQCG5o1GF3ufBPKmYN7KVSDUNW/2usLe40wP
         Elu9wVVZvVEpq67qEz3vmxq6CaNUJBdeftRBEwXadD4b9yn0hazfCkiYZESExWDhut4n
         wkV16Ai8Vk8As/nsAu7cH0ujK7dozO5aDOK4OYXFHW/zCjGXstwqUwUxHwVVmKCICYOY
         azS3H59A7H+zfKUGqMjiRp1l8rPubGDMuGXo4Faad7XmFM0zD9SX4L7YMVAzdoOjDHZe
         97pfJqPNSZ7fbfugNwIFnp6/8zRUD0Bowh86U/MWpuGLW7C7fJNrhog+cXEMLRfZLTfu
         HquA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680875690;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z7FTPX9Ju7GmAgjcDYxdZDyYzlJ85mJ0hqTCjsyYPI0=;
        b=iHzXyXbmCIz5lHbxmLM7lUmzvbpDEBvJq0/S13sruVoG138+krQq5y382TomppkW2y
         eMJ6Rx6YnOXinmq5IZigqL8XVIJvWoMc8m3O14uc+X9hAy7iehPtFl11Tmn10S5emkXz
         BUJ2JEsx+GeLRgAL5/XwElHIUTO71XnUYQ/4RlGOwNXQng65+g3p6gemPGZlDeIksh1H
         RvN5hWpu2XcsWNie0EMyGVyNAvvPvKYLBof4A6KmY3z6SPzdcYxQOYcFca4E9S641Ds/
         Ojrt3SpqMVRLz/PdYoC7OM40s+dkWt18FnaBajrEkhcEKGGbRDTRGg5W+rD2Jo1fKDNj
         Bw6w==
X-Gm-Message-State: AAQBX9e5J148Aw5YzSy0PVAdRCIHD8FPR4rNiaLxuVTi+JF0+X9EB7fP
        +DgDeIKylmHOwWTWMJJ6pFNR0Q==
X-Google-Smtp-Source: AKy350bUmMuAScmNGeU57eVjulCp+98MfRo7bnqNioK6xLYZ+8wTTK533rjf/LBE4RJGAUIEBF7tvw==
X-Received: by 2002:a17:906:7c58:b0:92f:f655:cc78 with SMTP id g24-20020a1709067c5800b0092ff655cc78mr2521191ejp.53.1680875690428;
        Fri, 07 Apr 2023 06:54:50 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:b20f:8824:c926:8299? ([2a02:810d:15c0:828:b20f:8824:c926:8299])
        by smtp.gmail.com with ESMTPSA id oz8-20020a1709077d8800b0093120a11a5dsm2098513ejc.92.2023.04.07.06.54.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Apr 2023 06:54:50 -0700 (PDT)
Message-ID: <8a625ea7-f20f-3ae0-7eb5-9c1fe4b94b34@linaro.org>
Date:   Fri, 7 Apr 2023 15:54:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sdm845-oneplus: Fix speaker GPIO
 node
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20230407-topic-msm_dtb-v1-0-6efb4196f51f@linaro.org>
 <20230407-topic-msm_dtb-v1-6-6efb4196f51f@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230407-topic-msm_dtb-v1-6-6efb4196f51f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 07/04/2023 15:28, Konrad Dybcio wrote:
> Drop the unnecessary mux{} level to make dtbs check happy.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

