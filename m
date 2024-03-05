Return-Path: <linux-usb+bounces-7562-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 140D0872576
	for <lists+linux-usb@lfdr.de>; Tue,  5 Mar 2024 18:14:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F0561F22E65
	for <lists+linux-usb@lfdr.de>; Tue,  5 Mar 2024 17:14:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60F1C13FE7;
	Tue,  5 Mar 2024 17:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o1fUwZ5i"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA08E17582
	for <linux-usb@vger.kernel.org>; Tue,  5 Mar 2024 17:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709658886; cv=none; b=mo1gEUds6rOJobnr/2gP22qpCcT+aH9pyGmQDfXrRqA0L+e3qUqW6BOJfuMsZoU6sREIw1VrR8l94ya+uqSrQRP++MFwzfP78nwWsqYiMQSqZ/W76eBlR/CDUuLhiM3E9t5atapniy8k8R4q5lupKM5N5cISxPrAgTM0/05KAKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709658886; c=relaxed/simple;
	bh=R6fLkJ7z+fSXa+snc58Cczgm2VyJiklEfzQgFmYsqzY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sO71NoOStdMBt++QioYVLX/+oL9W/5UDIiqUzpHqVaD/D6ut9RdKfVbZ7c6jPU3IqGX66OUooUzgJIWUUfL3fYa3y4OP6pUrEI4ZlpbK8FVyigR/cMHitwzi/WiGkwDNfqoKvEBKnajF5Bw3HN2qMFz+Rx2qzn1WDEfIZgU+jnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o1fUwZ5i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6F5DEC433C7
	for <linux-usb@vger.kernel.org>; Tue,  5 Mar 2024 17:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709658886;
	bh=R6fLkJ7z+fSXa+snc58Cczgm2VyJiklEfzQgFmYsqzY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=o1fUwZ5iAndf7UpsJKAWjh8BlXbwrPk9YvMX5/jbPJnchgQT7LR9US4168HM8KOzT
	 Q7LlcNY3hf9pCobqrmdcVjbhE7DK5a6FbtcgRoyWflzcoaatkwjmYjJZ7Z0U6mZPQz
	 6pycejtl/idbOE1G02FeB7gaRhN4fVnUyo7i1v+RcR8/8u9dGOCnAWvuj1sDz4DrYF
	 M9tWyN0a7W6RXLz6/XRWa03mrnDOjPKu50ELUYGIAnr7DLZVYaOTgRdPk4Wm0Ht1T4
	 8nEy5l7XObKT9O0bopyIsmMP/rqH0ArxewJ3kQx5L2NrxzX6y8rweSywuhZkiIvh3E
	 wG+e3dcHQOAMQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5DAFBC53BC6; Tue,  5 Mar 2024 17:14:46 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218544] not enough bandwidth, synaptics hi-res audio duplex
 audio
Date: Tue, 05 Mar 2024 17:14:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ibmalone@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218544-208809-uweqEWldM2@https.bugzilla.kernel.org/>
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

--- Comment #10 from Ian Malone (ibmalone@gmail.com) ---
Created attachment 305965
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305965&action=3Dedit
/sys/kernel/debug/usb/devices other devices and hid disabled

You are of course right, the patch can't be easily adapted to apply against=
 the
current driver and there are too many incompatibilities with memory managem=
ent
and the rest of the USB system for it to be trivial to drop in the whole 2.=
6.18
host controller. I'm not sure it was ever really submitted, which is a pity=
 as
it looks like it implemented FSTN handling that never otherwise got added. I
might fiddle with it a bit more to see if it can be built just to see if it
would have helped.

Meanwhile, I've tried disabling the HID as well, /sys/kernel/debug/usb/devi=
ces
attached. This still doesn't work (same "cannot submit urb 0, error -28: not
enough bandwidth"). It does puzzle me a bit, we're now down to a single FS
device on the hub, while I can understand the scheduling for LS/FS onto HS =
is
complicated I'd have thought this issue would have popped up frequently eno=
ugh
when these laptops were common that it would have been addressed back then.=
 Is
there any other information I can extract to find out what's going on with =
the
scheduler? The following are the FS/LS portion of
/sys/kernel/debug/usb/ehci/0000:00:1a.0/bandwidth for a good device in out,=
 in
and duplex and the problematic device:

good device out
TT 2-1 port 0  FS/LS bandwidth allocation (us per frame)
    482  482  482  482  482  482  482  482
FS/LS budget (us per microframe)
 0:   24   0 125 125 125  83   0   0
 8:   24   0 125 125 125  83   0   0
16:   24   0 125 125 125  83   0   0
24:   24   0 125 125 125  83   0   0
32:   24   0 125 125 125  83   0   0
40:   24   0 125 125 125  83   0   0
48:   24   0 125 125 125  83   0   0
56:   24   0 125 125 125  83   0   0
2-1.1 ep 82:    24 @  0.0+1 mask 1c01
2-1.1 ep 01:   458 @  0.2+1 mask 003c

good device in good
TT 2-1 port 0  FS/LS bandwidth allocation (us per frame)
    109  109  109  109  109  109  109  109
FS/LS budget (us per microframe)
 0:   24   0   0  85   0   0   0   0
 8:   24   0   0  85   0   0   0   0
16:   24   0   0  85   0   0   0   0
24:   24   0   0  85   0   0   0   0
32:   24   0   0  85   0   0   0   0
40:   24   0   0  85   0   0   0   0
48:   24   0   0  85   0   0   0   0
56:   24   0   0  85   0   0   0   0
2-1.1 ep 82:    24 @  0.0+1 mask 1c01
2-1.1 ep 81:    85 @  0.3+1 mask e008

good device duplex
TT 2-1 port 0  FS/LS bandwidth allocation (us per frame)
    567  567  567  567  567  567  567  567
FS/LS budget (us per microframe)
 0:   24  85 125 125 125  83   0   0
 8:   24  85 125 125 125  83   0   0
16:   24  85 125 125 125  83   0   0
24:   24  85 125 125 125  83   0   0
32:   24  85 125 125 125  83   0   0
40:   24  85 125 125 125  83   0   0
48:   24  85 125 125 125  83   0   0
56:   24  85 125 125 125  83   0   0
2-1.1 ep 82:    24 @  0.0+1 mask 1c01
2-1.1 ep 01:   458 @  0.2+1 mask 003c
2-1.1 ep 81:    85 @  0.1+1 mask 3802

bad device in
TT 2-1 port 0  FS/LS bandwidth allocation (us per frame)
    273  273  273  273  273  273  273  273
FS/LS budget (us per microframe)
 0:   39   0 125 109   0   0   0   0
 8:   39   0 125 109   0   0   0   0
16:   39   0 125 109   0   0   0   0
24:   39   0 125 109   0   0   0   0
32:   39   0 125 109   0   0   0   0
40:   39   0 125 109   0   0   0   0
48:   39   0 125 109   0   0   0   0
56:   39   0 125 109   0   0   0   0
2-1.1 ep 84:    39 @  0.0+1 mask 1c01
2-1.1 ep 81:   234 @  0.2+1 mask f004

bad device out
TT 2-1 port 0  FS/LS bandwidth allocation (us per frame)
    497  497  497  497  497  497  497  497
FS/LS budget (us per microframe)
 0:   39   0 125 125 125  83   0   0
 8:   39   0 125 125 125  83   0   0
16:   39   0 125 125 125  83   0   0
24:   39   0 125 125 125  83   0   0
32:   39   0 125 125 125  83   0   0
40:   39   0 125 125 125  83   0   0
48:   39   0 125 125 125  83   0   0
56:   39   0 125 125 125  83   0   0
2-1.1 ep 84:    39 @  0.0+1 mask 1c01
2-1.1 ep 01:   458 @  0.2+1 mask 003c

bad device duplex
TT 2-1 port 0  FS/LS bandwidth allocation (us per frame)
    497  497  497  497  497  497  497  497
FS/LS budget (us per microframe)
 0:   39   0 125 125 125  83   0   0
 8:   39   0 125 125 125  83   0   0
16:   39   0 125 125 125  83   0   0
24:   39   0 125 125 125  83   0   0
32:   39   0 125 125 125  83   0   0
40:   39   0 125 125 125  83   0   0
48:   39   0 125 125 125  83   0   0
56:   39   0 125 125 125  83   0   0
2-1.1 ep 84:    39 @  0.0+1 mask 1c01
2-1.1 ep 01:   458 @  0.2+1 mask 003c

It looks like there's an extra 234us to accommodate for input to work, I'm
guessing there are restrictions on where that can go. Is it plausible that =
if a
lower bandwidth mode is requested from the device it would work? That's
essentially what I was wondering about with respect to the snd-usb-audio mo=
dule
before this was moved over to usb.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

