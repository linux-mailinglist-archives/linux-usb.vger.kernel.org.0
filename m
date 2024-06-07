Return-Path: <linux-usb+bounces-10995-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2886C8FF867
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jun 2024 02:04:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D4DB1F22DE9
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jun 2024 00:04:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72AB1525D;
	Fri,  7 Jun 2024 00:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="so5yLBPa"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBAF4C76
	for <linux-usb@vger.kernel.org>; Fri,  7 Jun 2024 00:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717718689; cv=none; b=H45wre5pTkeEQB5UnK7WS+WCq4jyNI2WqrO4HkMpjt3f5sQEVPBCiCg1APN03juk1zxMpER+LRXzps54RBilYU0h+E+jVcNRxpEuP/PZQ6H7mrSpgABSdCfBp75ZhDXOVv60pRT0CbLx06KSHeVqGqpwkoLJfi3ZnevRz1A5pME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717718689; c=relaxed/simple;
	bh=mdYbU/5jbceqtu+yFYIkQ7pkVHZt7YlHIS0u+iHSKY4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TSopPVxhY6HbUsr16v1WQACezbvqlpPMP/v4mQJYXwB35pO6LD9cwE/PrLzuuDhGiI8SWaGZuEtZIuCerX/m2LuUwzDYICFHBWqqjSKvSUP+2jXCHW16q0FnoUYmhOPDPK2xohLkh7ci0YyM3FiNCQ7d/5ol80ZAXMdhNYHiSEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=so5yLBPa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 816BEC2BD10
	for <linux-usb@vger.kernel.org>; Fri,  7 Jun 2024 00:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717718688;
	bh=mdYbU/5jbceqtu+yFYIkQ7pkVHZt7YlHIS0u+iHSKY4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=so5yLBPaqifgLsp6fW1UuOQyvTeVtLqFPWLFldZc2fp4JSwRP95kGQI1C05KaaghG
	 FYS28HGHHHiN3CVxIKKWY71aN/MWxEVRceXVpsTU6TmVVtlIyIeWK3I1On0RSeoV47
	 rkyVrOSocAxioK9+E2xU3ghmMsGoKfYMK9BhTqbQQzKRWPtSfWI6dA4PFMSntdiIne
	 KdL8/9cmXktL3Uv+KLp6xxcaPy85J63QyUiHZIkoeXmJdYzoVi5Y28L3BqtAfrd6Kl
	 T7cMRPOrqsmZeBmIDViClqPz2ahWWvoaX9RqznNy0aNxNS+R9jyuKmpvDBKst+uc+O
	 Pf8LOtE+tOjsQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6CBCEC53B50; Fri,  7 Jun 2024 00:04:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218943] No SuperSpeedPlus on AM4/5 Hubs
Date: Fri, 07 Jun 2024 00:04:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jarrard@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218943-208809-P7wjAaoHQ5@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218943-208809@https.bugzilla.kernel.org/>
References: <bug-218943-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218943

--- Comment #1 from Jarrard (jarrard@proton.me) ---
Created attachment 306433
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306433&action=3Dedit
inxi system information

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

