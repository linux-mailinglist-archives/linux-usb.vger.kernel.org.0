Return-Path: <linux-usb+bounces-34194-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAJEGw0OrWkpxwEAu9opvQ
	(envelope-from <linux-usb+bounces-34194-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 08 Mar 2026 06:50:05 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF2322E9A0
	for <lists+linux-usb@lfdr.de>; Sun, 08 Mar 2026 06:50:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A2FED3014507
	for <lists+linux-usb@lfdr.de>; Sun,  8 Mar 2026 05:50:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F48C309EF9;
	Sun,  8 Mar 2026 05:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SWbHAP5m"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1AF833993
	for <linux-usb@vger.kernel.org>; Sun,  8 Mar 2026 05:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772948998; cv=none; b=pYPiHmy0Q78GM8KLtHURMNP/zOXbSYegrQ2qAIHSLSoQcbnr3SR8fi9U7r8XXFJRxWXRECCQZmPMukBsfL4tS2gT68Y7IUNWUjtO/Si+cV6CNQvK+kKkvVP7dRQ1/S6Jw71/PIk1cb33zHJFNEZ7zOZiad3lwnwBg65DUkBcFFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772948998; c=relaxed/simple;
	bh=lobn9RC/Kto9GBKU//2MwS9LnfJwhfQX6rW/W6xuGow=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HPDu9TyeAS7JsjX5W7McZfwsYJ0+5RVfAxlbvy03APTDk4gPqVMznk7xFRbLhJyGiSphkxPrQ4HnTZEXZnm2tmje/q6rjVo9j68spCqSGRKduDzJwVJqnCE50GHnvSAhSSUY31YI2dB8pTaax6Fbj79Z5WV1LjDQmpUEYNhaYzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SWbHAP5m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 53BD7C116C6
	for <linux-usb@vger.kernel.org>; Sun,  8 Mar 2026 05:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772948998;
	bh=lobn9RC/Kto9GBKU//2MwS9LnfJwhfQX6rW/W6xuGow=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=SWbHAP5mzJ96n1qlmnaPq+yF4XPcmEloVEMLe748vEwaTk22230Fr+zxB7Qo8M0b+
	 39YjL692Klrmr92RpSoocsFwxa9ZHOdBYIlMA8BN/X7m7Gj6b1/Sfhtm4yGzaqFUcv
	 dj9qwfIKT2yURA00NEoaVZ6q7Vk543O8mN+3mQOjqiEwGo6f7L3JP+uGWcD3YOt6qT
	 tr5cUZQYDIpmccCem6h3l3Wg7HkrS8gqhX9O8LNo6luSaQ4UBM4Gh1XbgDANZ+Z8GZ
	 ZnWvu+G61zKzjUdWEbmaMD4LhYRgMoibiN5lUH4NIhg7+uachbWsxWuuQypywGWQeq
	 mcM3jmJCChXNw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 42401C4160E; Sun,  8 Mar 2026 05:49:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221184] mouse/keyboard (connected via hub) usb reset under
 system load with weak cpu
Date: Sun, 08 Mar 2026 05:49:58 +0000
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
Message-ID: <bug-221184-208809-i3ezeQcrqT@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: CEF2322E9A0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_ONE(0.00)[1];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	FROM_NO_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-0.985];
	TAGGED_FROM(0.00)[bounces-34194-lists,linux-usb=lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221184

--- Comment #9 from Roman Elshin (roxmail@list.ru) ---
https://lore.kernel.org/linux-usb/20260307-usbhid-eproto-v2-1-e5a8abce4652@=
gmail.com/

seems a have some positive impact, but it definitely does`t solve issue ful=
ly
in my case.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

