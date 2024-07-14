Return-Path: <linux-usb+bounces-12196-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EB19309E2
	for <lists+linux-usb@lfdr.de>; Sun, 14 Jul 2024 14:15:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B216D1C209EE
	for <lists+linux-usb@lfdr.de>; Sun, 14 Jul 2024 12:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FAEA6BFCF;
	Sun, 14 Jul 2024 12:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IIUHACSs"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67641095B
	for <linux-usb@vger.kernel.org>; Sun, 14 Jul 2024 12:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720959322; cv=none; b=OFGlcPlN0ks2qKAYUumPksepnfYzPQW8z3HKGqNsnhuYbK+kYgMviI8aiZmhwRswVfVtG8fEbQi6EYk3ZvUKsl49ME22zGTfwE3JN+nSPOoDJWgZZ7WliEtIjjIJOHHODyJG0RBuwdtc+km4/Fj2sGuPKo9TNJIj4woPYtw625Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720959322; c=relaxed/simple;
	bh=Qm0dqWl4he0og2Fl7kH/QkzJ0W4pAoFyco0Ro9qlHpA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HXsH4u+zaWxGH4DVqLhj0JRpAfwv1/8YJXrUh9w5JE8Oqhwc3JX29lPmzYKD2o+XzuFG9Kk3RFUU5/IqY62rYdqnp/GpxoDertzi8kqfqHCdyJmZ7CamSp+2m3w+1GSR/fM8HTD+CQZbVW8y3Dt/RuxtbS3/B1xggGDlWzwlM5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IIUHACSs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 37932C116B1
	for <linux-usb@vger.kernel.org>; Sun, 14 Jul 2024 12:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720959322;
	bh=Qm0dqWl4he0og2Fl7kH/QkzJ0W4pAoFyco0Ro9qlHpA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=IIUHACSsHlQYx/QBKuTYfzUBEupz3kzl2jJoo8Whdv1P/FRfsSy5d++Fy8kYJfBG4
	 KLsH6tqmFZUTVjaYlF+Z/lcx0RjFpUGsrCN/NnfAxHvCX406HacBKlDJepfkx6ha0d
	 TvVCgtNzIO2XzLiBghk7zluKoI4zzcUWkspuuk9JDD5syn4/W2JqtJG1+CDUeXOS91
	 eJ8Zltt9KMK/xu4I6nxj6Nv/JhAM1ZNBG1hD9/djCR864/SjBs005ln54RmXC/tVmd
	 irutWVKa3vI4QzpVoaD4Cv6eKx6gzIhkjS3gE0rgvQpBYD481YLvm0UZ1RWqiRDEMc
	 ZOy1BRZqAR/yw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1FD86C53B50; Sun, 14 Jul 2024 12:15:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219039] kernel 6.6.39 freezes with QNAP TL-D800C usb case
Date: Sun, 14 Jul 2024 12:15:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: matthias@bodenbinder.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219039-208809-cdZxO0roVn@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219039-208809@https.bugzilla.kernel.org/>
References: <bug-219039-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219039

--- Comment #1 from matthias@bodenbinder.de ---
EDIT:=20
USB case is
Qnap NAS Storage TOWER 8BAY/TL-D800C=20
https://www.qnap.com/de-de/product/tl-d800c

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

