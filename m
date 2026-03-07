Return-Path: <linux-usb+bounces-34190-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id lUmgJDyqrGldsgEAu9opvQ
	(envelope-from <linux-usb+bounces-34190-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 07 Mar 2026 23:44:12 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E207A22DDB1
	for <lists+linux-usb@lfdr.de>; Sat, 07 Mar 2026 23:44:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 088053014418
	for <lists+linux-usb@lfdr.de>; Sat,  7 Mar 2026 22:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFBCB2F12C1;
	Sat,  7 Mar 2026 22:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r/tT10/B"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF2F1A9B58
	for <linux-usb@vger.kernel.org>; Sat,  7 Mar 2026 22:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772923446; cv=none; b=JhsyZO3DBHznRRxn6sMX5BjR5ODWc/TmZ77IfMg1kuzLq0zRnL0Fx+zShFAd2hdx8Tt/1hdpgrIRW9UW1B5P5AKj+Xqgp+kk39l2RIxHryRxF3eiej0edEHKIr90UTfzVi66BymRMCo0iSropySowcU7FsvWlC70lJzhk7mvZhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772923446; c=relaxed/simple;
	bh=d8vHj9WdY6Ahis3bs74xEqbZuKPZOKZnHZ9vkBwC8qo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PU2eDf4hKsJTcWsmYrw58951icuuI7Go8N5astAt05La+CEk1J89h6fdLK6PHb8mX3FPQ4TnaT+WUX2PbculgMilReCqFXecgoxBHCI/xBz/cpf0fjfgficVaSflCy+Nnki1lLnQzq8vXd5cYEg8zmcL4DHhzC8VVHDL5tukkF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r/tT10/B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0E985C2BC87
	for <linux-usb@vger.kernel.org>; Sat,  7 Mar 2026 22:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772923446;
	bh=d8vHj9WdY6Ahis3bs74xEqbZuKPZOKZnHZ9vkBwC8qo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=r/tT10/BeMA/oKUwwl1047pEA9hOr1YACfHPELhX34F5mBavaKllo0WXHiD21SAfg
	 C2x1hSNKHhBdfQo8CXNtgS0q1VICqQefBpTK/cNkE3WyxSM91QnR9dQxVjMm/u/cKM
	 jzuBTiYycC9JwtfRoGWGgF3K+fQMnyXBpQfzYM6SP6MxqJUwEhVSdTk2noxOBG2kh5
	 1XmcGOBq2+kPoBrZ0LBsPl91tWzXwuRaKnN32vUCDgK+qOW2TjTjzTzZTTO+uaaMwY
	 xtLM3X5EZ4jIFa4AxR6JShbosAyRp2dgzbvbjoN/eQdi6A5VjfRaQ/WbqviNo3uQzY
	 AIN30g4/g6cWg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id F3F64C41612; Sat,  7 Mar 2026 22:44:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221184] mouse/keyboard (connected via hub) usb reset under
 system load with weak cpu
Date: Sat, 07 Mar 2026 22:44:05 +0000
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
Message-ID: <bug-221184-208809-G1YVw5Br93@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: E207A22DDB1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34190-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-0.986];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,harvard.edu:email]
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221184

--- Comment #7 from Alan Stern (stern@rowland.harvard.edu) ---
The usbmon trace shows that your system is getting a lot of communication
errors (multiple errors per second sometimes), probably caused by the system
load as you said.  You can see them yourself in the trace; look for lines
containing a "-71" code, and note that the second column of each line is a
timestamp in microseconds.  (Your computer must be a rather old one for the
load level to affect it this way -- also, the lsusb output shows that the
computer has no USB-3 ports, only USB-2.)

With many of these errors the HID driver simply retries the transfer, and t=
hat
works, but sometimes it decides there have been too many errors too rapidly=
 and
it resets the device in an attempt to recover.

As it happens, Liam Mitchell has just submitted a patch to increase the HID
driver's tolerance for these communication errors:

=20
https://lore.kernel.org/linux-usb/20260307-usbhid-eproto-v2-1-e5a8abce4652@=
gmail.com/

I'm not sure how much it will help in your case, because the errors you get
occur so frequently, but it might help some.  Perhaps the patch can be impr=
oved
even more.

As for your patch in comment #2...  It is totally the wrong thing to do.  W=
hen
an error causes the endpoint to halt, the driver needs to know.  If
qtd_copy_status() returns early for short transfers (which is what your pat=
ch
makes it do), the driver won't realize that the endpoint has halted.  To pu=
t it
another way, these sorts of errors should not be ignored by ehci-hcd, altho=
ugh
the higher-level HID driver may decide to ignore them.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

