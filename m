Return-Path: <linux-usb+bounces-32613-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBmfHZzRcWk+MgAAu9opvQ
	(envelope-from <linux-usb+bounces-32613-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 08:28:28 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 326EE627E5
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 08:28:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DC6205614C3
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 07:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA3E247F2E6;
	Thu, 22 Jan 2026 07:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EzqPoeKL"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584253D6471
	for <linux-usb@vger.kernel.org>; Thu, 22 Jan 2026 07:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769066854; cv=none; b=V5ophk2nWVlcyoRa3NRneIYeVyAJWpl2M7zx9c1p27CSDuDhdBOfGWTn3DZzLJeBqPmrL4gn3dvLUefFDo9QKd+8t0psH9jNU/JVZnloQA6okawRcQkA3cXjifP0EC9l18r3CaYIA6PUdclveba5a1uLZ82xxjiIxQCotb+gUVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769066854; c=relaxed/simple;
	bh=BhVTw1JgZSJcuVnU+3NF4E3LaoA0COh6DVaz9MIYto4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ah6wJJnzTE5VwhN2kzrCrR/ACVwv7k2wjTIuehh8SmYLtE1ZTiysCC9tlwZgBZWNbDwbW3UxySq01dBAmaVmbneoWcI3KBLzlptuFupki/CC2lE3OHafqk8OQLjckkY9dZHOhmFWlomAbu00iwudPtdaNphSlu2yC+ynr0VY8Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EzqPoeKL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A4467C2BC87
	for <linux-usb@vger.kernel.org>; Thu, 22 Jan 2026 07:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769066853;
	bh=BhVTw1JgZSJcuVnU+3NF4E3LaoA0COh6DVaz9MIYto4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=EzqPoeKLtxIqhie0o/L1uBNUTLzcG3RKKRAzsU0Yf43guGT/2uhtZTyNQ7Dko0ftT
	 pLYOEkhhrhadapYXn0ew+UdJpEVoLoeDU01abwu5ZgB5wrpr7hDrH6Aoh/CFz3rN9l
	 2x4r/4mMAmHpdWijQFJbyd1VTYuPl8ahlYQEpdfXwSbSnEqKCOIaUCr9acjnlGfGfx
	 qSPw5SWH/rqC0Gxm8N0aBpcPXHzgC+vzpu6JojOcbTa0dS4krYIyVpbmh50+9K7GjR
	 aPIAUD8+SMAWg5Gh4l1mU02vLSbWfQQh1DSZPqOzjyQ41W0ZSLEEanzg3bJ+5t3gyn
	 b70+jo72UgE9A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9DB80C53BBF; Thu, 22 Jan 2026 07:27:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215740] kernel warning: DMA-API: xhci_hcd: cacheline tracking
 EEXIST, overlapping mappings aren't supported
Date: Thu, 22 Jan 2026 07:27:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.shevchenko@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215740-208809-2FVTRfDSAB@https.bugzilla.kernel.org/>
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
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	MIME_TRACE(0.00)[0:+];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	TO_DN_NONE(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_FROM(0.00)[bounces-32613-lists,linux-usb=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Queue-Id: 326EE627E5
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D215740

--- Comment #46 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
May somebody submit a formal patch, please?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

