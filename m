Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C77229CB16
	for <lists+linux-usb@lfdr.de>; Tue, 27 Oct 2020 22:19:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S373734AbgJ0VTm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Oct 2020 17:19:42 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:35360 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S373731AbgJ0VTl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Oct 2020 17:19:41 -0400
Received: by mail-pl1-f193.google.com with SMTP id 1so1442507ple.2
        for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2020 14:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LzAq8GtEuFpDavAkXtu+RuN8eOVT5o1V9RGelgOO+5c=;
        b=Y3nNZiSCVsjkZMYBwtmXC+Okm3y74aNpE3mL0/bI1fATDnNrng1nIqpEnz76fNZB/V
         AxiclcC/unhh5okSqwFKkXE5hGhdpVxw1Y5Ov0UlIfrli1ttXFNuSaAKEGjyED4ZBVHC
         CSiJUyIt8g3bGs6SFKep0FHtPBgELqD5azErk973Ou/z+iuMoCtTN+Pu2+4F5IHJ3Iac
         QtWQ4RCXssEE45xse8Uih++aooe7J2X+ZqiTydHIfadk5KnEzobKvRJzRU0V/2I/e9OR
         oriWK3w62/1unD9duN4RRaYnkP0l+YoGPIx8E2E7pOE+t4XT3bdyXVFn9pT1Aq8U4FmM
         Qzmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LzAq8GtEuFpDavAkXtu+RuN8eOVT5o1V9RGelgOO+5c=;
        b=cZO75aLsgFx93u30yyMw4Qplyl7LWApxcX8+UYZePG2ellEgMeHCaXm6pUNFTeRnmD
         3NWwrQFfuYHSb6OsFiXUOpuZHi3h5pj+ReuZ0oXceFXXvbJYCyXuKp2gfIKoR722msvD
         OmWCKoClUs/pFi9b4I+H6vcTIfriqP/8HUghvX3Gzsi49n7SXOIaQYEZzoClwY8Wp53n
         Vp4Jw16KDXV1OAXKsVo4M9Q4SYabw8jZJ/pTv0uQowQ4d9JS1hdDYv0SEpxNscZhhL+0
         h21NRfcxYA781WGCdtU9sd0auuBUqRYwtA46tS4VwTdWboKzFLsylD3ZBj1arqaHo8+f
         z7Dw==
X-Gm-Message-State: AOAM531+xYv0LeOImhW4r/1UnjP4aN/JaBhRD54qwWhZMqiLs+2g4QJw
        dNwJpdCeyZoZEefiGs2Tw3BVG8u9IuMBH/ba9yf9782v6VM=
X-Google-Smtp-Source: ABdhPJxoM/0UaThf9RRQgZgPt+3JfQBnYSMJ5azeA5W2pbk5YjegLx0lQvDIVJgn2XncIDFA6VYIvMnM7R3l7ZOEBfQ=
X-Received: by 2002:a17:90a:be11:: with SMTP id a17mr528795pjs.181.1603833580456;
 Tue, 27 Oct 2020 14:19:40 -0700 (PDT)
MIME-Version: 1.0
References: <913dccca-500d-1938-b199-6eb67cfb60cc@gmail.com>
 <87a6wig461.fsf@kernel.org> <a565dc52-27ab-f5be-4fee-5a8f96d66456@gmail.com>
 <874kmpf583.fsf@kernel.org> <d0aca346-353c-d74e-6f00-ccd2a4ed26ef@gmail.com>
 <976cea12-e54e-fbca-6c53-e6ef5c554094@synopsys.com> <645b6ddc-d4f5-3f5b-b85f-b3d27fc365f5@synopsys.com>
 <2b6586e6-528c-86e8-9d92-0061bc44866d@gmail.com> <aad327a8-95bc-40ec-abf7-ad216a02fad0@synopsys.com>
 <2cc783ac-6b71-190b-49fc-9e2bceeacd4b@gmail.com> <920590dc-5430-7f8b-b2e1-1a4c37f4dfbe@synopsys.com>
 <CAHp75Vfs9AoOYSVGTpw30h11ptPOSPNf1AsWBKdiVrDL=9X3PQ@mail.gmail.com> <0089306e-e2ca-9a53-6ffb-202d028050ce@gmail.com>
In-Reply-To: <0089306e-e2ca-9a53-6ffb-202d028050ce@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 27 Oct 2020 23:19:24 +0200
Message-ID: <CAHp75VfV0gHy4DR0ANPUFsHibpUrgqoMkske_ErZSX9rL4LkwA@mail.gmail.com>
Subject: Re: BUG with linux 5.9.0 with dwc3 in gadget mode
To:     Ferry Toth <fntoth@gmail.com>, Felipe Balbi <balbi@kernel.org>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Jack Pham <jackp@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

+Cc: Felipe (Ferry, note the correct address)

On Tue, Oct 27, 2020 at 10:13 PM Ferry Toth <fntoth@gmail.com> wrote:
>
> Hi guys,
>
> Sorry for messing up the CC list. This was partly thanks to gmane,
> partly my own stupidity. I hope it is complete now.
>
> I am summarizing the status of this one at the bottom.
>
> Op 22-10-2020 om 15:43 schreef Andy Shevchenko:
> > On Thu, Oct 22, 2020 at 4:21 PM Thinh Nguyen <Thinh.Nguyen@synopsys.com> wrote:
> >> Ferry Toth wrote:
> >>> Op 21-10-2020 om 21:50 schreef Thinh Nguyen:
> >>>> Ferry Toth wrote:
> > ...
> >
> >>>> Oops, looks like I can't make it synchronous this way. Can you try
> >>>> Jack's change to the u_audio.c instead?
> >>> Oops indeed goes away with Jack's change, but usb connection goes
> >>> up/down continuously, meaning: my host sees usb network and audio
> >>> device appearing / disappearing.
> >> Ok, thanks for verifying that it went away.
> >>
> >>> mass_storage device does not appear all.
> >> There are some fixes to dwc3 in kernel mainline. Is it possible to test
> >> this against linux-next?
> > I think the best is to wait for v5.10-rc1 and retest.
> >
> I looks like there have been at least 3 problems:
>
> 1) dwc3 was not working in host mode, but not causing an oops. This may
> have been caused by platform changes. Andy has provided a fix for this,
> dwc3 now working in host mode on 5.9
>
> 2) dwc3 was causing the oops in gadget mode as referenced in this
> thread. The experimental patch from Jack Phan indeed fixes this.
>
> Code here: https://github.com/edison-fw/linux/commits/eds-acpi-5.9.0
>
> 3) With the above 2 fixes gadgets work but seem to be powered down
> (after 15 sec. or so) and up (after 1 sec.) continuously. No oops, no
> errors in journal. The gadgets I enabled are a network, sound and mass
> storage. The latter stops working due to going up/down quickly. But my
> host shows network/sound appearing/disappearing. Journal of edison shows:
>
> systemd-networkd[525]: usb0: Gained carrier
> systemd-networkd[525]: usb0: Gained IPv6LL
> systemd-networkd[525]: usb0: Lost carrier
> systemd-networkd[525]: usb0: Gained carrier
> systemd-networkd[525]: usb0: Gained IPv6LL
> systemd-networkd[525]: usb0: Lost carrier
>
> Any ideas how to proceed are highly welcomed!
>
>


-- 
With Best Regards,
Andy Shevchenko
