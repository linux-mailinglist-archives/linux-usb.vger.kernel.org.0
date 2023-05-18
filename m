Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3ABC1707C6C
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 11:01:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230112AbjERJBG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 May 2023 05:01:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229758AbjERJBE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 May 2023 05:01:04 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC1AE1FE3
        for <linux-usb@vger.kernel.org>; Thu, 18 May 2023 02:01:02 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3f42c865535so17831855e9.1
        for <linux-usb@vger.kernel.org>; Thu, 18 May 2023 02:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684400461; x=1686992461;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4EkpLtrQu6Wc5CurlBolghKtZarCo31NeGGAhO+Vwdo=;
        b=zGCY0nu2lDFLcoz+k0LgvMJUPENDjUIXY00RK5+1tmvyQ52k317q45G55KSkN0kPK7
         /M/Cge6lHiY7Ch8lez2leNgwA2Zp4IbgEdI0nUvXxgzACypvRS56cI0DET7W4Sb/Flcg
         YAqQ3cpFjiiRACuHnyPdPdDBO9rXCbdYY8oARx5PLmnEU1pSslBVwQn58nbScnY68mDO
         t7z77WknCLRpz1lKKh0cxytt99JLiSKHYRvIpKj343qwIHx0GRRdUBiqBetviiMqVqTa
         CPEzCnm3uCx8trtQ34OAxYrpLcZmYImW2v0CVyiuvGQDavemLmo9VP8TO9aBZfPHghcL
         yUsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684400461; x=1686992461;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4EkpLtrQu6Wc5CurlBolghKtZarCo31NeGGAhO+Vwdo=;
        b=PgUL6Zo4bP+UCZbhtK0vEiFj9EVfn16c55HjemRFgcQZd2BhPSX7BVUeh7gR6f3/fs
         HmA8361+z/u19uKNmmzbe/LjQMlf+fsVRCJcQhAd6FAbKqaLyfmPzqQ0QI/ZLikfR/ZC
         j2ARO1g6eWHdUD1qpFUwBP5FndC6J4G74+K2cVraNr2iYvjpTxT4DBC4iKHrVxVBKYa9
         8bUgKLPv/kFGYIL2JiTt6j11q6VHFv87xbCeraywl5ryd8H2ohhFLNnsCr9tTRhSB0r5
         U2CpdOABKXJgMlfA63rrJnocS3UUA8Q6Jic5UwDLQiU3perJWCJ7IW1WAQfncuDRAn0a
         CH7g==
X-Gm-Message-State: AC+VfDyrpBYC3AtVbSxRYNwaeppADubUPs+MEeT8aIEoR6jYrpFmjGwt
        fQaKJVAB19BwQOIwq5KzlfV3T1dEnBADccGf5cuzag==
X-Google-Smtp-Source: ACHHUZ79A3p+DFYRGklrYuoZfFl+7T7BZItlVzgHOnwtl24lipXH9tiXm5WsYwNPO9ldSNuZeHa/XamBLS371hTK+Jc=
X-Received: by 2002:a1c:f20b:0:b0:3f4:2438:e201 with SMTP id
 s11-20020a1cf20b000000b003f42438e201mr911283wmc.21.1684400461190; Thu, 18 May
 2023 02:01:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230517211756.2483552-1-bhupesh.sharma@linaro.org>
 <20230517211756.2483552-3-bhupesh.sharma@linaro.org> <872d0dbc-18d8-800b-4647-d362a678086d@linaro.org>
In-Reply-To: <872d0dbc-18d8-800b-4647-d362a678086d@linaro.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Thu, 18 May 2023 14:30:49 +0530
Message-ID: <CAH=2Ntw2nAAsddNBULeoHM6F0dpX1ef31LDbBH7AiHeeyDJWgw@mail.gmail.com>
Subject: Re: [PATCH v6 2/6] dt-bindings: soc: qcom: eud: Add SM6115 / SM4250 support
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@linaro.org, linux-kernel@vger.kernel.org,
        bhupesh.linux@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, quic_schowdhu@quicinc.com,
        gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Krzysztof,

On Thu, 18 May 2023 at 13:08, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 17/05/2023 23:17, Bhupesh Sharma wrote:
> > Add dt-bindings for EUD found on Qualcomm SM6115 / SM4250 SoC.
> >
> > On this SoC (and derivatives) the enable bit inside 'tcsr_check_reg'
> > needs to be set first to 'enable' the eud module.
> >
> > So, update the dt-bindings to accommodate the third register
> > property (TCSR Base) required by the driver on these SoCs.
> >
> > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
>
> This is a friendly reminder during the review process.
>
> It looks like you received a tag and forgot to add it.
>
> If you do not know the process, here is a short explanation:
> Please add Acked-by/Reviewed-by/Tested-by tags when posting new
> versions. However, there's no need to repost patches *only* to add the
> tags. The upstream maintainer will do that for acks received on the
> version they apply.
>
> https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540
>
> If a tag was not added on purpose, please state why and what changed.
>
> Also - no improvements.

Oops, seems I missed your review on v5 due to a label filter for
'linux-usb' list.
I will take care in future versions.

Please let me know if the R-B tag is still valid though :)

Thanks.
