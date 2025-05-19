Return-Path: <linux-usb+bounces-24081-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FBEABB55C
	for <lists+linux-usb@lfdr.de>; Mon, 19 May 2025 08:47:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A06B3A88BA
	for <lists+linux-usb@lfdr.de>; Mon, 19 May 2025 06:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88F75257ACA;
	Mon, 19 May 2025 06:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fOtIrLNe"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E93238FB0
	for <linux-usb@vger.kernel.org>; Mon, 19 May 2025 06:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747637275; cv=none; b=N1lmB7eQXhMUkCd7poMufKL1kV6jpADZR6RI17z60Ouo1DW1/VIGPvQLVtDSyor2iWKKeWh6w8WBqegqJ0kMBkPem8iP9uG2CRHRUf15MdLHtoyaE80zaz1R+4MAMf9VJ+Swesmd+LnIEkV1O6wFaiEzbBA6xqTvVIasPf7bLbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747637275; c=relaxed/simple;
	bh=TqZ6tmPJIkbl2eYkiRUtrL77XoLTIdVPDDaIcquDrNA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ALah6IA37q/TgG9S7YpVp/L2RTV5eSaiY9ZqddcABUJTmEit1zLJLbDyf+N6tARPX84VKAaOZTOJkfnnIcF5/KTURVdvteiyPKlJ3fQ/I1FkrS6GjgpCkZ0rFvII5R8DrKv6NmcV858hoiedXLr6p7At9yS8ctxyX8CBAFaB8gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fOtIrLNe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 919CDC4CEF0
	for <linux-usb@vger.kernel.org>; Mon, 19 May 2025 06:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747637274;
	bh=TqZ6tmPJIkbl2eYkiRUtrL77XoLTIdVPDDaIcquDrNA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=fOtIrLNeSjmjcThhvV6nzglzNnAKqUj9EeXxI3H3TAfg3wvF7PnKgBR4PAO6noeDd
	 zY7wMIvvq/Z0fuAivY2AvuKHFlKNR2TxPlCLK8+JEKCaXhZ55XIK99OGdGY6FAU68u
	 7ZNQO2V4wbZlmBbabINclaEXbqhNbxc+RUHmcTaPHq/af21vsHF5QH+P2/RMHxBUFI
	 uzRo4WgmRCrGMynt++6bYgoneUNMNY6bAMoE4MQGUUMswVIUrXC+vOP0y30/gZCsmR
	 Q6u11S6TSP/zRFur4COkHIw0JK0CKp4lQH4K2v7ooXDwKBIOaFGRRAYwz25TQncdXu
	 NzninyIkBhpNg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 86025C53BBF; Mon, 19 May 2025 06:47:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] [6.13.9] regression USB controller dies
Date: Mon, 19 May 2025 06:47:54 +0000
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
Message-ID: <bug-220069-208809-LrvQ1aLxb1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220069-208809@https.bugzilla.kernel.org/>
References: <bug-220069-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220069

--- Comment #57 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
That didn't work. If you edited grub config /etc, you would apparently need=
 to
do some extra work to transfer the settings to /boot. See below. (That's wh=
y I
don't like and don't use grub2).

https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/9/html/ma=
naging_monitoring_and_updating_the_kernel/configuring-kernel-command-line-p=
arameters_managing-monitoring-and-updating-the-kernel

I would recommend option 4.5 instead, if possible. Select the menu entry and
press 'e' to edit it for one boot.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

