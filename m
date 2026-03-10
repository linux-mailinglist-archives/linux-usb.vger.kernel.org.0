Return-Path: <linux-usb+bounces-34481-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBLhLVYwsGkShAIAu9opvQ
	(envelope-from <linux-usb+bounces-34481-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 15:53:10 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 73174252924
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 15:53:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8F03A3035E32
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 14:48:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C50632E7F3E;
	Tue, 10 Mar 2026 14:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jH74CBau"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B3D2F3C10
	for <linux-usb@vger.kernel.org>; Tue, 10 Mar 2026 14:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773154120; cv=none; b=JaRbojrre8oOV4mN8vxqSXV+3njipEibFxFbav9Imsc4SZ83IzSlgdOPhC7alOaLrxVt4661utNoECKkrFRjr+W9T7sIEgGxAK5eB/pE67g5IUAlPu0JjBj01G/0CnMnobWn+vjakpZPqD0CxtPCOHl05aYE+8u95OOROE9FQ3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773154120; c=relaxed/simple;
	bh=M4w9IEvoDADRHmB9iqZz7b3Epc6tdL/FecnebiX/Shc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CKwz18ajE8zWo0jwq0kzewekTmcPcS/nq1SnirIiczZEK2m6RO81nJ7jfbdvEBKq7IF7t14heh/kFwjH/1kAjXuYkm0kqa50FXHWU6htjlXkfC46pljJmJrlT3KcV91KRtfFkuB+vQ/7yFVB/mQ0MyGHieJD9w71pipiKQ03tWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jH74CBau; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EA3A2C19425
	for <linux-usb@vger.kernel.org>; Tue, 10 Mar 2026 14:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773154120;
	bh=M4w9IEvoDADRHmB9iqZz7b3Epc6tdL/FecnebiX/Shc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jH74CBausRhHdgoL+kpn/8tX8TolFZDLfYMPxiWQhe9GKpS/TuvF+7udCJeRAj5Pj
	 K8f9DprmXOBWFcWUz01ouRsOs86UB7UG6JoW5DJAaOBWjSTbLfyx5SSDuGHXS1WkHZ
	 RCer1Hn4/WZEquPOkS9j6aNXeAqbr51/Cvmz2z6oANNztK4WRnA7urQ2mB6Gcyqnqq
	 Ht/hjPWUILkkJtplgrSZw/ca2irvKNodchh0tXX1efinjHe5PIJFvW3qnOR3WWfGFh
	 l2uZAmufu4LirXKOU4GRrCMWVrZxO7hdBQCvSd0OrF8NeJHIEvrmehOJJCu+SR3PBl
	 YvNuLwsiWOQlA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D44F6C53BC7; Tue, 10 Mar 2026 14:48:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221184] mouse/keyboard (connected via hub) usb reset under
 system load with weak cpu
Date: Tue, 10 Mar 2026 14:48:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221184-208809-z2TgzJjmIu@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221184-208809@https.bugzilla.kernel.org/>
References: <bug-221184-208809@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: 73174252924
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34481-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221184

--- Comment #33 from Alan Stern (stern@rowland.harvard.edu) ---
As far as I'm concerned, those status -19 error messages can be changed to
debug messages, so they won't bother people.  Of course, that can be done i=
n a
separate patch.

One of Micha=C5=82 Pecio's points is that if you want to retry following a =
-EPROTO
error, it is necessary to reset the endpoint first by calling usb_clear_hal=
t()
-- just like with a -EPIPE error.  I think usbhid may not do this; if it
doesn't then it needs to be fixed.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

