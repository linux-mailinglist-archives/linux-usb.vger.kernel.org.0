Return-Path: <linux-usb+bounces-33877-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAkbLxHDpWnEFgAAu9opvQ
	(envelope-from <linux-usb+bounces-33877-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 02 Mar 2026 18:04:17 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8711DD790
	for <lists+linux-usb@lfdr.de>; Mon, 02 Mar 2026 18:04:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7FBA53191435
	for <lists+linux-usb@lfdr.de>; Mon,  2 Mar 2026 16:47:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30C68426D17;
	Mon,  2 Mar 2026 16:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qfVLsf+5"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2192ED87F
	for <linux-usb@vger.kernel.org>; Mon,  2 Mar 2026 16:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772469958; cv=none; b=EXx88LdqrEiIm9ad6jIx4y5mmFssCGPv07LXYkaw7Ei74Hv+/+N8gvDlwamhmO2MOlSXP5YZ98TxSkeuLpcYiSJYnydMGCvyi+AWzDbenWqcAh8EYTp5Au3BNCjXuVa5IwGzd/saX1jIks2lTWB+9GsLAITmI/O93Fi6qKGemZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772469958; c=relaxed/simple;
	bh=GiIXb1l+8h8lMhW7etSYomvuYIZzqSG+3UOm5q+ULLw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oT69vbVpZBi+uTAKujlGnDcjM/7sj4tOQXqwsUY/GCIy/EZkQ7G11VZ9+3zAi3dZET4pZSXhk2TcwwUm9QA16Zw2dUI0V8bZWbnKhERmyfwhvT1D0bEXfjmuALh7GKOqZk/D40caHp0a95PsBSb0dsLTtnyZ35M/Wa0YiP+1k04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qfVLsf+5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 508BEC2BC86
	for <linux-usb@vger.kernel.org>; Mon,  2 Mar 2026 16:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772469958;
	bh=GiIXb1l+8h8lMhW7etSYomvuYIZzqSG+3UOm5q+ULLw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=qfVLsf+5m+vOvFGZ2LGo6Dfb6DhtVxXqAleNwBN9hmk3KR/Ppo688YDeyYxonkJsc
	 +kOkQbS02bQHB5kG7tLQP1KVd+OYIExIySUHEVZf3Rus0UNfdVJutpzS5QxX8o9YXN
	 u7C0ivOWGprf8GpR6MokTY1l4BRIPmRzqI1EzOrserBeZazeqr+Hz4l5l5Ykk5z3e9
	 rvU54a3c2js6bLv8BYmaGreq71FlcILJgxgsC4X2nYBIFpWlT6hq6QAqATibZLKQYX
	 F6uce25AiUP05EV6o6zqnm+rRFVgSvH1j4QUNrdM+Qa8XFacs5AkcxOqy6lTsTZCQ0
	 lq7rGqKqCZV0Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 47898C53BC5; Mon,  2 Mar 2026 16:45:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Mon, 02 Mar 2026 16:45:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221073-208809-NK4BHhY8R3@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: 0A8711DD790
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33877-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,amd.com:email]
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221073

--- Comment #16 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
I'm wondering if the patch suggested as part of bug 221103
(https://bugzilla.kernel.org/attachment.cgi?id=3D309444&action=3Ddiff) migh=
t help
this issue.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

