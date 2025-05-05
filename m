Return-Path: <linux-usb+bounces-23703-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FEAAA8F93
	for <lists+linux-usb@lfdr.de>; Mon,  5 May 2025 11:29:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8AC173B98D6
	for <lists+linux-usb@lfdr.de>; Mon,  5 May 2025 09:27:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A2421F91F6;
	Mon,  5 May 2025 09:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HsWNyizA"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3621F470E
	for <linux-usb@vger.kernel.org>; Mon,  5 May 2025 09:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746437268; cv=none; b=JPtXWEAeSKOKhV7gGqZ04My9hdD0DOmV2PjovSAVclNdkx1gSfn3yvvv84BCQWBjJLAZ+catauU/GUHSdfFDtfxN8J6Ii5emIprzcWwavKUPWoWWAVVFV4rA5HreUtQyWbLWh8ZeQ8EPFPs2LQkYCl2n+pt+gKKgjrgliKR6gXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746437268; c=relaxed/simple;
	bh=av5mA7cAO7GQDVLnZHtztOZpxxg6yWF628BP9ePfRqE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZpG+EnvN2HN9XTWtzs9NX0TZveNsQje0se7GQ/b8ffFL+sO6lCqV1z5w+M7IS95Ro4CC+f02aLSOp9EKfxuPYKu5MWQuLrwsRSzECcsSgC+gItFAGY9rKn0vWSkeqNjzDf+yXG1+I0nTKEbr2CjtvOKjebSJu7ktbfwzPqdWx+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HsWNyizA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 01026C4CEE9
	for <linux-usb@vger.kernel.org>; Mon,  5 May 2025 09:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746437268;
	bh=av5mA7cAO7GQDVLnZHtztOZpxxg6yWF628BP9ePfRqE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=HsWNyizAT5OTCdUlnThmD4PnGnyCHHiLuryBfwsZdEJiGEYg1za5S0T0o4Zgirjq4
	 2CAgrzzhDm6sdVzVzZj+180dQ6HJxXYhKDGu+nSSWxT3KKdc0GdBNaaOse3kaffTKX
	 X4hejrMCfWzCvsWjMuWM9SAo9AI/02Q3t0x68WYjdoVzblEyQ4ePxVAKBYbW1r2D7z
	 VqXW6QtVHPcuCU+QTITDKXzamDUm4n2/4+5Js/taYrFLMPTbh5lL/vAJOal7p08D2S
	 8Hcw4JVyD/0xnt667wVxDRrjL6pkY1DQsIJ1isNEPemKv2eXFJwzu4EEJ0kXvW7c3t
	 sur/RCAv0abKQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E66E9C41614; Mon,  5 May 2025 09:27:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220052] The usb/cdc-acm driver uses memory after it is freed
Date: Mon, 05 May 2025 09:27:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: oneukum@suse.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220052-208809-TFKoSgx98J@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220052-208809@https.bugzilla.kernel.org/>
References: <bug-220052-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220052

--- Comment #4 from oneukum@suse.com ---
On 30.04.25 14:56, bugzilla-daemon@kernel.org wrote:

> Exchanging the 2 lines as indicated in the patch solves the problem
> completely
> and the kernel panic is not seen anymore. This is proved by 7000 'virtual'
> disconnects.
>=20

Yes, it solves your particular problem.

Now, with your patch, you first call
acm_submit_read_urbs() -> acm_submit_read_urb():

res =3D usb_submit_urb(acm->read_urbs[index], mem_flags);

And then you do

+                       for (i =3D 0; i < acm->rx_buflimit; i++)
+                               usb_kill_urb(acm->read_urbs[i]);

In other words, you undo what you just did.

Your diagnosis of the issue may be good, but the fix is _not_.
The purpose of acm_softint() is to

1. kill outstanding IO
2. error handling with usb_clear_halt()
3. restart the outstanding IO

You cannot reverse steps 1 and 3 and expect that to work.
The issue must be one of refcounting.

        Sorry
                Oliver

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

