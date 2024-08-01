Return-Path: <linux-usb+bounces-12851-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5645F944B3C
	for <lists+linux-usb@lfdr.de>; Thu,  1 Aug 2024 14:26:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 079E41F22155
	for <lists+linux-usb@lfdr.de>; Thu,  1 Aug 2024 12:26:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEF4419E7E0;
	Thu,  1 Aug 2024 12:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t+XWxGJE"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6542D17084F
	for <linux-usb@vger.kernel.org>; Thu,  1 Aug 2024 12:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722515199; cv=none; b=Iik9uJRN/DhABLQYpq3lrHoXsyYuuf+nvqINXKl6D3EBKiohmFd4dUhz/lt5FDYLuJBieuD78skStUEIxxzbZTMYrhbXKPbqoyUT11jR2gEUW61/5bWLPtssdXcFGPtf3zonOjbDRVtt9zsUpO4fmjQAfDqwz5X1Qhzve1eHVlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722515199; c=relaxed/simple;
	bh=Nc1UwaeBOqlutVsVrtbcssZvle/lXgbv0X2BimTcAoo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nf20O85svACCfiSRmMYSJLIimvoKCYw5dtVR85A+zCN2h4skgr66jCdc1icYSr/d/X8kuiA/bw5mbhCleCAmQS5AhDDKrJW+MFept9xCln29BOcEwW4mFL7j+Sx7/8Bwjhcl75tIHXosNG6w18MOT+Q6mqmqpEoHBn/3ogGN8DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t+XWxGJE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DF314C4AF09
	for <linux-usb@vger.kernel.org>; Thu,  1 Aug 2024 12:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722515198;
	bh=Nc1UwaeBOqlutVsVrtbcssZvle/lXgbv0X2BimTcAoo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=t+XWxGJElHiwNREe2nOPjE+SikAruXar/rvI9y9z0O7lTOCWSELbZVOnghdU6xKLk
	 u7kPMZYM1suQ+0fCkJghYlJaAX21Zc6Wz66/4Tl/6kIGbNrNIHnHhjnPX1nAfxiMsN
	 vmYXvX/jH7FeTn3uU3MMMafhb3+fcXBj/MUDyo8yhyw/FnEeg5uyn/4MhM3ayTGn1v
	 CY+auD6ysnr6xP+3QYhiEwA/uGnB02amWGP4iv/Hu+aznHtMs1jaPr/sLMv2EjRWg1
	 KfZ7/cgNGdAE++sYioAuqjPCNkjsTfQ7U8cOwZu5HQcMKGPjvBX6BLJ8/k8F4cnNTu
	 u2joJXtWsM/cg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D37F5C53B50; Thu,  1 Aug 2024 12:26:37 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219113] I/O-errors freezing the system [sd 0:0:0:0: [sda]
 tag#11 uas_eh_abort_handler 0 uas-tag 1 inflight: CMD OUT]
Date: Thu, 01 Aug 2024 12:26:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mathias.nyman@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219113-208809-47KWKH4zvw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219113-208809@https.bugzilla.kernel.org/>
References: <bug-219113-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219113

--- Comment #8 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
Looks like it was added to 6.1.95 stable
Commit Id for the 6.1 stable backport is 633f72cb6124ecda97b641fbc119340bd8=
8d51

git describe --contains 633f72cb6124ecda97b641fbc119340bd88d51
v6.1.95~123

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

