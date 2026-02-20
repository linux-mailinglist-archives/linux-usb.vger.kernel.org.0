Return-Path: <linux-usb+bounces-33507-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPkdFfkrmGlqBwMAu9opvQ
	(envelope-from <linux-usb+bounces-33507-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 10:40:09 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB6E166552
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 10:40:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 85E0B30154AB
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 09:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6568C31D735;
	Fri, 20 Feb 2026 09:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JImijxWx"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BD7318ED2
	for <linux-usb@vger.kernel.org>; Fri, 20 Feb 2026 09:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771580406; cv=none; b=si+eeQhMplvW5dDbcPIfvDzvGV7GZsv1zsZpvJhudMI5Z6tcHd6Jur4Ptlrw3r5fvZAE7lxWeOc4I2bk4XXlVO57qYrq31bROT4jv2IEoGX7dt0uQ6HxSPgSZ2RP7DHl7lRW7wLkYeY8eiEVtOh9LzzZv6mzNn9T9LbEKqvI/vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771580406; c=relaxed/simple;
	bh=97jmE8h/rLxbNEsxk7Q0LiwkIpCdnj7sqHxvZP/DMbY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Qt6GxTtsH0mOUvjd20pOgrKubNkH58PCKhZtf1P3TZ4cBnCHFJBiCGBGdg/PdRpLPnXct5ueV+iLhgqKnblFHty8D3LisJ67FfMcH8baWDDpKvuLQMUraCVYukaiGSHffal8NLG5hS9uwJt9COgW/BGJkqHSJDvyWicc4n45AnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JImijxWx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 88BF3C116D0
	for <linux-usb@vger.kernel.org>; Fri, 20 Feb 2026 09:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771580405;
	bh=97jmE8h/rLxbNEsxk7Q0LiwkIpCdnj7sqHxvZP/DMbY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=JImijxWxRV6VfyHN9uuv6htF4rE9Ja7BxCjJnCGyz13FU3397xj4MIr6dOMwTpls0
	 5jH2KYNNDuotarVayzsCPHjn/M1q9rXfso8oGEqLwNQg8mLrA6H/+cgKqjiTfmQDPp
	 w9lRAZAlvXywCd8cXC2JuSr2K0wy09LxGxfD/RS70B7f28mvPwFK3I3s5tOkPchwK8
	 l4No6qjKxjNIBclO0uTc+Eu2NtbEHVzyxm8GMA8V5qEJcD9NBfaPEEscJ190+TTJ1Z
	 FMSXTK6mf/lA9HyzqCM2x9Y977hbQ30JlQmi/3Nui6tMyR9eqhB9NaiLUZgMCNIphL
	 tV+Kzx1BQrQSw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 739ECC3279F; Fri, 20 Feb 2026 09:40:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221103] xhci_hcd: System lockup under CPU load during usbfs
 polling of USB devices on AMD platforms
Date: Fri, 20 Feb 2026 09:40:05 +0000
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
Message-ID: <bug-221103-208809-rtbdyQhXhR@https.bugzilla.kernel.org/>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33507-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BBB6E166552
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221103

--- Comment #8 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
Or perhaps simply this would crash it?

while sleep .1 ; do true </dev/bus/usb/010/001 ; done

Chances are that sleep isn't necessary. This seems equivalent to what you a=
re
doing and it triggers some code in xhci_hub.c, but no crash so far on my AM4
system.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

