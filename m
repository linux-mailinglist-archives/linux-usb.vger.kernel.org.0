Return-Path: <linux-usb+bounces-34496-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMlLNCZ0sGnJjQIAu9opvQ
	(envelope-from <linux-usb+bounces-34496-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 20:42:30 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7731025716A
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 20:42:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 740B8305F484
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 19:42:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEFE83563E8;
	Tue, 10 Mar 2026 19:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VRuGaQCH"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5D0355F58
	for <linux-usb@vger.kernel.org>; Tue, 10 Mar 2026 19:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773171745; cv=none; b=ed/koIJrNtS0IIeOsz5rXZRzwUxIHhQVe+kvbNTb/Wra3JEEAKFEZ+sMqaUB8pC2tRZXfXgUCVkPHX8Tu7FoUlJLmNCOIVXgyHsehvMYv0gSQxHDfgcGQPJzyfEgo12VeS9ahoXuFNMzyySaAfXWsRxxka9uRGYu5UpIC/arUBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773171745; c=relaxed/simple;
	bh=PqgCPx8NCpVmXWoCynu5qqwmj6LVIaejA73Hp5EXa/I=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=j7KY1PqfWKi9YRATTsaPqaGFUi8198VWjX165L2OLa6NWWRwdkTnIsTZrE+8z+YuMpP5uouQR9PJDX6T2dRwklFJrmMC2UKOF0Nx/Ue3Ikf6K87IigGeB9vcVmHpP7LmgU/VMizVFZppIwB4ZwUVBx/ipg0YI7/gNsZRHDEtgvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VRuGaQCH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 17BA9C2BCAF
	for <linux-usb@vger.kernel.org>; Tue, 10 Mar 2026 19:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773171745;
	bh=PqgCPx8NCpVmXWoCynu5qqwmj6LVIaejA73Hp5EXa/I=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=VRuGaQCHm4R90M9X2d4/OLEPdtHOa/8h70ABuHzDG5Q9MlTlAC65fIq2lQMqinlbv
	 upfiT8NzLXm2G6GRBqKKKFGa1Vy39N3XS/CNkQuM0BvViXh/+Ifr1/hYAVOMjdDGV9
	 iA8J6yP/mnanqx8D+MBjNDEbk4jC91aGLQfKkgzyCuigvv+gKuiKb2ics3MjBbPJBh
	 tOn6yElrJBsQInggqdK37DNCo7LZwhDewLJ9p3M1GEUXUw/CsdqacnUC9nYhuAdSmT
	 RStp9O4OuHabjoAwHJ9K+7IISr28natibJ61J+i/QkOvP7bDrcdhJNv2wVDdS7llvi
	 7BE3AxCv1517Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 12407C41614; Tue, 10 Mar 2026 19:42:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221184] mouse/keyboard (connected via hub) usb reset under
 system load with weak cpu
Date: Tue, 10 Mar 2026 19:42:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mitchell.liam@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221184-208809-EWzMusGYmh@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221184-208809@https.bugzilla.kernel.org/>
References: <bug-221184-208809@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: 7731025716A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34496-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221184

--- Comment #34 from Liam Mitchell (mitchell.liam@gmail.com) ---
(In reply to Alan Stern from comment #33)
> One of Micha=C5=82 Pecio's points is that if you want to retry following a
> -EPROTO error, it is necessary to reset the endpoint first by calling
> usb_clear_halt() -- just like with a -EPIPE error.  I think usbhid may not
> do this; if it doesn't then it needs to be fixed.

That doesn't match what I'm reading.

In Documentation/driver-api/usb/error-codes.rst:
> -EPIPE Endpoint stalled. For non-control endpoints, reset this status with
> usb_clear_halt().

From what I understand "stalled" is a device state and requires communicati=
on
with the device to clear.

EPROTO/EILSEQ are host controller errors representing communication failure.
They can't be fixed, only acknowledged and retried. Calling usb_clear_halt()
for these would unnecessarily delay retry.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

