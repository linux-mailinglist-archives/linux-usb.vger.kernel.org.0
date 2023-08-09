Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52DE577596D
	for <lists+linux-usb@lfdr.de>; Wed,  9 Aug 2023 13:00:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232871AbjHILAX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Aug 2023 07:00:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232853AbjHILAW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Aug 2023 07:00:22 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 250BAED
        for <linux-usb@vger.kernel.org>; Wed,  9 Aug 2023 04:00:20 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-6bd066b0fd4so1269694a34.2
        for <linux-usb@vger.kernel.org>; Wed, 09 Aug 2023 04:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691578819; x=1692183619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOPfFXLehPTn4E+4gzQd8jFIr4lmOrebgmEJg+Bd22U=;
        b=WrWG1vxB3kma4hGRiC64P4IyhtC2uGh0yhu/Gcw46kWunFLunO94SqMu3uAbx29k/X
         NSeCwtI1GqoLzUsvkh7RrSs9ZL0WH0iqQ4LD9CFBQrOtaEnLym3yZ2Wb+Gt9lkXUw/DD
         usuFwtj0djGej+3qdh6ACURkvUgNQhjIKAItzPvxm4wdugSkK113Op9Nw8iXT7FiZ/iv
         tjbzEcXO2Wny+UBQEANN+HedmBvl6/zJax2EXDguAY5XKICGJKaP/M13H+paKTbVhGOx
         cRVF44OFI8gMAAdB/ilhp4GJ2ScxpxWeijTiSLn09hgM/4saZ6JZIweKelGaGNL7ch4i
         bxrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691578819; x=1692183619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oOPfFXLehPTn4E+4gzQd8jFIr4lmOrebgmEJg+Bd22U=;
        b=VXiDSgoxABaQpw//m1mKYCAnSoBZxKhElE7OVNro/bZGDdJjvswhNKGRjaHZ2Unzm6
         N7vzAmfcW1hp54JTB4MrrwR7CB6NLphZPkw9+yTE9GnNsKbjJnl4B+u3pWkeFIkfyhpJ
         CTjOPtSBxEtc1rCRwtyXz+yllxGkx9esGDbBirtTiSvkMKufdTcnUNOAR28PLSnosAmp
         C/xfPjLpNk1KdwFX9bXikisOF8FhvvFmtRp3trXgnsIkwqjmJpRZo9CPDC0bh1xRt6Pa
         Rw2lzLVe9rYO6ICgkAho7QOdj5eHAtSox/T9QL1VRmpg2Ujae8WAADyhMJ4QYwU1g1V7
         KvmA==
X-Gm-Message-State: AOJu0YyDBPRUh15NTwCYQZolKPMxf1hGYIe1cGgFcx7ejLu2gxI6MzLa
        MADrB3Ko2+/skkZN9DGIlRL7iYLp13KeszXnudt1fjHS
X-Google-Smtp-Source: AGHT+IFo6DhPEnYe4DkFegIJiNLIEzQ2vllgPhMHOVk6B6xTWfpR0Mu1C2fgrK4QjeLpo0UkSKlpoUQljLFSiMvYfo0=
X-Received: by 2002:a54:4404:0:b0:3a7:88d9:cc60 with SMTP id
 k4-20020a544404000000b003a788d9cc60mr2243013oiw.33.1691578819227; Wed, 09 Aug
 2023 04:00:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230809024432.535160-1-xu.yang_2@nxp.com>
In-Reply-To: <20230809024432.535160-1-xu.yang_2@nxp.com>
From:   Peter Chen <hzpeterchen@gmail.com>
Date:   Wed, 9 Aug 2023 19:00:08 +0800
Message-ID: <CAL411-pKu-e_o3OBBy1yp9Lbbx=FCVHOqXO4z03dqfVK0hBytg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] usb: ehci: add workaround for chipidea PORTSC.PEC bug
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
> Some NXP processor using chipidea IP has a bug when frame babble is
> detected.
>
> As per 4.15.1.1.1 Serial Bus Babble:
>   A babble condition also exists if IN transaction is in progress at
> High-speed SOF2 point. This is called frame babble. The host controller
> must disable the port to which the frame babble is detected.
>
> The USB controller has disabled the port (PE cleared) and has asserted
> USBERRINT when frame babble is detected, but PEC is not asserted.
> Therefore, the SW isn't aware that port has been disabled. Then the
> SW keeps sending packets to this port, but all of the transfers will
> fail.
>
> This workaround will firstly assert PCD by SW when USBERRINT is detected
> and then judge whether port change has really occurred or not by polling
> roothub status. Because the PEC doesn't get asserted in our case, this
> patch will also assert it by SW when specific conditions are satisfied.
>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter

> ---
> Changes in v2:
>  - fix typo in commit message
>  - Adjust the judgement logic in echi_irq() as suggested from Alan
> ---
>  drivers/usb/host/ehci-hcd.c |  8 ++++++--
>  drivers/usb/host/ehci-hub.c | 10 +++++++++-
>  drivers/usb/host/ehci.h     | 10 ++++++++++
>  3 files changed, 25 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/usb/host/ehci-hcd.c b/drivers/usb/host/ehci-hcd.c
> index a1930db0da1c..802bfafb1012 100644
> --- a/drivers/usb/host/ehci-hcd.c
> +++ b/drivers/usb/host/ehci-hcd.c
> @@ -755,10 +755,14 @@ static irqreturn_t ehci_irq (struct usb_hcd *hcd)
>
>         /* normal [4.15.1.2] or error [4.15.1.1] completion */
>         if (likely ((status & (STS_INT|STS_ERR)) !=3D 0)) {
> -               if (likely ((status & STS_ERR) =3D=3D 0))
> +               if (likely ((status & STS_ERR) =3D=3D 0)) {
>                         INCR(ehci->stats.normal);
> -               else
> +               } else {
> +                       /* Force to check port status */
> +                       if (ehci->has_ci_pec_bug)
> +                               status |=3D STS_PCD;
>                         INCR(ehci->stats.error);
> +               }
>                 bh =3D 1;
>         }
>
> diff --git a/drivers/usb/host/ehci-hub.c b/drivers/usb/host/ehci-hub.c
> index efe30e3be22f..1aee392e8492 100644
> --- a/drivers/usb/host/ehci-hub.c
> +++ b/drivers/usb/host/ehci-hub.c
> @@ -674,7 +674,8 @@ ehci_hub_status_data (struct usb_hcd *hcd, char *buf)
>
>                 if ((temp & mask) !=3D 0 || test_bit(i, &ehci->port_c_sus=
pend)
>                                 || (ehci->reset_done[i] && time_after_eq(
> -                                       jiffies, ehci->reset_done[i]))) {
> +                                       jiffies, ehci->reset_done[i]))
> +                               || ehci_has_ci_pec_bug(ehci, temp)) {
>                         if (i < 7)
>                             buf [0] |=3D 1 << (i + 1);
>                         else
> @@ -875,6 +876,13 @@ int ehci_hub_control(
>                 if (temp & PORT_PEC)
>                         status |=3D USB_PORT_STAT_C_ENABLE << 16;
>
> +               if (ehci_has_ci_pec_bug(ehci, temp)) {
> +                       status |=3D USB_PORT_STAT_C_ENABLE << 16;
> +                       ehci_info(ehci,
> +                               "PE is cleared by HW port:%d PORTSC:%08x\=
n",
> +                               wIndex + 1, temp);
> +               }
> +
>                 if ((temp & PORT_OCC) && (!ignore_oc && !ehci->spurious_o=
c)){
>                         status |=3D USB_PORT_STAT_C_OVERCURRENT << 16;
>
> diff --git a/drivers/usb/host/ehci.h b/drivers/usb/host/ehci.h
> index c5c7f8782549..1441e3400796 100644
> --- a/drivers/usb/host/ehci.h
> +++ b/drivers/usb/host/ehci.h
> @@ -207,6 +207,7 @@ struct ehci_hcd {                   /* one per contro=
ller */
>         unsigned                has_fsl_port_bug:1; /* FreeScale */
>         unsigned                has_fsl_hs_errata:1;    /* Freescale HS q=
uirk */
>         unsigned                has_fsl_susp_errata:1;  /* NXP SUSP quirk=
 */
> +       unsigned                has_ci_pec_bug:1;       /* ChipIdea PEC b=
ug */
>         unsigned                big_endian_mmio:1;
>         unsigned                big_endian_desc:1;
>         unsigned                big_endian_capbase:1;
> @@ -707,6 +708,15 @@ ehci_port_speed(struct ehci_hcd *ehci, unsigned int =
portsc)
>   */
>  #define ehci_has_fsl_susp_errata(e)    ((e)->has_fsl_susp_errata)
>
> +/*
> + * Some Freescale/NXP processors using ChipIdea IP have a bug in which
> + * disabling the port (PE is cleared) does not cause PEC to be asserted
> + * when frame babble is detected.
> + */
> +#define ehci_has_ci_pec_bug(e, portsc) \
> +       ((e)->has_ci_pec_bug && ((e)->command & CMD_PSE) \
> +        && !(portsc & PORT_PEC) && !(portsc & PORT_PE))
> +
>  /*
>   * While most USB host controllers implement their registers in
>   * little-endian format, a minority (celleb companion chip) implement
> --
> 2.34.1
>
