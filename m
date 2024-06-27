Return-Path: <linux-usb+bounces-11760-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B917191AB8D
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jun 2024 17:38:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA5171C222BA
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jun 2024 15:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2A9A1990C8;
	Thu, 27 Jun 2024 15:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pg6FyvgW"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5E415216F
	for <linux-usb@vger.kernel.org>; Thu, 27 Jun 2024 15:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719502596; cv=none; b=mV9nNJeowafyoKlkfQ/PmSc2eEBoYOmTFCuq6W+B7WwA5O5d+5Ym8URZhXSh8FaDiKAebkRmm0pMpNkL6ubNl2vzHgkCvHr8Ai/73+UPxEl7xzdbcFKLNFVbZQ60ad2l6atDW7aVWaoR9ogv3B1JCyAan0uAqefjDOEMdSHGt+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719502596; c=relaxed/simple;
	bh=+yZ+Rf1FD3yHiIBICAQYL6dumQf3pdQaZByjx5SuowM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hxEt5N73L34DQVQpecJCte9knnehll7pkWnknjS1UDqfWuh2W7rYu0oD7DKSIS6oBfcCd63+M9bxLWnSX5ad+r6g2EATtSUrYMwUdtYkBszKmgqz284rKM1mMsdsS4rXhDtsNoC2z4NQBOi9VoDD6xURRjbwP7wi49VwDJWMkps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pg6FyvgW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0792C2BBFC
	for <linux-usb@vger.kernel.org>; Thu, 27 Jun 2024 15:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719502595;
	bh=+yZ+Rf1FD3yHiIBICAQYL6dumQf3pdQaZByjx5SuowM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Pg6FyvgWoe4eqzIpKLOK4d1VO1rQu+2lrw0ahuyllqwDagqYbH/hLIHbMUMHj1qa6
	 PkBZFPkU7Qxy961xiV2b2uKzLtjmLk3dwGzvLDbC9EH+4q/haMBpEf1Dfykds4wji/
	 XYVnbs6ToGLY8PFMoctYuy9HiBEqlvP/V0cU6RGDghKKYjhg4oMasv2E4VvqySLrnX
	 EFhedb4OVx23qVN7WGiqFRkKs+Z4isJecDZHnx4GfrkGkQZLFgTI07bNvcX0sHn26G
	 QCaEHphCA4i4/3isdtDqdLOFZi5yqOMwVmwXijF+U/4Ob3S6xENGfFSjd7Kp+vJJi2
	 9zw5pqTfPN6aA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A9BA7C433E5; Thu, 27 Jun 2024 15:36:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218987] USB devices are not detected after Save/Restore error
 on Intel xHC
Date: Thu, 27 Jun 2024 15:36:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: repk@triplefau.lt
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-218987-208809-h2ebANSwYw@https.bugzilla.kernel.org/>
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

Remi Pommarel (repk@triplefau.lt) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #9 from Remi Pommarel (repk@triplefau.lt) ---
Thanks this is resolved for me then.
Still I will take a look at why SRE happen just out of curiosity.(In reply =
to
Mathias Nyman from comment #8)
...
> Thanks, patch with fixed commit message (typo, tags etc) sent.
> https://lore.kernel.org/linux-usb/20240627145523.1453155-2-mathias.
> nyman@linux.intel.com/

Thanks this is resolved for me then.
Still I will take a look at why SRE happen (seem to be related to the prese=
nce
of HDMI) just out of curiosity.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

