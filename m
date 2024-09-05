Return-Path: <linux-usb+bounces-14681-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C9396CF14
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 08:21:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4065C1F2814A
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 06:21:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 017E11898EB;
	Thu,  5 Sep 2024 06:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="bUKXoQYK"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AE5185941
	for <linux-usb@vger.kernel.org>; Thu,  5 Sep 2024 06:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725517290; cv=none; b=C+0SxLh71r7CiBmiZXVSd9l8BMUmIr9jP2QNb/q3IDgenti6Ccibb3nYkKkT2gSuvEqmY47d05gRhlYIYSIhYyhx+Stxx2Ja/24s82MjkQkA6ewJtbrt7bp+/4vpwDJxfaSy3jTSL0eeLd0Ruxso7qQqv92DBU69cooJveV8WOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725517290; c=relaxed/simple;
	bh=a3CK8iaCOykrxzj/7UsjxaRwAlWyah712Yy6LNsezJI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eqkI8OLOn9s7VUCudUvOgaQm9zbwIsQ3eyRlSojoMGM8UC0+NNgsu32VaYmussOJsSPDNXS1OsAGWb7cOt7NLeP1MJwi+DrI+a1Z1XBgiewcWE4yo1vmBDtfGUh/nocf86EybMl/II57dpV+ctUQP8PgTJmd/LG7yAOS0FQyWqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=bUKXoQYK; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4B50C3F187
	for <linux-usb@vger.kernel.org>; Thu,  5 Sep 2024 06:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1725517278;
	bh=mbmUIVBPF1avSMx1JKXJ9kX4vovDkNTWxLfCkm8vNDw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=bUKXoQYK66f4AnO8uA8HxT7xif3MemGMrv8amjPyW8WAzmPkJgBaxpJRZdHIJ+lK9
	 G2ufpANDnCQ1HN3HMwJppeRE8H6PBC26IqPk1ewOie/0L4otiLijk0/7BY5bGMLCSQ
	 Aeggk1DEX0RrpGGn4zUUUQS9GZqwqmdGLJ93F3kkcg9Tmf7PZ2Sx6aN8zhs8lmdOU0
	 6rC3XLWzg/ci4W1e+dX2BRmCEimdfRcSI6qFx29vz6L/iXTJ8574/7ukAMUC1s1E3w
	 PBs/SGsLt/OFtdYBlRGfKRocwhZ7d2/GO1H6yrw65kdOuTOjDvsl6lTPdCzj6OE0de
	 5H1tIQRrRv78w==
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5c25680de68so402118a12.2
        for <linux-usb@vger.kernel.org>; Wed, 04 Sep 2024 23:21:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725517278; x=1726122078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mbmUIVBPF1avSMx1JKXJ9kX4vovDkNTWxLfCkm8vNDw=;
        b=m3DS6dnXVp4mdB5Bi5C9iYTE73qBwy+BmtlJtJPj88s1iV/ObPjbABK37VFWRx95Fx
         sBj0JAoWIVSiYNfui2ygp9A7mY27GigqkiPwimgYnH0I1asTE1ot819JV+3p6QUJ63tV
         /qjNh10NmxuqDfHF+wPI3MYM1dp6Pnz331Efv31phMrNQjkifls0D3tkmLo8wPLycK2G
         0lo6FoZWZRMyV3Dzr9kPz5vhNWKqOdrGdrPR4l2QKhghxBUh7wj6l2s/dX3DjwTzOW7K
         iOBzffncaAowgMsFQfVACqnNhVKlFp1Y0vxrnBagpxhj8SEkwxj1/HZ5N34CwPoGIvrJ
         tmKA==
X-Forwarded-Encrypted: i=1; AJvYcCV7yzxzLARAiFWI0ybhnz/Go+MTdNfv8sb0V+EDEqOzP8+L/jf+m5Xh4rqCSWM9V/VGDCIGnCmzNuE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFgbWHw9W21g9EsuWAYV9bbRexvwzLn4sbfY28vOgU5W639nqc
	Td/cemlAvhUTf37lO3oCc2f/h4Hw0RpYbD4eFi6tw9D8w/d8hjF92gMTON5XEsAhIewJg5CE8sw
	N+NWM022XBMnjh563px0+XwZj8viNeDmpfzwm5Hz8wagTJBXpp756mTtZ3w5eeC4agUgMc4gkFd
	Jm852quu4T6AHxGr5pq5rPfXpMbJmkvnRy4uA08vu6/5B0U3uS
X-Received: by 2002:a05:6402:270c:b0:5c2:53a1:c209 with SMTP id 4fb4d7f45d1cf-5c253a1c259mr8985056a12.25.1725517277802;
        Wed, 04 Sep 2024 23:21:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSMtMo2aa9bEuAXrrmcrQmbvDN6XOqnkcQURyv/FmGjhc9B5NljiU6bnI8WOeBvKMxCwUSJWfDSGwlyKHGt1k=
X-Received: by 2002:a05:6402:270c:b0:5c2:53a1:c209 with SMTP id
 4fb4d7f45d1cf-5c253a1c259mr8985021a12.25.1725517277241; Wed, 04 Sep 2024
 23:21:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240905042447.418662-1-kai.heng.feng@canonical.com>
 <20240905042447.418662-2-kai.heng.feng@canonical.com> <2024090510-repaying-disrupt-e568@gregkh>
In-Reply-To: <2024090510-repaying-disrupt-e568@gregkh>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Thu, 5 Sep 2024 14:21:03 +0800
Message-ID: <CAAd53p6N0PbxP6_ZxCaA7oXM=Buo8=LGxneT7Fs06bCtXL8cYg@mail.gmail.com>
Subject: Re: [PATCH 2/2] platform/x86/hp: Avoid spurious wakeup on HP ProOne 440
To: Greg KH <gregkh@linuxfoundation.org>
Cc: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, jorge.lopez2@hp.com, 
	acelan.kao@canonical.com, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 5, 2024 at 1:18=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Thu, Sep 05, 2024 at 12:24:47PM +0800, Kai-Heng Feng wrote:
> > The HP ProOne 440 has a power saving design that when the display is
> > off, it also cuts the USB touchscreen device's power off.
> >
> > This can cause system early wakeup because cutting the power off the
> > touchscreen device creates a disconnect event and prevent the system
> > from suspending:
> > [  445.814574] hub 2-0:1.0: hub_suspend
> > [  445.814652] usb usb2: bus suspend, wakeup 0
> > [  445.824629] xhci_hcd 0000:00:14.0: Port change event, 1-11, id 11, p=
ortsc: 0x202a0
> > [  445.824639] xhci_hcd 0000:00:14.0: resume root hub
> > [  445.824651] xhci_hcd 0000:00:14.0: handle_port_status: starting usb1=
 port polling.
> > [  445.844039] xhci_hcd 0000:00:14.0: PM: pci_pm_suspend(): hcd_pci_sus=
pend+0x0/0x20 returns -16
> > [  445.844058] xhci_hcd 0000:00:14.0: PM: dpm_run_callback(): pci_pm_su=
spend+0x0/0x1c0 returns -16
> > [  445.844072] xhci_hcd 0000:00:14.0: PM: failed to suspend async: erro=
r -16
> > [  446.276101] PM: Some devices failed to suspend, or early wake event =
detected
> >
> > So add a quirk to make sure the following is happening:
> > 1. Let the i915 driver suspend first, to ensure the display is off so
> >    system also cuts the USB touchscreen's power.
> > 2. If the touchscreen is present, wait a while to let the USB disconnec=
t
> >    event fire.
> > 3. Since the disconnect event already happened, the xhci's suspend
> >    routine won't be interrupted anymore.
> >
> > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > ---
> >  drivers/platform/x86/hp/hp-wmi.c | 104 ++++++++++++++++++++++++++++++-
> >  1 file changed, 103 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp=
/hp-wmi.c
> > index 876e0a97cee1..80fc3ee4deaf 100644
> > --- a/drivers/platform/x86/hp/hp-wmi.c
> > +++ b/drivers/platform/x86/hp/hp-wmi.c
> > @@ -30,6 +30,9 @@
> >  #include <linux/rfkill.h>
> >  #include <linux/string.h>
> >  #include <linux/dmi.h>
> > +#include <linux/delay.h>
> > +#include <linux/pci.h>
> > +#include <linux/usb.h>
> >
> >  MODULE_AUTHOR("Matthew Garrett <mjg59@srcf.ucam.org>");
> >  MODULE_DESCRIPTION("HP laptop WMI driver");
> > @@ -1708,6 +1711,52 @@ static void __exit hp_wmi_bios_remove(struct pla=
tform_device *device)
> >               platform_profile_remove();
> >  }
> >
> > +static int hp_wmi_suspend_handler(struct device *device)
> > +{
> > +     acpi_handle handle;
> > +     struct acpi_device *adev;
> > +     struct device *physdev;
> > +     struct usb_port *port_dev;
> > +     struct usb_device *udev;
> > +     acpi_status status;
> > +     bool found =3D false;
> > +
> > +     /* The USB touchscreen device always connects to HS11 */
> > +     status =3D acpi_get_handle(NULL, "\\_SB.PC00.XHCI.RHUB.HS11", &ha=
ndle);
> > +     if (ACPI_FAILURE(status))
> > +             return 0;
> > +
> > +     adev =3D acpi_fetch_acpi_dev(handle);
> > +     if (!adev)
> > +             return 0;
> > +
> > +     physdev =3D get_device(acpi_get_first_physical_node(adev));
> > +     if (!physdev)
> > +             return 0;
> > +
> > +     port_dev =3D to_usb_port(physdev);
>
> That's a brave cast, how do you "know" this is this device type?

Assuming the the physical device of "\_SB.PC00.XHCI.RHUB.HS11" is a usb_por=
t.
But yes there's no guarantee.

>
> > +     if (port_dev->state =3D=3D USB_STATE_NOTATTACHED)
> > +             return 0;
> > +
> > +     udev =3D port_dev->child;
> > +
> > +     if (udev) {
> > +             usb_get_dev(udev);
> > +             if (le16_to_cpu(udev->descriptor.idVendor) =3D=3D 0x1fd2 =
&&
> > +                 le16_to_cpu(udev->descriptor.idProduct) =3D=3D 0x8102=
) {
> > +                     dev_dbg(&hp_wmi_platform_dev->dev, "LG Melfas tou=
chscreen found\n");
> > +                     found =3D true;
> > +             }
> > +             usb_put_dev(udev);
> > +
> > +             /* Let the xhci have time to handle disconnect event */
> > +             if (found)
> > +                     msleep(200);
>
> why 200?

A minimal delay that works. We can make it longer too.

>
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> >  static int hp_wmi_resume_handler(struct device *device)
> >  {
> >       /*
> > @@ -1745,7 +1794,7 @@ static int hp_wmi_resume_handler(struct device *d=
evice)
> >       return 0;
> >  }
> >
> > -static const struct dev_pm_ops hp_wmi_pm_ops =3D {
> > +static struct dev_pm_ops hp_wmi_pm_ops =3D {
> >       .resume  =3D hp_wmi_resume_handler,
> >       .restore  =3D hp_wmi_resume_handler,
> >  };
> > @@ -1871,6 +1920,57 @@ static int hp_wmi_hwmon_init(void)
> >       return 0;
> >  }
> >
> > +static int lg_usb_touchscreen_quirk(const struct dmi_system_id *id)
> > +{
> > +     struct pci_dev *vga, *xhci;
> > +     struct device_link *vga_link, *xhci_link;
> > +
> > +     vga =3D pci_get_class(PCI_CLASS_DISPLAY_VGA << 8, NULL);
> > +
> > +     xhci =3D pci_get_class(PCI_CLASS_SERIAL_USB_XHCI, NULL);
> > +
> > +     if (vga && xhci) {
> > +             xhci_link =3D device_link_add(&hp_wmi_platform_dev->dev, =
&xhci->dev,
> > +                                   DL_FLAG_STATELESS);
> > +             if (xhci_link)
> > +                     dev_info(&hp_wmi_platform_dev->dev, "Suspend befo=
re %s\n",
> > +                              pci_name(xhci));
>
> When drivers work properly, they are quiet, was this ment to be
> dev_dbg()?

Sure, will change it to dev_dbg() next revision.

>
> > +             else
> > +                     return 1;
> > +
> > +             vga_link =3D device_link_add(&vga->dev, &hp_wmi_platform_=
dev->dev,
> > +                                        DL_FLAG_STATELESS);
> > +             if (vga_link)
> > +                     dev_info(&hp_wmi_platform_dev->dev, "Suspend afte=
r %s\n",
> > +                              pci_name(vga));
>
> Same here.

Thanks for the review.

Kai-Heng

>
> thanks,
>
> greg k-h

