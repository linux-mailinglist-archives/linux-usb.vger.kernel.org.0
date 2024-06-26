Return-Path: <linux-usb+bounces-11672-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36793917D6F
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 12:12:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7E5F1F23F20
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 10:12:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FB25176ABF;
	Wed, 26 Jun 2024 10:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n4gGCt8L"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB35115B57D
	for <linux-usb@vger.kernel.org>; Wed, 26 Jun 2024 10:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719396772; cv=none; b=jtwAbryYXqUQeWP4SM+NSxMcfs//UbSTvHkt2wuoihn4oBufgygLNh5PBVieL1hI6OgAw/b3rI9NDrL9ircTEGAtEvaKsnPs24Tgf6J5Dl4xoxvyzjGpo7zXP1dH1YcCEtYMfixJjul16rPUYGpuxTJJRd3bT4QzcvaZYGuEZow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719396772; c=relaxed/simple;
	bh=HC2VsvH2UBWGUBczPwg21FN6JFYp9CajbpHEtAqChVU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NbcPZfbmPsmrrqRYk93LvJkhyOujs2UXSQRyChUd1xY969y+jGIqAQz6MythayIOn4ImKIA76yjUkDH/DwA+kxlxIbUN0BstuEV/CI5whGYt2mhr1mL0zpDrPg+MUzYGu5/wHffbk4SHh+9rYptwjydLvup2D4MMHHu/W5gY454=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n4gGCt8L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3D7C6C32789
	for <linux-usb@vger.kernel.org>; Wed, 26 Jun 2024 10:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719396772;
	bh=HC2VsvH2UBWGUBczPwg21FN6JFYp9CajbpHEtAqChVU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=n4gGCt8LQ728Zn9RGe+2alFnWOe3JRBK5n2jWCdBXYJTy1d4jgEBFZzgx/1sOsaaL
	 8uGF+g6XxIX+rJcNH8qrGpK69SveD0KZ1QVTAnpJwDpYdy2wg7JU6JPLgDexLdy2jF
	 B1n/v7ZnmikBj3J142r7u6l7Lj8gvbzljXukPfmapbmg+mS3VgVPMKwaepfyMcIjul
	 U6VcXk0QztPgS7E30cR4ffhQakJNRXWZg2LcDQdhJgKv6AiL517unuRJfyzNkc3ChL
	 M7BPBO6eYiC3cDF+42PvXCxmq9YMRTnQK3LjYojOyxj/sq8z0o4FYZkFrXmv2uwaJV
	 DDmvfLNr3BFbg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 25897C53B73; Wed, 26 Jun 2024 10:12:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218987] USB devices are not detected after Save/Restore error
 on Intel xHC
Date: Wed, 26 Jun 2024 10:12:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: repk@triplefau.lt
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218987-208809-hJtjZifNjX@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218987-208809@https.bugzilla.kernel.org/>
References: <bug-218987-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218987

--- Comment #4 from Remi Pommarel (repk@triplefau.lt) ---
Thanks for looking into this issue.

(In reply to Mathias Nyman from comment #3)
...
> Issue 2 is probably due to PORTSC not immediately showing connected devic=
es
> after host is restarted. This is especially true for USB3 devices where
> device only shows up in PORTSC after successful link training.=20=20=20

Weirdly enough this issue seems to happen only on the USB 2.0 root hub part=
 of
the port not the USB 3.0 one. I first tried to add delay to see if my port
events showed but no luck on that. Anyway that does not matter much.

> How about a solution that is similar to your patch but doesn't touch
> pending_portevent. Instead we always resume roothubs in case xHC was reset
> during resume.
>=20
> Does the oneliner below work for you?

Yes it works. While I did initially try that, I switched to pending_porteve=
nt
patch version to avoid unneeded xhci_pending_portevent() and msleep(120) ca=
lls.
But both are very fine with me.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

