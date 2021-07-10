Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5AE63C35B7
	for <lists+linux-usb@lfdr.de>; Sat, 10 Jul 2021 19:16:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbhGJRKw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 10 Jul 2021 13:10:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbhGJRKv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 10 Jul 2021 13:10:51 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84192C0613DD
        for <linux-usb@vger.kernel.org>; Sat, 10 Jul 2021 10:08:06 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id b2so23106833ejg.8
        for <linux-usb@vger.kernel.org>; Sat, 10 Jul 2021 10:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8sBYTJuQ75JTZT4uHwVhodoPEm3mG4wWISso+dIOLYk=;
        b=RpcCUwmSSb7NNcjart/+Nz5p0W6e9bl/Qtqpi4UskBwAhgw00UAmDHiS5Ul0CCe5t9
         9iQOJv0+7mcoTcW01YjsMoxvNqUX5QFN8yCYXidvw4OlESnSHomPPRFlyjngAgqC51Qh
         VWHQoad4/dcGmysSeZA6s9uCFHKx79fFM8bJzFtfLwIDJ6zcBP4uMBxbb1vH6xiU6WnP
         tf7Eo83rCJZMMLaIlpModMik0J/mPeANUqd4rAnZoJl+mIleKsAfFZ6A7Wdy1W/GxcOZ
         VWA0XJEy6MC9zltKUJGKZgU4NAtyi5VhZpmfn+fvf4IaSISjVcrAXDtgJqGduqWUlpsR
         nuaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8sBYTJuQ75JTZT4uHwVhodoPEm3mG4wWISso+dIOLYk=;
        b=QwOJ+IlMfx6i0RD1BZnNDJ/ps39+EAbkUUXK/SlwiwyjSWYmFznIeKvkNg8jC2a5BQ
         4AmoIe2JNxNs33fmJcok2uwtA7T3aRycDXs4r/8wI4KX48ePENT6Tb6FQ3FJyHcmnD5+
         1ybdiWBTFes5yOiNGQbVMtdyqrlyqqEyo3mKu/3l1NcE+4pbVeRL6OMZqBrXTbCy825d
         UWtfF/+9Lfs62Zq0Rpf0Yn7Z2i6oRlIs98IpEC1gpXNA4upCwTlVFdhttpOKg2Ic9WvJ
         IeExuUa84+r84ju1BZBkzl0Lu8lw+1TjUKZFURcAVfbGOl8LOrZeDnHIgmVN4w4wAawl
         AJUw==
X-Gm-Message-State: AOAM530JN4Rkr3+Cn7k9qK1QSWyZg/q/XM8KSW+q1aSr97hOE44OVodo
        mgleQsXE/o8XN+sn8X+WKlqR0DRPZgtEVTLy2r8=
X-Google-Smtp-Source: ABdhPJzDljglsF2bwqagKTnNx1jViPlKg5RdyLJejdd8xFuatysTEXQgE+C52tds4bMMu8jatSndxbF8d+knW/byZVI=
X-Received: by 2002:a17:906:2306:: with SMTP id l6mr43270855eja.362.1625936885095;
 Sat, 10 Jul 2021 10:08:05 -0700 (PDT)
MIME-Version: 1.0
References: <0badab7c-f12e-e9ed-2f90-2cf5f25f4038@bluematt.me>
 <20210628005825.GA638648@rowland.harvard.edu> <e421818c-dea4-ba6b-e737-bb8d99582588@bluematt.me>
 <20210628011628.GC638648@rowland.harvard.edu> <0c62655d-738c-4d71-6b7b-fe7fa90b54e3@bluematt.me>
 <20210628142418.GC656159@rowland.harvard.edu> <CAFBinCA9Y16Ej3PEBN1Rsqo=6V1AZXKOpTfc_siHP0rvVo7wWQ@mail.gmail.com>
 <20210629150541.GB699290@rowland.harvard.edu> <CAFBinCCOGJfHSSHgRrOO-FQJZAUB=QuMr=BoddPLt19spp0QBg@mail.gmail.com>
 <20210629161807.GB703497@rowland.harvard.edu> <CAFBinCDsGtQaPLhMAb+A6DBihWzQiU409i2oer_ud5yQBvfM5w@mail.gmail.com>
 <CAFBinCDc6RUypJpujmYdkjo6j-xsg0HkZEZGxTCsTW4tZ-bJPA@mail.gmail.com>
In-Reply-To: <CAFBinCDc6RUypJpujmYdkjo6j-xsg0HkZEZGxTCsTW4tZ-bJPA@mail.gmail.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Sat, 10 Jul 2021 19:07:54 +0200
Message-ID: <CAFBinCA083iP4T2b1+MoDGZFKMO8eyy-WceRBA-QibatqboO1A@mail.gmail.com>
Subject: Re: ODROID-C1/-C2 USB Detection only triggered by some devices
To:     Minas Harutyunyan <hminas@synopsys.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Matt Corallo <oc2udbzfd@mattcorallo.com>,
        linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux.amoon@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Minas,

On Thu, Jul 1, 2021 at 1:09 AM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Minas,
>
> On Tue, Jun 29, 2021 at 6:30 PM Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
> >
> > Hi Alan,
> >
> > On Tue, Jun 29, 2021 at 6:18 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> > [...]
> > > > >         usbcore.autosuspend=-1
> > > > wow, this helps indeed
> > > > my steps are:
> > > > - power off my Odroid-C1+
> > > > - unplug all USB devices
> > > > - boot with usbcore.autosuspend=-1 in the kernel cmdline
> > > > - plugin my Corsair Voyager USB 3.0 flash drive (which was only
> > > > detected before if an additional USB 2.0 flash drive was plugged in
> > > > during boot)
> > > > -> without any lsusb magic the device was immediately recognized
> > >
> > > That does show pretty convincingly that runtime suspend is causing the
> > > problem.  But I still have no idea why the problem affects some devices
> > > and not others.  It's a mystery.
> > Maybe because there's two related problems (I am guessing here):
> > The first issue is that USB hotplug is not working at all on my
> > Odroid-C1+ (which means: dwc2 + GL852G USB hub).
> > The second issue is that the workaround we had before (running lsusb
> > -vv to make "hot plugged" devices show up) is not working for some USB
> > devices.
> >
> > It seems that using a different workaround (usbcore.autosuspend=-1)
> > makes *all* USB devices show up - even without any "lsusb -vv" call.
> > So I think we should focus on the first issue as it may also fix the
> > other problem as well.
> above paragraph sums up the issues which Matt and I are seeing (on
> Odroid-C1+ and Odroid-C2) in case you didn't follow the full email
> thread
It's been a week since I sent my last mail
In case you are taking some days off: enjoy that time!
Please let us know if you have any questions about this as we're
looking forward to some hints on how to debug (and of course fix!)
this.


Best regards,
Martin
