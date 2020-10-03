Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F7F12823C3
	for <lists+linux-usb@lfdr.de>; Sat,  3 Oct 2020 13:01:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725777AbgJCLB5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 3 Oct 2020 07:01:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725765AbgJCLB4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 3 Oct 2020 07:01:56 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D3F2C0613D0;
        Sat,  3 Oct 2020 04:01:56 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id c8so4539251edv.5;
        Sat, 03 Oct 2020 04:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=29ZSVzlX7EWrcTywsj7Pranl56F4a6fSdkYBZzlvYf0=;
        b=eLrxCPR//BLYvnxzX5kG+Kl82PtYTiYzpOvkHov9tfnCRvTTpaN6obvGBVREcZ4xxr
         81NAVG1z1Gk/NDFgL+GEUcbRBAD57pPo5oPBsKGnKBEEH9lBZaxYeksXvWqkcog/EgGp
         qVSuY9dBX9QYDoopEGhJyyFJVlAmJSlp0BZv6IXr3PiXhlJSyP7FpvmQBXzS2ij27Bv+
         RdVJcQpKkMPFZLVwojPjrNM+xB14DkjjqFocY2vnsRij0kpleV6x7dTMLV2Gc7do0b+M
         jebm8/aISbJ0vAhs1IF6IhZP+Wn0gxxInSEtL6050J1B4N5GOFChkp+klHFCZn1h2bKn
         tkBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=29ZSVzlX7EWrcTywsj7Pranl56F4a6fSdkYBZzlvYf0=;
        b=RdTaeptOPu0BjHDQI2csnDdYRGda3/SXYC46ed4/7Bq/J8eXho6m/LubndKJtcRZMD
         D3ST6RuTMpv3dJIwCTcHUkalRT3R99yhmiZz4QwGFAyIremas2uvtUUw1JtMD5ZQQv4a
         D2WDEKsUb29v2jUzrWyup+qPMXwsdAoRieVOWfJDrA7dpM3ot5LyYX5ghluVc632CDjI
         pv4uNMXTLIQ9oTL91ksGQy1zP9E+hO8Wy4AccrKoIG+20pH2tM03erEm4roTE0yWWJuQ
         EtcFfRGLIqcW+/UU2rRyKhH4MkKlZCYZjslyLfsXV3m6V2gA2FoghG54Aq/NCBMmHzs0
         fVoA==
X-Gm-Message-State: AOAM533bXzTp4atdljvO3ksGy/6uELZ46kJbiVji7cVivNQwsMQOrYzJ
        lGFolbVPkEn7EfVN2fHd2d5a9U9/296w3A5nXvI=
X-Google-Smtp-Source: ABdhPJxBe3bI5Q5LjNsuVRm2ink4SWU+8TNa+hNq7+xzso909P6yEYnEKYBEtndjQLZsDNOui8PqjtWwE5T+FammAbk=
X-Received: by 2002:aa7:da16:: with SMTP id r22mr7943086eds.132.1601722915098;
 Sat, 03 Oct 2020 04:01:55 -0700 (PDT)
MIME-Version: 1.0
References: <1601656238-22232-1-git-send-email-jun.li@nxp.com> <1601656238-22232-5-git-send-email-jun.li@nxp.com>
In-Reply-To: <1601656238-22232-5-git-send-email-jun.li@nxp.com>
From:   =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski.k+lkml@gmail.com>
Date:   Sat, 3 Oct 2020 13:01:43 +0200
Message-ID: <CAJKOXPdkNsvFzEUnTSKOBnZb3UqZYjkEX32K=ke3bFADsWuyNA@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] arm64: dts: imx8mp-evk: enable usb1 as host mode
To:     Li Jun <jun.li@nxp.com>
Cc:     robh+dt@kernel.org, shawnguo@kernel.org, balbi@kernel.org,
        mathias.nyman@intel.com, gregkh@linuxfoundation.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, Anson.Huang@nxp.com, aisheng.dong@nxp.com,
        peng.fan@nxp.com, fugang.duan@nxp.com, horia.geanta@nxp.com,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 2 Oct 2020 at 18:36, Li Jun <jun.li@nxp.com> wrote:
>
> Enable usb host port with type-A connector on imx8mp-evk board.
>
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
