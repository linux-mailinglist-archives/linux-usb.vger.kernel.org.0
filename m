Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1682521EEBB
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jul 2020 13:09:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727121AbgGNLJv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Jul 2020 07:09:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727045AbgGNLJu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Jul 2020 07:09:50 -0400
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com [IPv6:2607:f8b0:4864:20::a41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BFBDC061755
        for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2020 04:09:50 -0700 (PDT)
Received: by mail-vk1-xa41.google.com with SMTP id b205so3558935vkb.8
        for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2020 04:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3YhvlAOYWC7dMBy+3Pi1rHdBxllfC2MBLvwSipP3T4w=;
        b=CjlrNfSSzsk817YOEbHbZsKGZs/0ko40qfAirI5QasTA5zmolaXCCW2kNcv8Two91n
         cpn2jvUiNkWawh1XSuIHNe5o3xCBDxkpTE37ZZMLM6hvoN26zMffjvwFVByVHlrb0N9c
         A8dHCKswuwNXCYGnt+RAWTo5rbj+SbRwlKkS91M9p+lhFy65fxa3xKhZmsb+h75ehOrl
         Kw0JzurLAmXEm4wosla2gSFLoeuXL2vWhRNWQLpJDQxdRDHcjsrSoErmpCgD662E6yKB
         M3Q59+0akg5PQhZ4z+9a/egv0ycs0z98eF+ZK5ULv1q1hPwTcfrrcrtM/euLgleWGzmi
         Eflw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3YhvlAOYWC7dMBy+3Pi1rHdBxllfC2MBLvwSipP3T4w=;
        b=Xu4UucKLhk4cQc2FAIkoo/1Rxcq6WmSNdEYUiuYF0E7dWTkIRfDoyVM4s6JRhuGxSs
         R92eooJjwYUthzzGffil1+r9+SyEUTm6TdXanw/P21V/ZGL0dAqKVCsi0/BxIsVmjEAn
         nJ7m8qnnjlC/I/kA/nFGaCqAKewnKBlfArg110rD3OJLnaw5laJwsf+1SjFjupLBahYd
         1s+YQJCChXOs0V7I2W3e7IhkyRYFm8vuC/BK99R5lIEYpeYU8EHDeT4l6/xIUkuqpowK
         sKaioIXuVURqlDefCgDspEsQ+JC/mJ4/tG71667RuxPAsynlbfVCLbx0X9ZeMIrQma/s
         o1fQ==
X-Gm-Message-State: AOAM5333NkHIshGD8LpgVOdCImyqqLT8b7JE7mDiCxjXOV4fRg48gANV
        mQtrdfa07Js6TwFMBZwgVGqtoKsSHjY/fgaYvPGpGA==
X-Google-Smtp-Source: ABdhPJxN8F7vCkVYYB1mKwNcWhBLj6NpguA0oj9wz16XiSneHs1QpHCTHRp4RqlrjbB+ZTpIlM4SDr7U7AzL6imzv8w=
X-Received: by 2002:a1f:f402:: with SMTP id s2mr3250239vkh.95.1594724989486;
 Tue, 14 Jul 2020 04:09:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200709222126.5055-1-angelo.dureghello@timesys.com> <20200714100851.GB3453@localhost>
In-Reply-To: <20200714100851.GB3453@localhost>
From:   Angelo Dureghello <angelo.dureghello@timesys.com>
Date:   Tue, 14 Jul 2020 13:16:48 +0200
Message-ID: <CALJHbkBiRM1=rV_T_c4xHFpg98en3PS3EiQqcM+v_s-Uts3MbA@mail.gmail.com>
Subject: Re: [PATCH v2] USB: serial: add support for MaxLinear XR21V1412
To:     Johan Hovold <johan@kernel.org>
Cc:     Manivannan Sadhasivam <mani@kernel.org>, linux-usb@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Johan,

On Tue, Jul 14, 2020 at 12:08 PM Johan Hovold <johan@kernel.org> wrote:
>
> On Fri, Jul 10, 2020 at 12:21:26AM +0200, Angelo Dureghello wrote:
> > From some researches, this driver is available from the IC
> > constructor site, but for older kernel versions. From there, decided
> > to add a much simplier mainline version, written from scratch.
>
> Do you have a pointer to the vendor sources for reference?

> > This initial simple version is implemented without any flow control,
> > tested mainly at 115200, but all standard baud rates are supported
> > and applied as per serial terminal settings.
> >
> > Signed-off-by: Angelo Dureghello <angelo.dureghello@timesys.com>
> > Reported-by: kernel test robot <lkp@intel.com>
>
> No need for a reported-by if the robot catches issues during review.
> Just mention it in the changelog as you already did below.
>
> > ---
> > Changes for v2:
> > - fix test robot warning, PARITY_ defines renamed
> > ---
> >  drivers/usb/serial/Kconfig     |   9 +
> >  drivers/usb/serial/Makefile    |   1 +
> >  drivers/usb/serial/xr21v1412.c | 361 +++++++++++++++++++++++++++++++++
> >  3 files changed, 371 insertions(+)
> >  create mode 100644 drivers/usb/serial/xr21v1412.c
>
> Thanks for the submitting this.
>
> There was another driver for this device posted recently, and which
> appears to have more features:
>
>         https://lore.kernel.org/r/20200607162350.21297-2-mani@kernel.org
>
> Would you mind taking a look and see if that one would work for you?
>

oooh

I grepped for this driver in the mainline, found nothing, so thought
it was missing.
Probably a check in the mailing list could trigger it.
No problem, it was a good exercise that i am happy with.
Yes, Manivannan driver seems more feature-rich, sure.

Goung in "idle" mode, let me know if you need anything from my side.

> I had some comments on the latest version that needs to be addressed,
> but I'm assuming Manivannan is working on a v5?
>
> Johan

Regards,
angelo


-- 
Angelo Dureghello
Timesys
e. angelo.dureghello@timesys.com
