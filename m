Return-Path: <linux-usb+bounces-17979-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC129DF741
	for <lists+linux-usb@lfdr.de>; Sun,  1 Dec 2024 23:07:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14217162A74
	for <lists+linux-usb@lfdr.de>; Sun,  1 Dec 2024 22:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B8CC1D8DF9;
	Sun,  1 Dec 2024 22:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e2eOT0H3"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6C71863E
	for <linux-usb@vger.kernel.org>; Sun,  1 Dec 2024 22:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733090865; cv=none; b=rij4h+gkBP+aAkCOkooKGk1AQiVaAPH7fi62g7WagplKyhMwVoK9AxFCDQ8z5serOHn1Uun4IthuEEH2mPYKx/tqLqKa1XJnCSE9dP/8kixGue2bjs6OJO/GIQoXiSKXM6MAu1qwvHpUQrKJt8Yxh62eyi0MjRVagJdC3c8EgOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733090865; c=relaxed/simple;
	bh=6it4YY0+UsdpwaM1H4JmyiOEeDC2nLF5ry8Vh6k9aIg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KMG+zRCpzcLMr5YEdgd3BEdIVPYaV0XjIQDAAvZilyNV8nNY4ha5mD2Qbk5JMlZooUKtOCE8hxxrpCVmqBO9P91I9fJsDUmoKFq3cJqJ289gF+hyclbBXnoocjtHrfaIWdeUEo3wjsKqZmOpVezOExmudM7KhIgM2eeeRbtnv2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e2eOT0H3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 47DB4C4CECF
	for <linux-usb@vger.kernel.org>; Sun,  1 Dec 2024 22:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733090865;
	bh=6it4YY0+UsdpwaM1H4JmyiOEeDC2nLF5ry8Vh6k9aIg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=e2eOT0H3cfRNWSxuloNxZXZgyVhgaZ2SPIQm8jWrI57ZsnnuCnOCaK0um6kffPLOp
	 T3vNv9ygF4YTOBw1K+22pQWuI6x1VAliQ1DpbViyevM1sDc3TuZTEZJ6GCwM4w6hXw
	 CvCtW+59FB+7lHtCuVq1DCqFV0qPE6c16c45MGjNrCqtDhGoPgWfG7zYc/QitOGq8M
	 Nr/VpOxBE0eoLEs+3oOu2zXWgE+p4xgnpjN0+CbP8qJpGNrjgTEm6/ShWeSZdvoYzR
	 xBrAkS+RFVoN1o6zRadWI2tWTo7CoPDpw6RM4anT67wk8a4Qlnw0qJtRb4JOwiG3ij
	 mZ7YLsNFJn1jw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 40B16C53BBF; Sun,  1 Dec 2024 22:07:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219532] Crash in RIP: 0010:xhci_handle_stopped_cmd_ring
Date: Sun, 01 Dec 2024 22:07:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219532-208809-mw1vAK81XS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219532-208809@https.bugzilla.kernel.org/>
References: <bug-219532-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219532

--- Comment #8 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
Created attachment 307305
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307305&action=3Dedit
try to fix the bug and gather confirmation

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

