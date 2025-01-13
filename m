Return-Path: <linux-usb+bounces-19230-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A27A0B04C
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2025 08:51:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21C6E1660CA
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2025 07:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5B7E23236C;
	Mon, 13 Jan 2025 07:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="KGBC58TK"
X-Original-To: linux-usb@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B33C28FD;
	Mon, 13 Jan 2025 07:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736754697; cv=none; b=sMxQ29MOhqHUyUeWY4PwsYAZu4gqo9Q/HxUYko8EsXRx9yvFYOO0tAdO8TuTPolA8DjLRSe9TTdcjW1x7KWd/cBgqn+Yd6CQGgR20yxOivUAWjdakybwBlquSWbC65Q1hTTLEuaXgdz8wV+15HUr2SKUgnlRJQN8loR082RQJg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736754697; c=relaxed/simple;
	bh=N0mCP+2ZFP9s1WPktJkkbwuEEoZnIYrp1Yx/J/pvDlk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Z5vZ0RdDq/DZGmkMkXIw0gj6LGvzy8XAQPI3t8daF/ssMzXB+7SkNGGVJNXCgkcg39bIRlNaQ55eig35DHyBgH+kugpAKRbow7PsZcJDxJw8CCOIGD46mKhT3dPDhpLho91LlRXNJ0s72LHEQt//ZGH6c3pD43TjBH/gHbG2H8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=KGBC58TK; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=FpoFc
	K7G8rD8MXdXY6aAKIfhs5YiMLTt9E0lkQrKOvA=; b=KGBC58TKAUQClBooEGiAc
	0bXJIUHepJamS73lwzOwi9qdFrFj/I8vuwwunbmgE5VNuOQCXRKc5zGhtGoD9Hy9
	ONFXdnIV7vN3XmIzocrE5G4/JebFOIFPmzv5kUINDS/ktBJOyzqbaAjkPwFhtPSP
	7FAeCb2b7HwG9GDhmQN+0M=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3_+v5xYRnCa+mFw--.2000S2;
	Mon, 13 Jan 2025 15:51:22 +0800 (CST)
From: limiao <limiao870622@163.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	limiao870622@163.com,
	limiao <limiao@kylinos.cn>
Subject: [PATCH] usb: quirks: Add NO_LPM quirk for TOSHIBA TransMemory-Mx device
Date: Mon, 13 Jan 2025 15:51:18 +0800
Message-Id: <20250113075118.30007-1-limiao870622@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3_+v5xYRnCa+mFw--.2000S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFW3AF1DuF1kJryxGw45KFg_yoWDWFg_ur
	1UWa93u3W8CF9xJFnFv3WfZr48K3Wv9Fyvgas8ta4rJF4Uuw1rJa17JrWqvF1UJr1DtFnr
	KrsrCw1kZrW8ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRimLv5UUUUU==
X-CM-SenderInfo: 5olpxtbryxiliss6il2tof0z/1tbiRQvTzWeEsIUACQABsO

From: limiao <limiao@kylinos.cn>

TOSHIBA TransMemory-Mx is a good performence flash device, but it
doesn't work well with LPM on Huawei hisi platform, so let's disable
LPM to resolve the issue.

Signed-off-by: limiao <limiao@kylinos.cn>
---
 drivers/usb/core/quirks.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index 13171454f959..67732c791c93 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -394,6 +394,9 @@ static const struct usb_device_id usb_quirk_list[] = {
 	/* Kingston DataTraveler 3.0 */
 	{ USB_DEVICE(0x0951, 0x1666), .driver_info = USB_QUIRK_NO_LPM },
 
+	/* TOSHIBA TransMemory-Mx */
+	{ USB_DEVICE(0x0930, 0x1408), .driver_info = USB_QUIRK_NO_LPM },
+
 	/* NVIDIA Jetson devices in Force Recovery mode */
 	{ USB_DEVICE(0x0955, 0x7018), .driver_info = USB_QUIRK_RESET_RESUME },
 	{ USB_DEVICE(0x0955, 0x7019), .driver_info = USB_QUIRK_RESET_RESUME },
-- 
2.25.1


