Return-Path: <linux-usb+bounces-7838-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B4566878953
	for <lists+linux-usb@lfdr.de>; Mon, 11 Mar 2024 21:13:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5B921C21228
	for <lists+linux-usb@lfdr.de>; Mon, 11 Mar 2024 20:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C93DE56770;
	Mon, 11 Mar 2024 20:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hqm5dP90"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D9356745
	for <linux-usb@vger.kernel.org>; Mon, 11 Mar 2024 20:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710188002; cv=none; b=IB5CywE5GqfbCtO1QCi1MxaqUNtDFG2AKNNyLTwqXJIr/p3LKtAiQUb3u36ZaLYzABcZHeoOUpfZ6BujoHcYkHbpvybdm9P0KIgDjuclb7vJ3VVuPa55EHYSOf5rjfDujdzjSPhAiOdwyacPXxiKLuq+yttuHGPdIhpUH9OlgLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710188002; c=relaxed/simple;
	bh=Db69cWmvelZo+TG+/99KIApPaHT0K7ziOb7YBkrSfb8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=p9CoIHEZE+9q7NxmBRvLFkOlyZaVOw5YM5Kpqe3cNquSTL+vheYsd5fVD8b91500tyifLFQpqOxT+2NX2RahczqvOIAY09uNWBRSRsvtyXPJAhmf5KE9HkGcZ9gG91p/0fKK3CRB6imzoefZuSPVsAe5RglpkqDCa5zlbiZ9aGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hqm5dP90; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CFDD2C433C7
	for <linux-usb@vger.kernel.org>; Mon, 11 Mar 2024 20:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710188001;
	bh=Db69cWmvelZo+TG+/99KIApPaHT0K7ziOb7YBkrSfb8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=hqm5dP90568d8mOvEhDvgSL3WIZESsnHdvsHU46uKJ7w3lKXPR+uE04MxujZkvpm3
	 S10NVmjfMyL6UALETzF+jW0CG7khwpi6rd0DWtylPmXdQ2NVupQdUmemG+3Ow5V6OF
	 x4mysgSgbseI5PJo3ymVnN5BAi1wNK0wO8HSjz+QSZInVFrSiYpdOjmErtK2FGP5wW
	 ylqifxxafMHxk0Mlw3WA26mFApQbPPOQ+eS9XNCfIgpNTs9G/2t/Ajdw8Nxv+60UI2
	 7E99ik10m+4nRXFre2NhXZ9ytWsDwrOs6sz60hmvY6oQrdxtgP0D+qKwzdAUdqcQRb
	 mKL6EolT2soVw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B2155C4332E; Mon, 11 Mar 2024 20:13:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218546] xhci_hcd prevents hibernate/S4 suspend from working on
 several systems
Date: Mon, 11 Mar 2024 20:13:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: todd.e.brandt@intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218546-208809-vXWdt9HpUj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218546-208809@https.bugzilla.kernel.org/>
References: <bug-218546-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218546

--- Comment #5 from Todd Brandt (todd.e.brandt@intel.com) ---
Created attachment 305978
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305978&action=3Dedit
otcpl-hp-spectre-tgl_disk_dmesg.txt

dmesg log with dynamic debug enabled for xhci_hcd when the error occured.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

