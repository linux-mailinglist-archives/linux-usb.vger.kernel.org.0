Return-Path: <linux-usb+bounces-1921-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FB57CFD5D
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 16:53:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 076D21C20E45
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 14:53:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AAB82745A;
	Thu, 19 Oct 2023 14:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OK//eEap"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8971D4419
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 14:53:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F034BC433C7;
	Thu, 19 Oct 2023 14:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697727187;
	bh=kBw5yTeJarKCISF0Rqzgf+ypJyJ4QRiNA8nAAPFGzCQ=;
	h=Date:From:To:Cc:Subject:From;
	b=OK//eEapTh5eNeFHxQbmJgNee9YgTFHgf422G1w0ZnjUZSSVsVSriOS95OuBnHG7W
	 knLX2GtD6ult2ptxUfDKQ2CeM2h9UWpep4GTRtz7Sz8mitiooEqVe0fGlLgfu71LsH
	 6+58xZz1vardBoIRMz3gi6MCr03xwSDFq3T1ezlRJNgSSgAG8dWkfF8l2dlqt+cgMW
	 MFIJz3ag/7aG2zRwZa2JbQ+ZUDNHIKFM2BS+pcisHiyai2dEMvgpuQ3+FiCVcJiAFA
	 mN6Y6LmG7jg//SaM9mMbl4p/8x9iPalEdnoNGCNgzhbo7tmoRxOiI4eo0ZgvOaT3H/
	 0BlEAv4fNKJ4g==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1qtUOc-0004RH-1r;
	Thu, 19 Oct 2023 16:53:10 +0200
Date: Thu, 19 Oct 2023 16:53:10 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] USB-serial device ids for 6.6-rc7
Message-ID: <ZTFC1jhZ0m5PIMRE@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit 8a749fd1a8720d4619c91c8b6e7528c0a355c0aa:

  Linux 6.6-rc4 (2023-10-01 14:15:13 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-6.6-rc7

for you to fetch changes up to 52480e1f1a259c93d749ba3961af0bffedfe7a7a:

  USB: serial: option: add Fibocom to DELL custom modem FM101R-GL (2023-10-16 10:40:30 +0200)

----------------------------------------------------------------
USB-serial device ids for 6.6-rc7

Here are some new modem device ids, including an entry needed for Sierra
EM9191 which stopped working with recent firmware.

All have been in linux-next with no reported issues.

----------------------------------------------------------------
Benoît Monin (1):
      USB: serial: option: add entry for Sierra EM9191 with new firmware

Fabio Porcedda (1):
      USB: serial: option: add Telit LE910C4-WWX 0x1035 composition

Puliang Lu (1):
      USB: serial: option: add Fibocom to DELL custom modem FM101R-GL

 drivers/usb/serial/option.c | 7 +++++++
 1 file changed, 7 insertions(+)

