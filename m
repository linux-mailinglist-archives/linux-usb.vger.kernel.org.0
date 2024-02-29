Return-Path: <linux-usb+bounces-7284-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0179886BE69
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 02:42:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9591D1F23517
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 01:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D648F2E63C;
	Thu, 29 Feb 2024 01:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZnUCIBgz"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619F92E405
	for <linux-usb@vger.kernel.org>; Thu, 29 Feb 2024 01:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709170948; cv=none; b=ejJfsdDggTPZCvuhQMUHeej2rqKbiDPXw6c1tBSDGwvDZzdPejT9xrhJFyQxQZ0CCtulDcx7FxBIaRzL/bnz3ZAiz/+XdoqoUKPgQ6fy9PdZ2WoKkhzuSLTq9melxOCa78k57gblWIRdKgNpcM5YKF7lrEQWvqabpiCjZrvSK18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709170948; c=relaxed/simple;
	bh=p6pvCSgba4RW42Utaq7UfgOYNafwZcNgg3JRZ9sQKho=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TQ7Q1EvUK/kw6Z2m6SUI6xRhpfou1pPq4NBNOHVX1EOzncYWkSf0qoaGRy4PU2u4K5se+/EFiIrC9ai4BTTQJAoqY+a7gJfhcvtkRRID1LiFb6HxVFIJkdDUyzGvKBAFKfv/naNJV68wmqyvhPt0F6QZVeAAAOYU0e1DKHRf66E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZnUCIBgz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DDA9EC433C7
	for <linux-usb@vger.kernel.org>; Thu, 29 Feb 2024 01:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709170947;
	bh=p6pvCSgba4RW42Utaq7UfgOYNafwZcNgg3JRZ9sQKho=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ZnUCIBgzZMJKRvQRjBT2L2NErRz+tUDegDWA24R6Z6TsGbTbDFUTIeGu9CFK4gS6r
	 s2YZ4T9AyWjzimM5X4QChYrwvvFM1e76R1JtIulE89M+JbMaeOAOi6teyvtmKJ+FD8
	 +CR4PW6bc/xFKr/MlncY3oj2e6w6dN1KtyuF1ljm4itTR+jGuZpFCT/Sq7WWJVsOLl
	 2q7cfSVBKcmVPUB/GxtgZEEMdZCf4hu2T0P2QvFbssxML+YqdzFG7CIRbPRdRnJ06N
	 6xqBIIxqCVEMgh/2g0SN4AhQhvA9Oa/FZjXuhEyN+L6jreXBjOtpkvzBTRqDUCZQaq
	 +dGEl1lL2rLCA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C5ED3C4332E; Thu, 29 Feb 2024 01:42:27 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218526] Unable to achieve 240hz on usb4 docking station
Date: Thu, 29 Feb 2024 01:42:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: samworlds123@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218526-208809-LZf2lk2QVz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218526-208809@https.bugzilla.kernel.org/>
References: <bug-218526-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218526

--- Comment #1 from Samuel (samworlds123@gmail.com) ---
monitor =3D  Alienware aw2521hf

dock =3D Cable Matters 8-in-1 Portable 40Gbps USB4 Hub (USB 4 Dock)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

