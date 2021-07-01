Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAFD03B904F
	for <lists+linux-usb@lfdr.de>; Thu,  1 Jul 2021 12:04:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235850AbhGAKGf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 1 Jul 2021 06:06:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235821AbhGAKGe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 1 Jul 2021 06:06:34 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EFDFC061756
        for <linux-usb@vger.kernel.org>; Thu,  1 Jul 2021 03:04:04 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id h2so7596062edt.3
        for <linux-usb@vger.kernel.org>; Thu, 01 Jul 2021 03:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QY5bw15h88tSqH2ZJxmWagkX1D3b50elYep8eH36Gn8=;
        b=dFRsW0Gt9hiXUsgfLYIbbOrHy0UJwjteKYsYdigWX9dAONnIqgS6vKRDjt1vaeqeIQ
         DmlVVZtTn5XG3zCnVTTE5HU3rDJTPkcFBeqs8VzjBOP2V9Ns/WOQm5ng+jUuQ0EY146b
         KOh5QwnkTvxbjs8ecMOblwH5zUQS3rIR0D3nA219ahn+aQ/vndPxqxXIm3ItueoM7VF3
         f7uJrThfl7/h8rPLFrh7Qvet8GDmjfyv/+KpyR0jFnls4TgAsTsQFasxUuVUKmp80Llo
         7Sm7v9v0xBEAJrj2E8/qZ3aHi91HHvy8Jho6mbFj1WDU2ZzXKyg3C5YbL2MIpjpl++7f
         3LpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QY5bw15h88tSqH2ZJxmWagkX1D3b50elYep8eH36Gn8=;
        b=ifcb9IGSeZ20q//t1hVgCkm7ccL3JKzQHty24pi/5rH6/9w5UHnBfsL2sdDcz6n5wu
         0eh7WYT4LK/Ce3lZl2ygJjuDCujcJF2zweR0Dt1ql/VeOpuZSp1A1s5IFH0E1aE7covQ
         F7QRVLKwvesWTzVRSOk8wHSE+aex56Qfo0/zSa4alzpymhZIgF2xAvtHR93iP9nYp5wF
         zxNQ/0ZLe/++YZ1G3vkU32aXsSQdCV3IsaszsSiLrhKVhu7wbtupqFZcSh/F/LPvcxuB
         GC1aB8OegU3ir38fB1wUT9kfTERvaMDgAYMYjR2A5MgFcF6peh03KttRIuJMg7bwSXKN
         GiNA==
X-Gm-Message-State: AOAM530vUFLDEewKCNIXtny3HshdAStf2cozz0P7U3m0Q9JyDjay9nZO
        5ZC4S8tBiaz6OOfBcDYEnqjftWhvWx6T8syt9Bk=
X-Google-Smtp-Source: ABdhPJytw7Nwza/abDm9MdT2ICBzM/Ok2YHDgBqSSqKoghNZRenJUoGGDvWZFXJncc9P2p/iSHDZp2mLeoNAn+g2Zes=
X-Received: by 2002:a05:6402:3581:: with SMTP id y1mr52623924edc.31.1625133842478;
 Thu, 01 Jul 2021 03:04:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210628005825.GA638648@rowland.harvard.edu> <e421818c-dea4-ba6b-e737-bb8d99582588@bluematt.me>
 <20210628011628.GC638648@rowland.harvard.edu> <0c62655d-738c-4d71-6b7b-fe7fa90b54e3@bluematt.me>
 <20210628142418.GC656159@rowland.harvard.edu> <CAFBinCA9Y16Ej3PEBN1Rsqo=6V1AZXKOpTfc_siHP0rvVo7wWQ@mail.gmail.com>
 <20210629150541.GB699290@rowland.harvard.edu> <CAFBinCCOGJfHSSHgRrOO-FQJZAUB=QuMr=BoddPLt19spp0QBg@mail.gmail.com>
 <20210629161807.GB703497@rowland.harvard.edu> <CAFBinCDsGtQaPLhMAb+A6DBihWzQiU409i2oer_ud5yQBvfM5w@mail.gmail.com>
 <20210630003556.GA718579@rowland.harvard.edu>
In-Reply-To: <20210630003556.GA718579@rowland.harvard.edu>
From:   Anand Moon <linux.amoon@gmail.com>
Date:   Thu, 1 Jul 2021 15:33:51 +0530
Message-ID: <CANAwSgQadG+A2Tg2Ok5-Nw4i1a2tenABeyQnyTjzJKGHHw+6aA@mail.gmail.com>
Subject: Re: ODROID-C1/-C2 USB Detection only triggered by some devices
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Minas Harutyunyan <hminas@synopsys.com>,
        Matt Corallo <oc2udbzfd@mattcorallo.com>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>,
        linux-amlogic@lists.infradead.org
Content-Type: multipart/mixed; boundary="00000000000065090905c60cf545"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--00000000000065090905c60cf545
Content-Type: text/plain; charset="UTF-8"

Hi Martin & Alan & Matt,

On Wed, 30 Jun 2021 at 06:05, Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Tue, Jun 29, 2021 at 06:30:08PM +0200, Martin Blumenstingl wrote:
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
>
> Those two issues could well be related; they could both be a result of
> improper handling of USB bus suspend.  Fixing that might fix both
> issues.
>
> Alan Stern
>
> > [...]
> > > > after rebooting without usbcore.autosuspend=-1 (and no USB device
> > > > plugged in during boot):
> > > > # grep "" /sys/bus/usb/devices/*/power/autosuspend
> > > > /sys/bus/usb/devices/1-1/power/autosuspend:0
> > > > /sys/bus/usb/devices/usb1/power/autosuspend:0
> > > >
> > > > I think the next step is narrowing down which component is causing this issue.
> > >
> > > Maybe Minas can help.  He knows a lot more about dwc2 than I do (which
> > > is practically nothing).
> > I'll wait for Minas then
> >
> > > > Interestingly my PC (running 5.12.13-arch1-2) also has two Genesys
> > > > Logic USB hubs with the same USB vendor and device IDs as my
> > > > Odroid-C1+: 05e3:0610.
> > > > These hubs are connected to my AMD Ryzen 5000 CPU or the B550 chipset:
> > > > usb1              1d6b:0002 09 1IF  [USB 2.00,   480 Mbps,   0mA]
> > > > (xhci-hcd 0000:02:00.0) hub
> > > >  1-3               05e3:0610 09 1IF  [USB 2.10,   480 Mbps, 100mA]
> > > > (GenesysLogic USB2.0 Hub) hub
> > > > [...]
> > > >  1-7               05e3:0610 09 1IF  [USB 2.00,   480 Mbps, 100mA]
> > > > (Genesys Logic, Inc. Hub) hub
> > > >
> > > > So far I have not observed any problems on my PC.
> > >
> > > Presumably because it uses xHCI rather than dwc2.
> > indeed. I think it's good to know that it's not an issue affecting all
> > Genesys Logic USB 2.0 hubs.
> > As you mentioned above it's most likely that dwc2 is the culprit here.
> > Or it might be some interoperability issue between dwc2 and GL852G
> >
> >
> > Best regards,
> > Martin

I have been trying some reorder code changes with PHY some new DTS
changes both on C1+ and C2.
with my changes I got false positve results.

So in my debug investigation, it seems that USB reset is not working.
I am attaching my latest code changes so that you could verify at your end.
If we drop the  phy_meson8b_usb2_reset(phy) all the USB PHY get initialized.
Note:  phy core does not call the .reset callback function on its own

I have tried crazy ideas with reset API and new approaches, but it seems to fail
and also used the reset-name features, but with no luck at my end.
I wil try to followup on the suggestion shared in this email thread.

I am attaching my usbmon output on Odroid C2.

On some other note on USB HUB reset. I recollect following series (it
like *mmc_pwrseq*)
[0] https://lore.kernel.org/linux-devicetree/1474342607-27512-1-git-send-email-peter.chen@nxp.com/

In oder to handle USB HUB reset on Amlogic SoC.
[1] https://elixir.bootlin.com/linux/latest/source/arch/arm/boot/dts/meson8b-odroidc1.dts#L285

Thanks
-Anand

Below is the reset that failed on Odroicd C1+ with my latest changes.

[    1.264654] dwc2 c9040000.usb: mapped PA c9040000 to VA (ptrval)
[    1.264796] dwc2 c9040000.usb: Looking up vusb_d-supply from device tree
[    1.264811] dwc2 c9040000.usb: Looking up vusb_d-supply property in
node /soc/usb@c9040000 failed
[    1.264842] dwc2 c9040000.usb: supply vusb_d not found, using dummy regulator
[    1.264970] dwc2 c9040000.usb: Looking up vusb_a-supply from device tree
[    1.264984] dwc2 c9040000.usb: Looking up vusb_a-supply property in
node /soc/usb@c9040000 failed
[    1.265005] dwc2 c9040000.usb: supply vusb_a not found, using dummy regulator
[    1.265067] dwc2 c9040000.usb: registering common handler for irq35
[    1.265122] dwc2 c9040000.usb: Looking up vbus-supply from device tree
[    1.265133] dwc2 c9040000.usb: Looking up vbus-supply property in
node /soc/usb@c9040000 failed
[    1.266287] phy phy-c1108800.phy.0: Anand you are calling USB reset1
[    1.266299] phy phy-c1108800.phy.0: Anand you are calling USB reset2
[    1.266319] dwc2 c9040000.usb: Core Release: 3.10a (snpsid=4f54310a)
[    1.270234] dwc2 c9040000.usb: dwc2_core_reset: HANG! Soft Reset
timeout GRSTCTL_CSFTRST
[    1.270561] dwc2: probe of c9040000.usb failed with error -16
[    1.272469] dwc2 c90c0000.usb: mapped PA c90c0000 to VA (ptrval)
[    1.272597] dwc2 c90c0000.usb: Looking up vusb_d-supply from device tree
[    1.272611] dwc2 c90c0000.usb: Looking up vusb_d-supply property in
node /soc/usb@c90c0000 failed
[    1.272639] dwc2 c90c0000.usb: supply vusb_d not found, using dummy regulator
[    1.272777] dwc2 c90c0000.usb: Looking up vusb_a-supply from device tree
[    1.272790] dwc2 c90c0000.usb: Looking up vusb_a-supply property in
node /soc/usb@c90c0000 failed
[    1.272812] dwc2 c90c0000.usb: supply vusb_a not found, using dummy regulator
[    1.272869] dwc2 c90c0000.usb: registering common handler for irq36
[    1.272920] dwc2 c90c0000.usb: Looking up vbus-supply from device tree
[    1.272932] dwc2 c90c0000.usb: Looking up vbus-supply property in
node /soc/usb@c90c0000 failed
[    1.274094] phy phy-c1108820.phy.1: Anand you are calling USB reset1
[    1.274105] phy phy-c1108820.phy.1: Anand you are calling USB reset2
[    1.274124] dwc2 c90c0000.usb: Core Release: 3.10a (snpsid=4f54310a)
[    1.278078] dwc2 c90c0000.usb: dwc2_core_reset: HANG! Soft Reset
timeout GRSTCTL_CSFTRST
[    1.278388] dwc2: probe of c90c0000.usb failed with error -16

--00000000000065090905c60cf545
Content-Type: application/octet-stream; name="mytesting_c1_reset.patch"
Content-Disposition: attachment; filename="mytesting_c1_reset.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_kqkh00al0>
X-Attachment-Id: f_kqkh00al0

ZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL21lc29uOGItb2Ryb2lkYzEuZHRzIGIvYXJj
aC9hcm0vYm9vdC9kdHMvbWVzb244Yi1vZHJvaWRjMS5kdHMKaW5kZXggYzQ0MGVmOTRlMDgyLi43
Yjg1ZGRkNjQ1YTUgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL21lc29uOGItb2Ryb2lk
YzEuZHRzCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL21lc29uOGItb2Ryb2lkYzEuZHRzCkBAIC0z
Miw2ICszMiwyNiBAQCBlbW1jX3B3cnNlcTogZW1tYy1wd3JzZXEgewogCQlyZXNldC1ncGlvcyA9
IDwmZ3BpbyBCT09UXzkgR1BJT19BQ1RJVkVfTE9XPjsKIAl9OwogCisJdXNiX290Z19wd3I6IHJl
Z3VsYXRvci11c2ItcHdycyB7CisJCWNvbXBhdGlibGUgPSAicmVndWxhdG9yLWZpeGVkIjsKKwor
CQlyZWd1bGF0b3ItbmFtZSA9ICJVU0JfT1RHX1BXUiI7CisJCXJlZ3VsYXRvci1taW4tbWljcm92
b2x0ID0gPDUwMDAwMDA+OworCQlyZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA9IDw1MDAwMDAwPjsK
KwkJcmVndWxhdG9yLWFsd2F5cy1vbjsKKwkJcmVndWxhdG9yLWJvb3Qtb247CisKKwkJLyoKKwkJ
ICogc2lnbmFsIG5hbWUgZnJvbSBzY2hlbWF0aWNzOiBQV1JFTgorCQkgKi8KKwkJZ3BpbyA9IDwm
Z3Bpb19hbyBHUElPQU9fNSBHUElPX09QRU5fRFJBSU4+OworCQllbmFibGUtYWN0aXZlLWhpZ2g7
CisJCS8qCisJCSAqIHNpZ25hbCBuYW1lIGZyb20gc2NoZW1hdGljczogVVNCX1BPV0VSCisJCSAq
LworCQl2aW4tc3VwcGx5ID0gPCZwNXYwPjsKKwl9OworCiAJbGVkcyB7CiAJCWNvbXBhdGlibGUg
PSAiZ3Bpby1sZWRzIjsKIAkJYmx1ZSB7CkBAIC00OCw2ICs2OCw4IEBAIHA1djA6IHJlZ3VsYXRv
ci1wNXYwIHsKIAkJcmVndWxhdG9yLW5hbWUgPSAiUDVWMCI7CiAJCXJlZ3VsYXRvci1taW4tbWlj
cm92b2x0ID0gPDUwMDAwMDA+OwogCQlyZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA9IDw1MDAwMDAw
PjsKKwkJcmVndWxhdG9yLWFsd2F5cy1vbjsKKwkJcmVndWxhdG9yLWJvb3Qtb247CiAJfTsKIAog
CXRmbGFzaF92ZGQ6IHJlZ3VsYXRvci10Zmxhc2hfdmRkIHsKQEAgLTEzNSw2ICsxNTcsNyBAQCB2
Y2NrOiByZWd1bGF0b3ItdmNjayB7CiAKIAkJcHdtcyA9IDwmcHdtX2NkIDAgMTIyMTggMD47CiAJ
CXB3bS1kdXR5Y3ljbGUtcmFuZ2UgPSA8OTEgMD47CisJCXJlZ3VsYXRvci1yYW1wLWRlbGF5ID0g
PDEyNTA+OwogCiAJCXJlZ3VsYXRvci1ib290LW9uOwogCQlyZWd1bGF0b3ItYWx3YXlzLW9uOwpA
QCAtMzc2LDEwICszOTksMTkgQEAgJnVhcnRfQU8gewogCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVs
dCI7CiB9OwogCismdXNiMF9waHkgeworCXN0YXR1cyA9ICJva2F5IjsKKwlwaHktc3VwcGx5ID0g
PCZ1c2Jfb3RnX3B3cj47Cit9OworCiAmdXNiMV9waHkgewogCXN0YXR1cyA9ICJva2F5IjsKKwlw
aHktc3VwcGx5ID0gPCZ1c2Jfb3RnX3B3cj47CiB9OwogCismdXNiMCB7CisJc3RhdHVzID0gIm9r
YXkiOworfTsKICZ1c2IxIHsKIAlzdGF0dXMgPSAib2theSI7CiB9OwpkaWZmIC0tZ2l0IGEvYXJj
aC9hcm0vY29uZmlncy9tdWx0aV92N19kZWZjb25maWcgYi9hcmNoL2FybS9jb25maWdzL211bHRp
X3Y3X2RlZmNvbmZpZwppbmRleCA1MmEwNDAwZmRkOTIuLjEzYmRiMGEzYzc2ZCAxMDA2NDQKLS0t
IGEvYXJjaC9hcm0vY29uZmlncy9tdWx0aV92N19kZWZjb25maWcKKysrIGIvYXJjaC9hcm0vY29u
Zmlncy9tdWx0aV92N19kZWZjb25maWcKQEAgLTI4Niw2ICsyODYsNyBAQCBDT05GSUdfTUlDUkVM
X1BIWT15CiBDT05GSUdfQVQ4MDNYX1BIWT15CiBDT05GSUdfUk9DS0NISVBfUEhZPXkKIENPTkZJ
R19TTVNDX1BIWT15CitDT05GSUdfVVNCX0RXQzJfREVCVUc9eQogQ09ORklHX1VTQl9QRUdBU1VT
PXkKIENPTkZJR19VU0JfUlRMODE1Mj1tCiBDT05GSUdfVVNCX0xBTjc4WFg9bQpAQCAtNTgzLDYg
KzU4NCw3IEBAIENPTkZJR19NRkRfVFBTNjU4Nlg9eQogQ09ORklHX01GRF9UUFM2NTkxMD15CiBD
T05GSUdfTUZEX1NUTTMyX0xQVElNRVI9bQogQ09ORklHX01GRF9TVFBNSUMxPXkKK0NPTkZJR19S
RUdVTEFUT1JfREVCVUc9eQogQ09ORklHX1JFR1VMQVRPUl9BQ1Q4ODY1PXkKIENPTkZJR19SRUdV
TEFUT1JfQUNUODk0NUE9eQogQ09ORklHX1JFR1VMQVRPUl9BTkFUT1A9eQpAQCAtODc1LDYgKzg3
Nyw3IEBAIENPTkZJR19NTUNfU0RIQ0lfU1Q9eQogQ09ORklHX01NQ19PTUFQPXkKIENPTkZJR19N
TUNfT01BUF9IUz15CiBDT05GSUdfTU1DX0FUTUVMTUNJPXkKK0NPTkZJR19NTUNfTUVTT05fTVhf
U0RIQz15CiBDT05GSUdfTU1DX1NESENJX01TTT15CiBDT05GSUdfTU1DX01WU0RJTz15CiBDT05G
SUdfTU1DX1NESEk9eQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9waHkvYW1sb2dpYy9waHktbWVzb244
Yi11c2IyLmMgYi9kcml2ZXJzL3BoeS9hbWxvZ2ljL3BoeS1tZXNvbjhiLXVzYjIuYwppbmRleCAw
M2MwNjFkZDVmMGQuLjg2YTRjMDA4Yjg0OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9waHkvYW1sb2dp
Yy9waHktbWVzb244Yi11c2IyLmMKKysrIGIvZHJpdmVycy9waHkvYW1sb2dpYy9waHktbWVzb244
Yi11c2IyLmMKQEAgLTEzNywyMCArMTM3LDExIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcmVnbWFw
X2NvbmZpZyBwaHlfbWVzb244Yl91c2IyX3JlZ21hcF9jb25mID0gewogCS5tYXhfcmVnaXN0ZXIg
PSBSRUdfVFVORSwKIH07CiAKLXN0YXRpYyBpbnQgcGh5X21lc29uOGJfdXNiMl9wb3dlcl9vbihz
dHJ1Y3QgcGh5ICpwaHkpCitzdGF0aWMgaW50IHBoeV9tZXNvbjhiX3VzYjJfaW5pdChzdHJ1Y3Qg
cGh5ICpwaHkpCiB7CiAJc3RydWN0IHBoeV9tZXNvbjhiX3VzYjJfcHJpdiAqcHJpdiA9IHBoeV9n
ZXRfZHJ2ZGF0YShwaHkpOwotCXUzMiByZWc7CiAJaW50IHJldDsKIAotCWlmICghSVNfRVJSX09S
X05VTEwocHJpdi0+cmVzZXQpKSB7Ci0JCXJldCA9IHJlc2V0X2NvbnRyb2xfcmVzZXQocHJpdi0+
cmVzZXQpOwotCQlpZiAocmV0KSB7Ci0JCQlkZXZfZXJyKCZwaHktPmRldiwgIkZhaWxlZCB0byB0
cmlnZ2VyIFVTQiByZXNldFxuIik7Ci0JCQlyZXR1cm4gcmV0OwotCQl9Ci0JfQotCiAJcmV0ID0g
Y2xrX3ByZXBhcmVfZW5hYmxlKHByaXYtPmNsa191c2JfZ2VuZXJhbCk7CiAJaWYgKHJldCkgewog
CQlkZXZfZXJyKCZwaHktPmRldiwgIkZhaWxlZCB0byBlbmFibGUgVVNCIGdlbmVyYWwgY2xvY2tc
biIpOwpAQCAtMTYzLDYgKzE1NCw0MSBAQCBzdGF0aWMgaW50IHBoeV9tZXNvbjhiX3VzYjJfcG93
ZXJfb24oc3RydWN0IHBoeSAqcGh5KQogCQljbGtfZGlzYWJsZV91bnByZXBhcmUocHJpdi0+Y2xr
X3VzYl9nZW5lcmFsKTsKIAkJcmV0dXJuIHJldDsKIAl9CisJcmV0dXJuIDA7Cit9CisKK3N0YXRp
YyBpbnQgcGh5X21lc29uOGJfdXNiMl9leGl0KHN0cnVjdCBwaHkgKnBoeSkKK3sKKwlzdHJ1Y3Qg
cGh5X21lc29uOGJfdXNiMl9wcml2ICpwcml2ID0gcGh5X2dldF9kcnZkYXRhKHBoeSk7CisKKwlj
bGtfZGlzYWJsZV91bnByZXBhcmUocHJpdi0+Y2xrX3VzYik7CisJY2xrX2Rpc2FibGVfdW5wcmVw
YXJlKHByaXYtPmNsa191c2JfZ2VuZXJhbCk7CisKKwlyZXR1cm4gMDsKK30KKworc3RhdGljIGlu
dCBwaHlfbWVzb244Yl91c2IyX3Jlc2V0KHN0cnVjdCBwaHkgKnBoeSkKK3sKKwlzdHJ1Y3QgcGh5
X21lc29uOGJfdXNiMl9wcml2ICpwcml2ID0gcGh5X2dldF9kcnZkYXRhKHBoeSk7CisJaW50IHJl
dCA9IDA7CisKKwlkZXZfaW5mbygmcGh5LT5kZXYsICJBbmFuZCB5b3UgYXJlIGNhbGxpbmcgVVNC
IHJlc2V0MVxuIik7CisJaWYgKCFJU19FUlJfT1JfTlVMTChwcml2LT5yZXNldCkpIHsKKwkJZGV2
X2luZm8oJnBoeS0+ZGV2LCAiQW5hbmQgeW91IGFyZSBjYWxsaW5nIFVTQiByZXNldDJcbiIpOwor
CQlyZXQgPSByZXNldF9jb250cm9sX3Jlc2V0KHByaXYtPnJlc2V0KTsKKwkJaWYgKHJldCkgewor
CQkJZGV2X2VycigmcGh5LT5kZXYsICJGYWlsZWQgdG8gdHJpZ2dlciBVU0IgcmVzZXRcbiIpOwor
CQkJcmV0dXJuIHJldDsKKwkJfQorCX0KKworCXJldHVybiByZXQ7Cit9CisKK3N0YXRpYyBpbnQg
cGh5X21lc29uOGJfdXNiMl9wb3dlcl9vbihzdHJ1Y3QgcGh5ICpwaHkpCit7CisJc3RydWN0IHBo
eV9tZXNvbjhiX3VzYjJfcHJpdiAqcHJpdiA9IHBoeV9nZXRfZHJ2ZGF0YShwaHkpOworCXUzMiBy
ZWc7CiAKIAlyZWdtYXBfdXBkYXRlX2JpdHMocHJpdi0+cmVnbWFwLCBSRUdfQ09ORklHLCBSRUdf
Q09ORklHX0NMS18zMmtfQUxUU0VMLAogCQkJICAgUkVHX0NPTkZJR19DTEtfMzJrX0FMVFNFTCk7
CkBAIC0yMDQsNiArMjMwLDkgQEAgc3RhdGljIGludCBwaHlfbWVzb244Yl91c2IyX3Bvd2VyX29u
KHN0cnVjdCBwaHkgKnBoeSkKIAkJfQogCX0KIAorCS8qIFByb2JsZW0gaXMgd2l0aCB0aGUgcmVz
ZXQgY29udHJvbCBpbm9yZGVyIGJyaW5nIHRoZSBVU0IgcGh5ICovCisJcGh5X21lc29uOGJfdXNi
Ml9yZXNldChwaHkpOworCiAJcmV0dXJuIDA7CiB9CiAKQEAgLTIxNiwxNSArMjQ1LDE5IEBAIHN0
YXRpYyBpbnQgcGh5X21lc29uOGJfdXNiMl9wb3dlcl9vZmYoc3RydWN0IHBoeSAqcGh5KQogCQkJ
CSAgIFJFR19EQkdfVUFSVF9TRVRfSUREUSwKIAkJCQkgICBSRUdfREJHX1VBUlRfU0VUX0lERFEp
OwogCi0JY2xrX2Rpc2FibGVfdW5wcmVwYXJlKHByaXYtPmNsa191c2IpOwotCWNsa19kaXNhYmxl
X3VucHJlcGFyZShwcml2LT5jbGtfdXNiX2dlbmVyYWwpOworCS8qIHBvd2VyIG9mZiB0aGUgUEhZ
IGJ5IHB1dHRpbmcgaXQgaW50byByZXNldCBtb2RlICovCisJcmVnbWFwX3VwZGF0ZV9iaXRzKHBy
aXYtPnJlZ21hcCwgUkVHX0NUUkwsIFJFR19DVFJMX1BPV0VSX09OX1JFU0VULAorCQkJICAgUkVH
X0NUUkxfUE9XRVJfT05fUkVTRVQpOwogCiAJcmV0dXJuIDA7CiB9CiAKIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgcGh5X29wcyBwaHlfbWVzb244Yl91c2IyX29wcyA9IHsKKwkuaW5pdCAgICAgICAgICAg
PSBwaHlfbWVzb244Yl91c2IyX2luaXQsCisJLmV4aXQgICAgICAgICAgID0gcGh5X21lc29uOGJf
dXNiMl9leGl0LAogCS5wb3dlcl9vbgk9IHBoeV9tZXNvbjhiX3VzYjJfcG93ZXJfb24sCiAJLnBv
d2VyX29mZgk9IHBoeV9tZXNvbjhiX3VzYjJfcG93ZXJfb2ZmLAorCS5yZXNldAkJPSBwaHlfbWVz
b244Yl91c2IyX3Jlc2V0LAogCS5vd25lcgkJPSBUSElTX01PRFVMRSwKIH07CiAKQEAgLTI3Myw4
ICszMDYsNyBAQCBzdGF0aWMgaW50IHBoeV9tZXNvbjhiX3VzYjJfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKIAogCXBoeSA9IGRldm1fcGh5X2NyZWF0ZSgmcGRldi0+ZGV2LCBO
VUxMLCAmcGh5X21lc29uOGJfdXNiMl9vcHMpOwogCWlmIChJU19FUlIocGh5KSkgewotCQlkZXZf
ZXJyKCZwZGV2LT5kZXYsICJmYWlsZWQgdG8gY3JlYXRlIFBIWVxuIik7Ci0JCXJldHVybiBQVFJf
RVJSKHBoeSk7CisJCXJldHVybiBkZXZfZXJyX3Byb2JlKCZwZGV2LT5kZXYsIFBUUl9FUlIocGh5
KSwgImZhaWxlZCB0byBjcmVhdGUgUEhZXG4iKTsKIAl9CiAKIAlwaHlfc2V0X2RydmRhdGEocGh5
LCBwcml2KTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzIvcGFyYW1zLmMgYi9kcml2ZXJz
L3VzYi9kd2MyL3BhcmFtcy5jCmluZGV4IDdhNjA4OWZhODFlMS4uNTNmMmI3M2ZlMWQ0IDEwMDY0
NAotLS0gYS9kcml2ZXJzL3VzYi9kd2MyL3BhcmFtcy5jCisrKyBiL2RyaXZlcnMvdXNiL2R3YzIv
cGFyYW1zLmMKQEAgLTExOSw3ICsxMTksNyBAQCBzdGF0aWMgdm9pZCBkd2MyX3NldF9hbWxvZ2lj
X3BhcmFtcyhzdHJ1Y3QgZHdjMl9oc290ZyAqaHNvdGcpCiAJcC0+cGh5X3R5cGUgPSBEV0MyX1BI
WV9UWVBFX1BBUkFNX1VUTUk7CiAJcC0+YWhiY2ZnID0gR0FIQkNGR19IQlNUTEVOX0lOQ1I4IDw8
CiAJCUdBSEJDRkdfSEJTVExFTl9TSElGVDsKLQlwLT5wb3dlcl9kb3duID0gRFdDMl9QT1dFUl9E
T1dOX1BBUkFNX05PTkU7CisJcC0+cG93ZXJfZG93biA9IERXQzJfUE9XRVJfRE9XTl9QQVJBTV9Q
QVJUSUFMOwogfQogCiBzdGF0aWMgdm9pZCBkd2MyX3NldF9hbWxvZ2ljX2cxMmFfcGFyYW1zKHN0
cnVjdCBkd2MyX2hzb3RnICpoc290ZykK
--00000000000065090905c60cf545
Content-Type: application/octet-stream; name="c2.1u.mon.out"
Content-Disposition: attachment; filename="c2.1u.mon.out"
Content-Transfer-Encoding: base64
Content-ID: <f_kqkqd8wc1>
X-Attachment-Id: f_kqkqd8wc1

ZmZmZjAwMDAwMmZjOTcwMCA3NDkzNDAwNTggUyBCbzoxOjAwMzoxIC0xMTUgMzEgPSA1NTUzNDI0
MyA0ZjAyMDAwMCAwMDAwMDAwMCAwMDAwMDYwMCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAw
MDAwMDAKZmZmZjAwMDAwMmZjOTcwMCA3NDkzNDAxNjggQyBCbzoxOjAwMzoxIDAgMzEgPgpmZmZm
MDAwMDAyZmM5NzAwIDc0OTM0MDE4MyBTIEJpOjE6MDAzOjIgLTExNSAxMyA8CmZmZmYwMDAwMDJm
Yzk3MDAgNzQ5MzQwMjg3IEMgQmk6MTowMDM6MiAwIDEzID0gNTU1MzQyNTMgNGYwMjAwMDAgMDAw
MDAwMDAgMDAKZmZmZjAwMDAwMmZjOTcwMCA3NTEzNTYwMjkgUyBCbzoxOjAwMzoxIC0xMTUgMzEg
PSA1NTUzNDI0MyA1MDAyMDAwMCAwMDAwMDAwMCAwMDAwMDYwMCAwMDAwMDAwMCAwMDAwMDAwMCAw
MDAwMDAwMCAwMDAwMDAKZmZmZjAwMDAwMmZjOTcwMCA3NTEzNTYwNjggQyBCbzoxOjAwMzoxIDAg
MzEgPgpmZmZmMDAwMDAyZmM5NzAwIDc1MTM1NjA3NiBTIEJpOjE6MDAzOjIgLTExNSAxMyA8CmZm
ZmYwMDAwMDJmYzk3MDAgNzUxMzU2MTk2IEMgQmk6MTowMDM6MiAwIDEzID0gNTU1MzQyNTMgNTAw
MjAwMDAgMDAwMDAwMDAgMDAKZmZmZjAwMDAwMmZjOTcwMCA3NTMzNzIwMjUgUyBCbzoxOjAwMzox
IC0xMTUgMzEgPSA1NTUzNDI0MyA1MTAyMDAwMCAwMDAwMDAwMCAwMDAwMDYwMCAwMDAwMDAwMCAw
MDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAKZmZmZjAwMDAwMmZjOTcwMCA3NTMzNzIxMDEgQyBCbzox
OjAwMzoxIDAgMzEgPgpmZmZmMDAwMDAyZmM5NzAwIDc1MzM3MjExMCBTIEJpOjE6MDAzOjIgLTEx
NSAxMyA8CmZmZmYwMDAwMDJmYzk3MDAgNzUzMzcyMjI4IEMgQmk6MTowMDM6MiAwIDEzID0gNTU1
MzQyNTMgNTEwMjAwMDAgMDAwMDAwMDAgMDAKZmZmZjAwMDAwMmZjOTcwMCA3NTUzODgwNDEgUyBC
bzoxOjAwMzoxIC0xMTUgMzEgPSA1NTUzNDI0MyA1MjAyMDAwMCAwMDAwMDAwMCAwMDAwMDYwMCAw
MDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAKZmZmZjAwMDAwMmZjOTcwMCA3NTUzODgx
NDAgQyBCbzoxOjAwMzoxIDAgMzEgPgpmZmZmMDAwMDAyZmM5NzAwIDc1NTM4ODE1MiBTIEJpOjE6
MDAzOjIgLTExNSAxMyA8CmZmZmYwMDAwMDJmYzk3MDAgNzU1Mzg4MjYxIEMgQmk6MTowMDM6MiAw
IDEzID0gNTU1MzQyNTMgNTIwMjAwMDAgMDAwMDAwMDAgMDAKZmZmZjAwMDAwMmZjOTcwMCA3NTc0
MDQwMjggUyBCbzoxOjAwMzoxIC0xMTUgMzEgPSA1NTUzNDI0MyA1MzAyMDAwMCAwMDAwMDAwMCAw
MDAwMDYwMCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAKZmZmZjAwMDAwMmZjOTcw
MCA3NTc0MDQxNjcgQyBCbzoxOjAwMzoxIDAgMzEgPgpmZmZmMDAwMDAyZmM5NzAwIDc1NzQwNDE3
NyBTIEJpOjE6MDAzOjIgLTExNSAxMyA8CmZmZmYwMDAwMDJmYzk3MDAgNzU3NDA0Mjk0IEMgQmk6
MTowMDM6MiAwIDEzID0gNTU1MzQyNTMgNTMwMjAwMDAgMDAwMDAwMDAgMDAK
--00000000000065090905c60cf545
Content-Type: application/octet-stream; name="c2.1t.mon.out"
Content-Disposition: attachment; filename="c2.1t.mon.out"
Content-Transfer-Encoding: base64
Content-ID: <f_kqkqdk5f2>
X-Attachment-Id: f_kqkqdk5f2

ZmZmZjAwMDAwMmZjOTcwMCA3MjUxNDgwNjMgUyBCbzowMDM6MDEgLTExNSAzMSA9IDU1NTM0MjQz
IDQzMDIwMDAwIDAwMDAwMDAwIDAwMDAwNjAwIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwIDAw
MDAwMApmZmZmMDAwMDAyZmM5NzAwIDcyNTE0ODE0NiBDIEJvOjAwMzowMSAwIDMxID4KZmZmZjAw
MDAwMmZjOTcwMCA3MjUxNDgxNjIgUyBCaTowMDM6MDIgLTExNSAxMyA8CmZmZmYwMDAwMDJmYzk3
MDAgNzI1MTQ4MjY1IEMgQmk6MDAzOjAyIDAgMTMgPSA1NTUzNDI1MyA0MzAyMDAwMCAwMDAwMDAw
MCAwMApmZmZmMDAwMDAyZmM5NzAwIDcyNzE2NDAzNiBTIEJvOjAwMzowMSAtMTE1IDMxID0gNTU1
MzQyNDMgNDQwMjAwMDAgMDAwMDAwMDAgMDAwMDA2MDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAw
MDAgMDAwMDAwCmZmZmYwMDAwMDJmYzk3MDAgNzI3MTY0MTcxIEMgQm86MDAzOjAxIDAgMzEgPgpm
ZmZmMDAwMDAyZmM5NzAwIDcyNzE2NDE4MSBTIEJpOjAwMzowMiAtMTE1IDEzIDwKZmZmZjAwMDAw
MmZjOTcwMCA3MjcxNjQyOTcgQyBCaTowMDM6MDIgMCAxMyA9IDU1NTM0MjUzIDQ0MDIwMDAwIDAw
MDAwMDAwIDAwCmZmZmYwMDAwMDJmYzk3MDAgNzI5MTgwMDI5IFMgQm86MDAzOjAxIC0xMTUgMzEg
PSA1NTUzNDI0MyA0NTAyMDAwMCAwMDAwMDAwMCAwMDAwMDYwMCAwMDAwMDAwMCAwMDAwMDAwMCAw
MDAwMDAwMCAwMDAwMDAKZmZmZjAwMDAwMmZjOTcwMCA3MjkxODAwODAgQyBCbzowMDM6MDEgMCAz
MSA+CmZmZmYwMDAwMDJmYzk3MDAgNzI5MTgwMDkxIFMgQmk6MDAzOjAyIC0xMTUgMTMgPApmZmZm
MDAwMDAyZmM5NzAwIDcyOTE4MDIwNSBDIEJpOjAwMzowMiAwIDEzID0gNTU1MzQyNTMgNDUwMjAw
MDAgMDAwMDAwMDAgMDAKZmZmZjAwMDAwMmZjOTcwMCA3MzExOTYwMjYgUyBCbzowMDM6MDEgLTEx
NSAzMSA9IDU1NTM0MjQzIDQ2MDIwMDAwIDAwMDAwMDAwIDAwMDAwNjAwIDAwMDAwMDAwIDAwMDAw
MDAwIDAwMDAwMDAwIDAwMDAwMApmZmZmMDAwMDAyZmM5NzAwIDczMTE5NjExMSBDIEJvOjAwMzow
MSAwIDMxID4KZmZmZjAwMDAwMmZjOTcwMCA3MzExOTYxMjEgUyBCaTowMDM6MDIgLTExNSAxMyA8
CmZmZmYwMDAwMDJmYzk3MDAgNzMxMTk2MjM4IEMgQmk6MDAzOjAyIDAgMTMgPSA1NTUzNDI1MyA0
NjAyMDAwMCAwMDAwMDAwMCAwMApmZmZmMDAwMDAyZmM5NzAwIDczMzIxMjAyNSBTIEJvOjAwMzow
MSAtMTE1IDMxID0gNTU1MzQyNDMgNDcwMjAwMDAgMDAwMDAwMDAgMDAwMDA2MDAgMDAwMDAwMDAg
MDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwCmZmZmYwMDAwMDJmYzk3MDAgNzMzMjEyMTQ0IEMgQm86
MDAzOjAxIDAgMzEgPgpmZmZmMDAwMDAyZmM5NzAwIDczMzIxMjE1NCBTIEJpOjAwMzowMiAtMTE1
IDEzIDwKZmZmZjAwMDAwMmZjOTcwMCA3MzMyMTIyNzEgQyBCaTowMDM6MDIgMCAxMyA9IDU1NTM0
MjUzIDQ3MDIwMDAwIDAwMDAwMDAwIDAwCmZmZmYwMDAwMDJmYzk3MDAgNzM1MjI4MDM5IFMgQm86
MDAzOjAxIC0xMTUgMzEgPSA1NTUzNDI0MyA0ODAyMDAwMCAwMDAwMDAwMCAwMDAwMDYwMCAwMDAw
MDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAKZmZmZjAwMDAwMmZjOTcwMCA3MzUyMjgxODQg
QyBCbzowMDM6MDEgMCAzMSA+CmZmZmYwMDAwMDJmYzk3MDAgNzM1MjI4MTk2IFMgQmk6MDAzOjAy
IC0xMTUgMTMgPApmZmZmMDAwMDAyZmM5NzAwIDczNTIyODMwNCBDIEJpOjAwMzowMiAwIDEzID0g
NTU1MzQyNTMgNDgwMjAwMDAgMDAwMDAwMDAgMDAK
--00000000000065090905c60cf545
Content-Type: application/octet-stream; name="c2.1s.mon.out"
Content-Disposition: attachment; filename="c2.1s.mon.out"
Content-Transfer-Encoding: base64
Content-ID: <f_kqkqdp9j3>
X-Attachment-Id: f_kqkqdp9j3

bnJlYWRlcnMgMiBldmVudHMgODI0IHRleHRfbG9zdCAxMTc4Cg==
--00000000000065090905c60cf545
Content-Type: application/octet-stream; name="c2.0u.mon.out"
Content-Disposition: attachment; filename="c2.0u.mon.out"
Content-Transfer-Encoding: base64
Content-ID: <f_kqkqe1h74>
X-Attachment-Id: f_kqkqe1h74

ZmZmZjAwMDAwMmZjOTcwMCA1ODQwMjgwNjMgUyBCbzoxOjAwMzoxIC0xMTUgMzEgPSA1NTUzNDI0
MyBmZDAxMDAwMCAwMDAwMDAwMCAwMDAwMDYwMCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAw
MDAwMDAKZmZmZjAwMDAwMmZjOTcwMCA1ODQwMjgyMDMgQyBCbzoxOjAwMzoxIDAgMzEgPgpmZmZm
MDAwMDAyZmM5NzAwIDU4NDAyODIxOSBTIEJpOjE6MDAzOjIgLTExNSAxMyA8CmZmZmYwMDAwMDJm
Yzk3MDAgNTg0MDI4MzIwIEMgQmk6MTowMDM6MiAwIDEzID0gNTU1MzQyNTMgZmQwMTAwMDAgMDAw
MDAwMDAgMDAKZmZmZjAwMDAwMmZjOTcwMCA1ODYwNDQwNTcgUyBCbzoxOjAwMzoxIC0xMTUgMzEg
PSA1NTUzNDI0MyBmZTAxMDAwMCAwMDAwMDAwMCAwMDAwMDYwMCAwMDAwMDAwMCAwMDAwMDAwMCAw
MDAwMDAwMCAwMDAwMDAKZmZmZjAwMDAwMmZjOTcwMCA1ODYwNDQxMTEgQyBCbzoxOjAwMzoxIDAg
MzEgPgpmZmZmMDAwMDAyZmM5NzAwIDU4NjA0NDEyMSBTIEJpOjE6MDAzOjIgLTExNSAxMyA8CmZm
ZmYwMDAwMDJmYzk3MDAgNTg2MDQ0MjI5IEMgQmk6MTowMDM6MiAwIDEzID0gNTU1MzQyNTMgZmUw
MTAwMDAgMDAwMDAwMDAgMDAKZmZmZjAwMDAwMmZjOTcwMCA1ODgwNjAwMzEgUyBCbzoxOjAwMzox
IC0xMTUgMzEgPSA1NTUzNDI0MyBmZjAxMDAwMCAwMDAwMDAwMCAwMDAwMDYwMCAwMDAwMDAwMCAw
MDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAKZmZmZjAwMDAwMmZjOTcwMCA1ODgwNjAxMzUgQyBCbzox
OjAwMzoxIDAgMzEgPgpmZmZmMDAwMDAyZmM5NzAwIDU4ODA2MDE0NSBTIEJpOjE6MDAzOjIgLTEx
NSAxMyA8CmZmZmYwMDAwMDJmYzk3MDAgNTg4MDYwMjYxIEMgQmk6MTowMDM6MiAwIDEzID0gNTU1
MzQyNTMgZmYwMTAwMDAgMDAwMDAwMDAgMDAKZmZmZjAwMDAwMmZjOTcwMCA1OTAwNzYwMzIgUyBC
bzoxOjAwMzoxIC0xMTUgMzEgPSA1NTUzNDI0MyAwMDAyMDAwMCAwMDAwMDAwMCAwMDAwMDYwMCAw
MDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAKZmZmZjAwMDAwMmZjOTcwMCA1OTAwNzYx
NjggQyBCbzoxOjAwMzoxIDAgMzEgPgpmZmZmMDAwMDAyZmM5NzAwIDU5MDA3NjE3NyBTIEJpOjE6
MDAzOjIgLTExNSAxMyA8CmZmZmYwMDAwMDJmYzk3MDAgNTkwMDc2Mjk1IEMgQmk6MTowMDM6MiAw
IDEzID0gNTU1MzQyNTMgMDAwMjAwMDAgMDAwMDAwMDAgMDAKZmZmZjAwMDAwMmZjOTcwMCA1OTIw
OTIwMjYgUyBCbzoxOjAwMzoxIC0xMTUgMzEgPSA1NTUzNDI0MyAwMTAyMDAwMCAwMDAwMDAwMCAw
MDAwMDYwMCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAKZmZmZjAwMDAwMmZjOTcw
MCA1OTIwOTIwNzUgQyBCbzoxOjAwMzoxIDAgMzEgPgpmZmZmMDAwMDAyZmM5NzAwIDU5MjA5MjA4
NSBTIEJpOjE6MDAzOjIgLTExNSAxMyA8CmZmZmYwMDAwMDJmYzk3MDAgNTkyMDkyMjAyIEMgQmk6
MTowMDM6MiAwIDEzID0gNTU1MzQyNTMgMDEwMjAwMDAgMDAwMDAwMDAgMDAKZmZmZjAwMDAwMmZj
OTcwMCA1OTQxMDgwMjYgUyBCbzoxOjAwMzoxIC0xMTUgMzEgPSA1NTUzNDI0MyAwMjAyMDAwMCAw
MDAwMDAwMCAwMDAwMDYwMCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAKZmZmZjAw
MDAwMmZjOTcwMCA1OTQxMDgxMDkgQyBCbzoxOjAwMzoxIDAgMzEgPgpmZmZmMDAwMDAyZmM5NzAw
IDU5NDEwODExOSBTIEJpOjE6MDAzOjIgLTExNSAxMyA8CmZmZmYwMDAwMDJmYzk3MDAgNTk0MTA4
MjM1IEMgQmk6MTowMDM6MiAwIDEzID0gNTU1MzQyNTMgMDIwMjAwMDAgMDAwMDAwMDAgMDAKZmZm
ZjAwMDAwMmZjOTcwMCA1OTYxMjQwNDcgUyBCbzoxOjAwMzoxIC0xMTUgMzEgPSA1NTUzNDI0MyAw
MzAyMDAwMCAwMDAwMDAwMCAwMDAwMDYwMCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAw
MDAKZmZmZjAwMDAwMmZjOTcwMCA1OTYxMjQxNDggQyBCbzoxOjAwMzoxIDAgMzEgPgpmZmZmMDAw
MDAyZmM5NzAwIDU5NjEyNDE1OSBTIEJpOjE6MDAzOjIgLTExNSAxMyA8CmZmZmYwMDAwMDJmYzk3
MDAgNTk2MTI0MjY4IEMgQmk6MTowMDM6MiAwIDEzID0gNTU1MzQyNTMgMDMwMjAwMDAgMDAwMDAw
MDAgMDAK
--00000000000065090905c60cf545
Content-Type: application/octet-stream; name="c2.0s.mon.out"
Content-Disposition: attachment; filename="c2.0s.mon.out"
Content-Transfer-Encoding: base64
Content-ID: <f_kqkqelqu5>
X-Attachment-Id: f_kqkqelqu5

bnJlYWRlcnMgMSBldmVudHMgNTY0IHRleHRfbG9zdCA1NQo=
--00000000000065090905c60cf545--
