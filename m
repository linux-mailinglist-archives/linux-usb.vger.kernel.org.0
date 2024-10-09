Return-Path: <linux-usb+bounces-15949-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4EA997139
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2024 18:24:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBD33281235
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2024 16:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 486A61F471B;
	Wed,  9 Oct 2024 16:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XQN90upw"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73B61F4711
	for <linux-usb@vger.kernel.org>; Wed,  9 Oct 2024 16:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728490418; cv=none; b=N0Dtf3A6fdCo5gglFv6crMWZ94sTHCwg3YwAy5BP+6eTq+JUp0bauUmg0ZsuIzno3BY7OepJ20fkFSO2A92D94Mj/WQrqPgaZb4QgI/dpHDy+O9Vs+daccC8b1HjYH3TfH6/0444TgyKHAt/x34rRjY0nfPzQ/2vjz3LcwBnk3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728490418; c=relaxed/simple;
	bh=jftMuwZ3Vaw1oKhw2QTQ531M9lLB8fqY3JVk/gO3ZaI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mN89tQB1/8C6/f2NrHDvmmwFV2GmfGsxfx0bWwhPSB/e4EPsXr6Asexy2VdePW3tIIeI7dtW6FpleiMne04wAFWhCQun57nnR7gsFRB5s7aqQjZ9DgAjVQarSsdN3bClj1JkjmkXyZOFYTZ2C6HGT4lULqDlCex++5bS0HTdgHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XQN90upw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 552F3C4CEC3
	for <linux-usb@vger.kernel.org>; Wed,  9 Oct 2024 16:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728490418;
	bh=jftMuwZ3Vaw1oKhw2QTQ531M9lLB8fqY3JVk/gO3ZaI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=XQN90upwmAxWLjRucyQKuj/IGHpZQeW/R5JUuEyRPterNY7TvkZFPSXTQrBzJwvSh
	 VY4b7KinLbLTQkkL8Bzc0pcMt9vrnKYwrJtBAqc7iqho9dGTuqa0+ri83sbuv2vluq
	 fK+JZj5cxYwUBX9YKLzgNGJAQylUfxILp8+VEVUt0ANPC35vImeUlg9/BkGEQsRi0j
	 b2f3VtbhWo5635S1HiTE1KM6vpqtuxtOXSW7LGapKYqE/YVdRKVmXVAy4g8Mnqficf
	 S0BbPO5sWtYhIavYwzHx+3WQ+7diXteNn6xO64RHfjkqPOmUd4BcYrDxzL5ksvrwNV
	 YIc2KUPlt4khg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 44C8AC53BBF; Wed,  9 Oct 2024 16:13:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219362] USB SATA does not correctly shutdown the SSD upon
 poweroff causing data loss
Date: Wed, 09 Oct 2024 16:13:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Power Management
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: harviecz@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: component product
Message-ID: <bug-219362-208809-XD4PsjHoi1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219362-208809@https.bugzilla.kernel.org/>
References: <bug-219362-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219362

Tomas Mudrunka (harviecz@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|SCSI                        |Other
            Product|IO/Storage                  |Power Management

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

