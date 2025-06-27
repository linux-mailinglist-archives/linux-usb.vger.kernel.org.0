Return-Path: <linux-usb+bounces-25187-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66100AEBCBC
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 18:01:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FAD417C20D
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 16:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3336C2750E7;
	Fri, 27 Jun 2025 16:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="twpIPONP"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23CC192D8A
	for <linux-usb@vger.kernel.org>; Fri, 27 Jun 2025 16:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751040100; cv=none; b=fiCHnqNWPgkbAAJrXjjA1dp+fBmBudA1OMtz/zyd3tVgY2UGS+N24hdLALkUuNJXQ7yYIfLKmSZmdKmSAc3SDPrr7V/7f7sx6AdiKF7n0fvca5++4ZiQ4qzyq1JS4YLd+yjZ9+98yhyMcOaxwwmTpppF1WiPsr2GMnfpC51Omus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751040100; c=relaxed/simple;
	bh=QCWmwzOHe/GFyzlNQxwUNSRsGVXL2l3dwZTwE86C9MY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dPiB4L0l8Q9aNuCgvTLp4TvVuQDoKiuND8It77zyeb8GTkdlw8M++6AI/cU+VgW2tRD1kCgDld3id1A7YiaFPloD9Mttuf0OezdnD+0+jSSP4BmnyW2zc3iM2pGrdfxV6GcA1xgmRq/yaqLolvoPDI5DgdqbH8zRY2CvjNzMFNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=twpIPONP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14312C4CEE3;
	Fri, 27 Jun 2025 16:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751040100;
	bh=QCWmwzOHe/GFyzlNQxwUNSRsGVXL2l3dwZTwE86C9MY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=twpIPONP+wr2Vq5/jUEHrVb+Dq8auQqEbjrY3JyjZIXwSPkzx+75+Jd59nND9rPz2
	 91B0nLv47DeZz0kSWKiuxB70N3d9V/yt9+/TyE97/bRtRLo8mN0Lx2DOamst2Uy6YN
	 TqWCBcYDW/Ispprtu+fhMYVlBbyWbQW7Ehu7tQ2/oMFCbBpxK4gdISOAKwLPGJnabu
	 /XVIgoyf1RveLlBr/wDMHOvCH6eBdV7H8e/c842npjCmDVlwuny9dBU97QGJqIdgcP
	 ByCG2cQlDjo0aMrpzmBAR7RDEWTfRcdFuSZJFkaUATV1q2WA/ikJy5aJPIp2BzLVfX
	 Y1YrRugHPJVJg==
Date: Fri, 27 Jun 2025 17:01:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	stern@rowland.harvard.edu, oneukum@suse.com,
	konrad.dybcio@oss.qualcomm.com, stable@kernel.org
Subject: Re: [PATCH 1/1] usb: hub: Fix flushing and scheduling of delayed
 work that tunes runtime pm
Message-ID: <223b71b4-819b-4e9f-a274-b08fa14c3f89@sirena.org.uk>
References: <20250626130102.3639861-1-mathias.nyman@linux.intel.com>
 <20250626130102.3639861-2-mathias.nyman@linux.intel.com>
 <aF5rNp1l0LWITnEB@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a6V4Xgchyn1WUX3x"
Content-Disposition: inline
In-Reply-To: <aF5rNp1l0LWITnEB@finisterre.sirena.org.uk>
X-Cookie: Avoid contact with eyes.


--a6V4Xgchyn1WUX3x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 27, 2025 at 10:58:18AM +0100, Mark Brown wrote:

> I'm seeing NFS boot failures on the Raspberry Pi 3B+ in pending-fixes
> which bisect to this commit.  The networking fails to come up so the
> rootfs can't be mounted, the ethernet on these boards is USB based.

JFTR I also seem to be seeing similar NFS root failures from this on the
Libretech Alta:

  https://lava.sirena.org.uk/scheduler/job/1519029#L1770

I'll follow up if the previously posted fix doesn't also work here,
unfortunately the firmware has innovated in the field of reliable
networking (hence why the report turned up six hours later) so it's kind
of annoying to get test results.

Bisect:

# bad: [d427f8d7f886d8f8a04b5428576eae768b4d82df] Merge branch 'for-linux-next-fixes' of https://gitlab.freedesktop.org/drm/misc/kernel.git
# good: [f02769e7f272d6f42b9767f066c5a99afd2338f3] Merge tag 'devicetree-fixes-for-6.16-1' of git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux
# good: [6c038b58a2dc5a008c7e7a1297f5aaa4deaaaa7e] ASoC: SOF: Intel: hda: Use devm_kstrdup() to avoid memleak.
# good: [dc6458ed95e40146699f9c523e34cb13ff127170] ASoC: amd: ps: fix for soundwire failures during hibernation exit sequence
# good: [ff21a6ec0f27c126db0a86d96751bd6e5d1d9874] ASoC: rt721-sdca: fix boost gain calculation error
# good: [bf39286adc5e10ce3e32eb86ad316ae56f3b52a0] ASoC: amd: yc: Add DMI quirk for Lenovo IdeaPad Slim 5 15
git bisect start 'd427f8d7f886d8f8a04b5428576eae768b4d82df' 'f02769e7f272d6f42b9767f066c5a99afd2338f3' '6c038b58a2dc5a008c7e7a1297f5aaa4deaaaa7e' 'dc6458ed95e40146699f9c523e34cb13ff127170' 'ff21a6ec0f27c126db0a86d96751bd6e5d1d9874' 'bf39286adc5e10ce3e32eb86ad316ae56f3b52a0'
# test job: [6c038b58a2dc5a008c7e7a1297f5aaa4deaaaa7e] https://lava.sirena.org.uk/scheduler/job/1508063
# test job: [dc6458ed95e40146699f9c523e34cb13ff127170] https://lava.sirena.org.uk/scheduler/job/1500817
# test job: [ff21a6ec0f27c126db0a86d96751bd6e5d1d9874] https://lava.sirena.org.uk/scheduler/job/1506669
# test job: [bf39286adc5e10ce3e32eb86ad316ae56f3b52a0] https://lava.sirena.org.uk/scheduler/job/1497137
# test job: [d427f8d7f886d8f8a04b5428576eae768b4d82df] https://lava.sirena.org.uk/scheduler/job/1516563
# bad: [d427f8d7f886d8f8a04b5428576eae768b4d82df] Merge branch 'for-linux-next-fixes' of https://gitlab.freedesktop.org/drm/misc/kernel.git
git bisect bad d427f8d7f886d8f8a04b5428576eae768b4d82df
# test job: [d33699368307488766936aaaddc54dca2e7d16e6] https://lava.sirena.org.uk/scheduler/job/1517049
# bad: [d33699368307488766936aaaddc54dca2e7d16e6] Merge branch 'libcrypto-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git
git bisect bad d33699368307488766936aaaddc54dca2e7d16e6
# test job: [3cef1fa2e5ab778fac013758696f467a59c62a59] https://lava.sirena.org.uk/scheduler/job/1517137
# good: [3cef1fa2e5ab778fac013758696f467a59c62a59] Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git
git bisect good 3cef1fa2e5ab778fac013758696f467a59c62a59
# test job: [cb6b43d5b6dcae418cdda3ed43324f8545fd6f05] https://lava.sirena.org.uk/scheduler/job/1518260
# bad: [cb6b43d5b6dcae418cdda3ed43324f8545fd6f05] Merge branch 'usb-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git
git bisect bad cb6b43d5b6dcae418cdda3ed43324f8545fd6f05
# test job: [af4db5a35a4ef7a68046883bfd12468007db38f1] https://lava.sirena.org.uk/scheduler/job/1518624
# good: [af4db5a35a4ef7a68046883bfd12468007db38f1] usb: typec: altmodes/displayport: do not index invalid pin_assignments
git bisect good af4db5a35a4ef7a68046883bfd12468007db38f1
# test job: [09812134071b3941fb81def30b61ed36d3a5dfb5] https://lava.sirena.org.uk/scheduler/job/1518720
# good: [09812134071b3941fb81def30b61ed36d3a5dfb5] dt-bindings: serial: 8250: Make clocks and clock-frequency exclusive
git bisect good 09812134071b3941fb81def30b61ed36d3a5dfb5
# test job: [5d843d4194975b2c21cf2e982bdc150f91b665c0] https://lava.sirena.org.uk/scheduler/job/1518763
# good: [5d843d4194975b2c21cf2e982bdc150f91b665c0] Merge branch 'tty-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git
git bisect good 5d843d4194975b2c21cf2e982bdc150f91b665c0
# test job: [a49e1e2e785fb3621f2d748581881b23a364998a] https://lava.sirena.org.uk/scheduler/job/1519029
# bad: [a49e1e2e785fb3621f2d748581881b23a364998a] usb: hub: Fix flushing and scheduling of delayed work that tunes runtime pm
git bisect bad a49e1e2e785fb3621f2d748581881b23a364998a
# test job: [099cf1fbb8afc3771f408109f62bdec66f85160e] https://lava.sirena.org.uk/scheduler/job/1519034
# good: [099cf1fbb8afc3771f408109f62bdec66f85160e] usb: typec: displayport: Fix potential deadlock
git bisect good 099cf1fbb8afc3771f408109f62bdec66f85160e
# first bad commit: [a49e1e2e785fb3621f2d748581881b23a364998a] usb: hub: Fix flushing and scheduling of delayed work that tunes runtime pm

--a6V4Xgchyn1WUX3x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhewF8ACgkQJNaLcl1U
h9AfNgf+NKkW6LiF53iHLrjVIcfZTQ0Sln59gmtf8euxajCTV63bvoNWFPnkh+EI
swGtztS21tUImDVHpHJOdeNGnOXOcXEHAnO8c6Zp6XCEx9paqggnEBAkJOGev4jC
G3tdQtysuUnU0PrLM1dwSqxOFagQhXdxyIxM6dL7Y1/dkWEyafKnywvrqR7hlcw0
B2EHro6SYJz0zSnBDwU8DSH1gvOxllmc0mpup/lqVqHZj9H0RBPvR8k5yqMKJqDf
LBXtc9rgRgy5lRFBYykR3vb4dhP8hTODN/mbn8qpFlYc/+xVb2y6WWSHsE7LF4TG
oV1wV21zmZgJ22jwQw2pdmdPg04bOA==
=4vjm
-----END PGP SIGNATURE-----

--a6V4Xgchyn1WUX3x--

