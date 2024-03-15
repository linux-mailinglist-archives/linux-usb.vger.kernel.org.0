Return-Path: <linux-usb+bounces-7989-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 630CE87CD70
	for <lists+linux-usb@lfdr.de>; Fri, 15 Mar 2024 13:50:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C0171C22322
	for <lists+linux-usb@lfdr.de>; Fri, 15 Mar 2024 12:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90DF528DCF;
	Fri, 15 Mar 2024 12:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O/eNxFyv"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB1A288DB
	for <linux-usb@vger.kernel.org>; Fri, 15 Mar 2024 12:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710507040; cv=none; b=V/kBCy4goCFX+ZeTlz4aSO+eGAJSMJqY3i+tMAFB+3p76WU1Y4vNNrXCSDI8QNFBHfWLa8F59vqTVzTKjhQUk6YAuSZIHDySxPkR/8Tgjs9APKwZ28sc4HkuvhC4fv3VkRa2//z2ZEato09TsW+fhnx3SGrPDy5TYm7f4hMk974=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710507040; c=relaxed/simple;
	bh=770bh/VID85NaoRx5tnYpIfvy1/0RgHLHK+qWftp6Us=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=quxuUVK25JuloXq6oKxCj50o2SJU2rjHbWMjuLXYD7Vavojd+NUlGyimyDEms9GjMqa2Cx0DhMHwqUUi+clgmY5YsRE2n2VJ5OVgvitHmDUaAxc1n5I7KSP/5eBFmC3azjyEoK1YmxSQfqI2w8KRioBXWNRjYMV6JSxpK/lO7Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O/eNxFyv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 97589C433F1
	for <linux-usb@vger.kernel.org>; Fri, 15 Mar 2024 12:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710507039;
	bh=770bh/VID85NaoRx5tnYpIfvy1/0RgHLHK+qWftp6Us=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=O/eNxFyvvxIhUAw28utCEjq1yoPyyMvCsW3oehHwbHhunbaR8E94PvBUx6yqYTHB7
	 7JtlrIcELMVli383W0h//JHWLQqu6zKxmRg8GhaKUFh0a+77IziTweROTJHNiNAA0S
	 3ToAqG1mLuilDFrvaJcQB8mAvzOp1Xn2cg660xuQaUueO9bMYGY2LDuBH+jtwJHMXH
	 mbe/EjM2aqsy0aCsl6j1DjwpzIdLWIDIPBKBcKIIiJaPUuew65H96rqizxQLe5ISWb
	 3yd8QO1HECe0TEm36/nUtiPiHWMM6+GYP0C4QO5XKa7BIKmSmGmwuOaXF7fSTVP1E1
	 QhZMyWrgOCZJQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8F3DDC53BD0; Fri, 15 Mar 2024 12:50:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218544] not enough bandwidth, synaptics hi-res audio duplex
 audio
Date: Fri, 15 Mar 2024 12:50:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ibmalone@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-218544-208809-z0nvy9l7kd@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218544-208809@https.bugzilla.kernel.org/>
References: <bug-218544-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218544

Ian Malone (ibmalone@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

