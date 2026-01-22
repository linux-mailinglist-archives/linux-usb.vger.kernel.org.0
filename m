Return-Path: <linux-usb+bounces-32638-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKxyBLl9cmmklQAAu9opvQ
	(envelope-from <linux-usb+bounces-32638-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 20:42:49 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 699436D27F
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 20:42:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F0311301185B
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 19:38:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95C8B2E2F0E;
	Thu, 22 Jan 2026 19:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uVmyuUaX"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCDD3803EE
	for <linux-usb@vger.kernel.org>; Thu, 22 Jan 2026 19:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769110683; cv=none; b=M2p++gJD4bmIBitzSaHHxvfaq6ZW+XxVDR/ISmIv/ZTBeBKsGZOBXa/VEF2I7RWjx291/aTsQTAvlAnz+RkkYB5RfuhY3KlivXFPjJNHjh/oYoM6PMx31FxGGmi0CI0k4Gwn0IACVuLaOJ++qDtg/m6S/ELjym7g1gDo23XgkBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769110683; c=relaxed/simple;
	bh=YOz2HhCbiWKOnnroW1rgmPl9l0qvLq8bzycAVgB3rNc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Kv3f22hUvN24XznPXBK42Q6FPbZtCIe0O2CBIQi3Ust7qEeZSGVP4kN2Rl0j7SXwnXVHw+PUQsO0YfZweR0tLn8pKzYtkxbkZJjS1/KlPakLbEThmiXUr61hVAmFAiEmlTJRZKxGekBynDpFhFETBkGZF47SIq0SM8rnLnEgG+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uVmyuUaX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 44126C2BC86
	for <linux-usb@vger.kernel.org>; Thu, 22 Jan 2026 19:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769110682;
	bh=YOz2HhCbiWKOnnroW1rgmPl9l0qvLq8bzycAVgB3rNc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=uVmyuUaXVWxc5oh56kqj65S8wCbYBgWZOjTRMVgQUj2P4K9xL//VWY5XiRLlUGyZu
	 8KWUaPzbMd+GkjSRqZAplXra0whW+b9MnD7QA9t2Q35vob1eH1dwTOQX5ZvmeVcjZ1
	 +1oybU2PVy5uDNJEfrumUl/aUhbnHOyymRk09sQ6bztfgHIKlLo+3kLTYDTXQdtNMz
	 Mu2KP/z98paE9stNLWa11CBKJj1hplwoWoF+EKaksDcdCtBil4cE2uYO6vpgHnTAea
	 l2o1j3SjFz4Wf18h9n0/TmzSnnUvaFAoZFum+TEavtyX/2IKiiw8tjdNV7r0tig88d
	 S5hs6Bh0M9COg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3A329C41616; Thu, 22 Jan 2026 19:38:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215740] kernel warning: DMA-API: xhci_hcd: cacheline tracking
 EEXIST, overlapping mappings aren't supported
Date: Thu, 22 Jan 2026 19:38:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: linux@roeck-us.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215740-208809-ezFKorXPdR@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215740-208809@https.bugzilla.kernel.org/>
References: <bug-215740-208809@https.bugzilla.kernel.org/>
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
	TAGGED_FROM(0.00)[bounces-32638-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.910];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,roeck-us.net:email]
X-Rspamd-Queue-Id: 699436D27F
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D215740

--- Comment #47 from Guenter Roeck (linux@roeck-us.net) ---
I (and Google, for that matter) long since went beyond that after the above
feedback ("Equally important, however, is the question of why the people
experiencing this problem turned on CONFIG_DMA_API_DEBUG in the first place.
That setting is meant only for kernel testing and it drastically reduces
performance.").

For context, we don't enable CONFIG_DMA_API_DEBUG in production images. We
enable it in test images to catch problems which are only caught in debug
images. Getting false positives in such images doesn't help and hides real
problems.

So we gave up trying to fix the problem in the upstream kernel and implemen=
ted
a (downstream) workaround which excludes the "hub" and "xhcd_hcd" drivers f=
rom
DMA cacheline tracking. That may not be perfect, but it does the trick for =
us.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

