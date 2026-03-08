Return-Path: <linux-usb+bounces-34231-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AAwaJZOTrWlH4gEAu9opvQ
	(envelope-from <linux-usb+bounces-34231-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 08 Mar 2026 16:19:47 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A0F230EAD
	for <lists+linux-usb@lfdr.de>; Sun, 08 Mar 2026 16:19:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5B6E7300620E
	for <lists+linux-usb@lfdr.de>; Sun,  8 Mar 2026 15:19:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3644127F01E;
	Sun,  8 Mar 2026 15:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AkMxdnfw"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD867260F
	for <linux-usb@vger.kernel.org>; Sun,  8 Mar 2026 15:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772983181; cv=none; b=KYlPCKc8PXwwUNyLAvX87Q+xV8ySeyAhHZ+My4QmYS44FQtwmO5jVO/YNeM07X4+mL5a0giuoAWy/OTB25jrvs3M6xk+/OVttKIhPeJcQuBuU1VRu4+vLSxK8hrJfnGpnqEgzUXUtmKyhmt/jMOokK5/vDtVLS+e2lk2ryny0rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772983181; c=relaxed/simple;
	bh=WRr2tYJmiXh4DWxBLQkFW+/NHggnW75MzWC0le2sqA0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Xe7DULyL+G+J+YJW0YabxNBAsaF7tDgfmTI46K8Qm0VmUmd7ZtfbcFE+xULiWzkRnyzj83vCPr1iplgaPk0egmw1NH7Q6zXtfrP9kXSHObpyGN0WA1X9L99bz0ujIDlFE8hALskGgkVu6vOr6Z1VGCWCq1cu8NEtuvYI/9QbY/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AkMxdnfw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 61E8FC116C6
	for <linux-usb@vger.kernel.org>; Sun,  8 Mar 2026 15:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772983181;
	bh=WRr2tYJmiXh4DWxBLQkFW+/NHggnW75MzWC0le2sqA0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=AkMxdnfwpdOSAGEr1lkwTqYpatBl1ZlDmsWNhHa8exdrYs8CK/kNVc2QBvry0SbLq
	 weXcZMJnVMNS5DWCQNu7ucVay3IQGILQNKVdV3QDalArKJWKIcjAPXnFkg62FrTU9w
	 7Kk8D3IUI426TYPAZFYjUvBeQpAuhbN5sTKjugNsgaF4RpJtWrjUwWbyyeW4VUtY55
	 bUq78aOBEN3BZtkg48VMgYLelnPHnMqyNnat3pqaI/UrRB71eAMJBmfheFTnjgrC6Z
	 xZ1pdLFMuYZQTS1uhoOVSbu41yC7SuloIsQtu4p91SrBq8cRWarhgt6BX6aG1j8alG
	 JV7Wva0q+SCag==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4F9B7C41612; Sun,  8 Mar 2026 15:19:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221184] mouse/keyboard (connected via hub) usb reset under
 system load with weak cpu
Date: Sun, 08 Mar 2026 15:19:41 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221184-208809-eDqftJQhiw@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: 91A0F230EAD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34231-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-0.988];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221184

--- Comment #12 from Roman Elshin (roxmail@list.ru) ---
I was`t try usbmon with other oses, but end user symptoms looks similar.

>Yes, the reaction can be tuned to improve your experience, but that won't =
fix
>the underlying errors

patch looks incorrect for me: between "bad" events may exist many good, and

time_after(jiffies, usbhid->last_proto_error + msecs_to_jiffies(500))=20

will be false in this case?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

