Return-Path: <linux-usb+bounces-23102-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6484CA8ACB0
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 02:27:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79429441023
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 00:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9C8018E377;
	Wed, 16 Apr 2025 00:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SfB2Jyf0"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409F119F111
	for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 00:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744763216; cv=none; b=WoHlyzqt6j8OWng+CMHKh30TzhEi2w6Y6ys0HM/O34gVyTudtGkoICUaRKvIRjO4HCWoGPLwGoZmgMVXqN9gD1BTMgUzJyYJUSMb32D6lhHWFwQk6hqAxHoBKsYV5XR6tgsagVgANIekau+Lzu/zMlusBIAYycb6zlAUEENnjNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744763216; c=relaxed/simple;
	bh=3KIZuXlLsG3hVVWExWYFARWi2XDTEi+6jGCgWqtV9BQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LDKoQker7d8hatA0JhzdotCRr55xZisadFEwOTZvAAGwfr+i1SAbDgMqe6PYT/TOYI60Y+fhcsRI/UKUPK0CI7CnXOv5pc1LGnSWktAEwS1fa5EOuuAamBwAyjrFLyfpcnUXJYhcC6AflvWL4K97kK8rq/fLTeWXsgFCMqGmTk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SfB2Jyf0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id AA1A6C4CEE7
	for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 00:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744763215;
	bh=3KIZuXlLsG3hVVWExWYFARWi2XDTEi+6jGCgWqtV9BQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=SfB2Jyf0dblqhpQZEY6MSSUTwA05KGNYvBxUuGBBrFCr4qlogIt5Q663JPpRxdXVg
	 421ZDv7XQ5DRNbelY0+TSTe3A3TA+G+1rJh+r+lCB51BwdwBGBsEFVw/gg7NRtqhkq
	 ELXfOxDk9AQQVWS7bn/Bikg+63pjfpov3cI5HIXE+jvrIwNEsrBqhrf8tpjWas8q1Y
	 CrsVwlvu3ZisqpoAJEU3/ksE/Ur23XpgiJcpfW4e6j8f5enkFoY6Lr16JSoiHLL/pv
	 hVb9BNzTLq8Fa40ID6yJ7tBwdZLBeTaptjPYVHdNnqyLEH5PhQ62UBNH742iLHeNt+
	 JV4asdVIfIvtw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 935F6C3279F; Wed, 16 Apr 2025 00:26:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220016] USB devices plugged into USB hubs on
 6.14.2-300.fc42.x86_64 do not work
Date: Wed, 16 Apr 2025 00:26:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: joe@solidadmin.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220016-208809-ZvXfvj4Ymq@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220016-208809@https.bugzilla.kernel.org/>
References: <bug-220016-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220016

--- Comment #1 from Joe Doss (joe@solidadmin.com) ---
Created attachment 307968
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307968&action=3Dedit
6.13.7-200.fc41.x86_64 journalctl -k output

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

