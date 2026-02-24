Return-Path: <linux-usb+bounces-33650-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iD/TKNiXnWnwQgQAu9opvQ
	(envelope-from <linux-usb+bounces-33650-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 13:21:44 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F16D7186DD5
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 13:21:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6BD103067FC6
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 12:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA5EC396D08;
	Tue, 24 Feb 2026 12:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bPEEitS4"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E9C26F293
	for <linux-usb@vger.kernel.org>; Tue, 24 Feb 2026 12:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771935699; cv=none; b=inpMz7M3ploH/N8jhtFaeiuEDM4uhM+jdQzr3+RpnzQDfz17CG9rbku9sZ1Ke330MYx2gJqnhpJqfHEtzEOhuTLKT91bS3sim6oXJCSPHfctAmjVVV/3H0jf5aDaGBhX/uTDnyP/p0YhY/cmGtJpLdPg/fC+fufS30yOqMcewYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771935699; c=relaxed/simple;
	bh=MdTMWMLdM6Lh3XtOjC36G+8VprFvc/WYA64mAbu8mAU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SX9hcKG9BQkljvSMzsIK2uJslgsrcRACjAYoph8O3aLHulf4VYF5QUtlT0J8SMZhPL83l6veGN68UWNVVlmbvjPSU66TvduOoF8bpJlEf0YoSmBRySxWddVllfJFJMT/H/R5VzTaX+x/Op2str7oGJjkst0yd8/X7Iow3gCt77g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bPEEitS4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C5BC9C19422
	for <linux-usb@vger.kernel.org>; Tue, 24 Feb 2026 12:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771935698;
	bh=MdTMWMLdM6Lh3XtOjC36G+8VprFvc/WYA64mAbu8mAU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=bPEEitS4tYjyuOj5+Mny9J+l70ttgIaMMLhbR5vmaTC1X9NcU+Cc2frcRUcXxPlXk
	 hA8ejv98PnZYeqfJA5myW4Wfk6iKleL9FlXwIOj20+XjGQVPari/UN4NyMzjStnQ4H
	 mLZIkECqvkt0cZvwX2W9SVmf0gn/iYmhQJ7BLR4wBaIuK0Iuvpky40P4NtoAFjnR8T
	 hG4VM4CWpDxUgmhjfsAL41QJe0JBNXJkf75e6SbLT2TiBCjXUgFh0+zSCNm4fDKRAT
	 CtY6HxfVF4do+UkdswUXEj1Fe/1oYEqHSfLYIXYtTvJzan+TpN4rtMh4u3SP7XxYsp
	 3UwdTpi9YyyiQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BD1EEC41614; Tue, 24 Feb 2026 12:21:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221103] xhci_hcd: System lockup under CPU load during usbfs
 polling of USB devices on AMD platforms
Date: Tue, 24 Feb 2026 12:21:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mathias.nyman@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221103-208809-smti6oWiSg@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221103-208809@https.bugzilla.kernel.org/>
References: <bug-221103-208809@https.bugzilla.kernel.org/>
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
	TAGGED_FROM(0.00)[bounces-33650-lists,linux-usb=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F16D7186DD5
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221103

--- Comment #23 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
Created attachment 309444
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309444&action=3Dedit
testpatch that retries xhci resume

Testpatch that retries xhci resume 50ms later if xHC status register read
returns 0xffffffff

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

