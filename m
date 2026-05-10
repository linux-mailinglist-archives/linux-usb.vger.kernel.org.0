Return-Path: <linux-usb+bounces-37199-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHX1GkyWAGrUKgEAu9opvQ
	(envelope-from <linux-usb+bounces-37199-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 10 May 2026 16:29:32 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EEE50496F
	for <lists+linux-usb@lfdr.de>; Sun, 10 May 2026 16:29:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4172C300C01C
	for <lists+linux-usb@lfdr.de>; Sun, 10 May 2026 14:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 142AF39D6CC;
	Sun, 10 May 2026 14:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="RO/mBvY5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-m127219.xmail.ntesmail.com (mail-m127219.xmail.ntesmail.com [115.236.127.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28AF2FFF89;
	Sun, 10 May 2026 14:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.236.127.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778423365; cv=none; b=pEHWsqjBzPaQWvAspAhkXUQhHpD+RbxO3Bodd+uP9m81gPhydr8q5WFZOJ7V+v/ie6r6duLYGCBtOBNOvXUHhQPGLSYarXfoqFe3zT+7l41FXxkX7wyI9xt0Mid2dAhUirQuw86VVBnEo/votdYBq2+qQXSF+jUxqpN8pTilDhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778423365; c=relaxed/simple;
	bh=b+3poDEyBCNOCP9y0I+skgMbIKTLMJ2Tx/ZW2wxa3lA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k80iXMZ2s6eG/b2PbwuLipx2zMOsuLLT50L5wp/LPn5OuUlbOhH4Kk0qAS9IQ2EjBf3N9xhVdDjdqKQEdMyURnNbfihjSCk0/LOYYJXDwkfofyetmSmEr7/fpFkDHGKvfIm7chmW6aVrj49XlR9bzq58B6tSDfyY1AatE2V/MuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=RO/mBvY5; arc=none smtp.client-ip=115.236.127.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Received: from server001 (unknown [222.130.22.242])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3dd2c7003;
	Sun, 10 May 2026 21:53:50 +0800 (GMT+08:00)
From: Kefan Bai <baikefan@leap-io-kernel.com>
To: linux-usb@vger.kernel.org,
	si.yanteng@linux.dev
Cc: gregkh@linuxfoundation.org,
	seakeel@gmail.com,
	alexs@kernel.org,
	dzm91@hust.edu.cn,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	doubled@leap-io-kernel.com
Subject: [PATCH v6 4/8] docs/zh_CN: Add chipidea.rst translation
Date: Sun, 10 May 2026 21:53:35 +0800
Message-ID: <9f67e0e547f13859d3923fbcbb42a56787d0bc29.1778415392.git.baikefan@leap-io-kernel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1778415392.git.baikefan@leap-io-kernel.com>
References: <cover.1778415392.git.baikefan@leap-io-kernel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e122a6a8009d5kunm9f76e21d35e097
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUhXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZH01PVhlJSk0eTh1LSBpKQ1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUlVSkhLVUlJVUlPSVlXWRYaDxIVHRRZQVlPS0hVSU
	pCTkhIQ1VPVUpPS0JZBg++
DKIM-Signature: a=rsa-sha256;
	b=RO/mBvY5bxy+B4jvdIsJLIQpu44llcVuleDKMthnH7Y4YxYE5VHCIoDsKVURirl+MlC8WgdfVsNpC05FgVnxc8itZbqP8sqDhESRmTu3m35cW8X/bNCeSjOB9m2JBCzl1hn1kdp8v0iHA6EPYiTYgeTPd7OW82SRabfUcXQx2n931T4dYBlFFp5v3WTBepb7rDhmoQwf3UZqRRflnk0JCcP7yP1z0mTe9KQ/BeKMMm5AhUpH63vISd+PWLUlSC01+L84V7oETtv9tWaiQBK1D1QOM78m8PmD3ILT2okl7J+mwnggthUqCCqa8cHojOaKqEfbNM0BddGu8hlWgVuJJw==; s=default; c=relaxed/relaxed; d=leap-io-kernel.com; v=1;
	bh=OdUqwsFiVU/vFH6+JXKY4ZnYEMsnpOQm+1DOpMs+EVw=;
	h=date:mime-version:subject:message-id:from;
X-Rspamd-Queue-Id: 15EEE50496F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[leap-io-kernel.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[leap-io-kernel.com:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,gmail.com,kernel.org,hust.edu.cn,lwn.net,vger.kernel.org,leap-io-kernel.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-37199-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[leap-io-kernel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[baikefan@leap-io-kernel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[leap-io-kernel.com:email,leap-io-kernel.com:mid,leap-io-kernel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,cqsoftware.com.cn:email]
X-Rspamd-Action: no action

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
index 000000000000..433b3fc411fc
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
+==============================
+ChipIdea 高速双角色控制器驱动
+==============================
+
+1. 如何测试 OTG FSM（HNP 和 SRP）
+---------------------------------
+
+下面以两块 Freescale i.MX6Q Sabre SD 开发板为例，说明如何通过
+sysfs 输入文件演示 OTG 的 HNP 和 SRP 功能。
+
+1.1 如何使能 OTG FSM
+---------------------
+
+1.1.1 在 ``menuconfig`` 中选择 ``CONFIG_USB_OTG_FSM``，并重新编译内核
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+重新构建内核镜像和模块。如果想查看 OTG FSM 的一些内部变量，可以挂载
+``debugfs``；其中有两个文件可以显示 OTG FSM 变量以及部分控制器寄存器的值::
+
+	cat /sys/kernel/debug/ci_hdrc.0/otg
+	cat /sys/kernel/debug/ci_hdrc.0/registers
+
+1.1.2 在控制器节点对应的 ``dts`` 文件中添加以下条目
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+::
+
+	otg-rev = <0x0200>;
+	adp-disable;
+
+1.2 测试步骤
+-------------
+
+1) 给两块 Freescale i.MX6Q Sabre SD 开发板上电，
+   并加载 gadget 类驱动（例如 ``g_mass_storage``）。
+
+2) 用 USB 线连接两块开发板：一端是 micro A 插头，另一端是 micro B 插头。
+
+   插入 micro A 插头的一端是 A 设备，它应枚举另一端的 B 设备。
+
+3) 角色切换
+
+   在 B 设备上执行::
+
+	echo 1 > /sys/bus/platform/devices/ci_hdrc.0/inputs/b_bus_req
+
+   B 设备应接管主机角色并枚举 A 设备。
+
+4) A 设备切回主机角色
+
+   在 B 设备上执行::
+
+	echo 0 > /sys/bus/platform/devices/ci_hdrc.0/inputs/b_bus_req
+
+   或者，通过引入 HNP 轮询，B 端主机可以知道 A 端外设希望切换为主机角色，
+   因而这次角色切换也可以通过 A 端外设响应 B 端主机的轮询，在 A 侧触发。
+   这可以通过在 A 设备上执行下面的命令来完成::
+
+	echo 1 > /sys/bus/platform/devices/ci_hdrc.0/inputs/a_bus_req
+
+   A 设备应切回主机角色并枚举 B 设备。
+
+5) 拔掉 B 设备（拔掉 micro B 插头），并在 10 秒内重新插入；
+   A 设备应重新枚举 B 设备。
+
+6) 拔掉 B 设备（拔掉 micro B 插头），并在 10 秒后重新插入；
+   A 设备不应重新枚举 B 设备。
+
+   如果 A 设备希望使用总线：
+
+   在 A 设备上执行::
+
+	echo 0 > /sys/bus/platform/devices/ci_hdrc.0/inputs/a_bus_drop
+	echo 1 > /sys/bus/platform/devices/ci_hdrc.0/inputs/a_bus_req
+
+   如果 B 设备希望使用总线：
+
+   在 B 设备上执行::
+
+	echo 1 > /sys/bus/platform/devices/ci_hdrc.0/inputs/b_bus_req
+
+7) A 设备关闭总线供电
+
+   在 A 设备上执行::
+
+	echo 1 > /sys/bus/platform/devices/ci_hdrc.0/inputs/a_bus_drop
+
+   A 设备应断开与 B 设备的连接，并关闭总线供电。
+
+8) B 设备发出 SRP 数据脉冲
+
+   在 B 设备上执行::
+
+	echo 1 > /sys/bus/platform/devices/ci_hdrc.0/inputs/b_bus_req
+
+   A 设备应恢复 USB 总线并枚举 B 设备。
+
+1.3 参考文档
+-------------
+《On-The-Go and Embedded Host Supplement to the USB Revision 2.0 Specification
+July 27, 2012 Revision 2.0 version 1.1a》
+
+2. 如何将 USB 用作系统唤醒源
+----------------------------
+下面是在 i.MX6 平台上把 USB 用作系统唤醒源的示例。
+
+2.1 使能核心控制器的唤醒功能::
+
+	echo enabled > /sys/bus/platform/devices/ci_hdrc.0/power/wakeup
+
+2.2 使能 glue 层的唤醒功能::
+
+	echo enabled > /sys/bus/platform/devices/2184000.usb/power/wakeup
+
+2.3 使能 PHY 的唤醒功能（可选）::
+
+	echo enabled > /sys/bus/platform/devices/20c9000.usbphy/power/wakeup
+
+2.4 使能根集线器的唤醒功能::
+
+	echo enabled > /sys/bus/usb/devices/usb1/power/wakeup
+
+2.5 使能相关设备的唤醒功能::
+
+	echo enabled > /sys/bus/usb/devices/1-1/power/wakeup
+
+如果系统只有一个 USB 端口，而你希望在该端口上启用 USB 唤醒功能，
+可以使用下面的脚本::
+
+	for i in $(find /sys -name wakeup | grep usb);do echo enabled > $i;done;
diff --git a/Documentation/translations/zh_CN/usb/index.rst b/Documentation/translations/zh_CN/usb/index.rst
index a63ece18302d..70fe33fc37d9 100644
--- a/Documentation/translations/zh_CN/usb/index.rst
+++ b/Documentation/translations/zh_CN/usb/index.rst
@@ -19,10 +19,10 @@ USB 支持

     acm
     authorization
+    chipidea

 Todolist:

-* chipidea
 * dwc3
 * ehci
 * usbmon
--
2.54.0


