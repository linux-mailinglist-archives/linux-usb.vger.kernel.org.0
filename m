Return-Path: <linux-usb+bounces-34240-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cEslKTq4rWkZ6gEAu9opvQ
	(envelope-from <linux-usb+bounces-34240-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 08 Mar 2026 18:56:10 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 174562317D8
	for <lists+linux-usb@lfdr.de>; Sun, 08 Mar 2026 18:56:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 59525300EFAD
	for <lists+linux-usb@lfdr.de>; Sun,  8 Mar 2026 17:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D06EB385522;
	Sun,  8 Mar 2026 17:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I+kC/dI/"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6039233D4FF
	for <linux-usb@vger.kernel.org>; Sun,  8 Mar 2026 17:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772992565; cv=none; b=TTn9+5cIv6l0/ZNaQTlADqpIi5dYkQMR3R0tppu90bFUTOb6EXk7rnvhCiIwe+0KnZ8GD8Or12iNtyjcPp8iQH2WQB0Ni3YauRzEBJqEx8TpjKpfjplqf2MkuJyxTY5O/sDIxd6YAIZOTh3cgSmbjerAuLOicBvtqcPmms4Fyow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772992565; c=relaxed/simple;
	bh=Tazz66W0uB8xKME9ef/M9auzneenawq7+FcolqGIgt4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sGRQOxUZkDVLKQVk0xBBQa7lAH0nRYQSxkSyzj0vZ0UaBykdflMNba7qoOeJ6ngRJ1ronKYBalqlN9WjWHfOWfXMQx1tJaY7frNipICAz9ADDrJCaofrfpI80bXQiiSg8R6kYavWqRwtefBRl1RDP7Cq91BvwARFCIXMBGRgWWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I+kC/dI/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 26736C2BCB2
	for <linux-usb@vger.kernel.org>; Sun,  8 Mar 2026 17:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772992565;
	bh=Tazz66W0uB8xKME9ef/M9auzneenawq7+FcolqGIgt4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=I+kC/dI/qfhZS6xE3gcXXb8XBdFTpiZzQ+4pPFZvZfSbNthGLRhCWzoy4wI6V/NVQ
	 nplUARbOoAgiJicTxG/PLIDWM0aYuS7NUSg5nKMX8z8G9UXENUGgcRgfHA9IyJpnNY
	 v6aMQZNWE3fOw8hA7WckcuLxxML9fpzf8pvRGLWPOKQBi2nlqnvImrOyRuIjAAN3+k
	 +mU3EG3gWmHoo9/9ToZ7Uls8TRrliov7xLq3xdBCZRpTa5rbUZaFQRpw3R0NmpP3Hm
	 5u5JKK4TkXN1mfqmwMgB68uKMNNQ2norMT10f5ZadSlKf4VCxisWhACYdJ+RTocX1Q
	 Z8nweoTEy0d8Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1DCFBC4160E; Sun,  8 Mar 2026 17:56:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221103] xhci_hcd: System lockup under CPU load during usbfs
 polling of USB devices on AMD platforms
Date: Sun, 08 Mar 2026 17:56:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: gtschemer@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221103-208809-3bzU6WSGwQ@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: 174562317D8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34240-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-0.991];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221103

S. Davar (gtschemer@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |gtschemer@gmail.com

--- Comment #25 from S. Davar (gtschemer@gmail.com) ---
I have been supporting users on an atomic distribution, so no one has tried=
 the
test patch.

However, 4+ users who had this freeze behavior on ASUS motherboards with Ry=
zen
5 / 7 / 9 CPUs seem to have 100% success manually setting all the xHCI
controllers to "on" instead of "auto".

All of those users froze very quickly with the usb_poll test, and never fro=
ze
after changing the xHCI power control behavior.  Most have a B650M or simil=
ar
motherboard.


Was anyone with the freeze able to try the test patch?  Also, are there any
concerns that a small delay might still be unreliable, e.g. long enough in =
some
cases but not long enough in others?  Could it potentially cause a performa=
nce
hit in some cases, or is it expected to be called rarely enough that it doe=
sn't
matter?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

