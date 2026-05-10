Return-Path: <linux-usb+bounces-37195-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yM2mIpCRAGq+KQEAu9opvQ
	(envelope-from <linux-usb+bounces-37195-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 10 May 2026 16:09:20 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E170B5048A1
	for <lists+linux-usb@lfdr.de>; Sun, 10 May 2026 16:09:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 169E1300C5B8
	for <lists+linux-usb@lfdr.de>; Sun, 10 May 2026 14:09:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFFEB39B497;
	Sun, 10 May 2026 14:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="hkZhr3O0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-m127208.xmail.ntesmail.com (mail-m127208.xmail.ntesmail.com [115.236.127.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9361939A7F0;
	Sun, 10 May 2026 14:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.236.127.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778422154; cv=none; b=BwMo13h0SwFKWSiAuPkQ5U3e7FIEVCMyz2TmCoXyya3BVVmTDoCpECnFd4dJBGy8/VcSILbf5pAm8h11CPNHRFeAcPHnsA8SWRT/V8w/EkPbbQyhZqxNqI0Yk6jybT8MNRbAWdCxRMdzevXTLwOp492R81DBGDDMBN7oFqU+61o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778422154; c=relaxed/simple;
	bh=KAYdSydg8q1bOohkPcqmsg3iukY0+KMGtJ6j2Mk32lM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XL35s4qts/Hu9GlyqPtMWj6HR6nUWqsA5bwPgBXWRztU6p0/kMtA/37fqEUGMVgI4gghK3t/rDsC9Y+iDH7kXE1BPPHhW+tS0p+hdxOsvllFdyMaV3hNZsZ8eyq9iGq/dqN17+CSwv5i6Kc46y4VNs+kAJhTGNnI46vJ3lIdAeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=hkZhr3O0; arc=none smtp.client-ip=115.236.127.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Received: from server001 (unknown [222.130.22.242])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3dd2c7002;
	Sun, 10 May 2026 21:53:48 +0800 (GMT+08:00)
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
Subject: [PATCH v6 3/8] docs/zh_CN: Add authorization.rst translation
Date: Sun, 10 May 2026 21:53:34 +0800
Message-ID: <4a9617225f249a8eb996fabae5e2e447938a374d.1778415392.git.baikefan@leap-io-kernel.com>
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
X-HM-Tid: 0a9e122a645409d5kunm9f76e21d35e095
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUhXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZSh5MVkIYS00ZGUNJGh9DHVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUlVSkhLVUlJVUlPSVlXWRYaDxIVHRRZQVlPS0hVSU
	pCTkhIQ1VPVUpPS0JZBg++
DKIM-Signature: a=rsa-sha256;
	b=hkZhr3O0JFYaUuP/CPU4IcFvESdZPwyNNN+IkCODAAy+vRiq8M9j8iieNawhohhDsf1T9quXwkok6sCLL4WBe9xxE4yi67igXspB9xXqgwtN2CK/solHbqtk3LBjnOAnmP7ehiyfSMRYMPHrghYfPgvAOoHhTta4N+tLustCTDjoRhxjXvprKUNvLoqCvYV3qWY2rQ+6ay18YOWgyMjqbLUG3xwL7u3oyIwRic7hoxr/32/F+XtMkVSY2GIWRFrnhlFgzFMGqGcbCNHZx5sk6IiphWxUh4dXGV92NY7G67ZYy0C7B+T3mQ/MK2nDi4X0CjB/9uxyeoLY/RwAOJ5wUw==; s=default; c=relaxed/relaxed; d=leap-io-kernel.com; v=1;
	bh=vv0XDIJ8HdnEyR2O74jZ28zJzVMgQ+iOWlVzh2HQthw=;
	h=date:mime-version:subject:message-id:from;
X-Rspamd-Queue-Id: E170B5048A1
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
	TAGGED_FROM(0.00)[bounces-37195-lists,linux-usb=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[leap-io-kernel.com:email,leap-io-kernel.com:mid,leap-io-kernel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,cqsoftware.com.cn:email]
X-Rspamd-Action: no action

Translate .../usb/authorization.rst into Chinese

Update the translation through commit f176638af476
("USB: Remove Wireless USB and UWB documentation")

Reviewed-by: Yanteng Si <siyanteng@cqsoftware.com.cn>
Signed-off-by: Kefan Bai <baikefan@leap-io-kernel.com>
---
 .../translations/zh_CN/usb/authorization.rst  | 132 ++++++++++++++++++
 .../translations/zh_CN/usb/index.rst          |   2 +-
 2 files changed, 133 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/usb/authorization.rst

diff --git a/Documentation/translations/zh_CN/usb/authorization.rst b/Documentation/translations/zh_CN/usb/authorization.rst
new file mode 100644
index 000000000000..71153cded526
--- /dev/null
+++ b/Documentation/translations/zh_CN/usb/authorization.rst
@@ -0,0 +1,132 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/usb/authorization.rst
+:翻译:
+
+ 白钶凡 Kefan Bai <baikefan@leap-io-kernel.com>
+
+:校译:
+
+
+=============================
+授权或禁止 USB 设备连接到系统
+=============================
+
+版权 (C) 2007 Inaky Perez-Gonzalez <inaky@linux.intel.com> 英特尔公司
+
+此功能允许你控制 USB 设备是否可以在系统中使用。
+借助它，你可以完全通过用户空间实现对 USB 设备的锁定。
+
+目前，当插入一个 USB 设备时，系统会对其进行配置，其接口会立即向用户开放。
+有了这项改动，只有在 root 授权设备完成配置后，设备才可被使用。
+
+
+用法
+====
+
+授权设备接入::
+
+	$ echo 1 > /sys/bus/usb/devices/DEVICE/authorized
+
+取消对设备的授权::
+
+	$ echo 0 > /sys/bus/usb/devices/DEVICE/authorized
+
+将新连接到 ``hostX`` 的设备默认设为未授权（即锁定）::
+
+	$ echo 0 > /sys/bus/usb/devices/usbX/authorized_default
+
+解除锁定::
+
+	$ echo 1 > /sys/bus/usb/devices/usbX/authorized_default
+
+默认情况下，所有 USB 设备都是授权的。
+向 ``authorized_default`` 属性写入 ``2`` 会使内核默认只授权连接到内部
+USB 端口的设备。
+
+系统锁定示例（比较粗糙）
+------------------------
+
+假设你想实现一个锁定功能，只允许类型为 XYZ 的设备接入
+（例如某台带有外露 USB 端口的自助服务终端）::
+
+  启动系统
+  rc.local ->
+
+   for host in /sys/bus/usb/devices/usb*
+   do
+      echo 0 > $host/authorized_default
+   done
+
+给 udev 挂一个脚本，用于处理新插入的 USB 设备::
+
+ if device_is_my_type $DEV
+ then
+   echo 1 > $device_path/authorized
+ done
+
+
+``device_is_my_type()`` 才是锁定方案真正见功夫的地方。
+仅仅检查 class、type 和 protocol 是否匹配某个值，
+是你能做出的最糟糕的安全验证之一；对想绕过它的人来说，
+这反而是最容易利用的方案。如果你需要真正安全的办法，
+那就该使用加密、证书认证之类的机制。把 USB 存储设备当作
+“钥匙”的一个简单例子可以是::
+
+ function device_is_my_type()
+ {
+   echo 1 > authorized		# 暂时授权它
+                                # FIXME: 确保没人能挂载它
+   mount DEVICENODE /mntpoint
+   sum=$(md5sum /mntpoint/.signature)
+   if [ $sum = $(cat /etc/lockdown/keysum) ]
+   then
+        echo "We are good, connected"
+        umount /mntpoint
+        # 再做一些额外处理，让其他人也能使用它
+   else
+        echo 0 > authorized
+   fi
+ }
+
+
+当然，这个例子很粗糙；真正要做的话，你会想用基于 PKI 的证书校验，
+这样就不必依赖共享密钥之类的东西。不过你应该已经明白意思了。
+任何拿到设备仿真工具包的人都能伪造描述符和设备信息。
+别信这个。
+
+接口授权
+--------
+
+也有类似的方法用于允许或拒绝特定 USB 接口。
+这使得你可以只阻止某个 USB 设备中的部分接口。
+
+授权接口::
+
+	$ echo 1 > /sys/bus/usb/devices/INTERFACE/authorized
+
+取消接口授权::
+
+	$ echo 0 > /sys/bus/usb/devices/INTERFACE/authorized
+
+也可以更改特定 USB 总线上新接口的默认授权值。
+
+默认允许接口::
+
+	$ echo 1 > /sys/bus/usb/devices/usbX/interface_authorized_default
+
+默认拒绝接口::
+
+	$ echo 0 > /sys/bus/usb/devices/usbX/interface_authorized_default
+
+默认情况下，``interface_authorized_default`` 位为 ``1``，
+因此所有接口默认都处于已授权状态。
+
+注意：
+  如果把一个先前未授权的接口改为已授权，
+  则必须通过将 ``INTERFACE`` 写入 ``/sys/bus/usb/drivers_probe``
+  来手动触发驱动探测。
+
+对于需要多个接口的驱动程序，应先授权所有必需接口，
+然后再触发驱动探测。这样做可以避免副作用。
diff --git a/Documentation/translations/zh_CN/usb/index.rst b/Documentation/translations/zh_CN/usb/index.rst
index 449e8ac2dff0..a63ece18302d 100644
--- a/Documentation/translations/zh_CN/usb/index.rst
+++ b/Documentation/translations/zh_CN/usb/index.rst
@@ -18,10 +18,10 @@ USB 支持
     :maxdepth: 1

     acm
+    authorization

 Todolist:

-* authorization
 * chipidea
 * dwc3
 * ehci
--
2.54.0


