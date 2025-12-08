Return-Path: <linux-usb+bounces-31271-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1555BCACA57
	for <lists+linux-usb@lfdr.de>; Mon, 08 Dec 2025 10:26:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D650D3053FEE
	for <lists+linux-usb@lfdr.de>; Mon,  8 Dec 2025 09:26:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4495B303C94;
	Mon,  8 Dec 2025 09:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="JYWFcobK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-m3273.qiye.163.com (mail-m3273.qiye.163.com [220.197.32.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066092E7BAD;
	Mon,  8 Dec 2025 09:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765185959; cv=none; b=tCuJ33YshnDniikWsjljG2ms1mPsqj7QtSq6lslG3WNu/LuM40xnDqXbKBTn10u3mKVG0mZ1PUlgDhNEFFFmhNzX+4AuzfZPZ4uus/pDp77jP4N2vDP19hfHwBTxsD8OTdEPQbycetTZatE8QJwO/fpYvD65c8Zynu8tKXZHjVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765185959; c=relaxed/simple;
	bh=3lLb8RmZ0hczHzjT4pkBCmJZbg11KbVPJhP8DOpqqNs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EKJZCI8lGffdWalfW5dMpP6BZwskmN0IOeUwnF1Vb/cAqfiHh2H2aTvK1iG6wH6ypTu9Baz4DG33iGYC91YvgtYzfQh1UAdFsASNmC6FEE0m+zmk6Wb1HnAVTPbaC8EnpVtpC2zT+aG7qlAfoWEorT5AJiRAQuPt3VLqPmIgWSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=JYWFcobK; arc=none smtp.client-ip=220.197.32.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Received: from server001 (unknown [222.130.22.244])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2c6535263;
	Mon, 8 Dec 2025 17:25:47 +0800 (GMT+08:00)
From: Kefan Bai <baikefan@leap-io-kernel.com>
To: linux-usb@vger.kernel.org,
	si.yanteng@linux.dev
Cc: seakeel@gmail.com,
	alexs@kernel.org,
	dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	doubled@leap-io-kernel.com
Subject: [PATCH v5 3/8] docs/zh_CN: Add authorization.rst translation
Date: Mon,  8 Dec 2025 17:25:33 +0800
Message-ID: <3e5f7b678ed54a432e2bf3340b4636928276ead0.1765180570.git.baikefan@leap-io-kernel.com>
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
X-HM-Tid: 0a9afd4807e509d5kunm314b94712b4e915
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaShofVkMZHhkZHhoYTxhMQ1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlJSUlVSkhLVUlJVUlPT1lXWRYaDxIVHRRZQVlPS0hVSktISk5MTlVKS0
	tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=JYWFcobK7DTalFFbmTT4ohebF0SQwcoeMLcf7GJOz8h9QVerg5wSApYfJFFgrSgTPr9OnL+fZdVbzGMJfZjbf1jhq6dNO7YMKQ1L7A5w/k7QCfJg12R2fIZYE/aXgpjda3fP+9whnPGb8rEp9bkeyeqh9OEMbIBDtJeXnUGEb35vhxdpBlzUEZrB6J5O5Qc66+2DIEAMtXsqCDmsvm4DURJWTQ5qTI8t2CMkpBcSWMxh0yxZMgjbRC3RQmosOVW34I6E2daxTBsHufS3nWrHovuO77G7IbdCI83gyaFLC38pItrG+mAi4BgGzwByVvfpIV58tTwo+Kp0sdMe4vTQ5g==; s=default; c=relaxed/relaxed; d=leap-io-kernel.com; v=1;
	bh=Q9sDJpFQWwYGCZEmDpOvf047JMrv9TE30fn4EnhU/pM=;
	h=date:mime-version:subject:message-id:from;

Translate .../usb/authorization.rst into Chinese

Update the translation through commit f176638af476
("USB: Remove Wireless USB and UWB documentation")

Reviewed-by: Yanteng Si <siyanteng@cqsoftware.com.cn>
Signed-off-by: Kefan Bai <baikefan@leap-io-kernel.com>
---
 .../translations/zh_CN/usb/authorization.rst  | 125 ++++++++++++++++++
 .../translations/zh_CN/usb/index.rst          |   2 +-
 2 files changed, 126 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/usb/authorization.rst

diff --git a/Documentation/translations/zh_CN/usb/authorization.rst b/Documentation/translations/zh_CN/usb/authorization.rst
new file mode 100644
index 000000000000..4a8b743480ae
--- /dev/null
+++ b/Documentation/translations/zh_CN/usb/authorization.rst
@@ -0,0 +1,125 @@
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
+===========================
+授权或禁止USB设备连接到系统
+===========================
+
+版权 (C) 2007 Inaky Perez-Gonzalez <inaky@linux.intel.com> 英特尔公司
+
+此功能允许你控制系统中USB设备的使用权限。
+你可以借此实现USB设备的锁定，并由用户空间完全控制。
+
+目前为止，当插入一个USB设备时，系统会配置该USB设备，其接口会立即对用户开放。
+通过此修改，只有在root授权配置设备后，用户才能使用它。
+
+
+使用方法
+=========
+
+授权设备连接::
+
+	$ echo 1 > /sys/bus/usb/devices/DEVICE/authorized
+
+禁止设备连接::
+	$ echo 0 > /sys/bus/usb/devices/DEVICE/authorized
+
+将新连接到hostX的设备默认设置为未授权（即：锁定）::
+
+	$ echo 0 > /sys/bus/usb/devices/usbX/authorized_default
+
+解除锁定::
+
+	$ echo 1 > /sys/bus/usb/devices/usbX/authorized_default
+
+默认情况下，所有USB设备都是授权的。
+向authorized_default属性写入 "2" 会使内核默认只授权连接到内部USB端口的设备。
+
+系统锁定示例（简单示例）
+------------------------
+
+假设你想实现一个锁定功能，要求只有类型为XYZ的设备可以连接
+（例如，它是一个带有可见USB端口的自助服务终端）::
+
+  启动系统
+  rc.local ->
+
+   for host in /sys/bus/usb/devices/usb*
+   do
+      echo 0 > $host/authorized_default
+   done
+
+将一个脚本挂接到udev，当插入新的USB设备时，该脚本就会被自动触发::
+
+ if device_is_my_type $DEV
+ then
+   echo 1 > $device_path/authorized
+ done
+
+
+这里的device_is_my_type()就是实现锁定的关键所在。
+仅仅检查class、type 和protocol是否匹配某个值，
+是最差的安全验证方式（但对于想要破解的人却是最容易的）。
+如果你需要真正安全的方案，应使用加密、证书认证等手段。
+一个针对存储密钥的简单示例::
+
+ function device_is_my_type()
+ {
+   echo 1 > authorized		# 暂时授权它
+                                # FIXME: 确保没有人能够挂载它
+   mount DEVICENODE /mntpoint
+   sum=$(md5sum /mntpoint/.signature)
+   if [ $sum = $(cat /etc/lockdown/keysum) ]
+   then
+        echo "We are good, connected"
+        umount /mntpoint
+        # 添加一些额外的内容，以便其他人也可以使用它
+   else
+        echo 0 > authorized
+   fi
+ }
+
+
+当然，这种做法很简陋；实际上你应该使用基于PKI的真正证书验证，
+这样就不会依赖共享密钥之类的东西。不过你明白我的意思。
+任何拿到设备仿真工具包的人都能伪造描述符和设备信息。
+所以千万不要信任这些信息。
+
+接口授权
+--------
+
+也有类似的方法用于允许或拒绝特定USB接口。这允许只阻止USB设备的一个子集。
+
+授权接口::
+
+	$ echo 1 > /sys/bus/usb/devices/INTERFACE/authorized
+
+取消授权接口::
+
+	$ echo 0 > /sys/bus/usb/devices/INTERFACE/authorized
+
+也可以更改新接口在特定USB总线上的默认值。
+
+默认允许接口::
+
+	$ echo 1 > /sys/bus/usb/devices/usbX/interface_authorized_default
+
+默认拒绝接口::
+	$ echo 0 > /sys/bus/usb/devices/usbX/interface_authorized_default
+
+默认情况下，interface_authorized_default位为1。
+因此，所有接口默认都是授权的。
+
+注意：
+  如果要对一个未授权的接口进行授权，则必须通过将INTERFACE写入
+  /sys/bus/usb/drivers_probe来手动触发驱动程序进行探测。
+  对于使用多个接口的驱动程序，需要先对所有使用的接口进行授权。
+  之后应探测驱动程序。这样做可以避免副作用。
diff --git a/Documentation/translations/zh_CN/usb/index.rst b/Documentation/translations/zh_CN/usb/index.rst
index fa7caf75eb8a..68bf02685f99 100644
--- a/Documentation/translations/zh_CN/usb/index.rst
+++ b/Documentation/translations/zh_CN/usb/index.rst
@@ -18,10 +18,10 @@ USB 支持
     :maxdepth: 1

     acm
+    authorization

 Todolist:

-*   authorization
 *   chipidea
 *   dwc3
 *   ehci
--
2.52.0


