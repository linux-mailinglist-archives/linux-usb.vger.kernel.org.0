Return-Path: <linux-usb+bounces-33912-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CWcH1X4pmmgawAAu9opvQ
	(envelope-from <linux-usb+bounces-33912-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 03 Mar 2026 16:03:49 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CF61F1FA8
	for <lists+linux-usb@lfdr.de>; Tue, 03 Mar 2026 16:03:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F41DD30FAF02
	for <lists+linux-usb@lfdr.de>; Tue,  3 Mar 2026 14:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93E6E391853;
	Tue,  3 Mar 2026 14:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sVE6qkCn"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7621D47DD6F
	for <linux-usb@vger.kernel.org>; Tue,  3 Mar 2026 14:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772549693; cv=none; b=sjvS+o96u0T2eqwUZabddelaCHrpZCZiv9lB/lLvaeUdaydF3xKUaIqwnJ95I0wwHRk18WX8Xb6+h/VJ0TVGMLh8+agybM1d/n6UJhXFXnm+PlUOGBfjuS919XnGv60+wKW3rk14MUul1pV+GZIObvoNnhJK2OTcHDI3E0GfR2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772549693; c=relaxed/simple;
	bh=HcuzwedtrFw2h/i6L3ldXtZDPRfHTQ+nN0Sr+QHGETo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=f/GOOOg28IJMtWaLM9vTQ2hnFzrD5weRKIMUBJ2YBM4E+PVepsT/9TcsoSY0ckrTcTOU/mGBaIojI0h7AByyHQEFqVDjZ1zupw8viQnyaUileg8qvl7LUCi3fAkQSjzeX7F5VFz7xMpkU+XLPmFx9PZiETP3qAZvVsdfK/9BVvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sVE6qkCn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EEECAC2BCAF
	for <linux-usb@vger.kernel.org>; Tue,  3 Mar 2026 14:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772549693;
	bh=HcuzwedtrFw2h/i6L3ldXtZDPRfHTQ+nN0Sr+QHGETo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=sVE6qkCnL/BQ5xjvSFCV+MES7Sba6R1+bcS4+itiQwAkJYsT0SMYhmCPThasdlHta
	 eQWz9pz+QWaUKqSqNDpcRlgDPJL0fLkrLXoSsCqIcwERTpDFeqnJFdgZJ+DPMKWCPV
	 IDAKs4VRZ9TShUeiOjuSuwGAIEl3qWqRUcjezbP/byOV7bJ3ise/618UU+f7B5TXR8
	 JDLENf6AqDchBeo0iD2SLWQ6beXg/dK2BvNExU4UNlATEQvwFNdPDzSMi5Jg4Iw7mp
	 Pd+LC/DwuiP92LQXZKtExvi0Hk5mefGKEVerVdAvbRzF/OIplUqjvha5+lcrSOweQU
	 7aNCW4LjRdS0g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E52F2C53BC7; Tue,  3 Mar 2026 14:54:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Tue, 03 Mar 2026 14:54:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: david.c.hubbard@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-221073-208809-HSP8qhCIVi@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: 11CF61F1FA8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33912-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.992];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221073

David Hubbard (david.c.hubbard@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |david.c.hubbard@gmail.com

--- Comment #20 from David Hubbard (david.c.hubbard@gmail.com) ---
Created attachment 309523
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309523&action=3Dedit
comment16-cap01.tgz

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

