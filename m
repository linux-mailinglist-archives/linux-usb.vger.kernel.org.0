Return-Path: <linux-usb+bounces-26560-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1CFB1D0AE
	for <lists+linux-usb@lfdr.de>; Thu,  7 Aug 2025 03:54:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90460582D15
	for <lists+linux-usb@lfdr.de>; Thu,  7 Aug 2025 01:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53A2A1E832E;
	Thu,  7 Aug 2025 01:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T/KdgjRe"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E4514D2B7
	for <linux-usb@vger.kernel.org>; Thu,  7 Aug 2025 01:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754531287; cv=none; b=PR6JYW1Zbhx2sRMElXgkRFHfC7jJZ6+KuoQIAgOivWV0SbHVb3//ij8R4aX0R2TfH8avBTq/kx2u++v/OsLDUaP8qeaN1t5Pr2yLh2XGD3ujgarw/oSOaRGk5bTDtYhhh42CLIQpGpMpRNhh6xT0/FJ3uPYWVNSGeMfUY+eIIeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754531287; c=relaxed/simple;
	bh=MYWpTJnPKEmVq/4X/SFtQhzqMOA6DaHYMZB4SeRVczY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qjlYCXrd8+4aoYYAnfcywWq9I+PvtGQXB5RW5ctb/uSUJzHHVU6KCeKBSDhFxe+makAFdTPeXBkOsn367uRsKSHMtIlpOmJluQMmI0e70omXOvY+nJBl4aURMkl//GVaFCof+E2WKtlRyDLQxAp4+2qm1rpZWBedEBskKVmCFqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T/KdgjRe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5FBDAC4CEE7
	for <linux-usb@vger.kernel.org>; Thu,  7 Aug 2025 01:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754531287;
	bh=MYWpTJnPKEmVq/4X/SFtQhzqMOA6DaHYMZB4SeRVczY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=T/KdgjRexjHR6fdXWybCz0ErrVTTt/lzgVNdhmwqbCjuIh4Iw3Bq3eF9ZKMwNHlAL
	 B5tLu8m0Qsbm3xCMng3ru4MJQg2DFQXxjPVTscuDhHg57jwyZCmeX4vaKkGlKC7SUV
	 zu3WcV4h5gKa6cQUDu6vNEbjwv/e7lSRVYjxDVfYO1rBTIsQVTpnA47o2ROatx//WD
	 icDYiZzjbR1K0WNdTE0L7buA4HDZwcqUYDKYFJHvwYWBqeR6c1kjF1wAvR7/BA++Hg
	 I85RwjLKsITTEjPsVuJPezC4HK1SZ0+yGQqsNQNeejED/zD69KqzxgRxPBxC8N0kJB
	 gwZgXRLBbDaxQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 56A4EC433E1; Thu,  7 Aug 2025 01:48:07 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220422] USB: Misdecoded serial number from Dymo Twin Turbo
 (0922:0018) breaks multi-device support in CUPS
Date: Thu, 07 Aug 2025 01:48:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: steve@groesz.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220422-208809-IGJ3407i0j@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220422-208809@https.bugzilla.kernel.org/>
References: <bug-220422-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220422

--- Comment #1 from steve@groesz.org ---
Created attachment 308462
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308462&action=3Dedit
lsusb data

Complete lsusb result for one of the label printers

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

