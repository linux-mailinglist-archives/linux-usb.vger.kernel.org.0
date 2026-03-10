Return-Path: <linux-usb+bounces-34397-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMsUOTPsr2nkdAIAu9opvQ
	(envelope-from <linux-usb+bounces-34397-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 11:02:27 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A6B249019
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 11:02:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8D0B630A871E
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 09:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AED7346AFB;
	Tue, 10 Mar 2026 09:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="saNhkqTx"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA7735F173
	for <linux-usb@vger.kernel.org>; Tue, 10 Mar 2026 09:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773136449; cv=none; b=CF3qudO3IDXT5YE9HHd3dZaCh25hf2460mFZt21zK+mCm6sdy/ai1e/ZFDjjKMdsMzgHUPddIbufu8uUeY0sWxs7Rc2C/kZiNxXAM2pmcMYxocIcYKEBilR7KlpIGlpO/ByeVOum0rPNft7xTCg6kyWBqnh990OemCTl6VGoZrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773136449; c=relaxed/simple;
	bh=oo20Y63vrUPtd4LY19pIKkyza+cQYbhIQeNTnt+SWuk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UZCov6WNw94/JH8DrTagtUe+riyEVTtmkHYasxmHgZmUn8Wqp9HjGv9d8JJOcOQB0fQ7t1vftcPEkj0+dBAnF+oyyEKxweSZYgdWJwzf0z+uT9PQmE1l7CSKLmz1nmrwc/6OAgNaudNKh2t7SExbJT1SA5aYIoFDW93CF2U9FS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=saNhkqTx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 89344C2BC9E
	for <linux-usb@vger.kernel.org>; Tue, 10 Mar 2026 09:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773136448;
	bh=oo20Y63vrUPtd4LY19pIKkyza+cQYbhIQeNTnt+SWuk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=saNhkqTxMZ6zRRKUb8dz78LS5h8eiF09TXSNka8JRUrQxLR/asOv9yX1CdFojCXRZ
	 peQSRPxcaobLZSCmXB+YBpzUcSLTaQyzmkiUqQWA+3+WGiiFJZiTfmyQ+ddxvaQZev
	 c2NYlAmwyTRAV/8A8nmxd7DHw88VU9FREniNjT1WQEcuJB0TK9RKH4ntUU33X7Hk1e
	 BJb46xU3OBzCMxvQfmhxnjJbIVHdm7pQ+EFOtaaeX4PljgJbmUhwnPdzTJDHkt6OYZ
	 TEpFGczVJVwfGykQxY/J2WBWuPWdN2nOlCIB8Y6nKv9IIkRHOJs+zVIWQ4qmTHmEN+
	 7iJqs4IUrQcZw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5F4CDC4160E; Tue, 10 Mar 2026 09:54:08 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221184] mouse/keyboard (connected via hub) usb reset under
 system load with weak cpu
Date: Tue, 10 Mar 2026 09:54:06 +0000
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
Message-ID: <bug-221184-208809-U1BuzmZHYp@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: 16A6B249019
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34397-lists,linux-usb=lfdr.de];
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

--- Comment #31 from Liam Mitchell (mitchell.liam@gmail.com) ---
(In reply to Roman Elshin from comment #26)
> (In reply to Liam Mitchell from comment #23)
> > Here is V3 of the patch if you want to test:
> > https://lore.kernel.org/linux-usb/20260309-usbhid-eproto-v3-1-
> > 23bd841dfc91@gmail.com/T/#u
>=20
> Thanks it seems to work!, but at hub removing:
>=20
> [  859.967317] hid-generic 0003:046D:C53F.0008: can't resubmit intr,
> 0000:00:1d.7-5.4/input0, status -19
> [  859.967329] hid-generic 0003:0603:00F5.0007: can't resubmit intr,
> 0000:00:1d.7-5.3/input1, status -19
> [  859.967336] hid-generic 0003:046D:C53F.0009: can't resubmit intr,
> 0000:00:1d.7-5.4/input1, status -19=20
>=20
> at dmesg.

The errors are because the patch allows protocol errors to be resubmitted
immediately via the working correctly code path. If the error is intermitte=
nt,
this is ideal because it resubmits the URB with minimal delay, reducing the
chance of missed events. If the error is not intermittent (unplugging devic=
e),
the resubmission fails and logs an error. Previous behavior was to always d=
efer
resubmission via hid_io_error and hid_start_in which don't log resubmission
errors and because of the min 13ms delay, may not have even attempted
resubmission.

My current thinking is that these errors are expected and fine but they cou=
ld
also be seen as scary and a regression. If you unplug monitor/network/disk,
would you expect to see errors? I think the benefit to users is worth the
occasional error log.

(In reply to Micha=C5=82 Pecio from comment #28)
> (In reply to Roman Elshin from comment #17)
> > reverting 64cc3f12d1c7dd054a215bc1ff9cc2abcfe35832 greatly improve
> usability
> > -
> > it fixes mouse resets, keyboard resets still here, but it makes it mach
> rare.
> Does this commit change anything besides returning EPROTO vs EPIPE?
>=20
> What difference does it make for usbhid? Maybe it tries usb_clear_halt()?

I think that's the only practical difference.

EPIPE flow:
schedule_work() -> hid_reset() -> usb_clear_halt() -> hid_start_in() ->
usb_submit_urb()

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

