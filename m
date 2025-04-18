Return-Path: <linux-usb+bounces-23231-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD3EA93C23
	for <lists+linux-usb@lfdr.de>; Fri, 18 Apr 2025 19:38:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF4463AC395
	for <lists+linux-usb@lfdr.de>; Fri, 18 Apr 2025 17:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44568219317;
	Fri, 18 Apr 2025 17:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AgS7qBsr"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07032AE8C
	for <linux-usb@vger.kernel.org>; Fri, 18 Apr 2025 17:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744997907; cv=none; b=H8z0QKXLT/IsAWsnE9g+zneICGWwc6EmFH41O0dMQryeGZl0VqVio5QVIcyTQYXyF1qI3bYFZ2lljXZjJYuxbEkCH9NC6J8rb6FXI4uO9xIWu2hncmK2JfGzrcFVPTDRSCewBKe96LWA2ti4EwlbMGrd1VOY6NNxWRC6W5oTMXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744997907; c=relaxed/simple;
	bh=V8OmtM0v2C/bB3ZHh4bmfz4T9YEngqxvXXgdBahAtuo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=etH8TyCbXxr5QZRDcYdw+ZwFQYzauuMMjaZPNyZur6bZL1mqKd/CsazE7zHP4VO7k1k8VEBd8eRRP+OVeExURyQonpITcGcKHjBCcSrAPhL+icSOLuv7bBV43NchEVuwLyBpDh0UD5aegwmjGiVd5sOxOGoO2aqMkV8QW8nJiUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AgS7qBsr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2A150C4CEEA
	for <linux-usb@vger.kernel.org>; Fri, 18 Apr 2025 17:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744997907;
	bh=V8OmtM0v2C/bB3ZHh4bmfz4T9YEngqxvXXgdBahAtuo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=AgS7qBsrwwB8ZTN0Od8g/XaCrKcdUN7nztTntCqrRhdO00rRdDFJYlJQ4p2mCIWj4
	 Tuk+baqLuGUD4JWG94M+2ahoWk61Z+xGqH3XOfpjY9FklYAV//c/z0U2JP9QV+fxGM
	 5pa2JF/DF6BUEYZtoG4jJNxK0uQ8auhuPhntyL7OqF9xrSvxDCZJgj40SYSYl+zT4h
	 NjNNX24WtkHJ5rOSQl4eOXqUjNrxbVJ+1EYSifJ4cSvaK8LyoJSk9bax1P/4sZkPiQ
	 BPJqt6r2YG83p4GEPv53jy0qsNAVpcr2pT6NS2InAGnqYVRLA51gew+Bh2JenCgQzp
	 iw+GVQw+QXrdw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2265FC53BC7; Fri, 18 Apr 2025 17:38:27 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220016] USB devices plugged into USB hubs on
 6.14.2-300.fc42.x86_64 do not work
Date: Fri, 18 Apr 2025 17:38:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: PCI
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stevenfalco@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220016-208809-lpiHsssjzf@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220016-208809@https.bugzilla.kernel.org/>
References: <bug-220016-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220016

--- Comment #13 from Steven A. Falco (stevenfalco@gmail.com) ---
Created attachment 307987
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307987&action=3Dedit
6.13.10 with realloc=3Doff, good keyboard

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

