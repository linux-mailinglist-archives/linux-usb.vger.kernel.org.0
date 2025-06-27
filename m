Return-Path: <linux-usb+bounces-25147-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BA8AEB380
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 11:58:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9221A563326
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 09:58:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9496295DB4;
	Fri, 27 Jun 2025 09:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UwyZdyQW"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E806293B4F
	for <linux-usb@vger.kernel.org>; Fri, 27 Jun 2025 09:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751018299; cv=none; b=Y4ZnLYoLLcHF2MhyAzodKNpT+SFDgRkE4MGYG6yuQS/RM+s6/EBGXz4SLgp/lx0/wXH/os+faU+R9EwVPdnr4jRFReuZKk69aEmZpOHJr5DgCgDXUV2eEwngarU9yr0ML1VO7VEPM/LaHPq8k4BEUjGATNObD1+niBPakOOmnik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751018299; c=relaxed/simple;
	bh=w4IdK+lSAFaJXXFcWJA0l7hSByndel6p85oP4qaP2gs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kcsAI59TQb29wC4uotNjvAOWFIGNdvtoLZK7p6Ml6YGYyz1dKivCvr2eo5KnZSYKNKSnA0IDCzZ+OT6AxQ58R+rMjmI97Vy+s7eyrPMQ8MOs97E3h3z+DV0dlnXtxBxRHIrksqv3Q1aSdXiOieghueeJ9BBkJ6JfKNhF42aIhp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UwyZdyQW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A778C4CEF0;
	Fri, 27 Jun 2025 09:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751018298;
	bh=w4IdK+lSAFaJXXFcWJA0l7hSByndel6p85oP4qaP2gs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UwyZdyQWVLhKDMU76KDhjHMgAwXsXzU3wpWpcvNcQu6GnKqWzsbruiTlo2YK0zO6J
	 INh7Ye4lpCRlOUu/0KR9EhHeKLE1zD89g8tOSfaxYLf6Z1Zz0+6MwZiFOD5wI24lTC
	 Ny0oPdeeZZiN/p+AUx8EJFbayWb67v9mvJ6x6cfeVwb221DBeZhzHzFLi6xNPudIlK
	 0iHG+KmvUl+KcIZ+JmCLUn4mm4ZobCjxwstB9V4HwjAJSjVge56j+J420SuJxaqepZ
	 UW93wtCsc6AYWRKhiU6Wuy6KbclTghBpKjI/sYVT1gYeaRmKtXa3yzUopFOPuF6Uv1
	 pTvCzdBlVKN7g==
Date: Fri, 27 Jun 2025 10:58:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	stern@rowland.harvard.edu, oneukum@suse.com,
	konrad.dybcio@oss.qualcomm.com, stable@kernel.org
Subject: Re: [PATCH 1/1] usb: hub: Fix flushing and scheduling of delayed
 work that tunes runtime pm
Message-ID: <aF5rNp1l0LWITnEB@finisterre.sirena.org.uk>
References: <20250626130102.3639861-1-mathias.nyman@linux.intel.com>
 <20250626130102.3639861-2-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4GM8PF0PEGT3vpa0"
Content-Disposition: inline
In-Reply-To: <20250626130102.3639861-2-mathias.nyman@linux.intel.com>
X-Cookie: Expedience is the best teacher.


--4GM8PF0PEGT3vpa0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 26, 2025 at 04:01:02PM +0300, Mathias Nyman wrote:
> Delayed work to prevent USB3 hubs from runtime-suspending immediately
> after resume was added in commit 8f5b7e2bec1c ("usb: hub: fix detection
> of high tier USB3 devices behind suspended hubs").
>=20
> This delayed work needs be flushed if system suspends, or hub needs to
> be quiesced for other reasons right after resume. Not flushing it
> triggered issues on QC SC8280XP CRD board during suspend/resume testing.
>=20
> Fix it by flushing the delayed resume work in hub_quiesce()

I'm seeing NFS boot failures on the Raspberry Pi 3B+ in pending-fixes
which bisect to this commit.  The networking fails to come up so the
rootfs can't be mounted, the ethernet on these boards is USB based.

Full log:

   https://lava.sirena.org.uk/scheduler/job/1516948#L1142

Bisect log:

# bad: [d427f8d7f886d8f8a04b5428576eae768b4d82df] Merge branch 'for-linux-n=
ext-fixes' of https://gitlab.freedesktop.org/drm/misc/kernel.git
# good: [f02769e7f272d6f42b9767f066c5a99afd2338f3] Merge tag 'devicetree-fi=
xes-for-6.16-1' of git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux
# good: [bf39286adc5e10ce3e32eb86ad316ae56f3b52a0] ASoC: amd: yc: Add DMI q=
uirk for Lenovo IdeaPad Slim 5 15
# good: [6c038b58a2dc5a008c7e7a1297f5aaa4deaaaa7e] ASoC: SOF: Intel: hda: U=
se devm_kstrdup() to avoid memleak.
# good: [ff21a6ec0f27c126db0a86d96751bd6e5d1d9874] ASoC: rt721-sdca: fix bo=
ost gain calculation error
# good: [dc6458ed95e40146699f9c523e34cb13ff127170] ASoC: amd: ps: fix for s=
oundwire failures during hibernation exit sequence
git bisect start 'd427f8d7f886d8f8a04b5428576eae768b4d82df' 'f02769e7f272d6=
f42b9767f066c5a99afd2338f3' 'bf39286adc5e10ce3e32eb86ad316ae56f3b52a0' '6c0=
38b58a2dc5a008c7e7a1297f5aaa4deaaaa7e' 'ff21a6ec0f27c126db0a86d96751bd6e5d1=
d9874' 'dc6458ed95e40146699f9c523e34cb13ff127170'
# test job: [bf39286adc5e10ce3e32eb86ad316ae56f3b52a0] https://lava.sirena.=
org.uk/scheduler/job/1497128
# test job: [6c038b58a2dc5a008c7e7a1297f5aaa4deaaaa7e] https://lava.sirena.=
org.uk/scheduler/job/1508039
# test job: [ff21a6ec0f27c126db0a86d96751bd6e5d1d9874] https://lava.sirena.=
org.uk/scheduler/job/1506606
# test job: [dc6458ed95e40146699f9c523e34cb13ff127170] https://lava.sirena.=
org.uk/scheduler/job/1499810
# test job: [d427f8d7f886d8f8a04b5428576eae768b4d82df] https://lava.sirena.=
org.uk/scheduler/job/1516135
# bad: [d427f8d7f886d8f8a04b5428576eae768b4d82df] Merge branch 'for-linux-n=
ext-fixes' of https://gitlab.freedesktop.org/drm/misc/kernel.git
git bisect bad d427f8d7f886d8f8a04b5428576eae768b4d82df
# test job: [d33699368307488766936aaaddc54dca2e7d16e6] https://lava.sirena.=
org.uk/scheduler/job/1516393
# bad: [d33699368307488766936aaaddc54dca2e7d16e6] Merge branch 'libcrypto-f=
ixes' of git://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git
git bisect bad d33699368307488766936aaaddc54dca2e7d16e6
# test job: [3cef1fa2e5ab778fac013758696f467a59c62a59] https://lava.sirena.=
org.uk/scheduler/job/1516449
# good: [3cef1fa2e5ab778fac013758696f467a59c62a59] Merge branch 'for-linus'=
 of git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git
git bisect good 3cef1fa2e5ab778fac013758696f467a59c62a59
# test job: [cb6b43d5b6dcae418cdda3ed43324f8545fd6f05] https://lava.sirena.=
org.uk/scheduler/job/1516670
# bad: [cb6b43d5b6dcae418cdda3ed43324f8545fd6f05] Merge branch 'usb-linus' =
of git://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git
git bisect bad cb6b43d5b6dcae418cdda3ed43324f8545fd6f05
# test job: [af4db5a35a4ef7a68046883bfd12468007db38f1] https://lava.sirena.=
org.uk/scheduler/job/1516809
# good: [af4db5a35a4ef7a68046883bfd12468007db38f1] usb: typec: altmodes/dis=
playport: do not index invalid pin_assignments
git bisect good af4db5a35a4ef7a68046883bfd12468007db38f1
# test job: [09812134071b3941fb81def30b61ed36d3a5dfb5] https://lava.sirena.=
org.uk/scheduler/job/1516835
# good: [09812134071b3941fb81def30b61ed36d3a5dfb5] dt-bindings: serial: 825=
0: Make clocks and clock-frequency exclusive
git bisect good 09812134071b3941fb81def30b61ed36d3a5dfb5
# test job: [5d843d4194975b2c21cf2e982bdc150f91b665c0] https://lava.sirena.=
org.uk/scheduler/job/1516926
# good: [5d843d4194975b2c21cf2e982bdc150f91b665c0] Merge branch 'tty-linus'=
 of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git
git bisect good 5d843d4194975b2c21cf2e982bdc150f91b665c0
# test job: [a49e1e2e785fb3621f2d748581881b23a364998a] https://lava.sirena.=
org.uk/scheduler/job/1517035
# bad: [a49e1e2e785fb3621f2d748581881b23a364998a] usb: hub: Fix flushing an=
d scheduling of delayed work that tunes runtime pm
git bisect bad a49e1e2e785fb3621f2d748581881b23a364998a
# test job: [099cf1fbb8afc3771f408109f62bdec66f85160e] https://lava.sirena.=
org.uk/scheduler/job/1517048
# good: [099cf1fbb8afc3771f408109f62bdec66f85160e] usb: typec: displayport:=
 Fix potential deadlock
git bisect good 099cf1fbb8afc3771f408109f62bdec66f85160e
# first bad commit: [a49e1e2e785fb3621f2d748581881b23a364998a] usb: hub: Fi=
x flushing and scheduling of delayed work that tunes runtime pm

--4GM8PF0PEGT3vpa0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmheazMACgkQJNaLcl1U
h9Cbnwf/SUbdcaqo+1CJB4llbb8olADVu3QMxFzaPXVqRJ9u4wdpRRjDltJK8Px/
La1RmAvDadyK3gYfvxIA78h8LZppz/Q2EoaSc3Z3HocwmZLffg+ws0gsPnc0Kq5W
JDt/yLcI6glDrWJOJ/NzHVQtKZu7EpVWLBlXp97LPl4xW7xTNvFMAH+c2vOi/Tgd
OPwv7ZrKTUxzrgrcaCgIpMP5eU5mn/l8/Uok65n2AVTUl/xOTkO5eVAV9uSgugz0
mpBhBQL4eBi5UYxWyx74lYIM8VX8PTOUA9MB5vQZgNcwnobQPuurd0IlDP4IzM2Q
ZQAxzGIq7MwqvZa+luf8BOW+Rb8iZA==
=ktzv
-----END PGP SIGNATURE-----

--4GM8PF0PEGT3vpa0--

