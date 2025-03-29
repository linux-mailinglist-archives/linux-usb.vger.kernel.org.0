Return-Path: <linux-usb+bounces-22309-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F924A753BA
	for <lists+linux-usb@lfdr.de>; Sat, 29 Mar 2025 01:32:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD57C16E12F
	for <lists+linux-usb@lfdr.de>; Sat, 29 Mar 2025 00:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3449A79C4;
	Sat, 29 Mar 2025 00:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mTveLjJM"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1ED819
	for <linux-usb@vger.kernel.org>; Sat, 29 Mar 2025 00:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743208365; cv=none; b=UU2dyfTGnpn7O1I0iZLongWlWNI3mMF39yhCWpFydLJA3yPimey9+Io/5P15cKOWORMFla+GPNj3TuTYPZkDtTaZTNnBN1jmfcfXa9qir8JQOUEaCfaorueeFL13zkPl5tHhAuz5SHe42A8/ReulorY5OhOMSE/0zaY1h6khgBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743208365; c=relaxed/simple;
	bh=jFYVCKYOeGzn4OoQYtQAAKHCNgWqthJJKyQ2usfLg8Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HnQJeDcLxlWnefPHlQuli4q0W+eZ2irkjlRzv+IMDlPqRkeSheWwe0tE+uWYkTymuJQq3KINpglLrsA+zEHD7vJKAFUyCpEbzWK2IoMU9KrDdJqQODrbqbQXe/KY3HRW57XcOQzvZlTMBYdyu3+NeKxaJKVbwx7WILsm/o+PKOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mTveLjJM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1FF1DC4CEE4
	for <linux-usb@vger.kernel.org>; Sat, 29 Mar 2025 00:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743208365;
	bh=jFYVCKYOeGzn4OoQYtQAAKHCNgWqthJJKyQ2usfLg8Y=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=mTveLjJMC5GlSZLzDvi46AhnFJsp7omtelNeyxXOEEn2y7jiqZjOlo9CTvNgegifP
	 iKzNaTB8I0OTrnDSn4MraRDn0QwULqhsmzszO8LHYlinaaXRChSyDCTnwZ1YE1MVxu
	 qaogdm6/Lc9jS5G7lUlsXdpG/Hv+FL74pdvf2D+3R2YsgYLnLJN6HjMOv//7ZO4W+d
	 aMwgYezMF5z6zpNZ2kIm+IzsWZTzzivcFgU0s6tc6fLyppbrfzUOxHZ5iW6ErivZd8
	 l805F6y5bpuVfc15lC2kn0aSXmiwsXfdDqbKR/RVChS6GvtG7NtxaJG1jD9DPhH4+r
	 +QXeidp3hLO6Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0617EC41612; Sat, 29 Mar 2025 00:32:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219951] Missing null check in ast_vhub_init_dev
Date: Sat, 29 Mar 2025 00:32:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bsdhenrymartin@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219951-208809-fXMQxG1Kde@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219951-208809@https.bugzilla.kernel.org/>
References: <bug-219951-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219951

--- Comment #5 from henry (bsdhenrymartin@gmail.com) ---
Thank you for your feedback. I've now properly submitted this patch via
email to the relevant mailing lists with you in CC, as required by the
kernel submission process.
Please let me know if there are any issues with the submission format or
content that I should address. I'm happy to make any necessary adjustments.

<bugzilla-daemon@kernel.org> =E4=BA=8E2025=E5=B9=B43=E6=9C=8829=E6=97=A5=E5=
=91=A8=E5=85=AD 05:08=E5=86=99=E9=81=93=EF=BC=9A

> https://bugzilla.kernel.org/show_bug.cgi?id=3D219951
>
> --- Comment #4 from Greg Kroah-Hartman (greg@kroah.com) ---
> On Fri, Mar 28, 2025 at 01:14:23PM +0000, bugzilla-daemon@kernel.org
> wrote:
> > https://bugzilla.kernel.org/show_bug.cgi?id=3D219951
> >
> > --- Comment #3 from henry (bsdhenrymartin@gmail.com) ---
> > This is patch file.
>
> Please read the kernel documentation for how to submit a patch in a way
> we can accept it.  We can't take it through bugzilla, sorry.
>
> --
> You may reply to this email to add a comment.
>
> You are receiving this mail because:
> You reported the bug.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

