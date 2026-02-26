Return-Path: <linux-usb+bounces-33763-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Et7yDHjOoGmTmwQAu9opvQ
	(envelope-from <linux-usb+bounces-33763-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 23:51:36 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2211B08F4
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 23:51:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 64EFA302C76F
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 22:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3117844CAE2;
	Thu, 26 Feb 2026 22:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gfRGWK9u"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32E5426ED4
	for <linux-usb@vger.kernel.org>; Thu, 26 Feb 2026 22:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772146292; cv=none; b=t3CUAREn1y7PKHvoIlGqBd9STpmdkC4iY0NkmzlJnhQqPJgVEGm9jdhVgYrQs4sRKuGffmTPMZJr0z+f7lKAnQf16NfOE3Iu81xMyPUu9wPguYP0DMJ4PbDVo1xOokEber+/298D5HvqWZXBXrRIKTf2DoUnHlPZlqooILH9Cj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772146292; c=relaxed/simple;
	bh=UawS3vk1DKehlKtAh4rySqe0ZE3X4MBrDTFn27MQ4X8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aqXoLUb+WwwtDKcJY+6mygRcCS31znFuN7+mRS8zea87ek0Yde0koYPrwMdWLPm5M3MPVFwD1NK5dgW9Pr1v6jMFGc46moudLCzqcukT6oShI+psam6JeSG0cb1qbL+JV0YNeJGveGwKGDzhrBTRpmu4EAtV9HvwrDXKW/Uk0F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gfRGWK9u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5EB68C19423
	for <linux-usb@vger.kernel.org>; Thu, 26 Feb 2026 22:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772146292;
	bh=UawS3vk1DKehlKtAh4rySqe0ZE3X4MBrDTFn27MQ4X8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=gfRGWK9umYezwtGPICKNDeUJ+93Vwuc5OgSmLBscEgXpzOCjvX4tdXro7HEUkuQOj
	 CaMOM2xZoqAj53poZDJGZOv4bW+BzQ9pspZLw4QAwLNxdUA0iN8WEYgBPb7xyRgwId
	 I5vSa7m4lxS11ReXWt/Vd/K+J83laTyuBURkHIvAvjPFn8Nof/94gQ+kGp4I9NHrF2
	 MqKl9HLqqIvkZDUWP5HTz0tgY877+oH7D39NTBY4L88mWpUxnnzE+csma506NjOq6i
	 yoNNVaZrx1VX7yW0Jk3IL/Gv7L8LYz6qjftAnveUn59jF2Z0maceaDK7Pxnt8t/+sz
	 C7Qwsr1qr4wng==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 53E86CAB781; Thu, 26 Feb 2026 22:51:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Thu, 26 Feb 2026 22:51:32 +0000
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
Message-ID: <bug-221073-208809-fpOCRcuW3m@https.bugzilla.kernel.org/>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33763-lists,linux-usb=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9E2211B08F4
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221073

--- Comment #14 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
Interesting. Your new dmesg shows that the quirk works: all driver state is
discarded and the xHC is reset and configured again.

Also, with or without the quirk, USBSTS on command timeout has the EINT bit
set, which means that IRQ is pending according to the xHC and our handler
hasn't cleared the bit yet, which is the first thing it should do when it r=
uns.

Obviously the HC could be broken and ignoring requests to clear the bit, wh=
ile
we also have a bug which causes pending events to be missed by the handler
without even logging an error, but I think the most likely and straightforw=
ard
explanation is that IRQs really aren't being delivered for some reason.

Unbind/bind possibly helps because it frees and allocates IRQs again. Maybe
disabling MSIs (xhci_hcd.quirks=3D0x40) would make a difference.

I think at this point I would try emailing linux-pci to see what they think
(I'm not sure if that subsystem monitors bugzilla). Because it looks like t=
he
IRQ simply isn't being reactivated on resume.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

