Return-Path: <linux-usb+bounces-35976-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INPUFGst0Wn7GAcAu9opvQ
	(envelope-from <linux-usb+bounces-35976-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 04 Apr 2026 17:25:31 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5104B39B96E
	for <lists+linux-usb@lfdr.de>; Sat, 04 Apr 2026 17:25:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C6B7A300BD83
	for <lists+linux-usb@lfdr.de>; Sat,  4 Apr 2026 15:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35FB3285066;
	Sat,  4 Apr 2026 15:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jAGACSqb"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D6BC8E6
	for <linux-usb@vger.kernel.org>; Sat,  4 Apr 2026 15:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775316327; cv=none; b=TJyxqCxkwZqpMKB5d7IM3UST0+OI94W34yZtzQ7Q+qS0/YbXE47d1eoM3gMRG2/4f6VG9oLlvuxd1DVOfnioDISt2mXXxq6fkskSIqeUrqbDvwSThnmXqWgPKegb96kpQ+Bn8Ezpq/FMqAAruyfcww4WO5R+AVxtNFp/bPHHgNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775316327; c=relaxed/simple;
	bh=5lRW+T1zewlGr7T29MuQI3BPll7yPm6t+hooZ75E8V0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RhvE4UxVz7gruZwA09ciWorTIXHHdCJHoVmYo6NptAvXSuADCUlKN+s2DOwoSLhK8KOxUhxsoLk7Z2cLNDKGx8yqolwma4aMalOIzDFFfpBECjrxv/w8TvkLaDURrslFABlIj3Erup5kG4zf4SdDYHA5sp5JY1MSk9uocYz7BVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jAGACSqb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6D4F9C19421
	for <linux-usb@vger.kernel.org>; Sat,  4 Apr 2026 15:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775316327;
	bh=5lRW+T1zewlGr7T29MuQI3BPll7yPm6t+hooZ75E8V0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jAGACSqbORVMVhAtir3d9vjkNYB+MUHOktE0BtDzJp0oV28jxLHZc9kST7Ns6/gN1
	 XZnSUvEYwzPBshb/3lnY9Bh3nehqxuMX8HRh7ZhDfJxYBatZeFCtl1GVtL49rSoIHK
	 P6qz9LOVITL+j3PdsGdM+LwPZobWrXekTTM4ODy0vGS+kag6Ysg4RmPxOTLX2FuuhJ
	 Vb6HJtbk6kWUM+wAvmkCZm6nM3FVQLjrOMZ5aHmhgAMc/eNJ6HvYAS/6YGLaesxtOZ
	 CQ0Y6RWasWZlWnWxvhMaZKkNHmA1DizILbYte+GpRNa6xtbKmXvo3nBib3Lsc0wbq4
	 301XDt3KQCvVA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 679A5C3279F; Sat,  4 Apr 2026 15:25:27 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221319] Certain operations via PCIe tunneling between an AMD
 USB4 host and a Thunderbolt-5 peripherals cause an instant reboot
Date: Sat, 04 Apr 2026 15:25:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: foss@morgwai.pl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221319-208809-kgWr8G8oaY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221319-208809@https.bugzilla.kernel.org/>
References: <bug-221319-208809@https.bugzilla.kernel.org/>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35976-lists,linux-usb=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,morgwai.pl:email]
X-Rspamd-Queue-Id: 5104B39B96E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

https://bugzilla.kernel.org/show_bug.cgi?id=3D221319

--- Comment #1 from Morgwai Kotarbinski (foss@morgwai.pl) ---
Created attachment 309814
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309814&action=3Dedit
dmesg log when using NV driver v595

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

