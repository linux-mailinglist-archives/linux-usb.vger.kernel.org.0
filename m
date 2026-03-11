Return-Path: <linux-usb+bounces-34607-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yB4PBfq2sWl0EwAAu9opvQ
	(envelope-from <linux-usb+bounces-34607-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 19:39:54 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63635268B7D
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 19:39:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D818D304A179
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 18:37:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9544A3E8691;
	Wed, 11 Mar 2026 18:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TxBCZ78U"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2577723C4F2
	for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 18:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773254249; cv=none; b=cl8nIvTTigTN7vrDEd0tDkcUdmHbqmwAn7GPdFyV3uIUec8/QqCoo/sc5Ii62oBWV540Z3B8G94qH6RJ49rUxdRrXFbd9IYEppzd8R5vU+NMSlopICfZ4ZhbDwJeIrmp1ed2o6NvHrL+k56XmRxBg8BQwLI4ME7su9cvwXWd6KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773254249; c=relaxed/simple;
	bh=xIRE/W9v65bFyxv9f3ZELVrJgs9XOWPjbm+YapES8/Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sLrJPT8TBJgzPm9Y1HFNZjBHExtf/dNS73awfkaYLODETJ4DWgERiW3VFX6rIqNxCVykhBFsLq/Ye1LW2M7mKsKerSv/ZJFo8ESP1o4mH7bTB5x26KT9sVvSk18WOZ7FDCn4E8BXDS1kY45Aa7JvQkNmtdCRkWxqcTSjDlPDa0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TxBCZ78U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B7C46C4CEF7
	for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 18:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773254248;
	bh=xIRE/W9v65bFyxv9f3ZELVrJgs9XOWPjbm+YapES8/Y=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=TxBCZ78Ulxif2VaY1Jk7Ipdxml9Vuuxly8yyZpb2wdbMi97cIIJB4ZgGQ/3ohzbqh
	 r2DlYimh5t4nGus6lOq4yS0GbqtDBs7OgoTB+mba9y9Qj26Rno+iEPrtnLVKSMBlLL
	 MI9O2Nlva3ia39gT+V7Sm2oNl3mFWf9TdR+UFzAs9ThdRXHzMB824taNcYV/9MeW1R
	 MZVJoDms8c5rmA+W5TL+ECHa0x5txKOSnokoLE9LTgEswz4HIT7jJpymW6w5Y9OVB/
	 MSkneYtHoz879uHm9wMVw/0UV2vPQd2ZJ79ogtgiTHTqgZPAERB35jDSxKI6zfv21f
	 eeJXoMPkt90rg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B27D6C41612; Wed, 11 Mar 2026 18:37:28 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221184] mouse/keyboard (connected via hub) usb reset under
 system load with weak cpu
Date: Wed, 11 Mar 2026 18:37:28 +0000
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
Message-ID: <bug-221184-208809-s1qumQgsRB@https.bugzilla.kernel.org/>
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
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34607-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 63635268B7D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

https://bugzilla.kernel.org/show_bug.cgi?id=3D221184

--- Comment #41 from Roman Elshin (roxmail@list.ru) ---
> I wonder if this change would help for any of the xHCI problems mentioned
> here? And what effect it has on the EHCI problems?

1. There are some improvements with FL1100 - while test mouse silently stops
working sometimes, but after reconnecting it works again. Now i remember
looking similar issue on much more recent system with i7-13700, but it very
rare there (was`t pay mach attention on it so not sure about conditions).

2. ASM1042A seems no changes.

3. VIA VL805 without load seems better, but while test it looks similar as
before.

With EHCI it looks similar reverting 64cc3f12d1c7dd054a215bc1ff9cc2abcfe358=
32
(i.e. mouse works, keyboard resets while test).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

