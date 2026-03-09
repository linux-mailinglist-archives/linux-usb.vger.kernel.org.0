Return-Path: <linux-usb+bounces-34289-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHpuLfyvrmkSHwIAu9opvQ
	(envelope-from <linux-usb+bounces-34289-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 12:33:16 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA6D237F87
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 12:33:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29B623031309
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2026 11:32:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C4E139B94C;
	Mon,  9 Mar 2026 11:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cNWE6EoW"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF86739A061
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 11:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773055921; cv=none; b=j5Tujvep3ETGivEkm9ytHt1rrgdFbXuRg/5xUkBh0rk2Eh3ULLP4073M2Y3fki5iXbYfMUu/kbQhz7ysoEdyya/NJ4WMtdq+BYKIL0Vedv+CXBhAYafKfCFh3jU/tRiQgu8r4/ceTa19gG2QDS149exKJjc7XOTSfN8G7Hy9IR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773055921; c=relaxed/simple;
	bh=klJgqOkE114v525ca7NikGiP+dnd8dm0c/K8oV/l5lI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jzJg5CuAxfg88wOrasG/20RlULhWHZxqeVrH9/DRPP38SxkVLXgm6OI6JcyttSFX91Q1VVq0MrL+8qDKEkVI8WxPbf9uA31otquq2fActYGOZKTlLmkjSXgWdONGrmNcOsnh9wlzSaZ2I4qP70Ci1sCNbrv8YJQp1GauOsHWK20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cNWE6EoW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 45246C4CEF7
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 11:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773055921;
	bh=klJgqOkE114v525ca7NikGiP+dnd8dm0c/K8oV/l5lI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=cNWE6EoWmlpxm0BrIm8xfREYGPVDfVJXfBQSoGRDXiIgGXAjoBV9ThJuJXSYj/E1X
	 LASua0TDVLm4gtwwiZ9k18IDPn4+8UYv0qYTtgp2FeTSCGPy6W1868Ff6Fo9I5DhDd
	 qIGsPXfSQHuWidf+UZ9mLSYc+redK5rF6rLb9z4xevICxIA6cq56Ud91h5OD3w568q
	 a5ixtWlPcdf+bY9H/5OiZ8p0sBhKVB7u1i/QjmUGgg/aJWxuWrOjLKkdS5OyvNV9V0
	 N2r+Am8sbgmAFsfzpCfRc4cF8LKTd8RgwdcVQ4ubre4MAMx8HjwI29gI2xKanvwqmB
	 8EKz487Lwr+uw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 37E8EC3279F; Mon,  9 Mar 2026 11:32:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221184] mouse/keyboard (connected via hub) usb reset under
 system load with weak cpu
Date: Mon, 09 Mar 2026 11:32:01 +0000
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
Message-ID: <bug-221184-208809-ar5NX8m2RY@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: 4DA6D237F87
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34289-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.988];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221184

--- Comment #19 from Roman Elshin (roxmail@list.ru) ---
> Try modifying the 500ms to 200 or other and see if there is a noticeable
> difference.

I was try some different times, and now i suppose that i was wrong about
positive impact - sorry about (in some moment  i thinking that 150ms almost
good, but looks like it little random...)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

