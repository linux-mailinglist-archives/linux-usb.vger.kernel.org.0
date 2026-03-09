Return-Path: <linux-usb+bounces-34372-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLz7D3xDr2mYSwIAu9opvQ
	(envelope-from <linux-usb+bounces-34372-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 23:02:36 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C363124208C
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 23:02:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9C7893024440
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2026 22:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A56436EA95;
	Mon,  9 Mar 2026 22:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PAQzQ+Xx"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4F236D9E9
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 22:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773093738; cv=none; b=qJPA7IbHrO0/RIngUpCTj6QiY+4wCLCpffAxpJ67ZRcDn5WGDTSAc2Hy4OjjcKFZJW46MbueE54Y+eSJz+zbztSydjzWGLh6NClfU4kW1+OutC2Ow0TUUrA2Ory53y2emHaK6IUOS7w8Fw99g7A9SCXQhhJfOXGcOuJO2yDM0rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773093738; c=relaxed/simple;
	bh=znTPxqZgMSRBhGcy897F0PXxofs+S1tT2gfwNMwoOv8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BfjVSfO1p93YpXGS/2lhfpiS9pRkBx0pGgt5D4uzdkDwnPEeiCW4WZl/f3NEihQoT8yzmBhKo4/ZSjeDiVSBHoiLV4+/zQ1QDq0tYJBJr/097Eo5pGipgGkho4LteUTxk6nos+qVbVOYNcd9RA1iXceYiBbPpkseHG6tgrSUQ0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PAQzQ+Xx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CCA33C2BCB0
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 22:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773093737;
	bh=znTPxqZgMSRBhGcy897F0PXxofs+S1tT2gfwNMwoOv8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=PAQzQ+XxGkCm5AG8dXChwh1i99IwaUQ36lvbILl6I2edyXs+4erEvzqUGEngmkuIB
	 ZXGYtneApROIuNHnr4Zwr2dGfm3U6MOCPtemhgF2+3ZUKawfRXXNKXkW5CROL7gW8d
	 TVtvl4DGCesNIe2e9P4Lv6fea1/uW+AoY6yfVfJU6vLbUqAZFDjL5Xn7R1OPJCV5KQ
	 Cl71q2zAFWCVGMgn6eGP6vtogASmVA580eZEKN9Z8Pz615QWFp4H2JJTG/08shrZeG
	 ju5Q9tRIHKwvWfMk4m8SwAlLL+FFsWziMf9Dn3z3dWB6rHU12lFPuAciHI1n6/s1wN
	 +r+Pa1IrbHHBg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AD304C4160E; Mon,  9 Mar 2026 22:02:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221184] mouse/keyboard (connected via hub) usb reset under
 system load with weak cpu
Date: Mon, 09 Mar 2026 22:02:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221184-208809-j3tq1UfMYD@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: C363124208C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34372-lists,linux-usb=lfdr.de];
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

Micha=C5=82 Pecio (michal.pecio@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |michal.pecio@gmail.com

--- Comment #28 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
(In reply to Roman Elshin from comment #17)
> reverting 64cc3f12d1c7dd054a215bc1ff9cc2abcfe35832 greatly improve usabil=
ity
> -
> it fixes mouse resets, keyboard resets still here, but it makes it mach r=
are.
Does this commit change anything besides returning EPROTO vs EPIPE?

What difference does it make for usbhid? Maybe it tries usb_clear_halt()?

(In reply to Roman Elshin from comment #22)
> just made a quick test with several pci-e usb cards what i have
All of these are USB 3.0 and use xhci_hcd driver instead of ehci_hcd, which=
 is
a separate can of worms (also bugs). Resubmitting without usb_clear_halt()
gives 50% chance of toggle mismatch and losing the next packet on bulk EPs;
AFAIK interrupt would do the same. And in some cases usb_clear_halt() may n=
ot
work either.

Were you testing with devices behind a high-speed hub, or a full-speed hub,=
 or
connected directly to the card? BTW, VL805 contains a built-in HS hub.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

