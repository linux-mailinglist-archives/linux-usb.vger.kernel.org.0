Return-Path: <linux-usb+bounces-29117-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE6CBCD0FF
	for <lists+linux-usb@lfdr.de>; Fri, 10 Oct 2025 15:13:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9864A4FD9DD
	for <lists+linux-usb@lfdr.de>; Fri, 10 Oct 2025 13:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B93CC2F25FC;
	Fri, 10 Oct 2025 13:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="E2g8kBXT";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="joN0VFEm";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="E2g8kBXT";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="joN0VFEm"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816A22F1FEE
	for <linux-usb@vger.kernel.org>; Fri, 10 Oct 2025 13:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760101974; cv=none; b=CTECDt4vyNooH/cB0ls/arbgogT5ifgCSw/qAcqIh7SXAEE3O5P8utI9OTXRICN0zT1XZqUVmosC8k/kNKZkQN4n83yswJxgG9Ec8j75LYJSwkbgUPo5d9o5t2BhABXcXfeKpyj2UDlfINPQDKYE7rAU8MCkfzm0gK/xOJpsyWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760101974; c=relaxed/simple;
	bh=thDIwQPKzx9fbc30DRGYMpfVzy8jD45CwJUJgxHAfxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mRjk72Rf4j3av8VKyxyvARE/OI2ijMswMtvBuBmPmlPDNJ4Wnr7r4ACK2y930Zly2gpqPtHxHGx+FU7aYArh6rOAoR7YS9wYglmrSSWToqbcOJ3CCZ9SXFY4YG9xzOfCDBR94hkcxFy/WJ2lXYi3jkwdKucJkkzcib958g+uK24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=E2g8kBXT; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=joN0VFEm; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=E2g8kBXT; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=joN0VFEm; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from lion.mk-sys.cz (unknown [10.100.225.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 977F721D79;
	Fri, 10 Oct 2025 13:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1760101970; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/hCbWPqWo+R/FRwAYgFIxa5A+wslKskTgMXLQ9SVbI8=;
	b=E2g8kBXTQixATgtkj/ptTeANylxtjS83wY/u06HDHvY5cPIxrnp/cB6zECapB1NdZfdNs/
	iKAd+Pw0hZkvQ40t5FQ+nkUKaghjGnNlEo54XL4p0wUqPPisUibZphqVzbURrtcJmnBhV1
	9TYmcfflvpG4EBLQInqINsizc6yV29k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1760101970;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/hCbWPqWo+R/FRwAYgFIxa5A+wslKskTgMXLQ9SVbI8=;
	b=joN0VFEmk0yE3lA4tAO4uJn0NMAS2WPEpOCDa9kEpoUhC0eybqmxS5oLC5qK7QALh+rBQ/
	EBB+NpFJV7/c3cBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1760101970; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/hCbWPqWo+R/FRwAYgFIxa5A+wslKskTgMXLQ9SVbI8=;
	b=E2g8kBXTQixATgtkj/ptTeANylxtjS83wY/u06HDHvY5cPIxrnp/cB6zECapB1NdZfdNs/
	iKAd+Pw0hZkvQ40t5FQ+nkUKaghjGnNlEo54XL4p0wUqPPisUibZphqVzbURrtcJmnBhV1
	9TYmcfflvpG4EBLQInqINsizc6yV29k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1760101970;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/hCbWPqWo+R/FRwAYgFIxa5A+wslKskTgMXLQ9SVbI8=;
	b=joN0VFEmk0yE3lA4tAO4uJn0NMAS2WPEpOCDa9kEpoUhC0eybqmxS5oLC5qK7QALh+rBQ/
	EBB+NpFJV7/c3cBg==
Received: by lion.mk-sys.cz (Postfix, from userid 1000)
	id 66DFE20057; Fri, 10 Oct 2025 15:12:50 +0200 (CEST)
Date: Fri, 10 Oct 2025 15:12:50 +0200
From: Michal Kubecek <mkubecek@suse.cz>
To: Niklas Neronin <niklas.neronin@linux.intel.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org, 
	Nick Nielsen <nick.kainielsen@free.fr>, grm1 <grm1@mailbox.org>
Subject: Regression - commit 719de070f764 usb: xhci-pci: add support for
 hosts with zero USB3 ports
Message-ID: <lnb5bum7dnzkn3fc7gq6hwigslebo7o4ccflcvsc3lvdgnu7el@fvqpobbdoapl>
References: <20250826100416.207129-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="h6a6pclkwlvmqx4v"
Content-Disposition: inline
In-Reply-To: <20250826100416.207129-1-niklas.neronin@linux.intel.com>
X-Spam-Level: 
X-Spamd-Result: default: False [-5.90 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	FREEMAIL_ENVRCPT(0.00)[free.fr];
	ARC_NA(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,vger.kernel.org,free.fr,mailbox.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Spam-Flag: NO
X-Spam-Score: -5.90


--h6a6pclkwlvmqx4v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 26, 2025 at 12:04:16PM GMT, Niklas Neronin wrote:
> Add xhci support for PCI hosts that have zero USB3 ports.
> Avoid creating a shared Host Controller Driver (HCD) when there is only
> one root hub. Additionally, all references to 'xhci->shared_hcd' are now
> checked before use.
>=20
> Only xhci-pci.c requires modification to accommodate this change, as the
> xhci core already supports configurations with zero USB3 ports. This
> capability was introduced when xHCI Platform and MediaTek added support
> for zero USB3 ports.
>=20
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D220181
> Tested-by: Nick Nielsen <nick.kainielsen@free.fr>
> Tested-by: grm1 <grm1@mailbox.org>
> Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>

Hello,

while testing 6.18 merge window snapshots, I hit an issue which bisected
to this patch, mainline commit 719de070f764 ("usb: xhci-pci: add support
for hosts with zero USB3 ports").

When booting any kernel with it, my keyboard attached to USB port
intended for it does not respond. Comparing the logs between "good" and
"bad" kernel boot, it looks like hubs 9 and 10 are not detected at all
when booting a kernel with commit 719de070f764.

This is what the topology looks like when booting "good" kernel (v6.17):

lion:~ # lsusb -t
/:  Bus 10.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/0p, 5000M
/:  Bus 09.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/1p, 480M
    |__ Port 1: Dev 2, If 0, Class=3DHub, Driver=3Dhub/4p, 480M
        |__ Port 1: Dev 3, If 0, Class=3DHuman Interface Device, Driver=3Du=
sbhid, 12M
        |__ Port 1: Dev 3, If 1, Class=3DHuman Interface Device, Driver=3Du=
sbhid, 12M
        |__ Port 1: Dev 3, If 2, Class=3DHuman Interface Device, Driver=3Du=
sbhid, 12M
        |__ Port 3: Dev 4, If 0, Class=3DHuman Interface Device, Driver=3Du=
sbhid, 12M
        |__ Port 3: Dev 4, If 1, Class=3DHuman Interface Device, Driver=3Du=
sbhid, 12M
        |__ Port 3: Dev 4, If 2, Class=3DHuman Interface Device, Driver=3Du=
sbhid, 12M
/:  Bus 08.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/2p, 10000M
    |__ Port 2: Dev 2, If 0, Class=3DHub, Driver=3Dhub/4p, 5000M
/:  Bus 07.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/2p, 480M
    |__ Port 2: Dev 2, If 0, Class=3DHub, Driver=3Dhub/4p, 480M
        |__ Port 2: Dev 3, If 0, Class=3DHuman Interface Device, Driver=3Du=
sbhid, 12M
        |__ Port 4: Dev 4, If 0, Class=3DAudio, Driver=3Dsnd-usb-audio, 12M
        |__ Port 4: Dev 4, If 1, Class=3DAudio, Driver=3Dsnd-usb-audio, 12M
        |__ Port 4: Dev 4, If 2, Class=3DAudio, Driver=3Dsnd-usb-audio, 12M
        |__ Port 4: Dev 4, If 3, Class=3DHuman Interface Device, Driver=3Du=
sbhid, 12M
/:  Bus 06.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/2p, 10000M
/:  Bus 05.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/2p, 480M
/:  Bus 04.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/2p, 20000M/x2
/:  Bus 03.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/2p, 480M
/:  Bus 02.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/5p, 20000M/x2
    |__ Port 3: Dev 2, If 0, Class=3DHub, Driver=3Dhub/4p, 5000M
        |__ Port 4: Dev 3, If 0, Class=3DHub, Driver=3Dhub/4p, 5000M
/:  Bus 01.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/12p, 480M
    |__ Port 2: Dev 2, If 0, Class=3DVideo, Driver=3Duvcvideo, 480M
    |__ Port 2: Dev 2, If 1, Class=3DVideo, Driver=3Duvcvideo, 480M
    |__ Port 2: Dev 2, If 2, Class=3DAudio, Driver=3Dsnd-usb-audio, 480M
    |__ Port 2: Dev 2, If 3, Class=3DAudio, Driver=3Dsnd-usb-audio, 480M
    |__ Port 2: Dev 2, If 4, Class=3DVendor Specific Class, Driver=3D, 480M
    |__ Port 2: Dev 2, If 5, Class=3DHuman Interface Device, Driver=3Dusbhi=
d, 480M
    |__ Port 3: Dev 3, If 0, Class=3DHub, Driver=3Dhub/4p, 480M
        |__ Port 4: Dev 5, If 0, Class=3DHub, Driver=3Dhub/4p, 480M
            |__ Port 2: Dev 6, If 0, Class=3DHuman Interface Device, Driver=
=3Dusbhid, 12M
            |__ Port 2: Dev 6, If 1, Class=3DChip/SmartCard, Driver=3Dusbfs=
, 12M
    |__ Port 6: Dev 4, If 0, Class=3DHuman Interface Device, Driver=3Dusbhi=
d, 12M
    |__ Port 6: Dev 4, If 1, Class=3DHuman Interface Device, Driver=3Dusbhi=
d, 12M
    |__ Port 8: Dev 7, If 0, Class=3DHuman Interface Device, Driver=3Dusbhi=
d, 1.5M

lion:~ # lsusb
Bus 009 Device 004: ID 0951:16b7 Kingston Technology HyperX Alloy FPS Mecha=
nical Gaming Keyboard
Bus 009 Device 003: ID 1532:00b2 Razer USA, Ltd Razer DeathAdder V3
Bus 009 Device 002: ID 05e3:0608 Genesys Logic, Inc. Hub
Bus 009 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 010 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 008 Device 002: ID 0bda:0411 Realtek Semiconductor Corp. Hub
Bus 008 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 007 Device 004: ID 1532:0511 Razer USA, Ltd RZ19-0229 Gaming Microphone
Bus 007 Device 003: ID 051d:0002 American Power Conversion Uninterruptible =
Power Supply
Bus 007 Device 002: ID 0bda:5411 Realtek Semiconductor Corp. RTS5411 Hub
Bus 007 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 006 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 005 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 003: ID 0bda:0411 Realtek Semiconductor Corp. Hub
Bus 002 Device 002: ID 0bda:0411 Realtek Semiconductor Corp. Hub
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 001 Device 007: ID 04f2:0110 Chicony Electronics Co., Ltd KU-2971 Keybo=
ard
Bus 001 Device 004: ID 048d:5711 Integrated Technology Express, Inc. GIGABY=
TE Device=20
Bus 001 Device 006: ID 1050:0406 Yubico.com Yubikey 4/5 U2F+CCID
Bus 001 Device 005: ID 0bda:5411 Realtek Semiconductor Corp. RTS5411 Hub
Bus 001 Device 003: ID 0bda:5411 Realtek Semiconductor Corp. RTS5411 Hub
Bus 001 Device 002: ID 046d:0893 Logitech, Inc. StreamCam
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub

Please tell me if you need more information.

Michal Kubecek

--h6a6pclkwlvmqx4v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEWN3j3bieVmp26mKO538sG/LRdpUFAmjpBk0ACgkQ538sG/LR
dpVYqgf/bZ+oZ3XcOaapRtgri9SmKdC8qbpVdpKrYLU34yM4ZVQ12LDi7GdKJv5o
hlKbjJa/TaMhtwyoIq93Wfw1HkSjz8wSFMDQHdfViIUe2w6N3yVs5M4oiaKPhrhd
7+/dLWZNUJxQMRoIxBNV9i4TUjkncevjgF3Sm9izCoLOpl+t6d9yPhYV6dT53Ge+
cZRHN3dmtkRp1a2QRcIljasHC7J88ClusKYc5biVQjBJbiZl/Pig/y87BI5xHFsA
18jeBsxPn1Ks1F0x8oqU8BRl8CflFpDLMmy9KsWx1J2WcV8wPJ0xJdUd71hFEm50
6F7Jf2yH/SoeB7myyQrhGhmIOJgJOw==
=DUEv
-----END PGP SIGNATURE-----

--h6a6pclkwlvmqx4v--

