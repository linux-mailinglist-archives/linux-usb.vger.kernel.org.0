Return-Path: <linux-usb+bounces-33738-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CALdDgU6oGmagwQAu9opvQ
	(envelope-from <linux-usb+bounces-33738-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 13:18:13 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF641A5A08
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 13:18:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7EB13301CA8F
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 12:18:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60BE62236F7;
	Thu, 26 Feb 2026 12:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SkIq6klf"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E318C1F181F
	for <linux-usb@vger.kernel.org>; Thu, 26 Feb 2026 12:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772108288; cv=none; b=KBiJKj9to6SjwYca0KBRAVRQ/NNxxa/VcUAyYn24+nRP/Ab8K2wXuf2H5BOF6DjkTD+zp0leJfN0O6p4r17Asfa2OUsNPaEpYcPV6oQRG5qubfDkw009cULkD697XCnSu7SWBrRuMpLLklUDxEt9/6erAYvniXMMepUHbnZDasQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772108288; c=relaxed/simple;
	bh=HqE4x4k6WxR8q+dIo+83Ko0zsRP6unzFxosyDt9J5/M=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UoljZsGy+clc4+pkY1/k4DMZvuWxgqCCaYjeg4Qdk8Bp+tHyHuFE3qMmgFG70vVeYi5BDGVuF/wigIOmfA9VHM3iK19Pra2T4JmLHVWE6s/TTadz7Ji/Tym9ViY3/qbZ7lan6hKmsaPgroWUKFtdINP/Rtdg6Nurk7vyrPxeG+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SkIq6klf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7D98CC2BC87
	for <linux-usb@vger.kernel.org>; Thu, 26 Feb 2026 12:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772108287;
	bh=HqE4x4k6WxR8q+dIo+83Ko0zsRP6unzFxosyDt9J5/M=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=SkIq6klf2XWSLEjBEesYhUBp7Vj6IAZifBN+k03ksZIuHhfReQM2GSrSCivqnxIaa
	 Q2dFaWt3PuoNgG3FY55XI3y8fjK0DhxW9Oe3Moi8sFeFekZN2psY0yI4a2hv2nnBca
	 Ce52spATE/Fn0Pu4ZtOlu+DgfIlXImduB0udoItTW3zieq0+gM6yFPsSmXl8JqeQuh
	 39CJIADdmH4tDsKyhRRUfnHBKAdHzyVrPM4kwik+VVrD3t7D17V/jtIrN1fx6Tg7jK
	 jjdrFVl6ZXOE3Af9y7FF7wC5F3XPRZlId6TrIqfjwyLhv47vgoLgnP7oH3X609+bEk
	 cD6gbObGjYMEA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 76199CAB781; Thu, 26 Feb 2026 12:18:07 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Thu, 26 Feb 2026 12:18:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: superveridical@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221073-208809-ltLkL2mlRC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221073-208809@https.bugzilla.kernel.org/>
References: <bug-221073-208809@https.bugzilla.kernel.org/>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33738-lists,linux-usb=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4EF641A5A08
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221073

--- Comment #13 from Alexander F (superveridical@gmail.com) ---
Regarding the RESET_ON_RESUME / xhci_hcd.quirks=3D0x80 quirk -- it doesn't =
help.
It results in "PM: resume devices took 58.357 seconds" and devices don't ap=
pear
without unbind/bind either.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

