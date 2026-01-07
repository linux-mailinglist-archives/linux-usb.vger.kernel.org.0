Return-Path: <linux-usb+bounces-32027-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 24186D004FD
	for <lists+linux-usb@lfdr.de>; Wed, 07 Jan 2026 23:30:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 24A8B3019963
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jan 2026 22:30:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83D0B2DC791;
	Wed,  7 Jan 2026 22:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o2yJiHUd"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A0B23AB90;
	Wed,  7 Jan 2026 22:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767825024; cv=none; b=aIjK7gaeiYPIExoD6qoAE5UVn6mMUERvLD8kanXnqp19/jInYIiQAk+gVyuiq3Iudv7z9bEZMWGWdRrTYu9ohsjyZkRgH4oY/BJENISWFJdlV5WjkKdcK3evTBlwd7awQLToHNvnGUUnXxInWyo6M1orY9ROsA4zSJGdtH42i3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767825024; c=relaxed/simple;
	bh=NpEMi+FFcLqCy+VebtjlU5KccAtE1btumT4cEIVROu0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GNtOy0jd4rjcfq/e/gXsm15IWIT/GDsMNMAZB4HDGnraeqXBuYCIQOYwB3Hff0GF+RSLAw59YuQqWyQmAY1HgspGV+RNHt17HVu+OtIYya9BVOXl51trjBlNdzTBfik5qzUBPpWHbYMXeek+l0yH93KTLP2mjDEJBRe8WsK08/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o2yJiHUd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 954FCC4CEF1;
	Wed,  7 Jan 2026 22:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767825023;
	bh=NpEMi+FFcLqCy+VebtjlU5KccAtE1btumT4cEIVROu0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=o2yJiHUd7aIdFkYwrmU+TMQNZV6iGEwkkZr2czySp0vmBbt0zYA4r6UG44/VhdhmF
	 IsfSRXWyvq+0NFaGGHNahC7EKH0jTZ5eoHxmoZrQsya/ZgrFMs+Ph952rE10yRDEaP
	 ZCUoat6MA7IcCKM3qEalCJDf3ctII+NVSkxUgjSK2nMHwEfvCfm3oPR7Z+82DDbS8a
	 DCJicJ0Corl8f7B1rcALbinyJyD6wWpka1b46T+RO852RfIKi6nwzCJ0bdFAhm8O58
	 cqrSMKjym79MBsWDG6f0DrPZsnTrd9zDx7lDA0HoLINZFtJh9q5t8vKQlchSK0X+Ks
	 wnskE0LjMqsog==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82752D0D16D;
	Wed,  7 Jan 2026 22:30:23 +0000 (UTC)
From: Sam Day via B4 Relay <devnull+me.samcday.com@kernel.org>
Subject: [PATCH 0/2] usb: gadget: f_fs: DMA-BUF fixes
Date: Thu, 08 Jan 2026 08:30:19 +1000
Message-Id: <20260108-ffs-dmabuf-ioctl-fix-v1-0-e51633891a81@samcday.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQ0MT3bS0Yt2U3MSk0jTdzPzkkhzdtMwKXSNzIxNLc0MLozQLMyWg1oK
 iVKAw2Njo2NpaAN0/RwNmAAAA
X-Change-ID: 20251114-ffs-dmabuf-ioctl-fix-272497182f86
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sam Day <me@samcday.com>, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767825022; l=960;
 i=me@samcday.com; s=20240502; h=from:subject:message-id;
 bh=NpEMi+FFcLqCy+VebtjlU5KccAtE1btumT4cEIVROu0=;
 b=225R0QWiOaY4AzMFirxupqQeTXM+RWuCMCHsZJOaHWooi5dyVMGKeFJxvG2f4baryYjxMgELG
 ZNMYJpt/2AxCNqn8nRsR279l5Uy/gZtpyPpLbr6Ux3wNU97buREp99l
X-Developer-Key: i=me@samcday.com; a=ed25519;
 pk=bzyS0akxWMqr9+AXzgBRIp28KKpEOs+GjYMc2yf+aeU=
X-Endpoint-Received: by B4 Relay for me@samcday.com/20240502 with
 auth_id=595
X-Original-From: Sam Day <me@samcday.com>
Reply-To: me@samcday.com

I recently started kicking the tires on DMA-BUF support in FunctionFS.
In the process, I found a couple of issues that are fixed in this
series.

One issue is a minor bug in how the ioctl handler treats invalid calls.
The other is more serious and breaks DMA transfers on systems with a
tenacious SMMU.

I created a fairly minimal reproducer of the DMA issue in this gist, to
assist in testing:

https://gist.github.com/samcday/d23aaf95be678bcdd1dd62b4b79861ea

Tested on:
 - Pixel 3a
 - OnePlus 6T

Signed-off-by: Sam Day <me@samcday.com>
---
Sam Day (2):
      usb: gadget: f_fs: Fix ioctl error handling
      usb: gadget: f_fs: fix DMA-BUF OUT queues

 drivers/usb/gadget/function/f_fs.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)
---
base-commit: f0b9d8eb98dfee8d00419aa07543bdc2c1a44fb1
change-id: 20251114-ffs-dmabuf-ioctl-fix-272497182f86

Best regards,
-- 
Sam Day <me@samcday.com>



