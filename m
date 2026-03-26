Return-Path: <linux-usb+bounces-35521-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBnPMYCNxWlG/QQAu9opvQ
	(envelope-from <linux-usb+bounces-35521-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 20:48:16 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9054B33B1F6
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 20:48:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0BE5330427EF
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 19:46:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C83A34DCEB;
	Thu, 26 Mar 2026 19:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jg72Ar9I"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF2B34FF45
	for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2026 19:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774554393; cv=none; b=hTH0SUuYG3fPghvjLPqKtssgP+aMrZzzOk22ote4f3Pz9uipA9jfSEOGTryzAG7OH0fAEpR37zg6HSEOC9slGWwbuRJyWnD1d4YMnvnzbzdr2+z+w8lYXYrLpAQFfw/hmALq2Dyl+rBhfn5XDu0k4KdtIerXjRkExvKnPAlrYQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774554393; c=relaxed/simple;
	bh=c2IVIePw9exRcgvboOiFZIPfTHGl2gVwM6kP2dgzG7E=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=C8rFwMVXsC0dzIO3id4K4muDphfMjMSnhkLVO1+uDnManlBwC7HRPqW1tDZ1NURCJ/zstwRDH6Mtm04KiputrCAiTRYN+8rM3LUlTMqJ03h3tiI07kaF4pdlc/jGuaoU27BfhpEOR1xe4OVGTRHPBnlQlKKzuURB0DVwh7XkVA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jg72Ar9I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5BE6C19423
	for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2026 19:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774554392;
	bh=c2IVIePw9exRcgvboOiFZIPfTHGl2gVwM6kP2dgzG7E=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jg72Ar9IzpSh1A0/dalEcGqAhSJN1WFcN3vbxKLmyNts/dhMTIs7+QULuR/D2GVSO
	 t62Sb5nAe0xOZHKzNzyIDJx5a1jzeupO+SuPbDF7vjWcmlbePd67DR3CZQEgHC3F/i
	 X0AMDKi6SbVFizPKZuKVgtO+BHsCm+5dX3crcWWaHpTvn9bL+CNYt5k6nyXCyWoIG0
	 DfHAQXayMKIFWYWCHrmx9SFtTVoFcT8Ma5K06FdfofmkUiQ8Dgg1O2kMUBdR3ijDnu
	 ICTLL/35eISyrmI5sy3ck/eg6+/SmvvGrvWKwH7o61DR9O54DVXJkrqdaKjDnkrRgB
	 g1fyFwQ1CIajw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CF771C4160E; Thu, 26 Mar 2026 19:46:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215740] kernel warning: DMA-API: xhci_hcd: cacheline tracking
 EEXIST, overlapping mappings aren't supported
Date: Thu, 26 Mar 2026 19:46:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mikhail.v.gavrilov@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-215740-208809-diamE8VkAv@https.bugzilla.kernel.org/>
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
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35521-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,gmail.co:email]
X-Rspamd-Queue-Id: 9054B33B1F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

https://bugzilla.kernel.org/show_bug.cgi?id=3D215740

Mikhail (mikhail.v.gavrilov@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mikhail.v.gavrilov@gmail.co
                   |                            |m

--- Comment #51 from Mikhail (mikhail.v.gavrilov@gmail.com) ---
Created attachment 309769
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309769&action=3Dedit
dma_cacheline_eexist_repro.mod.c

I hit this exact warning on 7.0-rc5 with an ASUS USB Audio device
(0b05:1a5c) on AMD B650E (ROG STRIX B650E-I) + xhci_hcd 0000:0c:00.0.
Same stack trace through snd_usb_ctl_msg -> usb_control_msg ->
usb_hcd_map_urb_for_dma -> dma_map_phys -> add_dma_entry -> EEXIST.

I tested Guenter's patch from comment #43 (ARCH_KMALLOC_MINALIGN =3D
L1_CACHE_BYTES when CONFIG_DMA_API_DEBUG) and can confirm it fixes
the issue.

I also wrote a kernel module reproducer that triggers the bug reliably
on demand, without needing to wait for a specific USB device to be
plugged in during boot. The module does exactly what hub_configure()
does: two kmalloc(8) allocations back-to-back, then DMA-maps both.
On x86_64 with ARCH_KMALLOC_MINALIGN=3D8, they land in the same
64-byte cacheline within ~50 attempts, triggering the EEXIST warning.

Before fix:
  dma_repro: pair 53: buf_a=3Dffff8881c8f9eb80 buf_b=3Dffff8881c8f9eba0
             -- SAME cacheline 119793582!
  DMA-API: cacheline tracking EEXIST, overlapping mappings aren't
           supported

After fix (ARCH_KMALLOC_MINALIGN >=3D L1_CACHE_BYTES):
  dma_repro: no same-cacheline pair found in 64 attempts
             (ARCH_KMALLOC_MINALIGN may already be >=3D cache_line_size)

I can submit a formal patch based on Guenter's fix if nobody objects.

Reproducer module source attached.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

