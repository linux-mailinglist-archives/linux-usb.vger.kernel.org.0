Return-Path: <linux-usb+bounces-34672-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHQDHwaXsmmKNwAAu9opvQ
	(envelope-from <linux-usb+bounces-34672-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 11:35:50 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AEE270601
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 11:35:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BDE663031F0A
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 10:35:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E29B3BAD9D;
	Thu, 12 Mar 2026 10:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mSUyyBIz"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F8B3B636B
	for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 10:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773311721; cv=none; b=KcgZNFQA7XhmvdEBnF0WrbWXmsceyCu5Y8YEkTDtX3dW/cKsFJYoPOHT6kz/B5/EkO+NGgjaLSz1n5pzjl7O4cSamW8WAvrNHgWGi3oqnxepGisl5nWN69PRTixQQuXQyZ8pYHr476tLyrzKaZs25el+UJNNL1nBNycYpiHDtkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773311721; c=relaxed/simple;
	bh=my9cFR3GuWad0tyG4lpnny3qNC3tmK7ju0l7C5nbA3k=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BLloZPUAUn70YO0oA6q1H5/+MoORVcUE0fwZFCp8ejdg1GklndSWtj6r7iSb3HG5zxF0z+LOf8iibIX2Zoo7NoqOLIocgT3LVSChG8Kr3oQcumvS4o4GaA2BTFLak4itaV+YoCaplqcRSxSREq+eZ/zRFFAj6sntv9cN51LgACU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mSUyyBIz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5325FC2BC9E
	for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 10:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773311721;
	bh=my9cFR3GuWad0tyG4lpnny3qNC3tmK7ju0l7C5nbA3k=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=mSUyyBIzGiecdMV94P+WvBwetZ12aQjFwSsMj8TwQ//2c5osGpHT6GAW+Y5V8xOHi
	 0zPH7aBvuPGoE9hXzdTeqokFXIgtnpg+5z9eYzpbK5qeK01IigHZOleduj/QyNv8IK
	 D8xZIFXnOg0pKPYrKcB5ycoHuvMGGI24z+E5A5Ua09RGiCbnQpIcty654vBHL4GE50
	 CM+yfzxbKn15A7nzyEnGuCEd/CWi67ADBwKcvY0Z9yWjgqlpuwAsbAYWc5LM+QjpsV
	 MDSbs4WYTPke8b6SZQvzkKM+fEyZ5ZdONECxqnx4I/zGsspJJpS4Cndfizyjp1+NOe
	 cplSoHqsL16fg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4B355CAB781; Thu, 12 Mar 2026 10:35:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Thu, 12 Mar 2026 10:35:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mathias.nyman@linux.intel.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221073-208809-bYbZ2M77l8@https.bugzilla.kernel.org/>
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
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34672-lists,linux-usb=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 17AEE270601
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

https://bugzilla.kernel.org/show_bug.cgi?id=3D221073

--- Comment #38 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
(In reply to Alexander F from comment #35)

> >There are some error flags set on DevSta=20
>=20
> These flags only appear after the "HC died" occurs. (That event also adds
> (warning) taint.) I verified that by running `lspci -vvv | grep DevSta: |
> grep +` before/after every resume, and NonFatalError on all c4:00 devices
> flips only after the event.

Interesting, was PCI DevSta: NonFatalErr+ ever set with the 'Forced MSI onl=
y'
patch after resume?

i.e. Does MSI-X usage on xHC trigger the DevSta: NonFatalErr+, causing xHC
interrupt handler to hot be called

or,

is there something else causing PCI DevSta: NonFatalErr+ in resume which for
some reason only affects/omits MSI-X handler while MSI work and handler is
called as it should.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

