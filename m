Return-Path: <linux-usb+bounces-33503-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OInOEPImmGlqBwMAu9opvQ
	(envelope-from <linux-usb+bounces-33503-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 10:18:42 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CDF166176
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 10:18:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BFCD23038F51
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 09:17:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E110313E1B;
	Fri, 20 Feb 2026 09:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="taKaamYN"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282E331AF3F
	for <linux-usb@vger.kernel.org>; Fri, 20 Feb 2026 09:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771579062; cv=none; b=UNaLmmqQ5wNNdU0fDibP0fYEglq/922paJRdMneGvsR2gWPzlDklmx9qtE1dIKwzFsp17XxNdlOLorOCWYoqAb9bNtn9K81eZrE+pBOK9UXAG6PG+VHqJvMw+i/XO1cir4OjWj3Fal/r7A3NIEzWm/Bp5DlL6Vtu469xEDlXYws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771579062; c=relaxed/simple;
	bh=fFSqCZAezXM3q12H3NqBLDfTjLx/7lyPf1Iw3fwtHVw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RSbGq5a/voW5tj/PB04ofZvbzKzgxrRN4oPedahu2q6E7SDrrWroX7SVpO4E1IHuRaowaT1k1CNeP1pKaUi77wTOES3c30S7dEoAstw/JyFuyTmmH8VXXn5PA7qBsiuN6pp8T8KFgCJyq0A53Fu8D49qtCoBU2Aa4OaPeZDwnJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=taKaamYN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B4EAEC19424
	for <linux-usb@vger.kernel.org>; Fri, 20 Feb 2026 09:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771579061;
	bh=fFSqCZAezXM3q12H3NqBLDfTjLx/7lyPf1Iw3fwtHVw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=taKaamYNO7hSPeuwJmzWS/JwowzK8jP0a6V354DK7GVaSJChUNaCZ/a5Nm8huIZ16
	 8oLl6qJ+1rRGFJjOEPVPXAhZDy84zJMAX3a91TXcKIe3ofxvPzzdUYD7m06oymXFta
	 p9ZgJY1smzTB5djLy7n5eulwkt1iTkTsOMZU8cphROEN/SISl45fw7yplY9bAKRVQv
	 HG1y1TjVl9wJD3bf+JU/vJMjcpFPV+mErLSF/lQcxfin9GHAimoaAv+hp9w41Fpwvw
	 5xgn6oHu4kqmAzFZ8QXiSIeT7g4txefFgP4+dPktdKd350Dlq8dHa1mPU36n2C+Y8l
	 YtrU55Dtn4ypg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id ACDE8C433E1; Fri, 20 Feb 2026 09:17:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221103] xhci_hcd: System lockup under CPU load during usbfs
 polling of USB devices on AMD platforms
Date: Fri, 20 Feb 2026 09:17:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: greg@kroah.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221103-208809-dhuenUG3eV@https.bugzilla.kernel.org/>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33503-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-0.998];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kroah.com:email,unnservice.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B3CDF166176
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221103

--- Comment #4 from Greg Kroah-Hartman (greg@kroah.com) ---
On Fri, Feb 20, 2026 at 08:31:37AM +0000, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D221103
>=20
> --- Comment #2 from Paul Alesius (paul@unnservice.com) ---
> Try this command: sudo ./usb_poll
>=20
> It is definitely in USB.
> This program triggers the system freeze reliably.
> Many of us are affected, as referenced in the ADB bug.

Works just fine for me here, perhaps this is a bug in your USB device
(or hub) that can not handle USB config requests?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

