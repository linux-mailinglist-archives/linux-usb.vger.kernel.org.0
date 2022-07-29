Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6904B584D26
	for <lists+linux-usb@lfdr.de>; Fri, 29 Jul 2022 10:07:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234732AbiG2IHS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 Jul 2022 04:07:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235210AbiG2IHQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 29 Jul 2022 04:07:16 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A1097F52F
        for <linux-usb@vger.kernel.org>; Fri, 29 Jul 2022 01:07:15 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id ez10so7147769ejc.13
        for <linux-usb@vger.kernel.org>; Fri, 29 Jul 2022 01:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vY1mEsZYhahKwyo+WKC8Qa6wOekOvsJJT37Q5A07+Jw=;
        b=RdmYMWm8lG5hG9GFd6zHFcS31oB3brWrwkJRPJPBDSARGYk7jRCObpZPDvn68cABTm
         Nxog+PBGnnspxywEVkaG9dWNog8HkfaZfytVqkU9HzfvhJHD+QPv5z86WNqvQhsQQ5cI
         qT/Beugy/80O73J+yNc+jCF1tv+ogvrIC/H29Yn5XDFDaoizKZ1j0Meba/llOUcoXJBb
         uBJ1nMOWv4TVqPpGt0fPTrnuqvoHKijIeIYmjSFyyp0c96P30vKDXdi9nB+XvvS+Og8W
         MxwnroWhQ8WSXk+Vsf2tAgnKNKMGYsZwY/LNEMfEiSYKefDVxy6V+38auBazYWEZDlcM
         msZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vY1mEsZYhahKwyo+WKC8Qa6wOekOvsJJT37Q5A07+Jw=;
        b=GIRbRkFHi1IWXBGFQwezYRsBSxoPuxeMty8ZV1EEDjWq7tLVs2P23JwQGki8DTMbu8
         +3HpJ4ZoieAQefzmeBWf6wIcDw0n+3caIJIv195Ym90Q9uqN7/0YH7PhA16uSQlbtold
         WodGvg3XT/rGJDlfx+0m/vKSuGr1ZPlMy/1ohHwfok5g3guFuKW7UeKhq5MR0GLtSoUr
         5rgUqh2iV/gqcXnQqBen5rFCWexdRmHHxkp5jY+jfH1IQvW4FrSC4p/GfVUGuWKl3Lgm
         teDARyKoe+9fLMEXfskj3OMHiNcIcOew7+hyh7K5IU5SmNmi16b7gz/VKCMPCLH3QhAw
         uHzQ==
X-Gm-Message-State: AJIora9tcq19mqEb3m3tATjvo0N/7S5oRLHazYJ2IDvZQAOdiOSZuVu4
        w8jS2GpH1hHFGfnVjv61ahCycNcIhaPHw4Fzk4yg
X-Google-Smtp-Source: AGRyM1t0NKNCIkTEcDFfxsZloLRb0yz81sFJWuXS+QQpPvuHyh3j3aD91rcKMrO9MCSxQ7EL8l8scl405S/a/GocnSE=
X-Received: by 2002:a17:906:a089:b0:72f:826b:e084 with SMTP id
 q9-20020a170906a08900b0072f826be084mr2079392ejy.708.1659082033742; Fri, 29
 Jul 2022 01:07:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220728131608.31901-1-lukasz.bartosik@semihalf.com>
 <YuKOERUVa1/mPX9j@kroah.com> <CAK8Bye+PPeGxvELUH41BG8n=E1DaGTNWtMz+wis7n-VOL57aSA@mail.gmail.com>
 <YuK/awQVEZHxYk6e@kroah.com> <CAK8ByeKZ2BdpdjBCA+WF1RAFqGD9swsekw7ez_S-5q3SGP+rcg@mail.gmail.com>
 <YuOQIxz/jZVX0qlG@kroah.com>
In-Reply-To: <YuOQIxz/jZVX0qlG@kroah.com>
From:   =?UTF-8?Q?=C5=81ukasz_Bartosik?= <lb@semihalf.com>
Date:   Fri, 29 Jul 2022 10:07:02 +0200
Message-ID: <CAK8Bye+VE0Og=yQV9G5SWp7m88scKWrwEimAva10HadgNkfVWQ@mail.gmail.com>
Subject: Re: [PATCH v1] thunderbolt: fix PCI device class after powering up
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        linux-usb@vger.kernel.org, upstream@semihalf.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

>
> On Thu, Jul 28, 2022 at 07:17:37PM +0200, =C5=81ukasz Bartosik wrote:
> > >
> > > On Thu, Jul 28, 2022 at 06:31:47PM +0200, =C5=81ukasz Bartosik wrote:
> > > > >
> > > > > On Thu, Jul 28, 2022 at 03:16:08PM +0200, Lukasz Bartosik wrote:
> > > > > > From: =C5=81ukasz Bartosik <lb@semihalf.com>
> > > > > >
> > > > > > A thunderbolt
> > > > > > lspci -d 8086:9a1b -vmmknn
> > > > > > Slot: 00:0d.2
> > > > > > Class:        System peripheral [0880]
> > > > > > Vendor:       Intel Corporation [8086]
> > > > > > Device:       Tiger Lake-LP Thunderbolt 4 NHI #0 [9a1b]
> > > > > >
> > > > > > presents itself with PCI class 0x088000 after Chromebook boots.
> > > > > > lspci -s 00:0d.2 -xxx
> > > > > > 00:0d.2 System peripheral: Intel Corporation Tiger Lake-LP Thun=
derbolt 4
> > > > > > NHI #0 (rev 01)
> > > > > > 00: 86 80 1b 9a 00 00 10 00 01 00 80 08 00 00 00 00
> > > > > > ...
> > > > > >
> > > > > > However after thunderbolt is powered up in nhi_probe()
> > > > > > its class changes to 0x0c0340
> > > > > > lspci -s 00:0d.2 -xxx
> > > > > > 00:0d.2 System peripheral: Intel Corporation Tiger Lake-LP Thun=
derbolt 4
> > > > > > NHI #0 (rev 01)
> > > > > > 00: 86 80 1b 9a 06 04 10 00 01 40 03 0c 00 00 00 00
> > > > > > ...
> > > > > >
> > > > > > which leaves pci_dev structure with old class value
> > > > > > cat /sys/bus/pci/devices/0000:00:0d.2/class
> > > > > > 0x088000
> > > > > >
> > > > > > This fix updates PCI device class in pci_dev structure after
> > > > > > thunderbolt is powered up.
> > > > > >
> > > > > > Fixes: 3cdb9446a117 ("thunderbolt: Add support for Intel Ice La=
ke")
> > > > > > Signed-off-by: =C5=81ukasz Bartosik <lb@semihalf.com>
> > > > > > ---
> > > > > >  drivers/thunderbolt/nhi_ops.c | 5 +++++
> > > > > >  1 file changed, 5 insertions(+)
> > > > > >
> > > > > > diff --git a/drivers/thunderbolt/nhi_ops.c b/drivers/thunderbol=
t/nhi_ops.c
> > > > > > index 96da07e88c52..6a343d7e3f90 100644
> > > > > > --- a/drivers/thunderbolt/nhi_ops.c
> > > > > > +++ b/drivers/thunderbolt/nhi_ops.c
> > > > > > @@ -160,12 +160,17 @@ static int icl_nhi_suspend_noirq(struct t=
b_nhi *nhi, bool wakeup)
> > > > > >
> > > > > >  static int icl_nhi_resume(struct tb_nhi *nhi)
> > > > > >  {
> > > > > > +     u32 class;
> > > > > >       int ret;
> > > > > >
> > > > > >       ret =3D icl_nhi_force_power(nhi, true);
> > > > > >       if (ret)
> > > > > >               return ret;
> > > > > >
> > > > > > +     /* Set device class code as it might have changed after p=
owering up */
> > > > > > +     pci_read_config_dword(nhi->pdev, PCI_CLASS_REVISION, &cla=
ss);
> > > > > > +     nhi->pdev->class =3D class >> 8;
> > > > >
> > > > > What about the revision field, why not set that as well:
> > > > >         nhi->pdev->revision =3D class & 0xff;
> > > > >
> > > > > If the value is overwritten for 3 of the bytes, why not the 4th?
> > > >
> > > > Fair point but I observed class change, revision stayed the same.
> > > > I read class and revision before and after icl_nhi_force_power() wi=
th
> > > > pci_read_config_dword(nhi->pdev, PCI_CLASS_REVISION, &class);
> > > > It changed from 0x8800001 -> 0xc034001
> > > >
> > > > > Also this feels odd, what is changing the bytes here?  Why only t=
he
> > > > > class?  What else changed and what caused it?
> > > >
> > > > I compared 64 bytes of config space before and after modprobing
> > > > thunderbolt module
> > > > Before modprobe
> > > > lspci -s 00:0d.2 -x
> > > > 00:0d.2 System peripheral: Intel Corporation Tiger Lake-LP Thunderb=
olt
> > > > 4 NHI #0 (rev 01)
> > > > 00: 86 80 1b 9a 00 00 10 00 01 00 80 08 00 00 00 00
> > > > 10: 04 00 a0 80 02 00 00 00 04 80 a4 80 02 00 00 00
> > > > 20: 00 00 00 00 00 00 00 00 00 00 00 00 22 22 11 11
> > > > 30: 00 00 00 00 80 00 00 00 00 00 00 00 ff 01 00 00
> > > >
> > > > After modprobe
> > > > lspci -s 00:0d.2 -x
> > > > 00:0d.2 System peripheral: Intel Corporation Tiger Lake-LP Thunderb=
olt
> > > > 4 NHI #0 (rev 01)
> > > > 00: 86 80 1b 9a 06 04 10 00 01 40 03 0c 00 00 00 00
> > > > 10: 04 00 a0 80 02 00 00 00 04 80 a4 80 02 00 00 00
> > > > 20: 00 00 00 00 00 00 00 00 00 00 00 00 22 22 11 11
> > > > 30: 00 00 00 00 80 00 00 00 00 00 00 00 ff 01 00 00
> > > >
> > > > The diff is in class 00 80 08 -> 40 03 0c
> > > > and command 00 00 -> 06 04
> > > >
> > > > The value 40 03 0c is defined as PCI_CLASS_SERIAL_USB_USB4 in
> > > > drivers/thunderbolt/nhi.h
> > > >
> > > > I think the device itself changed the class because I tried to chan=
ge
> > > > class value with setpci command and it seems to be read-only.
> > >
> > > Wait huh?  You can't change the class of a device in the configuratio=
n,
> > > that is read-only.
> >
> > Sorry my statement might have been confusing. I tried to change class
> > value with setpci
> > as an experiment to make sure it is read-only and it is ro.
> >
> > > So this is working properly without this patch, right?
> >
> > After thunderbolt is probed its class changes from  00 80 08 -> 40 03 0=
c
> > and without this patch thunderbolt's pci_dev struct is left holding
> > old class value 00 80 08
> > which is not correct.
>
> Ah, ok, but you might have just gotten lucky about the revision being
> the same.  Please also restore that as it comes from the same read
> transaction.
>

I will send v2 which restores revision also.

Thanks,
Lukasz

> thanks,
>
> greg k-h
