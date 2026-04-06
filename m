Return-Path: <linux-usb+bounces-36003-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFZTGU8B02ludAcAu9opvQ
	(envelope-from <linux-usb+bounces-36003-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 06 Apr 2026 02:41:51 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C45193A0E6E
	for <lists+linux-usb@lfdr.de>; Mon, 06 Apr 2026 02:41:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B697E300427E
	for <lists+linux-usb@lfdr.de>; Mon,  6 Apr 2026 00:41:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB9C11FBEBC;
	Mon,  6 Apr 2026 00:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fdUEhh4g"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3B41DDC1B
	for <linux-usb@vger.kernel.org>; Mon,  6 Apr 2026 00:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775436104; cv=none; b=cDVy5YaiPBF3pAJxNRrHbc4j+Cd64c8MWFQC4xQpaVhZ/e+e1Eup4sKSPz/814ql9UpxjbXbohRa/l4mB1O7rDIqXnNv85iwlDU+teh8otS7M2wGrEr8+eoioMPyqAy+gy+gObUVDq5koLNBZiF1qLbJFUhPH5Xf1l1EJFqZe4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775436104; c=relaxed/simple;
	bh=ed36gpOmYMIGF6lSgC7sbU4iWnjGxBaVoj6aPfZMROE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lUmej5+AkmF1UReBAPwH0b0fsSKjTOnLr7W6xe5ZegK6SUMNRWkfhTaEmzpqOQmt+q6yHFp174nqZib95ioTrZZzOgpf5/Ex+zIrYuvfi7MApW3kMI4Qk9LjsJoW3jdlwU2a0ADrVPqckn8U6L8YDSCn9UKrCPiaY3QyHLYzHvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fdUEhh4g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CCC24C116C6
	for <linux-usb@vger.kernel.org>; Mon,  6 Apr 2026 00:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775436102;
	bh=ed36gpOmYMIGF6lSgC7sbU4iWnjGxBaVoj6aPfZMROE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=fdUEhh4gk2PwI6MRc+dfDe8C0bmOyo+hy4EIzMpeGFF3WMwb/EfkdZvf9nqKJx/Pc
	 xFQGsSdDn08pz97jhbEcwC9htPTP5rZ1bHCKPLuMJ7cEINlRUcOc1bT25fQhVzt1mT
	 G/QaR/xlOHS4NVM6Kt3l46Lhq91yNNbdOkyW+wDPi9n/JBDKxLf2NTwt3UnOxwwRew
	 6HKfgLFLPbEmtPJcdMIN805fdJP/Yphu25J9ZxSF0GBuyUdkHA5i1vbwBjGhW0z/qe
	 JxciYKuLmtPsAsr1GYCURrtvQ36tx/3M4ih4O6tt1ZzVHCYzmaWUOQsLvpWdcu3Au4
	 tCrwQX6S+Lh5A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C46FAC433E1; Mon,  6 Apr 2026 00:41:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221319] Certain operations via PCIe tunneling between an AMD
 USB4 host and a Thunderbolt-5 peripherals cause an instant reboot
Date: Mon, 06 Apr 2026 00:41:42 +0000
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
Message-ID: <bug-221319-208809-TbTuGQq0bo@https.bugzilla.kernel.org/>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36003-lists,linux-usb=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C45193A0E6E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

https://bugzilla.kernel.org/show_bug.cgi?id=3D221319

--- Comment #4 from Morgwai Kotarbinski (foss@morgwai.pl) ---
Created attachment 309829
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309829&action=3Dedit
systemd journal from a deg2-induced reboot and the boot after

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

