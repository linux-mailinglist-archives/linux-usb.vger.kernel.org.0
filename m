Return-Path: <linux-usb+bounces-17890-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFBA9D9F75
	for <lists+linux-usb@lfdr.de>; Wed, 27 Nov 2024 00:09:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34BB42842F7
	for <lists+linux-usb@lfdr.de>; Tue, 26 Nov 2024 23:09:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B7911DBB3A;
	Tue, 26 Nov 2024 23:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZH0e42YK"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C675A1ACDED
	for <linux-usb@vger.kernel.org>; Tue, 26 Nov 2024 23:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732662575; cv=none; b=e+DARlm++tIDKaAKalaHxoyku4eD8DSegWq6TuE1hFGWrbxqCcuCAk84dD1+Gjv1ijNCIuGfmJwdSJ62aB9n/UY6m+8jwuzOjrX0D2Tapo8t5uhdhMyH0rfmbxaCHOJV0K2DIJeMUHcypTMulmSwxMLNChI3iiEJK3fAO5NW+nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732662575; c=relaxed/simple;
	bh=6Tq9Kq6MWH1OFdHge5pMtjbhpW6wGYU+vv9Yt/WArK0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Zm0HxKrDNdcx3bFzXgzVvm+4h+6UkltWkB62rAssoc7UEPtYe4kn+7BNMy4OyKJKyyhD/vteab0oWcxOPJkw7cH9QWbDAKp27Z3L7JBiBOkm+Xd1h8PJNw/RCQxdpY5FUsn/CyCspMHXSwB5JlPL4/Hms/wi8AnNSBmflmN2ADs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZH0e42YK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56ED9C4CED0
	for <linux-usb@vger.kernel.org>; Tue, 26 Nov 2024 23:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732662574;
	bh=6Tq9Kq6MWH1OFdHge5pMtjbhpW6wGYU+vv9Yt/WArK0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ZH0e42YKZqC6rlTuoPFH/G7r6oKE3D5a8RssGpoALqbKtAegT9tS4UuBcSWPlxmyT
	 louUnfSrK6GfBH6IJx9sKIwSoc9PODuAlC1dQFDVjKdJ3Mx2QSrefh47zom+/UssnK
	 bIyAoJvmu7LrTQtniWYt4VdMZDYf7wDZM84ch1NRgPfqGxtrkgphaX+JfOTraHAfWI
	 +SPW44rOmzWTWVUUWqCklfxxQDc3lFFx9CAYSF0CjFEoP0l7bZyJRiKHcvSU6RVhAn
	 ZvRyWsZB2Rs+XkcBzt9bBLCrVTpb8ohuHb9FHPcfMAUjX9ANlJwttOjCbvvTv+272w
	 fdAObNjSwNylQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3C008C53BBF; Tue, 26 Nov 2024 23:09:34 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219532] Crash in RIP: 0010:xhci_handle_stopped_cmd_ring
Date: Tue, 26 Nov 2024 23:09:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-219532-208809-8gVHeUXs1r@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219532-208809@https.bugzilla.kernel.org/>
References: <bug-219532-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219532

Micha=C5=82 Pecio (michal.pecio@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |michal.pecio@gmail.com

--- Comment #5 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
It looks like some device doesn't respond to address assignment after
connection. If you weren't connecting anything at the time, it's possible t=
hat
a device is buggy and had disconnected by itself a moment earlier, but the =
log
is too short to tell.

Not sure why it crashed. It looks like there were two attempts 6 seconds ap=
art
and no crash on the first attempt.

It's unlikely that xhci was NULL near the end of the function. If it were,
there were several opportunities to crash earlier. The call to
xhci_mod_cmd_timer() in the next line dereferences xhci->cur_cmd, which is
perhaps more suspicious.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

