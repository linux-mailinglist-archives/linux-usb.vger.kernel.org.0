Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9CA16FB5E5
	for <lists+linux-usb@lfdr.de>; Mon,  8 May 2023 19:25:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233330AbjEHRZ4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 8 May 2023 13:25:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233179AbjEHRZz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 8 May 2023 13:25:55 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1D05526F
        for <linux-usb@vger.kernel.org>; Mon,  8 May 2023 10:25:52 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-50bcb00a4c2so7681745a12.1
        for <linux-usb@vger.kernel.org>; Mon, 08 May 2023 10:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683566751; x=1686158751;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x9QTaLy23UxSA3/Ja7A73J2rpYH5H6/h3lbZWyBIFJg=;
        b=psMZ+aIT7AE3t8MX6jXm9EMUVxA1uGAV4vYkTWYKuLivSNWRH+ue7T97KB6kMvVfzg
         pIYMfTXegVZ/aJ5hx8gr9Ww5F4q9G/O/tXIbTDNvgH5BFSP7FyKnorEvlc3Htf0CefJd
         WnQNGL49P9KFJdWmWsoMuTWylE/CPNNcovbxOgYHkwDiBA4+5IAfpPeBn6qCe1c26OAh
         nTspNz/HUi9FyPzDys+BZDOZ2V8LLjzkD607Btc6NolZ1WzBYTAiwVWmpr2PlP5XA0gg
         6aMaGx+FjuSJQyTRF5dZ39MLxf80AjNFNr/vVxXctOKPw9T0werCxAisIT7gOLWQ4GwX
         B+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683566751; x=1686158751;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x9QTaLy23UxSA3/Ja7A73J2rpYH5H6/h3lbZWyBIFJg=;
        b=bWdtSDZ78TyYDapjpKJf8jsSZzFoaJqzEeiUBvallxF2ppZzP1nn1lEIRI4QbkU1ZL
         l4lirQJ5mPdLzQutOBypWDAzsjXJrtNpU3Raz/8iOr5N2rAeWqo27NvU/GB+z9C22HCb
         kVo53yqpwm+Pi7J+TQVLy9dYuQdpIms/Dk3W1FUIpdzoGqJU9TvzGmcPwdwm0btmtFd+
         lVc2JXhkFIK0uVxih/zT2j5oTSFllwGO/fpig/ktCPqGHPeP21B2ZDAyLRuv/60FN3+4
         K5/6P9RmetIPWByZ+pnJvij4zwXlxVuS8SxHz4KtWdF/g6SeGWsdk35RN1bNPmY7R5e4
         E9BQ==
X-Gm-Message-State: AC+VfDxtR+ZdchBml561RriV3PWozOUhfuo9q+bE1NXUFY5SX9sOIrWv
        md1sO++YcwCGaWv1F42hYrOsFw==
X-Google-Smtp-Source: ACHHUZ6aLDDj2us27QpBpK4XJuTG3gJdJ/8iVz+Ed8CX+SAQkuF+Evt0QRKtQuUhEkrRiLRuALMxcw==
X-Received: by 2002:a17:907:3faa:b0:966:17b2:5b15 with SMTP id hr42-20020a1709073faa00b0096617b25b15mr7783203ejc.7.1683566751249;
        Mon, 08 May 2023 10:25:51 -0700 (PDT)
Received: from krzk-bin ([2a02:810d:15c0:828:50e0:ebdf:b755:b300])
        by smtp.gmail.com with ESMTPSA id s3-20020a170906bc4300b0095fde299e83sm204140ejv.214.2023.05.08.10.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 10:25:50 -0700 (PDT)
Date:   Mon, 8 May 2023 19:25:48 +0200
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        robh+dt@kernel.org, luca.weiss@fairphone.com, subbaram@quicinc.com,
        lujianhua000@gmail.com, jackp@quicinc.com,
        konrad.dybcio@linaro.org, linux@roeck-us.net,
        krzysztof.kozlowski+dt@linaro.org, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, caleb.connolly@linaro.org,
        robertom@qti.qualcomm.com, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v7 06/13] dt-bindings: mfd: qcom,spmi-pmic: Add typec to
 SPMI device types
Message-ID: <20230508172548.mizzb4iymneqf7nz@krzk-bin>
References: <20230508142308.1656410-1-bryan.odonoghue@linaro.org>
 <20230508142308.1656410-7-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230508142308.1656410-7-bryan.odonoghue@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 08 May 2023 15:23:01 +0100, Bryan O'Donoghue wrote:
> Add the PMIC Type-C port driver to the list of devices.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml: Unable to find schema file matching $id: http://devicetree.org/schemas/usb/qcom,pmic-typec.yaml

See https://patchwork.ozlabs.org/patch/1778444

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.
