Return-Path: <linux-usb+bounces-27830-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BC0B507A3
	for <lists+linux-usb@lfdr.de>; Tue,  9 Sep 2025 23:05:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96C273A418C
	for <lists+linux-usb@lfdr.de>; Tue,  9 Sep 2025 21:05:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC13E244698;
	Tue,  9 Sep 2025 21:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nsfo/u7l"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0B4242D7D
	for <linux-usb@vger.kernel.org>; Tue,  9 Sep 2025 21:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757451906; cv=none; b=sZyRIWAZ3BNTmg7+aJIFXvTy1cwzX3qkd7u071SZPg9P4ELVm5SyLYhO8aEGuaUH6J3jAdUyS1rtyiHJ9ginYRX7sNZ5sFdjqCSfCFPknNX5G3IwoQoovl5X1yv957EIbbf0Uwo2U6OX72P4+TlOSf6gOv3B3m2nyQ2tm39DZL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757451906; c=relaxed/simple;
	bh=6p1aZtfbBioOs/0YgV5x9pHyIeQ2ZDn82yCzc4X3CJY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KtuMPW1wWtuUtO7U5xM5NETHPXhOm7qTR3CfnoZ2vv02CSiLnteLx0DT8Fc4N0FTZ9Ehs9yiS8h8xwkZmyoXmr+WPov7lOmX4C6tw6/C0bKQ9pr3vxr9/fFRR63bz7sCWfgjdqdYBxkzLy16T4Gl3/tP1dguvcO0qlXNHw2y+xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nsfo/u7l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D655BC4CEF8
	for <linux-usb@vger.kernel.org>; Tue,  9 Sep 2025 21:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757451905;
	bh=6p1aZtfbBioOs/0YgV5x9pHyIeQ2ZDn82yCzc4X3CJY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Nsfo/u7ljYJkkv42MtEU6bbJAm6sbJs4fi4aizkpMEXltKTBg3WDUzB9BhEdE+t2e
	 HejQrG5UntPPdU9Gf8D1WtJbA50OmQNPhe+xNpu0RTX8xscLQlccfulkzXktNhvzgq
	 2dGatQWDHP4Z8g1VRGDd4KuEWuuL31pxmn9DTPEDx5KE5Avbh2JXhntL09k3yjHYlK
	 3ATCfBh5HUR1qpC7Fm2kiqjh+TXcU6qiOvtHMuKhovYR+GiUjsj69eEMBWOXaeOQTj
	 vy0ewNFMkqAnwEHgxcRlKEHmRKM8T9qNWFTcztr8yPvvOkqnJgiQuuikeQvLdKml07
	 lyDxSCOK6tFOg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C6E4BC41612; Tue,  9 Sep 2025 21:05:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220491] usb_storage connected SD card disconnects/reconnects on
 resume from suspend
Date: Tue, 09 Sep 2025 21:05:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: paula@alumni.cse.ucsc.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220491-208809-vCtOVPl9Nx@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220491-208809@https.bugzilla.kernel.org/>
References: <bug-220491-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220491

--- Comment #52 from Paul Ausbeck (paula@alumni.cse.ucsc.edu) ---
Created attachment 308645
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308645&action=3Dedit
kdb triggered disconnect usbmon trace

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

