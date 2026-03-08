Return-Path: <linux-usb+bounces-34237-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id crIEM8ygrWnp5AEAu9opvQ
	(envelope-from <linux-usb+bounces-34237-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 08 Mar 2026 17:16:12 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A13E2310B4
	for <lists+linux-usb@lfdr.de>; Sun, 08 Mar 2026 17:16:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 62CF53015CB1
	for <lists+linux-usb@lfdr.de>; Sun,  8 Mar 2026 16:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C1B8283FC8;
	Sun,  8 Mar 2026 16:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EjU4+LjN"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF94154739
	for <linux-usb@vger.kernel.org>; Sun,  8 Mar 2026 16:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772986568; cv=none; b=tM8yLKwKkYqdrU2AHWntNoRwNWEtTET2R1kL3874On7q74HSjHa6RvE0yPPlAGIfIq08KeubHmx3h39Ekno4WKDb6SB1iIsQy+xhShjdtsieNj9E6mZe4B4zmg0cRAwNcEkvHhVVA/LDFxApWloI4LnRkUepHUxdAA6X43NQ7/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772986568; c=relaxed/simple;
	bh=JwBUYItFooU/1Y7t508nYZM4YxoDc3wauH8OB3eFgCQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UewwGxm6HcIwIqY71stwmJ4jii94k2+O3y1SZhEWLL0Zb0KfSDT5WLwUtDwMX+dG3mTHWM6EnPewDAModygrMTj5+3XyuUMkl58b66eyBJzTqgIB5cjkXDG1r/jOue+ithpkOTcmaKBu/nnvvNfgsB2KFYNzKugweF4zWqFxq7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EjU4+LjN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7DFAAC2BC9E
	for <linux-usb@vger.kernel.org>; Sun,  8 Mar 2026 16:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772986567;
	bh=JwBUYItFooU/1Y7t508nYZM4YxoDc3wauH8OB3eFgCQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=EjU4+LjNfk11LndiRXIoDumk0EDzuT2FWCnsiKwkt6x3pM8VoX/V9dt0gH7c+DytN
	 YHhs5aPdhnTy2fszchPXHu5Su/OmFTfAI7moDQoc+A+OFcu2kCaGs65k6ZDPp4tgah
	 8I+xSkMqL6Q48crol1fYad6agedRBMWdAei15JkkrsE0aGF4bJ0lr4OInzkr4DjUVK
	 wpNQWWDDh9mlCTICyVurYQJr1XHivEnIXoIxyRDbKgKtGzYFlk4pJntACQ1Z5NJJma
	 tBTCh/SIXLHAHi7296ya2+jzYozCnnxZswyuOybH8fQlfo7nV0NxCm5NgT1FJUqTyv
	 O8eQIGLbpcYZA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5E653C4160E; Sun,  8 Mar 2026 16:16:07 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221184] mouse/keyboard (connected via hub) usb reset under
 system load with weak cpu
Date: Sun, 08 Mar 2026 16:16:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: roxmail@list.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221184-208809-iVtjiGzBDA@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: 2A13E2310B4
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
	NEURAL_HAM(-0.00)[-0.987];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TAGGED_FROM(0.00)[bounces-34237-lists,linux-usb=lfdr.de];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221184

--- Comment #14 from Roman Elshin (roxmail@list.ru) ---
Created attachment 309575
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309575&action=3Dedit
usbmon log from debian sid

debian sid kernel: 6.18.15+deb14-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.18.1=
5-1
(2026-02-27) x86_64 GNU/Linux

System booted from sata ssd (previous logs was from 32bit debian-11 and hdd)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

