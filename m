Return-Path: <linux-usb+bounces-36214-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4L/0OJs33Wk3awkAu9opvQ
	(envelope-from <linux-usb+bounces-36214-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 20:36:11 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5C93F2224
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 20:36:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5F82F30157F1
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 18:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D75B38B7A1;
	Mon, 13 Apr 2026 18:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eh9EAFuz"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE27361DB4
	for <linux-usb@vger.kernel.org>; Mon, 13 Apr 2026 18:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776105065; cv=none; b=pv6lvU8kCdyb7n2jMjfFhYtTay6oP2mXeLsF1GLs5W151DUeZGx/CPMuaNKyaVr9VomwgiVOgJJbSM1TXHkMwalW9ko/apw6m4eWE8XavU0QFSizMQeX8tJSONjQCjch10kTPuE7fw00tdfIjw11XPDSd/vRE60n71ld07PuUUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776105065; c=relaxed/simple;
	bh=4vclnz0tS+V/o+8iHQ4eqk5RaPREySLbNDprobxOZTM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gcf2XrVCk/YUUS32UHtsNs3hKzIZNJuNx09mEqJtqwjpDRqdlPU+/kGhaS/NrdmIoMt7fAGnpTT10Q7WBSpYxW1oZJCoc3AbbPN8dNnazhClbjAuS2+IwJtYycl8wmkGN3U6+/iZyzn9MzM7g5ga9qMgbr8vFL3gfmbz74jcOAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eh9EAFuz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 83DE5C2BCAF
	for <linux-usb@vger.kernel.org>; Mon, 13 Apr 2026 18:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776105065;
	bh=4vclnz0tS+V/o+8iHQ4eqk5RaPREySLbNDprobxOZTM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=eh9EAFuzm2ZjUzqD8WI/vVko6CfUFalqHUKaPpyslgP+EZdD9FBjYZ9qYKIdZYatP
	 yRvy9cZhKVFkpPa9J+vT8qghxlV/tyW5Wc63FLc7xwd2s/1/qXz2GE4fBChgaCxU1P
	 NUtd3fb36o98ZzQNZhQplE/QxUrw69w7sYRyAJj87lMqQv0p85eMPg2wZslVkvMIwN
	 DWvEIgLFb9gxJIYeizxKo8HcoA/79W8bj+dJ4RomMGFGqdFJcSw2qEbnEb9gdGsTAr
	 6zF7zZdSkHISnpRlHUoMakTm6zYfY/vPKNsPe7PE2gxVJO/fQx6sxR62RLy6zqQGD7
	 0kv66yFG8Tq2w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 74289C433E1; Mon, 13 Apr 2026 18:31:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221359] Regression/Warning: typec_altmode_update_active+0x101
 triggered by UCSI poll worker when negotiating Alt Mode on DisplayLink device
Date: Mon, 13 Apr 2026 18:31:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status
Message-ID: <bug-221359-208809-1kHCIvDyuA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221359-208809@https.bugzilla.kernel.org/>
References: <bug-221359-208809@https.bugzilla.kernel.org/>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_NONE(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_ONE(0.00)[1];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_FROM(0.00)[bounces-36214-lists,linux-usb=lfdr.de];
	TAGGED_RCPT(0.00)[linux-usb];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Queue-Id: 0F5C93F2224
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

https://bugzilla.kernel.org/show_bug.cgi?id=3D221359

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |NEEDINFO

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
Since you know it's a regression, please bisect:

https://docs.kernel.org/admin-guide/bug-bisect.html

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

