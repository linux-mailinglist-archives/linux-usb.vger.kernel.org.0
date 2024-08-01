Return-Path: <linux-usb+bounces-12857-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20021944EAD
	for <lists+linux-usb@lfdr.de>; Thu,  1 Aug 2024 17:02:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 517AF1C22498
	for <lists+linux-usb@lfdr.de>; Thu,  1 Aug 2024 15:02:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54B8313A24E;
	Thu,  1 Aug 2024 15:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KVPMhoP2"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03751370
	for <linux-usb@vger.kernel.org>; Thu,  1 Aug 2024 15:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722524518; cv=none; b=Aw1Ngv98bBhGedSylHLxE2B3czaAVH038AZOy5SBRaP3Rx2HhPBXGwwExc/9qimn96CFpwOPAfpQQ+9qY2JnxqQqoTDcv3iaidKXVqw3g1yZ0pbODMKVEPnRfYV/b4XkoI1AUm0sX50x0BoUj4457+6p5uC3j3966B7CnqJrjvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722524518; c=relaxed/simple;
	bh=RdrdYrRG5iN7GP4SiUivFjDQQOt3PghnbxViyptYe5k=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rmtCtDLHv1c1dmADQqnoOJij3r8hyMi5rJ/T/sOe3gd9dFqoR69Jm4Y7S7EKUOvE4qcpwspRXjqd7KgMV7adA5rXdC45m9e4uaYp5nQfmBW0//CSqUY9fuICfGtX+ZLkycMyIUabc9koXaySmgLudpz3FT+GqQCqNVoqQVt5Ey8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KVPMhoP2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 644BBC4AF0B
	for <linux-usb@vger.kernel.org>; Thu,  1 Aug 2024 15:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722524518;
	bh=RdrdYrRG5iN7GP4SiUivFjDQQOt3PghnbxViyptYe5k=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=KVPMhoP2dnEDBxBrSsTpvhFHWRLlKpwUjiOiCBinwVXC9A4fGOt+qbaIgR+BpO4dX
	 Pgy1XhfxwtLWC4FRT7RosdZNXjH0xb6NFMWUjCuc/L9P/7wGyUQYW97O1vvYc+YomN
	 JB5hINMlaix49tkltHtwCVvD+P7ZdT/FC15ov/BBCyIwiytMHBV113BZ2LwT8hxo1H
	 02cheQ5KRfWxGK9fTovh3i1EyCkaJ3An5W0+B9ZnrJ+T9b3pIWk1Hh6NxLbpRGIuRB
	 Pj+z85snB/i31cQqfpncYVwHIXNSuT2XYBUMkQAjiNNyGRwjiCF/f158m1lb5lPnrG
	 IBSbmPO+SDCZg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4C6FEC53B50; Thu,  1 Aug 2024 15:01:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219111] Xone:23C mixer not recognized as a 2in/2out device
Date: Thu, 01 Aug 2024 15:01:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219111-208809-NIB5g83Jnd@https.bugzilla.kernel.org/>
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

--- Comment #16 from Alan Stern (stern@rowland.harvard.edu) ---
Created attachment 306656
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306656&action=3Dedit
Add debug info for skipping second reset patch

Apply this patch on top of the previous one.  It will print a message to the
kernel log when the new code takes effect.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

