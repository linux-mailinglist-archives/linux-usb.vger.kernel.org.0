Return-Path: <linux-usb+bounces-29996-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0378DC2AB57
	for <lists+linux-usb@lfdr.de>; Mon, 03 Nov 2025 10:22:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA4D2188F46C
	for <lists+linux-usb@lfdr.de>; Mon,  3 Nov 2025 09:22:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DD2E2E8B6F;
	Mon,  3 Nov 2025 09:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tty42.de header.i=@tty42.de header.b="aCZNiUh1";
	dkim=permerror (0-bit key) header.d=tty42.de header.i=@tty42.de header.b="Q4beqihc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail.tty42.de (mail.tty42.de [94.130.190.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92159EEB3
	for <linux-usb@vger.kernel.org>; Mon,  3 Nov 2025 09:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.130.190.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762161701; cv=pass; b=BrwtnMrhTuRHSQmWiOldqcfbOLXnUJPFYY7CaEpOypmaniZjDMDd3DdsMYSWRNhFs63J4aDFB5wer0ac2CtaudYhnktEgeQpzncFqJZ7EZio5rwKgd3vFoX+rEVuiBVY+9HXo7tmKe6sWCyTGc723ln3DeqHvMJ8IenqJXsagmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762161701; c=relaxed/simple;
	bh=k50tl9LCj8ukXe/Mi0zfkN5xj3hGKrzKi8RU7wv+ok4=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mh6J4LZlvzM6Uh3QrpoIXGJg5fK5ToDXLAWk0a6+DEq+7u/kyrQ8od8/DnVL1due8NGcKX65EpD+QBkc/71zriKAwimCXzq362gzWXtJfrWoU+sebo7KU2hyL2wMjlwnVyvav2VXI+18JNNIoLipe4N/Q50aVoUmETsU+K3kcFc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tty42.de; spf=pass smtp.mailfrom=tty42.de; dkim=pass (2048-bit key) header.d=tty42.de header.i=@tty42.de header.b=aCZNiUh1; dkim=permerror (0-bit key) header.d=tty42.de header.i=@tty42.de header.b=Q4beqihc; arc=pass smtp.client-ip=94.130.190.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tty42.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tty42.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tty42.de; s=rsa;
	t=1762160093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4hutm/kOtcJCg7TzpuC5eP8RDPFrRGI5oWszE1YzPEo=;
	b=aCZNiUh1pWBjGCn0KK5NId3at3xAy7kr/MlUoNTLFUZllV3XotvWIOcl1s4+sebs+yitP/
	47fwSVbIK6S5ndMAptjTDK4druNVi3kpS3pmc3NjBiDmJ8i34dFJ4E4ScEN5AMc73m4Ohn
	o8FolzJiS0Nr5z5aZl5uk10O3QlSTmJzLaFcYohSsmHb4WpjyAqNBdc4MMYfZ7hiTX/no+
	TOGFAJ4ckQZvfYL/Dp23ieQkkfP8b7vg21BMXwtF4C4monferFSmX99yBHaJbKcbDu/WOk
	HxnY5zHpXNbFv7Gno1r72LhwpDBaj78Rt+RBdfZLsKeaO9odAz/S6VTVkYrnXw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=tty42.de;
	s=dkim; t=1762160093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4hutm/kOtcJCg7TzpuC5eP8RDPFrRGI5oWszE1YzPEo=;
	b=Q4beqihcGdLWWGPYr74y+hcdXcMl09ooH4Y1XZ6wD63wUxmPyyHvnzK0QFPhNMkf/hsTUl
	N/VN5aqy1W9glUCA==
ARC-Seal: i=1; s=rsa; d=tty42.de; t=1762160093; a=rsa-sha256; cv=none;
	b=nZrd1svpTZGHrOeRhk4a7UXw34mvldPbFQch33hFRTV6v6xBz4mOQ12SbIlLoK7IajXeRf
	8Xe7dd92t9FTvDdErKZou0YdR+Q/o0QQV1/7zvrEyVyaZnHAaM/0+QvoJYqlIKgq5OXk+k
	wiwWLzZW+1JmKETE1zCnQBHoTyDOoCaI7/nxLmoVqPUuq/zOwg4ybRNwum34VTwTDFlMz/
	aXfwoZC7Pb5j/vrBEetv9mi7z0L9fCn3b/tKfJdg/pj5p58fjQMh35B5Y8IDAXYNV96Vdx
	1j2PWkpA8C1HFnUVAvo15ZoH65+tHeLqjjbFAGlPJWY5RU6/7lgqxkXbSGhieQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=tty42.de;
	s=rsa; t=1762160093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4hutm/kOtcJCg7TzpuC5eP8RDPFrRGI5oWszE1YzPEo=;
	b=FEHDu7Jx3d6OjiOyuuFBOrbANRFQbOZsaG1JtICNjfLQ2MU6wp7NC0gtTRNeiPSnber3fa
	NwxQufZl7G0wTVAxciCDg7+aM/JUG4209465a9bQlp0dEIDDBebsEzDJNv7lifo8woD74H
	05XwV/COzd3IZaV4iR3kNei/KkLA8LU7sCsLBUZA0Q3usBxRBxa6269BtU0yXNUtA5dc/5
	A++rKAtqbOIXs/lmyOlPiR59UuzUQJ2uXv2qhRm2Ob+Kf9jrAMa9+hAl05dW2QuiFepZvH
	UY9rAtr5zmmIvL+ApEApoKTnXZ3qk93sSGf13aQamVg5plUux4cakb9NbtmS2g==
ARC-Authentication-Results: i=1;
	mail.tty42.de;
	auth=pass smtp.auth=frederik@tty42.de smtp.mailfrom=lists@tty42.de
Received: 
	by mail.tty42.de (OpenSMTPD) with ESMTPSA id 25c5bae4 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Mon, 3 Nov 2025 08:54:53 +0000 (UTC)
Date: Mon, 3 Nov 2025 09:54:50 +0100
From: Frederik Schwan <lists@tty42.de>
To: linux-usb@vger.kernel.org, Andreas Noever <andreas.noever@gmail.com>, 
	Michael Jamet <michael.jamet@intel.com>, Mika Westerberg <westeri@kernel.org>, 
	Yehezkel Bernat <YehezkelShB@gmail.com>, Imre Deak <imre.deak@intel.com>
Subject: Re: TB 5 Dock DP-Out non-functional
Message-ID: <rnp5dzfud5feidxi2qx63cxezukyszuzpj7v5f5gyoqtys3uff@e72nlrudjzxb>
Mail-Followup-To: linux-usb@vger.kernel.org, 
	Andreas Noever <andreas.noever@gmail.com>, Michael Jamet <michael.jamet@intel.com>, 
	Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat <YehezkelShB@gmail.com>, 
	Imre Deak <imre.deak@intel.com>
References: <q7k73t5utfjrpuf45ynig72eojpixepjqccvsfaqt6rg4wptst@se6ekc2eg3sv>
 <20251103055659.GD2912318@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a3lwmf7g4v7vvfk2"
Content-Disposition: inline
In-Reply-To: <20251103055659.GD2912318@black.igk.intel.com>


--a3lwmf7g4v7vvfk2
Content-Type: multipart/mixed; protected-headers=v1;
	boundary="trwjxa2f3jbt3y4c"
Content-Disposition: inline
Subject: Re: TB 5 Dock DP-Out non-functional
MIME-Version: 1.0


--trwjxa2f3jbt3y4c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mika,

On Mon, Nov 03, 2025 at 06:56:59AM +0100, Mika Westerberg wrote:
> On Sun, Nov 02, 2025 at 04:39:07PM +0100, Frederik Schwan wrote:
>> Setup:
>> TB 5 Host (Lenovo P1 Gen8)
>>   -> TB 4 Dock (0108:2031 reports as "ThinkPad Thunderbolt 4 Dock")
>>     -> USB Devices, two 3840x2160, LAN attached
>>   -> TB 5 Dock (0108:234d reports as "ThinkPad Thunderbolt 5 Smart Dock =
7500 - 40BA")
>>     -> nothing but power supply
>=20
> You are saying that you have two docks connected like this:
>=20
>   Host -> TB 4 -> 2 Monitors
>     |
>     v
>    TB5 (nothing but power)
>    =20
> And with this the TB4 dock monitors don't work? But without the TB5 dock
> they work fine?
>=20
> It would be good to have simplest possible case where this reproduces then
> provide exact steps of that, like

Sorry for the bad report. As a Arch Linux bugwrangler I should've known how=
 to report this in
a non-confusing way :/

I added the TB4 Dock just to make sure that the only variable is the Dock (=
to rule out DP cable, monitor etc.).
So here comes a minimal setup:

To repro:
1. Boot (Kernel 6.17.7-arch1-1)
2. Connect TB5 Dock with power and 1 DP screen attached

Expected behavior: DP screen comes up and shows output
Actual outcome: DP screen blinks for 2-3 tries and goes off again

dmesg.log attached as well as the bandwidth script output.

Best regards,
Frederik

--trwjxa2f3jbt3y4c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="tb5.log"
Content-Transfer-Encoding: quoted-printable

[   47.066635] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): decreased ba=
ndwidth allocation to 900/900 Mb/s
[   47.067261] thunderbolt 0000:8a:00.0: 0:1: link maximum bandwidth 36000/=
108000 Mb/s
[   47.067399] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): consumed ban=
dwidth 3000/3000 Mb/s
[   47.067515] thunderbolt 0000:8a:00.0: 0:1: reserving 1500/1500 Mb/s for =
PCIe
[   47.067919] thunderbolt 0000:8a:00.0: 1:1: link maximum bandwidth 36000/=
108000 Mb/s
[   47.068029] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): consumed ban=
dwidth 3000/3000 Mb/s
[   47.068175] thunderbolt 0000:8a:00.0: 1:1: reserving 1500/1500 Mb/s for =
PCIe
[   47.068179] thunderbolt 0000:8a:00.0: 0:13 <-> 1:12 (DP): bandwidth avai=
lable for allocation 31500/103500 (+ 0 reserved) Mb/s
[   47.069864] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): reclaiming u=
nused bandwidth
[   47.069875] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   47.070178] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   47.070474] thunderbolt 0000:8a:00.0: 0:1: link maximum bandwidth 72000/=
72000 Mb/s
[   47.070406] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] got hpd i=
rq on [ENCODER:306:DDI TC3/PHY TC3] - short
[   47.070586] thunderbolt 0000:8a:00.0: 0:1: reserving 1500/1500 Mb/s for =
PCIe
[   47.071008] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   47.071374] thunderbolt 0000:8a:00.0: 0:13 <-> 1:12 (DP): consumed bandw=
idth 0/12500 Mb/s
[   47.071476] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   47.071496] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   47.071737] thunderbolt 0000:8a:00.0: 1:1: link maximum bandwidth 72000/=
72000 Mb/s
[   47.071882] thunderbolt 0000:8a:00.0: 1:1: reserving 1500/1500 Mb/s for =
PCIe
[   47.072040] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 12
[   47.072495] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   47.072650] thunderbolt 0000:8a:00.0: 0:13 <-> 1:12 (DP): consumed bandw=
idth 0/12500 Mb/s
[   47.072654] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): available ba=
ndwidth 70500/58000 Mb/s
[   47.072912] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 12
[   47.073351] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   47.073674] thunderbolt 0000:8a:00.0: 0:21: scaled bandwidth 3599/3599, =
scale 0
[   47.073773] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX <- (ret=3D  1) 03
[   47.073792] i915 0000:00:02.0: [drm:drm_dp_tunnel_alloc_bw [drm_display_=
helper]] [DPTUN 1:1:13][AUX USBC3/DDI TC3/PHY TC3] Allocating 12500/26000 M=
b/s for tunnel: Group alloc:12500/103500 Mb/s (Ok)
[   47.073825] i915 0000:00:02.0: [drm:intel_pmdemand_program_params [i915]=
] initiate pmdemand request values: (0x20010b1 0x13432a72)
[   47.074191] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   47.074104] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:261:DDI A/PHY A]
[   47.074207] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 00
[   47.074318] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): increased ba=
ndwidth allocation to 14738/14738 Mb/s
[   47.074322] thunderbolt 0000:8a:00.0: 0:13 <-> 1:12 (DP): bandwidth allo=
cation changed to 0/12500 Mb/s
[   47.074326] thunderbolt 0000:8a:00.0: bandwidth consumption changed, re-=
calculating estimated bandwidth
[   47.074328] thunderbolt 0000:8a:00.0: re-calculating bandwidth estimatio=
n for group 1
[   47.074306] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:270:DDI B/PHY B]
[   47.074500] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:272:DP-MST A]
[   47.074690] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:273:DP-MST B]
[   47.074881] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:274:DP-MST C]
[   47.075110] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:275:DP-MST D]
[   47.075214] thunderbolt 0000:8a:00.0: 0:21: scaled bandwidth 220/220, sc=
ale 0
[   47.075304] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:288:DDI TC1/PHY TC1]
[   47.075496] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:290:DP-MST A]
[   47.075687] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:291:DP-MST B]
[   47.075853] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): decreased ba=
ndwidth allocation to 900/900 Mb/s
[   47.075880] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:292:DP-MST C]
[   47.076076] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:293:DP-MST D]
[   47.076268] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:297:DDI TC2/PHY TC2]
[   47.076474] thunderbolt 0000:8a:00.0: 0:1: link maximum bandwidth 36000/=
108000 Mb/s
[   47.076460] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:299:DP-MST A]
[   47.076619] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): consumed ban=
dwidth 3000/3000 Mb/s
[   47.076730] thunderbolt 0000:8a:00.0: 0:1: reserving 1500/1500 Mb/s for =
PCIe
[   47.076652] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:300:DP-MST B]
[   47.076843] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:301:DP-MST C]
[   47.077038] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:302:DP-MST D]
[   47.077138] thunderbolt 0000:8a:00.0: 1:1: link maximum bandwidth 36000/=
108000 Mb/s
[   47.077249] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): consumed ban=
dwidth 3000/3000 Mb/s
[   47.077229] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:306:DDI TC3/PHY TC3]
[   47.077420] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:308:DP-MST A]
[   47.077619] thunderbolt 0000:8a:00.0: 1:1: reserving 1500/1500 Mb/s for =
PCIe
[   47.077624] thunderbolt 0000:8a:00.0: 0:13 <-> 1:12 (DP): re-calculated =
estimated bandwidth 103500 (+ 0 reserved) =3D 103500 Mb/s
[   47.077610] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:309:DP-MST B]
[   47.077800] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:310:DP-MST C]
[   47.077989] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:311:DP-MST D]
[   47.078265] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): reclaiming u=
nused bandwidth
[   47.078180] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:315:DDI TC4/PHY TC4]
[   47.078373] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:317:DP-MST A]
[   47.078563] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:318:DP-MST B]
[   47.078754] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:319:DP-MST C]
[   47.078946] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:320:DP-MST D]
[   47.079140] i915 0000:00:02.0: [drm:verify_connector_state [i915]] [CONN=
ECTOR:324:DP-6]
[   47.079334] i915 0000:00:02.0: [drm:verify_connector_state [i915]] [CONN=
ECTOR:328:DP-7]
[   47.079527] i915 0000:00:02.0: [drm:verify_connector_state [i915]] [CONN=
ECTOR:330:DP-8]
[   47.079721] i915 0000:00:02.0: [drm:verify_connector_state [i915]] [CONN=
ECTOR:334:DP-10]
[   47.082637] thunderbolt 0000:8a:00.0: 0:1: link maximum bandwidth 72000/=
72000 Mb/s
[   47.082662] thunderbolt 0000:8a:00.0: 0:1: reserving 1500/1500 Mb/s for =
PCIe
[   47.082685] i915 0000:00:02.0: [drm:intel_dbuf_mdclk_cdclk_ratio_update =
[i915]] Updating dbuf ratio to 2 (mbus joined: no)
[   47.082917] i915 0000:00:02.0: [drm:intel_dbuf_mbus_join_update [i915]] =
Changing mbus joined: yes -> no (pipe: A)
[   47.087052] thunderbolt 0000:8a:00.0: 0:13 <-> 1:12 (DP): consumed bandw=
idth 0/12500 Mb/s
[   47.087490] thunderbolt 0000:8a:00.0: 1:1: link maximum bandwidth 72000/=
72000 Mb/s
[   47.087597] thunderbolt 0000:8a:00.0: 1:1: reserving 1500/1500 Mb/s for =
PCIe
[   47.090046] thunderbolt 0000:8a:00.0: 0:13 <-> 1:12 (DP): consumed bandw=
idth 0/12500 Mb/s
[   47.090054] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): available ba=
ndwidth 70500/58000 Mb/s
[   47.090990] thunderbolt 0000:8a:00.0: 0:21: scaled bandwidth 3599/3599, =
scale 0
[   47.091626] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): increased ba=
ndwidth allocation to 14738/14738 Mb/s
[   47.091630] thunderbolt 0000:8a:00.0: bandwidth estimation for group 1 d=
one
[   47.091633] thunderbolt 0000:8a:00.0: bandwidth re-calculation done
[   47.092428] usb 3-1.2.1: New USB device found, idVendor=3D17ef, idProduc=
t=3D3116, bcdDevice=3D 4.40
[   47.092434] usb 3-1.2.1: New USB device strings: Mfr=3D1, Product=3D2, S=
erialNumber=3D3
[   47.092437] usb 3-1.2.1: Product: VMM9322
[   47.092440] usb 3-1.2.1: Manufacturer: LENOVO
[   47.092442] usb 3-1.2.1: SerialNumber: 000000000000
[   47.094048] hid-generic 0003:17EF:3116.0006: hiddev100,hidraw5: USB HID =
v1.01 Device [LENOVO VMM9322] on usb-0000:00:14.0-1.2.1/input0
[   47.099407] i915 0000:00:02.0: [drm:mst_stream_pre_enable [i915]] active=
 MST streams 0 -> 1
[   47.100063] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00600 AUX <- (ret=3D  1) 01
[   47.100096] i915 0000:00:02.0: [drm:drm_dp_mst_topology_get_port_validat=
ed [drm_display_helper]] port 00000000cfbe3f71 (2)
[   47.100123] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] txmsg cur_offset=3D0 cur_len=3D2 seqno=3D0 state=3DQUEUED p=
ath_msg=3D1 dst=3D00:03
[   47.100144] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 	type=3DPOWER_UP_PHY contents:
[   47.100163] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 		port=3D3
[   47.101683] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x01000 AUX <- (ret=3D  7) 21 30 43 c8 24 30=
 6f
[   47.103327] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   47.103611] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   47.103914] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] got hpd i=
rq on [ENCODER:306:DDI TC3/PHY TC3] - short
[   47.104620] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   47.105064] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   47.105090] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   47.106061] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 20 30 43 c2 24 30 =
6f 00 00 00 00 00 00 00 00 00
[   47.106088] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000078cc10a9 (2)
[   47.106133] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000078cc10a9 (1)
[   47.106147] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_port [drm_di=
splay_helper]] port 00000000cfbe3f71 (1)
[   47.106182] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000024b3b3cb (2)
[   47.106208] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] txmsg cur_offset=3D0 cur_len=3D5 seqno=3D0 state=3DQUEUED p=
ath_msg=3D0 dst=3D00
[   47.106229] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 	type=3DREMOTE_DPCD_READ contents:
[   47.106247] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 		port=3D3 dpcd_addr=3D00160 len=3D1
[   47.106605] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   47.107362] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x01000 AUX <- (ret=3D  9) 10 06 cc 20 30 01=
 60 01 68
[   47.107935] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   47.108408] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   47.108434] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   47.109351] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   47.109556] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   47.109724] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   47.110198] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   47.110635] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   47.111057] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   47.111080] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   47.112075] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 10 05 c3 20 03 01 =
00 d2 00 00 00 00 00 00 00 00
[   47.112102] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000024b3b3cb (3)
[   47.112137] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000024b3b3cb (2)
[   47.112249] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000024b3b3cb (1)
[   47.112284] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] DPMST: 0x00160 AUX -> (ret=3D  1) 00
[   47.112309] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000024b3b3cb (2)
[   47.112331] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] txmsg cur_offset=3D0 cur_len=3D6 seqno=3D0 state=3DQUEUED p=
ath_msg=3D0 dst=3D00
[   47.112358] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 	type=3DREMOTE_DPCD_WRITE contents:
[   47.112375] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 		port=3D3 addr=3D00160 len=3D1: 01
[   47.112360] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   47.112559] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   47.112730] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   47.113501] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x01000 AUX <- (ret=3D 10) 10 07 c9 21 30 01=
 60 01 01 5d
[   47.113981] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   47.114485] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   47.114516] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 20
[   47.115349] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   47.115569] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   47.116086] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 10 03 ce 21 03 14 =
00 00 00 00 00 00 00 00 00 00
[   47.116119] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000024b3b3cb (3)
[   47.116160] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000024b3b3cb (2)
[   47.116248] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000024b3b3cb (1)
[   47.116285] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] DPMST: 0x00160 AUX <- (ret=3D  1) 01
[   47.116633] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   47.117048] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x001b0 AUX <- (ret=3D  1) 01
[   47.117628] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 20
[   47.118376] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   47.118819] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   47.118846] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 00
[   47.119258] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] got hpd i=
rq on [ENCODER:306:DDI TC3/PHY TC3] - short
[   47.119995] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   47.120440] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   47.120470] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 00
[   47.139574] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xf0005 AUX -> (ret=3D  1) 00
[   47.139992] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x03050 AUX <- (ret=3D  1) 00
[   47.140397] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x03051 AUX <- (ret=3D  1) 00
[   47.140812] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x03052 AUX -> (ret=3D  1) 00
[   47.141238] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x03052 AUX <- (ret=3D  1) 00
[   47.141673] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00120 AUX <- (ret=3D  1) 01
[   47.142040] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00280 AUX <- (ret=3D  1) 03
[   47.142468] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0xf0000 AUX -> (ret=3D  1) 20
[   47.143225] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00000 AUX -> (ret=3D 15) 12 14 c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   47.143982] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02200 AUX -> (ret=3D 15) 14 1e c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   47.144008] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: Base DPCD: 12 14 c4 81 01 1d 01 c4 6a 3f=
 04 00 00 00 84
[   47.144049] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: DPCD: 14 1e c4 81 01 1d 01 c4 6a 3f 04 0=
0 00 00 84
[   47.144810] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xf0000 AUX -> (ret=3D  8) 20 1e 80 aa 04 00 =
01 03
[   47.144839] i915 0000:00:02.0: [drm:intel_dp_init_lttpr_and_dprx_caps [i=
915]] [CONNECTOR:307:DP-4][ENCODER:306:DDI TC3/PHY TC3][DPRX] LTTPR common =
capabilities: 20 1e 80 aa 04 00 01 03
[   47.145492] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0xf0003 AUX <- (ret=3D  1) 55
[   47.145918] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0xf0003 AUX <- (ret=3D  1) aa
[   47.146363] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xf0020 AUX -> (ret=3D  3) 04 03 00
[   47.146391] i915 0000:00:02.0: [drm:intel_dp_init_lttpr_and_dprx_caps [i=
915]] [CONNECTOR:307:DP-4][ENCODER:306:DDI TC3/PHY TC3][LTTPR 1] PHY capabi=
lities: 04 03 00
[   47.147340] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xf003d AUX -> (ret=3D 12) 98 4f ee 42 52 00 =
00 00 00 b1 04 09
[   47.147371] i915 0000:00:02.0: [drm:drm_dp_dump_desc [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: LTTPR 1: OUI 98-4f-ee dev-ID BR HW-rev 11.1 S=
W-rev 4.9 quirks 0x0000
[   47.148063] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00000 AUX -> (ret=3D 15) 12 14 c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   47.148823] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02200 AUX -> (ret=3D 15) 14 1e c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   47.148839] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: Base DPCD: 12 14 c4 81 01 1d 01 c4 6a 3f=
 04 00 00 00 84
[   47.148859] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: DPCD: 14 1e c4 81 01 1d 01 c4 6a 3f 04 0=
0 00 00 84
[   47.149320] i915 0000:00:02.0: [drm:intel_dp_start_link_train [i915]] [C=
ONNECTOR:307:DP-4][ENCODER:306:DDI TC3/PHY TC3][DPRX] Using LINK_BW_SET val=
ue 1e
[   47.149901] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00107 AUX <- (ret=3D  2) 00 01
[   47.150630] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00100 AUX <- (ret=3D  2) 1e 04
[   47.150647] i915 0000:00:02.0: [drm:intel_dp_set_signal_levels [i915]] [=
CONNECTOR:307:DP-4][ENCODER:306:DDI TC3/PHY TC3][LTTPR 1] 8b/10b, lanes: 4,=
 vswing levels: 0/0/0/0, pre-emphasis levels: 0/0/0/0
[   47.151094] i915 0000:00:02.0: [drm:intel_dp_program_link_training_patte=
rn [i915]] [CONNECTOR:307:DP-4][ENCODER:306:DDI TC3/PHY TC3][LTTPR 1] Using=
 DP training pattern TPS1
[   47.151983] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0xf0010 AUX <- (ret=3D  5) 21 00 00 00 00
[   47.152855] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xf0030 AUX -> (ret=3D  5) 00 00 80 33 33
[   47.152874] i915 0000:00:02.0: [drm:intel_dp_get_adjust_train [i915]] [C=
ONNECTOR:307:DP-4][ENCODER:306:DDI TC3/PHY TC3][LTTPR 1] 8b/10b, lanes: 4, =
vswing request: 3/3/3/3, pre-emphasis request: 0/0/0/0
[   47.153047] i915 0000:00:02.0: [drm:intel_dp_set_signal_levels [i915]] [=
CONNECTOR:307:DP-4][ENCODER:306:DDI TC3/PHY TC3][LTTPR 1] 8b/10b, lanes: 4,=
 vswing levels: 3(max)/3(max)/3(max)/3(max), pre-emphasis levels: 0/0/0/0
[   47.153928] usbcore: registered new interface driver snd-usb-audio
[   47.153957] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0xf0011 AUX <- (ret=3D  4) 07 07 07 07
[   47.154841] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xf0030 AUX -> (ret=3D  5) 11 11 80 33 33
[   47.154862] i915 0000:00:02.0: [drm:intel_dp_link_train_phy [i915]] [CON=
NECTOR:307:DP-4][ENCODER:306:DDI TC3/PHY TC3][LTTPR 1] Clock recovery OK
[   47.155468] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xf0020 AUX -> (ret=3D  1) 04
[   47.155487] i915 0000:00:02.0: [drm:intel_dp_program_link_training_patte=
rn [i915]] [CONNECTOR:307:DP-4][ENCODER:306:DDI TC3/PHY TC3][LTTPR 1] Using=
 DP training pattern TPS4
[   47.156363] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0xf0010 AUX <- (ret=3D  5) 07 07 07 07 07
[   47.165037] i915 0000:00:02.0: [drm:intel_power_well_disable [i915]] dis=
abling AUX_TC3
[   47.172031] usb 3-1.2.3: new high-speed USB device number 11 using xhci_=
hcd
[   47.173238] i915 0000:00:02.0: [drm:intel_power_well_enable [i915]] enab=
ling AUX_TC3
[   47.175545] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xf0030 AUX -> (ret=3D  5) 11 11 00 33 33
[   47.175589] i915 0000:00:02.0: [drm:intel_dp_get_adjust_train [i915]] [C=
ONNECTOR:307:DP-4][ENCODER:306:DDI TC3/PHY TC3][LTTPR 1] 8b/10b, lanes: 4, =
vswing request: 3/3/3/3, pre-emphasis request: 0/0/0/0
[   47.175825] i915 0000:00:02.0: [drm:intel_dp_set_signal_levels [i915]] [=
CONNECTOR:307:DP-4][ENCODER:306:DDI TC3/PHY TC3][LTTPR 1] 8b/10b, lanes: 4,=
 vswing levels: 3(max)/3(max)/3(max)/3(max), pre-emphasis levels: 0/0/0/0
[   47.176695] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0xf0011 AUX <- (ret=3D  4) 07 07 07 07
[   47.193881] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xf0030 AUX -> (ret=3D  5) 77 77 81 33 33
[   47.193927] i915 0000:00:02.0: [drm:intel_dp_link_train_phy [i915]] [CON=
NECTOR:307:DP-4][ENCODER:306:DDI TC3/PHY TC3][LTTPR 1] Channel EQ done. DP =
Training successful
[   47.194223] i915 0000:00:02.0: [drm:intel_dp_link_train_phy [i915]] [CON=
NECTOR:307:DP-4][ENCODER:306:DDI TC3/PHY TC3][LTTPR 1] Link Training passed=
 at link rate =3D 810000, lane count =3D 4
[   47.194867] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0xf0010 AUX <- (ret=3D  1) 00
[   47.194891] i915 0000:00:02.0: [drm:intel_dp_set_signal_levels [i915]] [=
CONNECTOR:307:DP-4][ENCODER:306:DDI TC3/PHY TC3][DPRX] 8b/10b, lanes: 4, vs=
wing levels: 0/0/0/0, pre-emphasis levels: 0/0/0/0
[   47.195120] i915 0000:00:02.0: [drm:intel_dp_program_link_training_patte=
rn [i915]] [CONNECTOR:307:DP-4][ENCODER:306:DDI TC3/PHY TC3][DPRX] Using DP=
 training pattern TPS1
[   47.197288] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00102 AUX <- (ret=3D  5) 21 00 00 00 00
[   47.206881] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00202 AUX -> (ret=3D  6) 00 11 00 00 11 11
[   47.206919] i915 0000:00:02.0: [drm:intel_dp_get_adjust_train [i915]] [C=
ONNECTOR:307:DP-4][ENCODER:306:DDI TC3/PHY TC3][DPRX] 8b/10b, lanes: 4, vsw=
ing request: 1/1/1/1, pre-emphasis request: 0/0/0/0
[   47.207323] i915 0000:00:02.0: [drm:intel_dp_set_signal_levels [i915]] [=
CONNECTOR:307:DP-4][ENCODER:306:DDI TC3/PHY TC3][DPRX] 8b/10b, lanes: 4, vs=
wing levels: 1/1/1/1, pre-emphasis levels: 0/0/0/0
[   47.208377] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00103 AUX <- (ret=3D  4) 01 01 01 01
[   47.209269] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00202 AUX -> (ret=3D  6) 11 11 00 00 11 11
[   47.209290] i915 0000:00:02.0: [drm:intel_dp_link_train_phy [i915]] [CON=
NECTOR:307:DP-4][ENCODER:306:DDI TC3/PHY TC3][DPRX] Clock recovery OK
[   47.209610] i915 0000:00:02.0: [drm:intel_dp_program_link_training_patte=
rn [i915]] [CONNECTOR:307:DP-4][ENCODER:306:DDI TC3/PHY TC3][DPRX] Using DP=
 training pattern TPS4
[   47.210682] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00102 AUX <- (ret=3D  5) 07 01 01 01 01
[   47.211678] usb 6-1.4: new SuperSpeed Plus Gen 2x1 USB device number 3 u=
sing xhci_hcd
[   47.227782] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00202 AUX -> (ret=3D  6) 77 77 81 00 11 11
[   47.227831] i915 0000:00:02.0: [drm:intel_dp_link_train_phy [i915]] [CON=
NECTOR:307:DP-4][ENCODER:306:DDI TC3/PHY TC3][DPRX] Channel EQ done. DP Tra=
ining successful
[   47.228112] i915 0000:00:02.0: [drm:intel_dp_link_train_phy [i915]] [CON=
NECTOR:307:DP-4][ENCODER:306:DDI TC3/PHY TC3][DPRX] Link Training passed at=
 link rate =3D 810000, lane count =3D 4
[   47.229370] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00102 AUX <- (ret=3D  1) 00
[   47.229412] i915 0000:00:02.0: [drm:drm_dp_mst_topology_get_port_validat=
ed [drm_display_helper]] port 00000000cfbe3f71 (2)
[   47.229568] usb 6-1.4: New USB device found, idVendor=3D17ef, idProduct=
=3D3110, bcdDevice=3D 2.a3
[   47.229578] usb 6-1.4: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D0
[   47.229582] usb 6-1.4: Product: Lenovo Dock - USB3 Hub1
[   47.229584] usb 6-1.4: Manufacturer: Lenovo                =20
[   47.229834] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x002c0 AUX <- (ret=3D  1) 01
[   47.232053] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x001c0 AUX <- (ret=3D  3) 01 01 20
[   47.232349] hub 6-1.4:1.0: USB hub found
[   47.232512] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x002c0 AUX -> (ret=3D  1) 01
[   47.232539] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_port [drm_di=
splay_helper]] port 00000000cfbe3f71 (1)
[   47.232924] hub 6-1.4:1.0: 4 ports detected
[   47.233222] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x002c0 AUX -> (ret=3D  1) 03
[   47.233653] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00280 AUX -> (ret=3D  1) 05
[   47.233683] i915 0000:00:02.0: [drm:drm_dp_mst_topology_get_port_validat=
ed [drm_display_helper]] port 00000000cfbe3f71 (2)
[   47.233712] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000078cc10a9 (2)
[   47.233745] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] txmsg cur_offset=3D0 cur_len=3D6 seqno=3D0 state=3DQUEUED p=
ath_msg=3D1 dst=3D00:03
[   47.233775] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 	type=3DALLOCATE_PAYLOAD contents:
[   47.233802] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 		port=3D3 vcpi=3D1 pbn=3D1920 sdp_streams=3D1 00
[   47.234551] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x01000 AUX <- (ret=3D 11) 21 30 47 cf 11 31=
 01 07 80 00 6f
[   47.237334] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   47.237681] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   47.238049] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] got hpd i=
rq on [ENCODER:306:DDI TC3/PHY TC3] - short
[   47.239044] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   47.239493] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   47.239516] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   47.240394] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 20 30 46 c0 11 30 =
01 07 80 2f 00 00 00 00 00 00
[   47.240410] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000078cc10a9 (3)
[   47.240421] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000078cc10a9 (2)
[   47.240432] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000078cc10a9 (1)
[   47.240459] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_port [drm_di=
splay_helper]] port 00000000cfbe3f71 (1)
[   47.240485] i915 0000:00:02.0: [drm:intel_enable_transcoder [i915]] enab=
ling pipe B
[   47.240834] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   47.241288] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   47.241680] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   47.241685] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   47.242133] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   47.242537] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   47.242954] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   47.243365] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   47.243371] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 00
[   47.257673] i915 0000:00:02.0: [drm:intel_audio_codec_enable [i915]] [CO=
NNECTOR:332:DP-9][ENCODER:309:DP-MST B] Enable audio codec on [CRTC:145:pip=
e B], 32 bytes ELD
[   47.267612] usb 3-1.2.3: New USB device found, idVendor=3D17ef, idProduc=
t=3D3113, bcdDevice=3D 2.b3
[   47.267621] usb 3-1.2.3: New USB device strings: Mfr=3D1, Product=3D2, S=
erialNumber=3D0
[   47.267623] usb 3-1.2.3: Product: Lenovo Dock - USB2 Hub2
[   47.267624] usb 3-1.2.3: Manufacturer: Lenovo                =20
[   47.268959] hub 3-1.2.3:1.0: USB hub found
[   47.270213] hub 3-1.2.3:1.0: 4 ports detected
[   47.274324] i915 0000:00:02.0: [drm:intel_psr_post_plane_update [i915]] =
Enabling Panel Replay
[   47.274998] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x001b0 AUX <- (ret=3D  1) 7b
[   47.275637] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x001b1 AUX <- (ret=3D  1) 02
[   47.275747] i915 0000:00:02.0: [drm:verify_connector_state [i915]] [CONN=
ECTOR:332:DP-9]
[   47.275920] i915 0000:00:02.0: [drm:intel_modeset_verify_crtc [i915]] [C=
RTC:145:pipe B]
[   47.277096] i915 0000:00:02.0: [drm:intel_power_well_disable [i915]] dis=
abling AUX_TC3
[   47.278085] i915 0000:00:02.0: [drm:intel_read_dp_sdp [i915]] Failed to =
unpack DP VSC SDP
[   47.279780] i915 0000:00:02.0: [drm:drm_client_hotplug] fbdev: ret=3D0
[   47.279796] i915 0000:00:02.0: [drm:drm_fb_helper_hotplug_event]=20
[   47.279800] i915 0000:00:02.0: [drm:drm_client_modeset_probe]=20
[   47.279810] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:262:eDP-1]
[   47.279817] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:2=
62:eDP-1]
[   47.280270] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX A/DDI A/PHY A: 0x00060 AUX -> (ret=3D 16) 00 11 00 76 0b 01 01 80 00=
 01 06 66 08 00 00 00
[   47.280291] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] DSC DPCD: 00=
 11 00 76 0b 01 01 80 00 01 06 66 08 00 00 00
[   47.280549] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX A/DDI A/PHY A: 0x02214 AUX -> (ret=3D  1) 00
[   47.280559] i915 0000:00:02.0: [drm:intel_dp_print_rates [i915]] source =
rates: 162000, 216000, 243000, 270000, 324000, 432000, 540000, 675000, 8100=
00
[   47.280627] i915 0000:00:02.0: [drm:intel_dp_print_rates [i915]] sink ra=
tes: 162000, 216000, 243000, 270000, 324000, 432000, 540000, 810000
[   47.280694] i915 0000:00:02.0: [drm:intel_dp_print_rates [i915]] common =
rates: 162000, 216000, 243000, 270000, 324000, 432000, 540000, 810000
[   47.280768] i915 0000:00:02.0: [drm:update_display_info.part.0] [CONNECT=
OR:262:eDP-1] Supported Monitor Refresh rate range is 40 Hz - 60 Hz
[   47.280777] i915 0000:00:02.0: [drm:update_display_info.part.0] [CONNECT=
OR:262:eDP-1] Assigning EDID-1.4 digital sink color depth as 10 bpc.
[   47.280779] i915 0000:00:02.0: [drm:update_display_info.part.0] [CONNECT=
OR:262:eDP-1] ELD monitor=20
[   47.280780] i915 0000:00:02.0: [drm:update_display_info.part.0] [CONNECT=
OR:262:eDP-1] ELD size 20, SAD count 0
[   47.280786] i915 0000:00:02.0: [drm:intel_dp_set_edid [i915]] [CONNECTOR=
:262:eDP-1] VRR capable: yes
[   47.280854] i915 0000:00:02.0: [drm:intel_dp_set_edid [i915]] [CONNECTOR=
:262:eDP-1] DFP max bpc 0, max dotclock 0, TMDS clock 0-0, PCON Max FRL BW =
0Gbps
[   47.280921] i915 0000:00:02.0: [drm:intel_dp_set_edid [i915]] [CONNECTOR=
:262:eDP-1] RGB->YcbCr conversion? no, YCbCr 4:2:0 allowed? yes, YCbCr 4:4:=
4->4:2:0 conversion? no
[   47.281182] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX A/DDI A/PHY A: 0x03000 AUX -> (ret=3D  1) 00
[   47.281653] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX A/DDI A/PHY A: 0x00201 AUX -> (ret=3D  1) 00
[   47.281712] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:262:eDP-1] probed modes:
[   47.281717] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "3840x2400": 60 605000 3840 3888 3920 4000 2400 2403 2408=
 2520 0x48 0xa
[   47.281721] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:271:DP-1]
[   47.281724] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:2=
71:DP-1]
[   47.286048] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:271:DP-1] disconnected
[   47.286057] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:283:HDMI-A-1]
[   47.286061] i915 0000:00:02.0: [drm:intel_hdmi_detect [i915]] [CONNECTOR=
:283:HDMI-A-1]
[   47.291063] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:283:HDMI-A-1] disconnected
[   47.291070] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:289:DP-2]
[   47.291072] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:2=
89:DP-2]
[   47.291196] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:289:DP-2] disconnected
[   47.291198] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:298:DP-3]
[   47.291200] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:2=
98:DP-3]
[   47.291303] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:298:DP-3] disconnected
[   47.291305] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:307:DP-4]
[   47.291307] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:3=
07:DP-4]
[   47.291420] i915 0000:00:02.0: [drm:intel_power_well_enable [i915]] enab=
ling AUX_TC3
[   47.293046] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0xf0000 AUX -> (ret=3D  1) 20
[   47.294009] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00000 AUX -> (ret=3D 15) 12 14 c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   47.294824] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02200 AUX -> (ret=3D 15) 14 1e c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   47.294836] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: Base DPCD: 12 14 c4 81 01 1d 01 c4 6a 3f=
 04 00 00 00 84
[   47.294845] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: DPCD: 14 1e c4 81 01 1d 01 c4 6a 3f 04 0=
0 00 00 84
[   47.295430] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xf0000 AUX -> (ret=3D  8) 20 1e 80 aa 04 00 =
01 03
[   47.295442] i915 0000:00:02.0: [drm:intel_dp_init_lttpr_and_dprx_caps [i=
915]] [CONNECTOR:307:DP-4][ENCODER:306:DDI TC3/PHY TC3][DPRX] LTTPR common =
capabilities: 20 1e 80 aa 04 00 01 03
[   47.295910] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xf0020 AUX -> (ret=3D  3) 04 03 00
[   47.295919] i915 0000:00:02.0: [drm:intel_dp_init_lttpr_and_dprx_caps [i=
915]] [CONNECTOR:307:DP-4][ENCODER:306:DDI TC3/PHY TC3][LTTPR 1] PHY capabi=
lities: 04 03 00
[   47.296715] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xf003d AUX -> (ret=3D 12) 98 4f ee 42 52 00 =
00 00 00 b1 04 09
[   47.296733] i915 0000:00:02.0: [drm:drm_dp_dump_desc [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: LTTPR 1: OUI 98-4f-ee dev-ID BR HW-rev 11.1 S=
W-rev 4.9 quirks 0x0000
[   47.297460] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00000 AUX -> (ret=3D 15) 12 14 c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   47.298205] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02200 AUX -> (ret=3D 15) 14 1e c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   47.298212] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: Base DPCD: 12 14 c4 81 01 1d 01 c4 6a 3f=
 04 00 00 00 84
[   47.298220] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: DPCD: 14 1e c4 81 01 1d 01 c4 6a 3f 04 0=
0 00 00 84
[   47.298947] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00500 AUX -> (ret=3D 12) 90 cc 24 53 59 4e =
41 93 22 10 09 03
[   47.298956] i915 0000:00:02.0: [drm:drm_dp_dump_desc [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: DP branch: OUI 90-cc-24 dev-ID SYNA\223" HW-r=
ev 1.0 SW-rev 9.3 quirks 0x0028
[   47.299364] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02210 AUX -> (ret=3D  1) fa
[   47.299829] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00200 AUX -> (ret=3D  1) 01
[   47.300566] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00080 AUX -> (ret=3D 16) 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00
[   47.300578] i915 0000:00:02.0: [drm:drm_dp_read_downstream_info [drm_dis=
play_helper]] AUX USBC3/DDI TC3/PHY TC3: DPCD DFP: 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00
[   47.300971] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00021 AUX -> (ret=3D  1) 21
[   47.300980] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [ENCODER:306=
:DDI TC3/PHY TC3] MST support: port: yes, sink: MST, modparam: yes -> enabl=
e: MST
[   47.301460] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00111 AUX -> (ret=3D  1) 07
[   47.302004] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   47.302397] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0023 AUX -> (ret=3D  1) cf
[   47.302828] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00070 AUX -> (ret=3D  2) 00 00
[   47.303365] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x000b0 AUX -> (ret=3D  7) 07 1c 00 00 00 00 =
00
[   47.303375] i915 0000:00:02.0: [drm:intel_psr_init_dpcd [i915]] Panel re=
play selective_update is supported by panel
[   47.303963] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x000b1 AUX -> (ret=3D  1) 1c
[   47.304830] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00060 AUX -> (ret=3D 16) 03 21 00 14 0b 04 =
03 c0 01 17 0e e2 08 00 00 00
[   47.304841] i915 0000:00:02.0: [drm:intel_dp_get_dsc_sink_cap [i915]] DS=
C DPCD: 03 21 00 14 0b 04 03 c0 01 17 0e e2 08 00 00 00
[   47.305319] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00090 AUX -> (ret=3D  1) ff
[   47.305327] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] FEC CAPABILI=
TY: ff
[   47.305778] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02214 AUX -> (ret=3D  1) 03
[   47.305790] i915 0000:00:02.0: [drm:intel_dp_print_rates [i915]] source =
rates: 162000, 216000, 243000, 270000, 324000, 432000, 540000, 675000, 8100=
00, 1000000, 2000000
[   47.305863] i915 0000:00:02.0: [drm:intel_dp_print_rates [i915]] sink ra=
tes: 162000, 270000, 540000, 810000
[   47.305931] i915 0000:00:02.0: [drm:intel_dp_print_rates [i915]] common =
rates: 162000, 270000, 540000, 810000
[   47.305998] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:307:DP-4] disconnected
[   47.306005] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:316:DP-5]
[   47.306008] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:3=
16:DP-5]
[   47.311024] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:316:DP-5] disconnected
[   47.311034] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:324:DP-6]
[   47.311042] i915 0000:00:02.0: [drm:drm_dp_mst_topology_get_port_validat=
ed [drm_display_helper]] port 00000000f115c240 (2)
[   47.311057] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_port [drm_di=
splay_helper]] port 00000000f115c240 (1)
[   47.311066] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:324:DP-6] disconnected
[   47.311068] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:328:DP-7]
[   47.311071] i915 0000:00:02.0: [drm:drm_dp_mst_topology_get_port_validat=
ed [drm_display_helper]] port 00000000da17abb3 (2)
[   47.311078] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_port [drm_di=
splay_helper]] port 00000000da17abb3 (1)
[   47.311085] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:328:DP-7] disconnected
[   47.311088] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:330:DP-8]
[   47.311090] i915 0000:00:02.0: [drm:drm_dp_mst_topology_get_port_validat=
ed [drm_display_helper]] port 000000003ae7a899 (2)
[   47.311098] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_port [drm_di=
splay_helper]] port 000000003ae7a899 (1)
[   47.311105] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:330:DP-8] disconnected
[   47.311107] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:332:DP-9]
[   47.311114] i915 0000:00:02.0: [drm:drm_dp_mst_topology_get_port_validat=
ed [drm_display_helper]] port 00000000cfbe3f71 (2)
[   47.311121] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_port [drm_di=
splay_helper]] port 00000000cfbe3f71 (1)
[   47.311128] i915 0000:00:02.0: [drm:drm_dp_mst_topology_get_port_validat=
ed [drm_display_helper]] port 00000000cfbe3f71 (2)
[   47.311139] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000078cc10a9 (2)
[   47.311150] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] txmsg cur_offset=3D0 cur_len=3D8 seqno=3D0 state=3DQUEUED p=
ath_msg=3D0 dst=3D00:03
[   47.311160] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 	type=3DREMOTE_I2C_READ contents:
[   47.311168] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 		port=3D3 num_tx=3D1 id=3D80 size=3D1:
[   47.311175] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 			0: id=3D080 size=3D001 no_stop_bit=3D0 tx_delay=3D000: 00
[   47.313037] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x01000 AUX <- (ret=3D 13) 21 30 09 c5 22 31=
 50 01 00 10 50 01 66
[   47.314393] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   47.314558] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   47.314709] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] got hpd i=
rq on [ENCODER:306:DDI TC3/PHY TC3] - short
[   47.315217] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   47.315650] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   47.315669] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   47.316649] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 20 30 05 c6 22 03 =
01 00 58 00 00 00 00 00 00 00
[   47.316679] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000078cc10a9 (3)
[   47.316696] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000078cc10a9 (2)
[   47.316704] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000078cc10a9 (2)
[   47.316724] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000078cc10a9 (2)
[   47.316736] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] txmsg cur_offset=3D0 cur_len=3D8 seqno=3D0 state=3DQUEUED p=
ath_msg=3D0 dst=3D00:03
[   47.316747] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 	type=3DREMOTE_I2C_READ contents:
[   47.316754] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 		port=3D3 num_tx=3D1 id=3D80 size=3D128:
[   47.316761] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 			0: id=3D080 size=3D001 no_stop_bit=3D0 tx_delay=3D000: 00
[   47.317963] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   47.318704] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x01000 AUX <- (ret=3D 13) 21 30 09 c5 22 31=
 50 01 00 10 50 80 5c
[   47.319140] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   47.319540] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   47.319555] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   47.320370] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   47.320786] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   47.321434] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   47.321628] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   47.321796] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   47.322217] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   47.322233] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   47.323073] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 20 30 2c 8c 22 03 =
80 00 ff ff ff ff ff ff 00 15
[   47.323082] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000078cc10a9 (3)
[   47.323811] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01410 AUX -> (ret=3D 16) c3 28 33 e1 96 ca =
01 31 21 01 04 a5 3c 22 78 fa
[   47.324080] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   47.324200] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   47.324793] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01420 AUX -> (ret=3D 16) d1 15 a9 54 4f a6 =
26 0d 50 54 a1 08 00 81 80 80
[   47.324798] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000078cc10a9 (2)
[   47.325205] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   47.325619] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   47.326024] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   47.326031] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   47.326491] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   47.326896] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   47.327294] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   47.327699] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   47.327705] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   47.328397] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   47.328510] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   47.329013] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 20 30 2c 07 a9 40 =
d1 00 b3 00 81 00 a9 c0 81 c0
[   47.329022] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000078cc10a9 (3)
[   47.329746] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01410 AUX -> (ret=3D 16) 01 01 4d d0 00 a0 =
f0 70 3e 80 30 20 35 00 55 50
[   47.330478] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01420 AUX -> (ret=3D 16) 21 00 00 1a 00 00 =
00 ff 00 33 30 30 35 34 31 9a
[   47.330485] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000078cc10a9 (2)
[   47.331070] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   47.331224] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   47.331637] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   47.332038] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   47.332443] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   47.332452] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 20
[   47.333330] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 20 30 2c 07 31 33 =
0a 20 20 20 20 00 00 00 fd 00
[   47.333347] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000078cc10a9 (3)
[   47.333906] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   47.334025] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   47.334547] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01410 AUX -> (ret=3D 16) 1d 3d 1f 86 36 01 =
0a 20 20 20 20 20 20 00 00 00
[   47.335288] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01420 AUX -> (ret=3D 16) fc 00 45 56 32 37 =
34 30 58 0a 20 20 20 20 20 63
[   47.335303] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000078cc10a9 (2)
[   47.335707] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   47.336368] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 20
[   47.336782] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   47.337183] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   47.337190] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 00
[   47.337320] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] got hpd i=
rq on [ENCODER:306:DDI TC3/PHY TC3] - short
[   47.337805] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   47.338399] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   47.338508] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   47.338673] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   47.338680] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   47.339480] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 20 30 03 40 01 14 =
a7 00 00 00 00 00 00 00 00 00
[   47.339487] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000078cc10a9 (3)
[   47.339495] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000078cc10a9 (2)
[   47.339618] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000078cc10a9 (1)
[   47.339639] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000078cc10a9 (2)
[   47.339650] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] txmsg cur_offset=3D0 cur_len=3D8 seqno=3D0 state=3DQUEUED p=
ath_msg=3D0 dst=3D00:03
[   47.339659] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 	type=3DREMOTE_I2C_READ contents:
[   47.339667] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 		port=3D3 num_tx=3D1 id=3D80 size=3D128:
[   47.339674] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 			0: id=3D080 size=3D001 no_stop_bit=3D0 tx_delay=3D000: 80
[   47.339911] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   47.340643] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x01000 AUX <- (ret=3D 13) 21 30 09 c5 22 31=
 50 01 80 10 50 80 07
[   47.341097] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   47.341214] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   47.341449] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   47.341853] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   47.341859] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   47.342327] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   47.342736] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   47.343136] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   47.343927] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   47.344036] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   47.344209] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   47.344212] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   47.344986] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 20 30 2c 8c 22 03 =
80 02 03 13 f1 46 10 22 04 03
[   47.344991] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000078cc10a9 (3)
[   47.345729] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01410 AUX -> (ret=3D 16) 02 01 23 09 7f 07 =
83 01 00 00 02 3a 80 18 71 38
[   47.346465] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01420 AUX -> (ret=3D 16) 2d 40 58 2c 45 00 =
55 50 21 00 00 1e a3 66 00 a7
[   47.346470] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000078cc10a9 (2)
[   47.346639] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   47.346759] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   47.346931] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   47.347347] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   47.347750] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   47.347754] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   47.348195] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   47.348590] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   47.349427] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   47.349532] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   47.349685] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   47.350035] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   47.350038] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   47.350806] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 20 30 2c 07 a0 f0 =
70 1f 80 30 20 35 00 55 50 21
[   47.350810] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000078cc10a9 (3)
[   47.351540] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01410 AUX -> (ret=3D 16) 00 00 1a 56 5e 00 =
a0 a0 a0 29 50 30 20 35 00 55
[   47.352232] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   47.352346] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   47.352795] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01420 AUX -> (ret=3D 16) 50 21 00 00 1a 00 =
00 00 00 00 00 00 00 00 00 92
[   47.352799] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000078cc10a9 (2)
[   47.353213] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   47.353630] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   47.354028] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   47.354032] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   47.354479] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   47.354893] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   47.355354] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   47.355549] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   47.355710] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   47.356366] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   47.356371] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   47.357072] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 20 30 2c 07 00 00 =
00 00 00 00 00 00 00 00 00 00
[   47.357076] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000078cc10a9 (3)
[   47.357804] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01410 AUX -> (ret=3D 16) 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00
[   47.358113] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   47.358240] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   47.358774] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01420 AUX -> (ret=3D 16) 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00
[   47.358779] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000078cc10a9 (2)
[   47.359191] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   47.359609] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   47.360015] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   47.360022] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   47.360464] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   47.360876] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   47.361292] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   47.361696] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   47.361699] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 00
[   47.361754] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] got hpd i=
rq on [ENCODER:306:DDI TC3/PHY TC3] - short
[   47.362199] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   47.362602] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   47.362606] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 00
[   47.389327] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   47.389563] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   47.389890] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] got hpd i=
rq on [ENCODER:306:DDI TC3/PHY TC3] - short
[   47.390483] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   47.390900] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   47.390912] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   47.391784] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 20 30 03 40 00 29 =
58 00 00 00 00 00 00 00 00 00
[   47.391798] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000078cc10a9 (3)
[   47.391816] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000078cc10a9 (2)
[   47.391827] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000078cc10a9 (2)
[   47.391865] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_port [drm_di=
splay_helper]] port 00000000cfbe3f71 (1)
[   47.391897] i915 0000:00:02.0: [drm:update_display_info.part.0] [CONNECT=
OR:332:DP-9] Assigning EDID-1.4 digital sink color depth as 8 bpc.
[   47.391909] i915 0000:00:02.0: [drm:update_display_info.part.0] [CONNECT=
OR:332:DP-9] ELD monitor EV2740X
[   47.391914] i915 0000:00:02.0: [drm:update_display_info.part.0] [CONNECT=
OR:332:DP-9] ELD size 32, SAD count 1
[   47.392095] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   47.392464] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   47.392403] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 47 for 64 timeslots total bw 25920000 pixel clock 5=
48463
[   47.392427] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   47.392886] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   47.392780] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 95 for 64 timeslots total bw 25920000 pixel clock 2=
70246
[   47.393114] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 104 for 64 timeslots total bw 25920000 pixel clock =
248389
[   47.393296] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   47.393305] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   47.393415] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 130 for 64 timeslots total bw 25920000 pixel clock =
198763
[   47.393810] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   47.393689] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 169 for 64 timeslots total bw 25920000 pixel clock =
152736
[   47.393987] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 169 for 64 timeslots total bw 25920000 pixel clock =
152736
[   47.394215] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   47.394331] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 169 for 64 timeslots total bw 25920000 pixel clock =
152584
[   47.394636] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   47.394671] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 339 for 64 timeslots total bw 25920000 pixel clock =
76368
[   47.395036] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   47.395044] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 00
[   47.394973] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 339 for 64 timeslots total bw 25920000 pixel clock =
76292
[   47.395144] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] got hpd i=
rq on [ENCODER:306:DDI TC3/PHY TC3] - short
[   47.395302] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 155 for 64 timeslots total bw 25920000 pixel clock =
166621
[   47.395668] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   47.395625] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 172 for 64 timeslots total bw 25920000 pixel clock =
150422
[   47.396057] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   47.395947] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 233 for 64 timeslots total bw 25920000 pixel clock =
111081
[   47.396065] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 00
[   47.396273] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 233 for 64 timeslots total bw 25920000 pixel clock =
111081
[   47.396577] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 301 for 64 timeslots total bw 25920000 pixel clock =
85882
[   47.396843] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 339 for 64 timeslots total bw 25920000 pixel clock =
76368
[   47.397112] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 339 for 64 timeslots total bw 25920000 pixel clock =
76368
[   47.397380] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 339 for 64 timeslots total bw 25920000 pixel clock =
76292
[   47.397670] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 387 for 64 timeslots total bw 25920000 pixel clock =
66854
[   47.397961] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 630 for 64 timeslots total bw 25920000 pixel clock =
41141
[   47.398229] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 932 for 64 timeslots total bw 25920000 pixel clock =
27798
[   47.398496] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 932 for 64 timeslots total bw 25920000 pixel clock =
27798
[   47.398763] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 933 for 64 timeslots total bw 25920000 pixel clock =
27770
[   47.399014] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 933 for 64 timeslots total bw 25920000 pixel clock =
27770
[   47.399263] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 1000 for 64 timeslots total bw 25920000 pixel clock=
 25918
[   47.399504] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 1001 for 64 timeslots total bw 25920000 pixel clock=
 25893
[   47.399745] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 1001 for 64 timeslots total bw 25920000 pixel clock=
 25893
[   47.400009] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 889 for 64 timeslots total bw 25920000 pixel clock =
29127
[   47.400245] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:332:DP-9] probed modes:
[   47.400254] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "3840x2160": 60 533250 3840 3888 3920 4000 2160 2163 2168=
 2222 0x48 0x9
[   47.400263] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "3840x2160": 30 262750 3840 3888 3920 4000 2160 2163 2168=
 2191 0x40 0x9
[   47.400270] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "2560x1440": 60 241500 2560 2608 2640 2720 1440 1443 1448=
 1481 0x40 0x9
[   47.400276] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1920x1200": 60 193250 1920 2056 2256 2592 1200 1203 1209=
 1245 0x40 0x6
[   47.400282] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1920x1080": 60 148500 1920 2008 2052 2200 1080 1084 1089=
 1125 0x40 0x5
[   47.400288] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1920x1080": 60 148500 1920 2008 2052 2200 1080 1084 1089=
 1125 0x40 0x5
[   47.400294] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1920x1080": 60 148352 1920 2008 2052 2200 1080 1084 1089=
 1125 0x40 0x5
[   47.400300] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1920x1080": 30 74250 1920 2008 2052 2200 1080 1084 1089 =
1125 0x40 0x5
[   47.400307] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1920x1080": 30 74176 1920 2008 2052 2200 1080 1084 1089 =
1125 0x40 0x5
[   47.400313] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1600x1200": 60 162000 1600 1664 1856 2160 1200 1201 1204=
 1250 0x40 0x5
[   47.400319] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1680x1050": 60 146250 1680 1784 1960 2240 1050 1053 1059=
 1089 0x40 0x6
[   47.400325] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1600x900": 60 108000 1600 1624 1704 1800 900 901 904 100=
0 0x40 0x5
[   47.400332] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1280x1024": 60 108000 1280 1328 1440 1688 1024 1025 1028=
 1066 0x40 0x5
[   47.400338] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1280x800": 60 83500 1280 1352 1480 1680 800 803 809 831 =
0x40 0x6
[   47.400345] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1280x720": 60 74250 1280 1390 1430 1650 720 725 730 750 =
0x40 0x5
[   47.400351] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1280x720": 60 74250 1280 1390 1430 1650 720 725 730 750 =
0x40 0x5
[   47.400357] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1280x720": 60 74176 1280 1390 1430 1650 720 725 730 750 =
0x40 0x5
[   47.400363] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1024x768": 60 65000 1024 1048 1184 1344 768 771 777 806 =
0x40 0xa
[   47.400369] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "800x600": 60 40000 800 840 968 1056 600 601 605 628 0x40=
 0x5
[   47.400376] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "720x480": 60 27027 720 736 798 858 480 489 495 525 0x40 =
0xa
[   47.400382] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "720x480": 60 27027 720 736 798 858 480 489 495 525 0x40 =
0xa
[   47.400388] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "720x480": 60 27000 720 736 798 858 480 489 495 525 0x40 =
0xa
[   47.400394] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "720x480": 60 27000 720 736 798 858 480 489 495 525 0x40 =
0xa
[   47.400400] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "640x480": 60 25200 640 656 752 800 480 490 492 525 0x40 =
0xa
[   47.400407] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "640x480": 60 25175 640 656 752 800 480 490 492 525 0x40 =
0xa
[   47.400413] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "640x480": 60 25175 640 656 752 800 480 490 492 525 0x40 =
0xa
[   47.400419] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "720x400": 70 28320 720 738 846 900 400 412 414 449 0x40 =
0x6
[   47.400427] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:334:DP-10]
[   47.400437] i915 0000:00:02.0: [drm:drm_dp_mst_topology_get_port_validat=
ed [drm_display_helper]] port 00000000a1faa806 (2)
[   47.400467] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_port [drm_di=
splay_helper]] port 00000000a1faa806 (1)
[   47.400495] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:334:DP-10] disconnected
[   47.400502] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:262:eDP-1] enabled? yes
[   47.400510] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:271:DP-1] enabled? no
[   47.400515] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:283:HDMI-A-1] enabled? no
[   47.400521] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:289:DP-2] enabled? no
[   47.400525] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:298:DP-3] enabled? no
[   47.400530] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:307:DP-4] enabled? no
[   47.400535] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:316:DP-5] enabled? no
[   47.400540] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:324:DP-6] enabled? no
[   47.400545] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:328:DP-7] enabled? no
[   47.400549] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:330:DP-8] enabled? no
[   47.400553] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:332:DP-9] enabled? yes
[   47.400558] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:334:DP-10] enabled? no
[   47.400575] i915 0000:00:02.0: [drm:drm_client_modeset_probe] Not using =
firmware configuration
[   47.400583] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:262:eDP-1] found preferred mode: 3840x2400
[   47.400590] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:332:DP-9] found preferred mode: 3840x2160
[   47.400595] i915 0000:00:02.0: [drm:drm_client_modeset_probe] picking CR=
TCs for 3840x2400 config
[   47.400608] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CRTC:88:p=
ipe A] desired mode 3840x2400 set (0,0)
[   47.400615] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CRTC:145:=
pipe B] desired mode 3840x2160 set (0,0)
[   47.405102] i915 0000:00:02.0: [drm:intel_power_well_disable [i915]] dis=
abling AUX_TC3
[   47.417626] i915 0000:00:02.0: [drm:drm_client_hotplug] fbdev: ret=3D0
[   47.417638] i915 0000:00:02.0: [drm:drm_sysfs_hotplug_event] generating =
hotplug event
[   47.417683] i915 0000:00:02.0: [drm:drm_fb_helper_hotplug_event]=20
[   47.417688] i915 0000:00:02.0: [drm:drm_client_modeset_probe]=20
[   47.417697] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:262:eDP-1]
[   47.417701] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:2=
62:eDP-1]
[   47.418303] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX A/DDI A/PHY A: 0x00060 AUX -> (ret=3D 16) 00 11 00 76 0b 01 01 80 00=
 01 06 66 08 00 00 00
[   47.418334] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] DSC DPCD: 00=
 11 00 76 0b 01 01 80 00 01 06 66 08 00 00 00
[   47.418679] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX A/DDI A/PHY A: 0x02214 AUX -> (ret=3D  1) 00
[   47.418704] i915 0000:00:02.0: [drm:intel_dp_print_rates [i915]] source =
rates: 162000, 216000, 243000, 270000, 324000, 432000, 540000, 675000, 8100=
00
[   47.418891] i915 0000:00:02.0: [drm:intel_dp_print_rates [i915]] sink ra=
tes: 162000, 216000, 243000, 270000, 324000, 432000, 540000, 810000
[   47.419080] i915 0000:00:02.0: [drm:intel_dp_print_rates [i915]] common =
rates: 162000, 216000, 243000, 270000, 324000, 432000, 540000, 810000
[   47.419264] i915 0000:00:02.0: [drm:update_display_info.part.0] [CONNECT=
OR:262:eDP-1] Supported Monitor Refresh rate range is 40 Hz - 60 Hz
[   47.419271] i915 0000:00:02.0: [drm:update_display_info.part.0] [CONNECT=
OR:262:eDP-1] Assigning EDID-1.4 digital sink color depth as 10 bpc.
[   47.419275] i915 0000:00:02.0: [drm:update_display_info.part.0] [CONNECT=
OR:262:eDP-1] ELD monitor=20
[   47.419278] i915 0000:00:02.0: [drm:update_display_info.part.0] [CONNECT=
OR:262:eDP-1] ELD size 20, SAD count 0
[   47.419285] i915 0000:00:02.0: [drm:intel_dp_set_edid [i915]] [CONNECTOR=
:262:eDP-1] VRR capable: yes
[   47.419466] i915 0000:00:02.0: [drm:intel_dp_set_edid [i915]] [CONNECTOR=
:262:eDP-1] DFP max bpc 0, max dotclock 0, TMDS clock 0-0, PCON Max FRL BW =
0Gbps
[   47.419647] i915 0000:00:02.0: [drm:intel_dp_set_edid [i915]] [CONNECTOR=
:262:eDP-1] RGB->YcbCr conversion? no, YCbCr 4:2:0 allowed? yes, YCbCr 4:4:=
4->4:2:0 conversion? no
[   47.420034] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX A/DDI A/PHY A: 0x03000 AUX -> (ret=3D  1) 00
[   47.420262] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX A/DDI A/PHY A: 0x00201 AUX -> (ret=3D  1) 00
[   47.420368] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:262:eDP-1] probed modes:
[   47.420375] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "3840x2400": 60 605000 3840 3888 3920 4000 2400 2403 2408=
 2520 0x48 0xa
[   47.420382] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:271:DP-1]
[   47.420388] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:2=
71:DP-1]
[   47.425051] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:271:DP-1] disconnected
[   47.425060] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:283:HDMI-A-1]
[   47.425067] i915 0000:00:02.0: [drm:intel_hdmi_detect [i915]] [CONNECTOR=
:283:HDMI-A-1]
[   47.430023] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:283:HDMI-A-1] disconnected
[   47.430031] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:289:DP-2]
[   47.430036] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:2=
89:DP-2]
[   47.430291] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:289:DP-2] disconnected
[   47.430297] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:298:DP-3]
[   47.430302] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:2=
98:DP-3]
[   47.430535] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:298:DP-3] disconnected
[   47.430540] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:307:DP-4]
[   47.430544] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:3=
07:DP-4]
[   47.430779] i915 0000:00:02.0: [drm:intel_power_well_enable [i915]] enab=
ling AUX_TC3
[   47.432408] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0xf0000 AUX -> (ret=3D  1) 20
[   47.433074] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00000 AUX -> (ret=3D 15) 12 14 c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   47.433833] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02200 AUX -> (ret=3D 15) 14 1e c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   47.433854] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: Base DPCD: 12 14 c4 81 01 1d 01 c4 6a 3f=
 04 00 00 00 84
[   47.433878] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: DPCD: 14 1e c4 81 01 1d 01 c4 6a 3f 04 0=
0 00 00 84
[   47.434646] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xf0000 AUX -> (ret=3D  8) 20 1e 80 aa 04 00 =
01 03
[   47.434680] i915 0000:00:02.0: [drm:intel_dp_init_lttpr_and_dprx_caps [i=
915]] [CONNECTOR:307:DP-4][ENCODER:306:DDI TC3/PHY TC3][DPRX] LTTPR common =
capabilities: 20 1e 80 aa 04 00 01 03
[   47.435424] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xf0020 AUX -> (ret=3D  3) 04 03 00
[   47.435464] i915 0000:00:02.0: [drm:intel_dp_init_lttpr_and_dprx_caps [i=
915]] [CONNECTOR:307:DP-4][ENCODER:306:DDI TC3/PHY TC3][LTTPR 1] PHY capabi=
lities: 04 03 00
[   47.436561] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xf003d AUX -> (ret=3D 12) 98 4f ee 42 52 00 =
00 00 00 b1 04 09
[   47.436601] i915 0000:00:02.0: [drm:drm_dp_dump_desc [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: LTTPR 1: OUI 98-4f-ee dev-ID BR HW-rev 11.1 S=
W-rev 4.9 quirks 0x0000
[   47.437388] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00000 AUX -> (ret=3D 15) 12 14 c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   47.438083] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02200 AUX -> (ret=3D 15) 14 1e c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   47.438119] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: Base DPCD: 12 14 c4 81 01 1d 01 c4 6a 3f=
 04 00 00 00 84
[   47.438160] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: DPCD: 14 1e c4 81 01 1d 01 c4 6a 3f 04 0=
0 00 00 84
[   47.438950] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00500 AUX -> (ret=3D 12) 90 cc 24 53 59 4e =
41 93 22 10 09 03
[   47.438984] i915 0000:00:02.0: [drm:drm_dp_dump_desc [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: DP branch: OUI 90-cc-24 dev-ID SYNA\223" HW-r=
ev 1.0 SW-rev 9.3 quirks 0x0028
[   47.439430] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02210 AUX -> (ret=3D  1) fa
[   47.439877] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00200 AUX -> (ret=3D  1) 01
[   47.440642] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00080 AUX -> (ret=3D 16) 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00
[   47.440674] i915 0000:00:02.0: [drm:drm_dp_read_downstream_info [drm_dis=
play_helper]] AUX USBC3/DDI TC3/PHY TC3: DPCD DFP: 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00
[   47.441371] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00021 AUX -> (ret=3D  1) 21
[   47.441403] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [ENCODER:306=
:DDI TC3/PHY TC3] MST support: port: yes, sink: MST, modparam: yes -> enabl=
e: MST
[   47.442125] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00111 AUX -> (ret=3D  1) 07
[   47.442568] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   47.443005] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0023 AUX -> (ret=3D  1) cf
[   47.443452] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00070 AUX -> (ret=3D  2) 00 00
[   47.444217] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x000b0 AUX -> (ret=3D  7) 07 1c 00 00 00 00 =
00
[   47.444248] i915 0000:00:02.0: [drm:intel_psr_init_dpcd [i915]] Panel re=
play selective_update is supported by panel
[   47.445033] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x000b1 AUX -> (ret=3D  1) 1c
[   47.445815] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00060 AUX -> (ret=3D 16) 03 21 00 14 0b 04 =
03 c0 01 17 0e e2 08 00 00 00
[   47.445846] i915 0000:00:02.0: [drm:intel_dp_get_dsc_sink_cap [i915]] DS=
C DPCD: 03 21 00 14 0b 04 03 c0 01 17 0e e2 08 00 00 00
[   47.446558] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00090 AUX -> (ret=3D  1) ff
[   47.446587] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] FEC CAPABILI=
TY: ff
[   47.447262] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02214 AUX -> (ret=3D  1) 03
[   47.447295] i915 0000:00:02.0: [drm:intel_dp_print_rates [i915]] source =
rates: 162000, 216000, 243000, 270000, 324000, 432000, 540000, 675000, 8100=
00, 1000000, 2000000
[   47.447573] i915 0000:00:02.0: [drm:intel_dp_print_rates [i915]] sink ra=
tes: 162000, 270000, 540000, 810000
[   47.447845] i915 0000:00:02.0: [drm:intel_dp_print_rates [i915]] common =
rates: 162000, 270000, 540000, 810000
[   47.448124] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:307:DP-4] disconnected
[   47.448133] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:316:DP-5]
[   47.448140] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:3=
16:DP-5]
[   47.453030] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:316:DP-5] disconnected
[   47.453050] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:324:DP-6]
[   47.453061] i915 0000:00:02.0: [drm:drm_dp_mst_topology_get_port_validat=
ed [drm_display_helper]] port 00000000f115c240 (2)
[   47.453100] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_port [drm_di=
splay_helper]] port 00000000f115c240 (1)
[   47.453128] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:324:DP-6] disconnected
[   47.453134] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:328:DP-7]
[   47.453140] i915 0000:00:02.0: [drm:drm_dp_mst_topology_get_port_validat=
ed [drm_display_helper]] port 00000000da17abb3 (2)
[   47.453166] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_port [drm_di=
splay_helper]] port 00000000da17abb3 (1)
[   47.453192] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:328:DP-7] disconnected
[   47.453197] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:330:DP-8]
[   47.453203] i915 0000:00:02.0: [drm:drm_dp_mst_topology_get_port_validat=
ed [drm_display_helper]] port 000000003ae7a899 (2)
[   47.453228] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_port [drm_di=
splay_helper]] port 000000003ae7a899 (1)
[   47.453253] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:330:DP-8] disconnected
[   47.453259] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:332:DP-9]
[   47.453268] i915 0000:00:02.0: [drm:drm_dp_mst_topology_get_port_validat=
ed [drm_display_helper]] port 00000000cfbe3f71 (2)
[   47.453292] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_port [drm_di=
splay_helper]] port 00000000cfbe3f71 (1)
[   47.453318] i915 0000:00:02.0: [drm:drm_dp_mst_topology_get_port_validat=
ed [drm_display_helper]] port 00000000cfbe3f71 (2)
[   47.453345] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000078cc10a9 (2)
[   47.453377] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] txmsg cur_offset=3D0 cur_len=3D8 seqno=3D0 state=3DQUEUED p=
ath_msg=3D0 dst=3D00:03
[   47.453408] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 	type=3DREMOTE_I2C_READ contents:
[   47.453433] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 		port=3D3 num_tx=3D1 id=3D80 size=3D1:
[   47.453457] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 			0: id=3D080 size=3D001 no_stop_bit=3D0 tx_delay=3D000: 00
[   47.454221] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x01000 AUX <- (ret=3D 13) 21 30 09 c5 22 31=
 50 01 00 10 50 01 66
[   47.456331] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   47.456652] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   47.456941] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] got hpd i=
rq on [ENCODER:306:DDI TC3/PHY TC3] - short
[   47.457890] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   47.458354] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   47.458369] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   47.459272] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 20 30 05 c6 22 03 =
01 00 58 00 00 00 00 00 00 00
[   47.459292] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000078cc10a9 (3)
[   47.459311] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000078cc10a9 (2)
[   47.459463] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000078cc10a9 (1)
[   47.459505] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000078cc10a9 (2)
[   47.459533] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] txmsg cur_offset=3D0 cur_len=3D8 seqno=3D0 state=3DQUEUED p=
ath_msg=3D0 dst=3D00:03
[   47.459559] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 	type=3DREMOTE_I2C_READ contents:
[   47.459579] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 		port=3D3 num_tx=3D1 id=3D80 size=3D128:
[   47.459599] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 			0: id=3D080 size=3D001 no_stop_bit=3D0 tx_delay=3D000: 00
[   47.459750] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   47.460502] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x01000 AUX <- (ret=3D 13) 21 30 09 c5 22 31=
 50 01 00 10 50 80 5c
[   47.460981] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   47.461364] nvidia 0000:01:00.0: Enabling HDA controller
[   47.461395] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   47.461405] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   47.462350] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   47.462715] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   47.462632] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   47.463140] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   47.463574] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   47.463994] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   47.463999] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   47.464796] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 20 30 2c 8c 22 03 =
80 00 ff ff ff ff ff ff 00 15
[   47.464803] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000078cc10a9 (3)
[   47.465358] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   47.465547] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   47.466045] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01410 AUX -> (ret=3D 16) c3 28 33 e1 96 ca =
01 31 21 01 04 a5 3c 22 78 fa
[   47.466772] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01420 AUX -> (ret=3D 16) d1 15 a9 54 4f a6 =
26 0d 50 54 a1 08 00 81 80 80
[   47.466777] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000078cc10a9 (2)
[   47.467183] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   47.467614] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   47.468029] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   47.468033] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   47.468484] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   47.468908] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   47.469355] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   47.469544] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   47.469697] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   47.470130] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   47.470134] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   47.470901] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 20 30 2c 07 a9 40 =
d1 00 b3 00 81 00 a9 c0 81 c0
[   47.470905] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000078cc10a9 (3)
[   47.471628] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01410 AUX -> (ret=3D 16) 01 01 4d d0 00 a0 =
f0 70 3e 80 30 20 35 00 55 50
[   47.472097] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   47.472299] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   47.472789] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01420 AUX -> (ret=3D 16) 21 00 00 1a 00 00 =
00 ff 00 33 30 30 35 34 31 9a
[   47.472795] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000078cc10a9 (2)
[   47.473205] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   47.473636] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   47.474041] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   47.474046] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   47.474492] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   47.474915] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   47.475357] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   47.475560] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   47.475715] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   47.476151] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   47.476155] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   47.476922] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 20 30 2c 07 31 33 =
0a 20 20 20 20 00 00 00 fd 00
[   47.476928] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000078cc10a9 (3)
[   47.477659] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01410 AUX -> (ret=3D 16) 1d 3d 1f 86 36 01 =
0a 20 20 20 20 20 20 00 00 00
[   47.478112] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   47.478321] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   47.478775] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01420 AUX -> (ret=3D 16) fc 00 45 56 32 37 =
34 30 58 0a 20 20 20 20 20 63
[   47.478782] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000078cc10a9 (2)
[   47.479186] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   47.479622] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   47.480030] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   47.480035] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   47.480479] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   47.480896] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   47.481357] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   47.481581] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   47.481706] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   47.482358] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   47.482363] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   47.483081] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 20 30 03 40 01 14 =
a7 00 00 00 00 00 00 00 00 00
[   47.483455] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000078cc10a9 (3)
[   47.483461] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000078cc10a9 (2)
[   47.483485] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000078cc10a9 (1)
[   47.483542] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000078cc10a9 (2)
[   47.483570] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] txmsg cur_offset=3D0 cur_len=3D8 seqno=3D0 state=3DQUEUED p=
ath_msg=3D0 dst=3D00:03
[   47.483597] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 	type=3DREMOTE_I2C_READ contents:
[   47.483619] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 		port=3D3 num_tx=3D1 id=3D80 size=3D128:
[   47.483641] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 			0: id=3D080 size=3D001 no_stop_bit=3D0 tx_delay=3D000: 80
[   47.484096] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   47.484335] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   47.484451] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   47.485204] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x01000 AUX <- (ret=3D 13) 21 30 09 c5 22 31=
 50 01 80 10 50 80 07
[   47.486580] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   47.487337] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   47.487700] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   47.487612] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   47.487706] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   47.488159] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   47.490127] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   47.491110] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   47.491458] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   47.491365] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   47.491848] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   47.491851] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   47.492611] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 20 30 2c 8c 22 03 =
80 02 03 13 f1 46 10 22 04 03
[   47.492616] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000078cc10a9 (3)
[   47.493423] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01410 AUX -> (ret=3D 16) 02 01 23 09 7f 07 =
83 01 00 00 02 3a 80 18 71 38
[   47.494693] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01420 AUX -> (ret=3D 16) 2d 40 58 2c 45 00 =
55 50 21 00 00 1e a3 66 00 a7
[   47.494697] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000078cc10a9 (2)
[   47.495357] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   47.495778] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   47.496184] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   47.496187] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   47.496622] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   47.497357] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   47.497712] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   47.497613] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   47.498362] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   47.498763] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   47.498766] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   47.499532] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 20 30 2c 07 a0 f0 =
70 1f 80 30 20 35 00 55 50 21
[   47.499535] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000078cc10a9 (3)
[   47.500100] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   47.500353] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   47.500788] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01410 AUX -> (ret=3D 16) 00 00 1a 56 5e 00 =
a0 a0 a0 29 50 30 20 35 00 55
[   47.501513] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01420 AUX -> (ret=3D 16) 50 21 00 00 1a 00 =
00 00 00 00 00 00 00 00 00 92
[   47.501517] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000078cc10a9 (2)
[   47.501940] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   47.502337] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   47.502762] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   47.502766] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   47.503199] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   47.503617] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   47.504350] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   47.504706] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   47.504604] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   47.505133] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   47.505137] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   47.505897] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 20 30 2c 07 00 00 =
00 00 00 00 00 00 00 00 00 00
[   47.505902] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000078cc10a9 (3)
[   47.506621] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01410 AUX -> (ret=3D 16) 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00
[   47.507114] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   47.507367] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   47.507796] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01420 AUX -> (ret=3D 16) 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00
[   47.507802] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000078cc10a9 (2)
[   47.508207] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   47.508645] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   47.509044] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   47.509047] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   47.509488] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   47.509911] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   47.510357] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   47.510714] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   47.510609] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   47.511130] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   47.511133] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   47.511898] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 20 30 03 40 00 29 =
58 00 00 00 00 00 00 00 00 00
[   47.511901] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000078cc10a9 (3)
[   47.511907] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000078cc10a9 (2)
[   47.511915] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000078cc10a9 (1)
[   47.511954] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_port [drm_di=
splay_helper]] port 00000000cfbe3f71 (1)
[   47.512009] i915 0000:00:02.0: [drm:update_display_info.part.0] [CONNECT=
OR:332:DP-9] Assigning EDID-1.4 digital sink color depth as 8 bpc.
[   47.512027] i915 0000:00:02.0: [drm:update_display_info.part.0] [CONNECT=
OR:332:DP-9] ELD monitor EV2740X
[   47.512032] i915 0000:00:02.0: [drm:update_display_info.part.0] [CONNECT=
OR:332:DP-9] ELD size 32, SAD count 1
[   47.512285] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   47.512415] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 47 for 64 timeslots total bw 25920000 pixel clock 5=
48463
[   47.512792] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 95 for 64 timeslots total bw 25920000 pixel clock 2=
70246
[   47.513121] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 104 for 64 timeslots total bw 25920000 pixel clock =
248389
[   47.513096] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   47.513452] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   47.513356] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 130 for 64 timeslots total bw 25920000 pixel clock =
198763
[   47.513357] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   47.513567] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 169 for 64 timeslots total bw 25920000 pixel clock =
152736
[   47.513863] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   47.513776] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 169 for 64 timeslots total bw 25920000 pixel clock =
152736
[   47.513867] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   47.513998] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 169 for 64 timeslots total bw 25920000 pixel clock =
152584
[   47.514305] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   47.514217] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 339 for 64 timeslots total bw 25920000 pixel clock =
76368
[   47.514445] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 339 for 64 timeslots total bw 25920000 pixel clock =
76292
[   47.514725] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   47.514670] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 155 for 64 timeslots total bw 25920000 pixel clock =
166621
[   47.514900] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 172 for 64 timeslots total bw 25920000 pixel clock =
150422
[   47.515143] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   47.515128] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 233 for 64 timeslots total bw 25920000 pixel clock =
111081
[   47.515353] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 233 for 64 timeslots total bw 25920000 pixel clock =
111081
[   47.515545] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   47.515548] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 00
[   47.515592] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] got hpd i=
rq on [ENCODER:306:DDI TC3/PHY TC3] - short
[   47.515578] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 301 for 64 timeslots total bw 25920000 pixel clock =
85882
[   47.515804] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 339 for 64 timeslots total bw 25920000 pixel clock =
76368
[   47.516012] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   47.516010] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 339 for 64 timeslots total bw 25920000 pixel clock =
76368
[   47.516220] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 339 for 64 timeslots total bw 25920000 pixel clock =
76292
[   47.516445] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   47.516448] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 00
[   47.516445] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 387 for 64 timeslots total bw 25920000 pixel clock =
66854
[   47.516704] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 630 for 64 timeslots total bw 25920000 pixel clock =
41141
[   47.516927] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 932 for 64 timeslots total bw 25920000 pixel clock =
27798
[   47.517124] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 932 for 64 timeslots total bw 25920000 pixel clock =
27798
[   47.517316] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 933 for 64 timeslots total bw 25920000 pixel clock =
27770
[   47.517507] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 933 for 64 timeslots total bw 25920000 pixel clock =
27770
[   47.517698] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 1000 for 64 timeslots total bw 25920000 pixel clock=
 25918
[   47.517889] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 1001 for 64 timeslots total bw 25920000 pixel clock=
 25893
[   47.518085] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 1001 for 64 timeslots total bw 25920000 pixel clock=
 25893
[   47.518293] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 889 for 64 timeslots total bw 25920000 pixel clock =
29127
[   47.518488] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:332:DP-9] probed modes:
[   47.518497] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "3840x2160": 60 533250 3840 3888 3920 4000 2160 2163 2168=
 2222 0x48 0x9
[   47.518503] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "3840x2160": 30 262750 3840 3888 3920 4000 2160 2163 2168=
 2191 0x40 0x9
[   47.518509] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "2560x1440": 60 241500 2560 2608 2640 2720 1440 1443 1448=
 1481 0x40 0x9
[   47.518514] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1920x1200": 60 193250 1920 2056 2256 2592 1200 1203 1209=
 1245 0x40 0x6
[   47.518519] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1920x1080": 60 148500 1920 2008 2052 2200 1080 1084 1089=
 1125 0x40 0x5
[   47.518524] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1920x1080": 60 148500 1920 2008 2052 2200 1080 1084 1089=
 1125 0x40 0x5
[   47.518529] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1920x1080": 60 148352 1920 2008 2052 2200 1080 1084 1089=
 1125 0x40 0x5
[   47.518534] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1920x1080": 30 74250 1920 2008 2052 2200 1080 1084 1089 =
1125 0x40 0x5
[   47.518539] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1920x1080": 30 74176 1920 2008 2052 2200 1080 1084 1089 =
1125 0x40 0x5
[   47.518544] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1600x1200": 60 162000 1600 1664 1856 2160 1200 1201 1204=
 1250 0x40 0x5
[   47.518549] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1680x1050": 60 146250 1680 1784 1960 2240 1050 1053 1059=
 1089 0x40 0x6
[   47.518554] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1600x900": 60 108000 1600 1624 1704 1800 900 901 904 100=
0 0x40 0x5
[   47.518559] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1280x1024": 60 108000 1280 1328 1440 1688 1024 1025 1028=
 1066 0x40 0x5
[   47.518564] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1280x800": 60 83500 1280 1352 1480 1680 800 803 809 831 =
0x40 0x6
[   47.518569] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1280x720": 60 74250 1280 1390 1430 1650 720 725 730 750 =
0x40 0x5
[   47.518574] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1280x720": 60 74250 1280 1390 1430 1650 720 725 730 750 =
0x40 0x5
[   47.518579] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1280x720": 60 74176 1280 1390 1430 1650 720 725 730 750 =
0x40 0x5
[   47.518584] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1024x768": 60 65000 1024 1048 1184 1344 768 771 777 806 =
0x40 0xa
[   47.518588] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "800x600": 60 40000 800 840 968 1056 600 601 605 628 0x40=
 0x5
[   47.518594] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "720x480": 60 27027 720 736 798 858 480 489 495 525 0x40 =
0xa
[   47.518599] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "720x480": 60 27027 720 736 798 858 480 489 495 525 0x40 =
0xa
[   47.518604] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "720x480": 60 27000 720 736 798 858 480 489 495 525 0x40 =
0xa
[   47.518608] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "720x480": 60 27000 720 736 798 858 480 489 495 525 0x40 =
0xa
[   47.518613] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "640x480": 60 25200 640 656 752 800 480 490 492 525 0x40 =
0xa
[   47.518618] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "640x480": 60 25175 640 656 752 800 480 490 492 525 0x40 =
0xa
[   47.518623] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "640x480": 60 25175 640 656 752 800 480 490 492 525 0x40 =
0xa
[   47.518628] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "720x400": 70 28320 720 738 846 900 400 412 414 449 0x40 =
0x6
[   47.518635] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:334:DP-10]
[   47.518644] i915 0000:00:02.0: [drm:drm_dp_mst_topology_get_port_validat=
ed [drm_display_helper]] port 00000000a1faa806 (2)
[   47.518668] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_port [drm_di=
splay_helper]] port 00000000a1faa806 (1)
[   47.518690] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:334:DP-10] disconnected
[   47.518696] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:262:eDP-1] enabled? yes
[   47.518703] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:271:DP-1] enabled? no
[   47.518707] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:283:HDMI-A-1] enabled? no
[   47.518712] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:289:DP-2] enabled? no
[   47.518716] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:298:DP-3] enabled? no
[   47.518720] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:307:DP-4] enabled? no
[   47.518724] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:316:DP-5] enabled? no
[   47.518728] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:324:DP-6] enabled? no
[   47.518732] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:328:DP-7] enabled? no
[   47.518736] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:330:DP-8] enabled? no
[   47.518740] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:332:DP-9] enabled? yes
[   47.518743] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:334:DP-10] enabled? no
[   47.518759] i915 0000:00:02.0: [drm:drm_client_modeset_probe] Not using =
firmware configuration
[   47.518766] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:262:eDP-1] found preferred mode: 3840x2400
[   47.518771] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:332:DP-9] found preferred mode: 3840x2160
[   47.518776] i915 0000:00:02.0: [drm:drm_client_modeset_probe] picking CR=
TCs for 3840x2400 config
[   47.518787] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CRTC:88:p=
ipe A] desired mode 3840x2400 set (0,0)
[   47.518792] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CRTC:145:=
pipe B] desired mode 3840x2160 set (0,0)
[   47.534241] i915 0000:00:02.0: [drm:drm_client_hotplug] fbdev: ret=3D0
[   47.541093] i915 0000:00:02.0: [drm:intel_power_well_disable [i915]] dis=
abling AUX_TC3
[   47.776319] usb 6-1.4.3: new SuperSpeed Plus Gen 2x1 USB device number 4=
 using xhci_hcd
[   47.794994] usb 6-1.4.3: New USB device found, idVendor=3D17ef, idProduc=
t=3D3112, bcdDevice=3D 2.b3
[   47.795000] usb 6-1.4.3: New USB device strings: Mfr=3D1, Product=3D2, S=
erialNumber=3D0
[   47.795002] usb 6-1.4.3: Product: Lenovo Dock - USB3 Hub2
[   47.795004] usb 6-1.4.3: Manufacturer: Lenovo                =20
[   47.796283] hub 6-1.4.3:1.0: USB hub found
[   47.797206] hub 6-1.4.3:1.0: 4 ports detected
[   47.869202] usb 6-1.4.4: new SuperSpeed USB device number 5 using xhci_h=
cd
[   47.881436] usb 6-1.4.4: New USB device found, idVendor=3D0bda, idProduc=
t=3D8156, bcdDevice=3D31.21
[   47.881441] usb 6-1.4.4: New USB device strings: Mfr=3D1, Product=3D2, S=
erialNumber=3D6
[   47.881443] usb 6-1.4.4: Product: USB 10/100/1G/2.5G LAN
[   47.881445] usb 6-1.4.4: Manufacturer: Realtek
[   47.881447] usb 6-1.4.4: SerialNumber: 1213001E4E
[   47.977027] usbcore: registered new device driver r8152-cfgselector
[   48.047501] r8152-cfgselector 6-1.4.4: reset SuperSpeed USB device numbe=
r 5 using xhci_hcd
[   48.119450] r8152 6-1.4.4:1.0 eth0: v1.12.13
[   48.119494] usbcore: registered new interface driver r8152
[   48.128120] usbcore: registered new interface driver cdc_ether
[   48.131946] usbcore: registered new interface driver cdc_ncm
[   48.136096] usbcore: registered new interface driver cdc_wdm
[   48.139359] usbcore: registered new interface driver cdc_mbim
[   48.230031] r8152 6-1.4.4:1.0 enp177s0u1u4u4: renamed from eth0
[   48.478125] i915 0000:00:02.0: [drm:intel_tc_port_update_mode [i915]] Po=
rt G/TC#4: TC port mode reset (legacy -> disconnected)
[   48.478188] i915 0000:00:02.0: [drm:intel_tc_port_update_mode [i915]] Po=
rt E/TC#2: TC port mode reset (tbt-alt -> disconnected)
[   48.478257] i915 0000:00:02.0: [drm:intel_tc_port_update_mode [i915]] Po=
rt D/TC#1: TC port mode reset (tbt-alt -> disconnected)
[   49.245184] i915 0000:00:02.0: [drm:intel_power_well_enable [i915]] enab=
ling AUX_TC3
[   49.247548] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00202 AUX -> (ret=3D  6) 77 77 01 00 11 11
[   49.349127] i915 0000:00:02.0: [drm:intel_power_well_disable [i915]] dis=
abling AUX_TC3
[   49.949123] i915 0000:00:02.0: [drm:intel_pps_vdd_off_sync_unlocked [i91=
5]] [ENCODER:261:DDI A/PHY A] PPS 0 turning VDD off
[   49.949412] i915 0000:00:02.0: [drm:intel_pps_vdd_off_sync_unlocked [i91=
5]] [ENCODER:261:DDI A/PHY A] PPS 0 PP_STATUS: 0x80000008 PP_CONTROL: 0x000=
00067

--trwjxa2f3jbt3y4c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="bandwidth.out"

[Thunderbolt/USB4 Info]:
TBHost0:
	Adapter:DP IN-5
		Tunnel    : inactive
	Adapter:DP IN-6
		Tunnel    : inactive
TBHost1:
	Adapter:DP IN-5
Warning: register name ADP_CS_2 not found!
Error: unsupported adapter type: 0x0

--trwjxa2f3jbt3y4c--

--a3lwmf7g4v7vvfk2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iNUEABYKAH0WIQQFx3danouXdAf+COadTFqhVCbaCgUCaQht018UgAAAAAAuAChp
c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0MDVD
Nzc3NUE5RThCOTc3NDA3RkUwOEU2OUQ0QzVBQTE1NDI2REEwQQAKCRCdTFqhVCba
CjVIAPwLybfPzPCTKyFUDA0Upml40Ai1C9zwsLAy50hh089rBgEAkUKalqmqogDE
sIy9kaFE7oQPW+CdHm2vbXtXP7bZzA0=
=jKZT
-----END PGP SIGNATURE-----

--a3lwmf7g4v7vvfk2--

