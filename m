Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB9615844E4
	for <lists+linux-usb@lfdr.de>; Thu, 28 Jul 2022 19:22:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229867AbiG1RRw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Jul 2022 13:17:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbiG1RRv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 Jul 2022 13:17:51 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 948006D2F9
        for <linux-usb@vger.kernel.org>; Thu, 28 Jul 2022 10:17:50 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id sz17so4247530ejc.9
        for <linux-usb@vger.kernel.org>; Thu, 28 Jul 2022 10:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tMoHWXX+e2RAv7RrY62aiE7oVbNRc9ru/p8taXHwHRA=;
        b=XJZdTU+ZvHTFX+0TSvaEJZAs5Oz8o3xixubfj6cVWfHBbUFcnr81Cyq6oX6nnBCysV
         oZkn+5KZaXVoqB3MI5u7mJ+0m9WML7z4Vr3iVtncoltvRvbe2MtGONijEU0fwsG8v49/
         8PEMnMPLMp/CCHLv8ha7EoWWMtrLklfbyAqj6huHAfjBRnHTH7SkpbHxNrc8P/27WQBf
         ef0bekb/B1aYyjd4+8EuE0LQHoPUaTYp89t8S+Nzl6d8W4NTVJrYQlTNPUBHwWHVrO/j
         2IkyJUdQUJjBI/0rQDgBpjTQ4DIJngTg8qUhQ4DFqzSlI5Tdbnn2GKpCVpjItBMepvL9
         l3uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tMoHWXX+e2RAv7RrY62aiE7oVbNRc9ru/p8taXHwHRA=;
        b=0KE0AuBUEjXYQUSrmxUur3SsWUaj4q6MNxUx+7WB0p8HHIqz5UsYi19xYj3psacnEb
         cZAwF1nE2Sp25lUOCnppu3uqdmGR5tHYlM0nkNteYW8e+MR2duyM0EaHRInsugO6XNlO
         ziQb1t/FN/t+Ds91PzP2HYBh9l6+m70UOJH6jX5lAcQo0rbizyN/nD7kqufhhZCj02Pa
         L5oid+utDMCsw0pfyTQUekyynpzcOvVaTIg5hNn0btFxFRPaIMKqaojUekfnIKHTRd9m
         Rx2mS/k5GdlpLrqZMqOkcHRZgyrYWp5oK8wqyTSG+3Dj9nY7Id5YNwY+WcjGVaBxFbW9
         vn1w==
X-Gm-Message-State: AJIora+lBfpStLWtdSLYaOK/CXiH6XQW7l8qzuo75JDdv5McKjEPalGK
        RHE/yIpmfaMNM6Mo963iMIRd8cY4e/y2lrD6SfEN
X-Google-Smtp-Source: AGRyM1uxSDn3n6/fUmd4kic44cEHUQ/vhZ2zzz6pSRTcJtVxwXAe70eJnRTjAR9vuAuIUpkv661gF7necGQ6p5OrP3c=
X-Received: by 2002:a17:907:75c6:b0:72b:496c:77c7 with SMTP id
 jl6-20020a17090775c600b0072b496c77c7mr21678085ejc.47.1659028668975; Thu, 28
 Jul 2022 10:17:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220728131608.31901-1-lukasz.bartosik@semihalf.com>
 <YuKOERUVa1/mPX9j@kroah.com> <CAK8Bye+PPeGxvELUH41BG8n=E1DaGTNWtMz+wis7n-VOL57aSA@mail.gmail.com>
 <YuK/awQVEZHxYk6e@kroah.com>
In-Reply-To: <YuK/awQVEZHxYk6e@kroah.com>
From:   =?UTF-8?Q?=C5=81ukasz_Bartosik?= <lb@semihalf.com>
Date:   Thu, 28 Jul 2022 19:17:37 +0200
Message-ID: <CAK8ByeKZ2BdpdjBCA+WF1RAFqGD9swsekw7ez_S-5q3SGP+rcg@mail.gmail.com>
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
> On Thu, Jul 28, 2022 at 06:31:47PM +0200, =C5=81ukasz Bartosik wrote:
> > >
> > > On Thu, Jul 28, 2022 at 03:16:08PM +0200, Lukasz Bartosik wrote:
> > > > From: =C5=81ukasz Bartosik <lb@semihalf.com>
> > > >
> > > > A thunderbolt
> > > > lspci -d 8086:9a1b -vmmknn
> > > > Slot: 00:0d.2
> > > > Class:        System peripheral [0880]
> > > > Vendor:       Intel Corporation [8086]
> > > > Device:       Tiger Lake-LP Thunderbolt 4 NHI #0 [9a1b]
> > > >
> > > > presents itself with PCI class 0x088000 after Chromebook boots.
> > > > lspci -s 00:0d.2 -xxx
> > > > 00:0d.2 System peripheral: Intel Corporation Tiger Lake-LP Thunderb=
olt 4
> > > > NHI #0 (rev 01)
> > > > 00: 86 80 1b 9a 00 00 10 00 01 00 80 08 00 00 00 00
> > > > ...
> > > >
> > > > However after thunderbolt is powered up in nhi_probe()
> > > > its class changes to 0x0c0340
> > > > lspci -s 00:0d.2 -xxx
> > > > 00:0d.2 System peripheral: Intel Corporation Tiger Lake-LP Thunderb=
olt 4
> > > > NHI #0 (rev 01)
> > > > 00: 86 80 1b 9a 06 04 10 00 01 40 03 0c 00 00 00 00
> > > > ...
> > > >
> > > > which leaves pci_dev structure with old class value
> > > > cat /sys/bus/pci/devices/0000:00:0d.2/class
> > > > 0x088000
> > > >
> > > > This fix updates PCI device class in pci_dev structure after
> > > > thunderbolt is powered up.
> > > >
> > > > Fixes: 3cdb9446a117 ("thunderbolt: Add support for Intel Ice Lake")
> > > > Signed-off-by: =C5=81ukasz Bartosik <lb@semihalf.com>
> > > > ---
> > > >  drivers/thunderbolt/nhi_ops.c | 5 +++++
> > > >  1 file changed, 5 insertions(+)
> > > >
> > > > diff --git a/drivers/thunderbolt/nhi_ops.c b/drivers/thunderbolt/nh=
i_ops.c
> > > > index 96da07e88c52..6a343d7e3f90 100644
> > > > --- a/drivers/thunderbolt/nhi_ops.c
> > > > +++ b/drivers/thunderbolt/nhi_ops.c
> > > > @@ -160,12 +160,17 @@ static int icl_nhi_suspend_noirq(struct tb_nh=
i *nhi, bool wakeup)
> > > >
> > > >  static int icl_nhi_resume(struct tb_nhi *nhi)
> > > >  {
> > > > +     u32 class;
> > > >       int ret;
> > > >
> > > >       ret =3D icl_nhi_force_power(nhi, true);
> > > >       if (ret)
> > > >               return ret;
> > > >
> > > > +     /* Set device class code as it might have changed after power=
ing up */
> > > > +     pci_read_config_dword(nhi->pdev, PCI_CLASS_REVISION, &class);
> > > > +     nhi->pdev->class =3D class >> 8;
> > >
> > > What about the revision field, why not set that as well:
> > >         nhi->pdev->revision =3D class & 0xff;
> > >
> > > If the value is overwritten for 3 of the bytes, why not the 4th?
> >
> > Fair point but I observed class change, revision stayed the same.
> > I read class and revision before and after icl_nhi_force_power() with
> > pci_read_config_dword(nhi->pdev, PCI_CLASS_REVISION, &class);
> > It changed from 0x8800001 -> 0xc034001
> >
> > > Also this feels odd, what is changing the bytes here?  Why only the
> > > class?  What else changed and what caused it?
> >
> > I compared 64 bytes of config space before and after modprobing
> > thunderbolt module
> > Before modprobe
> > lspci -s 00:0d.2 -x
> > 00:0d.2 System peripheral: Intel Corporation Tiger Lake-LP Thunderbolt
> > 4 NHI #0 (rev 01)
> > 00: 86 80 1b 9a 00 00 10 00 01 00 80 08 00 00 00 00
> > 10: 04 00 a0 80 02 00 00 00 04 80 a4 80 02 00 00 00
> > 20: 00 00 00 00 00 00 00 00 00 00 00 00 22 22 11 11
> > 30: 00 00 00 00 80 00 00 00 00 00 00 00 ff 01 00 00
> >
> > After modprobe
> > lspci -s 00:0d.2 -x
> > 00:0d.2 System peripheral: Intel Corporation Tiger Lake-LP Thunderbolt
> > 4 NHI #0 (rev 01)
> > 00: 86 80 1b 9a 06 04 10 00 01 40 03 0c 00 00 00 00
> > 10: 04 00 a0 80 02 00 00 00 04 80 a4 80 02 00 00 00
> > 20: 00 00 00 00 00 00 00 00 00 00 00 00 22 22 11 11
> > 30: 00 00 00 00 80 00 00 00 00 00 00 00 ff 01 00 00
> >
> > The diff is in class 00 80 08 -> 40 03 0c
> > and command 00 00 -> 06 04
> >
> > The value 40 03 0c is defined as PCI_CLASS_SERIAL_USB_USB4 in
> > drivers/thunderbolt/nhi.h
> >
> > I think the device itself changed the class because I tried to change
> > class value with setpci command and it seems to be read-only.
>
> Wait huh?  You can't change the class of a device in the configuration,
> that is read-only.

Sorry my statement might have been confusing. I tried to change class
value with setpci
as an experiment to make sure it is read-only and it is ro.

> So this is working properly without this patch, right?

After thunderbolt is probed its class changes from  00 80 08 -> 40 03 0c
and without this patch thunderbolt's pci_dev struct is left holding
old class value 00 80 08
which is not correct.

Thanks,
Lukasz

> thanks,
>
> greg k-h
