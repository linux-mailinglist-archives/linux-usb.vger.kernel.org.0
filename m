Return-Path: <linux-usb+bounces-30077-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAF8C34B39
	for <lists+linux-usb@lfdr.de>; Wed, 05 Nov 2025 10:11:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC9EC188E6A9
	for <lists+linux-usb@lfdr.de>; Wed,  5 Nov 2025 09:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A29542EDD51;
	Wed,  5 Nov 2025 09:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EegTR+ed"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27CA7296BA9
	for <linux-usb@vger.kernel.org>; Wed,  5 Nov 2025 09:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762333612; cv=none; b=aw7lRbQ9Hd0BdHQMoFjf3ar9AcOJg5nXDolt+KJ8vgeVfVRWw2RRJEPgFm7/2rnAxlBxW1JPw5y78fZZ1sk+E8mSX5vQ+3ELeAqpPyNHY/Kq/O+oXfxmMGGvFGeNaSbmvh3uUHI+3VXlkaEY0tQzqJouslGrtIhFk7gAI7csPuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762333612; c=relaxed/simple;
	bh=d0zXdAlo5XTvGeTA2SDEUJVktnj2M4KRwho6e2EBLkc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=k/5zL7Thqd0+gRKiRwuib9DYOmprulE32wkj6JLTqoIKrnUWXT5t9CPDWW03mZ4+cpfAWExig1LBEVoYxlaH6TkYshKOfxPaQ0K7AbRAZm2IdrHJAHAAOfoNdKkJoj/IYaqGVD9pTNBA6qKX2u2YNdEZ0NKMTKDcBRpvaJlX2m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EegTR+ed; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A0152C16AAE
	for <linux-usb@vger.kernel.org>; Wed,  5 Nov 2025 09:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762333611;
	bh=d0zXdAlo5XTvGeTA2SDEUJVktnj2M4KRwho6e2EBLkc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=EegTR+edtlYXyJAgbK0ntuZrLfh3iH2CBP8Wb6sIYbo66xBw1PTR4VAyVtGTepVAb
	 Us4stS+Ng3CK2q6SKekQ2V/CqGn3ed4Amz4Zwcl46NZBAfQOFVIZzSTlAkdgq5e0C5
	 MYsU2pRtt3CKNDl9xj0xxwCHw4KY5G8T181p2KNSeFi/yNhyi/btwti2IAOB9xyYqW
	 uvt5wZ4xJqBS8ptQcLiXUsagtn4eX1teuyACHNFXIiNDUpM/lBo9jf+3GGmmH3gUrd
	 2NGpBxxG9f+e1qKrZsGpbn1Qy8XzzQebI5UGPo+nvock/dew8kZQR0QPYwl1++RSAF
	 qjAskGbBtpZZg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 98B85C3279F; Wed,  5 Nov 2025 09:06:51 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220748] usb: xhci_queue_isoc_tx_prepare ignore start_frame and
 always assumes URB_ISO_ASAP is set
Date: Wed, 05 Nov 2025 09:06:51 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220748-208809-BxOQWg9R3r@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220748-208809@https.bugzilla.kernel.org/>
References: <bug-220748-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220748

--- Comment #4 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
As for debugging, you can obviously print anything to dmesg with
printk()/pr_info()/xhci_info(). But this may generate quite a noise on isoc
endpoints if you print in every interval.

If you mount debugfs and go to

/sys/kernel/debug/usb/xhci/<controller-pci-address>/devices/<device-slot-id=
>/

you will find epXX directories and trbs file in each. The file contains a
human-readable dump of the transfer ring written by the driver for given
endpoint, so you can inspect if the TRBs make sense. This only works while =
the
endpoint is enabled, i.e. if you stop streaming and driver switches to an e=
mpty
altsetting zero, the endpoint will disappear from debugfs.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

