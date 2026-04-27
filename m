Return-Path: <linux-usb+bounces-36534-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Jq3D00472mD+gAAu9opvQ
	(envelope-from <linux-usb+bounces-36534-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 12:19:57 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C3F470D5B
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 12:19:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 51119305A0B0
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 10:15:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AA4E309EE2;
	Mon, 27 Apr 2026 10:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EnPHgZUN"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D93C2D47E6
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 10:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777284942; cv=none; b=sVKvnqb3gUnpedMZMfoIRo/dIN3mnsozJpeke4UFIy/dWrrRvzK2cqrdg6SoCvNBnepDf7OnxRd/wBOayJUz0rfFUsKg8QBolCyRKPOZEGVg9MK+e090Bry4YFY9jXaJM7uhI1mcVq+TsCm4tNKXT+MjO0Obj3LZX0SJCFkNNVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777284942; c=relaxed/simple;
	bh=z4XgzqNQEA4SVugDdeNTfWEuXnSBgywP0nzZHa/ymq8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aXyXOjbCUy5SF91O+PyyWerGikZvVv8LkWOBh3os2o9/p529YNROZ2l+/SPtGlaTgw6orbAyES+qQR5hZMGNE486peOVDNOTLSTqJZFCh6zXcbTZ2mUTmwAfKw1UuJuJqXQAnf6bOCQF4nhYMR+O9GzUd/lPqj/g1HRmm045cTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EnPHgZUN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 39CB7C2BCB4
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 10:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777284942;
	bh=z4XgzqNQEA4SVugDdeNTfWEuXnSBgywP0nzZHa/ymq8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=EnPHgZUNRXBcZUNwLumMkuv+C3DFTNThCEj8XLdYgksCibBDFqQftRsXgO0jalMc6
	 +3zv3biqUu6eoQDzyXRf6XQHJF9UUn9OZ9/2ln09a7v2XTxDQxU4xLvw9/8zNpPW2E
	 VcLaARRSyVtoDP1sXMl2bzHLPd0mBtdX5SWH96O1yr15SSdoOLfQ+nweHX2EGXZmJL
	 NMo6hjodGA8a2qKQl0TjvmQso7xjzAFC1R/4+1C7QecHnFNubAujqaMtrvU5Y+AxI5
	 Aq9FEBrbgoqTfjdIvvwvdaBwV2nOvdJNeFN0AlgZhYTgpC22SpQJwJb7JHVVyZ8auW
	 xK6b81qPyQ63Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2DAF9C41613; Mon, 27 Apr 2026 10:15:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221340] uas driver hangs and causes usb reset
Date: Mon, 27 Apr 2026 10:15:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: oneukum@suse.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221340-208809-lwtMAH2QvC@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: D2C3F470D5B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36534-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,suse.com:email,proton.me:email]

https://bugzilla.kernel.org/show_bug.cgi?id=3D221340

--- Comment #17 from oneukum@suse.com ---
On 26.04.26 04:54, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D221340
>=20
> --- Comment #16 from DaisyTheFoxxo@proton.me ---
> Reaffirming that I would like to try out the patches mentioned
>=20

Thank you. They are about to be written. A few days please.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

