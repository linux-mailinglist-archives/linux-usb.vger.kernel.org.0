Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B406C6F86C1
	for <lists+linux-usb@lfdr.de>; Fri,  5 May 2023 18:31:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232916AbjEEQbs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 May 2023 12:31:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232585AbjEEQbr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 May 2023 12:31:47 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A776CE67
        for <linux-usb@vger.kernel.org>; Fri,  5 May 2023 09:31:45 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-2f95231618aso1366487f8f.1
        for <linux-usb@vger.kernel.org>; Fri, 05 May 2023 09:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683304304; x=1685896304;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w59j4teauyBWdm8lV8WJBkLOo++kldFYeVrwRq/aog0=;
        b=h9XGou32q9ZcWozUjU7cRA74OYuYbbLiIrTMgK9Xv+87OUcuIQKUGBl4gut8xyZOY7
         7PvQN6AEX3r3bAoDcNJFNb4y3nAaK32cq/UeA9+ZCJqE+OTw0oKbbfnAVVlrhoA8gqei
         oY60xmACfIAOUJvPmJgIhFoMGiT/P/ruPga3KzfwtGoPpOOwWWtKBIn5lorVlAy02NVS
         sfe0LaTZS5wQXXY0wBpfifz6SFpNF6GJS8JFTZgnfEJOVZq6OL2FWFOovogVBzJCj9jB
         1C0MUGEzOVPkxQQ3D9QOeoHZncP/AY0AlCKvN3zL6n25lkptFzrjfFytKNJa0IBDJS3f
         jJRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683304304; x=1685896304;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w59j4teauyBWdm8lV8WJBkLOo++kldFYeVrwRq/aog0=;
        b=UK6UtI+ofkNzLu0bgdwB8TcSJ70oQitJUcXyYSd0vMTbFwFH5lQW9TYWSe/nNs8d04
         8mT/u8vO2E2Dt7hu4+lMTuR8iC81BB0u/yJczARX1C+EHhPMh9+ri0mIYtgM81344uu7
         lfaXyFQnrRB0sdDlFqk6Gq8AdnsIabqxEa5uoKdbsX4A1kYPZ6P9aEdJT3wUz9BI6jGr
         pu2cZ6ouGkg3SEbWTIMd2TZfg791nTrlF5UOGQEmGFhXrnAY6tlhvALyNci4GO3jwqmc
         /AC1YSBU5UNcshBji3ddvrBQrB+su5S+vxYHNTs8gt6Y1mBWkLLFETL096EM9jB+aA4Q
         k/wA==
X-Gm-Message-State: AC+VfDwCquU9+PWu6ccg6vOm2AptQ5vaPqsuB4SlqU8Bol9/EYRfvrp8
        /VK1q81iwhHb1WJHEjDB2WzLggGiTc2qyArQibvs5w==
X-Google-Smtp-Source: ACHHUZ4E/6BzHIBPakhIONcpGeVqllW3XiWq8D6ObYG+M1Obr7wFtzyx/rZSzTb4A75ieaxL9C+Ij+WqMcKUIm2bOxU=
X-Received: by 2002:a5d:40cd:0:b0:2fb:aa2f:3e50 with SMTP id
 b13-20020a5d40cd000000b002fbaa2f3e50mr1993767wrq.59.1683304304106; Fri, 05
 May 2023 09:31:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230505064039.1630025-1-bhupesh.sharma@linaro.org>
 <20230505064039.1630025-3-bhupesh.sharma@linaro.org> <fe326d38-ee52-b0a4-21d8-f00f22449417@linaro.org>
In-Reply-To: <fe326d38-ee52-b0a4-21d8-f00f22449417@linaro.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Fri, 5 May 2023 22:01:32 +0530
Message-ID: <CAH=2NtyqZVVwqk1FsCGrsGn25wxvzuhV-3z+q=5+JmpOoNm-vQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] dt-bindings: soc: qcom: eud: Add SM6115 / SM4250 support
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@linaro.org, linux-kernel@vger.kernel.org,
        bhupesh.linux@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
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

HI Krzysztof,

On Fri, 5 May 2023 at 21:54, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 05/05/2023 08:40, Bhupesh Sharma wrote:
> > Add dt-bindings for EUD found on Qualcomm SM6115 / SM4250 SoC.
> >
> > On this SoC (and derivatives) the enable bit inside 'tcsr_check_reg'
> > needs to be set first to 'enable' the eud module.
> >
> > So, update the dt-bindings to accommodate the third register
> > property (TCSR Base) required by the driver on these SoCs.
> >
> > Also for these SoCs, introduce a new bool property
> > 'qcom,secure-mode-enable', which indicates that the mode manager
> > needs to be accessed only via the secure world.
> >
> > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> > ---
> >  .../devicetree/bindings/soc/qcom/qcom,eud.yaml   | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
> > index f2c5ec7e6437..3b92cdf4e306 100644
> > --- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
> > +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
> > @@ -18,17 +18,33 @@ properties:
> >      items:
> >        - enum:
> >            - qcom,sc7280-eud
> > +          - qcom,sm6115-eud
> >        - const: qcom,eud
> >
> >    reg:
> > +    minItems: 2
> >      items:
> >        - description: EUD Base Register Region
> >        - description: EUD Mode Manager Register
> > +      - description: TCSR Base Register Region
> > +
> > +  reg-names:
> > +    minItems: 2
> > +    items:
> > +      - const: eud-base
> > +      - const: eud-mode-mgr
> > +      - const: tcsr-base
> >
> >    interrupts:
> >      description: EUD interrupt
> >      maxItems: 1
> >
> > +  qcom,secure-mode-enable:
> > +    type: boolean
> > +    description:
> > +      Indicates that the mode manager needs to be accessed only via the secure
> > +      world (through 'scm' calls).
>
> I understood tcsr-base aplies only to SM6115, so this should be further
> constrained in allOf:if:then:.

Please refer to my reply to your query in another review.
I can see that secure access to mode_mgr register via TCSR will be
exposed by other Qualcomm SoCs as well (from the available EUD
documentation). So, maybe keeping it generic instead of limiting it to
sm6115 only would be more useful, for future changes.

Thanks,
Bhupesh
