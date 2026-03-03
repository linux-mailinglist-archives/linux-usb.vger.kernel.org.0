Return-Path: <linux-usb+bounces-33930-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHNfI5xnp2mghAAAu9opvQ
	(envelope-from <linux-usb+bounces-33930-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 03 Mar 2026 23:58:36 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E60541F839A
	for <lists+linux-usb@lfdr.de>; Tue, 03 Mar 2026 23:58:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 87C1C30432F5
	for <lists+linux-usb@lfdr.de>; Tue,  3 Mar 2026 22:57:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 992C239020B;
	Tue,  3 Mar 2026 22:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u7XF/96H"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C663644CB
	for <linux-usb@vger.kernel.org>; Tue,  3 Mar 2026 22:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772578654; cv=none; b=b3lRau5jUDvbn2c/Qog2rCmmpPx8g+/TtvAy5A3M5Oa2UHLTGCCyDAuOSui+PxArpyz61FiJlM+4IxuFxS9hKdNBkauFDx4FtneENPxwh7MU4HtrjcG+W/SO3j8tCSog7CSzZS5bCCDlEdEI0eVnG7fpSI/plcmptRzvZxTI8ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772578654; c=relaxed/simple;
	bh=q/BrtncYK+iqZ+NcUoeS1VRIBWfsDEGd5IHRRZiJ7UI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ejzKYgoLorpoM1kAjsf5sRGGFMtSc7w7NhzOWImHLZy7wxFmRDHqHfK0cXgopmiFTPw9JIa/AeP3PVPjBIZcIIgpBVnANWsKnOBlpwhcGGQZD9JrNkMRG2Mi1fm78v6CGP2QAbh4IADP9YOe9AVSdO6cB+cKLpdnVvMW9YYoOsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u7XF/96H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D3330C2BCB1
	for <linux-usb@vger.kernel.org>; Tue,  3 Mar 2026 22:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772578653;
	bh=q/BrtncYK+iqZ+NcUoeS1VRIBWfsDEGd5IHRRZiJ7UI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=u7XF/96HtnXjWZXUWfvf5Cx+tREqCPefFxg3osLmaRT2hGEIwmV6QUpuHc1k7zDbI
	 1ibPtj7xktliTAYuJrFesZeiggJFwfNjG2m+8ARp6L0vE2YGGHfC+Wjk5R2DYa1MqU
	 fFgWASDluQ46sEHsIWGMki0gHDQ7Fbk1pCSdjErvRXu9yj+X4CKFWjaPTlZnSuMcRj
	 VoL671+YWdKjtD52Mb9gBpwVG6DwBJQk+jeB26LcMKzdkDMMZU9KP2114a36vUjKBl
	 Znhbnh6hPsz5rKh2ThhxF15lPgd2JlfMTYiSd/68weCiftHBHBhmZ5erwliFbKkZzT
	 ojUTRauxbIiTw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CBF38C4160E; Tue,  3 Mar 2026 22:57:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Tue, 03 Mar 2026 22:57:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: superveridical@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-221073-208809-5eb2Uum9Ts@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: E60541F839A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TAGGED_FROM(0.00)[bounces-33930-lists,linux-usb=lfdr.de];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221073

Alexander F (superveridical@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #309514|0                           |1
        is obsolete|                            |

--- Comment #29 from Alexander F (superveridical@gmail.com) ---
Created attachment 309536
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309536&action=3Dedit
Z13 dmesg with xhci_hcd.quirks=3D0x40 (fixed)

I apologize -- my previous attachment was truncated.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

