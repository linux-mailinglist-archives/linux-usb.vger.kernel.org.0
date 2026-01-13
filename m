Return-Path: <linux-usb+bounces-32239-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B3FD17D6D
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 11:03:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6172A301EF96
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 09:59:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B8E4389448;
	Tue, 13 Jan 2026 09:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="tpsd08T3"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbg154.qq.com (smtpbg154.qq.com [15.184.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50098389DE9;
	Tue, 13 Jan 2026 09:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=15.184.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768298374; cv=none; b=j/dovn83jcIYhQV7i3aUY5+itVgaZU2/UiHsn/ZA8yGfx053wyAUzDFpnPC+Ozh0qWDvt03t+IB5r/KmNmumUHc7Y9vUkPD6SPUhtcozVzHnPgNhrXhTBFRcIm24xu3sxq0BVdr8eW921d+xYNwLK5INy9iVpVzmenb2G3zRLCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768298374; c=relaxed/simple;
	bh=bT1uQ9drhXxmD/GhPOeu6ouOD2VsmqIIY1NfWguUaJE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=doYefulyeM64NLnpDhufRCeJCYL/Nx5N6qTqblk4v62sykCHvwuFPu4sJiQBR0d++r7SHiYYlPKxoRpCm0ozSjLIV1KH/8qECCEg7/AwEW/blAfQBypW5C3jZPi1EikQR90UNtFrxXymnq1/ygOJrt6tAz9WKzwsNbrNs9fNgH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=tpsd08T3; arc=none smtp.client-ip=15.184.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1768298331;
	bh=n14gJw1sUD9px9VDJGiSaecDAuTmIrzgbdKTpKKj2bY=;
	h=From:To:Subject:Date:Message-Id;
	b=tpsd08T3hKcySI0Umw38xBCiKMGl80xlOlfJiKTTkPMYiFm0KEN0YuHooLrn1OjAX
	 fl3XEZqpC0awKOENrSGc0d+/WAE5C3mzN5HIJ25KjZ+VROYD0L4g4UdJZ8lbFKcWqB
	 l9DnLpr+KcgUwGVrU3UHkM5JVEHdiZ9I9mWfTWUM=
X-QQ-mid: zesmtpgz5t1768298326t250b0fe2
X-QQ-Originating-IP: 4rFH5EMm2c5Q2EwqWXxYK5bMdKCpUec8lIl4fJysJJk=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 13 Jan 2026 17:58:43 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2202216565104918497
From: Chaoyi Chen <kernel@airkyi.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Popescu <catalin.popescu@leica-geosystems.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	Pin-yen Lin <treapking@chromium.org>,
	=?UTF-8?q?J=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Quentin Schulz <quentin.schulz@cherry.de>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: [PATCH v2 2/2] usb: misc: onboard_dev: Add WCH CH334 USB2.0 Hub (1a86:8091)
Date: Tue, 13 Jan 2026 17:58:27 +0800
Message-Id: <20260113095827.115-3-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260113095827.115-1-kernel@airkyi.com>
References: <20260113095827.115-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: N6FMNTMYeW5JiJ0bknrkSl8L/bzD4OTla3AdjSztrvM8WyXXhntjO85y
	7lcQASPKTPrmOPcTjV50RIscNIPPfEAZPypDKZatgP2WVVo6KNbSbKVBYW0TJ0d+nSqij9F
	f8kCBSiflUPL0WLobBFJ3Zz3taiZ3HRVKz3WzYUSnpchzor3UpGAsQ5b5EohlpeJ+c0cCy0
	aPol1e0+wyjGLUkjmx0bPzA9etd0S8iW5eRjmr+asLAn7zciRB6MgrCDqTCuGjFCVs4I9Ho
	lNI+YUmkRzYfHOmch3WlFuLDYyBL4sIsJ3gDFwk8SBrtFF7uera6Fy6iN0ndzGWF4ZiJhOm
	CGqWim1qOEXxWTH/kKizLRegQjd3TCBnYtdh5UbKNbQp/LRfEaHX+NNZIfIfddYwwAMxFez
	avGixtw7lBH8zBOj/gPsjwlNSY/ODnStdK6Y/QphCcuPM04356FDyV/ARlzgBbb0vkbrwvb
	KB9T1SodQ1V+DFNM0XymoxdzAHweWctGMId/OjuL/KD/CBlWwDRasJA+8+uernuEYYSgcGK
	IRo5kfGGU85V/ddmTTG8AEtCytj21zFhQA8WzQLJO6mpKkW81EVPuCAN+Fos1iLcLJDvMBr
	AywL0z+rnPqzyYEjXi8s38gKiYf5G4BwlknsxSUOeBYfD3CLETzQYi0lDP2tq0jBksh0Pzw
	Yh8YUQ4viZpp2Oi0KWsNaaTr5zPXWCd5qx53XnhghZmJ3npk1ruRWHiz/+iZ//QUgJtVNVe
	VW8rdyVJHlGkuuTU1/BTwz6wkGs+xkRXSKWvIsIGfnMWbdyKWprnLYeR19hQJer4A1cKtmR
	l1+qC8e5T/cLa2Z8+djhk1yJFXRCZsU8n8LChGlIJcnQFzZ5XCJTI+gcdKyosBe7x+0mqxF
	S5yUlHMNYWDCDXr7L4udNI95D8lfbGJEeBcEyTzFvjPt52msxHXC9qBQqlaoCDPYkCWg3Cg
	H9WaTU/lyaVHa7w8b1c6YBBqh4xF8VD5OTGbWzJ0ZIrZY4kk/ehrVGDDYgAh3BIrxxlUQX3
	WAqmCirABmS5i2vCbtrYBU6cFV078=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

The WCH CH334/CH335[0] are USB2.0 protocol compliant 4-port USB HUB
controller chips, supporting USB2.0 high-speed and full-speed for
upstream ports, and USB2.0 high-speed 480Mbps, full-speed 12Mbps and
low-speed 1.5Mbps for downstream ports, supporting not only low-cost STT
mode (single TT schedules 4 downstream ports in time share), but also
supports high performance MTT mode (4 TTs each corresponding to 1 port,
concurrent processing).

[0]: https://www.wch-ic.com/downloads/CH334DS1_PDF.html

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 drivers/usb/misc/onboard_usb_dev.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/misc/onboard_usb_dev.h b/drivers/usb/misc/onboard_usb_dev.h
index c1462be5526d..1a1e86e60e04 100644
--- a/drivers/usb/misc/onboard_usb_dev.h
+++ b/drivers/usb/misc/onboard_usb_dev.h
@@ -115,6 +115,13 @@ static const struct onboard_dev_pdata vialab_vl817_data = {
 	.is_hub = true,
 };
 
+static const struct onboard_dev_pdata wch_ch334_data = {
+	.reset_us = 14000,
+	.num_supplies = 2,
+	.supply_names = { "vdd33", "v5" },
+	.is_hub = true,
+};
+
 static const struct onboard_dev_pdata xmos_xvf3500_data = {
 	.reset_us = 1,
 	.num_supplies = 2,
@@ -146,6 +153,7 @@ static const struct of_device_id onboard_dev_match[] = {
 	{ .compatible = "usbbda,5411", .data = &realtek_rts5411_data, },
 	{ .compatible = "usbbda,414", .data = &realtek_rts5411_data, },
 	{ .compatible = "usbbda,5414", .data = &realtek_rts5411_data, },
+	{ .compatible = "usb1a86,8091", .data = &wch_ch334_data, },
 	{ .compatible = "usb1da0,5511", .data = &parade_ps5511_data, },
 	{ .compatible = "usb1da0,55a1", .data = &parade_ps5511_data, },
 	{ .compatible = "usb2109,817", .data = &vialab_vl817_data, },
-- 
2.51.1


