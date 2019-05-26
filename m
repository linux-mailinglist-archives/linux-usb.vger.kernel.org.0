Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18D442AB83
	for <lists+linux-usb@lfdr.de>; Sun, 26 May 2019 20:02:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727992AbfEZSCg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 26 May 2019 14:02:36 -0400
Received: from mail-it1-f194.google.com ([209.85.166.194]:39548 "EHLO
        mail-it1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727979AbfEZSCg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 26 May 2019 14:02:36 -0400
Received: by mail-it1-f194.google.com with SMTP id 9so21064084itf.4
        for <linux-usb@vger.kernel.org>; Sun, 26 May 2019 11:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=w9ucTgTenNw/76da0Hs8BAQoNmqkFrLKFM96xtUMtlE=;
        b=AKgxoqFCZzjngjXOkpRndLvEmicBBu+xGNIRVdjCKtdd/aU1a3hkWH0IoDa+Xvk+vq
         R91+vFdKaErBA42JES3nYPN74PZwzpEMxpgWsrPw78BeRPmF3uUZ9isHLQb1QapQEzqD
         AZNRuIhz9EikBAm+LhMX/y42h/Bq6GuKwjMYX7YXQd2wX5hVPKMXr1Hs9+3xC8aopVVt
         xU5+7wkejsB0W0otZpv5y0UqerW8JEGHWywjz5HzLRFB6J9zZOcYs2+aH0mqKqKNXlKw
         bIVwFjP5ALk/iD9bzS0QsJF2A1AHS4iWQz/MpP8vUtkDlMKLTB36HskUrQ8tuU5hIC07
         Q8KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=w9ucTgTenNw/76da0Hs8BAQoNmqkFrLKFM96xtUMtlE=;
        b=XVUnLOdDwqjYRxMvbNiFwPU5Xol/rPXqXX5eVFHDxMvw+zrhy6B0VcMc5lkVWRJvz7
         UPL4LZYste7VepfFOIfdVguqjldPJ5UGL4Dwn4gHdiUEwjZhGa1DgH14rb3uFBFslR+9
         /o9eckMSDJmYpCPSdAzouTteRILVtr2CzXixHVUarqlH2hlEa2hPPcDNdHSlk0/HPkfE
         YJSBavEiOj68zf/dpmKN227Vb1kcitZc53jyVyfcDyJy2vPyb5d0drCHMggDNdTc0D2a
         06BaXEdxZ6iM1CdTWTmVg0bU2mlsaj65+pCWw84OtHTvfeUMEdplYszEGEzKcLXx9ZgG
         zQLA==
X-Gm-Message-State: APjAAAU/XxqgobS2mfh5whwnLb6Ygl+SC67QskA9m/QIu2JGRndOovtd
        sSeFpRQ3xZzOikwzOh0nNXsPTFpfkostVL95oIKPDA==
X-Google-Smtp-Source: APXvYqx2qBD9cRwhPDlsjouVK6mr5mk3j0GDY6Ebq306CUb2YYZOGAX929/s4RJJem5bQtqlvpOzjtHIflontUAKo+w=
X-Received: by 2002:a24:910b:: with SMTP id i11mr27912268ite.76.1558893755513;
 Sun, 26 May 2019 11:02:35 -0700 (PDT)
MIME-Version: 1.0
References: <0ae6261e-96b3-cf8b-d523-a6b8851c951b@gmx.net> <CAKv9HNaJg3OB3DrC_aJe0M97dFP9A0_Jew_wFqReHvzDoFF+sg@mail.gmail.com>
 <CAKv+Gu8fHfmMk63jzvtUGpHb=Nf1bzUvXay8_Hi4YTz=96pQNg@mail.gmail.com>
In-Reply-To: <CAKv+Gu8fHfmMk63jzvtUGpHb=Nf1bzUvXay8_Hi4YTz=96pQNg@mail.gmail.com>
From:   Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date:   Sun, 26 May 2019 20:02:23 +0200
Message-ID: <CAKv+Gu_OWrLuQGSinANa27Km4XiJg1MU6oUf=vZ77EXQoC8bZw@mail.gmail.com>
Subject: Re: usb: dwc2: RODATA_FULL_DEFAULT_ENABLED causes kernel oops
To:     =?UTF-8?B?QW50dGkgU2VwcMOkbMOk?= <a.seppala@gmail.com>
Cc:     Stefan Wahren <wahrenst@gmx.net>,
        Minas Harutyunyan <hminas@synopsys.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Will Deacon <will.deacon@arm.com>,
        linux-usb <linux-usb@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, 26 May 2019 at 14:58, Ard Biesheuvel <ard.biesheuvel@linaro.org> wr=
ote:
>
> On Sun, 26 May 2019 at 12:45, Antti Sepp=C3=A4l=C3=A4 <a.seppala@gmail.co=
m> wrote:
> >
> > On Sun, 26 May 2019 at 13:11, Stefan Wahren <wahrenst@gmx.net> wrote:
> > >
> > > Hi,
> > >
> > > i want to remind about an issue which was originally reported by Wayn=
e
> > > Piekarski [1]. I'm able to reproduce this oops with Mainline Linux 5.=
0.2
> > > on a Raspberry Pi 3B+ (arm64/defconfig) and according to Jan Kratochv=
il
> > > [2] this applies to 5.1.0 and 5.2.0.
> > >
> > > The crash is reproducible since commit c55191e96ca ("arm64: mm: apply
> > > r/o permissions of VM areas to its linear alias as well"), but the ro=
ot
> > > cause of the crash was introduced much earlier with commit 56406e017a=
88
> > > ("usb: dwc2: Fix DMA alignment to start at allocated boundary").
> > >
> > > I tested successfully the following workarounds with the RPi 3B+:
> > >
> > > 1) Disable RODATA_FULL_DEFAULT_ENABLED
> > >
> > > 2) revert commit 56406e017a88 ("usb: dwc2: Fix DMA alignment to start=
 at
> > > allocated boundary")
> > >
> > > It would be nice if someone can come up with a proper solution.
> > >
> > > Regards
> > > Stefan
> > >
> > > [1] - https://marc.info/?l=3Dlinux-usb&m=3D155440243702650&w=3D2
> > > [2] - https://bugzilla.kernel.org/show_bug.cgi?id=3D203149
> > >
> >
> > Hello.
> >
> > This is just a shot in the dark but have you tried to apply DMA cache
> > alignment issue fix [1] as a third workaround alternative?
> > If it helps the fix should be merged upstream.
> >
>

Apologies, I should have looked at the patch first :-)

It does exactly what I proposed - ensure that DMA related cache
invalidation does not wipe the stored_xfer_buffer pointer.

sorry for the noise
