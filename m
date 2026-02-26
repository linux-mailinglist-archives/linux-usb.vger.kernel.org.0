Return-Path: <linux-usb+bounces-33737-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNVkBLw5oGmagwQAu9opvQ
	(envelope-from <linux-usb+bounces-33737-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 13:17:00 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F3E1A59E3
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 13:16:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 06EC7302F695
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 12:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 418F91FF1B4;
	Thu, 26 Feb 2026 12:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cVlPfMkA"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E161D5CC9
	for <linux-usb@vger.kernel.org>; Thu, 26 Feb 2026 12:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772108216; cv=none; b=kgzHQ0Zo9CLbgg5G5Msgh2yASNdRi1Szg8EGUaSGs2xBGjV3j2fgNrzOFXKvgl281J1siW23liKP3UWSlm2WGF9BxrrqHu21J1+vT02HnQl5RCKQZiHazJsrcLoxb23h/HoS1i2eqv2QcOZIlm7fBtoe8XY6k2crN16vXE/ELEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772108216; c=relaxed/simple;
	bh=mEWt8pWpzCUMfEuyAOSWGqD/ieGzhnN8n63CU5ltZGk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GbI+x73qM7VbOUdCl+Fen8bH0KonyvFiZ6ywYUKvprcsflpbEnQDJnN4Y0e6smkO9HM6UcPTEcB1NVRkEmeS3zxLxriKgZB+8Bq8CT73PfYNjD+JAMiRuT2gqWE7WKwEX3Sh8RU78X8fc9PyKPazpjTmYt1eIOChbfvgoDBKwyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cVlPfMkA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 561CDC19424
	for <linux-usb@vger.kernel.org>; Thu, 26 Feb 2026 12:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772108216;
	bh=mEWt8pWpzCUMfEuyAOSWGqD/ieGzhnN8n63CU5ltZGk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=cVlPfMkAMhNVsjQDQiy1zX//x+kmDuR1q99YI53POyxvvsZs09+N2YXXhIlLon3JF
	 iwVBLG9KJhj0HZgI4e3vRO/wLKqtFmCeybvUx611E/m6hIcKqMzPIHXVkxiGvQkvuo
	 m1jyLSZum/qjqAhlMnTRMjU66OEWimW6d0ROhyR6GsstKiO2ibMdaZWauCWIaKDHk2
	 +L0zRYFFne9OSPwagMp0X6DOc1d0bh33bEWltgZokTRA+M/x/2UUnP0ylMjatpyStQ
	 brCviayuWAG5NKio4fL8W/sEXTqbiKTzIpcOMbTbgd9inFaI4xDWALV37XdvrjJgdv
	 p3Gp6PHCBGrSg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4AED4C41612; Thu, 26 Feb 2026 12:16:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Thu, 26 Feb 2026 12:16:56 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221073-208809-1R3Ei9QWoF@https.bugzilla.kernel.org/>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33737-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 78F3E1A59E3
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221073

--- Comment #12 from Alexander F (superveridical@gmail.com) ---
Created attachment 309475
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309475&action=3Dedit
Z13 dmesg with xhci_hcd.quirks=3D0x80

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

