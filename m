Return-Path: <linux-usb+bounces-31277-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 46368CACB2F
	for <lists+linux-usb@lfdr.de>; Mon, 08 Dec 2025 10:41:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 73AF63073A31
	for <lists+linux-usb@lfdr.de>; Mon,  8 Dec 2025 09:37:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFF993242D8;
	Mon,  8 Dec 2025 09:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="tBur29c6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-m19731117.qiye.163.com (mail-m19731117.qiye.163.com [220.197.31.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D431B3233E8;
	Mon,  8 Dec 2025 09:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765186270; cv=none; b=nIpPeW5iDQN6ZO7AEICtJHsd53jsljKxiO1kM+PUI6p7mkX7hbp7/+e95DI1kcmnD48IqB2w7Oc94b0RTUKRuPKbSwt5uLRRSr1SXalQYmBXsEj4A5eG6e5Fw8jSLVZl0YSzrzBETdpHXpibyFlAkp8FKtNVyh9MgqNMx5AV+3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765186270; c=relaxed/simple;
	bh=quuKpzviaPcwqkyRjjIdFnn57Dl14tiK8gC4+gGOHi4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hdwIFP+WfsgIyrvn4AhxOcK8Adt+dwPvMPCWyhB/EBvsXZKL19tv18EKKSA9Xp80nFGOc1aHYw8JC37EbUVWlvsHA9t3hnnW3SAtlxGtwUReWlzK4Lt6mOj63u0ojjCG9ML3TzwMwzbPH6qZNS55RnJwTlopm/TnDugC7iIOEMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=tBur29c6; arc=none smtp.client-ip=220.197.31.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Received: from server001 (unknown [222.130.22.244])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2c6535272;
	Mon, 8 Dec 2025 17:25:49 +0800 (GMT+08:00)
From: Kefan Bai <baikefan@leap-io-kernel.com>
To: linux-usb@vger.kernel.org,
	si.yanteng@linux.dev
Cc: seakeel@gmail.com,
	alexs@kernel.org,
	dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	doubled@leap-io-kernel.com
Subject: [PATCH v5 4/8] docs/zh_CN: Add chipidea.rst translation
Date: Mon,  8 Dec 2025 17:25:34 +0800
Message-ID: <e15ed90077959a844679aaffb95dab58a62c7055.1765180570.git.baikefan@leap-io-kernel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1765180570.git.baikefan@leap-io-kernel.com>
References: <cover.1765180570.git.baikefan@leap-io-kernel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9afd480f1809d5kunm314b94712b4ea15
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCSE0ZVkgYHRpOHUNJGUlJSVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlJSUlVSkhLVUlJVUlPT1lXWRYaDxIVHRRZQVlPS0hVSktISk5MTlVKS0
	tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=tBur29c6bzmVzFjiosvacudw1/GDuvItjtnauO0jkhGy8HaYRGlI7LNQkjINV3HpsVQYyHOMFanf/CNxJu87D0uWMUu39+NiHcA8FJ1G1Pi2Y4lS7qqlQ9zLXbpYVxpavP6RGLff3j514IJSHPvHtkFmo6uwvnoIoM7dhSH84iGc5AGaXNf2urdRKZ9wOgnjqrQ/4OYRBRiCRdHmtlfUJ9Z7pEvRAOGuhiAx4wRSX4qqu2ijKc3slPxBQsvQxkEjBG1m1JLRlb3XO+KbMJDqPk/lvRAhT5nT2fGrReutlsnGZWp5vEXgoJG4Zsaq9zvLAAuV51uu6a48LctJmMU0oA==; s=default; c=relaxed/relaxed; d=leap-io-kernel.com; v=1;
	bh=MJk0vtJN4M+0j8c7OWTgS0WWMOLiu106UUQzm9FPk4U=;
	h=date:mime-version:subject:message-id:from;

Translate .../usb/chipidea.rst into Chinese

Update the translation through commit e4157519ad46
("Documentation: usb: correct spelling")

Reviewed-by: Yanteng Si <siyanteng@cqsoftware.com.cn>
Signed-off-by: Kefan Bai <baikefan@leap-io-kernel.com>
---
 .../translations/zh_CN/usb/chipidea.rst       | 142 ++++++++++++++++++
 .../translations/zh_CN/usb/index.rst          |   2 +-
 2 files changed, 143 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/usb/chipidea.rst

diff --git a/Documentation/translations/zh_CN/usb/chipidea.rst b/Documentation/translations/zh_CN/usb/chipidea.rst
new file mode 100644
index 000000000000..a902c01ee210
--- /dev/null
+++ b/Documentation/translations/zh_CN/usb/chipidea.rst
@@ -0,0 +1,142 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/usb/chipidea.rst
+:翻译:
+
+ 白钶凡 Kefan Bai <baikefan@leap-io-kernel.com>
+
+:校译:
+
+
+
+=============================
+ChipIdea高速双角色控制器驱动
+=============================
+
+1. 如何测试OTG FSM（HNP 和 SRP）
+--------------------------------
+
+接下来我们在两块Freescale i.MX6Q Sabre SD开发板上，演示如何通过sys输入文件
+来测试OTG的HNP和SRP功能。
+
+1.1 如何使能OTG FSM
+--------------------
+
+1.1.1 在menuconfig中选择CONFIG_USB_OTG_FSM，并重新编译内核
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+重新编译镜像和模块。如果需要查看OTG FSM的内部变量，可以挂载debugfs，
+会有两个文件用于显示OTG FSM变量和部分控制器寄存器值::
+
+	cat /sys/kernel/debug/ci_hdrc.0/otg
+	cat /sys/kernel/debug/ci_hdrc.0/registers
+
+1.1.2 在控制器节点的dts文件中添加以下条目
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+::
+
+	otg-rev = <0x0200>;
+	adp-disable;
+
+1.2 测试步骤
+-------------
+
+1) 给两块Freescale i.MX6Q Sabre SD开发板上电，
+   并加载gadget类驱动（例如 g_mass_storage）。
+
+2) 用USB线连接两块开发板：一端是micro A插头，另一端是micro B插头。
+
+   插入micro A插头的一端为A设备，它应当枚举另一端的B设备。
+
+3) 角色切换
+
+   在B设备上执行::
+
+	echo 1 > /sys/bus/platform/devices/ci_hdrc.0/inputs/b_bus_req
+
+   B设备应切换为host并枚举A设备。
+
+4) 把A设备切换为host
+
+   在B设备上执行::
+
+	echo 0 > /sys/bus/platform/devices/ci_hdrc.0/inputs/b_bus_req
+
+   或者通过HNP轮询机制：B-Host可以检测到A外设想成为host的意愿，
+   从而由A外设触发角色切换。在A设备上执行::
+   或者通过HNP轮询机制：B-Host可以检测到A外设想切换为host角色的意愿，
+   并通过A外设对轮询的响应来触发角色切换。
+   这可以通过在A设备上执行::
+
+	echo 1 > /sys/bus/platform/devices/ci_hdrc.0/inputs/a_bus_req
+
+   A设备应切换回host并枚举B设备。
+
+5) 拔掉B设备（拔掉micro B插头），在10秒内重新插入；
+   A设备应重新枚举B设备。
+
+6) 拔掉B设备（拔掉micro B插头），在10秒后重新插入；
+   A设备不应重新枚举B设备。
+
+   若A设备想使用总线：
+
+   在A设备上::
+
+	echo 0 > /sys/bus/platform/devices/ci_hdrc.0/inputs/a_bus_drop
+	echo 1 > /sys/bus/platform/devices/ci_hdrc.0/inputs/a_bus_req
+
+   若B设备想使用总线：
+
+   在B设备上::
+
+	echo 1 > /sys/bus/platform/devices/ci_hdrc.0/inputs/b_bus_req
+
+7) A设备关闭总线供电
+
+   在A设备上::
+
+	echo 1 > /sys/bus/platform/devices/ci_hdrc.0/inputs/a_bus_drop
+
+   A设备应断开与B设备的连接并关闭总线供电。
+
+8) B设备进行SRP数据脉冲唤醒
+
+   在B设备上::
+
+	echo 1 > /sys/bus/platform/devices/ci_hdrc.0/inputs/b_bus_req
+
+   A设备应恢复usb总线并枚举B设备。
+
+1.3 参考文档
+-------------
+《On-The-Go and Embedded Host Supplement to the USB Revision 2.0 Specification
+July 27, 2012 Revision 2.0 version 1.1a》
+
+2. 如何使能USB作为系统唤醒源
+----------------------------
+下面是在imx6平台上使能USB作为系统唤醒源的示例。
+
+2.1 使能核心控制器的唤醒功能::
+
+	echo enabled > /sys/bus/platform/devices/ci_hdrc.0/power/wakeup
+
+2.2 使能glue层的唤醒功能::
+	echo enabled > /sys/bus/platform/devices/2184000.usb/power/wakeup
+
+2.3 使能PHY的唤醒功能（可选）::
+
+	echo enabled > /sys/bus/platform/devices/20c9000.usbphy/power/wakeup
+
+2.4 使能根集线器的唤醒功能::
+	echo enabled > /sys/bus/usb/devices/usb1/power/wakeup
+
+2.5 使能相关设备的唤醒功能::
+
+	echo enabled > /sys/bus/usb/devices/1-1/power/wakeup
+
+如果系统只有一个USB端口，并且你希望在这个端口上使能USB唤醒功能，
+你可以使用下面的脚本来使能USB唤醒功能::
+
+	for i in $(find /sys -name wakeup | grep usb);do echo enabled > $i;done;
diff --git a/Documentation/translations/zh_CN/usb/index.rst b/Documentation/translations/zh_CN/usb/index.rst
index 68bf02685f99..6b7706e7df9f 100644
--- a/Documentation/translations/zh_CN/usb/index.rst
+++ b/Documentation/translations/zh_CN/usb/index.rst
@@ -19,10 +19,10 @@ USB 支持

     acm
     authorization
+    chipidea

 Todolist:

-*   chipidea
 *   dwc3
 *   ehci
 *   usbmon
--
2.52.0


