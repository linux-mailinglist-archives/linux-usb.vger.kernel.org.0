Return-Path: <linux-usb+bounces-36004-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id VommLegD02nYdAcAu9opvQ
	(envelope-from <linux-usb+bounces-36004-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 06 Apr 2026 02:52:56 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 006A53A0EA1
	for <lists+linux-usb@lfdr.de>; Mon, 06 Apr 2026 02:52:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F09BD30063A2
	for <lists+linux-usb@lfdr.de>; Mon,  6 Apr 2026 00:52:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FF831DF261;
	Mon,  6 Apr 2026 00:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LR5dXW8m"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A101A6811
	for <linux-usb@vger.kernel.org>; Mon,  6 Apr 2026 00:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775436770; cv=none; b=gTIAhjQXTZbCpZI45Ed9qO3/wxDUvk155eYSJFbKQpDlmhdkME7ocBXuuc0hJQz9LlikHKa89bdNU4oYiv/z1PWBXLTQkprKkjdcRJUvOeNVxU1juPWlFEUlhRvQt3VZ0QdGZRE/EeSrL2+VMcMYXDFtdAIEX4txVBjfMK3z2Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775436770; c=relaxed/simple;
	bh=UxejV5YcDdlHnFcAYGxmR9gaR0PS+N4QSZIIg9yN/uw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WqvW2nJnH3dKefZ/f/RzwKRbfkcddSvfS2Xm1gh8tmtSIDQt+6qzsjoxOlGuBfUM8/NCi/u343yFIHGUchzlEBaL8xTyLk4bqrbFPjALCXT25Ng795YilZMweFZLSq1NRNzipYb4grXG3Jf9YCQHlu2ot7OKWJbD1GYKfWNEVWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LR5dXW8m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 579B0C116C6
	for <linux-usb@vger.kernel.org>; Mon,  6 Apr 2026 00:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775436770;
	bh=UxejV5YcDdlHnFcAYGxmR9gaR0PS+N4QSZIIg9yN/uw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=LR5dXW8mHXyR0UkwZ80mrF+2Qr+gGg8xdnmCS5117vyV5uXHV1bfBwVgqz5ZFY2Ak
	 48EC3Oml+p1/EhPNTE8OEuRhc7qhQtxQck1HllyZyDrwhpPEDlENHDBtV2OHqz72eR
	 8GQyQk9umttamPdITzRqq4NysC7A0l/31JcMGTfB5xmhIMMm93J4AvPcEP4xSBwCQZ
	 TgKIL2Uq5e+ikvNuC98re/FtJPw5rz34k/4usZ0Sbb5WGauji2TXoMSdIgr2ylpOMB
	 oGMI4aFxnvCqTL82YYT0kVMkOUz4GUp47IU9OqNGCOcD5py3Lb444iVaKo+psRoKVF
	 /M7VSZjqLKbFQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4541AC4160E; Mon,  6 Apr 2026 00:52:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221319] Certain operations via PCIe tunneling between an AMD
 USB4 host and a Thunderbolt-5 peripherals cause an instant reboot
Date: Mon, 06 Apr 2026 00:52:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: foss@morgwai.pl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221319-208809-FyQ2XCvYq6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221319-208809@https.bugzilla.kernel.org/>
References: <bug-221319-208809@https.bugzilla.kernel.org/>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36004-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 006A53A0EA1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

https://bugzilla.kernel.org/show_bug.cgi?id=3D221319

--- Comment #5 from Morgwai Kotarbinski (foss@morgwai.pl) ---
@Mario, thanks for your reply! :)

I've had a look at the logs on the next boot, but cannot find anything
relevant. I've attached the dmesg output from the boot after and the systemd
journal from a reboot and the boot after: perhaps you will be able to find =
this
info there.

Otherwise please advise me if I need to add some kernel boot params or
configure some other log gathering or apply some patches to my kernel to
collect some more useful data: to be honest I don't know how to proceed fur=
ther
from here on my own.

Thanks :)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

