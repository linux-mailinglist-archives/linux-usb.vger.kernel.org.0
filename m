Return-Path: <linux-usb+bounces-33562-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIShMpRQnGktDwQAu9opvQ
	(envelope-from <linux-usb+bounces-33562-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 14:05:24 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 386C3176898
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 14:05:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 01217302445A
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 13:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56E6A3644BA;
	Mon, 23 Feb 2026 13:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CrEs5jeU"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D871D2641C6
	for <linux-usb@vger.kernel.org>; Mon, 23 Feb 2026 13:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771851921; cv=none; b=A1UuJEeHkexAvEti4EV51SvDj/SirBqcVCU9LZx5yetQ51CaWTUF49ghB+fit5Vf29t7lPU5QE9MxipfJOLJxQly2WpylRGjumlNHYWzCmWzsK8tYWrtecgm8OwU70Xy7Z32/V7C/9XcnaVkIgttIoDpM1KkGwAyfIiPsTuJGf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771851921; c=relaxed/simple;
	bh=0xGZHWjD+YOoo7SQOmJUGZeDTGmrHYdRE5cBGpkcDiQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BjZ49Q7lot9xI9DhzpetTYp8Ugic+gt4cve4Fvk+uni/7v/MvFt7Pz1jbXqCJNUWmAItf2bOms+PoKFfCTLWefNfIgiZJpO/Wn/7VCwrmM+BVYPRRHz2bBDTbb76YEtZMaMKW8a43PFTJ7mq8qhrMvnc34zsmz/62p3cyAf5ZbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CrEs5jeU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 873F2C116D0
	for <linux-usb@vger.kernel.org>; Mon, 23 Feb 2026 13:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771851921;
	bh=0xGZHWjD+YOoo7SQOmJUGZeDTGmrHYdRE5cBGpkcDiQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=CrEs5jeUZQp1oi3it+gW05L4LL6cqnIUz6AWGKgqhocMUqJrs5ryEtCph4WKCN+YE
	 vrlbahfAoQgAGAdHcy2xJFhLp/EIp4n4WN1msJ+ez4JaFpWfPbsSJEUPcSXDcHwaUV
	 oMvVwurX2An0CelztEGveB0HauUFvdS7kLxeiTRv77GNL2ueSNXHXcMmVQ7tzBZaEI
	 CJn6k3Jtzt9bp+lYIO6qrnlsapU5fGQfnSwxmPKv4eF7umjJambXNhNsFQG+6pxZE3
	 tMh0f6V8TeIgNCU740hHlQ7qdneeYi6Mc5aCkbsL9T9tXB6v/6IAuDOIXIjcp/3cdv
	 h5wSDLyrIxdGQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 79319C3279F; Mon, 23 Feb 2026 13:05:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221103] xhci_hcd: System lockup under CPU load during usbfs
 polling of USB devices on AMD platforms
Date: Mon, 23 Feb 2026 13:05:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221103-208809-cUXZ2XVeP9@https.bugzilla.kernel.org/>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MIME_TRACE(0.00)[0:+];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TAGGED_FROM(0.00)[bounces-33562-lists,linux-usb=lfdr.de];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Queue-Id: 386C3176898
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221103

--- Comment #16 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
Would this fix it as well?

echo 'on' > /sys/bus/pci/devices/<pci-id>/power/control

It seems that this must be set to 'auto' to trigger those suspend-resume cy=
cles
of the host controller, and it is quite possible that the problem is caused=
 by
suspending the HC, not any USB device.

That being said, I toggled it to 'auto' on a few HCs currently plugged into=
 my
test system (was 'on' for all of them) and your test program (with failing
ioctl() included) still runs just fine. It's at 3000 iterations now.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

