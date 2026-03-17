Return-Path: <linux-usb+bounces-34953-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4FUxFi+AuWmxHAIAu9opvQ
	(envelope-from <linux-usb+bounces-34953-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 17:24:15 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 504522ADE5D
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 17:24:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CA87A305C7B6
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 16:18:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37C2B30648A;
	Tue, 17 Mar 2026 16:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y3SZmKqx"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E962FB97B
	for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 16:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773764315; cv=none; b=isIQImFkM9ocG3vrHHlmdZo1Ej4EOqyoxKCOB8y4rKx4F1iNuxpCr54VZbpzTKcjMdVDlQEHYlpUb4DojrY6leT7fX8O5rA6mKRIMQszCEaqllNbE0YsgC9xKV30/Vjgr+ZQxIm36WbtZGHuQ9UYaCB+/RwcfOFdzTwmHxGKNKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773764315; c=relaxed/simple;
	bh=GsG8KG14HRphzjxIc4BdNuLif46n635dpGjcfbvoIpY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mvqtlqvsIw3UHT+vQx1lv7xDcn7PJL67nPlubSL09Am7NgYDytrWYiNnjtKGktNZm0U96sxWQYUIAJHEvLl7EAyRkb7r3b0hBqWsnCYQrBXgONQbjCW8O0hH6+9wKJCMGz+h3lhXJVq9lO5xRJ4wKPM79aLI48txTDgDfpoF+1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y3SZmKqx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5E837C2BCB5
	for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 16:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773764315;
	bh=GsG8KG14HRphzjxIc4BdNuLif46n635dpGjcfbvoIpY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Y3SZmKqxkUGG7/XJ4uoDB9v0QtH00tvHIggLP4VrmDEAXbzLW4ovmHdSgkgqZFB51
	 PSpsgfqcFuRcjxQJmuNu7rpf4P07E6QlSgPoZEN9G0rw7ObQl2mTQST0oq9Quz6pKv
	 QOAPALuwaxchuOKnsWLJifXJuf6zwpThu219UmE+VUk70BcH64sS9OpeaRCmfxK2JB
	 ZXHCDuHlNlLHyTxXc3TJPZ3HrqPY6mcyS8JHBKVguEhtRJs5hfdlnA3PM6zwPWcb6H
	 Ugh0aDlCdNs5XAAkERxb2w8f+hdSGbVC9xIL6A1Eej7E8TD43vI/o6g+2MTKnzUZh5
	 gxtokq155Ockw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 57E31C41614; Tue, 17 Mar 2026 16:18:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215740] kernel warning: DMA-API: xhci_hcd: cacheline tracking
 EEXIST, overlapping mappings aren't supported
Date: Tue, 17 Mar 2026 16:18:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215740-208809-7HdeB0Yv5j@https.bugzilla.kernel.org/>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34953-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,harvard.edu:email]
X-Rspamd-Queue-Id: 504522ADE5D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

https://bugzilla.kernel.org/show_bug.cgi?id=3D215740

--- Comment #49 from Alan Stern (stern@rowland.harvard.edu) ---
As far as I'm concerned, the patch in comment #43 seems to be the most
generally applicable solution.  If anyone has any better ideas, they should
speak up.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

