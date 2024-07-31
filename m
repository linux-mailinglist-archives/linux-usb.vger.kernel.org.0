Return-Path: <linux-usb+bounces-12738-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9AC94339F
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 17:47:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE3BB1C20AF2
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 15:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE1AB1AD9FE;
	Wed, 31 Jul 2024 15:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VFFvuf7R"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FBF442C
	for <linux-usb@vger.kernel.org>; Wed, 31 Jul 2024 15:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722440817; cv=none; b=Qls7Ad50VcXD0pAb69In0NAHjGEMOE1e4n4ssEpLzY9x6R3udXhiE33ZXDedbi78ez7aN1S2vpqhAjZwmBJ2rbp4r/cIZWPx10oAq680pKqQJAlOdp/jbKWQggJKnn3d1/sdIFVx3sIHAtFMx/lc9Ssnr1enc2FFzEV2vDKzSqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722440817; c=relaxed/simple;
	bh=3iwn8bsAyWAH3cLYWqE3fr1vMk7EJat8dh6odnW90+U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UfksFAayJUoRjo9jy0xw/53QEXo7At8mKkG8jVcQHaKIn0K0LutoOrIMud5iPesNx4hAott4Ysws/vRHGMdH0UAzIbZFEdLyEd5R5xsiQMYQxgXs25PwUhdglNsWmAChkIz/G9sGliRtv1girHftpcax53lsC3Xcls6o18U/cA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VFFvuf7R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C8338C116B1
	for <linux-usb@vger.kernel.org>; Wed, 31 Jul 2024 15:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722440816;
	bh=3iwn8bsAyWAH3cLYWqE3fr1vMk7EJat8dh6odnW90+U=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=VFFvuf7RnN6o0VKqNNCPIQ+m2p31UuK1QE16kDJTtXwjP7LNP39krZCtipOyytMYm
	 IFgnYZE98eMAljiXSysauKEXqKTqGvwBQGJpkKDgCdwrt45sNKbpxVtJyanH+mj3S4
	 hu4fo3dbRvA8NAAqbAIYGEpK00GtyJSF5u36Y4PwkMpv/jti4NDxxlU21e7VHmlMYy
	 5xfx79KvapFAf6D4+KUlBcyC25vx5n/xVnvhGu8TuoyPBAKp7Ve/i0kqLtBtMCk38D
	 8/15eHTEXR/tJeSPngaZi+dOmEvGBIxrhLgfmJvB1pM1PQdEtAUkooilcN0VKVpKyL
	 BruFwBvJ1ZLnQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B5117C433E5; Wed, 31 Jul 2024 15:46:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219111] Xone:23C mixer not recognized as a 2in/2out device
Date: Wed, 31 Jul 2024 15:46:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-219111-208809-6eDnMrCSvU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219111-208809@https.bugzilla.kernel.org/>
References: <bug-219111-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219111

Alan Stern (stern@rowland.harvard.edu) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |stern@rowland.harvard.edu

--- Comment #7 from Alan Stern (stern@rowland.harvard.edu) ---
I don't know of any way.  The device has a very unusual, non-standard behav=
ior.
 Also, I don't know how Windows handles it.  Maybe there's some way to tell=
 the
device to reset itself back to the original two configurations without
unplugging it.

Are you able to test a patch?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

