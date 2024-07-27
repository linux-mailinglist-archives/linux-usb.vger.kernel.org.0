Return-Path: <linux-usb+bounces-12498-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BB593DF41
	for <lists+linux-usb@lfdr.de>; Sat, 27 Jul 2024 14:17:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C7371C21474
	for <lists+linux-usb@lfdr.de>; Sat, 27 Jul 2024 12:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E0746F2E3;
	Sat, 27 Jul 2024 12:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="SFM9CPl2"
X-Original-To: linux-usb@vger.kernel.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A6511C83
	for <linux-usb@vger.kernel.org>; Sat, 27 Jul 2024 12:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722082653; cv=none; b=cY30L2aUFvNgD9ix1C76qiqHBPewKG2EtwpHMrvKYwg+s8wBWuyPT8cuQabrNwjYCldOs1LDhi+m784jZMgWTwDs2swJjjdPTTMSlI82WdY9SiYcbs2/qsow4fGu5t67ZUmMCwzsS+pgLACTQFXN0DUFi2owd/jTgPZRaY6j2mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722082653; c=relaxed/simple;
	bh=MiOl+8vSPd0uSfmk9/lbESQleLrCM2Aq9o4raMgSAmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fD1d/XUGjHHzWOBDR2/DSl+kobOf+w4WOw2jut6+G4bjeht6cJNLyj1pUeK17Kw26m0b8sUQbLFCrBuC/RaqBf2OygIwdweqTKCPNr6JCOa7xG1Akdq9vQHOwLBQFyBnIweKTxDcKKE/Of8dIfBa8rdGcfVKUdJiAfocf4ddmug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=SFM9CPl2; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=MLfmt1BeAJQ+aW59n27wrZcivR61VXdsigzyD48WBLs=; b=SFM9CPl2eK/yGcQUtig/vU8BxK
	fgbOyZs4E8wqZCx0BlmZJhRVUGIP0sFDek5dZoDxdgFz9/bYL9ReqPERBpSEAL/uiWC5BkNqqWVrG
	Ramw5ETlDZgkvtF4resw34o9nl+791SpYhwq4KNNeo90S1tsAtnB0TXN/pyiFDkM6bDYJ4spl6dAj
	RElYrmir+nH2Ys7gqnuO30LEEKX4Oex738Dz20MM/r5TUJDE9JWkX0sDv20KO3SSsxO8tYYgtyE3V
	cqtJuLazTJxLhciTlLaeNsVFASmkeeu8Ni73H/sxCNWfrNtrsLeHqvuFHjeT34r0hNhK+5azV2ueA
	nL8PDfaw==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <kibi@debian.org>)
	id 1sXg0x-009NqI-3t; Sat, 27 Jul 2024 11:55:07 +0000
Date: Sat, 27 Jul 2024 13:55:04 +0200
From: Cyril Brulebois <kibi@debian.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] xhci-pci: Make xhci-pci-renesas a proper modular driver
Message-ID: <20240727115504.k33hshmf4wrn3us2@mraw.org>
Organization: Debian
References: <ZqGeehVxETDl57eT@decadent.org.uk>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4ydbv2cq5iq4tk7t"
Content-Disposition: inline
In-Reply-To: <ZqGeehVxETDl57eT@decadent.org.uk>
X-Debian-User: kibi


--4ydbv2cq5iq4tk7t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Ben Hutchings <ben@decadent.org.uk> (2024-07-25):
> If CONFIG_USB_XHCI_PCI_RENESAS is enabled, xhci-pci conditionally
> calls into the xhci-pci-renesas module, which means both modules must
> be loaded to use any xHCI PCI controller.
>=20
> The MODULE_FIRMWARE declaration in the base xhci-pci module causes
> initramfs-tools to check for and warn about missing firmware for the
> Renesas xHCI controllers, when any xHCI PCI controller is present.
> And because of the previous oddity, simply moving this declaration to
> xhci-pci-renesas wouldn't help.
>=20
> To fix this, reverse the relationship between the modules:
>=20
> - Remove the quirk for the Renesas xHCIs, and the driver_data
>   structure used only for them
> - In xhci-pci:
>   - Rename xhci_pci_probe() to xhci_pci_common_probe()
>   - Export xhci_pci_common_probe() and xhci_pci_remove()
>   - Use a new probe function that rejects the Renesas xHCIs and then
>     calls the common probe function
> - In xhci-pci-renesas:
>   - Stop exporting renesas_xhci_check_request_fw()
>   - Add a probe function that calls renesas_xhci_check_request_fw()
>     followed by xhci_pci_common_probe()
>   - Add and register a new pci_driver matching only the Renesas xHCIs
>     and using its own probe function, but with other operations the
>     same as in xhci-pci
> - Make CONFIG_USB_XHCI_PCI_RENESAS depend on CONFIG_USB_XHCI_PCI,
>   not the other way around
>=20
> Finally, move the MODULE_FIRMWARE declaration to xhci-pci-renesas.
>=20
> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>

Tested-by: Cyril Brulebois <cyril@debamax.com>

On top of 16f3a28cf5f876a7f3550d8f4c870a7b41bcfaef, starting from a
distribution-oriented .config (Debian's 6.10-1~exp1 arm64 package),
default answers to oldconfig, adding CONFIG_USB_XHCI_PCI_RENESAS=3Dm
afterwards.

On the hardware side: Raspberry Pi CM4 Lite on a CM4 IO Board, with two
(slightly) different Supahub PCIe-to-quad-USB cards (006 and 006S),
everything is good with the firmware available. Otherwise this happens:

    [    7.965954] xhci-pci-renesas 0000:01:00.0: failed to load firmware r=
enesas_usb_fw.mem, fallback to ROM
    [    7.975705] xhci-pci-renesas 0000:01:00.0: xHCI Host Controller
    [    7.981728] xhci-pci-renesas 0000:01:00.0: new USB bus registered, a=
ssigned bus number 1
    [   27.982001] xhci-pci-renesas 0000:01:00.0: can't setup: -110
    [   27.987787] xhci-pci-renesas 0000:01:00.0: USB bus 1 deregistered
    [   27.994007] xhci-pci-renesas 0000:01:00.0: init 0000:01:00.0 fail, -=
110
    [   28.000742] xhci-pci-renesas 0000:01:00.0: probe with driver xhci-pc=
i-renesas failed with error -110

(No onboard ROM on those.)

Thanks, Ben!


Cheers,
--=20
Cyril Brulebois (kibi@debian.org)            <https://debamax.com/>
D-I release manager -- Release team member -- Freelance Consultant

--4ydbv2cq5iq4tk7t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEtg6/KYRFPHDXTPR4/5FK8MKzVSAFAmak4BMACgkQ/5FK8MKz
VSAOFg//fsuSMb8j4DtOLKUWg+YPQ42hLLueyqC9xc/A6b/fNnwzUZ4dk2c4hZU5
eDcw3UvjX0UAjuwDkvOf+20V+PhkrMzvF2yZaHjHjFbkwIkWNZwkkmP7xyRsVWaB
oo0tjfA2FStSCgYM7BM2wjc1oV/gRNiAKYsHF36rXfB8VaOqrmqRP5VtAfJwYu2A
UQB4QcG/wXJ2IVKZiwBW9w1HiOIeVVPiR7Ka7xWu+SSEatpeYwV+HBHTVrMeFVV8
dPusHXKSJLPK3jO44ZqJGNSit5ZV7R2yf/d86I8slm3j6LcF+d1tKL49JCd3YdC1
CAst5fyUy2WSrRHrYRPjB3FJLb+ELwjKYidQHXlOrZT9sNLAMpxtYahLAmVvEI2D
dSMcfxC+OX0rIZbWQ34uchCdrdkJD8eRMoGaVI4IFqHJwKqREmBHYWeJOf3mlSKZ
iKuS+al6GQPg4Tw7polFaOIrubdhhBdfjaAW/rsx7vZnBmWDAbQ9suk7rIAll76h
k9MYYFZ0l1WJ7vI2zqq6Fh8+XQmlg1ABfrduXCzhaDl0NZyx5wuPFpiGQ1E2Qrkx
vhPxAKhODQ/0PKYV+J+uHe9rbAiYMz4/X/hcphD38ZeRJuleJptQb13ysqlX/UNM
s6BDMxrjH41IQjLBLi+i97Xy6NfKhODUb7t5JQwlzZ+vBnvHr+M=
=U4sn
-----END PGP SIGNATURE-----

--4ydbv2cq5iq4tk7t--

