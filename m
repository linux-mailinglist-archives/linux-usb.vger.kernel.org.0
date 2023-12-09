Return-Path: <linux-usb+bounces-3940-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E2080B4A1
	for <lists+linux-usb@lfdr.de>; Sat,  9 Dec 2023 14:55:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4AE481C20BE2
	for <lists+linux-usb@lfdr.de>; Sat,  9 Dec 2023 13:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CABE14F6E;
	Sat,  9 Dec 2023 13:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="O1pgvjC8"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA84134B4
	for <linux-usb@vger.kernel.org>; Sat,  9 Dec 2023 13:55:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0032C433C8;
	Sat,  9 Dec 2023 13:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1702130122;
	bh=dAJrYs51pXw8gQPsCf2PNfad4fIq7GSCZB91uxi+/Og=;
	h=Date:From:To:Cc:Subject:From;
	b=O1pgvjC8Pka3IpyKzouBG5LtTdP01LEQ2wUpDHyL+JmAxuCceFU1EUCogKukS7yIe
	 R0bXZPzTaF0MgKvvXMqm/bO0CrigCtMa+sTf19SXNPvNlmCr738TuljuvGeePmBUy5
	 V0mnx+woSn3vv14RtWrFwXqXHIai4KiEY0fOcw8k=
Date: Sat, 9 Dec 2023 14:55:19 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [GIT PULL] USB driver fixes for 6.7-rc5
Message-ID: <ZXRxx0o07FDnsRhN@kroah.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 33cc938e65a98f1d29d0a18403dbbee050dcad9a:

  Linux 6.7-rc4 (2023-12-03 18:52:56 +0900)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-6.7-rc5

for you to fetch changes up to 61890dc28f7d9e9aac8a9471302613824c22fae4:

  usb: gadget: f_hid: fix report descriptor allocation (2023-12-07 10:12:05 +0900)

----------------------------------------------------------------
USB fixes for 6.7-rc5

Here are some small USB fixes for 6.7-rc5 to resolve some reported
issues.  Included in here are:
  - usb gadget f_hid, and uevent fix
  - xhci driver revert to resolve a much-reported issue
  - typec driver fix

All of these have been in linux-next with no reported issues.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Konstantin Aladyshev (1):
      usb: gadget: f_hid: fix report descriptor allocation

Mathias Nyman (1):
      Revert "xhci: Loosen RPM as default policy to cover for AMD xHC 1.1"

RD Babiera (1):
      usb: typec: class: fix typec_altmode_put_partner to put plugs

Roy Luo (1):
      USB: gadget: core: adjust uevent timing on gadget unbind

 drivers/usb/gadget/function/f_hid.c | 7 ++++---
 drivers/usb/gadget/udc/core.c       | 4 ++--
 drivers/usb/host/xhci-pci.c         | 2 --
 drivers/usb/typec/class.c           | 5 +++--
 4 files changed, 9 insertions(+), 9 deletions(-)

