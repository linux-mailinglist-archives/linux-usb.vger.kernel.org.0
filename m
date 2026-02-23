Return-Path: <linux-usb+bounces-33586-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGilIC6UnGnRJQQAu9opvQ
	(envelope-from <linux-usb+bounces-33586-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 18:53:50 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE0317B21F
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 18:53:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F0167304A8A0
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 17:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 852EB338910;
	Mon, 23 Feb 2026 17:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mTGe7SYx"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12470333733
	for <linux-usb@vger.kernel.org>; Mon, 23 Feb 2026 17:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771869135; cv=none; b=bbjoWEvBdzxSZZNHCMn4m2VuOC+4aegnIWyxYrwyuJ30EekyPqX1sCKk3ugwzA4gX2M53QIod47kUyNxuTVRfPuxgEgUepnFVCia+IZSIelIENENaicn9mKi4OS3YZ4ogxp1E3glwm2owQEMg6zyDRwDmbLLa47reW61LZeHUdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771869135; c=relaxed/simple;
	bh=MGFzPUqd2Ma833RigrWePIShsJXqwtj/E/6aDL7pMDs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XTZA79mgI0mNa5Ki7tmtwpF2akb59WqyiqGk86WP6J0M1CHwTnWGaGREINOzwbt4Blhy7/r2aWMMuloeMbSGCu3/qi13oI/rBsfcdrIfK+p4djHqM99WbEEct/Rz+F5hd4EOFZbbsjqurDoU5HTmKW7TKJ1g3nlHmBsVK25fhHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mTGe7SYx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8F5B0C116D0
	for <linux-usb@vger.kernel.org>; Mon, 23 Feb 2026 17:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771869134;
	bh=MGFzPUqd2Ma833RigrWePIShsJXqwtj/E/6aDL7pMDs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=mTGe7SYxQBUYlMym59HPxuiURVQi0rL4kdduzeUYh4RfT/Ru9YW0oJ32r92ToNLUV
	 Q4gXMgU/+P9PYAzQPPzxHgxGYYpNMrQlF6+MIRN053/Ie69xGPrGweYadLRv5Xz7dG
	 UfGXUC3bSf5F1BRcD08giYNw6fLC706QCWkAVwtgreHp5INA199IGRDyozfRmCsZZ7
	 f6UQaoMSannv8NMCN/9zz5ZrkYa+ABWojXlpUdEP2WBQmPeHC0Dcqm+IAfCkQpe/8o
	 1wBoWQvbsv75jkiO36CBPOV/l3c29Uo1A4sszl0Gn+TG74V1HNZxqa0OUjiyj9e8Zm
	 4VP3Su3kxmvgQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 89640C3279F; Mon, 23 Feb 2026 17:52:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221103] xhci_hcd: System lockup under CPU load during usbfs
 polling of USB devices on AMD platforms
Date: Mon, 23 Feb 2026 17:52:14 +0000
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
Message-ID: <bug-221103-208809-NdMOjdBbXf@https.bugzilla.kernel.org/>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33586-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1AE0317B21F
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221103

--- Comment #17 from Paul Alesius (paul@unnservice.com) ---
(In reply to Micha=C5=82 Pecio from comment #16)
> Would this fix it as well?
>=20
> echo 'on' > /sys/bus/pci/devices/<pci-id>/power/control

I am now able to use netconsole to capture the logs during the freeze. This=
 is
all that is logged when the bug occurs and the system freezes:

cat netconsole-2026-02-23-1819.log-output-during-bug
[  549.009867] xhci_hcd 0000:7a:00.4: Controller not ready at resume -19
[  549.009891] xhci_hcd 0000:7a:00.4: PCI post-resume error -19!
[  549.009894] xhci_hcd 0000:7a:00.4: HC died; cleaning up

And then I tried with control=3Don on the affected device
(/sys/bus/pci/devices/0000:7a:00.4/power/control), it seems to have elimina=
ted
the bug and system freeze. Control defaults to auto on the affected device =
as
you said.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

