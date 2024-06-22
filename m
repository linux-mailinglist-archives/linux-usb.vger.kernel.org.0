Return-Path: <linux-usb+bounces-11549-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B90839131A7
	for <lists+linux-usb@lfdr.de>; Sat, 22 Jun 2024 04:36:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBAB41C21B12
	for <lists+linux-usb@lfdr.de>; Sat, 22 Jun 2024 02:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF13B79F9;
	Sat, 22 Jun 2024 02:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oFraftUG"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5A179DF
	for <linux-usb@vger.kernel.org>; Sat, 22 Jun 2024 02:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719023779; cv=none; b=uZj8CDclZG7jO1V4p/RNbKnOP12rsc4IDWt7aP8kxQGYwElU2Rk7vdG/jJVUVFMD6B120FNxZrBHogfBBWGcZFpbLGFb/oU3XYIYOwvz+Ixp+89ctmMey+rv8DkS1DZXrZs4hxBARnMG5sCNmlpwDv/4EhXJ0GywnhVbHZk5kbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719023779; c=relaxed/simple;
	bh=TnDoEE0OHHBCCLROYVVevQ17TdtECzAP5nqXLuVC7o0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lmhcR9ZVhkGdAPj/n2N6bv+mNyS4ScVkfmEygCjuggWvHtcqMHVsCtGz1GAMShQsTKVGDgwEj05ktGhwapEiFh+MPUGFe/RY3JIhfhirM62P1NauDkUhjcRJRYEsWOe9BvPt/P4uBWsfZC5Ofu6uQzcSpgBX5RGOcII3BqYGokU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oFraftUG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DD026C2BBFC
	for <linux-usb@vger.kernel.org>; Sat, 22 Jun 2024 02:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719023778;
	bh=TnDoEE0OHHBCCLROYVVevQ17TdtECzAP5nqXLuVC7o0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=oFraftUGDTvwWjNyQNzzRqZxOdREiNaFVF05fs9EHelaGMicgW0LkLqnerM+RIeE9
	 K3kitzvz2QLGxaJyz31a82/jSuaEMV7kIgZ5ssU4RExij9yX9xRo4uzn8md7TOC3u1
	 cEiHKpE4+1OwHzL7hPmu3M6AjxnycbB/A3nHJtjr7qe1WSy0B3pgaSyCMlgHkEg977
	 +UqGjuVwSlwrb+8heRgnm3qplh/ha9ODBb3uRkvLFfXjpkb2xkbMLlusdgyDiRmbd3
	 pbK7TNzTVNzS/BL+jLYQxB6m3myzt7RgaWBp+spFpBP0QmPcd3wCDFsMPOq2Hsl+St
	 TIxQ57YPqOpXw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CA038C53B7E; Sat, 22 Jun 2024 02:36:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218943] No SuperSpeedPlus on AM4/5 Hubs
Date: Sat, 22 Jun 2024 02:36:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jarrard@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218943-208809-UkF4n3xpTq@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218943-208809@https.bugzilla.kernel.org/>
References: <bug-218943-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D218943

--- Comment #34 from Jarrard (jarrard@proton.me) ---
(In reply to Thinh.Nguyen from comment #33)
> On Fri, Jun 21, 2024, bugzilla-daemon@kernel.org wrote:
> >
> >
> https://urldefense.com/v3/__https://bugzilla.kernel.org/show_bug.cgi?id=
=3D218943__;!!A4F2R9G_pg!fODPpvu8QMI1SH2NW38mJgNxScddtxlr7-FRbFln8qt4ISm6Ib=
7P6OXrtb1YRRyf5zD7koRGYGLNbyWW0Ts_xUuGkHNHpFhB$=20
> >=20

>=20
> It'd be better for the vendor to provide the support and patches to
> resolve this since they have the knowledge and the tools to debug their
> hardware.
>=20
> I can only provide clues for whoever needs to proceed further.
>=20
> BR,
> Thinh


I cannot modify my posts so where I say AsMedia I actually meant AverMedia.=
=20

Also I talked to the vendor and they do not support linux and that was the =
end
of it.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

