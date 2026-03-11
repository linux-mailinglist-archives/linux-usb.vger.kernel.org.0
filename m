Return-Path: <linux-usb+bounces-34555-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGObJ3NmsWnsugIAu9opvQ
	(envelope-from <linux-usb+bounces-34555-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 13:56:19 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 27760263F7A
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 13:56:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E7F20301A2A5
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 12:54:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A62CF27B32C;
	Wed, 11 Mar 2026 12:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RcqTghTQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3646727587D
	for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 12:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773233696; cv=none; b=YvTm2ARbOQFS67ar05tQn/zsY6x+9vCYJ0Gb2tn6uqVB+OnbaYnWnjFNf2xc1935f6olcPFNOkhxCW3TnxhjwqFs8OCPmjSGZwgHyVPe4tgwexsXEWEHPwCkD1lfJcRcXrcmG+oqpG+AwXCpI311Ps1Eyc0Aa7y8YtCAEOcWPoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773233696; c=relaxed/simple;
	bh=XaDDSu+OBq5QAFD2utYNHF0/GH96EoF1yBGocvYMBts=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Xq34bSKNsYnLUb6jbPwQGmn3F3jhXpJw0W9T9eOCMF4TyCSREoFJhVkrxCgthcKTg49sZQcvrcbxUSO29TECLxbA/c7q+dCr5f6IG5yyvlvenCxD8dwiVKplMJb1GIaUGR2YiIQjxPBQ4s8XOecusqyPeqHaF+PnCBybAjjAKp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RcqTghTQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E6C36C19425
	for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 12:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773233695;
	bh=XaDDSu+OBq5QAFD2utYNHF0/GH96EoF1yBGocvYMBts=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=RcqTghTQRDQ+81Srft/+cxghQI6urXSWEwYsvvR5RssB8N1oAAqTGWZ8nOiSrNy7l
	 buiOSAczCLbjK/tPHp7fLYb6BIxp+FixuD4Ls+dEjDIigtRvoxTD5xMIRpHjqjzJLm
	 8BF5Ib54wBOz+KvWPHjvkL7xB7+xlJ0DbrHYGs5qxskL2qRQFaNAmcKSO8PtVziqPR
	 iiC+JqMkKQQUWBugsmILgph78B6GF3EoPc1dBBj+APhSgPNDRJsadDcnSVfEXCefQ+
	 lOydjufvfbY1x9z+L16NtRDKlEqDx14TEblasyYuShY42ibtDzRGBNQz4JzEpyBtUu
	 UVmDU+gGCN3Bw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id DD91BC41612; Wed, 11 Mar 2026 12:54:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221184] mouse/keyboard (connected via hub) usb reset under
 system load with weak cpu
Date: Wed, 11 Mar 2026 12:54:55 +0000
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
Message-ID: <bug-221184-208809-ugAevqBfOh@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: 27760263F7A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34555-lists,linux-usb=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221184

--- Comment #39 from Roman Elshin (roxmail@list.ru) ---
> I wonder if this change would help for any of the xHCI problems mentioned
> here? And what effect it has on the EHCI problems?

Will test, but not sure how soon it will be (may be tomorrow).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

