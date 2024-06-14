Return-Path: <linux-usb+bounces-11315-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 546379082E2
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jun 2024 06:20:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 633F51C216EE
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jun 2024 04:20:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACA2613A411;
	Fri, 14 Jun 2024 04:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L4gKkIQz"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CCD26AD7
	for <linux-usb@vger.kernel.org>; Fri, 14 Jun 2024 04:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718338816; cv=none; b=fp7I1Q5pEM9Bt+cvewO3mh1U3FR/G3GQAMR0YG4WoF90zN3s8Jk2dAX+1m/kJAH9BeI6gIe/GPiCrc+3eKy8HGwvBq/k2+7eUNtQ2pPj5vWGvurD8idaQXfea0OrS/Czg5rZuFEoLwC1KdWTXMQ28Cn0jNR75FJzwI7XTKSmtds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718338816; c=relaxed/simple;
	bh=2XW8rEChzBQDO/7Jadaq4j+uDFrNtFkux7i+j5A6hWQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lRE75NtFSha1l7FoOcHkg0EYP9xw0inuURTKxAPkRa2m/Mjz9rfILbbVPmUr0E4kkNu9DBSmPWmhh7YgzfHNvod/sHPIwO1EjsoWpIdHu33yCSW/SQEK7en0C+AJTkxZvKyjc9YC239uFBZFRYeoVkaPdiBwJkGDN2dN9JLVFHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L4gKkIQz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A2DCFC3277B
	for <linux-usb@vger.kernel.org>; Fri, 14 Jun 2024 04:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718338815;
	bh=2XW8rEChzBQDO/7Jadaq4j+uDFrNtFkux7i+j5A6hWQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=L4gKkIQzwcxBu1TItt/DjtYCJWso9gs2H6eJnzSwHckHuAG0TYwsnaUwOmWPh1IOr
	 nVKzbSDuZ7g5zSHAc99PrlNLK/UOrxSMy3lrzqpZWgh7zKjLLpKxyb/d1Qinfx5mG6
	 Qlq7mlMryBMjeF0Kw158HyprqilaLsAnxrLnmSCfUwW1W/2goE77viw+ePxGACrhmX
	 v6vJTDYldA5EdBFi97yZ7hT5IUNy7wzyz60jRuS3HDxPRZ+KNn+C2ZPglsRL3yYdYT
	 twwWpzgOT/c6N7o0LLo9D30tKvDWa8zdcOYVoVnwmq99O3Jr7xlJP68vtjJcHm96wW
	 I3Mx2MWPR3rBA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 92A17C53B50; Fri, 14 Jun 2024 04:20:15 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218943] No SuperSpeedPlus on AM4/5 Hubs
Date: Fri, 14 Jun 2024 04:20:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: jarrard@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218943-208809-O3alcTDBA2@https.bugzilla.kernel.org/>
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

--- Comment #23 from Jarrard (jarrard@proton.me) ---
Created attachment 306461
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306461&action=3Dedit
USBView (patch)

Here is a image showing what I see in USB View app.

When the HUB is connected it does show as 10Gbps but AsMedia device is still
5Gbps.  HOWEVER here we clearly see the VIA hub is 5Gbps which is confusing=
 to
me.

I don't understand what is going on but this seems like a pretty big proble=
m.
Guessing INTEL CPU/MOBO users don't have this issue.=20

This is with XANMOD kernel with USB Patch applied as suggested.=20

Perhaps there is a modification to the patch that can be done to fix this
specific asmedia device? I do not know much about programming so can't real=
ly
figure it out, its a small miracle I even got the patch applied successfully
(according to logs).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

