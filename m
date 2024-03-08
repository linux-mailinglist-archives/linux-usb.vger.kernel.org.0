Return-Path: <linux-usb+bounces-7736-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1178769EC
	for <lists+linux-usb@lfdr.de>; Fri,  8 Mar 2024 18:30:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE5A61C21405
	for <lists+linux-usb@lfdr.de>; Fri,  8 Mar 2024 17:30:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74C1A48CC6;
	Fri,  8 Mar 2024 17:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P/2xoO/P"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B643FBB9
	for <linux-usb@vger.kernel.org>; Fri,  8 Mar 2024 17:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709918917; cv=none; b=LynQo2pdLItVCOH7HEYniGO6RABFOxUlXVAvy+kLw9CUoi7xQnIhGu0oyU0C5vhsO95M3+Xd0xgOKmlxIAykJFA2lTq0nTEWnpoRbolwaNpd9oEo6U29mo3zj5qRFSFBc9cr7dRC9dIzlbnZvoGaeDqlovk2h9nrsitW0jwQ+XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709918917; c=relaxed/simple;
	bh=7gi6ll+G9R8rEzPej294cTM2/1QiK2kjjt/IiCxgTgU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DqIpsDCKcLR2QT5UEciesWFJzawQuzUvFP4TGcV8WOmKOzKtGd+WYuc42NTQGub78ezU2HyM5ahMRjoHD0kAgyjIJ1PtYJKQg77Ssw7ckxw/2gVTH8wJmpUw4Cou2t5+AYUT2zDvjQA139O0/Lo+5cbPvCdukS/hanhOvZMhGZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P/2xoO/P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6AAA8C433F1
	for <linux-usb@vger.kernel.org>; Fri,  8 Mar 2024 17:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709918916;
	bh=7gi6ll+G9R8rEzPej294cTM2/1QiK2kjjt/IiCxgTgU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=P/2xoO/Pyy8UT3CuHI8peJRndmNxkkTpaAEqy6z8YF1iVyBFxiyXnMlXXMJb3Uz+n
	 jDH/55eAogRD3m5TR49Q4QmmEYzTfnVgpXunI0USvfjcU8z2FmY39c6pqSSPz0JzhL
	 72sz01VW5I4UK705vU4nShPijDpQrUWzdH3bquPG7s8+EpDc/iFw2pd/HnHmypKq/5
	 0RN7CevpzAOoaiwwyhYYTLcHYYMbHBDDyFvbbLRbBOHSYiNgShuQNAwkCUnFcOTYWB
	 Cy0VuDMLirbebercJBrfNNVCHoljCXF14Kxaz/GVUoj+aeL08YkE6pVrAIfsZqWyYo
	 XeOdE2MzMjzGA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5A4A6C53BC6; Fri,  8 Mar 2024 17:28:36 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218544] not enough bandwidth, synaptics hi-res audio duplex
 audio
Date: Fri, 08 Mar 2024 17:28:36 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218544-208809-jLXP7KsHZJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218544-208809@https.bugzilla.kernel.org/>
References: <bug-218544-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218544

--- Comment #15 from Alan Stern (stern@rowland.harvard.edu) ---
Some years ago I did try allocating interrupt transfers from the end of fra=
me
backwards, but decided against it in the end -- I don't remember why.  It
certainly helps in your case, so maybe that decision should be reconsidered.

Maybe the reason was that the absence of FSTN nodes makes interrupt transfe=
rs
near the end of the frame less reliable.  If any unexpected delays should p=
ush
the transfer back a few hundred microseconds, there wouldn't be enough
complete-splits to guarantee it could finish correctly.  In the examples you
give above, 1-1.4 ep 81 and 1-1.1 ep 84 each have only one complete-split (=
only
one bit set in the high-order byte of the mask), whereas the spec says there
should be enough complete-splits for the entire LS/FS packet plus two extra.

snd-usb-audio using a smaller packet size for the output streams wouldn't h=
elp
the scheduling; the scheduler has to assume that each endpoint will use the
maximum packet size allowed (i.e., the maxpacket value).

The reason for scheduling isochronous transfers earlier than interrupt
transfers has to do with the way transaction translators in hubs behave.  I
forget the details (it's described in the USB-2 spec), but there's some
scenario in which they will lose data if an isochronous packet comes after =
an
interrupt packet in the same microframe.

Scheduling interrupt transfers late in the frame _is_ legal according to the
spec, so long as it is done properly.  And in theory the driver could rebal=
ance
the schedule, changing which microframes are assigned to each endpoint, as =
new
endpoints are added.  But that would add another whole new level of complex=
ity
to the driver and I never implemented it.  Besides, without FSTN nodes you
still wouldn't be able to get the full benefit.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

