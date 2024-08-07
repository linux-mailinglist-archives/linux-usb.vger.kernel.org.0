Return-Path: <linux-usb+bounces-13190-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E75F94A7AC
	for <lists+linux-usb@lfdr.de>; Wed,  7 Aug 2024 14:28:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E0CD9B220A1
	for <lists+linux-usb@lfdr.de>; Wed,  7 Aug 2024 12:28:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 940DF1E4F19;
	Wed,  7 Aug 2024 12:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mgof+KZ4"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9E11C9DD6
	for <linux-usb@vger.kernel.org>; Wed,  7 Aug 2024 12:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723033681; cv=none; b=dDi3NYqTjfKdApDv9/ZMjd5TxVjX4mpuSG5CZvz3K97RcOEeB4inWz4xzeM3Yf4VAUqXIfVGJ9kmvKmDbi77qtRGjW6YDAkOVfQaWcnn70AxlDsEKvsURp6jfecTrRDS8FWS7sCgMs755XHz3LipudmXKFE1N+Pc/zA2qVMQd2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723033681; c=relaxed/simple;
	bh=2c86oVu0v5/T41rbnSlSKPtc+eDbHpCSaUeDb82MM9Q=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=e9K8kg/+Bjd7SGlbDxR6XjoHxv2H3HT2qaC6ZMYwDYUuxbmBBDF0eSTi65QOb68rYTbwR9JhqFdov1HLczMqcFISettKmmnmePRCNCECC8prOHBryZbBVpkrNDsubjB5PBPfY53aZ2ejtltkQ9JBsQ5fvhT0pjIKx8xiogY4CXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mgof+KZ4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E57E8C32782
	for <linux-usb@vger.kernel.org>; Wed,  7 Aug 2024 12:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723033680;
	bh=2c86oVu0v5/T41rbnSlSKPtc+eDbHpCSaUeDb82MM9Q=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Mgof+KZ4S+FmmYRFx3bgwVm/eQ3bsp7vCRbQZ+ve1VxlPBSPVgKSoUSidpDPN2JBR
	 8tmQybFDQyXTESwARP5AWs7d5ul0elkjXTIqbxQP6UdMPADSAFBDnYTNMzsQIRuPds
	 zNIB3EoXud8H+M6V2Tatx0JOBjh6pU1G6aOQ0bT5mvilt2FXgvI1qGuIAOn9ImvpKa
	 +dGlyn9AU1ZEKvKl5USHDSYrxZOoLxqX5RHkpo30sw9a8T8jIZmhr+RvS/GzhKdmqn
	 8B1piLkyxb8B12xKN8Ao4tZvwgNQP2Xyy+An5K2uSSIkuboq3un5pZ7Uac/qDMbxPH
	 yr34AEnbTEGqw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CC84BC53B73; Wed,  7 Aug 2024 12:28:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219111] Xone:23C mixer not recognized as a 2in/2out device
Date: Wed, 07 Aug 2024 12:28:00 +0000
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
Message-ID: <bug-219111-208809-ZPcpgaVeUe@https.bugzilla.kernel.org/>
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

--- Comment #32 from CH (com+bugzilla-kernel@c-henry.fr) ---
Created attachment 306682
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306682&action=3Dedit
Xone 23C Wireshark capture with audio passing through USB

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

