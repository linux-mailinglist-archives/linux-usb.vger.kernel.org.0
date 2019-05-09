Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15F2818943
	for <lists+linux-usb@lfdr.de>; Thu,  9 May 2019 13:51:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726192AbfEILvt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 May 2019 07:51:49 -0400
Received: from mx2.suse.de ([195.135.220.15]:57704 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725961AbfEILvs (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 9 May 2019 07:51:48 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id D3A5AAB92;
        Thu,  9 May 2019 11:51:46 +0000 (UTC)
Message-ID: <a369ba3931e3df113101ce9e52634e5c2ef0b957.camel@suse.de>
Subject: Re: [PATCH 1/4] usb: xhci: add Immediate Data Transfer support
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>
Date:   Thu, 09 May 2019 13:51:45 +0200
In-Reply-To: <3fe85fcc-a202-f746-6cd6-d3f5523348f8@linux.intel.com>
References: <1556285012-28186-1-git-send-email-mathias.nyman@linux.intel.com>
         <1556285012-28186-2-git-send-email-mathias.nyman@linux.intel.com>
         <CGME20190509103220eucas1p1330f2827916b55e05b1b791504963630@eucas1p1.samsung.com>
         <bc747768-7457-0df6-f57e-4aeac9c8bf0c@samsung.com>
         <3fe85fcc-a202-f746-6cd6-d3f5523348f8@linux.intel.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-skurjKu6E2ioWVaDjSDs"
User-Agent: Evolution 3.32.1 
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--=-skurjKu6E2ioWVaDjSDs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-05-09 at 14:40 +0300, Mathias Nyman wrote:
> On 9.5.2019 13.32, Marek Szyprowski wrote:
> > Dear All,
> >=20
> > On 2019-04-26 15:23, Mathias Nyman wrote:
> > > From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> > >=20
> > > Immediate data transfers (IDT) allow the HCD to copy small chunks of
> > > data (up to 8bytes) directly into its output transfer TRBs. This avoi=
ds
> > > the somewhat expensive DMA mappings that are performed by default on
> > > most URBs submissions.
> > >=20
> > > In the case an URB was suitable for IDT. The data is directly copied
> > > into the "Data Buffer Pointer" region of the TRB and the IDT flag is
> > > set. Instead of triggering memory accesses the HC will use the data
> > > directly.
> > >=20
> > > The implementation could cover all kind of output endpoints. Yet
> > > Isochronous endpoints are bypassed as I was unable to find one that
> > > matched IDT's constraints. As we try to bypass the default DMA mappin=
gs
> > > on URB buffers we'd need to find a Isochronous device with an
> > > urb->transfer_buffer_length <=3D 8 bytes.
> > >=20
> > > The implementation takes into account that the 8 byte buffers provide=
d
> > > by the URB will never cross a 64KB boundary.
> > >=20
> > > Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> > > Reviewed-by: Felipe Balbi <felipe.balbi@linux.intel.com>
> > > Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> >=20
> > I've noticed that this patch causes regression on various Samsung Exyno=
s
> > 5420/5422/5800 boards, which have USB3.0 host ports provided by
> > DWC3/XHCI hardware module. The regression can be observed with ASIX USB
> > 2.0 ethernet dongle, which stops working after applying this patch (eth=
0
> > interface is registered, but no packets are transmitted/received). I ca=
n
> > provide more debugging information or do some tests, just let me know
> > what do you need. Reverting this commit makes ASIX USB ethernet dongle
> > operational again.
> >=20
>=20
> Thanks for reporting.
>=20
> Would it be possible to check if your ASIX ethernet dongle works on some
> desktop/laptop setup with this same IDT patch?
>=20
> Also Exynos xhci traces could help, they would show the content of the TR=
Bs
> using IDT.
> Maybe byte order gets messed up?
>=20
> Take traces with:
>=20
> mount -t debugfs none /sys/kernel/debug
> echo 81920 > /sys/kernel/debug/tracing/buffer_size_kb
> echo 1 > /sys/kernel/debug/tracing/events/xhci-hcd/enable
>=20
> <connect ASIX eth dongle, try to use it>
>=20
> send /sys/kernel/debug/tracing/trace content to me
>=20
> If we can't get this fixed I'll revert the IDT patch

Hi Matthias, thanks for your help.

I'll also be looking into it, so please send me the logs too.

Regards,
Nicolas


--=-skurjKu6E2ioWVaDjSDs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAlzUFFEACgkQlfZmHno8
x/7dvwf+PwlFrYfG36+3B+D0MfHDE5y5XEUxA0tByCWiUvRVIDx1mf8sB2CNplab
8TafcGoD5X3odoP0i4lXdBKYRJ1zm6ETfQiMrOkhVvQq8KdCeX+gd7SB6H9wnThF
sJe0iY/+tzQraGxuFKfBmUEdO3uRWpEC4eL/z5qSKJjl82sTVLw0XhreB4tn3YUw
PVdh3JiphpZbevko0Q7Zb5+e8sjFN2D93Y+FbCqTkcs1rUxYE6zm4Gh6cXQFS6Uz
lcNxef71GlECelaErD+ie9I91ruPsEZlWPRqTJVkVoPT3dZcv30ZtOqIiA4DrUlo
uncLz0/5/pVBkl5ClU9T5Zd/84rCgA==
=j2T9
-----END PGP SIGNATURE-----

--=-skurjKu6E2ioWVaDjSDs--

