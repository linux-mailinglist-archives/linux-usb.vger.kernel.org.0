Return-Path: <linux-usb+bounces-3278-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C007C7F7109
	for <lists+linux-usb@lfdr.de>; Fri, 24 Nov 2023 11:15:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1E341C20EB3
	for <lists+linux-usb@lfdr.de>; Fri, 24 Nov 2023 10:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D7B118C27;
	Fri, 24 Nov 2023 10:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pPE1PgTD"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5EE1863A
	for <linux-usb@vger.kernel.org>; Fri, 24 Nov 2023 10:15:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D15CC433CA;
	Fri, 24 Nov 2023 10:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700820920;
	bh=K8c3CvTDdS55RC9NLl6N86xxOb4or8TCl0n+Zl6sVx8=;
	h=Date:From:To:Cc:Subject:From;
	b=pPE1PgTDiczuxiA2bhqHEUEAqGtc/M5IFII2ibnBOYKyJ9ljGah8f+rmYYs4RuJjY
	 rLj/986St3NsP9c2FooP7Ey27ExyDcatCP3jG2ythi6aRQ3dCM7/vWYk2N8+hyIfRi
	 pBV7oAbTuqUhvsa3lWOw8tCppKPXVfqQNB2iH/KfpLPqGDpcTp7minwnbiwjwZ1jPS
	 kLji9dHnwdcqk7DjmXVqawU5UB4bP2DZzY56HI1INV40Z8FYKatf6apfeJwi2jzpmY
	 e5590mjAfS+v0ul2pJzOp9sDy6DVDOqV4wkMlO5QGlamAev7ThYK97opqH9LiOpgs6
	 dyWgYLgc4dksQ==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1r6TDo-0007DY-26;
	Fri, 24 Nov 2023 11:15:40 +0100
Date: Fri, 24 Nov 2023 11:15:40 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] USB-serial fixes for 6.7-rc3
Message-ID: <ZWB3zPa1o74IfDM5@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 98b1cc82c4affc16f5598d4fa14b1858671b2263:

  Linux 6.7-rc2 (2023-11-19 15:02:14 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-6.7-rc3

for you to fetch changes up to da90e45d5afc4da2de7cd3ea7943d0f1baa47cc2:

  USB: serial: option: add Luat Air72*U series products (2023-11-23 18:39:30 +0100)

----------------------------------------------------------------
USB-serial fixes for 6.7-rc3

Here are a couple of modem device entry fixes and some new modem device
ids.

All have been in linux-next with no reported issues.

----------------------------------------------------------------
Asuna Yang (1):
      USB: serial: option: add Luat Air72*U series products

Lech Perczak (1):
      USB: serial: option: don't claim interface 4 for ZTE MF290

Puliang Lu (1):
      USB: serial: option: fix FM101R-GL defines

Victor Fragoso (1):
      USB: serial: option: add Fibocom L7xx modules

 drivers/usb/serial/option.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

