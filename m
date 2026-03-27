Return-Path: <linux-usb+bounces-35538-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDNmEz80xmnzHQUAu9opvQ
	(envelope-from <linux-usb+bounces-35538-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 08:39:43 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 20186340893
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 08:39:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5666130BCB29
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 07:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 546581A9FAF;
	Fri, 27 Mar 2026 07:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NRg3PWIp"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E3C35B136
	for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2026 07:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774596771; cv=none; b=U8Az8zpRbLCxVQJIOHu3T90TaZ7f54Ko2iK5zgwen6izo8fCwosG98meq0Tg6gTzzHBii7cu+opEb6bo5OW2x3dqo4U/KaVfKnEa3amO0QAuRAxi1OLbqYP0YmohvEWq1t9yBReHSG/IAyJUR5a54bjDpNA1upXr4RLIzRCd7ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774596771; c=relaxed/simple;
	bh=+ShoLdz9/OM/tcUtRedCYiIfB51UqNgB7LeiDV/CXyA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=d4Jz50cPl6BsaD+aNCN8Pt+li3wRKukEwuF+bgN9gHttYzWNCtOrM4Ma/f3QE6LhLh9+talcS1i59SZBsKjThi+L/uqfL7afcbbRenPbh3g1aX+Gvj9clFUYyABzxlVEPTGqbIjtNcxt0Ljz5Pl6L9YeuqCl5UgchhVrm0th0UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NRg3PWIp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D43F1C19423
	for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2026 07:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774596770;
	bh=+ShoLdz9/OM/tcUtRedCYiIfB51UqNgB7LeiDV/CXyA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=NRg3PWIp6LJX+h69lCy2ln11+S8UQQ+0yG41ciLEJCiLd1Slf64mpngISFxswsds4
	 sjYWzKs49KKIoptKOFX5oXVu4puqHRF+5o27eRn3QQZxsIl4Ga6YHqYuLi3J1Z6mcO
	 0V4M4+4PL7Jpa5EIgXOTKu9vtnhv40ddvJVMGQt5ex+ozmyN2ySS/zthR7D+G3GNvw
	 Eldll8vyziNjBWL3su/y1VzeL4ZEx9VpcGJeEL23at0BXyOTgYlfR9yNMEvuQUL/ay
	 FYkDRVtoP7xsCiwUWWi5srm+6R++nfp/FM79OsWbNqT/ybqAb5LD3MmvDvxmog5i+N
	 CjL7ZLeTpImUg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C9322C41612; Fri, 27 Mar 2026 07:32:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215740] kernel warning: DMA-API: xhci_hcd: cacheline tracking
 EEXIST, overlapping mappings aren't supported
Date: Fri, 27 Mar 2026 07:32:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.shevchenko@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-215740-208809-P54FG1m59t@https.bugzilla.kernel.org/>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35538-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 20186340893
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

https://bugzilla.kernel.org/show_bug.cgi?id=3D215740

Andy Shevchenko (andy.shevchenko@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |PATCH_ALREADY_AVAILABLE

--- Comment #53 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
(In reply to Guenter Roeck from comment #52)
> comment #51: Sounds good. I'd suggest to go ahead.

Agree. I close this for now since we have a compromise solution publicly
available.
https://lore.kernel.org/all/20260327055846.248829-1-mikhail.v.gavrilov@gmai=
l.com/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

