Return-Path: <linux-usb+bounces-36002-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cSFBLgEB02ludAcAu9opvQ
	(envelope-from <linux-usb+bounces-36002-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 06 Apr 2026 02:40:33 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 500D13A0E61
	for <lists+linux-usb@lfdr.de>; Mon, 06 Apr 2026 02:40:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 60F7B3002317
	for <lists+linux-usb@lfdr.de>; Mon,  6 Apr 2026 00:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF71F1A6820;
	Mon,  6 Apr 2026 00:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X9Hj9tXW"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4FD3E47B
	for <linux-usb@vger.kernel.org>; Mon,  6 Apr 2026 00:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775436028; cv=none; b=bSLWzrDjaCItBUepQVjYU7iVCXqNC5kl9KAErNMO+sTVS3swYwpNHGUudxfrVvq1nr+ojN5CEp9kdg7QS0avxjKPEO0PgJwiisqHpHJKFS3zSHbI5mg5Q4+Te9LT6/0FUg/uF3aQPFeDFjYNuCo8fABuPsceUY86xVdxAolvQws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775436028; c=relaxed/simple;
	bh=i+7tzw14W+ppO1LgBMk8rx5pt2CwVwM65eNPqOo5yZc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VCMy62LKICFMp1gJQ3tsk61VjQ4GKe8ZmYAEKjGC/MnIulVWfRp5+dhY6L2ar6GVVHt5EexDkZC3wD+Aj0lyS4DOaomWYcZ4Xptj0OCVbtv17FkqWIagar5q1vSmjItknZ7W+EYIvLm1eiJH/6AktnKJzwVOcUAUNhwFQfcYRTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X9Hj9tXW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 099D9C116C6
	for <linux-usb@vger.kernel.org>; Mon,  6 Apr 2026 00:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775436028;
	bh=i+7tzw14W+ppO1LgBMk8rx5pt2CwVwM65eNPqOo5yZc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=X9Hj9tXW6YShGbVEBGUdHso9uj9+XeM4KhShL2DMoMp9SVzSRw/V4KpaW81kDD4Aj
	 WjII1L07jq0mkZP3pcMvmy0TanJEbh/ZhgNciO+g5+K5HYWZiF2YDtfL9y143eN5Rz
	 ub5GEvUOOz5G1NrNwOeA8ntTKT5dwRZ9+3IhO99SBAIT4fozGKY2jH4SYyRHcXgYDD
	 BoC2PX4urEmO6bN84iRTC+AJ61jviDSosStegkhgvE8K3+UNOzLCiE00f+GP6tRcfK
	 QtCiFxgZzsPDbt0WCzQEj7bol04nMit1f7JhDbK6shG9jpBR9mp5GIzVR1ppyAhzFA
	 XJhr//ibzpMxQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id ED9A3C433E1; Mon,  6 Apr 2026 00:40:27 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221319] Certain operations via PCIe tunneling between an AMD
 USB4 host and a Thunderbolt-5 peripherals cause an instant reboot
Date: Mon, 06 Apr 2026 00:40:27 +0000
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
Message-ID: <bug-221319-208809-FjfyFTiL7b@https.bugzilla.kernel.org/>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36002-lists,linux-usb=lfdr.de];
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
X-Rspamd-Queue-Id: 500D13A0E61
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

https://bugzilla.kernel.org/show_bug.cgi?id=3D221319

--- Comment #3 from Morgwai Kotarbinski (foss@morgwai.pl) ---
Created attachment 309828
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309828&action=3Dedit
dmesg log from the boot after a deg2-induced reboot

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

