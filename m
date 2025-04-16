Return-Path: <linux-usb+bounces-23159-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A97A90A58
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 19:43:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0657C17BA7A
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 17:43:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2038821771A;
	Wed, 16 Apr 2025 17:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HTyQbJkS"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6681DDC3E
	for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 17:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744825424; cv=none; b=rz/ZG4zPrgaAPIXw3BgDQXz2kmLalFB1ldudYgxMF1CzM2N5ZBw2t9HxjOs7L9GDjllHDorNLzNWbKOEZvV7KwWgGRJFIkIFYOHW5miSA0T9BSr/5UHJwq7TAY43hpfV9v02kRpkVtuz6KZ01MZtxaHjnOVixAT+3khHLPFD7h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744825424; c=relaxed/simple;
	bh=qyeqfjzuf0KiJojHx0f+mFwT58r4sSgptF1Pcm29KsM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=r14JAwJF5wVtMP37iM1AlYQUUdMvs0tGUVuaIsRLOvwr8Vvy//MLKZIh6PbX3fWq92u6hAbfrA1xerE33sdMus8YUNij1xOr1Xlx1Bzsl7dyzUN2sx2r4iXBvevUc+Yaj2lx5yn/xFQK2GrTfUgIlCwwqQgYm+vxnve+JOsNwDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HTyQbJkS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 17B3DC4CEEC
	for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 17:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744825423;
	bh=qyeqfjzuf0KiJojHx0f+mFwT58r4sSgptF1Pcm29KsM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=HTyQbJkSBFQ5uvXaH4Val69HJpp7CuQjUToMh6H7chnhQ/JlMNRI0B2WFEAi1MjX9
	 TQSRyt7uYpPMQ7B+gH5JCYguPXJVXDc67EipGClp/bHlyenOsD1iEVr4iAWjx0dCuD
	 2VsVSRmC2A7Bpz/qx8iqiNOrcSHl6kwMhZCAjOF2WM2EiNUvCadjohxxYzqUIpeYaH
	 9KjEXkBmT63+fDQ9wgUQQDGK5DLjvkhyTOhjm2SaWw/Umml/oA4yAC0Zx0FAv6PimN
	 dqSBiJxIjje9chWUrCHPNEeJy3ul8bf8F/JtJ5z3XekMCfYAWWYLF6St7z26WJolYO
	 9w4+Unmfvn6LQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0A173C53BC5; Wed, 16 Apr 2025 17:43:43 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220016] USB devices plugged into USB hubs on
 6.14.2-300.fc42.x86_64 do not work
Date: Wed, 16 Apr 2025 17:43:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: PCI
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stevenfalco@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220016-208809-zsc23WfLPV@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220016-208809@https.bugzilla.kernel.org/>
References: <bug-220016-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220016

--- Comment #6 from Steven A. Falco (stevenfalco@gmail.com) ---
Created attachment 307976
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307976&action=3Dedit
Bad boot with 6.14 kernel

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

