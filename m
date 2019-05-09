Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBAAE18D1A
	for <lists+linux-usb@lfdr.de>; Thu,  9 May 2019 17:39:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726775AbfEIPjR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 May 2019 11:39:17 -0400
Received: from mx2.suse.de ([195.135.220.15]:45968 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726597AbfEIPjQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 9 May 2019 11:39:16 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id C6D8CAD5A;
        Thu,  9 May 2019 15:39:14 +0000 (UTC)
Message-ID: <4ab79c485f568cc081aa24f35b318bdafc0c4c06.camel@suse.de>
Subject: Re: [PATCH 1/4] usb: xhci: add Immediate Data Transfer support
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>
Date:   Thu, 09 May 2019 17:38:59 +0200
In-Reply-To: <b4e49d68-a94e-f6fb-6439-78ef0ff898ef@linux.intel.com>
References: <1556285012-28186-1-git-send-email-mathias.nyman@linux.intel.com>
         <1556285012-28186-2-git-send-email-mathias.nyman@linux.intel.com>
         <CGME20190509103220eucas1p1330f2827916b55e05b1b791504963630@eucas1p1.samsung.com>
         <bc747768-7457-0df6-f57e-4aeac9c8bf0c@samsung.com>
         <3fe85fcc-a202-f746-6cd6-d3f5523348f8@linux.intel.com>
         <a369ba3931e3df113101ce9e52634e5c2ef0b957.camel@suse.de>
         <b4e49d68-a94e-f6fb-6439-78ef0ff898ef@linux.intel.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-yhBVr8IFlIo8iBY4MCtj"
User-Agent: Evolution 3.32.1 
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--=-yhBVr8IFlIo8iBY4MCtj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matthias, thanks for spending the time debugging this :)

On Thu, 2019-05-09 at 18:10 +0300, Mathias Nyman wrote:
> Got the logs off list, thanks
>=20
> The "Buffer" data in Control transfer Data stage look suspicious.
>=20
> grep "flags I:" trace_fail  | grep Data
> kworker/0:2-124   [000] d..1    63.092399: xhci_queue_trb: CTRL: Buffer
> 0000000018b65000 length 6 TD size 0 intr 0 type 'Data Stage' flags
> I:i:c:s:i:e:C
> ifconfig-1429  [005] d..1    93.181231: xhci_queue_trb: CTRL: Buffer
> 0000000018b65000 length 6 TD size 0 intr 0 type 'Data Stage' flags
> I:i:c:s:i:e:C
> ifconfig-1429  [007] dn.2    93.182050: xhci_queue_trb: CTRL: Buffer
> 0000000000000000 length 8 TD size 0 intr 0 type 'Data Stage' flags
> I:i:c:s:i:e:C
> ifconfig-1429  [007] d..2    93.182499: xhci_queue_trb: CTRL: Buffer
> 0000000080000000 length 8 TD size 0 intr 0 type 'Data Stage' flags
> I:i:c:s:i:e:C
> ifconfig-1429  [007] d..2    93.182736: xhci_queue_trb: CTRL: Buffer
> 0000000080000000 length 8 TD size 0 intr 0 type 'Data Stage' flags
> I:i:c:s:i:e:C
> kworker/0:3-1409  [000] d..3    93.382630: xhci_queue_trb: CTRL: Buffer
> 0000000080000000 length 8 TD size 0 intr 0 type 'Data Stage' flags
> I:i:c:s:i:e:C
>=20
> First guess would be that in case URB has URB_NO_TRANSFER_DMA_MAP set the=
n
> data
> will be mapped and urb->transfer_dma is already set.
> The IDT patch uses urb->trabfer_dma as a temporary buffer, and copies the
> urb->transfer_buffer there.
> if transfer buffer is already dma mapped the urb->transfer_buffer can be
> garbage,
> (shouldn't, but it can be)
>=20
> Below code avoids IDT if URB_NO_TRANSFER_DMA_MAP is set, and doesn't touc=
h
> urb->transfer_dma (patch attached)
>=20
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index fed3385..f080054 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -3423,11 +3423,14 @@ int xhci_queue_ctrl_tx(struct xhci_hcd *xhci, gfp=
_t
> mem_flags,
>  =20
>          if (urb->transfer_buffer_length > 0) {
>                  u32 length_field, remainder;
> +               u64 addr;
>  =20
>                  if (xhci_urb_suitable_for_idt(urb)) {
> -                       memcpy(&urb->transfer_dma, urb->transfer_buffer,
> +                       memcpy(&addr, urb->transfer_buffer,
>                                 urb->transfer_buffer_length);
>                          field |=3D TRB_IDT;
> +               } else {
> +                       addr =3D (u64) urb->transfer_dma;
>                  }
>  =20
>                  remainder =3D xhci_td_remainder(xhci, 0,
> @@ -3440,8 +3443,8 @@ int xhci_queue_ctrl_tx(struct xhci_hcd *xhci, gfp_t
> mem_flags,
>                  if (setup->bRequestType & USB_DIR_IN)
>                          field |=3D TRB_DIR_IN;
>                  queue_trb(xhci, ep_ring, true,
> -                               lower_32_bits(urb->transfer_dma),
> -                               upper_32_bits(urb->transfer_dma),
> +                               lower_32_bits(addr),
> +                               upper_32_bits(addr),
>                                  length_field,
>                                  field | ep_ring->cycle_state);
>          }
> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> index a450a99..7f8b950 100644
> --- a/drivers/usb/host/xhci.h
> +++ b/drivers/usb/host/xhci.h
> @@ -2160,7 +2160,8 @@ static inline bool xhci_urb_suitable_for_idt(struct=
 urb
> *urb)
>   {
>          if (!usb_endpoint_xfer_isoc(&urb->ep->desc) && usb_urb_dir_out(u=
rb)
> &&
>              usb_endpoint_maxp(&urb->ep->desc) >=3D TRB_IDT_MAX_SIZE &&
> -           urb->transfer_buffer_length <=3D TRB_IDT_MAX_SIZE)
> +           urb->transfer_buffer_length <=3D TRB_IDT_MAX_SIZE &&
> +           !(urb->transfer_flags & URB_NO_TRANSFER_DMA_MAP))
>                  return true;
>  =20
>          return false;
>=20

This could be it, I broadly checked and assumed everyone was playing nice w=
ith
the transfer_dma pointer, but I guess I might have missed something.

> If that doesn't help, then it's possible DATA trbs in control transfer ca=
n't
> use IDT at all. IDT is supported for Normal TRBs, which have a different =
trb
> type than DATA trbs in control transfers.
>=20
> Also xhci specs 4.11.7 limit IDT usage:
>=20
> "If the IDT flag is set in one TRB of a TD, then it shall be the only Tra=
nsfer
>   TRB of the TD"
>=20
> A whole control transfer is one TD, and it already contains a SETUP trans=
fer
> TRB
> which is using the IDT flag.
>=20
> Following disables IDT for control transfers (testpatch attached as well)

This one I'm not so sure as the standard defines a control transfer as a 2 =
or 3
TD operation (see 4.11.2.2):

"The Control Transfer Ring may contain Setup Stage and Status Stage TDs, an=
d
optionally Data Stage TDs."

Also, for what is worth, I spent some time testing that specific case on my
intel laptop while preparing the patch.

Regards,
Nicolas


--=-yhBVr8IFlIo8iBY4MCtj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAlzUSZMACgkQlfZmHno8
x/4sSAf8Do5KNCJXgb7KWnDKag0cZa3Mv962egNuNOAQu0190PifUpVOrTkxbenY
E6n5XtIxV82/qEfWM0xTsUMC4vUaPpcYqfURGh8qROrRITXP/wUx/DuZ4r4u5wnp
bHeoiPulntocx1c3YyQXMeWS9cT4Kq0fmZ+lhU+kvTZcmktS4q+t5QFApfjZ2/Ez
SC+wlW3ZrY3FZFKso9GRn4B3vQo7qwGRzlFZIlGD3GPkjhxVV1n3ZYOEg4K0Z8c1
e2jkzy+hUGvQ7Jia+1+K5tml4PuG1JKvQDsG1OcjLG0M2WwheWtd9JrLX6rCRt7T
cSZOFxPhnDweG/7agS5Pk6qXDrIHbg==
=ifnm
-----END PGP SIGNATURE-----

--=-yhBVr8IFlIo8iBY4MCtj--

