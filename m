Return-Path: <linux-usb+bounces-10697-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D8F8D4F0A
	for <lists+linux-usb@lfdr.de>; Thu, 30 May 2024 17:28:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C2A91F21E71
	for <lists+linux-usb@lfdr.de>; Thu, 30 May 2024 15:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48281839E4;
	Thu, 30 May 2024 15:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gOg6CrfG"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C472F176241
	for <linux-usb@vger.kernel.org>; Thu, 30 May 2024 15:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717082883; cv=none; b=d0r0daS6ssk+BRq2tf7p02yWfFf5t4v2LeBPnwAtwhEsDaF+/R0w0HtGW+K257aHucXd188BPmWi5WvDuq6R/8A6zsxTAesgiMPhU5S4yjj3dOv5XF+yXxAWKoWfQcCOkeDQ1ELXOgE/FMyUe/z2aaZCexbwWkESybhOBWjSdoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717082883; c=relaxed/simple;
	bh=YhQwrMDKlSJs03wYNTnqdXTXeDwwW3kGT62i8ikVY8g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S+3ver74tSNVr8WGxU8c+DTZiayTggjLMFWSKMjT0AoPfDbfRXJntSqpIj0jCFGAdXwEW8fLrEaksCduAbxQb2Tt5wXNGmac7Mjz5YfHFCGl6cZ3HFs6wvuWdTFazEm8RJqcBjSbuWopPlbSuZRWoB/gnSpEVD6MlTm5EqhmlCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gOg6CrfG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 44955C2BBFC
	for <linux-usb@vger.kernel.org>; Thu, 30 May 2024 15:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717082883;
	bh=YhQwrMDKlSJs03wYNTnqdXTXeDwwW3kGT62i8ikVY8g=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=gOg6CrfGTgnCWyL/XZjs9PB31El6HvOeIhClsVatkogTjsOzjz7H828NyFNflEnsu
	 zFUbx8hnnZhi4PAIt5z3d1/FRV0zLheVYgc2VsuBPrwRbuQofxJnmpy2cS54Uit0D2
	 C5WFwoW0X4acNs/lPpb3SbtWtjbntrb/rTnHhu5aW7jV9JsAevym4MUhnkj5qX+I89
	 4sIpj90DINk69oPjUVfnOOgU5p6WUHqzuCkBZ3yU9z7ElP7NPXy9ozQWToUAX7/u5j
	 1Iu9JBReQ+IMuSFH00wVajUAeoZAxF8LIiiKRwnJdJK0iUsgZo4hP74/6DLKbGhnto
	 OjltnC8duLHqA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2FD98C53B50; Thu, 30 May 2024 15:28:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218890] reset SuperSpeed USB device number 2 using xhci_hcd
Date: Thu, 30 May 2024 15:28:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218890-208809-4xWJB82C7P@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218890-208809@https.bugzilla.kernel.org/>
References: <bug-218890-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218890

--- Comment #13 from Alan Stern (stern@rowland.harvard.edu) ---
I should have pointed out that Mathias's change might not affect the timeout
and reset that you're getting.  The usbmon trace showed three different
problems, which might or might not be related, and the new patch is intende=
d to
fix only one of them.  Until it was tested, we had no way of knowing whethe=
r it
would also fix any of the others.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

