Return-Path: <linux-usb+bounces-4122-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0589F8119C5
	for <lists+linux-usb@lfdr.de>; Wed, 13 Dec 2023 17:43:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10D991C211CE
	for <lists+linux-usb@lfdr.de>; Wed, 13 Dec 2023 16:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83D59381D1;
	Wed, 13 Dec 2023 16:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VZjzpZkN"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90172FC42
	for <linux-usb@vger.kernel.org>; Wed, 13 Dec 2023 16:42:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C55BC433C8;
	Wed, 13 Dec 2023 16:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702485777;
	bh=i70rLgrJWZQl/7kOucCjrKxAdNgKJPgfg9aAZjgbDEY=;
	h=From:To:Cc:Subject:Date:From;
	b=VZjzpZkN9AHtW5Qg9tPr0eCc9IaNCr+lxmqqyVO0HpiEQoRlxov9ubT8hR72EPvmL
	 IZc3GLOR2oAhwjw+PkbJcbi2nIaZLk3p/egeRcv1FxFIrahsh4zVHBuiqNV0np7/D7
	 ab2SWhfCglAWrTD3joFq/sjVNmrEUKeNcnMB2QshtD4csK1mZI1StvxBXSsJlWqyTS
	 ky4jt3rPORytlBDD2T+c+FqCznvh4W2D4TNOPUaZeSYnLpDflsh8Pxsq3GCSKKW2AG
	 bpSNJ3Jhq63QMeNoDSyMu+riQr8CHPCGf+O7rS1QlLpLQZOQxOBCxcS5+1EPIoqsU3
	 HPh+qJ9DbDMgA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Alan Stern <stern@rowland.harvard.edu>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Bryan Wu <cooloney@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Cristian Birsan <cristian.birsan@microchip.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Hema HK <hemahk@ti.com>,
	James Gruber <jimmyjgruber@gmail.com>,
	Jaswinder Singh <jaswinder.singh@linaro.org>,
	Julian Scheel <julian@jusst.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-arm-kernel@lists.infradead.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Pawel Laszczak <pawell@cadence.com>,
	Ruslan Bilovol <ruslan.bilovol@gmail.com>,
	Tomoki Sekiyama <tomoki.sekiyama@gmail.com>,
	usb-storage@lists.one-eyed-alien.net,
	Yadwinder Singh <yadi.brar01@gmail.com>
Subject: [PATCH 00/12] usb: Replace {v}snprintf() variants with safer alternatives
Date: Wed, 13 Dec 2023 16:42:29 +0000
Message-ID: <20231213164246.1021885-1-lee@kernel.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series is part of an effort to rid {v}snprintf() where possible.

For a far better description of the problem than I could author, see
Jon's write-up on LWN [1] and/or Alex's on the Kernel Self Protection
Project [1].

[0] https://lwn.net/Articles/69419/
[1] https://github.com/KSPP/linux/issues/105

Lee Jones (12):
  usb: gadget: configfs: Replace snprintf() with the safer scnprintf()
    variant
  usb: gadget: f_uac1: Replace snprintf() with the safer scnprintf()
    variant
  usb: gadget: f_uac2: Replace snprintf() with the safer scnprintf()
    variant
  usb: gadget: uvc: Replace snprintf() with the safer scnprintf()
    variant
  usb: gadget: udc: atmel: Replace snprintf() with the safer scnprintf()
    variant
  usb: cdns2: Replace snprintf() with the safer scnprintf() variant
  usb: host: max3421-hcd: Replace snprintf() with the safer scnprintf()
    variant
  usb: yurex: Replace snprintf() with the safer scnprintf() variant
  usb: mon_stat: Replace snprintf() with the safer scnprintf() variant
  usb: mon_text: Replace snprintf() with the safer scnprintf() variant
  usb: phy: twl6030: Remove snprintf() from sysfs call-backs and replace
    with sysfs_emit()
  usb: storage: Remove snprintf() from sysfs call-backs and replace with
    sysfs_emit()

 drivers/usb/gadget/configfs.c              |  11 +-
 drivers/usb/gadget/function/f_uac1.c       |   6 +-
 drivers/usb/gadget/function/f_uac2.c       |   6 +-
 drivers/usb/gadget/function/uvc_configfs.c |   2 +-
 drivers/usb/gadget/udc/atmel_usba_udc.c    |   3 +-
 drivers/usb/gadget/udc/cdns2/cdns2-debug.h | 138 ++++++++++-----------
 drivers/usb/host/max3421-hcd.c             |  18 +--
 drivers/usb/misc/yurex.c                   |  12 +-
 drivers/usb/mon/mon_stat.c                 |   6 +-
 drivers/usb/mon/mon_text.c                 |  28 +----
 drivers/usb/phy/phy-twl6030-usb.c          |   8 +-
 drivers/usb/storage/sierra_ms.c            |  16 +--
 12 files changed, 120 insertions(+), 134 deletions(-)

Cc: Alan Stern <stern@rowland.harvard.edu>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
Cc: Bryan Wu <cooloney@kernel.org>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Cristian Birsan <cristian.birsan@microchip.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>
Cc: Hema HK <hemahk@ti.com>
Cc: James Gruber <jimmyjgruber@gmail.com>
Cc: Jaswinder Singh <jaswinder.singh@linaro.org>
Cc: Julian Scheel <julian@jusst.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Pawel Laszczak <pawell@cadence.com>
Cc: Ruslan Bilovol <ruslan.bilovol@gmail.com>
Cc: Tomoki Sekiyama <tomoki.sekiyama@gmail.com>
Cc: usb-storage@lists.one-eyed-alien.net
Cc: Yadwinder Singh <yadi.brar01@gmail.com>
-- 
2.43.0.472.g3155946c3a-goog


