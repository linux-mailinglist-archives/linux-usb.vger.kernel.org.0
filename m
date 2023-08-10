Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FDC2777777
	for <lists+linux-usb@lfdr.de>; Thu, 10 Aug 2023 13:48:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232582AbjHJLsj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Aug 2023 07:48:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230205AbjHJLsi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Aug 2023 07:48:38 -0400
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9B4C83
        for <linux-usb@vger.kernel.org>; Thu, 10 Aug 2023 04:48:37 -0700 (PDT)
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-56c7eb17945so653735eaf.2
        for <linux-usb@vger.kernel.org>; Thu, 10 Aug 2023 04:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691668117; x=1692272917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YxqqmTrklph/dY4/7wJrbEJlwIvQnCw2ZD/+W6fuD0I=;
        b=B3GMjzdO6gKeIiL1DrFz4KEU5hCT2jhhUU6uQj3bztGZRNYeFas1DVtE9QZRg+cnf1
         5bRWTPq/rPpuntiefzK3p1USAbfUL00j09al+xC0HRiyYp9M7wjDt5NFBe1ziH1RGR8y
         lWfLUzb2Uxv3BvE0Rns9L0Y8KFiTarGjR0yOfXyHSceAgDClX7E0zBktN3lIGdABTqkZ
         Msh212R91/2dlxmt8LtJkBksJJOeyYxvdf+XV5rcijJDoW/jMVKG3RC1MlfzL31piJIF
         9IVbTcZPMoKP2mA1cmfISGClMlNOqxDfvdYsJzOZeldARKrTyXeihEDR/Ets3rD6mAOG
         msPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691668117; x=1692272917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YxqqmTrklph/dY4/7wJrbEJlwIvQnCw2ZD/+W6fuD0I=;
        b=SqBPIr5vMp0qh8syXGtVjjWEUlLLIa6u/aI3UmeFVR64LGuxymRXr5GRH+ocyr9eC/
         gebwJkIPmZpe8vHDTlHIA5KcpG2TZMYEkArgAXZOlxwxN7no49C+FHvZLqaPxergI9wk
         DCy4rGq7Ctgic0+3GO4M4ZbqZ1Bk15DSigA4hxzA71S/PSROylFHe5gXWrFM8SCOH3y5
         offALwCraUhhO8zEpNijGknPeZW+6lcf8DeMCuAJWXCJ+fOSfw4J0hJxNDW/8rxJtLwX
         L2A51NZRIe9x/UHqT6o23RnTRZj8gS3nEXnYtMSuKsRamGwcw5N6VW6nTS2VSCF+GSsj
         3H8A==
X-Gm-Message-State: AOJu0YzpsiWcf6sIxTkpnsnizg2ZzRCuCSEELONfZo9zDtz5NC9fNUNw
        qS6IEzVOfXUaA/j6Iztfuk+3g17pORpbzZ0Q1MUbj4zJ
X-Google-Smtp-Source: AGHT+IGp8zJlDWfklXnU/n54/Ngoq/31Xv+YZ2LErXQWCRIsaBTR9HGewPFYs0jleQnadbSFtD97s7zqpAvC0xcRQKQ=
X-Received: by 2002:a05:6808:4d3:b0:3a7:3a47:b137 with SMTP id
 a19-20020a05680804d300b003a73a47b137mr2277596oie.54.1691668117041; Thu, 10
 Aug 2023 04:48:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230809024432.535160-1-xu.yang_2@nxp.com> <20230809024432.535160-2-xu.yang_2@nxp.com>
In-Reply-To: <20230809024432.535160-2-xu.yang_2@nxp.com>
From:   Peter Chen <hzpeterchen@gmail.com>
Date:   Thu, 10 Aug 2023 19:48:25 +0800
Message-ID: <CAL411-r=J3G1Eu==dsLUQ2n4eA3vjRjzGmbFVoWu6zCpYpSw6Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] usb: chipidea: add workaround for chipidea PEC bug
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     stern@rowland.harvard.edu, peter.chen@kernel.org,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        jun.li@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 9, 2023 at 10:40=E2=80=AFAM Xu Yang <xu.yang_2@nxp.com> wrote:
>
> Some NXP processors using ChipIdea USB IP have a bug when frame babble is
> detected.
>
> Issue description:
> In USB camera test, our controller is host in HS mode. In ISOC IN, when
> device sends data across the micro frame, it causes the babble in host
> controller. This will clear the PE bit. In spec, it also requires to set
> the PEC bit and then set the PCI bit. Without the PCI interrupt, the
> software does not know the PE is cleared.
>
> This will add a flag CI_HDRC_HAS_PORTSC_PEC_MISSED to some impacted
> platform datas. And the ehci host driver will assert PEC by SW when
> specific conditions are satisfied.
>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter

> ---
> Changes in v2:
>  - no change
> ---
>  drivers/usb/chipidea/ci.h          | 1 +
>  drivers/usb/chipidea/ci_hdrc_imx.c | 4 +++-
>  drivers/usb/chipidea/core.c        | 2 ++
>  drivers/usb/chipidea/host.c        | 1 +
>  include/linux/usb/chipidea.h       | 1 +
>  5 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/chipidea/ci.h b/drivers/usb/chipidea/ci.h
> index d262b9df7b3d..d9bb3d3f026e 100644
> --- a/drivers/usb/chipidea/ci.h
> +++ b/drivers/usb/chipidea/ci.h
> @@ -257,6 +257,7 @@ struct ci_hdrc {
>         bool                            id_event;
>         bool                            b_sess_valid_event;
>         bool                            imx28_write_fix;
> +       bool                            has_portsc_pec_bug;
>         bool                            supports_runtime_pm;
>         bool                            in_lpm;
>         bool                            wakeup_int;
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci=
_hdrc_imx.c
> index 772bbdade994..e28bb2f2612d 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -68,11 +68,13 @@ static const struct ci_hdrc_imx_platform_flag imx7d_u=
sb_data =3D {
>
>  static const struct ci_hdrc_imx_platform_flag imx7ulp_usb_data =3D {
>         .flags =3D CI_HDRC_SUPPORTS_RUNTIME_PM |
> +               CI_HDRC_HAS_PORTSC_PEC_MISSED |
>                 CI_HDRC_PMQOS,
>  };
>
>  static const struct ci_hdrc_imx_platform_flag imx8ulp_usb_data =3D {
> -       .flags =3D CI_HDRC_SUPPORTS_RUNTIME_PM,
> +       .flags =3D CI_HDRC_SUPPORTS_RUNTIME_PM |
> +               CI_HDRC_HAS_PORTSC_PEC_MISSED,
>  };
>
>  static const struct of_device_id ci_hdrc_imx_dt_ids[] =3D {
> diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> index 6e1196b53253..7ac39a281b8c 100644
> --- a/drivers/usb/chipidea/core.c
> +++ b/drivers/usb/chipidea/core.c
> @@ -1044,6 +1044,8 @@ static int ci_hdrc_probe(struct platform_device *pd=
ev)
>                 CI_HDRC_IMX28_WRITE_FIX);
>         ci->supports_runtime_pm =3D !!(ci->platdata->flags &
>                 CI_HDRC_SUPPORTS_RUNTIME_PM);
> +       ci->has_portsc_pec_bug =3D !!(ci->platdata->flags &
> +               CI_HDRC_HAS_PORTSC_PEC_MISSED);
>         platform_set_drvdata(pdev, ci);
>
>         ret =3D hw_device_init(ci, base);
> diff --git a/drivers/usb/chipidea/host.c b/drivers/usb/chipidea/host.c
> index ebe7400243b1..08af26b762a2 100644
> --- a/drivers/usb/chipidea/host.c
> +++ b/drivers/usb/chipidea/host.c
> @@ -151,6 +151,7 @@ static int host_start(struct ci_hdrc *ci)
>         ehci->has_hostpc =3D ci->hw_bank.lpm;
>         ehci->has_tdi_phy_lpm =3D ci->hw_bank.lpm;
>         ehci->imx28_write_fix =3D ci->imx28_write_fix;
> +       ehci->has_ci_pec_bug =3D ci->has_portsc_pec_bug;
>
>         priv =3D (struct ehci_ci_priv *)ehci->priv;
>         priv->reg_vbus =3D NULL;
> diff --git a/include/linux/usb/chipidea.h b/include/linux/usb/chipidea.h
> index ee38835ed77c..0b4f2d5faa08 100644
> --- a/include/linux/usb/chipidea.h
> +++ b/include/linux/usb/chipidea.h
> @@ -63,6 +63,7 @@ struct ci_hdrc_platform_data {
>  #define CI_HDRC_IMX_IS_HSIC            BIT(14)
>  #define CI_HDRC_PMQOS                  BIT(15)
>  #define CI_HDRC_PHY_VBUS_CONTROL       BIT(16)
> +#define CI_HDRC_HAS_PORTSC_PEC_MISSED  BIT(17)
>         enum usb_dr_mode        dr_mode;
>  #define CI_HDRC_CONTROLLER_RESET_EVENT         0
>  #define CI_HDRC_CONTROLLER_STOPPED_EVENT       1
> --
> 2.34.1
>
