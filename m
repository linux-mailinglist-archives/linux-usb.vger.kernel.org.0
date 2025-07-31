Return-Path: <linux-usb+bounces-26287-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 588F6B16F0C
	for <lists+linux-usb@lfdr.de>; Thu, 31 Jul 2025 11:57:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EAAC67B12A0
	for <lists+linux-usb@lfdr.de>; Thu, 31 Jul 2025 09:55:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F22F2BD5A7;
	Thu, 31 Jul 2025 09:57:04 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from verain.settrans.net (verain.settrans.net [93.93.131.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F5C1F4616
	for <linux-usb@vger.kernel.org>; Thu, 31 Jul 2025 09:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.93.131.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753955823; cv=none; b=GrLc7Qu0jiCLmE+L5nKAqbWefht/7L4LPMzEnhvZyGoIWyJjF19RoV0EikBMFPTRD7Gf3siqDS4VEANH8wW99UK9OTWyqX/oAJE9JY8O+gGnJbA/m6za3s6BdM1qGfNmlJsJuhEKh6Jyltyb1kkoxPOkTjrwDqGU5tpnclGod/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753955823; c=relaxed/simple;
	bh=faIcxLZ5Pp5MB9Vxc9x8ecetPSh1AwE2qEIuSOPfCmA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=Z7efQK6MESl6zvaX9p16BQ0w267XD1EnjtwXVXpaM/u55mgVdpLHSYk3RAmsY/7s2uWFZeoKgYaESfrbhjkEd7n3kycw/zChqmWGMaIVpDyk2BRMNkVj3HnD8vQZQCX4af6i/Npetx0X+48DHPosiwJAjw8L1AzKsFQzNE4EqAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=settrans.net; spf=pass smtp.mailfrom=settrans.net; arc=none smtp.client-ip=93.93.131.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=settrans.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=settrans.net
Received: from [193.187.128.66] (helo=[172.24.1.6])
	by verain.settrans.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94)
	(envelope-from <rah@settrans.net>)
	id 1uhQ1y-0005H8-R5; Thu, 31 Jul 2025 10:56:58 +0100
Message-ID: <a574ccc8-18ac-4575-a851-38d2737d7e3e@settrans.net>
Date: Thu, 31 Jul 2025 10:56:52 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Audio interface causing "xhci_hcd ... WARN: buffer overrun event"
 messages
To: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
References: <ba0ebd17-dade-4a97-b696-5ad19ebfca1d@settrans.net>
 <20250731101720.5d10a8f1@foxbook>
Content-Language: en-GB
From: Robert Ham <rah@settrans.net>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20250731101720.5d10a8f1@foxbook>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------rytcVGmc3KIyfcZUC3xz9MUV"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------rytcVGmc3KIyfcZUC3xz9MUV
Content-Type: multipart/mixed; boundary="------------vgVac494Fm2E03RYatW50ER4";
 protected-headers="v1"
From: Robert Ham <rah@settrans.net>
To: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org
Message-ID: <a574ccc8-18ac-4575-a851-38d2737d7e3e@settrans.net>
Subject: Re: Audio interface causing "xhci_hcd ... WARN: buffer overrun event"
 messages
References: <ba0ebd17-dade-4a97-b696-5ad19ebfca1d@settrans.net>
 <20250731101720.5d10a8f1@foxbook>
In-Reply-To: <20250731101720.5d10a8f1@foxbook>

--------------vgVac494Fm2E03RYatW50ER4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Micha=C5=82,

On 31/07/2025 09:17, Micha=C5=82 Pecio wrote:
> Hi,
>=20
> The 6.12 kernel series is half year old, so this may be unique to your
> hardware. Can you try other (ideally similar) UAC devices in the same
> USB port, or this device with different xHCI (or EHCI) controllers?

I feel I should provide some background.  I've been trying to get this
device working a while.  I've tried it in various machines with various
kernel versions and a number of device firmware revisions as well.  The
buffer overrun errors have appeared in different places, I don't think
it's specific to this machine's controller.  Regardless, I'll do your
suggested tests to make certain and get back to you.

Also, there are other problems with both the kernel and the device that
I've had to work around to get to the point of the buffer overruns in
the current setup.  Firstly, I needed to add a hack to snd-usb-audio to
stop it worrying about >32 channels in a feature unit descriptor.  As I
understand it though, this is a kernel issue; >32 channels is allowed.
(Patch should be forthcoming.)

Secondly, the device seems to stop responding to a SET_INTERFACE request
when snd-usb-audio sends a bunch of those requests during initialisation
so I made it send just the last request and the device seems to be OK
with that, or at least doesn't stop responding.  However, I wouldn't be
surprised if it's doing silly, spec-violating things in other places
too.  The manufacturer has explicitly and comically stated: "Because the
16Rig is working on Mac without any driver, it means that it is class
compliant."
--
https://forum.arturia.com/t/is-audiofuse-16rig-usb-audio-class-compliant/=
2153/3


> Can you mount debugfs and see if you can find the directory below? It
> would tell if there is anything unusual about those 1 in 65 buffers.
>=20
> /sys/kernel/debug/usb/xhci/0000:00:14.0/

/sys/kernel/debug/usb/xhci/0000:00:14.0/
/sys/kernel/debug/usb/xhci/0000:00:14.0/ports
/sys/kernel/debug/usb/xhci/0000:00:14.0/ports/port01
/sys/kernel/debug/usb/xhci/0000:00:14.0/ports/port01/portsc
/sys/kernel/debug/usb/xhci/0000:00:14.0/ports/port02
/sys/kernel/debug/usb/xhci/0000:00:14.0/ports/port02/portsc
/sys/kernel/debug/usb/xhci/0000:00:14.0/ports/port03
/sys/kernel/debug/usb/xhci/0000:00:14.0/ports/port03/portsc
/sys/kernel/debug/usb/xhci/0000:00:14.0/ports/port04
/sys/kernel/debug/usb/xhci/0000:00:14.0/ports/port04/portsc
/sys/kernel/debug/usb/xhci/0000:00:14.0/ports/port05
/sys/kernel/debug/usb/xhci/0000:00:14.0/ports/port05/portsc
/sys/kernel/debug/usb/xhci/0000:00:14.0/ports/port06
/sys/kernel/debug/usb/xhci/0000:00:14.0/ports/port06/portsc
/sys/kernel/debug/usb/xhci/0000:00:14.0/ports/port07
/sys/kernel/debug/usb/xhci/0000:00:14.0/ports/port07/portsc
/sys/kernel/debug/usb/xhci/0000:00:14.0/ports/port08
/sys/kernel/debug/usb/xhci/0000:00:14.0/ports/port08/portsc
/sys/kernel/debug/usb/xhci/0000:00:14.0/ports/port09
/sys/kernel/debug/usb/xhci/0000:00:14.0/ports/port09/portsc
/sys/kernel/debug/usb/xhci/0000:00:14.0/ports/port10
/sys/kernel/debug/usb/xhci/0000:00:14.0/ports/port10/portsc
/sys/kernel/debug/usb/xhci/0000:00:14.0/ports/port11
/sys/kernel/debug/usb/xhci/0000:00:14.0/ports/port11/portsc
/sys/kernel/debug/usb/xhci/0000:00:14.0/ports/port12
/sys/kernel/debug/usb/xhci/0000:00:14.0/ports/port12/portsc
/sys/kernel/debug/usb/xhci/0000:00:14.0/ports/port13
/sys/kernel/debug/usb/xhci/0000:00:14.0/ports/port13/portsc
/sys/kernel/debug/usb/xhci/0000:00:14.0/ports/port14
/sys/kernel/debug/usb/xhci/0000:00:14.0/ports/port14/portsc
/sys/kernel/debug/usb/xhci/0000:00:14.0/ports/port15
/sys/kernel/debug/usb/xhci/0000:00:14.0/ports/port15/portsc
/sys/kernel/debug/usb/xhci/0000:00:14.0/ports/port16
/sys/kernel/debug/usb/xhci/0000:00:14.0/ports/port16/portsc
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/01
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/01/ep06
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/01/ep06/trbs
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/01/ep06/cycle
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/01/ep06/dequeue
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/01/ep06/enqueue
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/01/ep05
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/01/ep05/trbs
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/01/ep05/cycle
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/01/ep05/dequeue
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/01/ep05/enqueue
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/01/ep04
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/01/ep04/trbs
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/01/ep04/cycle
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/01/ep04/dequeue
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/01/ep04/enqueue
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/01/ep03
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/01/ep03/trbs
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/01/ep03/cycle
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/01/ep03/dequeue
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/01/ep03/enqueue
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/01/ep02
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/01/ep02/trbs
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/01/ep02/cycle
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/01/ep02/dequeue
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/01/ep02/enqueue
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/01/ep-context
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/01/slot-context
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/01/name
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/01/ep00
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/01/ep00/trbs
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/01/ep00/cycle
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/01/ep00/dequeue
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/01/ep00/enqueue
/sys/kernel/debug/usb/xhci/0000:00:14.0/event-ring
/sys/kernel/debug/usb/xhci/0000:00:14.0/event-ring/trbs
/sys/kernel/debug/usb/xhci/0000:00:14.0/event-ring/cycle
/sys/kernel/debug/usb/xhci/0000:00:14.0/event-ring/dequeue
/sys/kernel/debug/usb/xhci/0000:00:14.0/event-ring/enqueue
/sys/kernel/debug/usb/xhci/0000:00:14.0/command-ring
/sys/kernel/debug/usb/xhci/0000:00:14.0/command-ring/trbs
/sys/kernel/debug/usb/xhci/0000:00:14.0/command-ring/cycle
/sys/kernel/debug/usb/xhci/0000:00:14.0/command-ring/dequeue
/sys/kernel/debug/usb/xhci/0000:00:14.0/command-ring/enqueue
/sys/kernel/debug/usb/xhci/0000:00:14.0/reg-ext-dbc:00
/sys/kernel/debug/usb/xhci/0000:00:14.0/reg-ext-protocol:01
/sys/kernel/debug/usb/xhci/0000:00:14.0/reg-ext-protocol:00
/sys/kernel/debug/usb/xhci/0000:00:14.0/reg-ext-legsup:00
/sys/kernel/debug/usb/xhci/0000:00:14.0/reg-runtime
/sys/kernel/debug/usb/xhci/0000:00:14.0/reg-op
/sys/kernel/debug/usb/xhci/0000:00:14.0/reg-cap


--------------vgVac494Fm2E03RYatW50ER4--

--------------rytcVGmc3KIyfcZUC3xz9MUV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

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
=n7hQ
-----END PGP SIGNATURE-----

--------------rytcVGmc3KIyfcZUC3xz9MUV--

