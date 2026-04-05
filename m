Return-Path: <linux-usb+bounces-35994-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAumE2pO0mn7VwcAu9opvQ
	(envelope-from <linux-usb+bounces-35994-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 05 Apr 2026 13:58:34 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C904E39E34C
	for <lists+linux-usb@lfdr.de>; Sun, 05 Apr 2026 13:58:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 590793007E07
	for <lists+linux-usb@lfdr.de>; Sun,  5 Apr 2026 11:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEE883451AB;
	Sun,  5 Apr 2026 11:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bHx+R2Qi"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE7C31C567
	for <linux-usb@vger.kernel.org>; Sun,  5 Apr 2026 11:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775390300; cv=none; b=J7w3M4TLnJFGnZKNjRgiY5CLkcdlsZH0O/On+59791ke7FSO8QujR0kU1BKZEFMQLjebdZ6MMJdQrIdQw3XrpOQbzXX4hrBnVoqLo01Wn5tV1bsF9v9v2Ll+3E2gR/4UwvNcLagHlwSW92W52t+F8fz/J+TMjPtuJqx5nbD+G2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775390300; c=relaxed/simple;
	bh=VonChlDIgTar7rRr463m3T+VJE1qv0uyuYWyw0Fonaw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WflTqHYRXQKOMyo25SfcLJzsVzB8t4ImS4+gY9+azmz0hTQFjGJ3dMsaiC3AaduVFTTRLYDE/Rx02nBsEW0Nl2xo1SjtIjsVzE7gk8Qt7yroc1D4zy1kZugqgRnx7EnVaK3TUT60Cqhj26rG+29/+z4pz82p1D/+bAY8GhGjF8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bHx+R2Qi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0BF18C116C6
	for <linux-usb@vger.kernel.org>; Sun,  5 Apr 2026 11:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775390300;
	bh=VonChlDIgTar7rRr463m3T+VJE1qv0uyuYWyw0Fonaw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=bHx+R2Qi6Hay5fwmZAAYzwYaQvxDHgHOpqY1LnI5EAum8xbKbhg9UDUpkAQzvEP15
	 jH/5H7yEx+m/P3bBEgzqssBF4TN8PrrtcT10VEI6ZOOWmFYIPxbWnr2SxAytJX7usa
	 rsAmDZ/7DLNXKeZ7fyKKtElIPx+Xoljm2DeqzIJbCJFF2wTdxZ+jqgBQWFBLADDLGx
	 FJwG8230pIxCrYuO5Yp5P3IO+H5q9gQKJuImimR5pvvzkeDvJ4pzRnxWnNcFj4ys74
	 lcqcrA+jQWY2Rt6x9YbA4X62nE3cHaV1WZHx0WEqtq/v7w1YI8Fiz8diR24/3ReMBN
	 8WflOBdK4Ttxg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id F0523C433E1; Sun,  5 Apr 2026 11:58:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221319] Certain operations via PCIe tunneling between an AMD
 USB4 host and a Thunderbolt-5 peripherals cause an instant reboot
Date: Sun, 05 Apr 2026 11:58:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221319-208809-YQGOQsuge5@https.bugzilla.kernel.org/>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35994-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C904E39E34C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

https://bugzilla.kernel.org/show_bug.cgi?id=3D221319

--- Comment #2 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Can you check the log from the kernel on the boot AFTER this happened? There
will be a log event indicating the last reboot reason.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

