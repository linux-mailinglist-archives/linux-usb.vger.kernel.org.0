Return-Path: <linux-usb+bounces-19239-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1827A0B717
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2025 13:39:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05CFD167960
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2025 12:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7413522AE65;
	Mon, 13 Jan 2025 12:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SaBpAzjV"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F087421ADB4
	for <linux-usb@vger.kernel.org>; Mon, 13 Jan 2025 12:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736771941; cv=none; b=c1mS4x2c27VyhuRvKsyDUph0BwCWVFz4Iz0R08DDURjjUo6F+zOjfR5znVaxsx9bGstfLxzNWC2OlSH+extXsPaAD/AL+8YWNlkosWC8ducO0/kCWAZlcb9tZxUQLkUAEoX6Nqc0altZ6Q7YctIK07JiGRcxCG7QN3WTC732bt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736771941; c=relaxed/simple;
	bh=9wohInyqVIaQe1tvIM+pQXehH2a/bGYnBl6FpurNnHA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DJJI6bFPTY1tqItx/j1qggA/SUrpAWv+2YbGAKOhCNsQAkZV1MWAaLCjk1znsPaAT8J1VOYGKxmHcwUe1KBMiqYbd8xi+IdIVxklPkV4cusN/bffIykunVv7f1Nws+VLZX9uE6BRGE4cEAvxuPtHoXNd+Iz6xsKoB0JU8OpmHgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SaBpAzjV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A323AC4CEDD
	for <linux-usb@vger.kernel.org>; Mon, 13 Jan 2025 12:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736771940;
	bh=9wohInyqVIaQe1tvIM+pQXehH2a/bGYnBl6FpurNnHA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=SaBpAzjV+Xe0SyWjh337OdyYIsidaF4zBLLE9eaxEqdQWLJdIH2i0ipCDmKqIXLLR
	 b4WUedDht3MfQtYLz1csO5ljZJXu3BmzlI0QYN2xZS1Wr6z4MRge0Ok/gpawtlkr2Z
	 sDKdS9k1ntUfj7HFDdp8fymWUHeUwDWMfp3+Zq+98sIb6wm0vYgIDjzG018/XOVJLn
	 IavFs21H/xfQEJOZKq1iY2DqUJRpElyFSyY4XQFKDLiMNJjyWx5gYxOY/xiMQB/lkM
	 oRf4X35fRZVQvRIJsKvnNTREoLwxpqZ7TlUxgfzp+yPmGBbWPu5g3LQPlnfWPmoK+O
	 sDXNV92/RRYaQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8F005C3279F; Mon, 13 Jan 2025 12:39:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219590] Linux 6.13 ucsi driver error:
 drivers/usb/typec/ucsi/ucsi.c:1374 ucsi_reset_ppm
Date: Mon, 13 Jan 2025 12:39:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: guido.iodice@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219590-208809-Rbz68SY9xY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219590-208809@https.bugzilla.kernel.org/>
References: <bug-219590-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219590

--- Comment #4 from Guido (guido.iodice@gmail.com) ---
mmm it seems that rc7 doesn't give any problems. However this is only the f=
irst
boot, I will check in the next few days whether the problem still occurs or
not.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

