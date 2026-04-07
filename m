Return-Path: <linux-usb+bounces-36037-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8e0nArSu1GnvwQcAu9opvQ
	(envelope-from <linux-usb+bounces-36037-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 07 Apr 2026 09:13:56 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0C33AAAFD
	for <lists+linux-usb@lfdr.de>; Tue, 07 Apr 2026 09:13:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D97F3300A638
	for <lists+linux-usb@lfdr.de>; Tue,  7 Apr 2026 07:13:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C14333921E9;
	Tue,  7 Apr 2026 07:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AzSu49W1"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508C826D4E5
	for <linux-usb@vger.kernel.org>; Tue,  7 Apr 2026 07:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775546030; cv=none; b=tmurBFm0VAOk6t0vrJxNJjKFeSHJzUYNQNwkMSEQGYQLYR0/wRPT+95OOqkjpK3Pwj24oZCY9oRrDc2TnFdzvzMRoGjdNumarh8zISz6WoCf+5xUer4rJJjZ05O629IxXycLBri1lgkdHMU2thx1Ki8gd6kFSNdUXRl2SRnWmbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775546030; c=relaxed/simple;
	bh=ZQuJbf2dmPyVAqlxkCqukNj5SyYkfKLU132+PfC8frY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=K/SAtFIinBdSJW+Qhyb+XyDNVtrCAw2iRUAqcwNKNND6N7Miv6DBmWmvR5lr+UbofSiXNPy1Mi+1fe0ZXcjHEJGLqR7aNgYJhXtogDuxHxf66smKKoHL66iMiBuou7Dg5/PMAmXZBAOBhrog5KOKqZrXRXXY/P0ytmUGgEaeBAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AzSu49W1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 07059C2BCB1
	for <linux-usb@vger.kernel.org>; Tue,  7 Apr 2026 07:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775546030;
	bh=ZQuJbf2dmPyVAqlxkCqukNj5SyYkfKLU132+PfC8frY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=AzSu49W1V7i7e5MtIfEew1+zwaJxFcecCvf4CqJmTPN2BhTiLAbjOX/XNwr8vnHf0
	 PDhqT7bNKqGnxvOUDsgFZqf9QPSKuyZfj4VqNjhv8NT97y2bpHVmsV/xpePhOK/jdX
	 /jxf7PBnmkdEDihmTm5Ra0BhdV+yt6OYta/xgUxwPc/08aazzQWV7J6wC87ds4g0e2
	 pJVY11qiC1h6Vkc4BAmO9+Db1VDrpHzjqaE311OQ/lqUyeVyl739Gs89B6475ORZi2
	 8ZwSwvY3KxVbCmsPfcDH3+g6F+iUStZtWYOvK6fULUTFgwvuZwAveTeG3TcJ+zrrTE
	 kTLE6YLU8RxfA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id EA1A9C4160E; Tue,  7 Apr 2026 07:13:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221318] mice behind ASMedia ASM1042A via Thunderbolt 2 never
 produce input, most likely due to interrupt pipe idle window during
 enumeration
Date: Tue, 07 Apr 2026 07:13:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221318-208809-fNStB0TQkj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221318-208809@https.bugzilla.kernel.org/>
References: <bug-221318-208809@https.bugzilla.kernel.org/>
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
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36037-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4F0C33AAAFD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

https://bugzilla.kernel.org/show_bug.cgi?id=3D221318

--- Comment #19 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
The "spurious event" noise is likely from SuperSpeed device 4-1.1.2 whose B=
ulk
IN URBs may trigger it even on properly working hardware. The driver isn't =
very
good at telling apart certain valid and invalid events, it just logs them a=
ll.

Mouse interrupt endpoint has an URB at 1267010, cycle bit 1 as expected.
 0 0x0000000001267000: Buffer 0000000000000000 length 0 TD size 0 intr 0 ty=
pe
'No-Op' flags b:i:i:c:s:i:e:C
 0 0x0000000001267010: Buffer 000000000125e700 length 10 TD size 0 intr 0 t=
ype
'Normal' flags b:i:I:c:s:I:e:C

Cancellation commands, Set TR Dequeue to 1267010 with cycle 1.
 0 0x0000000001201950: Stop Ring Command: slot 7 sp 0 ep 3 flags C
 0 0x0000000001201960: Set TR Dequeue Pointer Command: deq 0000000001267011
stream 0 slot 7 ep 3 flags C

Their completion events have been overwritten by SuperSpeed device activity,
but no sign of problems was seen in logs.

Endpoint is running so the doorbell has been rung after 1267010 submission.
0x000000000125d060: State running mult 1 max P. Streams 0 interval 1000 us =
max
ESIT payload 10 CErr 3 Type Int IN burst 0 maxp 10 deq 0000000001267011 avg=
 trb
len 10, virt_state:0x0

I see nothing obviously wrong here, it looks like some weird HW problem.

BTW, I see that the endpoint of interest has 1ms interval too, longer inter=
val
is on the second endpoint of this mouse. IDK if it matters anyway.

If you would like to play with intervals, see drivers/usb/host/xhci-mem.c
function xhci_parse_frame_interval(). Replace ep->desc.bInterval with any
number like 1 or 10, units are milliseconds. Leave *8 unchanged.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

