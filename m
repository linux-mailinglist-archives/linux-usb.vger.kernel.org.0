Return-Path: <linux-usb+bounces-13261-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F1E94CBF9
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2024 10:14:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BD771F25014
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2024 08:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7472718C93F;
	Fri,  9 Aug 2024 08:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sUAhw8uX"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FB018CC0B
	for <linux-usb@vger.kernel.org>; Fri,  9 Aug 2024 08:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723191243; cv=none; b=OizOBlgwRMoU5fvuZoOHF6Z91bDH7Od9pCfm9F7JuYebXENaYBPnJ34gRYdFpsWLJmO2emfNaNYJ4ip+WQI2IMSueijwCnRZ+cgsXTGzWjYNfJs9troI6Y+q9NFuePjyMY5Q/hO2axT90r+MAHhXnhgU6t4ln+tXxWWbKH7rXnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723191243; c=relaxed/simple;
	bh=o6vZ0T2v+wk3sUy4K0/B5WZ/jW2YDzi41MEwGcTBGAc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ongT90f3NBjz2i7Mt6nVkU2vJahM5ArhvOI5ILkj67HEvUu4WDriqRjPTSVo57Qk4drG/0mjODgIDGSUd1qqzJ8w+HXQ85iPXH0JFQMfXYkPkU9LvNHNyt9NCpgumwl/HWLegxXL5v7HEoeZ/sZKd592XxIwxyYgW2nKkvLDDs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sUAhw8uX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 11806C32782
	for <linux-usb@vger.kernel.org>; Fri,  9 Aug 2024 08:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723191243;
	bh=o6vZ0T2v+wk3sUy4K0/B5WZ/jW2YDzi41MEwGcTBGAc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=sUAhw8uX79iaVEyiijcJwsy8jJOBM5XiPQ6aGdilZ5IKy2f/DnrNgCBoiu4modhZS
	 SPXw0PH07w9AYAJtZieRVfzjlgmPyYtCfM/4bvZsdtNO/2Y44t+iPCpcOPCKmWPoQ4
	 /mNyDckADLsyzOuJG8if7ZQpH1/+t2pqbRBszJ9x8at7ZhwAUzWY3JPWAmgUbkNlMK
	 kHNAsCRH+ekwg+OpBRmE1+MEDmYH1zWr52AY1HtqrcuE0OHp8HpcqRcqUNfRAsKNWT
	 gMYYflNWwXXvhBzJm+PWkKqpJMQCXOfjoZqZ49hH9pA7MJI7dGfxgoQyUHvPkTOfBY
	 ULh1NluLwYyDw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id ECB25C433E5; Fri,  9 Aug 2024 08:14:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219111] Xone:23C mixer not recognized as a 2in/2out device
Date: Fri, 09 Aug 2024 08:14:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: com+bugzilla-kernel@c-henry.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219111-208809-FfxSD9unvW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219111-208809@https.bugzilla.kernel.org/>
References: <bug-219111-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219111

--- Comment #43 from CH (com+bugzilla-kernel@c-henry.fr) ---
By restarting I mean turning off and on again, using the power button.

> What happens if you restart the device while old_scheme_first is N?

Not much:

  # echo N >/sys/module/usbcore/parameters/old_scheme_first
  # cat /sys/module/usbcore/parameters/old_scheme_first
  N
  # lsusb -v -d 22f0:0008~ | grep bConfiguration
  # lsusb -v -d 22f0:0008~ | grep bConfiguration
      bConfigurationValue     1
  ## Here I turn offf and on again
  # lsusb -v -d 22f0:0008~ | grep bConfiguration
      bConfigurationValue     1

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

