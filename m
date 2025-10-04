Return-Path: <linux-usb+bounces-28897-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E1EBB90A0
	for <lists+linux-usb@lfdr.de>; Sat, 04 Oct 2025 19:41:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1F1884E3817
	for <lists+linux-usb@lfdr.de>; Sat,  4 Oct 2025 17:41:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4E8C283FE7;
	Sat,  4 Oct 2025 17:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lX4wvnzV"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7A8272E6D
	for <linux-usb@vger.kernel.org>; Sat,  4 Oct 2025 17:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759599708; cv=none; b=KOSB3KmzknRDUVPXfvarobkRAbf9Vosc2r9SPBsRSuyOWNJhEpYKwCyy17Tfsah6h1i5Iq5kjIBY8QGWrFS36oSeHwxMnj2ZRrU5+uhfMhJEs15aNCH/v1xwJ0rGaiGfTQ4s9BEfXSpWeOLwGx9kT6EgicmzuO1DILClWcGhzrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759599708; c=relaxed/simple;
	bh=anicKLaPZqmQ8uS35fzRX1akWLbmyiTFFyQfSzsyPpE=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=PMJST/P9EVeqghDxQqCtNDd0qZ/BqdBmqL7bqPojdlHZwsy+AOT+V7sO7sOcA2esX/O23QYMR3U2fJx3EnLMLRWmHWLmNFPI3/B1n6zg+W2ynmaIuCgz6Gk7pV8pxQ7DhhBX5tWmW+p/53DdUsv/IFypF4Ri6EEFswF8XzdR96g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lX4wvnzV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9C69BC4CEF1
	for <linux-usb@vger.kernel.org>; Sat,  4 Oct 2025 17:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759599706;
	bh=anicKLaPZqmQ8uS35fzRX1akWLbmyiTFFyQfSzsyPpE=;
	h=From:To:Subject:Date:From;
	b=lX4wvnzVut3R1ZYaejJgvHDGt1A6uf1vN8uAPtZ8Rmjm7WAwKoOYQSqJOr0n7QPcV
	 cnypQbisQPwg2JEltt2ggEMWNxgNLm7uJtoAMxgwCViNJv7/A0HSRY2RO2mMvTTL0X
	 eru7jGM6E5hnlFSWYTV2Q3nsQnHce0GTjVEoAybnoa3z/C2XFA1ZGg5De/kkVmhHYJ
	 13W2AcuzfjwxVs/M1sRLSOh3MxYBgdOlf8IyQA6DzvulAVPX4dGZRp0DcQSfTziOrK
	 gd79Etq8O7umFFHVtEtddjWYvsI/jIFD6n+iC8EY0gEq4oZYd5MoOfqNFrkZFO22DX
	 zWqxuqFM2vIZg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8866EC433E1; Sat,  4 Oct 2025 17:41:46 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220628] New: USB disconnection after mounting file system
Date: Sat, 04 Oct 2025 17:41:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pierretom+12@ik.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-220628-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220628

            Bug ID: 220628
           Summary: USB disconnection after mounting file system
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: pierretom+12@ik.me
        Regression: No

Created attachment 308750
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308750&action=3Dedit
dmesg

Hello,

On a new HD dock station I got USB disconnection intermittently, when filsy=
stem
is mounted only, after this it automatically reconnect. On this device,
I use a C to A adapter to connect to the PC.
I have another hard drive enclosure, that use the same HD, with A to A cable
and
this does not happen.

Kernel 6.16.9
FS ext4

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

