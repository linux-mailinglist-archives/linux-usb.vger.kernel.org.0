Return-Path: <linux-usb+bounces-33500-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJB/FykdmGnp/wIAu9opvQ
	(envelope-from <linux-usb+bounces-33500-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 09:36:57 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C024D165B74
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 09:36:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F1782300CE54
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 08:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 390A03161BA;
	Fri, 20 Feb 2026 08:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZcDl+nXz"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA3A3128A3
	for <linux-usb@vger.kernel.org>; Fri, 20 Feb 2026 08:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771576297; cv=none; b=txlifRv+0w5dkSflDoA0hNKauKzFsPO25EHiJeWE6HNK3Qy7/tn/VoArrHxM5QCIoa/PDgr8Sk6LR6loeO2Py+/byDKS0FQ0Nt7ffZKSihOsKWbzazckaIHxPez/oThc02RGx+CTE3UlHeyCG22/udc78cyQnK5Lkjq+CkZa8K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771576297; c=relaxed/simple;
	bh=2Mt6vC7+b17eQQkjRug5RtLjFeQfHzv6cnGi7KlRzBA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aynheHoXHfmhU1dAOQy7E5PMsKKhrD6M0qt5ruFmO8Ho/QHQa00lwX8YlP8hUAlRAuO3qA2iodDZCHPJq++tMOhFVg14xrm3MOcqlSH1ZW6825ZITmsZ2i0QQvyXeTen7YRr7/MOYArUbktvwlnJWtzF6REFgQz68h05g0obrLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZcDl+nXz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5115EC116C6
	for <linux-usb@vger.kernel.org>; Fri, 20 Feb 2026 08:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771576297;
	bh=2Mt6vC7+b17eQQkjRug5RtLjFeQfHzv6cnGi7KlRzBA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ZcDl+nXzl/Q0jkpKnkbYPIJf3E8lmdxPiPZyrVnFY63aJehwIcrNm4atI+XYQ8xqm
	 BSn0fG050PcpzEnahz684pakrClQLASC+1EmFpBrbk6TbdRWf0uDSxuKTtY8MBBOsF
	 5Qq6SBtn2cJqiXL1iibt/xBZv83rxE3MLTxv1Kj2KJQ1LrlfqOJdFqttgoFcs22GgF
	 z+VVVbJDedBT0wG6d/VaNpWCRLndtz0yF9kYkEVmP6TRCYxSUM1PYDEOYgp1VfYeK2
	 PekA1Oh0Locp8OUzpNBYRpOfVqU5HBGi9cnWVjr0Lg7s3bJ/zTUoSg2+kVmkTB9pD/
	 KTuLQa/HfsHgw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 477F0CAB780; Fri, 20 Feb 2026 08:31:37 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221103] xhci_hcd: System lockup under CPU load during usbfs
 polling of USB devices on AMD platforms
Date: Fri, 20 Feb 2026 08:31:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: paul@unnservice.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221103-208809-BCt16QfqPV@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221103-208809@https.bugzilla.kernel.org/>
References: <bug-221103-208809@https.bugzilla.kernel.org/>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33500-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C024D165B74
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221103

--- Comment #2 from Paul Alesius (paul@unnservice.com) ---
Try this command: sudo ./usb_poll

It is definitely in USB.
This program triggers the system freeze reliably.
Many of us are affected, as referenced in the ADB bug.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

