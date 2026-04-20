Return-Path: <linux-usb+bounces-36339-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOulHdjw5WnCpQEAu9opvQ
	(envelope-from <linux-usb+bounces-36339-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2026 11:24:40 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCB4428CD8
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2026 11:24:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CDAFD3019395
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2026 09:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E49FD38A718;
	Mon, 20 Apr 2026 09:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lNvMqO1v"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739043876DF
	for <linux-usb@vger.kernel.org>; Mon, 20 Apr 2026 09:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776677071; cv=none; b=TEEtAonfTGvAQc5mWdUNXS/gwOn7pB5+WmRSsTvKsecE7F2lEIy+22JVRjc5uoyDAUwi4ANEvwg4ZyjibhPpl4HrLpCvYofi9nRjtPVwjgdMv3gKG+1E4v3Bf9laQPtd4BCm9YamL8rUS1uUSDGZEiLOO1IP4AgWqcxLk9H2zGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776677071; c=relaxed/simple;
	bh=0g8fWXQFbZux3RRzq4Q/soXBj7bPi+AGSRdUIfTSy2Q=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qr4W6I8I+X0ucFcX2GtKc5JqzTHAi6DUFIkb6QbDTM2EtZi8KnODoon7KofAz/qExHO60/5mDuHw5sR2AreHLuJkCM3ukivZSjNWBNFuaq/V4BF8YXcGfEjaIxwvOtYIg42vmrR4owpsPyramRbD5P0OnIhCv2rZ8BOjuyMWuAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lNvMqO1v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1F227C2BCB7
	for <linux-usb@vger.kernel.org>; Mon, 20 Apr 2026 09:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776677071;
	bh=0g8fWXQFbZux3RRzq4Q/soXBj7bPi+AGSRdUIfTSy2Q=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=lNvMqO1vzGE7KoPIJ6RZD3QcD/slOMjzl79F/mqHYXxWEiuOmecma9wCUJ5zvb1Xa
	 +I74Xx9C4/aTSXk7bdk7sDQi8GEPseyDm9S1I052wodqE3lpJL3KwxhRygjyDASjX9
	 Hd0GCJ1A2GuNrgUpSZRykQMxsKkZk6cTNmQWPDwzMPev8q1Sm9XS41JzGsRtb4+FtO
	 usXiVGHvYV1liFEHsl8w2Ytn9HGSV3+ppf4uvWLkyjShJWBlD9o8s+IJFSfsUuTXVg
	 hanoFtOFaw0Qgve3/pe29RRf4anJ91zDV+XZUq6hi/hei/fHt4BP4LhuFQlte48LvF
	 /Xkp33nJ+XlSg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 10BA0C41612; Mon, 20 Apr 2026 09:24:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221340] uas driver hangs and causes usb reset
Date: Mon, 20 Apr 2026 09:24:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: oliver@neukum.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221340-208809-zrFxkDCfPT@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221340-208809@https.bugzilla.kernel.org/>
References: <bug-221340-208809@https.bugzilla.kernel.org/>
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
	TAGGED_FROM(0.00)[bounces-36339-lists,linux-usb=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,neukum.org:email]
X-Rspamd-Queue-Id: EBCB4428CD8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

https://bugzilla.kernel.org/show_bug.cgi?id=3D221340

--- Comment #12 from Oliver Neukum (oliver@neukum.org) ---
(In reply to DaisyTheFoxxo from comment #11)
> Nevermind, It happened again. It took longer this time though

Then please try the 'm' quirk.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

