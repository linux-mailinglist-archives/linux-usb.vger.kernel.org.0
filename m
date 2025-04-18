Return-Path: <linux-usb+bounces-23237-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 240A9A93C8C
	for <lists+linux-usb@lfdr.de>; Fri, 18 Apr 2025 20:06:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBAA319E4AC2
	for <lists+linux-usb@lfdr.de>; Fri, 18 Apr 2025 18:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14BFB2206A9;
	Fri, 18 Apr 2025 18:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vl1IbNxV"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEAA219A91
	for <linux-usb@vger.kernel.org>; Fri, 18 Apr 2025 18:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744999557; cv=none; b=Rn2pQ5t3mgGOZnc+QNGw+5ExtJ7mBqnyryavFG6eZD0HfbgEoOBlVvvUs9q7Y8ABCGqREqzE9d2FpkBdoIQPRvPzNtdeyIXoK9kzN+WFPmIP7oq2bHiDMuc/3Q1YxvJLVVOwWiClN8eQqkQKbu0kHOSouG9JFb+bXpTBtEtU8Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744999557; c=relaxed/simple;
	bh=je1FcqYiA/i2zdN9Kz6wanMT2sQ6ST+UNiQsFZVVerg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OuUmSvx2H6B2JqPJv+2DtD4ooYWBhvYm6VNBC3UpG2dyetxp1uSM6U5nqiG1WTCD7kMuPTPm2fjmP71yYofnxVLyxBWgLi+/jZ4qgop7OJnOM8lbgIO1l9zviihI9Ar+RMPBy1xx0uC+8g1BxNn4CSWqUStFRWrWwGmt2SIPVE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vl1IbNxV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 05E10C4CEEC
	for <linux-usb@vger.kernel.org>; Fri, 18 Apr 2025 18:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744999557;
	bh=je1FcqYiA/i2zdN9Kz6wanMT2sQ6ST+UNiQsFZVVerg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Vl1IbNxV8eI21ZbnJMjWhXdLkfTrVirEjPhzssTYKosBZV6msBihCNTvbGmi0Gb8W
	 Q66D4HZW7k7uOIdGmwrtHWOd5Fotl9DQ1mEmFlY7m27uV+I/tovOj5Kd7W7U+n0uOj
	 Cd8S0UIG1PwaTI4ZUgo8z8hqYgeuEMsXI9iIzLR+WlFNa9kQUI3J0fh5ibXTELxy8d
	 +pqzSK0f5KzU5iNNFHjIQP+8LkMp+rwqD21mqdn4/+lM/GjqRWY4fXcirtTJyrPiQu
	 VQVdEitZAu7QNR6r/4I14gflNGqOZU6egfeZ7vesQ4KQHQFkMbZ+/pGxUmd++3OG7q
	 tSLOjKJIDQTXw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E8444C41612; Fri, 18 Apr 2025 18:05:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220016] USB devices plugged into USB hubs on
 6.14.2-300.fc42.x86_64 do not work
Date: Fri, 18 Apr 2025 18:05:56 +0000
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
Message-ID: <bug-220016-208809-rtyneMfj11@https.bugzilla.kernel.org/>
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

--- Comment #19 from Steven A. Falco (stevenfalco@gmail.com) ---
Created attachment 307991
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307991&action=3Dedit
6.13.10 with realloc=3Doff, good keyboard

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

