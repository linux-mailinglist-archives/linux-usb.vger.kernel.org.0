Return-Path: <linux-usb+bounces-135-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 071BC7A1C47
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 12:32:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0A9C28236A
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 10:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC1D1DF6D;
	Fri, 15 Sep 2023 10:32:04 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D48101C0
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 10:32:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DCDF5C43391
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 10:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694773922;
	bh=WPB6MZ9vc8JKdN43sU6/tXvDKpxFB0mP1/NHS8HTH/k=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=sEyzo+4LLitzdzyyywaa6cQM0olJlSTzKa+qbx1yKcZdeDrhTM2UXx3dsCmxrsjfU
	 lQ5cM2FW6n67z3hSpYAsTIIPlG61Bkvhlt8/Ubb6+e/gBnCBHSgOeUoNe7uxzol5O5
	 wUbr7NoT3tzKfHVEflMlHgbi3+iaftjUQ3Nq4Bn9W4zYUZcBUhBya7u+vZPlpS/Wjv
	 D1ogh3CnZFJmsDJ9hVrLm445KH8oMZYhEIIWOUXeTMby3YALtQCLHHsOesATZ1Fn5A
	 RxkzyU2pi1Pu71yOzzLR1up84bLw6+dxqEQeavLprLKkMwifWefNzMOuxBBhRP9SnW
	 oeUSZNbgqEr8A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CCE7EC53BCD; Fri, 15 Sep 2023 10:32:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 216728] Thunderbolt USB Controller died after resume on Intel
 CometLake platform
Date: Fri, 15 Sep 2023 10:32:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mika.westerberg@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216728-208809-M1AmVFmg2P@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216728-208809@https.bugzilla.kernel.org/>
References: <bug-216728-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216728

--- Comment #43 from Mika Westerberg (mika.westerberg@linux.intel.com) ---
Also I suggest to create a new bug and link it from here because this is not
the same issue originally reported in this bugzilla.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

