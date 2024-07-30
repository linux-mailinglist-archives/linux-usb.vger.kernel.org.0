Return-Path: <linux-usb+bounces-12648-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D516941F4E
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jul 2024 20:13:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41A961F24C42
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jul 2024 18:13:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E76D918A6C5;
	Tue, 30 Jul 2024 18:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nDnJwIs/"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707201A76CA
	for <linux-usb@vger.kernel.org>; Tue, 30 Jul 2024 18:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722363215; cv=none; b=sSQTGi2mtguPOeakVvOfSs2HTZXCYt7H+RnDOcyf124rXVI6mkIPNfdBXM3nXc0TgPyWWGx7Ozr6YokbEYr0uVi9xHLF7IYPxXSdDtOllWcgZIUEjgNnp6QyTkTvlrzktlY4S6GtpeU5TFJnslElTgwBowGZJ/IXiN8yK3MS6zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722363215; c=relaxed/simple;
	bh=EIt9K6HINIBwY0UDIAPZxmTobdvqT1R/V4VZRozom8I=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Di1QnfRT1LLut77qCcDHCtYRSZbwAqpcn7L02o87qxuCz3ER86CdmoGNf5ogbd/WHFJNgD9Gi1v2mGzW+9hxmIddfuzn1rKOaULUJl/dJu7KNscqK3fcVfCGEoZfsRJQEGdm+amFU7OJh/5zPTpVXKgi/nbtZAVIcrmge5F4xUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nDnJwIs/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 049AFC4AF0A
	for <linux-usb@vger.kernel.org>; Tue, 30 Jul 2024 18:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722363215;
	bh=EIt9K6HINIBwY0UDIAPZxmTobdvqT1R/V4VZRozom8I=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=nDnJwIs/Pgv6QvyTy0l8U0hGiBM1YOS98YTT8fXksg8huhKSFgLIEVc9EdwCw1YmP
	 agqx5OnNVYnQF9pnY9K7tsxjQhqgy9l9DqtXey4v+WLOQYC9Pjc1AjOHQYMgpliZrB
	 /sFOHiTfwtxghp/YopAdR6NjCLY7z8Zsa9qE9XXDFdmdPiR4J6hkjya2WBxaLQnELx
	 RaD8bYwiebmio0OONxMN7tAYcWUxLQPdKWJR8ku5v5yLVEJ7oYYvcb0UCgflCGgDKs
	 wuobXolK6jHjMMOs5yr0DaL4YaWeFKRLA0/tu0Zmt03ootgsyMly0qMLmlOSc2YhVQ
	 nT85/VWIbutHg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id EF779C53B73; Tue, 30 Jul 2024 18:13:34 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219111] Xone:23C mixer not recognized as a 2in/2out device
Date: Tue, 30 Jul 2024 18:13:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: com+bugzilla-kernel@c-henry.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219111-208809-VIxUYEIuD7@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219111-208809@https.bugzilla.kernel.org/>
References: <bug-219111-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219111

--- Comment #1 from CH (com+bugzilla-kernel@c-henry.fr) ---
Created attachment 306639
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306639&action=3Dedit
journalctl -f

journalctl -f produce when the deviced it plugged

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

