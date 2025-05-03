Return-Path: <linux-usb+bounces-23670-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C01E7AA81EC
	for <lists+linux-usb@lfdr.de>; Sat,  3 May 2025 20:25:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2242189BE54
	for <lists+linux-usb@lfdr.de>; Sat,  3 May 2025 18:25:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E48927A456;
	Sat,  3 May 2025 18:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="beQVhjLC"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF98E199230
	for <linux-usb@vger.kernel.org>; Sat,  3 May 2025 18:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746296740; cv=none; b=Kyom3o2qw7+NriNyTrnJ/CZwgpWcGanUx1EqzA6F6I6RsLmlLe7cNG78yoQX+IdEwA466mMl61O3Q06kistuWqAPX0g+Qv/PppOLFjpN7CdMyP6xrrANjSGkS6EuNB18KGvjMSkWnWeQe89Hj7TgkaMWfZUL7FbIxAWY7Sun2gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746296740; c=relaxed/simple;
	bh=ErF7a3hgvEr4Zghn4N/xJ02w4EU9PEcQMJix+2dVJcA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RZ3lUG2SkBdySJSTP9o2qgM2N+wbjpmVsZj2ReLdRAhRm7T6s14JFO0HCmRB1HxC6+R6ZlSFizThGycw/YxYFjmLED5Ee+mQeEX8KdDQOrxw59XqpPjsNBGz6m2+p6Yl7baW45A8iNu0ytI7Y+9/utU1L2AYnJ2tFA1AiEB9Oi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=beQVhjLC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 67E0AC4CEE9
	for <linux-usb@vger.kernel.org>; Sat,  3 May 2025 18:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746296739;
	bh=ErF7a3hgvEr4Zghn4N/xJ02w4EU9PEcQMJix+2dVJcA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=beQVhjLCqZ2xgiwojup2q0+dvcPH+jTyroRtMoKMdmNLO4gMJoeF6jnOZK8SeWIm3
	 TBfs3BOWVcPGhX1GXUjViO228WJitXy9gqOaLfQt8lFcF8IOiJ4SNtIAcCruYMD/WT
	 bl/sdYj44y9+eghWvB3J7s4aOPyQgAc1GADwOnvarZ2la0qTmpe5CSgzw90W9TFAq/
	 oVB1QXqF6u6Vo15TceAzKomARvq0FtCtezUV3CyV9f6uN+2hP1HHpTpdWhifsyeiY4
	 SEesNfOgW/yovhEO6SZ0UqRAKbzBBaLAisoxacwQeJDvl1Y00Q5lur4ZAI9wtZqD7P
	 so/bjgd+3IrXQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 58311C3279F; Sat,  3 May 2025 18:25:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] [6.13.9] regression USB controller dies
Date: Sat, 03 May 2025 18:25:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: cwunder@gnome.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220069-208809-86Ulzn5pfH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220069-208809@https.bugzilla.kernel.org/>
References: <bug-220069-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220069

--- Comment #29 from Claudio Wunder (cwunder@gnome.org) ---
> Would it be possible to move one of those child devices to another place =
so
> that it goes to a different bus?

The webcam and another USB dongle are connected on the monitor's USB hub; T=
hat
hub is connected directly to one of the rear USB ports; Do you want me to
connect them to the other bus? (5) -- Note that these are also one of the r=
ear
USB ports.=20

Also note that if the problem is 8-3 I don't think there's much I can do, as
ASM107x is an internal device from the Motherboard; Also the "6K7732" devic=
e is
(7-3.4 hub only device) a LED (it is just a simple LED backlight, it has no=
 USB
functionality whatsoever; There is also the AURA Led Controller and NZXT Kr=
aken
Base all devices under (7) but connected directly to the Mobo, and that I c=
ould
remove.

Anyhow, I can move the monitor Hub to another rear USB port and also run yo=
ur
script.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

