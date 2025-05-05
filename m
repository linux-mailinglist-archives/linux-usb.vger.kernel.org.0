Return-Path: <linux-usb+bounces-23714-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 674AEAA9207
	for <lists+linux-usb@lfdr.de>; Mon,  5 May 2025 13:27:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 768DB7A5A12
	for <lists+linux-usb@lfdr.de>; Mon,  5 May 2025 11:26:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC6E8201116;
	Mon,  5 May 2025 11:27:35 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5357D54BC6
	for <linux-usb@vger.kernel.org>; Mon,  5 May 2025 11:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746444455; cv=none; b=JIVM8EXDOvgtw5uWG98awhcswf5FHTAns/vGW8lGO86LrV5Uu/kS4LvwXNXTo2nQKl8ZxzGm7KMgR9F1pp+ke80UP+gcgBw2JRXNBRohnN0PhYsC4lzf6li+966Eqa1FVL41kqltaimipOBa6MKY5INOF51/T4SLPflnIufTbsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746444455; c=relaxed/simple;
	bh=vZuL3aJRbyiBEKgDNxk2HKax15pVglcOWJoqIvQ4TF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e6aK+ZdAYyrpD25QNGeTqdy6GcbQemZt6o+dtFOj43qO9EBG29JIsYGPL1kSwlf0OR3ZcwZhhzSntL9IZUVr7j8becVIqkhNcNj5gu6HUQuHVrvmpdkyN83/Go3URLIgZ6PnADgzslzBpE52XedxfP/TpAM3JCeGRsR/aqT0Jfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mgr@pengutronix.de>)
	id 1uBtys-0006GN-Er; Mon, 05 May 2025 13:27:30 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mgr@pengutronix.de>)
	id 1uBtyr-001DlB-2w;
	Mon, 05 May 2025 13:27:29 +0200
Received: from mgr by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mgr@pengutronix.de>)
	id 1uBtyr-004bZx-2W;
	Mon, 05 May 2025 13:27:29 +0200
Date: Mon, 5 May 2025 13:27:29 +0200
From: Michael Grzeschik <mgr@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Badhri Jagan Sridharan <badhri@google.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: tcpm: detect orientation in debug acc mode
Message-ID: <aBigoRYPnQntXNel@pengutronix.de>
References: <20250505-tcpm-v1-1-e6142985a012@pengutronix.de>
 <2025050510-malformed-outweigh-3dbf@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f7OLstyxOb3eV55o"
Content-Disposition: inline
In-Reply-To: <2025050510-malformed-outweigh-3dbf@gregkh>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org


--f7OLstyxOb3eV55o
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 05, 2025 at 01:21:18PM +0200, Greg Kroah-Hartman wrote:
>On Mon, May 05, 2025 at 01:06:16PM +0200, Michael Grzeschik wrote:
>> For the debug accessory case, the orientation can be detected by reading
>> the cc resistor values. The will be TYPEC_CC_RP_DEF and TYPEC_CC_RP_1_5
>> in sink mode and TYPEC_CC_RA TYPEC_CC_RD in src mode.
>>
>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>
>What commit id does this fix?

This applies on 64843d0ba96 .

>thanks,
>
>greg k-h

Thanks,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--f7OLstyxOb3eV55o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmgYoJ8ACgkQC+njFXoe
LGT/yhAAn/lfD2Ia4pgaI/xdzQb6UixUsxYlm2yJJLS0x2v0YkuyLsjDNukkNXjO
vz5uCQVA3qOud/fGRZntPM47Zgrj7ob+TyhjxaQpHiyWM5Qd4ViPT8tESpjTokLB
bZJEA/2wAvHBoay6hbaVsujiiWehyGS+9/rV1SB2xWCgER3p3F/dW7pduDg2b9x5
6mwSCVGUiSNudm+v48TLNmz7puMwla3ejrpvV8TpSlxIHcuHYC/CMcEeL+MyLV9k
mAHmr1ogwiritArlMNAt7NvOQMZC2u5N02oXZmjq8C59idIJVdobk4inV+/YpbLt
EFm6aiYI4k8XPPAz1E2b/gd1NsG6SvxknAZonn1c4/Oboc59x6Gctn56Jb1ZkkW9
GTu03taSMA87WMpKPv8TF5nnv+5WyYvmPTWua0uvUEnbkRBoBukImv3f9gVEiPxk
87oyXvPPApgqiOLLObj7VI6M4IUmoqM66PLSyJYleAp7mFpIuh4LsmI094J0FSDy
xkL3j0AgRSVxz/Yoly8v63fHyR6on4hDPyUKum71jbFb1GxuSxABiVJWthTcwUF0
4Ta3HP/ZkpdOXXTaxr2fVPIrQhCWmqT+KSR63PcCgqJW5pHC79EB5pKiJeM6fQvT
YdAJal6CF8in1GM96nlla7j0X4kuNrvxkoly9FwQCsSU6TyX9SQ=
=Ps8S
-----END PGP SIGNATURE-----

--f7OLstyxOb3eV55o--

