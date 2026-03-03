Return-Path: <linux-usb+bounces-33914-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DRJIv/2pmmgawAAu9opvQ
	(envelope-from <linux-usb+bounces-33914-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 03 Mar 2026 15:58:07 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9138D1F1E37
	for <lists+linux-usb@lfdr.de>; Tue, 03 Mar 2026 15:58:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3A5A4301BD61
	for <lists+linux-usb@lfdr.de>; Tue,  3 Mar 2026 14:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 637933D5640;
	Tue,  3 Mar 2026 14:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dEoopcOK"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F12377003
	for <linux-usb@vger.kernel.org>; Tue,  3 Mar 2026 14:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772549738; cv=none; b=f7W1LcOp4krsugx2dSV8BNPEssBoRLXvRbI1mWK3+2/kpCJRdCJmv6UBXhCzzWrnZoovCK+J56AIsHWhj2f2AGapSZ6qh5bHf3YiuimYihWHDIyXsFHHyhInNaMbv1LQsA++uMfq36iyXcjcmLD4O9jrxcY9LAvHVNs2B3r22N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772549738; c=relaxed/simple;
	bh=dM3+weOR1lvj/sB7+Ey0PWdez7y4KcWB0Oc0h7fiViU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jOIVSH6dWDLmMzvswGNeGqCVUFzfm4vVyJecKCtBfUGilssPgFGUSnIggWygcY8iSPhvkW8b3XD/IeluyZN2L+CJ1BVsbuS/VO6wAB0PAeTEkJpuSjyZjMXYqx9DDy3E6AQY8aaCs491rexe86SSQtpoMmZphzeE/sqVNfHIQKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dEoopcOK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A2740C2BCAF
	for <linux-usb@vger.kernel.org>; Tue,  3 Mar 2026 14:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772549737;
	bh=dM3+weOR1lvj/sB7+Ey0PWdez7y4KcWB0Oc0h7fiViU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=dEoopcOK3FMhmagjMCvQTqE4MpuNBgBAYXRDODUkDAdBcb/FOHAQ5cDauO7OmoEQK
	 lZxJctEaNHUIMnhtlVmFKq/SVbPU5mZfeZ03Jjl0yrREPY7a+jz1tqOLIHj7DB8h35
	 HyFkavub/uUp/z0rwxt3+VY60M0GoJPYtKmqH2CLAHI4qvk/t2VYShYe0svkd61qd/
	 ZKZVsa6pBxk7o2mH92RCAhtoUGCjqTFHPyloaxAJrG61/9j61yVqd9v96SgBgvbZRV
	 EyNAV04NiKZ6kF/Vpu9GcA4R4KoiWGxQ1d2u5xnSAQcTpsm5DNJRH/ybLRz1aZW4PX
	 EkIRtNPmqc/Bg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9DA87C53BC5; Tue,  3 Mar 2026 14:55:37 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Tue, 03 Mar 2026 14:55:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: david.c.hubbard@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221073-208809-KCyMuQzTNU@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: 9138D1F1E37
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33914-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-0.992];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221073

--- Comment #22 from David Hubbard (david.c.hubbard@gmail.com) ---
Created attachment 309525
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309525&action=3Dedit
comment16-dmesg01.gz

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

