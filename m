Return-Path: <linux-usb+bounces-34897-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6E2GND6auGmsgQEAu9opvQ
	(envelope-from <linux-usb+bounces-34897-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 01:03:10 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 567202A227D
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 01:03:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 17E1E302E7F8
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 00:03:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 406231E89C;
	Tue, 17 Mar 2026 00:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oBlDKR3B"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46D08462
	for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 00:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773705786; cv=none; b=WZ3W/3D6QR3//cJtGDBxb7jVsz5rdXeQ7PD+HVaCto2BgZyF3RZAOqHd2ctCofqwRYnTVacuQVrrLjWDJy8qSSxM+0m5Z6NHaZhygMOWZGc+uFQLn6hd5smukMAYbCn866olUGqkMzUjBbk0BnYN5X51vIBoMWOwGn6GydqeoZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773705786; c=relaxed/simple;
	bh=HELH25NIDy/q9lY0OoRbFFCBv0mf+7sDpsoNkCuXexA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RhZKEPW/L4OaNYUaJp/XDCSSM+k1a6ANtVUDKDDO9NznxMI2UMy6Or2bMrfKxF7B/Zft+5LBHimSMiNTsL4gzE28ACLydE6jRHgN5VqaSxOayuCBjbC1XJxVWxZgWuwhPlwl/TMvZS88/2Sffw5Eem3V4SGIhCWWEqzcBzKVGwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oBlDKR3B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6A357C2BCB1
	for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 00:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773705786;
	bh=HELH25NIDy/q9lY0OoRbFFCBv0mf+7sDpsoNkCuXexA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=oBlDKR3BnFeSP8azctpduOdTB3hua8/opqAlh+JY/KUa+rJdh582fpW4AjieKe90q
	 hnQ/es+GkGfJPEnRMLl1egCujyDypYcWSmUtquxGbYvkMaPwaLUP0V94mxjNRrJIWq
	 xaQInrTkjbnBB/jdObwsUYjBXtWzP68cHSMwQ+teJNQ97wpwwb7c6rsvi9TVCNR5ni
	 iThf2MlxgBf/VhoYtJ0U7yidARhS1QOZB+bDSs/DEt58INjeol28jVkqxO+T/Xeol7
	 rMAdWKONBPtH7kvUmxMMJX3ln20Y8eNIP3WOnSn5v4mJ4BZmcS+h7yvlpO0LI9udmv
	 DzgJ9+AZs2Blw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6062FC41616; Tue, 17 Mar 2026 00:03:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Tue, 17 Mar 2026 00:03:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: david.c.hubbard@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221073-208809-AqAgA9mH0w@https.bugzilla.kernel.org/>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34897-lists,linux-usb=lfdr.de];
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
X-Rspamd-Queue-Id: 567202A227D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

https://bugzilla.kernel.org/show_bug.cgi?id=3D221073

--- Comment #41 from David Hubbard (david.c.hubbard@gmail.com) ---
I have a Framework Desktop and can repro the issue. I'm willing to gather d=
ebug
data if Micha=C5=82 Pecio or Mathias Nyman can comment with what is needed.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

