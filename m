Return-Path: <linux-usb+bounces-33920-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NwPGXsEp2k7bgAAu9opvQ
	(envelope-from <linux-usb+bounces-33920-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 03 Mar 2026 16:55:39 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DF20E1F30AD
	for <lists+linux-usb@lfdr.de>; Tue, 03 Mar 2026 16:55:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3B5B630BE486
	for <lists+linux-usb@lfdr.de>; Tue,  3 Mar 2026 15:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FFEC4963DD;
	Tue,  3 Mar 2026 15:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BhLd2PFo"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9093749252B
	for <linux-usb@vger.kernel.org>; Tue,  3 Mar 2026 15:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772553077; cv=none; b=gJbkz1XodznKopAJ9CsfKD+yNqDVRlf9NmhvDnltGRWEsOtg/2RSrHaYRrHPavxEtKLGE3ZXfwDVpa8smZxIXeLd2n/8dU4wSO5hpk0YAo5ukCpcYoAp36HjinZTyGPmZou7dyGkz33uPOzEe66KrUpajDuaPseUyv7i66GQuY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772553077; c=relaxed/simple;
	bh=STuqUBjobyK1CSjiKrSNnpP20UwDf/vPTd86vlz8hXU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ofTLv9Mm7jKCBIlS/4Q0RieaJ0pz5p/6Hct+5MuHTc54nMNJbGeuPS4E8Hq66FjH13An2w/Qg9SNnZrxURXVdyD4kc5wZIpA6IyEhVJCRmnz+HsR2kBUfKZUhqKHiuGuEEut/Hbf5/rASKM6e4YP0lOMiQmFvEtW1bkTjAO3UM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BhLd2PFo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2A605C4AF0E
	for <linux-usb@vger.kernel.org>; Tue,  3 Mar 2026 15:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772553077;
	bh=STuqUBjobyK1CSjiKrSNnpP20UwDf/vPTd86vlz8hXU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=BhLd2PFo3IDsmi7z+iSrJs7WwaSwzIPsXsr+FIm2HItkffGCKWTw5Jl3Nn1seqJG6
	 UatlViAQFQ0y2Pf2958WdFnsWWMduI8vYaQUnqyC8nC7fkOb31yNTHMra1gvmJK6WX
	 taIKUoDenpjajfLYHSGAp7aKKdK8gw01OFjHczJlA6NlPtZf9rAy+4Y6QND0WlLcb9
	 lrhWnEfon1Xt5rjCZ6kvJUb+DCC5BIUlrgmlBG4YguqAQ6tutnGaz/P6UiZ3LWtYSu
	 Zg2iFhvju12oWJdV6nUBPSyw7AmTLDsCsS/aThbOzyLxhDNSOGLb5PQrBa7rcEV2SG
	 8V6s+VFegDpTg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2458AC433E1; Tue,  3 Mar 2026 15:51:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Tue, 03 Mar 2026 15:51:16 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221073-208809-beIsGj4pDN@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: DF20E1F30AD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33920-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.986];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221073

--- Comment #26 from David Hubbard (david.c.hubbard@gmail.com) ---
Created attachment 309532
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309532&action=3Dedit
comment25-cap03.tgz

Ok tried it again:

Cap3:

# free
               total        used        free      shared  buff/cache=20=20
available
Mem:        32636916     3709384    27486748       37088     1822492=20=20=
=20
28927532
Swap:              0           0           0
# (this shows 32GB free because the BIOS setting is iGPU =3D custom, iGPU m=
emory
=3D 96GB)
# echo "module xhci_hcd +p" >/proc/dynamic_debug/control
# systemctl suspend
# (wait 2 minutes, press spacebar, get this in dmesg)
[  183.231723] xhci_hcd 0000:c2:00.4: xHCI host controller not responding,
assume dead
# (unplug usb hub from c2:00.4 and plug it into c4:00.0, keyboard and mouse
alive again)
# cd /; find sys/kernel/debug/usb/xhci/0000\:c2\:00.4 -type f | while read =
a;
do echo "$a"; mkdir -p "/home/user/c/$(dirname "$a")"; cp "$a"
"/home/user/c/$a"; done
sys/kernel/debug/usb/xhci/0000:c2:00.4/port_bandwidth/FS_BW
cp: error reading
'sys/kernel/debug/usb/xhci/0000:c2:00.4/port_bandwidth/FS_BW': Cannot send
after transport endpoint shutdown
sys/kernel/debug/usb/xhci/0000:c2:00.4/port_bandwidth/HS_BW
cp: error reading
'sys/kernel/debug/usb/xhci/0000:c2:00.4/port_bandwidth/HS_BW': Cannot send
after transport endpoint shutdown
sys/kernel/debug/usb/xhci/0000:c2:00.4/port_bandwidth/SS_BW
cp: error reading
'sys/kernel/debug/usb/xhci/0000:c2:00.4/port_bandwidth/SS_BW': Cannot send
after transport endpoint shutdown
sys/kernel/debug/usb/xhci/0000:c2:00.4/ports/port01/portsc
sys/kernel/debug/usb/xhci/0000:c2:00.4/ports/port02/portsc
sys/kernel/debug/usb/xhci/0000:c2:00.4/event-ring/trbs
sys/kernel/debug/usb/xhci/0000:c2:00.4/event-ring/cycle
sys/kernel/debug/usb/xhci/0000:c2:00.4/event-ring/dequeue
sys/kernel/debug/usb/xhci/0000:c2:00.4/event-ring/enqueue
sys/kernel/debug/usb/xhci/0000:c2:00.4/command-ring/trbs
sys/kernel/debug/usb/xhci/0000:c2:00.4/command-ring/cycle
sys/kernel/debug/usb/xhci/0000:c2:00.4/command-ring/dequeue
sys/kernel/debug/usb/xhci/0000:c2:00.4/command-ring/enqueue
sys/kernel/debug/usb/xhci/0000:c2:00.4/reg-ext-dbc:00
sys/kernel/debug/usb/xhci/0000:c2:00.4/reg-ext-protocol:01
sys/kernel/debug/usb/xhci/0000:c2:00.4/reg-ext-protocol:00
sys/kernel/debug/usb/xhci/0000:c2:00.4/reg-ext-legsup:00
sys/kernel/debug/usb/xhci/0000:c2:00.4/reg-runtime
sys/kernel/debug/usb/xhci/0000:c2:00.4/reg-op
sys/kernel/debug/usb/xhci/0000:c2:00.4/reg-cap
# dmesg | gzip > dmesg03.gz

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

