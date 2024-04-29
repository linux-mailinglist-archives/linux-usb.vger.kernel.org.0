Return-Path: <linux-usb+bounces-9885-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 439C28B56F4
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 13:41:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2DC11F26133
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 11:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 422924652D;
	Mon, 29 Apr 2024 11:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iWRvRLlb"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C010B4596C
	for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2024 11:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714390872; cv=none; b=a1FPZZI0qIGoXVHiXVF2ahS0SC/OyXCa5qvOsGLEAjn6Y0+CXOJrxCneUdYy5V2Y3rtaXTCvN0l6nbFEsY7UQOXc3lPTsm64yzS06gjTsfNkJneH8ou2UF6Lonri7N0RL3WBo93NtD6ID6T7mS3z91iw5k0wu4XjZY8XKJFWOzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714390872; c=relaxed/simple;
	bh=l5FnzPfC1oCetvVWvSs/9aKxcCnnKbIxC7yeF7eoA0g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DXQfIB63H9onR/n7FiatiB1r0QMQDY0LwcSytzdq5Lxzt0Dfbh87z27GjoqJ03pV7HN3z9HYzva+AUh4jQnJseTOcNydccIWLWDxZS/loSq+qH4g5cOGg8xXmcUq8D9OUKrtZ4VaVIVeNNSfSOFdRRf5eNhHOK+YOf+kxv+gT7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iWRvRLlb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 57B5EC113CD
	for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2024 11:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714390872;
	bh=l5FnzPfC1oCetvVWvSs/9aKxcCnnKbIxC7yeF7eoA0g=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=iWRvRLlbNnoN8p++uSqYMMpQIobGeC93R4Yf+Z1mz2splPbl1KFU0XaJjd/Z9S06X
	 kVVm8WTj3N7uIi8V4TVF1l3E6+ACB8PCOqSHJIgx12HBGxl1vW8e9h+EW3wbkCkQxm
	 uPcKhNQ/Uh7anwCj4IUQfnH01qIlH8/lj0jtWbYUS9EjoLmLIANZf/7iHgZlFZXJ5s
	 w9Cj6Mn/+ua3AxzG5PIFy7uZy2HI255JtWk4XD3M//HvmupB6Sox4NZW55NcYKgFSR
	 HHNxm2157BAoud+Q31ZZXhJU1V9X9OzuVKdZZ+dX2YyXcDZBtzzArhoCmZoMLSEU4f
	 MEGzlPrOMU9/g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3E5C9C16A72; Mon, 29 Apr 2024 11:41:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218789] ucsi_acpi USBC000:00: ucsi_acpi_dsm: failed to evaluate
 _DSM 2 in logs
Date: Mon, 29 Apr 2024 11:41:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: webcapcha@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218789-208809-Ue4UIyZ5Sp@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218789-208809@https.bugzilla.kernel.org/>
References: <bug-218789-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218789

--- Comment #6 from webcaptcha (webcapcha@gmail.com) ---
Created attachment 306240
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306240&action=3Dedit
acpi.dump

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

