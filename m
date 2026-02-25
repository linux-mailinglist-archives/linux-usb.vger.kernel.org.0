Return-Path: <linux-usb+bounces-33693-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULBNDPXYnmkTXgQAu9opvQ
	(envelope-from <linux-usb+bounces-33693-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 25 Feb 2026 12:11:49 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8538719648D
	for <lists+linux-usb@lfdr.de>; Wed, 25 Feb 2026 12:11:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3E69C300DF6D
	for <lists+linux-usb@lfdr.de>; Wed, 25 Feb 2026 11:10:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC05C393DEE;
	Wed, 25 Feb 2026 11:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dkRLJDWm"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF27393DE4
	for <linux-usb@vger.kernel.org>; Wed, 25 Feb 2026 11:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772017805; cv=none; b=YcMsZRe+Tpp2PC2VFFLZWPU8pY9ZGKpi0K0rOuY4t1w6okxVceZ563PPqxGNDPoHZ3oTLqmKGcxwnJlvhXK8Iesj3TNsD4JJA3LU5rFh7FcRXDG0VsG7CWblbiEkwS4THUNKPZWxCyXOgHTzGEG4y5UKCAYT1GlrR2m4TqhLf+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772017805; c=relaxed/simple;
	bh=UwvPPO7v/0QymdAfhdhwDw4UBD2fEYfDLk+ukSJgPWA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PUaH5E2u7JK7nCfVsZPmNmWnu+yyQPMEjP0qkhVQqc6fwse1+JfsBkBAcR2aLS4o4pnRchSHAQkoTEkNSWLAec2N9HHEvKHdoY71ZqbLgP//8j2Q/RCnoGl5fQepmbGEyaw1Qo8fSwwUcpd0yhOar38GqrJOq3NHS6V7dGYQoyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dkRLJDWm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 40B13C116D0
	for <linux-usb@vger.kernel.org>; Wed, 25 Feb 2026 11:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772017805;
	bh=UwvPPO7v/0QymdAfhdhwDw4UBD2fEYfDLk+ukSJgPWA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=dkRLJDWm+y3GZvWopOBUJige9iM9WQVjDmTMM3HO6a3+kby7IUEGoA+CgJSbpM2Io
	 2NNxvMemhViYT1kFp4nga5R+siIoQiaNoa+WfVz3FRNo4g9CSGBhM9vuoyhvygZ9dG
	 u4tXuk8b7FLz0jt5f2BJmNTXKCUJ67cBaAXSbtB+hFTTa9IWBybyKNgP6tagshc6o1
	 ijLyH03/4+AS0WX0XNNhqmF8gVaUDMOQmXgLIs1DKvNzdhEvHj0XCvcT5VPE5Fi/Su
	 fOmavEOi86dyhHZMhL2U4NpQ0gHhy/3R/mdtrRpRaOpCMF2/cZnW6LJy0cKaCd32ES
	 DV6qQ/EDJiMRA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 39597CAB780; Wed, 25 Feb 2026 11:10:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Wed, 25 Feb 2026 11:10:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221073-208809-aHtfZVJj5A@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221073-208809@https.bugzilla.kernel.org/>
References: <bug-221073-208809@https.bugzilla.kernel.org/>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33693-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8538719648D
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221073

--- Comment #7 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
Any updates? Has anyone got dynamic debug logs?

May or may not be related to bug 221103. Both issues seem to affect xHCI
controllers embedded in some generations of AMD IGPs and the controllers st=
op
working during or after resume from suspend, albeit with different symptoms.
The other bug has a quick and reliable repro confirmed by multiple people a=
nd
it completely hangs the machine, no recovery is known.

> @davidhubbard isolated iGPU memory allocation as a variable:
Could be due to sharing some resources with the GPU?

> This doesn't seem ideal to me if most suspends are fine.  Until we get to=
 the
> bottom of this maybe we want a RESET_ON_FAILURE type of behavior instead =
to
> use in the resume routine?
Guess you're right, but I thought some people may find RESET_ON_RESUME
preferable to the status quo until the bug is solved.

The resume routine should already reset the HC if it encounters problems
(except if MMIO reads as 0xffffffff, as in bug 221103). Here resume seems to
complete successfully, but the HC doesn't function properly. Or driver stat=
e is
utterly screwed up, like suspending with a Stop Endpoint command still in
flight. Debug logs would help.

Automatic reset on Stop EP timeout or other anomalies is possible in princi=
ple
and would help in this case, but it's not implemented.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

