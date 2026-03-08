Return-Path: <linux-usb+bounces-34230-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMssC6aPrWnH4QEAu9opvQ
	(envelope-from <linux-usb+bounces-34230-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 08 Mar 2026 16:03:02 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E56230D36
	for <lists+linux-usb@lfdr.de>; Sun, 08 Mar 2026 16:03:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 85E133003374
	for <lists+linux-usb@lfdr.de>; Sun,  8 Mar 2026 15:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38FC726D4DF;
	Sun,  8 Mar 2026 15:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VxzdL9Ym"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD16221ABD7
	for <linux-usb@vger.kernel.org>; Sun,  8 Mar 2026 15:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772982176; cv=none; b=YYETGzg5+Mo5UI2ub3QJ3VhBm/xdOs23yCXP+sR3+b+fAPWnGJqXkZQlqiauf8qRUhhzDrUPmlJeg+U/qxx/h87T3itzwuxsMMF/wVVJvLTOB/9UF5G6KbafCYlUMCTDmlGqNmR9WtF20OA/pJlD+TZMRxNsrGUxlfFJfWkNA2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772982176; c=relaxed/simple;
	bh=s3T1fQfz0BCmFCJ29F6pFiphp+lG3xZbZ15s9Ca4txs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZG9ig9v312dQL1HI8aGE2FmLD2reM45eTrxxAx03VIzDRXUQfesdcv8mQwwNHNdIRX4jHjTuYOT3eHU1DZQYoVcqxHzdhdO5u6TYF+lS6HNPVF9IROnEmYyk7CMGHJsiHqfIPvYeWwccOUy3FiFrIi4gPmqC1+qYMYN3KqneBHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VxzdL9Ym; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 60BDEC116C6
	for <linux-usb@vger.kernel.org>; Sun,  8 Mar 2026 15:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772982176;
	bh=s3T1fQfz0BCmFCJ29F6pFiphp+lG3xZbZ15s9Ca4txs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=VxzdL9YmyXhyX0CbhRF3zh+DSZp3WQquqUARRDyv7sz98vpphMU1d6ebCG+PpZxRR
	 oT9dhUN0zSZhhUdnm+zhpNvTsQkR4Y3t9Mwf0mSu3aUVP5YS9PKZHKmABr5zzexPql
	 NNlVvvMd5RK9j8fzsfM5qPeKuN8Ar7xytkOCfwhTDJoPX3gOSi2JwfYKC6Lm2mQWE+
	 DOAwymOUowr6KVR+sM5RW1YHgcAALjkXC/cTgtykUszHWlDlRCHLUDCl3NgBnXvbEG
	 4KvgJsMomu1BiH6rNpCt8Luy0x2V0Lg9ct98/dslnv31x4IF6B3ekxQwSMno672cMA
	 QNoKJ6Pu7EXHA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 56458C41614; Sun,  8 Mar 2026 15:02:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221184] mouse/keyboard (connected via hub) usb reset under
 system load with weak cpu
Date: Sun, 08 Mar 2026 15:02:56 +0000
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
Message-ID: <bug-221184-208809-mRYpb6EsSP@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: C1E56230D36
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34230-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-0.987];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221184

--- Comment #11 from Alan Stern (stern@rowland.harvard.edu) ---
Re comment #8: Are you sure that other operating system versions really are
working fine?  Have you tried collecting a usbmon trace under another OS
version while running your load test, and looking through the trace for -71
errors?

Those errors are the underlying cause of the problems you face.  The mouse =
and
keyboard resets are merely the kernel's reaction to the errors.  Yes, the
reaction can be tuned to improve your experience, but that won't fix the
underlying errors.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

