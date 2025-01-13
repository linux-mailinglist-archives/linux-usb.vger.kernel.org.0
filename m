Return-Path: <linux-usb+bounces-19233-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D0732A0B1D6
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2025 09:57:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EAC881882969
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2025 08:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAA33234977;
	Mon, 13 Jan 2025 08:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="H1k1A9KY"
X-Original-To: linux-usb@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15535231A46;
	Mon, 13 Jan 2025 08:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736758629; cv=none; b=NStcxnbhQ9sUjCM/StQuI6cdi+sH/RRdDjaQ7PrI7fG9KMZgVwXLHA0dKjCkawkH3g/Q0+RUijGpqBeERiGJWjJ2FkEXxhib3W97j9QNO21o5fEsKmKjSQHcePBEz51cLNFPvKJMJl0QTZobYBaqE6oxVvUuX2tOdZz0IV1pfE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736758629; c=relaxed/simple;
	bh=jIivlDOid38SCixZx8tOJOfsmotUaXdoMWxFWA8o910=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=reNgxW3vK+EjfFbuuuv1ObHT+AZy/fKzOAqx9khZq5MY/c3fLWq/IGFaGTFQjrk5lIAPOCC3JM3Zdpyr8HF0IY5iJR3/KIbscDMx/2bp18TU+ynKTMnO+RjWvpPHMOQ2VQOJ0t/+m87X+YKoKOuMW2YlPdbe9Cq+z8y3zbkMlS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=H1k1A9KY; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=FO5D2
	HzDbGBfa801PfrpzZ3LlPBf64aKEOl4zwSmw6U=; b=H1k1A9KYzcHzxbfznGkD0
	sqs2ik9KacfzC/SUZwLtpaTge2BohZjzSjdvpwFtDzIRG/OUfJOeMAKG9sv/UmJD
	ZdvF6LkaNyvchnzHYpyJu82XQWpzANhk8rafAUGVGYiBZVqYFH9iF9UpjfDpkdWD
	NRxGIJF7UMQsD3vBy+ULfg=
Received: from localhost.localdomain (unknown [116.128.244.169])
	by gzsmtp3 (Coremail) with SMTP id PigvCgAXfrZE1YRn5YYLJA--.46695S2;
	Mon, 13 Jan 2025 16:56:38 +0800 (CST)
From: Miao Li <limiao870622@163.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	limiao870622@163.com,
	Miao Li <limiao@kylinos.cn>
Subject: [PATCH V2] usb: quirks: Add NO_LPM quirk for TOSHIBA TransMemory-Mx device
Date: Mon, 13 Jan 2025 16:56:19 +0800
Message-Id: <20250113085619.44371-1-limiao870622@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250113075118.30007-1-limiao870622@163.com>
References: <20250113075118.30007-1-limiao870622@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgAXfrZE1YRn5YYLJA--.46695S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFW3AF1DuF1kJryxXFykuFg_yoWDtrg_ur
	1UWa93u3W8GF9IyrnFv3WfZF48K3WvvFyvga4Dta4rJF47uwn5Ja17JryqvF1UGr1DtFnr
	KrnrCw1kZr18ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRiQzs7UUUUU==
X-CM-SenderInfo: 5olpxtbryxiliss6il2tof0z/1tbiEQzTzWeE1HYVFAAAsD

From: Miao Li <limiao@kylinos.cn>

TOSHIBA TransMemory-Mx is a good performence flash device, but it
doesn't work well with LPM on Huawei hisi platform, so let's disable
LPM to resolve the issue.

Signed-off-by: Miao Li <limiao@kylinos.cn>
---
V1 -> V2: Modify the format of author's name to full name

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


