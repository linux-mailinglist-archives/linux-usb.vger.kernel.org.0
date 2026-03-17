Return-Path: <linux-usb+bounces-34941-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NPHKvBquWmvEQIAu9opvQ
	(envelope-from <linux-usb+bounces-34941-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 15:53:36 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B2B2AC682
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 15:53:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C2E21303D390
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 14:53:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 665453E868C;
	Tue, 17 Mar 2026 14:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HxigWma+"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E600F3E868B
	for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 14:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773759177; cv=none; b=UC6iXK2T85030lQ2EfagiXRR4xlXjBnb7JuiaDCM+8/NC4X8TQLaVtqMpg6//3rHYWppr5HfpXlYHOQTn0tTlOy6orHcKv9TwuVVntx2eW9RGx8EmkAAyw+8uRJcxCdj9E/lIgR5dkPTL77MaVpWmUmDIw0P5HiCo8hA5fKeJdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773759177; c=relaxed/simple;
	bh=0//teAos5q32em+J7BmxhzJT5liAu4otqVIQbfqjRpU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mqhKGvZM47S0Ui5CE/SjsGfrDMt5EcHlHUjBa19iQ8KeMZio0UW8mr0RB+OvbkZUts1RFLrJ3kU1NEt74dmDGIh4HMdO1ebpFP84rK3LhgBD3JbqXeMB5hX7CGhL+TsE9JQgeCTNFgi/QsFxLhP6QmrUgxgpcdAhX/kkhMYvrHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HxigWma+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 89A19C2BC86
	for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 14:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773759176;
	bh=0//teAos5q32em+J7BmxhzJT5liAu4otqVIQbfqjRpU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=HxigWma+3lSpCVf6dQY4/nnzEg3uBkDBlQ4kk0tm0f2aoMoq6XmuMRLXthroa0QKy
	 lTW9q37KlAkalqhve7JP9F56VByMWiNBI28w+XSrvCC/UStbaWIDfHcr3X8NnHRJYC
	 JFyCICsQpXyq60wsqVC+Wp14z+fzR/1JEHOowmAMSmj7ej6Umu/y1x1uOeTJYSWsur
	 uN16F8+yAc9P2r6slvz/XDwsY6hmKlFtH8FfyLDzPPlN1NaeFTKHEl3mmR7gA2IkgR
	 DBjCVZ85Y5UXka1dF1X2pHkPF/IuFXs5aVEcY1CAd2EUP/3hxbvqwYTX7/x5qdOG1u
	 CHuNGwLuHwNhg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8211EC41612; Tue, 17 Mar 2026 14:52:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215740] kernel warning: DMA-API: xhci_hcd: cacheline tracking
 EEXIST, overlapping mappings aren't supported
Date: Tue, 17 Mar 2026 14:52:54 +0000
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
Message-ID: <bug-215740-208809-e3C5VyopJp@https.bugzilla.kernel.org/>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34941-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 61B2B2AC682
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

https://bugzilla.kernel.org/show_bug.cgi?id=3D215740

--- Comment #48 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
So, is there any consensus which solution should somebody try as a new atte=
mpt
to fix this?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

