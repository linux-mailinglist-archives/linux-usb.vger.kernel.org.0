Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0A46761CE9
	for <lists+linux-usb@lfdr.de>; Tue, 25 Jul 2023 17:07:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231696AbjGYPHM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Jul 2023 11:07:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231679AbjGYPHK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Jul 2023 11:07:10 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E3F319B0
        for <linux-usb@vger.kernel.org>; Tue, 25 Jul 2023 08:07:09 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-52229d3b8c8so3653367a12.2
        for <linux-usb@vger.kernel.org>; Tue, 25 Jul 2023 08:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690297625; x=1690902425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NZUa3uDyejgNax81C3rf+wIL3cUgqBQKB2P7I+aBclw=;
        b=jfFSsQiNnzJ+lyJWWV6a2xy21nmU2zy74dzTnquz3sf8lMDZiZ9HEOqsbPVSh5k8S6
         l4KQGoPMa9r1DogsMfb9a1iS56IqXEy9PMUfxQniUC01fWf+WLtOrqnG87kPM49VRvid
         JP3aRRXncxD8r5ERwGf1Hu0Rh8va5Ut7MqBjQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690297625; x=1690902425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NZUa3uDyejgNax81C3rf+wIL3cUgqBQKB2P7I+aBclw=;
        b=k4zNWlsa8kVRaJC6SvUgelMvTNkknaz7eNlP4xZSM1/sN717S08/L1DrZExC4Dihlw
         0U94iLmi7+2fnDYyK1GS7jHppb5mS848nYBOV8q96n4tT7TJ76Ap+IeVo/mkrRE8hfg2
         Z/UVydsewXZ2yTKsqlh70UI72dZYRhlrAg8JUxMNMTDFh6w688pJJYRXxzvMRKXYkphL
         k1AribA8oADBROQwYN50I6Jb+ggH+9mcpKJj47e3iI2F7t+qDHeC5ZFyFk+6bd0DubKq
         tGbqlDsb+LNuyfkJaMc7QkZozD12f5eE6REtAThdubwlDTCmwCAfFmqIL+QSTNv4I71G
         /9dg==
X-Gm-Message-State: ABy/qLaZLwPN/BiW26BhnEGBi9D0JbHpRIOQyhkiOxT5tvR7RaZS8lXN
        C3MWwgcSm38bKb7uCSZ6uAOrUPQO9BKpxUierSzI7SxI
X-Google-Smtp-Source: APBJJlGxTBDl0BJfVdIcvt2hGrXkgg/6sdR68Od0QoCggiuifKGsjYd+m2RTrxqeYJIwY9+nn6aLSA==
X-Received: by 2002:a17:906:9bf6:b0:994:5544:3aea with SMTP id de54-20020a1709069bf600b0099455443aeamr11660763ejc.51.1690297625533;
        Tue, 25 Jul 2023 08:07:05 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id q11-20020a170906388b00b00988dbbd1f7esm8188180ejd.213.2023.07.25.08.07.04
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 08:07:04 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-521e046f6c7so10523a12.1
        for <linux-usb@vger.kernel.org>; Tue, 25 Jul 2023 08:07:04 -0700 (PDT)
X-Received: by 2002:a50:d55c:0:b0:51e:16c5:2004 with SMTP id
 f28-20020a50d55c000000b0051e16c52004mr113153edj.6.1690297603084; Tue, 25 Jul
 2023 08:06:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230627-topic-more_bindings-v1-0-6b4b6cd081e5@linaro.org> <20230627-topic-more_bindings-v1-1-6b4b6cd081e5@linaro.org>
In-Reply-To: <20230627-topic-more_bindings-v1-1-6b4b6cd081e5@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 25 Jul 2023 08:06:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WsWyTWk8W23PEgw7vXWpLDCih1kGZHkqYCNHLFOPrkGw@mail.gmail.com>
Message-ID: <CAD=FV=WsWyTWk8W23PEgw7vXWpLDCih1kGZHkqYCNHLFOPrkGw@mail.gmail.com>
Subject: Re: [PATCH 01/11] arm64: dts: qcom: sc7180: Fix DSI0_PHY reg-names
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     cros-qcom-dts-watchers@chromium.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Benjamin Li <benl@squareup.com>,
        James Willcox <jwillcox@squareup.com>,
        Joseph Gates <jgates@squareup.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Zac Crosby <zac@squareup.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Jun Nie <jun.nie@linaro.org>, Max Chen <mchen@squareup.com>,
        Shawn Guo <shawn.guo@linaro.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vincent Knecht <vincent.knecht@mailoo.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        alsa-devel@alsa-project.org, iommu@lists.linux.dev,
        linux-usb@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Leo Yan <leo.yan@linaro.org>, Rob Herring <robh@kernel.org>,
        Andy Gross <andy.gross@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Tue, Jun 27, 2023 at 9:24=E2=80=AFAM Konrad Dybcio <konrad.dybcio@linaro=
.org> wrote:
>
> Commit 2b616f86d51b ("arm64: dts: qcom: sc7180: rename labels for DSI
> nodes") broke reg-names, possibly with search-and-replace. Fix it.
>
> Fixes: 2b616f86d51b ("arm64: dts: qcom: sc7180: rename labels for DSI nod=
es")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/q=
com/sc7180.dtsi
> index 34eff97f8630..b9640574e73b 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -3120,8 +3120,8 @@ mdss_dsi0_phy: phy@ae94400 {
>                                 reg =3D <0 0x0ae94400 0 0x200>,
>                                       <0 0x0ae94600 0 0x280>,
>                                       <0 0x0ae94a00 0 0x1e0>;
> -                               reg-names =3D "dsi0_phy",
> -                                           "dsi0_phy_lane",
> +                               reg-names =3D "dsi_phy",
> +                                           "dsi_phy_lane",

I noticed that this patch got applied [1], but I think it got put into
a branch targeting 6.6 instead of 6.5. Specifically I see it in
"arm64-for-6.6" but not "arm64-fixes-for-6.5". Any chance it could be
landed in a "Fixes" tree and get sent out sooner rather than later?
v6.5 will be pretty broken without it and it would be nice to see it
in Linus's tree sooner rather than later.

[1] https://lore.kernel.org/r/168896565982.1376307.13166434967387866925.b4-=
ty@kernel.org

Thanks!

-Doug
