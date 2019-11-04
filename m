Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87C0EEDB3E
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2019 10:06:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728336AbfKDJGb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Nov 2019 04:06:31 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:55066 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727138AbfKDJGb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 Nov 2019 04:06:31 -0500
Received: by mail-wm1-f66.google.com with SMTP id z26so2511006wmi.4;
        Mon, 04 Nov 2019 01:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=TD7tNQy8In3WtYaivMEp2jopxv7QdppSYUH47F9bodc=;
        b=DmWlgq28+2z9hGN0BqRcDMQ9UCJrZwoX5bhB3QKaz/+o+JZuWjkVzhPS+QtHwbOLRa
         M8Obrc+pGuBOuIJ5xmL+MmZiW5gyCmiBiIZ22SiJBQHV9RdYxlB4YosYQdQFMiVpTons
         szvOwyTjkhNV982gddPPvPE5JU38+q+EdtyfcD6uO8cGvqANKgbklYlhJVI0uaPCPel7
         VQ/CHQYXrns+Du3e3Q4ZNFB0bkHfd6SzmyFotEfDppcMHvhzekJ+xDRfTWi5p2NKAyYX
         ExbfOyvgcKBY7GYSD6yqJVm1d4rKWXYFEiELJCYUmawMUEk4mGYs/B0BX+1CBtChc5wc
         brxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TD7tNQy8In3WtYaivMEp2jopxv7QdppSYUH47F9bodc=;
        b=tbYVLf7wzVg+oqAeFKz8LTn8nvp54mf9XebmlnNso24oP3kMrnjtE4DTiNB8ufRKIp
         KKha7J8fc1PTlZvJQ/D/r52qaD++N01SHevgdnOLf9m+RBxB8+JR580uBcbSVcC+gm6f
         EiK+j8da7QfA/JlxQ/Pl2O9koOLOBIcWU4a/Qq/DNY38Ll+dNDpOxGNAxXHOHIqrg+Td
         HZ1WqC+yvjaEElcr/BmG7POxYqebhxaUWEnntIlkvxi0jWjG5gA23C/DFwHVwvt7/K7s
         Qc3RIJQc40Myhok9J0WqsIFledXfyrMM9WvT7lKrt0pKDW1Bvwc6pdQDhxnV85UmRCeq
         Lrxg==
X-Gm-Message-State: APjAAAV/4SS/82Yo9jOF5LQR2nAFsiOIxfIQglEqTaFONSlE3n1qQ7/L
        REf+qKJlkPwxA1YP5J21aH8=
X-Google-Smtp-Source: APXvYqw7HMg5ZTvtsYVqLsSZU2fvtxaOyuR685kZNf3je6OZ+elcjkn4OfGWL37ji9WTGwwwJbWlOw==
X-Received: by 2002:a1c:1f4b:: with SMTP id f72mr20378099wmf.22.1572858387152;
        Mon, 04 Nov 2019 01:06:27 -0800 (PST)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id j14sm20510761wrj.35.2019.11.04.01.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 01:06:25 -0800 (PST)
Date:   Mon, 4 Nov 2019 10:06:24 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Peter Robinson <pbrobinson@gmail.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] usb: host: xhci-tegra: set MODULE_FIRMWARE for tegra186
Message-ID: <20191104090624.GB985882@ulmo>
References: <20191102172606.26934-1-pbrobinson@gmail.com>
 <20191102174345.GB3862867@ulmo>
 <CALeDE9PChT-A6JP6kZVmgSs9mHQtqUw0EPCGjQ-VK0arBjGBgg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="98e8jtXdkpgskNou"
Content-Disposition: inline
In-Reply-To: <CALeDE9PChT-A6JP6kZVmgSs9mHQtqUw0EPCGjQ-VK0arBjGBgg@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--98e8jtXdkpgskNou
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 02, 2019 at 06:39:45PM +0000, Peter Robinson wrote:
> On Sat, Nov 2, 2019 at 5:43 PM Thierry Reding <thierry.reding@gmail.com> =
wrote:
> >
> > On Sat, Nov 02, 2019 at 05:26:06PM +0000, Peter Robinson wrote:
> > > Set the MODULE_FIRMWARE for tegra186, it's registered for 124/210 and
> > > ensures the firmware is available at the appropriate time such as in
> > > the initrd, else if the firmware is unavailable the driver fails with
> > > the following errors:
> >
> > So the MODULE_FIRMWARE macro alone does not ensure that the firmware is
> > in the correct location, right? Rather, it's the tools that construct
> > the initial ramdisk that make use of the information added by the
> > MODULE_FIRMWARE macro to determine whether or not the firmware needs to
> > be included in the initial ramdisk or not.
>=20
> It works for tegra124 and tegra210, the patches for tegra194 have it
> as well, I have no idea why it was left out for the tegra186. On
> Fedora the 124/210 firmwares get pulled into the initrd when the
> xhci_tegra and deps do but the 186 doesn't, if you "rmmod xhci_tegra;
> modprobe xhci_tegra" once booted it works fine.

Sorry if I wasn't being clear. I'm not debating the correctness of the
patch, it obviously was just left out and probably not noticed because
nobody that tested this either wasn't building this into the kernel or
manually added the firmware to the initial ramdisk.

I was just trying to point out that merely adding MODULE_FIRMWARE does
not cause the firmware to be installed in the initial ramdisk. You still
need some tool looking at the information added by MODULE_FIRMWARE and
then copying the corresponding image to the initial ramdisk at its
creation.

Thierry

> > > tegra-xusb 3530000.usb: Direct firmware load for nvidia/tegra186/xusb=
=2Ebin failed with error -2
> > > tegra-xusb 3530000.usb: failed to request firmware: -2
> > > tegra-xusb 3530000.usb: failed to load firmware: -2
> > > tegra-xusb: probe of 3530000.usb failed with error -2
> > >
> > > Fixes: 5f9be5f3f899 ("usb: host: xhci-tegra: Add Tegra186 XUSB suppor=
t")
> > > Fixes: 488a04d4bb2f ("arm64: tegra: Enable XUSB host controller on Je=
tson TX2")
> > > Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> > > ---
> > >  drivers/usb/host/xhci-tegra.c | 1 +
> > >  1 file changed, 1 insertion(+)
> >
> > The commit message is slightly misleading, but I guess it's ultimately
> > correct if you run standard tools to generate the initial ramdisk, so:
> >
> > Acked-by: Thierry Reding <treding@nvidia.com>
> >
> > > diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-te=
gra.c
> > > index 2ff7c911fbd0..d25aba8fa219 100644
> > > --- a/drivers/usb/host/xhci-tegra.c
> > > +++ b/drivers/usb/host/xhci-tegra.c
> > > @@ -1433,6 +1433,7 @@ static const struct tegra_xusb_soc tegra186_soc=
 =3D {
> > >       .scale_ss_clock =3D false,
> > >       .has_ipfs =3D false,
> > >  };
> > > +MODULE_FIRMWARE("nvidia/tegra186/xusb.bin");
> > >
> > >  static const struct of_device_id tegra_xusb_of_match[] =3D {
> > >       { .compatible =3D "nvidia,tegra124-xusb", .data =3D &tegra124_s=
oc },
> > > --
> > > 2.23.0
> > >

--98e8jtXdkpgskNou
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2/6hAACgkQ3SOs138+
s6HO3A/+JXAaQX8ZmFN95tT/lMk9GclrdJLy7az1obsaaGZ6cEPGtkf2XAR3tnMX
CYvC8FrhSqluiGoyTZZEFyXFVG3AgGVGPg5crv6IpQscA8O2v9J65B+2gewsaBo8
ysf+gMspMQvCyxF6qhErVYn5doBaFt0yD+rcCESACe4rB5cTL3IIJ1KmTw3FC2ol
05rqepc/tjbIh2wRp8ASTyPkRDoTCycWdkqr9AupGHQffONZh0UsbcEUgW8Kqsea
on99iepcN5oc3pJbEtVyYniR205woOh2MhPfNHhHFDxGJOpIc6vswpLZ1f5XCeuB
SFpMZzvvp0y+Thr14ZHXeZirDDHuOlYppP4jPZgKLq61PHjq7EFgYLRUFUkCMa0c
kw0pMZGIHUAy5gKC9PFnKm7nwtuBWoBdK7AomZsfaF1U3DrORSY++IFWKP6SJGqb
bEUb6M8A/vUDAF5zDeIh0zo3dVrlis/G8cAf1CfhduYq8uDKygIaEpY7tWzvz0ZR
ozsy45vi4a4RKpNlTkHkq/9U2Yuk7K46oiZeoGV3fL1hya19BE6uSGMs6ZIoK0MA
r1xCPp5ClPuv0c4STG6Ng7iXy2kCWBfmQH+gbxTvRp15g8BcnexXhYWwEWiSilPH
DQyJJb7127lbIXMKRv140RRw3do9+YwoJ1/Db3G5loxLksbTK1g=
=Pqdx
-----END PGP SIGNATURE-----

--98e8jtXdkpgskNou--
