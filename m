Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E71F58442F
	for <lists+linux-usb@lfdr.de>; Thu, 28 Jul 2022 18:32:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232369AbiG1QcH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Jul 2022 12:32:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231745AbiG1QcF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 Jul 2022 12:32:05 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97FA12A408
        for <linux-usb@vger.kernel.org>; Thu, 28 Jul 2022 09:32:00 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id o13so2896382edc.0
        for <linux-usb@vger.kernel.org>; Thu, 28 Jul 2022 09:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=z5dVUwNH0f2VFF4puyPWk5khp11PG9b0x7YkxYLNKy0=;
        b=BVulf3YacOv3sRh3dB58n9TMR1/OWGGW3pUmCQTpw0F8wznKZMGebyECsTg+06z507
         Eu289k/ONsX/4XsPY/DD+/wJvWUqBf2XnOsHgvIxKQdApe7o9ivKMDqpOoFNCNCNbc8Y
         MxuOr0n6p+9gHLLZRZX2qcYOFdUnrIHHrZvAMEpTFdGZlsef4hxYwA8SyC0rh10/7E1l
         tTbmhF/hFqfFdqedbSxGf6pe0l7yVP0To2/ekNCNex5Qiywxq80qattyQFfPkSvj9F7p
         IoQfd+mqpAOaBOc/uhFMYbhUgHExGQo3L1ek8XaRLEWQZbnHlhcgukk6RGH8gkvUlEA7
         EbOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=z5dVUwNH0f2VFF4puyPWk5khp11PG9b0x7YkxYLNKy0=;
        b=zMWpEJ+E3jwAdmgQlIeraXSdyvx3S581if/r1oogd82PfpQF9U+D9K09cWq0nFSjsZ
         8ZpvdSeed0TJ3gA2/hlPj4VOYG1SoUu0oEMA4qLByS/be3kjnHSRBMh0QhEZxu2Yq6oP
         A3/FOukDTF4VuzNvHFH84r6YI7acBv7onUiAJ2N3x02m6vX9l8tlOhXcCsI7dq22ulq+
         OEDGVPFQcPpbNn+QUAoQ/75sqgX5UqEQNJqLpo3J3UhVyXsxOEzwR2QfH1PMhF8Y1/u+
         MHLSeegDZ53v6XkQFOEmC9w+PzeSTfobXZSJqbRfwWavzWwPy72RcWg40P1ir8BviXqY
         Akww==
X-Gm-Message-State: AJIora/qfk0KybF5l/mdtktkHsMkKVE0/dynjUPBShFxar4nZczcr+5z
        V4AxCwtUvH6tcfJx+7ON1EyTIG/iv0LeeWrsAJ7C
X-Google-Smtp-Source: AGRyM1scZadYUfG2vMFY2qBnX7aT9HRxkJffYTBPPCCl2CFxJIIfjC0Ce3d9KYUcymaamTzCVT0sZaovMCuz9D1YzXY=
X-Received: by 2002:a05:6402:5413:b0:43c:67c0:d2db with SMTP id
 ev19-20020a056402541300b0043c67c0d2dbmr12687650edb.267.1659025918971; Thu, 28
 Jul 2022 09:31:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220728131608.31901-1-lukasz.bartosik@semihalf.com> <YuKOERUVa1/mPX9j@kroah.com>
In-Reply-To: <YuKOERUVa1/mPX9j@kroah.com>
From:   =?UTF-8?Q?=C5=81ukasz_Bartosik?= <lb@semihalf.com>
Date:   Thu, 28 Jul 2022 18:31:47 +0200
Message-ID: <CAK8Bye+PPeGxvELUH41BG8n=E1DaGTNWtMz+wis7n-VOL57aSA@mail.gmail.com>
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
> On Thu, Jul 28, 2022 at 03:16:08PM +0200, Lukasz Bartosik wrote:
> > From: =C5=81ukasz Bartosik <lb@semihalf.com>
> >
> > A thunderbolt
> > lspci -d 8086:9a1b -vmmknn
> > Slot: 00:0d.2
> > Class:        System peripheral [0880]
> > Vendor:       Intel Corporation [8086]
> > Device:       Tiger Lake-LP Thunderbolt 4 NHI #0 [9a1b]
> >
> > presents itself with PCI class 0x088000 after Chromebook boots.
> > lspci -s 00:0d.2 -xxx
> > 00:0d.2 System peripheral: Intel Corporation Tiger Lake-LP Thunderbolt =
4
> > NHI #0 (rev 01)
> > 00: 86 80 1b 9a 00 00 10 00 01 00 80 08 00 00 00 00
> > ...
> >
> > However after thunderbolt is powered up in nhi_probe()
> > its class changes to 0x0c0340
> > lspci -s 00:0d.2 -xxx
> > 00:0d.2 System peripheral: Intel Corporation Tiger Lake-LP Thunderbolt =
4
> > NHI #0 (rev 01)
> > 00: 86 80 1b 9a 06 04 10 00 01 40 03 0c 00 00 00 00
> > ...
> >
> > which leaves pci_dev structure with old class value
> > cat /sys/bus/pci/devices/0000:00:0d.2/class
> > 0x088000
> >
> > This fix updates PCI device class in pci_dev structure after
> > thunderbolt is powered up.
> >
> > Fixes: 3cdb9446a117 ("thunderbolt: Add support for Intel Ice Lake")
> > Signed-off-by: =C5=81ukasz Bartosik <lb@semihalf.com>
> > ---
> >  drivers/thunderbolt/nhi_ops.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/thunderbolt/nhi_ops.c b/drivers/thunderbolt/nhi_op=
s.c
> > index 96da07e88c52..6a343d7e3f90 100644
> > --- a/drivers/thunderbolt/nhi_ops.c
> > +++ b/drivers/thunderbolt/nhi_ops.c
> > @@ -160,12 +160,17 @@ static int icl_nhi_suspend_noirq(struct tb_nhi *n=
hi, bool wakeup)
> >
> >  static int icl_nhi_resume(struct tb_nhi *nhi)
> >  {
> > +     u32 class;
> >       int ret;
> >
> >       ret =3D icl_nhi_force_power(nhi, true);
> >       if (ret)
> >               return ret;
> >
> > +     /* Set device class code as it might have changed after powering =
up */
> > +     pci_read_config_dword(nhi->pdev, PCI_CLASS_REVISION, &class);
> > +     nhi->pdev->class =3D class >> 8;
>
> What about the revision field, why not set that as well:
>         nhi->pdev->revision =3D class & 0xff;
>
> If the value is overwritten for 3 of the bytes, why not the 4th?

Fair point but I observed class change, revision stayed the same.
I read class and revision before and after icl_nhi_force_power() with
pci_read_config_dword(nhi->pdev, PCI_CLASS_REVISION, &class);
It changed from 0x8800001 -> 0xc034001

> Also this feels odd, what is changing the bytes here?  Why only the
> class?  What else changed and what caused it?

I compared 64 bytes of config space before and after modprobing
thunderbolt module
Before modprobe
lspci -s 00:0d.2 -x
00:0d.2 System peripheral: Intel Corporation Tiger Lake-LP Thunderbolt
4 NHI #0 (rev 01)
00: 86 80 1b 9a 00 00 10 00 01 00 80 08 00 00 00 00
10: 04 00 a0 80 02 00 00 00 04 80 a4 80 02 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 22 22 11 11
30: 00 00 00 00 80 00 00 00 00 00 00 00 ff 01 00 00

After modprobe
lspci -s 00:0d.2 -x
00:0d.2 System peripheral: Intel Corporation Tiger Lake-LP Thunderbolt
4 NHI #0 (rev 01)
00: 86 80 1b 9a 06 04 10 00 01 40 03 0c 00 00 00 00
10: 04 00 a0 80 02 00 00 00 04 80 a4 80 02 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 22 22 11 11
30: 00 00 00 00 80 00 00 00 00 00 00 00 ff 01 00 00

The diff is in class 00 80 08 -> 40 03 0c
and command 00 00 -> 06 04

The value 40 03 0c is defined as PCI_CLASS_SERIAL_USB_USB4 in
drivers/thunderbolt/nhi.h

I think the device itself changed the class because I tried to change
class value with setpci command and it seems to be read-only.

Thanks,
Lukasz

> thanks,
>
> greg k-h
