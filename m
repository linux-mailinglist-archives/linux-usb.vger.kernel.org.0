Return-Path: <linux-usb+bounces-34319-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GC9BE+fxrmnZKgIAu9opvQ
	(envelope-from <linux-usb+bounces-34319-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 17:14:31 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9856623C8D3
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 17:14:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 184493053DC5
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2026 16:08:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F31F33CC9E6;
	Mon,  9 Mar 2026 16:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vKbTLHnX"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816BC3BFE21
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 16:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773072519; cv=none; b=PgBZH4K1lAXg2UEZ0w//qhV8hKOl2hUtUUI3eWzcGDnYFY4GTooqjbtRuRR2aWGAXJVHcT2rxlDjsJ5eLpTSVrV5rztXoBuM/h2Brj+XfGoZdvw518P4yVlm17u3+kLM09916G6/JwQ/qRiVw2JAXmOqDQs4U/j+drPrNNylUEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773072519; c=relaxed/simple;
	bh=K/BM2/Gp+Dqs8xtTnizuLd4jsSem+mnjssqgGG2c41I=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=h9lZFXGaZCrkoyRphKCKn6HU60cmBNJHJW4g9E7nms2jtazSwk79tL65aBzDOABeWE+EhInGo3hujc5zq3ghwTMXxifAcqrSDgrjv7xv/m9CPsHeB4i4NHaUTslpRacEBm9gSW2C/DGB8duY6mLRkGilfnrp5bOxD+pOH5Er618=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vKbTLHnX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0E0D8C4CEF7
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 16:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773072519;
	bh=K/BM2/Gp+Dqs8xtTnizuLd4jsSem+mnjssqgGG2c41I=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=vKbTLHnXd7LQ/c7S8erBdYjlNKT6A09Le9RJAAqlb9eNtEiLDrOOIR9CUn3gyz4v4
	 oeZ1Gz4BVkG+SsllHVjdoMXj6mtdX+XDVIRoHw164OahjKaj3BIAaunj09g6YsjdZq
	 /8o337kpCd2CMp5t1uFMmh2LUokurKl27Pr5Yp7UG2svwMgoEPOHxmLF2Ri0AC34gJ
	 jBe5guxrQHiOt05V00YoDyf+aqQ/1CwsZJK2k7hM8eqWCcAF0PO6Qo1TwaCIvyo/EQ
	 DVxlwZv9uGL7tMXjuHM2WnCARfvuAgmlLu5/ayaoF6IqHR7zdSsLXplST0BDPU2Q5T
	 NdYJRrUz3+LfA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 02A0DC3279F; Mon,  9 Mar 2026 16:08:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221184] mouse/keyboard (connected via hub) usb reset under
 system load with weak cpu
Date: Mon, 09 Mar 2026 16:08:38 +0000
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
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221184-208809-KhDFbPwRVP@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: 9856623C8D3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34319-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.988];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,harvard.edu:email]
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221184

--- Comment #25 from Alan Stern (stern@rowland.harvard.edu) ---
The change was correct, in the sense that it made the kernel do the right t=
hing
whereas before it would sometimes do the wrong thing.

Making the mouse more difficult to use was an unfortunate side effect.  Fix=
ing
that difficulty is the subject of Liam's work.  Try his new patch from comm=
ent
#23; I expect it will improve your situation a lot.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

