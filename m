Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 080F53B981B
	for <lists+linux-usb@lfdr.de>; Thu,  1 Jul 2021 23:18:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233687AbhGAVV2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 1 Jul 2021 17:21:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233080AbhGAVV2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 1 Jul 2021 17:21:28 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A380C061762
        for <linux-usb@vger.kernel.org>; Thu,  1 Jul 2021 14:18:56 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id bu12so12833207ejb.0
        for <linux-usb@vger.kernel.org>; Thu, 01 Jul 2021 14:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0cXgfhaS3T+6AeXrGti3lI1yzJ85a5zFdUA+jB/hiwU=;
        b=rEam05Z3TTFpU9SVYzbXP6UGWx86WhLZN47CXYFMmMVkwIsrp58nHOAeECMVVscPrX
         FGt+hLjt6JVPKHKAUfaKdu+CweI7eoBbwsDog/l7ysjLEo7rntkwtQP/OQeYyOVWkhgv
         hORmp1+wlgHaOfIK7H+JDbi4MPeQPPPW8SspbxTmEUJcBV2TjVGiOn557KLox6TPEzda
         MvBZJScUP21/uoR4sdpoU4nza7k42Yvmr8CmxR1ncpdooTuyzDZeju36YcrrWdGCEuiM
         yLH8vFdUndtbv+ufvSnUUMs+IeLNm3pmZHFoYsgJaN7SNwNPyuzb6gVcBp2xU8TGc42A
         murQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0cXgfhaS3T+6AeXrGti3lI1yzJ85a5zFdUA+jB/hiwU=;
        b=X1kmFKJlQCT0Aoc0c7B2ACfPjzm8C0apTtqmryCzpmQygv3ex7KNePUAxELcAy12d6
         eedWcdcDwmiyxXVdoGMyfLkqU1VHKkA4reVDxNU8JRv9akczRcHeNQj953yY2qpeZZWz
         7Mk6RZN13EYlPCAPiDWbNOK38UO1Gsmz5DrPYscWwdjNK3MU//FPu92P3NI8BVTZP/Nd
         2YjAxpaspP+Bmgxn2K8H7LNWTUIjwH2qieJmt1OqcnyDQkOAcwp1vBp7xB5DdVIUsLof
         87P7JsEQ2ptvVjCzi+/p4Us0Ff39tedTNPbsC0xFKLCNz6WLeELQec8QUYYe2LUnkEd9
         cTnw==
X-Gm-Message-State: AOAM5306zKr5F2lJPhoMJn0hmUsXOkSIrgHyFvEjdMRi6rCvoqFjrZpT
        vxCiXzek1PCEtVOMF/xKvTk3z6YW2DsZM692r4bTB/rsQyo=
X-Google-Smtp-Source: ABdhPJw60MN4UpI84csCY2nCthSkx+KwRFteOnlczML7u0gH2Ta/2aIxzy2w1zr6zd6Lpg0rlRxBM7r94hhFxSWj/GM=
X-Received: by 2002:a17:907:d28:: with SMTP id gn40mr1973997ejc.471.1625174334943;
 Thu, 01 Jul 2021 14:18:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210628005825.GA638648@rowland.harvard.edu> <e421818c-dea4-ba6b-e737-bb8d99582588@bluematt.me>
 <20210628011628.GC638648@rowland.harvard.edu> <0c62655d-738c-4d71-6b7b-fe7fa90b54e3@bluematt.me>
 <20210628142418.GC656159@rowland.harvard.edu> <CAFBinCA9Y16Ej3PEBN1Rsqo=6V1AZXKOpTfc_siHP0rvVo7wWQ@mail.gmail.com>
 <20210629150541.GB699290@rowland.harvard.edu> <CAFBinCCOGJfHSSHgRrOO-FQJZAUB=QuMr=BoddPLt19spp0QBg@mail.gmail.com>
 <20210629161807.GB703497@rowland.harvard.edu> <CAFBinCDsGtQaPLhMAb+A6DBihWzQiU409i2oer_ud5yQBvfM5w@mail.gmail.com>
 <20210630003556.GA718579@rowland.harvard.edu> <CANAwSgQadG+A2Tg2Ok5-Nw4i1a2tenABeyQnyTjzJKGHHw+6aA@mail.gmail.com>
In-Reply-To: <CANAwSgQadG+A2Tg2Ok5-Nw4i1a2tenABeyQnyTjzJKGHHw+6aA@mail.gmail.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Thu, 1 Jul 2021 23:18:44 +0200
Message-ID: <CAFBinCC0nfrnQGmrXJ4FDTuy3RGX_FC8egjVaxhKaOSi9q+xzA@mail.gmail.com>
Subject: Re: ODROID-C1/-C2 USB Detection only triggered by some devices
To:     Anand Moon <linux.amoon@gmail.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Minas Harutyunyan <hminas@synopsys.com>,
        Matt Corallo <oc2udbzfd@mattcorallo.com>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>,
        linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Anand,

On Thu, Jul 1, 2021 at 12:04 PM Anand Moon <linux.amoon@gmail.com> wrote:
[...]
> I have been trying some reorder code changes with PHY some new DTS
> changes both on C1+ and C2.
> with my changes I got false positve results.
>
> So in my debug investigation, it seems that USB reset is not working.
> I am attaching my latest code changes so that you could verify at your end.
> If we drop the  phy_meson8b_usb2_reset(phy) all the USB PHY get initialized.
> Note:  phy core does not call the .reset callback function on its own
>
> I have tried crazy ideas with reset API and new approaches, but it seems to fail
> and also used the reset-name features, but with no luck at my end.
> I wil try to followup on the suggestion shared in this email thread.
with your patch USB is not working for me at all on my Odroid-C1+.
kernel log extract:
...
[    5.089251] phy phy-c1108800.phy.0: phy poweron failed --> -22
[    5.096456] dwc2: probe of c9040000.usb failed with error -22
[    5.102182] dwc2 c90c0000.usb: supply vusb_d not found, using dummy regulator
[    5.108781] dwc2 c90c0000.usb: supply vusb_a not found, using dummy regulator
[    5.117140] phy phy-c1108820.phy.1: Anand you are calling USB reset1
[    5.121408] phy phy-c1108820.phy.1: Anand you are calling USB reset2
[    5.131197] dwc2 c90c0000.usb: dwc2_core_reset: HANG! Soft Reset
timeout GRSTCTL_CSFTRST
[    5.137163] dwc2: probe of c90c0000.usb failed with error -16

and then:
# lsusb
#

With your patch applied (on top of v5.13) the dwc2 driver does not
probe anymore.
I suggest we move the discussion about your patch elsewhere so we can
focus on getting USB devices detected (again) with the help of Minas
and Alan.

> I am attaching my usbmon output on Odroid C2.
Can you please specifically state the testing steps you have used to
obtain that output?
This is important so people who are involved in this discussion don't
get confused about the results.

> On some other note on USB HUB reset. I recollect following series (it
> like *mmc_pwrseq*)
> [0] https://lore.kernel.org/linux-devicetree/1474342607-27512-1-git-send-email-peter.chen@nxp.com/
this is being replaced by "usb: misc: Add onboard_usb_hub driver"
which is currently at version 13: [1]


Best regards,
Martin


[1] https://marc.info/?l=linux-usb&m=162447367404217&w=2
