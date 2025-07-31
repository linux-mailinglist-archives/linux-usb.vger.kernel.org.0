Return-Path: <linux-usb+bounces-26288-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E8CB16F28
	for <lists+linux-usb@lfdr.de>; Thu, 31 Jul 2025 12:04:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 684A73BBDD2
	for <lists+linux-usb@lfdr.de>; Thu, 31 Jul 2025 10:04:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FEB029DB61;
	Thu, 31 Jul 2025 10:04:50 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from verain.settrans.net (verain.settrans.net [93.93.131.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC432745E
	for <linux-usb@vger.kernel.org>; Thu, 31 Jul 2025 10:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.93.131.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753956290; cv=none; b=eoe+4wHo5TUX0BpafqJ9xzhDV4yA81P78h/yQ2se3thRonyyoBs6+fupTundTspAJJw40zGGE6Z/ZunXicGYsZF2yKoVClTc6SwxToqIK12gKIoC59CTl9rot1VEcfrbRO4V6rasFa+QcvJgYMk4XBvbxsqtiz6SvbcCFpulrro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753956290; c=relaxed/simple;
	bh=JlGNtUoCGFPI+S15vh4cegsI5oW098/RY4rr2bkksww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i1ZKNw0bGqVRDh44kBi3DzrdWGRZfeILyOXLSLBHt6uavzjb5pCFZWJCBahwyJ4ZrCcOsCtTg60lZv9p8ZeEzUUp9PPsCZXAiR6WUtAUwUp9aI4zzitf2ikerZjCfgM+iDn4Idu/febpNtmHxGnowqz/f1Zo37YegsuQaU3Jx5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=settrans.net; spf=pass smtp.mailfrom=settrans.net; arc=none smtp.client-ip=93.93.131.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=settrans.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=settrans.net
Received: from [193.187.128.66] (helo=[172.24.1.6])
	by verain.settrans.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94)
	(envelope-from <rah@settrans.net>)
	id 1uhQ9W-0005aN-4C; Thu, 31 Jul 2025 11:04:46 +0100
Message-ID: <87114caf-7c0d-4e51-bb3e-f171fc20ac62@settrans.net>
Date: Thu, 31 Jul 2025 11:04:40 +0100
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
Cc: linux-usb@vger.kernel.org
References: <ba0ebd17-dade-4a97-b696-5ad19ebfca1d@settrans.net>
 <20250731101720.5d10a8f1@foxbook>
Content-Language: en-GB
From: Robert Ham <rah@settrans.net>
In-Reply-To: <20250731101720.5d10a8f1@foxbook>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------WqRAss5FsHpmNkKCyXkFPFjC"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------WqRAss5FsHpmNkKCyXkFPFjC
Content-Type: multipart/mixed; boundary="------------YXH9ezu5H61401wV2Mo07rc7";
 protected-headers="v1"
From: Robert Ham <rah@settrans.net>
To: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org
Message-ID: <87114caf-7c0d-4e51-bb3e-f171fc20ac62@settrans.net>
Subject: Re: Audio interface causing "xhci_hcd ... WARN: buffer overrun event"
 messages
References: <ba0ebd17-dade-4a97-b696-5ad19ebfca1d@settrans.net>
 <20250731101720.5d10a8f1@foxbook>
In-Reply-To: <20250731101720.5d10a8f1@foxbook>

--------------YXH9ezu5H61401wV2Mo07rc7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 31/07/2025 09:17, Micha=C5=82 Pecio wrote:
> Can you mount debugfs and see if you can find the directory below? It
> would tell if there is anything unusual about those 1 in 65 buffers.
>=20
> /sys/kernel/debug/usb/xhci/0000:00:14.0/

Umm.. and this is with the device connected and snd-usb-audio loaded,
which might be more helpful :-)

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
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/04
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/04/ep03
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/04/ep03/trbs
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/04/ep03/cycle
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/04/ep03/dequeue
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/04/ep03/enqueue
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/04/ep02
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/04/ep02/trbs
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/04/ep02/cycle
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/04/ep02/dequeue
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/04/ep02/enqueue
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/04/ep-context
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/04/slot-context
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/04/name
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/04/ep00
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/04/ep00/trbs
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/04/ep00/cycle
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/04/ep00/dequeue
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/04/ep00/enqueue
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/03
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/03/ep04
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/03/ep04/trbs
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/03/ep04/cycle
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/03/ep04/dequeue
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/03/ep04/enqueue
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/03/ep-context
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/03/slot-context
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/03/name
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/03/ep00
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/03/ep00/trbs
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/03/ep00/cycle
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/03/ep00/dequeue
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/03/ep00/enqueue
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/02
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/02/ep02
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/02/ep02/trbs
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/02/ep02/cycle
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/02/ep02/dequeue
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/02/ep02/enqueue
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/02/ep-context
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/02/slot-context
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/02/name
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/02/ep00
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/02/ep00/trbs
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/02/ep00/cycle
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/02/ep00/dequeue
/sys/kernel/debug/usb/xhci/0000:00:14.0/devices/02/ep00/enqueue
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

--------------YXH9ezu5H61401wV2Mo07rc7--

--------------WqRAss5FsHpmNkKCyXkFPFjC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

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
=fE7y
-----END PGP SIGNATURE-----

--------------WqRAss5FsHpmNkKCyXkFPFjC--

