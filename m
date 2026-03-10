Return-Path: <linux-usb+bounces-34398-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FXQLKbur2nkdAIAu9opvQ
	(envelope-from <linux-usb+bounces-34398-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 11:12:54 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBB72492F4
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 11:12:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BAD93308B9BF
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 10:09:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04FAF449EC2;
	Tue, 10 Mar 2026 10:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D0G8s+lK"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FB22AD3D
	for <linux-usb@vger.kernel.org>; Tue, 10 Mar 2026 10:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773137379; cv=none; b=L1B/asARsRcZkWgrt1f30yyVIeOFnO8o4gJ1H01vlJctR5FCDV7s9hSbfcMg5zNy1dhN8Mrp+USX/SkafYfgjatmQ8Cmk5kRVx8GvyMitY8tNrWBsubm5c28sWMyKA2RUyZKX0K49PcRLviR1IS0f7f9dGjYWXyu7/aROxh4rVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773137379; c=relaxed/simple;
	bh=4M4vcF+tZRZsR+pyTXZOEr8qTFeUdZYcbdPQoX9GsDE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UfpdK1sxWDLgEkGwgJoHEPvB50IjMlyyadukFoqO9so37gkAG2KsYc4UO3u8P/JB6Z39i7nEyNLUhjBYXaf4qLbRnVFCKOvQ6z7sPv2FCgkzebxhLlOBGZIGVs7fNxzEDAzpIMUH3bFN47Svzv65o+Q1HFHguf/gyJXJM62Tr40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D0G8s+lK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 28415C2BC86
	for <linux-usb@vger.kernel.org>; Tue, 10 Mar 2026 10:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773137379;
	bh=4M4vcF+tZRZsR+pyTXZOEr8qTFeUdZYcbdPQoX9GsDE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=D0G8s+lKSus8iTOlVIXi93p5HLA3bYiAGEGTK8eo4JjL00yHoIvd21U1lzIQ9cxtg
	 Xk4EX5g/mibRV7jNGH6EXRGURl/R2qaUoI2QuO8XMo14XUNF4cIyvgIT5bMxRqxLdg
	 u7wC05lveJ/BmPCY6UilsRSo6xTgUa1N0rqHk36grR+okWIUwtjypDBrAZgGnUWwO3
	 n8onMM6lfvmdyfzm4RMLOyZoib4I9zRvxJIULOXwEKGSHAFP+xvsKN1zj49vpHQGDZ
	 b8/u7OYToI0AAtCU4dwempZ3aEk/fma/nmTk+EjwNXs25DbWfLEstz0j3mfGl7bf/0
	 n55gls7xj5a8g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 21944C41612; Tue, 10 Mar 2026 10:09:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221184] mouse/keyboard (connected via hub) usb reset under
 system load with weak cpu
Date: Tue, 10 Mar 2026 10:09:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: roxmail@list.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221184-208809-DwyIXX2L5c@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: 2DBB72492F4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34398-lists,linux-usb=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221184

--- Comment #32 from Roman Elshin (roxmail@list.ru) ---
> My current thinking is that these errors are expected and fine but they c=
ould
> also be seen as scary and a regression.

I am agree, and was mentioning it for case if it`s unexpected.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

