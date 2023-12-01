Return-Path: <linux-usb+bounces-3575-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D63958011DE
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 18:39:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9200D2813E2
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 17:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC89B4E61C;
	Fri,  1 Dec 2023 17:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="Fb+dWlkR"
X-Original-To: linux-usb@vger.kernel.org
Received: from stravinsky.debian.org (stravinsky.debian.org [IPv6:2001:41b8:202:deb::311:108])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEB75AC;
	Fri,  1 Dec 2023 09:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4Wa8j3r7oEbKExuEnkuTJYGC17oL27mFCTw6RoYzmI0=; b=Fb+dWlkRVIIVFybolBlC5F7O0P
	3YTdexrMgwY7EA5B2D69Vj4XffOB5WGwwUKAfG+Lc27UeKVpUqRbUZul3jzqnRCZdVcF85uhhA3NB
	+OHy7d3HwXC8gBzJMBOEx047vQ9/FbRFqO0Ztlxd/ZxR/ntaHIoHeaTFle5vG8LVXQPjVWLwieGS7
	3W6h+c7wVbP0M4qmtJxLeUS4hOj0tsFUIZgBlAUHk87j+jKp2bjYhSkii713VDnGZCLhgKerYLsbd
	F66cdmL6EdvxnKPDFtaagCGhx4a+ysa0fFzicOSo0Xqgryvb792PEPRgFvepWt2y+1smpIiUGkgyR
	V4W4LPww==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <kibi@debian.org>)
	id 1r97TS-00Dtb8-6G; Fri, 01 Dec 2023 17:38:47 +0000
Date: Fri, 1 Dec 2023 18:38:43 +0100
From: Cyril Brulebois <kibi@debian.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	bcm-kernel-feedback-list@broadcom.com, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Jim Quinlan <james.quinlan@broadcom.com>
Subject: Re: [PATCH V2 0/2] ARM: dts: bcm2711: Add generic xHCI
Message-ID: <20231201173843.isjlp7zphdvvyvbt@mraw.org>
Organization: Debian
References: <20231130154229.22334-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2t6bpiev3kckksbh"
Content-Disposition: inline
In-Reply-To: <20231130154229.22334-1-wahrenst@gmx.net>
X-Debian-User: kibi


--2t6bpiev3kckksbh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

Stefan Wahren <wahrenst@gmx.net> (2023-11-30):
> In contrast to the Raspberry Pi 4, the Compute Module 4 or the IO board
> does not have a VL805 USB 3.0 host controller, which is connected via
> PCIe. Instead, the BCM2711 on the Compute Module provides the built-in
> xHCI.
>=20
> Changes in V2:
> - adjust xHCI compatible as suggested by Justin & Florian
> - keep xHCI disabled in order to let the bootloader decide which
>   USB block should be enabled, which result in a drop of patch 3
>=20
> Stefan Wahren (2):
>   dt-bindings: usb: xhci: Add optional power-domains
>   ARM: dts: bcm2711: Add generic xHCI
>=20
>  .../devicetree/bindings/usb/generic-xhci.yaml      |  3 +++
>  arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi        |  5 +++++
>  arch/arm/boot/dts/broadcom/bcm2711.dtsi            | 14 ++++++++++++++
>  3 files changed, 22 insertions(+)

Thanks, tests look much better this time!

Tested-by: Cyril Brulebois <cyril@debamax.com>


With CM4 Lite on CM4 IO Board, with a Samsung flash drive and a USB
keyboard connected to onboard USB ports, I'm getting the following
results (still with a Debian 12 arm64 userspace):

1. With unpatched kernel and unmodified config.txt:
     Both USB devices are working fine.

2. With unpatched kernel and otg_mode=3D1 in config.txt:
     Both USB devices disappear. lsmod reports dwc2 is no longer loaded,
     along with all USB and SCSI related modules.

3. With patched kernel and unmodified config.txt:
     Both USB devices are still working fine. lsmod confirms dwc2 is
     still used.

4. With patched kernel and otg_mode=3D1 in config.txt:
     Both USB devices are still working fine. lsmod reports dwc2 is
     going away, and other USB modules come up: usbhid, xhci_hcd,
     xhci_plat_hcd, along with others like hid, hid_generic, joydev.=20

     Reading from the Samsung flash drive gives a little boost, from
     37.5 MB/s to 38.7 MB/s. Writing to it gives a little boost, from
     16.5 MB/s to 17.4 MB/s. Not as spectacular as Florian's results but
     still not a regression! :)

I tested that initially with a CM4 Lite Rev 1.0 (which was breaking case
number 3 with the v1 of this patch series), then extended testing to CM4
8/32 Rev 1.0 and CM4 4/32 Rev 1.1, which confirmed those results.


Adding a PCIe-to-USB expansion board to see if this has side effects on
other USB things, that still works fine in cases 3 and 4 (so without or
with otg_mode=3D1), having a Samsung flash drive on the PCIe-to-USB board
and another one the onboard USB port. At this point, I only verified the
block devices were reported by lsblk though (no actual transfer tests).

Of course that relies on also applying Jim Quinlan's PCIe patch series
v8 to make sure PCIe isn't an issue:
  https://lore.kernel.org/all/20231126201946.ffm3bhg5du2xgztv@mraw.org/

I've confirmed the presence of both Samsung flash drives with three
different cards (adding CONFIG_USB_XHCI_PCI_RENESAS=3Dm to the config
shared in the v1 thread, and adding /lib/firmware/renesas_usb_fw.mem):
 - SupaHub PCE6U1C-R02, VER 006
 - SupaHub PCE6U1C-R02, VER 006S
 - Waveshare PCIe TO USB 3.2 Gen1 (B)
   https://www.waveshare.com/wiki/PCIe_TO_USB_3.2_Gen1_(B)


Finally, I've deployed the patched kernel (still this v2 plus Jim's v8)
in a CM4-based product that uses both onboard USB ports and PCIe-to-USB
ports, and all USB components still work fine (3 RF adapters, 1 modem).
That's the case with an unmodified config.txt, but also when adding
otg_mode=3D1:
 - xhci_pci and xhci_pci_renesas were already loaded;
 - xhci_plat_hcd appears in OTG mode, while dwc2 goes away.


Cheers,
--=20
Cyril Brulebois (kibi@debian.org)            <https://debamax.com/>
D-I release manager -- Release team member -- Freelance Consultant

--2t6bpiev3kckksbh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEtg6/KYRFPHDXTPR4/5FK8MKzVSAFAmVqGh0ACgkQ/5FK8MKz
VSDCQBAAlJhWu697rQThaKLv9VPjrfrHclcBoraECyQiXlCCW0H4b3lAKyE9qBRi
XJjyRtxDrVvEsL2AqsWzhwKTm6Vjl1Lghmp+LfAN2IzWScTOINnaV8V5H3/B/02U
eMGPg9XvfWqfs55ubQxvk2sM3x8wn5bOts5YGCWfpI9dIJQjvk+o2E9hxanKGpSp
+YUyF9SBvU57mvZjJLbzvGwOwcH72tiuwPFm7/dUniikIrBUNv+FvezE4ovTRJ5A
/mV043WinWOYl/DF34eLcT4xByiQhj+U6OYSUhc15MnbROOsAvfR/eZXdFB2fgPg
qAsDH9TqEOFpSoyEkMjZ4d2PNmF7yCEoFAasqcBh+XNk8bOl4SVkC+9E7TVfShhT
9tR2UlHiXLVm7vqPjvh1ozP9wfs4axuNrXAL6nw26fd8uc54Gv3hXbPWw7yAOR8E
EgKXSL8mYKnX0SUDVxOo78G4/2m/3YNtRbYlI6HzjjwAEIBxPBEthjPX+tcxea0Z
mkhGzy1axMOSOiOshU6W3MH89JGnPKw5C3A+hvJRA6s90grtHrab1bnzk/eLVUZf
u9ah4Mo5d/xzdTQpCJAYuiT7fcoFiEcMsjwCYkFhQv36Rmkh66vSRap6otxSXbIW
BNQz3XRzi6KsIeR3JerFz+nrim9HpGiM/iADrjyHOI0XwLUxXPQ=
=68RH
-----END PGP SIGNATURE-----

--2t6bpiev3kckksbh--

