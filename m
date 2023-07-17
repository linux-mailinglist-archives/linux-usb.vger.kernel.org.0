Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46D66756B3A
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jul 2023 20:04:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231490AbjGQSEk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Jul 2023 14:04:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229825AbjGQSEX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Jul 2023 14:04:23 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 519F5172D
        for <linux-usb@vger.kernel.org>; Mon, 17 Jul 2023 11:03:55 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3142970df44so4618415f8f.3
        for <linux-usb@vger.kernel.org>; Mon, 17 Jul 2023 11:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689617031; x=1692209031;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vzbsDx8AKByFFeQb4eON82BRtlQ7HwpTGTuo1yVO7vg=;
        b=gaCzn541IrqgxWEmbQvUqnmSv/6zhTi7DIeAZ801aYQokAv9u745TXLpdbu29zWWjS
         eGPR0ZohCwWiqOrQHbElpCG7Z8u8an0h40TWu+JGU/JDhLzSliCKVzWv9ryKzaCqhgiy
         aw5bqjnV7g0CP0CLRbFZ2WRQKzXI6G2hsU1DWiUBrN63F3zZmMALWCkhcT35E4TpSjAD
         lQ7XGqc3R2pVs6Zip0klr8Ltu1KcdZRmi6It8aYT3mAvThALqzdHXrloL7EHxSr08FMU
         OuaFWgzGJBgdGfi7EsaGQXA2I8zluEYs6p2DjoZvKjDTbPeVoIMamF3OFl/BiKEBKbEP
         Zlmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689617031; x=1692209031;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vzbsDx8AKByFFeQb4eON82BRtlQ7HwpTGTuo1yVO7vg=;
        b=fxc+3pj8quphSLU6JT+eljAkCYMM92a5KWRGBAbtbMufdmimY1IESwIrhN1RH1TVI6
         VCT9lPUNnjEw5jQz0apgEE9qH/xUUSZpOlZGXtSUaUMm4B1A8oLhimTXQlC+3cwPKC3N
         OHTxpzze2rgB+N9GSMuzgDGvUCxMyJ24yjauDeQ7d98xEiWzpcls7I5LoqQhK/hrdOUG
         cYOngT+KiKyzXa2+S0c4QbVNA8luKTkLRuwkX+emHRfd2h4iakFWOwnhvj96C6JYMl9c
         Hi5Y5Q9VFDxe/ShkIIFpBEzHhRZwCKX+0igZV7UscDRABv6/8XsHVWsZB5tQEu0spOMJ
         jcyg==
X-Gm-Message-State: ABy/qLYaFp6Wxi6YYbenY8Zy77ttJbgC6xnILfy/J/Gu+Isawc/+iDFk
        emY1ovTCGPT7geEYhe1VuHQayLbhvFO7f1srySq4sw==
X-Google-Smtp-Source: APBJJlH6iyWjTr3ij3IbpJL7CfATiUf6oE6XdwvX293fZ2AUUPmBjFwI19R/zwUR+0huN6WD2uVCrjxCJgWpPuxK4FY=
X-Received: by 2002:adf:fa47:0:b0:316:f3f3:a1db with SMTP id
 y7-20020adffa47000000b00316f3f3a1dbmr6221218wrr.32.1689617031529; Mon, 17 Jul
 2023 11:03:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230717103236.1246771-1-bhupesh.sharma@linaro.org>
 <20230717103236.1246771-4-bhupesh.sharma@linaro.org> <ZLUbyocjNT2bGvVt@gerhold.net>
In-Reply-To: <ZLUbyocjNT2bGvVt@gerhold.net>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Mon, 17 Jul 2023 23:33:40 +0530
Message-ID: <CAH=2NtzM=jaVtjeHHO0rY0_wHu9==Jpdz4zx5nCK3gBh2kpL=A@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] arm64: dts: qcom: sm6115: Add EUD dt node and dwc3 connector
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@linaro.org, linux-kernel@vger.kernel.org,
        bhupesh.linux@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, krzysztof.kozlowski@linaro.org,
        quic_schowdhu@quicinc.com, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 17 Jul 2023 at 16:15, Stephan Gerhold <stephan@gerhold.net> wrote:
>
> On Mon, Jul 17, 2023 at 04:02:35PM +0530, Bhupesh Sharma wrote:
> > Add the Embedded USB Debugger(EUD) device tree node for
> > SM6115 / SM4250 SoC.
> >
> > The node contains EUD base register region, EUD mode manager
> > register region and TCSR Base register region along with the
> > interrupt entry.
> >
> > [...]
> >
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sm6115.dtsi | 50 ++++++++++++++++++++++++++++
> >  1 file changed, 50 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> > index 839c603512403..db45337c1082c 100644
> > --- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> > [...]
> > @@ -789,6 +801,37 @@ gcc: clock-controller@1400000 {
> >                       #power-domain-cells = <1>;
> >               };
> >
> > +             eud: eud@1610000 {
> > +                     compatible = "qcom,sm6115-eud", "qcom,eud";
> > +                     reg = <0x0 0x01610000 0x0 0x2000>,
> > +                           <0x0 0x01612000 0x0 0x1000>,
> > +                           <0x0 0x003c0000 0x0 0x40000>;
> > +                     reg-names = "eud-base", "eud-mode-mgr", "tcsr-base";
>
> TCSR is a separate hardware block unrelated to the EUD. IMHO it
> shouldn't be listed as "reg" here.
>
> Typically we describe it as syscon and then reference it from other
> nodes. See e.g. sm8450.dtsi "tcsr: syscon@1fc0000" referenced in &scm
> "qcom,dload-mode = <&tcsr 0x13000>". This is pretty much exactly the
> same use case as you have. It also uses this to write something with
> qcom_scm_io_writel() at the end.

That was discussed a bit during v1 patchset review. Basically, if we
use a tcsr syscon approach here, we will need to define a 'qcom,xx'
vendor specific dt-property and use something like this in the eud
node:

qcom,eud-sec-reg = <&tcsr_reg yyyy>

which would be then used by the eud driver (via
syscon_regmap_lookup_by_phandle()).

But for sm6115 / qcm2290 this would be an over complicated solution as
normally the eud driver (say sc7280) doesn't need tcsr based secure
mode manager access. So defining a new soc / vendor specific
dt-property might be an overkill.

Thanks,
Bhupesh
