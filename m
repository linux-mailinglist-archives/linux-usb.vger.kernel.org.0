Return-Path: <linux-usb+bounces-25391-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B05AAF0B21
	for <lists+linux-usb@lfdr.de>; Wed,  2 Jul 2025 08:02:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA2A14E476A
	for <lists+linux-usb@lfdr.de>; Wed,  2 Jul 2025 06:02:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9902E20D500;
	Wed,  2 Jul 2025 06:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lbhYgdnj"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DD71F78F2
	for <linux-usb@vger.kernel.org>; Wed,  2 Jul 2025 06:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751436133; cv=none; b=ne7WUmHTQf1INA5RXyAcMamkyFabXkZv7PYsbhkKMS/aJd9eYIO8ozl86hRN2OF7azoYzXA5iaKwXVZvVgAo8txc5HylqeG7CMHipX4z+f0Yb6hTCutGvTyvFRTjQ1STNq3vBlOq1wlPUaE5O0kcKJXP+JpA4tNoDSkI3Ale524=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751436133; c=relaxed/simple;
	bh=j9Yy8d6nr08QE39oll1EQ84XLFzFOBeFyuQy8q8tdT8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aCsuaHTBCODQANzj72hbHA1wBPjC/4P6OD6s3o0tXfyugJMfp+zQSSfexpvx94VOww3RiVvYYC5anLcgNg6R4s81DYj2y/8CjY65wgWi3kQjXuCQHqBYAhRMCUsfDLJEDi+bvbUojJU/KDHYUSzf3eRR/3EPwHylev5gfQXf6pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lbhYgdnj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9BBB5C4CEF1
	for <linux-usb@vger.kernel.org>; Wed,  2 Jul 2025 06:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751436132;
	bh=j9Yy8d6nr08QE39oll1EQ84XLFzFOBeFyuQy8q8tdT8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=lbhYgdnjYeAnAsNA0B0XF/Il6xPD+NlI+uk7bdX6DsFObQYktz4Ylo2YegmCFeqF+
	 SjATt6YnVTvIzg8lPOsabBUF46xfjQ7vcS/ZEeAWJNI0G3vXFGpPlP/Cj4OtAdpZL1
	 pQGesTOo6YfPJNOAxUvgeoUQbyR1aiuObZOAu5YL0iaeFZj+z6ljQjEiCrAtsehwcT
	 i55jrR+FYfx4EaTcR0VZcaVfxMN0b4PYhuH0BRnAYfTLwszqoERlpnEnTJxzL/UwZN
	 hjsr6HFtnNUE9/Bt2oL1HXXAhm5hupUN/SvAxJH7jPvIqHr00G+dX7hAK49NV0qbx5
	 zXsqLI48RLwCQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 89D3DC3279F; Wed,  2 Jul 2025 06:02:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220272] Latent race condition in USB code unveiled with
 optimized memset_64.S
Date: Wed, 02 Jul 2025 06:02:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: m.seyfarth@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220272-208809-tkkguCVvxZ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220272-208809@https.bugzilla.kernel.org/>
References: <bug-220272-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220272

--- Comment #25 from Marcus Seyfarth (m.seyfarth@gmail.com) ---
Created attachment 308351
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308351&action=3Dedit
Trace v4 - Shark Force mouse / non-working memset

Here are the v4 traces from a different mouse (Sharkoon Shark Force) for the
non-working memset implementation. This mouse shows a slightly different
behavior, it also does not work initially but it did not come back successf=
ully
after the re-plug event (the USB LEDs were working though). There is no cur=
sor
movement on the desktop.

This deviates from the initial Sharkoon Light 2 100 mouse that did come back
successfully after a re-plug event.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

