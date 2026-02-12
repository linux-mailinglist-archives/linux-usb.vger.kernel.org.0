Return-Path: <linux-usb+bounces-33323-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cN/jIdaljWnu5gAAu9opvQ
	(envelope-from <linux-usb+bounces-33323-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 11:05:10 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E095E12C352
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 11:05:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC4573163A3E
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 10:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ECFB2ECD14;
	Thu, 12 Feb 2026 10:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XqDj8elH"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBB12EB866
	for <linux-usb@vger.kernel.org>; Thu, 12 Feb 2026 10:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770890534; cv=none; b=TxolcEts0nmZo10PN+zLGy7101V2QSgZ4zi+Vws3a7zP5PVM2dJuhY9hqBLPRzX7fbNMJmmGQ2ap015gRfnJMv4G+DdQBYnAqSgupZMVftG2/uX0jPuEv22D/tKuIHUAd5KWFIeE15gsSDtPaNsw9IN7mUKnFbsEdZSAx31aoYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770890534; c=relaxed/simple;
	bh=IKGYaTL/Wu45D4z8FW1EdQ3Mr9EDH0KIE7Vnjnka33Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NdTYNRJJZ0zZaom8DiyECK8o+McYq0qyQ+s7LBMlCwt31r1LeHXJmev/LdKah+rWdoq7O4vfklzKbor/uAHoBPvhkyPoVM+P+XdS7h78X8IbIOb6rjT6/KhnrUhqoRJV2Y5vB00vS4CNsEUv0nAKJlVgWCQCHAi5oJ3YpvB2drE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XqDj8elH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 39C7FC19425
	for <linux-usb@vger.kernel.org>; Thu, 12 Feb 2026 10:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770890534;
	bh=IKGYaTL/Wu45D4z8FW1EdQ3Mr9EDH0KIE7Vnjnka33Y=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=XqDj8elHeHCj8Ygwn8z4BP/2u9MLN0TyGwJuLSbZwo3nwqueBTsK+PP3MkxVDExfG
	 E+cjmENR0YMgUMOllDrwarOuhN2UMm/erPdUHWzZuxp+jHVW0T/BY85MF7OSRNKoHi
	 eHFldwInE5xFIq2Lu47263Q/7ljMemCERsxBI2ZGGftXXeSD2PP2L+28xvIPmOEoDS
	 KN2byslAmy0pTPODyd5rldgSmAqn/ffsSt6t5CmCAghbC1GGMv37hkbcW9Rjz9pzjE
	 9A798Gm8svwqEK9x8zQ/ycTTXQmKliAUWOynur7GoQrVu+EDZ7yqjTaJmC9K+ywm86
	 YCUhIdgii8f/w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 29557C41612; Thu, 12 Feb 2026 10:02:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Thu, 12 Feb 2026 10:02:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221073-208809-eEP2V0az2j@https.bugzilla.kernel.org/>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TAGGED_FROM(0.00)[bounces-33323-lists,linux-usb=lfdr.de];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Queue-Id: E095E12C352
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221073

Micha=C5=82 Pecio (michal.pecio@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |michal.pecio@gmail.com

--- Comment #5 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
It's intriguing that failure rate varies with kernel version, but bisecting=
 an
intermittent problem is not going to be easy and there is risk that the res=
ult
will be boring.

Per dmesg, the crash happens a few seconds, not 22 minutes after suspend. L=
ooks
like you have a fast and reliable repro on 6.18.

There is a warning about resume taking long time, not sure if a result of t=
he
xhci problem or possibly both issues have a common cause elsewhere?

Is this unique to s2idle or can it also happen after suspend to RAM or
hibernation?

Do any particular devices need to be connected for this to happen? Stop
endpoint timeout implies that there exists some endpoint to be stopped in t=
he
first place, unless the driver became completely confused.

Rebinding the driver almost always helps because it resets the HW and all
software state, so this doesn't say much about the cause. It may still be b=
uggy
HW.

The RESET_ON_RESUME quirk may possibly work as bandaid, try
xhci_hcd.quirks=3D0x80 boot parameter or pass it to xhci_hcd module if usin=
g one.
All USB devices will be dropped and re-enumerated on resume.

Can you repro with dynamic debug enabled and collect debugfs data before
unbinding the driver?
mount debugfs -t debugfs /sys/kernel/debug # if not mounted already
echo "module xhci_hcd +p" >/proc/dynamic_debug/control
echo freeze >/sys/power/state or whatever you do to trigger it
tar czf debug.tgz /sys/kernel/debug/usb/xhci/0000:c1:00.4 # PCI address of =
the
dead chip

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

