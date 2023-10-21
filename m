Return-Path: <linux-usb+bounces-2035-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CE27D1C8D
	for <lists+linux-usb@lfdr.de>; Sat, 21 Oct 2023 12:35:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CC2D28250B
	for <lists+linux-usb@lfdr.de>; Sat, 21 Oct 2023 10:35:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DA40D27A;
	Sat, 21 Oct 2023 10:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="J+XtpMwB"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1261C18A
	for <linux-usb@vger.kernel.org>; Sat, 21 Oct 2023 10:35:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEB51C433C7;
	Sat, 21 Oct 2023 10:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697884546;
	bh=6yWmez/L+p/MIzkYttk/iFNjmxuQYstDYHQskwBxuv0=;
	h=Date:From:To:Cc:Subject:From;
	b=J+XtpMwBWTDzeYtSXcGY3Xjq6IzkNFgYth6kXpTRxjwDS8umaj4gK6c7qJ4q4GzVa
	 uCJ9lIAsiMWSBttpm0SrB5ajKBV5n6dQVL/ytoNcVBVTXS75VMYiU5LkgDHft6Yfiq
	 NNgDh0+ei2ExhePBEEg1ndyQ3ncLZwKpjOpYhSM4=
Date: Sat, 21 Oct 2023 12:35:43 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [GIT PULL] USB/Thunderbolt fixes for 6.6-rc7
Message-ID: <ZTOpf59MXETPspHM@kroah.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit 58720809f52779dc0f08e53e54b014209d13eebb:

  Linux 6.6-rc6 (2023-10-15 13:34:39 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-6.6-rc7

for you to fetch changes up to 21a68b69f7c16f026bd2e51884520aaf594977cb:

  Merge tag 'usb-serial-6.6-rc7' of https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus (2023-10-20 07:52:44 +0200)

----------------------------------------------------------------
USB/Thunderbolt fixes and ids for 6.6-rc7

Here are 4 small patches for USB and Thunderbolt for 6.6-rc7 that do the
following:
  - new usb-serial device ids
  - thunderbolt driver fix for reported issue

All of these have been in linux-next with no reported problems.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Benoît Monin (1):
      USB: serial: option: add entry for Sierra EM9191 with new firmware

Fabio Porcedda (1):
      USB: serial: option: add Telit LE910C4-WWX 0x1035 composition

Gil Fine (1):
      thunderbolt: Call tb_switch_put() once DisplayPort bandwidth request is finished

Greg Kroah-Hartman (2):
      Merge tag 'thunderbolt-for-v6.6-rc7' of git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt into usb-linus
      Merge tag 'usb-serial-6.6-rc7' of https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus

Puliang Lu (1):
      USB: serial: option: add Fibocom to DELL custom modem FM101R-GL

 drivers/thunderbolt/tb.c    | 10 ++++++----
 drivers/usb/serial/option.c |  7 +++++++
 2 files changed, 13 insertions(+), 4 deletions(-)

