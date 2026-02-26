Return-Path: <linux-usb+bounces-33724-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id COGtNvsIoGm4fQQAu9opvQ
	(envelope-from <linux-usb+bounces-33724-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 09:48:59 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 516341A2E51
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 09:48:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 12BF1301CFC9
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 08:48:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABDFD39526D;
	Thu, 26 Feb 2026 08:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NfEko3dK"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12971367
	for <linux-usb@vger.kernel.org>; Thu, 26 Feb 2026 08:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772095735; cv=none; b=SYKtvmi1Q6OD8Goj1MlWoe6OsAPGEt7Amn2PfOYRk3vnkc4PtZbDVjfDXG4LAwj2cmFHmugSlRaPk+EYwrwKq+8ULceCmnBPnkZBnYTciokmAEhKIZ8RX/YMPrhj04ZTNimqQ1k15LR24S7bnUSae4p3zUIq4AJEx9BRcQ+W57U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772095735; c=relaxed/simple;
	bh=xAL4J94Qnc9EY6vViFtTPz3MZNNsasMnYOhlQCope0Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=npXdkwHMeLNaHAf87utRTJRsmacWR29cTwkCFnGFDXXF0H8SDAQwpBlMrIMVLMzcZl0O94ZrLPeZPkFbKhejLdILHlWF9Z0ZwKhIGnbrHIz1HHxByNWVfUplEyV1FXnD3tRVDSGDwnIiZED7r9UiZf9LrW1AiyK35UEOWqZK5UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NfEko3dK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8A113C19422
	for <linux-usb@vger.kernel.org>; Thu, 26 Feb 2026 08:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772095735;
	bh=xAL4J94Qnc9EY6vViFtTPz3MZNNsasMnYOhlQCope0Y=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=NfEko3dKEn1eXkC9Ls+SAEOgU2+yWsjV2eeOYNKKOadA0zLRp24bEO3qOGDU+IZDK
	 SlLbWCn1bozAJ8sxTLqos6A50qAKKrmU0q853ViaSObiPhCShO/92F9KhR+Z6u+fX4
	 ThD+x3WbsNwYAUPv5CErn1uND79UvOe1WiMML5HZ1XLdZNOGbDeONn5DalJ6PaSism
	 dYyasOYlzDpbLUPtIp1hjQKrfZUn/RSTa9jjQWe2Fv3UOgynvqOLiT1jh7qf07NMES
	 90nC8/B1ptocTOp8sUCbSUIXN4ahTJNJc7JEg3uC/hFwiU2xLsJsH+zZRmF+yklrK/
	 3sUpvXmf9TYwA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 80F63C433E1; Thu, 26 Feb 2026 08:48:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Thu, 26 Feb 2026 08:48:55 +0000
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
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-221073-208809-A9zZjEYsMJ@https.bugzilla.kernel.org/>
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33724-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 516341A2E51
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221073

Alexander F (superveridical@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |superveridical@gmail.com

--- Comment #8 from Alexander F (superveridical@gmail.com) ---
Created attachment 309470
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309470&action=3Dedit
Z13 dmesg with dynamic debug on 6.19.3

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

