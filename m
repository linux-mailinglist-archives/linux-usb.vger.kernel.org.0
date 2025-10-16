Return-Path: <linux-usb+bounces-29368-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D0530BE1995
	for <lists+linux-usb@lfdr.de>; Thu, 16 Oct 2025 07:54:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 490E119A666A
	for <lists+linux-usb@lfdr.de>; Thu, 16 Oct 2025 05:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E931B2472A4;
	Thu, 16 Oct 2025 05:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r4jhdPT4"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62681242D91
	for <linux-usb@vger.kernel.org>; Thu, 16 Oct 2025 05:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760594043; cv=none; b=hALNvwRZ3iIQMlcG7Yo/F42AQ0NlS19YDvh/arWxVH/jKJQomJHAj8HujsLPPsbAQ5mzlOXfWtaP46ERPogFByrxRlhXWtgt0A2psj+Z1ZpjWjjXU1iEwIndiAP8EMxFTFaGgA9l1HYZAAdrRA63htNpuCedNb/+ChqOdzT3CrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760594043; c=relaxed/simple;
	bh=VM8bj2esgG3W0YXJEpSQozYq8IxupxVHBZdEfQcL0aw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=r/L7m9yLpksm99YSUluFcbQVTeUfJSAtfy9yZOVNriQxDkxE4tNMdfq/Onli8+gFy2ou+IORo9jl0QEjVaIsAi/tKi7FMWB7VXMwF56j0cXlK0s998GAeTwj9i7Hzxu7oLA3/MZXg99jre6bUCIGhngEYpuXpALghZtHhjwgUPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r4jhdPT4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DD140C4CEF1
	for <linux-usb@vger.kernel.org>; Thu, 16 Oct 2025 05:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760594042;
	bh=VM8bj2esgG3W0YXJEpSQozYq8IxupxVHBZdEfQcL0aw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=r4jhdPT4BEEX+nl772mxV/FsydbCLQtfyY+UKSV2FJh8JAZaFZaVXWiSMQEk+8w1f
	 o9XKfvfzLs2EOdt7FbkLYPdLzZkWjbfecjTg+7JIPv1eELOzRIet51/WOd96rBQy7p
	 yPV4EDFfh9uqqzslOkC+q3nm43etYEc4L0wOpxJd2mfaa0S4ES1q94iPCjLsGKnL4g
	 OtUDkOqJUmMY+Isjk0rKfRKtd8JyEbNmP5MjVvdyVttyyS1Lmp+00DTyC0zTi7XSv6
	 8JVDvvGqYJ4wAqv1H0rM4w45kMEYWEdIXtuEnIeBPRA6UDRm1hIggPiHChWISn4l+9
	 R7kUjDwvbDHOQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D728AC41614; Thu, 16 Oct 2025 05:54:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220667] xhci_hcd prevents S3 suspend to RAM from working on Zen
 5 system
Date: Thu, 16 Oct 2025 05:54:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kode54@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-220667-208809-9jp2qsvLaC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220667-208809@https.bugzilla.kernel.org/>
References: <bug-220667-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220667

Christopher Snowhill (kode54@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |PATCH_ALREADY_AVAILABLE

--- Comment #4 from Christopher Snowhill (kode54@gmail.com) ---
Oops, forgot to mark the solution.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

