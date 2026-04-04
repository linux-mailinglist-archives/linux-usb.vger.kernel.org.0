Return-Path: <linux-usb+bounces-35983-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDDTMc1M0WnsHQcAu9opvQ
	(envelope-from <linux-usb+bounces-35983-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 04 Apr 2026 19:39:25 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3017D39BFC0
	for <lists+linux-usb@lfdr.de>; Sat, 04 Apr 2026 19:39:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E8ED0300BDAC
	for <lists+linux-usb@lfdr.de>; Sat,  4 Apr 2026 17:39:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F5E43321B1;
	Sat,  4 Apr 2026 17:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u9iwqE+4"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E284720DE3
	for <linux-usb@vger.kernel.org>; Sat,  4 Apr 2026 17:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775324362; cv=none; b=YaJNQUwn+UiT3Qe4oVrcRBlD3e5ijxseQ5k/2OOtw3LP0v4dBqB3Ub9Gw86N7sl46xArdZ4GL7a/2W27HIWRHk/8uXgG9ITyLt/h3KNgAdJ+1VaQrGEoEVXIUxs7dI4T5CSKHdyacrvNsM4M9COHGGQbSTIrNm2arzI8Ttvivqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775324362; c=relaxed/simple;
	bh=PXlarIF0Mq0EyKsVUC4ld8hZmFKGFZzmBR2Z04sS2AI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Y+mnTKg9Umdvb3JMUlFUvPiCWtIYVYZpqe93cCosMp0srpgP1Fap5Xahp9rTMwwXNTN3eviW9bPdgrdTl5fu9zFt4uyJGbMZ9o2pmBaLSeJ1LTA7uJsLmWO5ja98x9C4MtUC+7MuthM1zIxfML1rQTKIfwRQQH+B4sV2olVjRYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u9iwqE+4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7EC6FC19424
	for <linux-usb@vger.kernel.org>; Sat,  4 Apr 2026 17:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775324361;
	bh=PXlarIF0Mq0EyKsVUC4ld8hZmFKGFZzmBR2Z04sS2AI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=u9iwqE+4k9PnWcmhlcW8keS+33nptc2NUgLuIr+sHmMiT4w32b+maWGdw0IQAaFa8
	 UqzP7JCu8500hQrn/3gu4yY9g25h2Yk+/Zj5fpJMMJcERNbi1qqFQJuVu9XakUdYal
	 JFseB1IebDMY728B7pTklrer/260q3JrJ/dj807NWmvz1Od0mWKoCH8rKGvMneN1AH
	 I0f7FptXK+AQ5qagugVt8s4xOKvjmR0e3qaoZbbGgkCW9oqzWry9o9BVja6eNgs73g
	 wumnwMafEWlVn6nYeSE9mDATzQ6K4E6iioLN8ECKd3UKIx2bzDlW+Z6lFeiB4qLWHT
	 RKjW8aCT5bjqg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7765CC41613; Sat,  4 Apr 2026 17:39:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221318] mice behind ASMedia ASM1042A via Thunderbolt 2 never
 produce input, most likely due to interrupt pipe idle window during
 enumeration
Date: Sat, 04 Apr 2026 17:39:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: manauer.uel@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221318-208809-zr6h4MRnQZ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221318-208809@https.bugzilla.kernel.org/>
References: <bug-221318-208809@https.bugzilla.kernel.org/>
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
	TAGGED_FROM(0.00)[bounces-35983-lists,linux-usb=lfdr.de];
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
X-Rspamd-Queue-Id: 3017D39BFC0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

https://bugzilla.kernel.org/show_bug.cgi?id=3D221318

--- Comment #6 from manauer.uel@gmail.com ---
Thanks for the hint! You are right, the ASM1042A is the host controller. The
actual hub inside the monitor is 043e:9a10 I think, and it shows up in both
connection variants. The difference is just which xHCI controller ends up
hosting it.


The Thunderbolt log contains two controllers: Intel (0000:00:14.0) and ASMe=
dia
(0000:0a:00.0). The Intel slot 2 ep 2 stalls that repeat every two seconds =
or
so throughout the log are from a different device (i think) and are not rel=
ated
to the mouse. The same stall pattern appears in the USB-only log as well.

The ASMedia side is where things go wrong. During each enumeration attempt =
of
the mouse (slot 3), ep 0 stalls repeatedly while the device is being
configured. That part eventually completes and the mouse is recognized. But
then this appears:
> xhci_hcd 0000:0a:00.0: Split transaction error for slot 3 ep 2
> xhci_hcd 0000:0a:00.0: Hard-reset ep 2, slot 3

Shortly after, the mouse disconnects:
> usb 3-1.1: USB disconnect, device number 5

It then re-enumerates, and the same cycle starts over.

The split transaction error message is maybe the thing we are hunting for,
since split transactions are the mechanism the hubs Transaction Translator =
uses
to bridge full-speed traffic to the high-speed controller, right?. I do not
know enough about xhci_hcd to say whether this means the TT itself is faili=
ng
or whether the ASMedia controller is mishandling the response. But it seems
worth looking at.

For completeness, the USB log shows no disconnect or split transaction erro=
rs
for the mouse. The stalls on slot 2 ep 2 that are present in that log are t=
he
same unrelated device I think.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

