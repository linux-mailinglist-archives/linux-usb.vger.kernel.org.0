Return-Path: <linux-usb+bounces-34317-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDKAB83vrmkWKQIAu9opvQ
	(envelope-from <linux-usb+bounces-34317-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 17:05:33 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0DF23C684
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 17:05:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 652D23090EF6
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2026 15:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0095E3DA7DA;
	Mon,  9 Mar 2026 15:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TSSwVzfS"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BC23E0C73
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 15:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773071899; cv=none; b=tFG/kTG/GNu2lmV1k4cqrlc06MwCu/pjOPkPiGny0xeulE6ys7vsi1ITvjl/skA3Nu3UcssyqKjHABI/rIoMKAnZAzVgDSTt8WtVncZbaUdaNjZaxCqHjT6ObC0rzJ/Qkfp0svwlnbSpVzerzqdsYBXvIJcSzkpQrE5IWeo2Gas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773071899; c=relaxed/simple;
	bh=1JUeVJ8/EiUM+eYFcNJ9hFH3QAz1lSzPDnY1Vx8cJQ0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EyG6VrAOnqUdLGTyuGJF8nDh/AOJF6J669JE7BBrmTjvsaorcaOlHapowlVLvSIIqh65M0BdxSfCckDDvWjkBdG0KUjfYZj/ylb8ZQ258/fBvc2oZtd2DswpCM5khktGrf/rrZEr9XGavOAX3akuijhRJPiymQJMnrB399xc52Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TSSwVzfS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 275E1C2BC86
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 15:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773071899;
	bh=1JUeVJ8/EiUM+eYFcNJ9hFH3QAz1lSzPDnY1Vx8cJQ0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=TSSwVzfSNipo82nKKyJPx+NuI6NPbHmVM3UulshD+h5r8AysV0auBdBY+MHTJQ62R
	 x4EeqAzZtOxId9YjW9nrc3WcF/QFBIDl7p2jUt9F/kMtyxRhR8t7l7wOLM92xCjTLt
	 kKE2u4vrH6kWHDiwcXzBn7bhiyCtlHhpCL61eGIr2DHr7PM2x3EpSJuIu2mzzUiWp5
	 fJpbUzOAaff5W5jN9bOEgQdnuq/PUzPFXio1ZQpdAxUlR1ncyOY3HvRKt+JKAk5WOA
	 LKwKmOw5UM5SdeafXEft5HRcEzf34TurJLc7alkN1/m1fK0ft8hkQDDv7ZuTJeSvEi
	 HsdnPumukbS+w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1FC5AC4160E; Mon,  9 Mar 2026 15:58:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221184] mouse/keyboard (connected via hub) usb reset under
 system load with weak cpu
Date: Mon, 09 Mar 2026 15:58:18 +0000
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
Message-ID: <bug-221184-208809-EU6zklYrCA@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: 6A0DF23C684
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34317-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.985];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221184

--- Comment #23 from Liam Mitchell (mitchell.liam@gmail.com) ---
Here is V3 of the patch if you want to test:
https://lore.kernel.org/linux-usb/20260309-usbhid-eproto-v3-1-23bd841dfc91@=
gmail.com/T/#u

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

