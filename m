Return-Path: <linux-usb+bounces-36486-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id LT1oKF5+7WlOkQAAu9opvQ
	(envelope-from <linux-usb+bounces-36486-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 26 Apr 2026 04:54:22 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FB34689BC
	for <lists+linux-usb@lfdr.de>; Sun, 26 Apr 2026 04:54:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 76713301CCF7
	for <lists+linux-usb@lfdr.de>; Sun, 26 Apr 2026 02:54:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9DDF239E7F;
	Sun, 26 Apr 2026 02:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RhFddVUS"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F6B21ABD7
	for <linux-usb@vger.kernel.org>; Sun, 26 Apr 2026 02:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777172057; cv=none; b=hPFMQYrgppDP3/1Brz6/73d3h+57OjDctJqyeEp0a77qBWgh6fONXpblI7G1Od/n21jjE/KfOwkRJqytnh7dDFikDw/diBfPCcnGBlPCo4qJrDn8w/mNnbHRh++siNyqNVs6BdjLCyM0YOPFU5sRQlkJdlpB8ZO/BxsVH0+G5b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777172057; c=relaxed/simple;
	bh=mUeXsI+lXu18KoD2uc3smrVTLPiKG3tomgaxcdR5KDo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=L5rdYATQJoPeBxyqfzdClkfX7CH5BcaCF4Ceno31DDK8EdmiE5sL2bZKgzN87LMP6t885+0+X0cYdzEscoDifXjtvCCDtUyuQgDCaDvWlI238CQ0IlOs01g93V73+Plc39ziJriTM0UJwv85eC0LpWeF7lhHgduzygbHTypPBxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RhFddVUS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D50A2C2BCB2
	for <linux-usb@vger.kernel.org>; Sun, 26 Apr 2026 02:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777172056;
	bh=mUeXsI+lXu18KoD2uc3smrVTLPiKG3tomgaxcdR5KDo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=RhFddVUSz6lBJ/SOgYXfiMbZyVYzhIoEsOvDcizGC39dtu7asobGleWcxzaypqFyf
	 Nx4H91hxu6eHHu/0/tj7gNZTWakzQyLTRGPXRiYE0Nn4dzHRw1QUd12HiMZS8wTvuU
	 FJaWwayy6czw9M0ixrUCmAAIIakZG1aNKSiBDmBkNRzqUj4/Mn+HGwqNJx8vdHgHoW
	 zRCd7DMZCYdYC0WNhmhU1u2rhjpWWM95l9mZndIUSsoTyrlMwYZVh8tPSvMLWSnfsm
	 sDESoiAEAx7O3M+toXBbHfFIb9IqQ1fvn0GOc+xfSpi2KX2UPaslxAIz1rxocH0DFi
	 uDnXj9LxJM6VA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C8020C41612; Sun, 26 Apr 2026 02:54:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221340] uas driver hangs and causes usb reset
Date: Sun, 26 Apr 2026 02:54:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: DaisyTheFoxxo@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221340-208809-vduRPUcPTW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221340-208809@https.bugzilla.kernel.org/>
References: <bug-221340-208809@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: E3FB34689BC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36486-lists,linux-usb=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,proton.me:email]

https://bugzilla.kernel.org/show_bug.cgi?id=3D221340

--- Comment #16 from DaisyTheFoxxo@proton.me ---
Reaffirming that I would like to try out the patches mentioned

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

