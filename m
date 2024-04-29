Return-Path: <linux-usb+bounces-9876-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E05548B5424
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 11:22:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D6261C218F7
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 09:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6816C224D1;
	Mon, 29 Apr 2024 09:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GyXdyqdC"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E349920DCC
	for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2024 09:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714382525; cv=none; b=JyMIPXr4sbYSbrGGCef9MkTh5e/rmJtZzg/R7uGUim9ThE37IAGLyw0cdZjqVn5u5GWCqstJK4Iw+61OxhIeclectX1tGoWkVc/0R//+dFxELZRQ1JKS2Jh5cqucg2NKAvxmePZUr8947tWvnejudfV82iFUK+33xS1PIL6rYLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714382525; c=relaxed/simple;
	bh=jlhubDLl7I69XZmgYKSQBc6Z845Ipk0MC//FJ5JyZys=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=IL7TSCqX3s6pT4SflNlrqjxXu1LYwqt4/7H5EceY7DcXhNcJUB4Dvwr9pv9fEWL9R6UrGIVHwMleS7Fjt+XcElQtsbQ47ZAgWCKUANssUzrrKyTRJJpKOaN4ha0iS9jqaRyUrw/3G//RJOA7ivzlGw8Hsw+1wA7Qmjz4zpkisrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GyXdyqdC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C031FC4AF18
	for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2024 09:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714382524;
	bh=jlhubDLl7I69XZmgYKSQBc6Z845Ipk0MC//FJ5JyZys=;
	h=From:To:Subject:Date:From;
	b=GyXdyqdCjltL4pvPn7LlDC10upYo8/ZE68SxdSLuIl2ZtP9WSGiaVknR8x5xoVX0g
	 qgeAsWdDHg5ZU0kLKyxTFdflLdSweNELg+xVtdn13ovoFamiHfRuAhOKuWVzw+G+mO
	 iYHRHui8bZI4l4iv6VBV6UdSNokVYxNeL0JeSfzMaCw2doCvG9FO8lgFME8n5TmE2l
	 zdnNaurcw6NxpKlcKPwH/CDmJxrzpIFuazr2LI05IdjrZ6amEDr9iIJXfmPzSPHfjc
	 b4nOr2b1oHBSP5BaCxumfWjxYtOKwkyWyzLiseX8Sc8tJg8Q/zo24frrEAxacrHPNg
	 rQjI668cMtBJw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AA139C16A72; Mon, 29 Apr 2024 09:22:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218788] New: ucsi_acpi USBC000:00: ucsi_acpi_dsm: failed to
 evaluate _DSM 2 in logs
Date: Mon, 29 Apr 2024 09:22:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: webcapcha@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-218788-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218788

            Bug ID: 218788
           Summary: ucsi_acpi USBC000:00: ucsi_acpi_dsm: failed to
                    evaluate _DSM 2 in logs
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: webcapcha@gmail.com
        Regression: No

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

