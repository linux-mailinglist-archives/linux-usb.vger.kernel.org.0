Return-Path: <linux-usb+bounces-242-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03ACD7A2FCD
	for <lists+linux-usb@lfdr.de>; Sat, 16 Sep 2023 14:00:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F1371C20ECB
	for <lists+linux-usb@lfdr.de>; Sat, 16 Sep 2023 12:00:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 422B613ACA;
	Sat, 16 Sep 2023 11:59:59 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1229F1C33
	for <linux-usb@vger.kernel.org>; Sat, 16 Sep 2023 11:59:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C8F6C433C7;
	Sat, 16 Sep 2023 11:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1694865598;
	bh=gUYn1boYKCebIo7ZO9DJxSeqqd1YStvLwVMVr/TMHeA=;
	h=Date:From:To:Cc:Subject:From;
	b=bgBUix2sE7NXcY2NPi6hBA7El8hYhMqfoLmi5f//8y8RgLSczdrHXDvqgpcaC/DF9
	 s/OEo9Vji3cDwlLMW2Tl+Gxj1uUSyuFKIhZms/Yxy/ZBPwBC6jNCfQKORySHjD7YLx
	 sTdD0hERO/ATdwrN5G4FKD/UonkYxOUjQISkGOVQ=
Date: Sat, 16 Sep 2023 13:59:55 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [GIT PULL] USB fix for 6.6-rc2
Message-ID: <ZQWYu7xf_8KTWXFu@kroah.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-6.6-rc2

for you to fetch changes up to f26a679ed799deef9e2934a6b60b8f38bdbf4921:

  usb: typec: ucsi: Fix NULL pointer dereference (2023-09-11 13:52:16 +0200)

----------------------------------------------------------------
USB fix for 6.6-rc2

Here is a single USB fix for a much-reported regression for 6.6-rc1.

It resolves a crash in the typec debugfs code for many systems.  It's
been in linux-next with no reported issues, and many people have
reported it resolving their problem with 6.6-rc1.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Heikki Krogerus (1):
      usb: typec: ucsi: Fix NULL pointer dereference

 drivers/usb/typec/ucsi/debugfs.c | 3 +++
 1 file changed, 3 insertions(+)

