Return-Path: <linux-usb+bounces-14928-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 84234974A20
	for <lists+linux-usb@lfdr.de>; Wed, 11 Sep 2024 08:08:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E63252885DC
	for <lists+linux-usb@lfdr.de>; Wed, 11 Sep 2024 06:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5A9C84E18;
	Wed, 11 Sep 2024 06:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d5k3Rtgp"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C8F7E111;
	Wed, 11 Sep 2024 06:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726034906; cv=none; b=djfyLDtJH3w0HFUfzpuSDkI3Yb0YJw2e0Yo9eg6XMjsqV5pTyAPvOV3DDEyUAIHKqYqsN6vk1qFvb2yllx+4rCUOyBs0qQ1YyxMjrkgSfgrGPU7RSMkAhaIPcbjvjygPLrOJeCBfvx+k8TaFqJGawRnkGe91EpAQYWI8ZdqwVZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726034906; c=relaxed/simple;
	bh=1adCz8OwlbTinoU7Gfr9pEp20l0uXSi0C6wqrnrmsPs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=icmcuBoXge8Sm3BFfE1S7DVBMPy2TCu/L/zwhu3eIz/DRAqsBACLmRTs8O06vUlAYd/Ye7d0pxthq8ZnrXjV05AMzd6g6XrZjeEnRIO6c3aLNdVphMckULuF54gJXOkWXoGd7jScLq2DMTaiMoCSzrC0No94uNi+gcCMX6tFjII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d5k3Rtgp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBF90C4CEC6;
	Wed, 11 Sep 2024 06:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726034905;
	bh=1adCz8OwlbTinoU7Gfr9pEp20l0uXSi0C6wqrnrmsPs=;
	h=Date:From:To:Cc:Subject:From;
	b=d5k3RtgpVBF/P7sradWD6RM5uY9/xWs5b8zUyhitAGba5V3SWdG8D5ID+VHzLPd1z
	 gSsHPxGUD/FXawEMXMQfha5sdLnCkVAYF2PQQeEauEAiTtRDDy69jh5jpOjp1DvD1J
	 WRT0J2BNS/iNMVNh1+gc6PofrdWzo22j+XZN0Wmle+8r3siN0Jmlk/yYFkoLoXzxx0
	 pOV4/iuZi4JDzERdxsjHTW8xsc6FFkDD+GCHwC4h1/xWERS69zYWxGGX/wPJnwD2WE
	 e5pvV530hctcY1eqeYdQRnXbmGpewF7GE5XKgeYsdgIazHfceCPT//ws+W2DxHT/pe
	 bQkyhrreGFWxg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1soGWx-000000005Yg-3d3r;
	Wed, 11 Sep 2024 08:08:43 +0200
Date: Wed, 11 Sep 2024 08:08:43 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] USB-serial fixes for 6.12-rc1-2
Message-ID: <ZuEz67ehYXIG8AXB@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 431c1646e1f86b949fa3685efc50b660a364c2b6:

  Linux 6.11-rc6 (2024-09-01 19:46:02 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-6.12-rc1-2

for you to fetch changes up to 7d47d22444bb7dc1b6d768904a22070ef35e1fc0:

  USB: serial: pl2303: add device id for Macrosilicon MS3020 (2024-09-06 17:11:13 +0200)

----------------------------------------------------------------
USB-serial device id for 6.12-rc1

Here's a new pl2303 device id.

This one has been in linux-next with no reported issues.

----------------------------------------------------------------
Junhao Xie (1):
      USB: serial: pl2303: add device id for Macrosilicon MS3020

 drivers/usb/serial/pl2303.c | 1 +
 drivers/usb/serial/pl2303.h | 4 ++++
 2 files changed, 5 insertions(+)

