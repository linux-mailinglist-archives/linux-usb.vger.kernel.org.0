Return-Path: <linux-usb+bounces-19193-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BFDA0924B
	for <lists+linux-usb@lfdr.de>; Fri, 10 Jan 2025 14:42:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD1593A97DB
	for <lists+linux-usb@lfdr.de>; Fri, 10 Jan 2025 13:42:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CE1520E03D;
	Fri, 10 Jan 2025 13:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PtoOQCBW"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58322080DB;
	Fri, 10 Jan 2025 13:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736516557; cv=none; b=IyOerRfxbIqef8OO3QXICrWce4i46lSs0lc1Jb23Q8bNQ9/76TWMZegU9O+FJRR8uRsNZXFZQNA6xwgO259ZSW7uy6BaLi2I1k+4tHmkMcxVirW+EKMz2lFUHkbxJ/EyBBHmCR5t/2XV8kTHx7bDxR/hOeYNS6liQHZafaUrD74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736516557; c=relaxed/simple;
	bh=xCiwPhIWFPS2S7SmXx+uN74zl/mInLS+vys1X/EQbo0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ffrNrePBbCF/5M/HEOb3YIWa8nXYQhVp8uxxe3RQtTxzRmqjsSVp35UsyyWKdSr6jeO1TzU8evdPo+QhaJShtcWnc0/5klL1IvYC42MEqpvCUb/CQlh3FDB49QqbWT6WTUXzC5go1OqlyPhCS6NLk8iL0L1WaWjJYE8q8xB3p9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PtoOQCBW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42440C4CED6;
	Fri, 10 Jan 2025 13:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736516557;
	bh=xCiwPhIWFPS2S7SmXx+uN74zl/mInLS+vys1X/EQbo0=;
	h=Date:From:To:Cc:Subject:From;
	b=PtoOQCBW6S+9eco0wNI8q8tdmbRq0ZMleWvoBNWhze0Ic5ZRtAlOWIyJHppxopSB+
	 MTF7GLojKgqz14KJrPcQg83wC6KRt2huh6ANg5Zg6DVHYJmrco8UjIxIOyn/oIiL2b
	 U1zljAf1t3UR84WsFcrMv1fuiQe/z9RtxstWM15SRSSUIqKU0gEz911CvgLUCFAvRc
	 X7uqYwUDo5ua7Bw1Wjir+VrTzTjLDyKBFCddLxFzpsWfHRhVQJVzmzdj7cYGOmgC27
	 cN9nF4wDZEn/UG93B33kujW/O+b39LuIIpGP6s/ANVpnfkSvO0EFmkRvm0FMBm1RU2
	 7PVdhb4Gij41g==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tWFHa-000000002tR-3TZC;
	Fri, 10 Jan 2025 14:42:38 +0100
Date: Fri, 10 Jan 2025 14:42:38 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] USB-serial device ids for 6.13-rc7
Message-ID: <Z4Ejzlpd1OxM_bnk@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 4bbf9020becbfd8fc2c3da790855b7042fad455b:

  Linux 6.13-rc4 (2024-12-22 13:22:21 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-6.13-rc7

for you to fetch changes up to f5b435be70cb126866fa92ffc6f89cda9e112c75:

  USB: serial: option: add Neoway N723-EA support (2025-01-08 11:49:54 +0100)

----------------------------------------------------------------
USB-serial device ids for 6.13-rc7

Here are some new modem and cp210x device ids.

All have been in linux-next with no reported issues.

----------------------------------------------------------------
Chukun Pan (1):
      USB: serial: option: add MeiG Smart SRM815

Johan Hovold (1):
      USB: serial: cp210x: add Phoenix Contact UPS Device

Michal Hrusecky (1):
      USB: serial: option: add Neoway N723-EA support

 drivers/usb/serial/cp210x.c | 1 +
 drivers/usb/serial/option.c | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

