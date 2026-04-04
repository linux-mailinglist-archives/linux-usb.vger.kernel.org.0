Return-Path: <linux-usb+bounces-35980-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMhJKGhL0WmuHQcAu9opvQ
	(envelope-from <linux-usb+bounces-35980-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 04 Apr 2026 19:33:28 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D4339BF78
	for <lists+linux-usb@lfdr.de>; Sat, 04 Apr 2026 19:33:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 868A530054D8
	for <lists+linux-usb@lfdr.de>; Sat,  4 Apr 2026 17:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 200FF2BEC3F;
	Sat,  4 Apr 2026 17:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hqiY3rhz"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44AC35893
	for <linux-usb@vger.kernel.org>; Sat,  4 Apr 2026 17:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775324003; cv=none; b=XdJoCUoG+i9VJu61c8RsLtrzsUOsCdQVbSuWMt2l137dChaxkOVt9Uq4BH3uiNEe8IPE48P8ECg3ohYSSMCT34BaEH+E8y41609agRlOF2YW4xYn9pnDt9D4jTrrapzfCnfTjKZWlhRQbU2PoONTG38Qia9dMJyPc2Bm41feZqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775324003; c=relaxed/simple;
	bh=V/YXbTuY4y43v2IRNb69S+ePtH38sTJWRsaBXA5Uue0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=u26B85KiVXX8tXTqujNELdK8sTA3qd4R8Vaac3aUmHiBkRmwny4BiWHy57Llm6+djOaq5xkXBFsfa1R0+eszyP1FuEIc1NrJr8sWPd7+raXbo3aqoAXPI8ZP/QlOPcV/09mB5Gj1NbxreQT1yJ+fvvcvc6248KOoMfExe3tsSBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hqiY3rhz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 468C8C19425
	for <linux-usb@vger.kernel.org>; Sat,  4 Apr 2026 17:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775324003;
	bh=V/YXbTuY4y43v2IRNb69S+ePtH38sTJWRsaBXA5Uue0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=hqiY3rhzYADaVcGB7bbfvIIMsxncr+PlnSOuuexCKM+pg8Tc/9btjj789wdLbqlOr
	 L7B3DdcVUYsCIyLYQWW3Tr6zqhOd7r1yY59H/BtAf3J+ky2zHbDamQ4Gq5hUZqEBWF
	 buTY4kdKOcW3KOtkZjmA7+i47qJaaK8cBxMRUojQ/wXSei1itseP4cX2Mb6pvrNE/8
	 bVgM+UKBANWMLErqclxT08LoNniHDvVHJoVRiAzn7RrO9V/a3E6JXh3s7J7f7tUb2a
	 2PEwB+aGeyCJEM7ina174kGCgOBbLcdrL/zcG47agTExFkGxK4lLRLBEWNA0YIFHbQ
	 OlqjX7MShBDFg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3FC4DC41613; Sat,  4 Apr 2026 17:33:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221318] mice behind ASMedia ASM1042A via Thunderbolt 2 never
 produce input, most likely due to interrupt pipe idle window during
 enumeration
Date: Sat, 04 Apr 2026 17:33:23 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221318-208809-M7fkMkGQPs@https.bugzilla.kernel.org/>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35980-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 38D4339BF78
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

https://bugzilla.kernel.org/show_bug.cgi?id=3D221318

--- Comment #3 from manauer.uel@gmail.com ---
Created attachment 309816
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309816&action=3Dedit
lsusb -tv with monitor connected via Thunderbolt 2

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

