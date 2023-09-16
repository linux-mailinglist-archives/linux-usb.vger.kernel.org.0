Return-Path: <linux-usb+bounces-261-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2006E7A332F
	for <lists+linux-usb@lfdr.de>; Sun, 17 Sep 2023 00:07:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5F18281762
	for <lists+linux-usb@lfdr.de>; Sat, 16 Sep 2023 22:07:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98B0D1C2A0;
	Sat, 16 Sep 2023 22:07:43 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7848412B9D
	for <linux-usb@vger.kernel.org>; Sat, 16 Sep 2023 22:07:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D0ACBC433C7
	for <linux-usb@vger.kernel.org>; Sat, 16 Sep 2023 22:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694902062;
	bh=Ciq+tTwpJo7SXtMVp3/qREWfZKnyhV42iH2ZOzFoNHs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=TI6pQ+gNo5bGiDi3dQ4O6jJG93gllNFI00k7KVo6Rs5KnVN+H36NlOvovng6gyNb9
	 h22peUqZ4Q/ABB93suIWaQ7ubj+hS0kw8Pf46xsQTH1AsFo7XiMr/YaAB0wTnU+J9h
	 8xOWZ1iswOE8MPA8GvwueVIoAWX4aAlab6WW5eFkrj3tSUwmw5EL1SuE1A8haeBUAL
	 LAPKZMtT+hlBT8cVruBeAcKnrG8jPPWjknigvKidkXqSeji6Na3eSL2tuCq8QFOSq8
	 qyIL9+i9sX3vZw8WEAV3+it5Qm9pc+JhxffayHIHnq+QScxylq0G387pHD+veuHJW/
	 CAXeMvPr1WhaA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BAAF4C53BCD; Sat, 16 Sep 2023 22:07:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 217915] System fails to resume correctly after Thunderbolt dock
 disconnected while sleeping
Date: Sat, 16 Sep 2023 22:07:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mark.blakeney@bullet-systems.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217915-208809-HQE2ErfPPV@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217915-208809@https.bugzilla.kernel.org/>
References: <bug-217915-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217915

--- Comment #7 from Mark Blakeney (mark.blakeney@bullet-systems.net) ---
Mario, we already know that commit
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=
=3De8b908146d44310473e43b3382eca126e12d279c
caused this issue but Mika says that change (which is merely a timeout incr=
ease
from 1 sec to 60 sec) is valid and has merely exposed this latent problem.

What I don't get is that this bug occurs after the Thunderbolt dock is
disconnected and the system is then resumed so surely it has got to be a
straight out logical error that the kernel sits around for 60 secs waiting =
for
a device that is no longer connected?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

