Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2969F6F9189
	for <lists+linux-usb@lfdr.de>; Sat,  6 May 2023 13:33:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232208AbjEFLdb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 6 May 2023 07:33:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232243AbjEFLd2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 6 May 2023 07:33:28 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E38BC76B3
        for <linux-usb@vger.kernel.org>; Sat,  6 May 2023 04:33:22 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-55a83e80262so41470057b3.3
        for <linux-usb@vger.kernel.org>; Sat, 06 May 2023 04:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683372802; x=1685964802;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MrqXLh+CItgFF8Zvf5m1YwKEXaRzb+PkDECyM11LKHc=;
        b=MkpaBYkwpacXiQBX9wyxjvYYFhGVLUxRS4ZMAZXGcRR4Luhc/XHR5TCixlZ+4iPdcy
         08I6/h04LJUx9ANZTDKYso31rEC8zHUN+eWh+w+zXvWsSdzKFKAU44kGggGZ3ExZA3Em
         hPJvpUvN4N8e7S2oceXGmbgHY9t0KQ+c68+WTq6CDPrcNFWg4BSOETxEi1jkXITVOOlS
         NkiUIK1GH5LidQIvdm85bwzlz4aDpBuInpuGoeFMEwpoeHcvvUAEaQpIK7srb9HUbuES
         z+AxvQh6HxFy6TgIntSemLXYwPHU6pgBJtGyWoKpdgptPTpJ1WivKjv7FfWwJ9dMWhf2
         W/4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683372802; x=1685964802;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MrqXLh+CItgFF8Zvf5m1YwKEXaRzb+PkDECyM11LKHc=;
        b=dkv7jEn0RcSZqaXB5mdFHg/XeK3lu8LTUklzyu5IAeQ7mlFRR2igAEv7ineEbcBCtO
         71X7cgNzIiZaLlk+RtNhFEMb7DQY99BJnmj4Mp78nT7jsnHl2Oc725BdnpD3JNqk3Ieq
         HuWCXdVAhoiHmHgXrLf9ciB/vPyI9V3DtjbFj5EO5/30C2FS1USaelc7FXlElfRdqiel
         T9NmhSnOZevv7m4yLuVcjNMrMmxLBoPAsmGq/xeuss7KtMsSUiFA356Zfw3xWOKSPUjo
         yBP+/dsibiinuEZSDRHW35DrfJldGE7YU6GSMrWHijmJxUHq0XSNrXJSbhXjlXz3Xlpy
         HrlA==
X-Gm-Message-State: AC+VfDyLjgYCTYhV7rCojfEXQi7BLqHNMpzkb953akdLg9HEoJRfZuii
        ZYtv4TG/ouWymEZ5UQ1yjMq/PJUeKTf21Ctzhgy6Cg==
X-Google-Smtp-Source: ACHHUZ7fly9ZcKfeuDxgPgDWv+YnXLTE4ah466Q9irFBlHZd5XhcGu/UinZknE20fN8kbaJnxJSwuRR/WUWwRP2VVzc=
X-Received: by 2002:a0d:d487:0:b0:55a:5dce:aa19 with SMTP id
 w129-20020a0dd487000000b0055a5dceaa19mr4648937ywd.51.1683372802023; Sat, 06
 May 2023 04:33:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1683183860.git.quic_varada@quicinc.com> <8894bf2c44eaf4959c7a1966b66229e6cf5cda96.1683183860.git.quic_varada@quicinc.com>
 <CAA8EJppvj2nzqwdsC+Xct4cJg2-_yPpiGDELjHJG4HyAH3zGMA@mail.gmail.com> <20230506110918.GC10918@varda-linux.qualcomm.com>
In-Reply-To: <20230506110918.GC10918@varda-linux.qualcomm.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 6 May 2023 14:33:11 +0300
Message-ID: <CAA8EJpqg2htfa2QZ7q6SP58N5YAABa8knBn4c5eYqYOU6HQNiA@mail.gmail.com>
Subject: Re: [PATCH v10 8/9] arm64: dts: qcom: ipq9574: Add LDO regulator node
To:     Varadarajan Narayanan <quic_varada@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        vkoul@kernel.org, kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org,
        mturquette@baylibre.com, sboyd@kernel.org, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, 6 May 2023 at 14:09, Varadarajan Narayanan
<quic_varada@quicinc.com> wrote:
>
> On Fri, May 05, 2023 at 12:29:54PM +0300, Dmitry Baryshkov wrote:
> > On Fri, 5 May 2023 at 11:23, Varadarajan Narayanan
> > <quic_varada@quicinc.com> wrote:
> > >
> > > Add LDO regulator node
> >
> > As this LDO is provided by the PMIC, it would be nice to know why it
> > is modelled as an always-on regulator instead of the proper PMIC
> > regulator. Up to now we were doing this only for the outstanding power
> > rails like CX/MX or EBI.
>
> These are always ON because USB phy doesn't support power
> collapse, and there is a chance that other IP blocks might be
> sharing the rail.

You are describing the software side here. From the hardware point of
view, it is an I2C regulator, which is probably also exported as an
SMD_RPM regulator. Unless you have a good reason not to do so, there
should be a node under rpm-requests, which describes mp5496 regulators
exported via RPM. then USB should refer to those regulators.

>
> Thanks
> Varada
>
> > > Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> > > ---
> > >  Changes in v10:
> > >         - Add LDO regulator node
> > > ---
> > >  arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts b/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
> > > index bdc1434..1f5d14f 100644
> > > --- a/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
> > > +++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
> > > @@ -60,6 +60,13 @@
> > >                         regulator-min-microvolt = <725000>;
> > >                         regulator-max-microvolt = <1075000>;
> > >                 };
> > > +
> > > +               mp5496_l2: l2 {
> > > +                       regulator-min-microvolt = <1800000>;
> > > +                       regulator-max-microvolt = <1800000>;
> > > +                       regulator-boot-on;
> > > +                       regulator-always-on;
> > > +               };
> > >         };
> > >  };
> > >
> > > --
> > > 2.7.4
> > >
> >
> >
> > --
> > With best wishes
> > Dmitry



-- 
With best wishes
Dmitry
