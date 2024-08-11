Return-Path: <linux-usb+bounces-13309-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B44494DF7C
	for <lists+linux-usb@lfdr.de>; Sun, 11 Aug 2024 03:52:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EB541F21673
	for <lists+linux-usb@lfdr.de>; Sun, 11 Aug 2024 01:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BBCE79F4;
	Sun, 11 Aug 2024 01:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BtOVGb/l"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F2C79F3
	for <linux-usb@vger.kernel.org>; Sun, 11 Aug 2024 01:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723341122; cv=none; b=eUQzg1tSpTGWdP2ge/u6DlwsjCKI6dIlJ0wQcBGqc0hobS6UMryDO/WiSfZliBEsOzDoRQYzJku3ZlMHNFdhJJsdapiPQDUd0bfAbJArve8dY1jhUU+4heL2FdI6qOdpfRTA29LC+Mvle1Pk8SkX+TpIR+c4jJe1iz5XK6hk2jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723341122; c=relaxed/simple;
	bh=2ZXXfilBcATFd6OJ3XSercNYkOCD1+7ue1BB3V19gHg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Wo/rL1Ed4pgB+L4rYZ5yu8xWbXq4kuIPOn47poN4SWzQlR9te9dt9Wv7lqqgGR+J/H150HRkX3gfmWq+7gRxY9JhiQiQMEg+mEYrtzD9L5NWDxSl94C08YahtbM2qtINIbOsLa8exvRjCWAZgk72nkf+jyHUrYxl4zjy/kz4w28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BtOVGb/l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id AEA71C32781
	for <linux-usb@vger.kernel.org>; Sun, 11 Aug 2024 01:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723341121;
	bh=2ZXXfilBcATFd6OJ3XSercNYkOCD1+7ue1BB3V19gHg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=BtOVGb/lb+/x30iqKlbIhIH+ku8wgMFp8abbO9sT+lPjT4+ul1QZdKCDPMITV9brs
	 N60GgEvWUUyvaIWiE71ChlaZxoWsDTYL1c4q9DtI8meVoLUq8lGb59ry36LIwh+G1/
	 eYm3UUkGXFa4zwARHscglmJYqzqsEU17qgiMYQtuL8Hxq9LZHj80s28gdFKa8SMG+V
	 IIamddkom134of07F4ywi2j1XK88S7tuaHb05YqLm0toG1E0BYHCtQ9qIIo9l00oHw
	 J6ui3q7Fx6z5zhH2u3MRUKNJkGzE0JLXB2Esw/l3Hitwws4COdfRWyRDbDt5ASPoR4
	 ToYucFFD06X4g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 97F7CC53B50; Sun, 11 Aug 2024 01:52:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219111] Xone:23C mixer not recognized as a 2in/2out device
Date: Sun, 11 Aug 2024 01:52:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219111-208809-giZ3I4sBOs@https.bugzilla.kernel.org/>
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

--- Comment #56 from Alan Stern (stern@rowland.harvard.edu) ---
One thing you could try is to submit a help request on the Allen & Heath web
site.  They might be able to provide some useful information.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

