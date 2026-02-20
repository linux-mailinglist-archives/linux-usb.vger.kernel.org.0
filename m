Return-Path: <linux-usb+bounces-33511-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGsnKAY2mGn/CgMAu9opvQ
	(envelope-from <linux-usb+bounces-33511-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 11:23:02 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF77166CCE
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 11:23:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 340733028B03
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 10:21:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E3E433C524;
	Fri, 20 Feb 2026 10:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eO7NjI9+"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AE830FC3D
	for <linux-usb@vger.kernel.org>; Fri, 20 Feb 2026 10:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771582884; cv=none; b=kpULUKoiVlNWvOEZNcjAVWAxN+vMs+/qbU5AZCivhspe34Cmm9IoPy4TvtnyF6dj+eD5noMVXvCyGseAAF1AKfF+BWiR0N0tdRNC4rvoh1TWJigGxxcJMYwkySYp+bK78uN+PBO0yRxZUyOdnBsooRePk8Yw7zWlzMmYgvPP/rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771582884; c=relaxed/simple;
	bh=YC9ZNitPFjcyXvC7uyFfzcjIExcesGL44Cd3lZWJCK8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=azfos4O8n5JU/afkoWoYonhSnmeYK4qIAU6dCmROWNMeFGHLyd9sKS5MyCOwcZUNYSqHviNwVaVqNpWPD0nmJyJ4/zad/ivsJgmm5PCZA8vbd0HifmsgAsqO7+gs58+boiFkF1g+YbkwpS4ElBGG0HTwxoc9tMIGCP8uZ7VnTqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eO7NjI9+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3E635C116C6
	for <linux-usb@vger.kernel.org>; Fri, 20 Feb 2026 10:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771582884;
	bh=YC9ZNitPFjcyXvC7uyFfzcjIExcesGL44Cd3lZWJCK8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=eO7NjI9+xHGX8Eb07vOhuoijH6UCR+s4ZjSNLAd948JncWeEQFVq54HvK1LreQ/Gm
	 oMy2IhyivqMnsyTMvrbtD3aw+qF+PdPAACoaba33eZ9vL5wvOPbws+McWqGOomjHyN
	 H/UevYRQaANvcHFwhTloHLsLwvcSKk1yIsTrnxg4hlrdSJhl2/38VT99FFc6SqbKqZ
	 Q3mrZKraH0Mr8YxoSoCo2RRyZYaAac6SXRaqtHVyRvDG6V56hV0MCPyEUZdOC0Y3dY
	 ytSkUw1UvtWKhcDojcr1DKsjvYuNpwBxzEaznpDuOJ5sBuRvL3CBz5r0HLYLn8ydsI
	 SbXpvGLk5Yk4A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3264DC433E1; Fri, 20 Feb 2026 10:21:24 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221103] xhci_hcd: System lockup under CPU load during usbfs
 polling of USB devices on AMD platforms
Date: Fri, 20 Feb 2026 10:21:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: paul@unnservice.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221103-208809-RKF3XHRz51@https.bugzilla.kernel.org/>
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
	TAGGED_FROM(0.00)[bounces-33511-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,unnservice.com:email]
X-Rspamd-Queue-Id: 1CF77166CCE
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221103

--- Comment #11 from Paul Alesius (paul@unnservice.com) ---
Oh worry I meant:

The machine where it locks up is a PC, it has ethernet in the motherboard t=
hat
locks up

My mobile devices like laptop, only have USB, so I thought I'd try with a c=
heap
ethernet dongle on them instead of getting a specific Asus serial header th=
at
cost much more

Thank you

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

