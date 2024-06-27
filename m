Return-Path: <linux-usb+bounces-11733-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DF291A743
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jun 2024 15:04:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 327DC284006
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jun 2024 13:04:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AAC116DC31;
	Thu, 27 Jun 2024 13:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S2aA5mxG"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EDF145A1F
	for <linux-usb@vger.kernel.org>; Thu, 27 Jun 2024 13:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719493444; cv=none; b=ED3YsTxNOkuQO777zVvpvzHmdC04IXmRBEauOtwviu75d+WLnzH1DVOmo2qZBG9hnVHNs5ZVmJZ/ov5zV8b55UvElhmpu5Dj+qiGjSSz63Rz8LBDogYhJLmoZN4iNhRJ6l6EIN7AL3Q2qkziew/xodYK5AB2n3A2z22zQVlo8N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719493444; c=relaxed/simple;
	bh=Sd/fbkpWhUsVAgnhEAK5YkhCRtW2zEKEwF9ZyfZXlD8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VoRxkF+OFTW1CEKJtpwIILtUrKavNj76S7HHSSAfWa8kv/0haGDXRRl2wRN6NNp/2KSnUga63uoTiBI7FtizLi3lUekZ08c4sY6vjDAjWTUsHHeVIG1SyaDb04Un0Ws/49vaEdp0HlEyJqaDgWiLgcqXp7nu2YHZ2uoj8nKC344=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S2aA5mxG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 32AC8C2BBFC
	for <linux-usb@vger.kernel.org>; Thu, 27 Jun 2024 13:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719493444;
	bh=Sd/fbkpWhUsVAgnhEAK5YkhCRtW2zEKEwF9ZyfZXlD8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=S2aA5mxGAmDLvoC61us1WPzNprD2nyf++duuZP4CBdx9KqkVypT043Hn9RLf4RmPk
	 0ivLztXr+Pgz4Vuk2qz21MillMIcs06t920/NgDLCXKUr5zs+7Jz22ft6dikIQLdk9
	 NbyiQfTfC+obD7ois5AECrPoA4DezPH6rbFopLzx5UMSipx4aUZ3ip0/FXysfsTER6
	 /iCW9rQ1gySye81ATVm0UpCjbSw2XwPk/BCAsgFy98AA8x+1k6TupS3OOMP8fn3zGM
	 gMRH49zQiGCSKoctwdy9eLdGFrW3drcNGztJfpF0ciYI88BxR0K6Jre07aLb6oTFW1
	 jd3OdUOT/RuaQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1D568C433E5; Thu, 27 Jun 2024 13:04:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218987] USB devices are not detected after Save/Restore error
 on Intel xHC
Date: Thu, 27 Jun 2024 13:04:03 +0000
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
Message-ID: <bug-218987-208809-6JYyDlQWom@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218987-208809@https.bugzilla.kernel.org/>
References: <bug-218987-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218987

--- Comment #5 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
> >=20
> > Does the oneliner below work for you?
>=20
> Yes it works. While I did initially try that, I switched to
> pending_portevent patch version to avoid unneeded xhci_pending_portevent()
> and msleep(120) calls. But both are very fine with me.

Good point, I'll attach a second version that skips the 120ms sleep.
After that patch it will also be easier to refactor reinit_xhc and=20
!reinit_xhc into separate functions

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

