Return-Path: <linux-usb+bounces-14095-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0DE95ECD0
	for <lists+linux-usb@lfdr.de>; Mon, 26 Aug 2024 11:13:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CBD71C2176B
	for <lists+linux-usb@lfdr.de>; Mon, 26 Aug 2024 09:13:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7D321422C8;
	Mon, 26 Aug 2024 09:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XBGvfSZW"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3323A140394
	for <linux-usb@vger.kernel.org>; Mon, 26 Aug 2024 09:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724663577; cv=none; b=fwj0a0IxW4StTlL43DJshUdY0wwyy1IGaujIX2zt1YDxadiHTlbqsJImkD9Lpqs05OUta4VcJ3ZbVzx4LR6qcdG1/2/3EJn/65+Luvg0H7v6w6xufvjczx6ZKlhfKMY3RsWfdbl1JdsiwKo3rarsX8cL7MOo2BwQ/Q6gyDES7EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724663577; c=relaxed/simple;
	bh=EQibc0HQMGxXpSjgmDf8VMYU8sLWzJGhQFMp282d7xQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=InBrAfRIRhi3gdXsW/mRa+XtlsWIBITtiekeRGhxiKX82dAQ6ruxwfskHmd0q0gbBzFcAG6x3D1jI6OyvbfOHaWY0uZHQvfDaHbijpUljvjkCT5g3weHyaJgEAbAgr/bf7PqMDOpdoKjsXQzAdA7HEgvh5qVEvoaQjz1Fr4TW+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XBGvfSZW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 01CCBC4DDEF
	for <linux-usb@vger.kernel.org>; Mon, 26 Aug 2024 09:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724663577;
	bh=EQibc0HQMGxXpSjgmDf8VMYU8sLWzJGhQFMp282d7xQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=XBGvfSZW6XQ9Gx2QjA1vBdzqCatGsIU3Zf4mFI/to+UOWiWmGZdbpptcJ2EzSqY4Z
	 Ue2x0euNbo9rQ4eo5wO6wXiqGgWWnz9mR/iFOmgi0/CTnooInxgJQCH9ag/RWKqoYj
	 4aouaSa22fzEryVeQDSO2aET5hcOEwKTP0IEjnDvoA251RfdnFq3uZJCTTXH/ZfQ5g
	 yOH/AcqQtYnybH681ah7wN5dzkPZXYGQ1bb7mN5dM6DL1yzd+0mqmPVkvRR3xW3ijY
	 InvRCxJvJntbfEit2RJoo56iL3fDOdmjVgRdfB58vQXIpuVRec2jKIAJbVzgi3/Ekc
	 NC+Ks9/AnCprg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E353FC53B7E; Mon, 26 Aug 2024 09:12:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219198] usb on Dell WD19TB Thunderbolt Dock stop working
Date: Mon, 26 Aug 2024 09:12:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: maggu2810@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219198-208809-FODahH1xr4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219198-208809@https.bugzilla.kernel.org/>
References: <bug-219198-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219198

--- Comment #2 from Markus Rathgeb (maggu2810@gmail.com) ---
Created attachment 306777
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306777&action=3Dedit
kernel log 6.11.0-0.rc5.43.fc41

Problem still exists with fedora kernel 6.11.0-0.rc5.43

On rc4 the dock has been connected on boot up and I disconnected it and
attached the log while reconnect it againn.

On this log the dock has not been connected on boot up. I had to connect it,
unplug it and connect it again (first I received an "failed to initial" and=
 no
more).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

