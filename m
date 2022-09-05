Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99E805AC918
	for <lists+linux-usb@lfdr.de>; Mon,  5 Sep 2022 05:29:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234831AbiIED2f (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 4 Sep 2022 23:28:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229979AbiIED2d (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 4 Sep 2022 23:28:33 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53F4D2CDD3
        for <linux-usb@vger.kernel.org>; Sun,  4 Sep 2022 20:28:31 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id m10-20020a17090a730a00b001fa986fd8eeso10972646pjk.0
        for <linux-usb@vger.kernel.org>; Sun, 04 Sep 2022 20:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=0TSBTqk8hl2xq+xNebD0Zp/QXtcjkciz+BGAvSC5lhE=;
        b=Sj+AS0GN7wskaWv9kHDqQ7iarkwECxqLoWgo0i7TdEBE0Q+KqisFJgicweyW6smIGP
         VZFt0X3pIKBQ6S61G6qZPVw3Vbi71og9W2OoHO78dOEgHsENBv5vBzGaoSk8cGSrgtGt
         UkHw/G/4KL2RUOMcwtdhr8vbBVCMqTZVhLsjN8ov1ITqxF/LUAaqdQ+aeoT8YUB2BNmL
         h0DdxKqa3DV9hrROTKlwtngWwWa5mx0ih3QYNP7/HFbG5pNpArmC7XzsbPQ/ediAPkdZ
         BkGR/8C1+3hUv2vz16EUjGAxZkRuZuAOARkDPC6CpbOzN2qn9vc+smgGBWhPUSl7T2Jw
         mOMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=0TSBTqk8hl2xq+xNebD0Zp/QXtcjkciz+BGAvSC5lhE=;
        b=P36StLYkOpis0pYBOxgZJ2hr9n5ondV9hA34ZrghqB/OocsIdC1s2QwHKKZiMQt9ds
         AbOVgOfB7FkjfGvYVuVcycMJ0Nj2qCSU3CBQxZ5zmD1K17GNccu9vjQb4xrD2Vsif49/
         1hCh6PijNyGlfd31nf3UfuSxjRp9gLYx5TKapkk6aeyGx5cW1D9mo0na7/BbY/sRgt/m
         rBxXPphSdPKyEtdQaBHDujs/E6R+wXDt/2ETwC3Aa8lOAEZcT9GmevfaHAO35spFFBDb
         geWvqgVMuWcRAsuil+WvdziJkuVk7ZX3IedVUBKCOTxa3oTP/DDE0K2cFI6fc4ojQqaP
         Uczg==
X-Gm-Message-State: ACgBeo0WyjdiQvXd3iCZo8euqMzruQdmZmhN3RzWCwLPQdoq0mYT3gya
        UgMo3shAMW5EfYQnC3r7zcRz5d0504XMo08onVA=
X-Google-Smtp-Source: AA6agR5k6jSTFs+UhLaSmNcjR8A7LTAmpKX6qAPZo0RzQt0wsrlCsIs0S2BteCVOp4Yzu6OI2PXErLxuULCrk2pq6N4=
X-Received: by 2002:a17:903:48b:b0:175:18d6:4a7c with SMTP id
 jj11-20020a170903048b00b0017518d64a7cmr29080421plb.11.1662348510803; Sun, 04
 Sep 2022 20:28:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220622130440.955465-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20220622130440.955465-1-alexander.stein@ew.tq-group.com>
From:   Jun Li <lijun.kernel@gmail.com>
Date:   Mon, 5 Sep 2022 11:28:19 +0800
Message-ID: <CAKgpwJW3gHLFHbe1oUgg1Kx2r0tORe+FN=edBFMSG1sCCctHkA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] USB support for TQMa8MPxL + MBa8MPxL
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Li Jun <jun.li@nxp.com>, linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Alexander,
Alexander Stein <alexander.stein@ew.tq-group.com> =E4=BA=8E2022=E5=B9=B46=
=E6=9C=8822=E6=97=A5=E5=91=A8=E4=B8=89 21:13=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi everybody,
>
> this is an RFC for USB support on TQMa8MPxL + MBa8MPxL. DT support is cur=
rently
> in progress at [1]. This series is on top of that.
> The DT configuration itself (patch 4) is rather straight forward, but lea=
ds to
> the following dmesg errors regarding superspeed ports:
> > [    8.549243] hub 2-1:1.0: hub_ext_port_status failed (err =3D -110)
> > [   22.885263] usb 2-1: Failed to suspend device, error -110
>
> This hardware works fine using the downstream kernel, because for imx8mp =
this
> ITP sync feature is enabled conditionally [2] & [3].
> Hacking this into mainline resulted in a working superspeed setup as well=
. I
> also noticed that on some android kernel [4] depending in IP core version=
 either
> GCTL.SOFTITPSYNC or GFLADJ.GFLADJ_REFCLK_LPM_SEL is enabled unconditional=
ly.
> So I opted for the latter one using some quirk (patch 1-3).
>
> I have to admit I do not know what this is actually about, nor why my set=
up
> does not work without this change or why this fixed my problem. So maybe
> someone with more knowledge can say if this is the way to go or what this=
 is
> about.

Found this patch set some late.

Yes, your choice to enable GFLADJ.GFLADJ_REFCLK_LPM_SEL
is the right setting after checking with Synopsys, which can make USB2
with LPM supported devices work as well, as SOFTIPSYNC has below
description:
"If you plan to enable hardware-based LPM or software-based LPM
(PORTPMSC. HLE=3D1), then you cannot use this feature. Turn off
this feature by setting this bit to '0' and use the
GFLADJ.GFLADJ_REFCLK_LPM_SEL feature."

So could you please remove RFC mark and resume this
topic?

Thanks
Li Jun

>
> Note: I excluded the DT guys (for now) as this is more about usb internal=
s, the
> DT patches are for completeness.
>
> Thanks and best regards,
> Alexander
>
> [1] https://patchwork.kernel.org/project/linux-arm-kernel/cover/202206221=
14949.889274-1-alexander.stein@ew.tq-group.com/
> [2] https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/usb=
/dwc3/dwc3-imx8mp.c?h=3Dlf-5.10.y#n134
> [3] https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/usb=
/dwc3/core.c?h=3Dlf-5.10.y#n333
> [4] https://android.googlesource.com/kernel/msm/+/87a6b154766907020cc74c7=
726e8a68aaa9d7f6b%5E%21/#F0
>
> Alexander Stein (4):
>   dt-bindings: usb: dwc3: Add gfladj-refclk-lpm-sel-quirk
>   usb: dwc3: core: add gfladj_refclk_lpm_sel quirk
>   arm64: dts: imx8mp: Add snps,gfladj-refclk-lpm-sel quirk to USB nodes
>   arm64: dts: tqma8mpql: add USB support
>
>  .../devicetree/bindings/usb/snps,dwc3.yaml    |  5 ++
>  .../freescale/imx8mp-tqma8mpql-mba8mpxl.dts   | 68 ++++++++++++++++++-
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  2 +
>  drivers/usb/dwc3/core.c                       |  8 ++-
>  drivers/usb/dwc3/core.h                       |  2 +
>  5 files changed, 83 insertions(+), 2 deletions(-)
>
> --
> 2.25.1
>
