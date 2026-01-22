Return-Path: <linux-usb+bounces-32610-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UL9LKl2tcWlmLQAAu9opvQ
	(envelope-from <linux-usb+bounces-32610-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 05:53:49 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1499761CA0
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 05:53:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E60A24E14B9
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 04:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A41031A077;
	Thu, 22 Jan 2026 04:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q6xFGVaS"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3F33A7DE9
	for <linux-usb@vger.kernel.org>; Thu, 22 Jan 2026 04:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769057618; cv=none; b=sgHxGaAkG2wcIGCnE27vw629OgzMcJTJ0vnZcKQ3ULnIPRNoM0psxNdmc5CUWVaOGfo23m7gDY83VQYw85wU0d7LR1NFMGxBtH5PkI80sitPm3tlVb6zv6kw+6qIRUMcXAfyXPtwjYrM8GyjMrELutHuSXm6v8QjjspiB8CLqwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769057618; c=relaxed/simple;
	bh=hLjvfZK86XHAkhdnc1/aE0h1bdHUcTpUWd4Yax5wqfc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nSbha0whzwetIOMfLpOEQ1Fxp9YFJEfl0ijK6Z0ir1qD8Uaa3IhPpILP3uWnG+KANUXw2yxOh2jAHQ50jEOG9XaRSeVfPJSN7ahvAyHtrFR/hgrU8g775dFMa1aVDSrTjqWXBDQLXeIkm6TnZftYDwDGwBlxGt+CtgYkBxGlQXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q6xFGVaS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 22AD9C2BC87
	for <linux-usb@vger.kernel.org>; Thu, 22 Jan 2026 04:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769057618;
	bh=hLjvfZK86XHAkhdnc1/aE0h1bdHUcTpUWd4Yax5wqfc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Q6xFGVaSfH0V0/7CUNgWdNBTSt07dzO+vkCrtDgWdJrOB5LxDDZ0FSwRgYdC6i2gI
	 G5fk1SCCAmaibTBe5kJAEONfLIB3Glc4BGgt+19e/7f8EdpPTbOBGog4xy9CR/kT/S
	 Dq9zoCLcO3bRHLAzGIv9oBXad7u8sOr27M2i2PAxjIiuK/IwQgNdy70hT+9MjKGtEr
	 dERmSOsFGcwotkvIQoGePSedXxjCexUqmTS5pGZyfrCu0hxfQFw5RvWs6Ks685Aykn
	 rHYzhP/+TlUUcDekSUFTUDBKg86L/GhDYjjiPty5rgMk0jjCLSMr7lv+ngYcRh3bEI
	 tFHq9GCfV7A8Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1B7E2C41616; Thu, 22 Jan 2026 04:53:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215740] kernel warning: DMA-API: xhci_hcd: cacheline tracking
 EEXIST, overlapping mappings aren't supported
Date: Thu, 22 Jan 2026 04:53:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: Jeff.kirsher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215740-208809-gzRbfsB6X5@https.bugzilla.kernel.org/>
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
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32610-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_SPF_SOFTFAIL(0.00)[~all];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_NONE(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns]
X-Rspamd-Queue-Id: 1499761CA0
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D215740

Jeff Kirsher (Jeff.kirsher@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |Jeff.kirsher@gmail.com

--- Comment #45 from Jeff Kirsher (Jeff.kirsher@gmail.com) ---
I was able to reproduce the issue and I tested your patch on a 6.16.12 kern=
el,
as well as a 6.8.0 kernel.  You patch resolved the issue.  I was able to te=
st
this fix for over 4 months now (sorry for the delayed response).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

