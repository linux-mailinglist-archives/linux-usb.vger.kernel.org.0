Return-Path: <linux-usb+bounces-31576-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2353BCCC421
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 15:23:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0DB3A30E1895
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 14:20:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D62628751D;
	Thu, 18 Dec 2025 14:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LUVWJ9bn"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8122248886;
	Thu, 18 Dec 2025 14:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766067646; cv=none; b=JsWfRRdT3rV/HoB0PGg5ZTbO6kChcGreR9IwK5Tl1fbd3MrE8pYJfrt9LxJqKAT86DrYPWmd6pvKXQj4e6aYrpzp9bsL16xPDtjf1UUzbbq5ZwBd3hBp6Ji/G1nWPsrdHc1W8a5z54GV+OHvUJlZ1RmZgWi+wPzFs+Jq2lTZ8IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766067646; c=relaxed/simple;
	bh=wF26NQBIHpeYuZsa0o8hohE86D5KBU/gDr6Nos9QJl8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VUjE26nYZa4qbpDF5/OGkDJGzRZ/b7s9/cNw8nbDAtX8VLUzcYLWkGUbGYAFBdw62+H7c3p+DSwPaxjS2QNNQ2URBHlGN2XersOF9VwEiqOL2qjqNsl98NbNDNIk9C1wm2/P/yI8nQj+Ot/XLx07QhwX5HHOlJiGNWSGuzjgrYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LUVWJ9bn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61A3DC4CEFB;
	Thu, 18 Dec 2025 14:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766067646;
	bh=wF26NQBIHpeYuZsa0o8hohE86D5KBU/gDr6Nos9QJl8=;
	h=From:To:Cc:Subject:Date:From;
	b=LUVWJ9bnnMcqIyBabbJIuvFGUnBagY2Ydg3EPGOMkyIqbzxmECrBwIdNeLjf5RmRT
	 emYzrUSh0mvoVeuxYWZpWkUZq0OWpPKg9Gx4x7az3ieiDE/TGhnsB4xVsjWV91JVKa
	 ISvVk983TvxhevXqVN2YVAYlDT0y4/O0b6Lmgm5LL4HuTJFSm3EcCoJLp30JciSJaj
	 /DpwYuSHCzxxOoOXNAZHEHv3YxoiH68X9FJp+ZXGseZWqcMSifjZeqQtCj6LUPyZVs
	 v1EnVBw7T1YrMc+tOGTQdj4TiQobgEaXDRQ5NmF6yFeYgdwUOlVPTxti7ra0h+MVkM
	 VcosordbhyHcg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vWErz-000000001YE-3lAw;
	Thu, 18 Dec 2025 15:20:44 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Ma Ke <make24@iscas.ac.cn>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/5] USB: lpc32xx: fix error handling
Date: Thu, 18 Dec 2025 15:19:40 +0100
Message-ID: <20251218141945.5884-1-johan@kernel.org>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A recent change fixing a device reference leak introduced a clock
imbalance by reusing an error path so that the clock may be disabled
before having been enabled.

The very same change could also lead to a use-after-free in case the
driver is used with non-OF probing.

This series fixes the resulting mess as well as the device leak in the
NXP OHCI driver.

Included are also two related cleanups.

Johan


Johan Hovold (5):
  usb: gadget: lpc32xx_udc: fix clock imbalance in error path
  usb: phy: isp1301: fix non-OF device reference imbalance
  usb: ohci-nxp: fix device leak on probe failure
  usb: gadget: lpc32xx_udc: clean up probe error labels
  usb: ohci-nxp: clean up probe error labels

 drivers/usb/gadget/udc/lpc32xx_udc.c | 41 ++++++++++++++--------------
 drivers/usb/host/ohci-nxp.c          | 18 ++++++------
 drivers/usb/phy/phy-isp1301.c        |  7 ++++-
 3 files changed, 36 insertions(+), 30 deletions(-)

-- 
2.51.2


