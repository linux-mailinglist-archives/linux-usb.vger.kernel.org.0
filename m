Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 231073C944F
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jul 2021 01:17:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234532AbhGNXTv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Jul 2021 19:19:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230242AbhGNXTu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Jul 2021 19:19:50 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2381DC06175F
        for <linux-usb@vger.kernel.org>; Wed, 14 Jul 2021 16:16:57 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id oz7so2190599ejc.2
        for <linux-usb@vger.kernel.org>; Wed, 14 Jul 2021 16:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mrbFKckMMKNYGKvvcOWxG9c8XzlVvQUpQ/4fdIwwFzs=;
        b=A23ih7BXmZQ1TpIJ17SZjd4DSS/TT9b5L2N04RLkrxg0enJL/KsU44sd862Fvtrm8k
         8kKj3gJvauJo0I6VeRBCrou7HkAArdH70EfbYHxV8ql0rfS6zWlZ9C41KRWq9EPnpnza
         xvHurpX0FLi8zQZjompHAeGJBJWL5IVsXybmBwYi/CK90MuIvWL9HxAmF4G1ubL9CFaA
         Xlt7jLr/YQsERUbryC6Eq/0Jzs5LyVw7deSZB6MWuOcC2Y5KEVD8QfkthnVvGnQqM5R3
         ySOSxNa0IDw5lKGHfenccWaBQ29Hpx85uk84HmWRWYvBuCdWThVe2TukLmJBNok1m3ZJ
         dZLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mrbFKckMMKNYGKvvcOWxG9c8XzlVvQUpQ/4fdIwwFzs=;
        b=l2hd3ENMcvqu2Box7hRGYDl/ViwkTI/hEf9ShixprHvu6MUN81LR7UjBLdxKjSBNRm
         RKLug0TyhxyXAQuBngPdI2Ypw1DjXG2N32/2ISS6ITFeHIePx50K3ZLVb1I4xYKOQvNA
         aFGcsx9hL3k3hnKJRTr+6AMdoZYrcFlrhdMgqa5DrsxXYyias2iY/4X3KpcxfRM9Myei
         3BJ30NnIs4WMDdN81MIAYzOBMKr8NHs/1CpLPksxz9CNiook8guaYC3J/ycP4AD26T3R
         3guVktGMmWQ9oYkmuxOn4+B+RCvd+UEx4X98eEPtD9HgEXk+pDPgHL2ZeMFfoFYISH0u
         lmSQ==
X-Gm-Message-State: AOAM531LTR4HHAHqrFt/xu+AvVyNP6jfzLVnyByqR/ezYzA/IMJIeQij
        BxpyNvOAIgdBqCwHURW5tFID39ZSDwfWj2nitho=
X-Google-Smtp-Source: ABdhPJxdZi3UwL5moLhXQLEuo08EYBumbkJsU+OsqFjxInAKI9LtqwE4vCin2np1L5SYjXv+AqxhIhZzonmHPcvaxZQ=
X-Received: by 2002:a17:906:39c3:: with SMTP id i3mr667189eje.527.1626304615708;
 Wed, 14 Jul 2021 16:16:55 -0700 (PDT)
MIME-Version: 1.0
References: <0badab7c-f12e-e9ed-2f90-2cf5f25f4038@bluematt.me>
 <20210628005825.GA638648@rowland.harvard.edu> <e421818c-dea4-ba6b-e737-bb8d99582588@bluematt.me>
 <20210628011628.GC638648@rowland.harvard.edu> <0c62655d-738c-4d71-6b7b-fe7fa90b54e3@bluematt.me>
 <20210628142418.GC656159@rowland.harvard.edu> <CAFBinCA9Y16Ej3PEBN1Rsqo=6V1AZXKOpTfc_siHP0rvVo7wWQ@mail.gmail.com>
 <20210629150541.GB699290@rowland.harvard.edu> <CAFBinCCOGJfHSSHgRrOO-FQJZAUB=QuMr=BoddPLt19spp0QBg@mail.gmail.com>
 <20210629161807.GB703497@rowland.harvard.edu> <CAFBinCDsGtQaPLhMAb+A6DBihWzQiU409i2oer_ud5yQBvfM5w@mail.gmail.com>
 <CAFBinCDc6RUypJpujmYdkjo6j-xsg0HkZEZGxTCsTW4tZ-bJPA@mail.gmail.com>
 <CAFBinCA083iP4T2b1+MoDGZFKMO8eyy-WceRBA-QibatqboO1A@mail.gmail.com>
 <f084f45a-5be0-9542-260a-f4641e1215d0@synopsys.com> <CAFBinCCj5zUiv9LS2jKRxzX5pfcFTr4tVZwR7TA2CRQg68qwTw@mail.gmail.com>
 <822c3852-1d15-2976-8672-e49ae34c328f@synopsys.com> <CAFBinCC_0RpCMsj3AUt9fZrjHi6_qFirQtRR1g5VJcn45GpWAw@mail.gmail.com>
 <ad475275-eb2c-6309-fc59-494f94bf0605@synopsys.com>
In-Reply-To: <ad475275-eb2c-6309-fc59-494f94bf0605@synopsys.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Thu, 15 Jul 2021 01:16:44 +0200
Message-ID: <CAFBinCCXioWL+ZGwvC8Ltrmx4y2XpGK03JAm8X=wDB4_dQ+pFA@mail.gmail.com>
Subject: Re: ODROID-C1/-C2 USB Detection only triggered by some devices dwc2
To:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Matt Corallo <oc2udbzfd@mattcorallo.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-amlogic@lists.infradead.org" 
        <linux-amlogic@lists.infradead.org>,
        "linux.amoon@gmail.com" <linux.amoon@gmail.com>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Content-Type: multipart/mixed; boundary="000000000000ea91c205c71d8c45"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--000000000000ea91c205c71d8c45
Content-Type: text/plain; charset="UTF-8"

Hi Minas,

On Wed, Jul 14, 2021 at 5:27 PM Minas Harutyunyan
<Minas.Harutyunyan@synopsys.com> wrote:
>
> Hi Martin,
>
> On 7/12/2021 3:35 PM, Martin Blumenstingl wrote:
> > Hi Minas,
> >
> > On Mon, Jul 12, 2021 at 8:42 AM Minas Harutyunyan
> > <Minas.Harutyunyan@synopsys.com> wrote:
> > [...]
> >>> 3. unplugging the Corsair Voyager and plugging in a USB 3.0 card
> >>> reader (nothing automatically happened), then running lsusb -vv and
> >>> lsusb -t
> >> Could you please set verbose debugging:
> >> CONFIG_USB_DWC2_VERBOSE=y
> >>
> >> and repeat test 3. There are couple of transaction errors and some EP
> >> stalled. I want to understand on which device/ep this happen.
> > sure, I attached the dmesg output (gzipped, since it's uncompressed
> > size is 1.5M) with CONFIG_USB_DWC2_VERBOSE=y
> > The lsusb -vv and lsusb -t outputs are the same so I did not attach them again.
> >
> >
> > Best regards,
> > Martin
> >
>
> Per our understanding this issue is because of power budget and
> autosuspend functionality.
Many thanks for doing this investigation!

> Autosuspend. Please review this patch: "usb: core: hub: Disable
> autosuspend for Cypress CY7C65632"
>
> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-next&id=a7d8d1c7a7f73e780aa9ae74926ae5985b2f895f
>
> It's very similar to your case. Actually you already tested
> usbcore.autosuspend=-1 and it's helped you.
> Could you please develop same patch for your soldered hub and test it.
I found that drivers/usb/core/hub.c already has an entry for Genesys
Logic USB hubs.
It uses HUB_QUIRK_CHECK_PORT_AUTOSUSPEND instead of
HUB_QUIRK_DISABLE_AUTOSUSPEND though.
So I wrote a patch to change that (I attached it to this mail for
reference, I will submit it as a proper patch one I understand enough
about this).

With this patch applied all USB devices I have are auto-detected when
hot-plugged.

My doubt with this is that my desktop PC (using an ASUS B550-F
motherboard) comes with a few of these USB hubs soldered down as well
- and there the behavior is different.
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/10p, 480M
   ID 1d6b:0002 Linux Foundation 2.0 root hub
   /sys/bus/usb/devices/usb1  /dev/bus/usb/001/001
   |__ Port 3: Dev 2, If 0, Class=Hub, Driver=hub/4p, 480M
       ID 05e3:0610 Genesys Logic, Inc. Hub
       /sys/bus/usb/devices/1-3  /dev/bus/usb/001/002
[...]
   |__ Port 7: Dev 5, If 0, Class=Hub, Driver=hub/4p, 480M
       ID 05e3:0610 Genesys Logic, Inc. Hub
       /sys/bus/usb/devices/1-7  /dev/bus/usb/001/005

I plugged in the Corsair Voyager USB 3.0 drive which is not being
detected on my Odroid-C1+ and instantly this shows up in my kernel
log:
  usb 1-7.3: new high-speed USB device number 46 using xhci_hcd
  usb 1-7.3: New USB device found, idVendor=1b1c, idProduct=1a03,
bcdDevice= a.00
  usb 1-7.3: New USB device strings: Mfr=1, Product=2, SerialNumber=3
  usb 1-7.3: Product: Voyager 3.0
  usb 1-7.3: Manufacturer: Corsair

So I am wondering why it works there but not on my Odroid-C1, with the
(only known) difference being the host controller (xhci_hcd vs dwc2)
which is being used.

> Power budget. Old, cheap flash disks required about 200-300ma, but most
> of USB3 devices require 500ma. It could be serious issue to explore this
> devices with USB2 hubs. Even if this type of devices will successfully
> enumerated on EP0 without power problems, after set_interface when
> enabling multiple EP's (i.e. BULK IN and OUT for mass storage) power
> requirements should be increased which can violate USB2 hub port rules.
With your hint from above (thanks again!) I found commit
1208f9e1d758c9 ("USB: hub: Fix the broken detection of USB3 device in
SMSC hub").
The message of that commit says: [...] Board is [...] not able to
detect the USB3.0 mass storage devices
Using HUB_QUIRK_DISABLE_AUTOSUSPEND makes all of my USB 3.0 devices
show up as well during hot-plug (no lsusb trickery needed).
So while there may be some power budget issue, I think the main
problem for me is the hub suspend.


Best regards,
Martin

--000000000000ea91c205c71d8c45
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="genesys-logic-use-disable-autosuspend-quirk.diff"
Content-Disposition: attachment; 
	filename="genesys-logic-use-disable-autosuspend-quirk.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_kr439mzk0>
X-Attachment-Id: f_kr439mzk0

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2NvcmUvaHViLmMgYi9kcml2ZXJzL3VzYi9jb3JlL2h1
Yi5jCmluZGV4IGQxZWZjNzE0MTMzMy4uYWMzOWQxNWFmNmJhIDEwMDY0NAotLS0gYS9kcml2ZXJz
L3VzYi9jb3JlL2h1Yi5jCisrKyBiL2RyaXZlcnMvdXNiL2NvcmUvaHViLmMKQEAgLTU3MzAsNyAr
NTczMCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdXNiX2RldmljZV9pZCBodWJfaWRfdGFibGVb
XSA9IHsKIAkJCXwgVVNCX0RFVklDRV9JRF9NQVRDSF9JTlRfQ0xBU1MsCiAgICAgICAuaWRWZW5k
b3IgPSBVU0JfVkVORE9SX0dFTkVTWVNfTE9HSUMsCiAgICAgICAuYkludGVyZmFjZUNsYXNzID0g
VVNCX0NMQVNTX0hVQiwKLSAgICAgIC5kcml2ZXJfaW5mbyA9IEhVQl9RVUlSS19DSEVDS19QT1JU
X0FVVE9TVVNQRU5EfSwKKyAgICAgIC5kcml2ZXJfaW5mbyA9IEhVQl9RVUlSS19ESVNBQkxFX0FV
VE9TVVNQRU5EfSwKICAgICB7IC5tYXRjaF9mbGFncyA9IFVTQl9ERVZJQ0VfSURfTUFUQ0hfREVW
X0NMQVNTLAogICAgICAgLmJEZXZpY2VDbGFzcyA9IFVTQl9DTEFTU19IVUJ9LAogICAgIHsgLm1h
dGNoX2ZsYWdzID0gVVNCX0RFVklDRV9JRF9NQVRDSF9JTlRfQ0xBU1MsCg==
--000000000000ea91c205c71d8c45--
