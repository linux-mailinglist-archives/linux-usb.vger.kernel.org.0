Return-Path: <linux-usb+bounces-36975-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YMfRLksk+mnyKAMAu9opvQ
	(envelope-from <linux-usb+bounces-36975-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 05 May 2026 19:09:31 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 429CA4D1CF9
	for <lists+linux-usb@lfdr.de>; Tue, 05 May 2026 19:09:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7B7DF300853C
	for <lists+linux-usb@lfdr.de>; Tue,  5 May 2026 17:09:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A52E9492536;
	Tue,  5 May 2026 17:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bcYRQY8g"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3430A48B37D
	for <linux-usb@vger.kernel.org>; Tue,  5 May 2026 17:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778000966; cv=none; b=T8PwsO8BSk9i+u6cxsWacLYBcg3cbLT3Tn9pVI9NlPa8A77wYfCKXk/fjEK9k4ilJTUdQ20K/QfEGe0zHvSEc7yaT75+mi2ubKnw9C1YjwRBDITe2yas5YHNrprwN3nWU5+3ob0KM3H4uhml6u9qjmp9sm741ZgXizMlvjr3kS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778000966; c=relaxed/simple;
	bh=C/NpZ63WPEJ4t09/JGhFSjTx1BQy8OKKRk0AzOTYTHA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jzB+WH8tcRI3SC2m6PoVVk/OnST04hjpeDfUF0Ts7a6xQT8wOEv1QVlCvw7mYShUbRoZulj+v+q62HLUnp7oRNDhWIAOo0qVaE5HETEno18Am/Pjak9NhP7OuoKnDQwcL7qGpBPG8jb+/WxiO16K+hN0cl0PT1VOSqS24S3eZoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bcYRQY8g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C8064C2BCF6
	for <linux-usb@vger.kernel.org>; Tue,  5 May 2026 17:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778000965;
	bh=C/NpZ63WPEJ4t09/JGhFSjTx1BQy8OKKRk0AzOTYTHA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=bcYRQY8gzWUwP+dHK8QAHqeLaMas8oGb1f6jI9zebzY6ZJ/mKDio7RaExFEUiCOKh
	 /ycR4RWEnQx6TRAWno95lzXkVzrLbDsRoEf69wlGwtMKFMJDIKbcH2E+Y3Qw8ZvuV5
	 VFCRsBiBSnrlhmNMdWW5Xkuknd2EHiMZe4Y2B1sDmIU3zGcpF5A3Mf+ckRrkzQwsvZ
	 jUF92da/MTU9S4EwUGHQH5aUMCPTKbYQICBY5LCbMi07EPKrEp87genFcj60hIDTTP
	 AE7VJAKzeFP+sdZVLRAJSUY3D0E0AFyv0I3f8KP/mV+ou5jA4Yez5p1MMu38ttUdUv
	 THbzAXQfiRI0Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C12B5C41613; Tue,  5 May 2026 17:09:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220748] usb: xhci_queue_isoc_tx_prepare ignore start_frame and
 always assumes URB_ISO_ASAP is set
Date: Tue, 05 May 2026 17:09:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nick83ola@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220748-208809-ZIElbqqann@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220748-208809@https.bugzilla.kernel.org/>
References: <bug-220748-208809@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: 429CA4D1CF9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36975-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

https://bugzilla.kernel.org/show_bug.cgi?id=3D220748

--- Comment #22 from Nicola Lunghi (nick83ola@gmail.com) ---
(In reply to dylan_robinson from comment #20)
(In reply to Micha=C5=82 Pecio from comment #21)
Hi Dylan, Michal
I just want to report that with the patches I've submitted to the kernel the
issue with clock synchronization with the motu is gone and the interface is
super stable.
I've tested the interface running continuosly playing 12 audio channels
connected to an usb 2 hub (via another hub) while strees testing the usb
connection using fio on a separate usb disk on the same hub

Running kernel 7.1.0-rc2 with the patches applied, I can start and restart
playback repeatedly without any channel desync. usbmon confirms the frame
numbers are now perfectly sequential throughout =E2=80=94 every
  URB completion on EP 0x09 OUT comes back status 0 with start_frame
incrementing by exactly +8, no gaps, no EXDEV. I've set the motu at 16 samp=
les
buffer / 16 samples host safety and is still rock solid.=20

I've implemented another patch to do a channel reinizialization if the driv=
er
detect gap in the packets (that would break the synchronization) but on my
system I cannot trigger it. I think at this point is probably not needed. I=
'll
attach the extra patches to this post so you can have a look

Thanks,
Nicola

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

