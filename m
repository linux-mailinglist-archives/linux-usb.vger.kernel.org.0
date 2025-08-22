Return-Path: <linux-usb+bounces-27185-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 964FFB3174E
	for <lists+linux-usb@lfdr.de>; Fri, 22 Aug 2025 14:14:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85167175E06
	for <lists+linux-usb@lfdr.de>; Fri, 22 Aug 2025 12:14:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF1722ECD06;
	Fri, 22 Aug 2025 12:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ch2dKVHz"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436022FB618
	for <linux-usb@vger.kernel.org>; Fri, 22 Aug 2025 12:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755864867; cv=none; b=E2kJGfSM/9xgcU/MWyPEVVguHLJTUhqY11T0Gyu1GwZykDowzHKcTVposxgZA1AnNAG+EzgNcrQitsedUR7KJJD9OYBZNbHdhle7rog6448Gm3kSF3P2QYiMhVSlmZpZck8htupPfNxKOOTTqUmXOvIt8BBU4y9ICDlsc3Sx1Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755864867; c=relaxed/simple;
	bh=DZ9yCWjgng2Dvvd4Cn437d1FJhEXo6cpdQqc8Gpe+5A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rCEFj+df10ThvCXPWaIaXZ81hOeVwGtwYoXNGAvGOOzuMfoLDeiE8w9xd9+IGnMUWkzK6z6vEl8z+WU7CkVMok5oQV7cCmaNBQZ/nnno1NdAD+Mon7WjN4nR52UshIDgfD8ilayCoC+tu7drx8+tOhTpc4QH272dym9n1qTNPWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ch2dKVHz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 08382C113D0
	for <linux-usb@vger.kernel.org>; Fri, 22 Aug 2025 12:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755864867;
	bh=DZ9yCWjgng2Dvvd4Cn437d1FJhEXo6cpdQqc8Gpe+5A=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Ch2dKVHza86D0nO6XyabihvPy1kDz1uej+65Hqdc5nGhs5Dye66VN4U7EjQh4elrp
	 Pp6+R7oE1U84sSRJtbyP0xQ77uIqcWUWn1tSkUU8n7Bl8aw8IF3VkmoCS3jdo4LgiX
	 /UZXaOGxKv/OiY4Pah6dVWuec9mCcpg+W4tZ73q0ZAQYxs3GPPr8Prfvz2rabXTrkN
	 MpXZDCQcsARWv3cB3NJbluYyfWkE2npMlKibMjN3f8b15a8UfShaLYmavprYR5O2iL
	 8U23wMYq4m1YALx7t3BS0ExXGIZVxCdfYRG3c7pw9P3LNvlt+QvBsaxR4vDsSK6Lyx
	 /s4zdtDTyT2tg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 00420C41612; Fri, 22 Aug 2025 12:14:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220460] Plugging USB-C adapter into one port results in `Failed
 to set U2 timeout to 0x3f,error code -110`
Date: Fri, 22 Aug 2025 12:14:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pmenzel+bugzilla.kernel.org@molgen.mpg.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220460-208809-O0ZyhPoxE4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220460-208809@https.bugzilla.kernel.org/>
References: <bug-220460-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220460

--- Comment #9 from Paul Menzel (pmenzel+bugzilla.kernel.org@molgen.mpg.de)=
 ---
Created attachment 308536
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308536&action=3Dedit
Linux 6.16.1 messages (`dmesg`) with LMP adapter connected to left USB-C po=
rts
(first with erros, then second without)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

