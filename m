Return-Path: <linux-usb+bounces-37204-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iE/dGG6vAGqBLgEAu9opvQ
	(envelope-from <linux-usb+bounces-37204-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 10 May 2026 18:16:46 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBD55050F4
	for <lists+linux-usb@lfdr.de>; Sun, 10 May 2026 18:16:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD9C1300B47C
	for <lists+linux-usb@lfdr.de>; Sun, 10 May 2026 16:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A52E93ACA52;
	Sun, 10 May 2026 16:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="MZEv/C7C"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-m127213.xmail.ntesmail.com (mail-m127213.xmail.ntesmail.com [115.236.127.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2F6286881;
	Sun, 10 May 2026 16:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.236.127.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778429800; cv=none; b=KE8tzMg8LcFcCftE7PN5PG+etJ+IV/4Yuh7NLkUnt22rCorhQizo8UecFyjGeaOJ8oaa1ZZSNnVnskkHQ7WGXU26japrWSPKD+w+hzBq4lCswtUPCwYnDk30eFt8CPIB+5htSTATcpAzNuIK+aiuBHe2jy7gFKc5Llo2dxJudM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778429800; c=relaxed/simple;
	bh=W3MXckDeAjvDbMIgM0BJjQc+IfgrmWuYR/G1XRDq2Gc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C9szqkI71VJ5Y6rXi9lKPFRKrUcaQOedOaYh5ztacJU4Gkc0SKHu0zyGdUud2wNk9NSjCU5Q+nyWzrZUANO99UArFtd5q16p377+mI+BdF+Z7gbyELJCYEOvRSa3RTlYZAteUCOYDwz8pSInaF9yEmmQM8khnNxHlC+aL8x02TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=MZEv/C7C; arc=none smtp.client-ip=115.236.127.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Received: from server001 (unknown [222.130.22.242])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3dd2c7000;
	Sun, 10 May 2026 21:53:47 +0800 (GMT+08:00)
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
Subject: [PATCH v6 2/8] docs/zh_CN: Add acm.rst translation
Date: Sun, 10 May 2026 21:53:33 +0800
Message-ID: <0ab199e9eafc0f7e312008063059aec4af0c65bc.1778415392.git.baikefan@leap-io-kernel.com>
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
X-HM-Tid: 0a9e122a5e3609d5kunm9f76e21d35e090
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUhXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaHR5CVh1LGhgdGkkeTh9DGVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUlVSkhLVUlJVUlPSVlXWRYaDxIVHRRZQVlPS0hVSU
	pCTkhIQ1VPVUpPS0JZBg++
DKIM-Signature: a=rsa-sha256;
	b=MZEv/C7CB4JSH1RgcDVDI/wPt1zRWBzY163EoWXCZ41ZoTUe4fKmUVFI2SIBp8gJOR/onG0O+hqQDqNuMLiOn/ZmGQGInOw46yYcP6h8E5T2+6l/v4oM6/lGlIr1BYznhU/eJOTLlLdaUOKkbe+BffxfhCqh3D8YpnaxfkKSQk6B2x3q/ACVzvxv90jc8ZnDnN3zvCeyzopEF2q6F1Et1trnrZk1r3dJnUSTjc75gxc4VCJVHH4KwFpM8M1wc3qgSm7dLktXWW+FeRIW9eV/zf8PTbHWwDertZOPE8XLChmeczagi8O9SV2BtLFdSJUTNso6ZdcvPWpXNKLzLxUurg==; s=default; c=relaxed/relaxed; d=leap-io-kernel.com; v=1;
	bh=z8Kz/UglXQNMseKL9snR729M/8TDJlt/oFofPDtWiQc=;
	h=date:mime-version:subject:message-id:from;
X-Rspamd-Queue-Id: 0BBD55050F4
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
	TAGGED_FROM(0.00)[bounces-37204-lists,linux-usb=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,leap-io-kernel.com:email,leap-io-kernel.com:mid,leap-io-kernel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Translate .../usb/acm.rst into Chinese

Update the translation through commit ecefae6db042
("docs: usb: rename files to .rst and add them to drivers-api")

Reviewed-by: Yanteng Si <siyanteng@cqsoftware.com.cn>
Signed-off-by: Kefan Bai <baikefan@leap-io-kernel.com>
---
 Documentation/translations/zh_CN/usb/acm.rst  | 136 ++++++++++++++++++
 .../translations/zh_CN/usb/index.rst          |   2 +-
 2 files changed, 137 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/usb/acm.rst

diff --git a/Documentation/translations/zh_CN/usb/acm.rst b/Documentation/translations/zh_CN/usb/acm.rst
new file mode 100644
index 000000000000..25ec83afd25f
--- /dev/null
+++ b/Documentation/translations/zh_CN/usb/acm.rst
@@ -0,0 +1,136 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/usb/acm.rst
+
+:翻译:
+
+ 白钶凡 Kefan Bai <baikefan@leap-io-kernel.com>
+
+:校译:
+
+
+=======================
+Linux ACM 驱动 v0.16
+=======================
+
+版权所有 (c) 1999 Vojtech Pavlik <vojtech@suse.cz>
+
+由 SuSE 赞助
+
+0. 免责声明
+~~~~~~~~~~~~~
+本程序是自由软件；你可以在自由软件基金会发布的 GNU 通用公共许可证第 2 版，
+或者（按你的选择）任何后续版本的条款下重新发布和/或修改它。
+
+发布本程序是希望它能发挥作用，但它不附带任何担保；甚至不包括对适销性
+或特定用途适用性的默示担保。详情见 GNU 通用公共许可证。
+
+你应该已经随本程序收到了 GNU 通用公共许可证的副本；
+如果没有，请致信：Free Software Foundation, Inc., 59
+Temple Place, Suite 330, Boston, MA 02111-1307 USA。
+
+如需联系作者，可发送电子邮件至 vojtech@suse.cz，
+或邮寄至：
+Vojtech Pavlik, Ucitelska 1576, Prague 8, 182 00, Czech Republic。
+
+为方便起见，软件包中已附带 GNU 通用公共许可证第 2 版：见 COPYING 文件。
+
+1. 使用方法
+~~~~~~~~~~~~~
+``drivers/usb/class/cdc-acm.c`` 驱动可用于符合 USB 通信设备类抽象控制模型
+（USB CDC ACM）规范的 USB 调制解调器和 USB ISDN 终端适配器。
+
+许多调制解调器支持此驱动，以下是我所知道的一些型号：
+
+	- 3Com OfficeConnect 56k
+	- 3Com Voice FaxModem Pro
+	- 3Com Sportster
+	- MultiTech MultiModem 56k
+	- Zoom 2986L FaxModem
+	- Compaq 56k FaxModem
+	- ELSA Microlink 56k
+
+我知道有一款 ISDN 终端适配器可以与 ACM 驱动一起使用：
+
+	- 3Com USR ISDN Pro TA
+
+一些手机也可以通过 USB 连接。我知道以下机型可以正常工作：
+
+	- SonyEricsson K800i
+
+遗憾的是，许多调制解调器和大多数 ISDN TA 都使用专有接口，
+因此无法与此驱动配合工作。购买前请先确认设备是否符合 ACM 规范。
+
+要使用这些调制解调器，需要加载以下模块::
+
+	usbcore.ko
+	uhci-hcd.ko ohci-hcd.ko or ehci-hcd.ko
+	cdc-acm.ko
+
+之后就应该可以访问这些调制解调器了。
+应当可以使用 ``minicom``、``ppp`` 和 ``mgetty`` 与它们通信。
+
+2. 验证驱动是否正常工作
+~~~~~~~~~~~~~~~~~~~~~~~~
+
+第一步是检查 ``/sys/kernel/debug/usb/devices``，其内容应该类似如下::
+
+  T:  Bus=01 Lev=00 Prnt=00 Port=00 Cnt=00 Dev#=  1 Spd=12  MxCh= 2
+  B:  Alloc=  0/900 us ( 0%), #Int=  0, #Iso=  0
+  D:  Ver= 1.00 Cls=09(hub  ) Sub=00 Prot=00 MxPS= 8 #Cfgs=  1
+  P:  Vendor=0000 ProdID=0000 Rev= 0.00
+  S:  Product=USB UHCI Root Hub
+  S:  SerialNumber=6800
+  C:* #Ifs= 1 Cfg#= 1 Atr=40 MxPwr=  0mA
+  I:  If#= 0 Alt= 0 #EPs= 1 Cls=09(hub  ) Sub=00 Prot=00 Driver=hub
+  E:  Ad=81(I) Atr=03(Int.) MxPS=   8 Ivl=255ms
+  T:  Bus=01 Lev=01 Prnt=01 Port=01 Cnt=01 Dev#=  2 Spd=12  MxCh= 0
+  D:  Ver= 1.00 Cls=02(comm.) Sub=00 Prot=00 MxPS= 8 #Cfgs=  2
+  P:  Vendor=04c1 ProdID=008f Rev= 2.07
+  S:  Manufacturer=3Com Inc.
+  S:  Product=3Com U.S. Robotics Pro ISDN TA
+  S:  SerialNumber=UFT53A49BVT7
+  C:  #Ifs= 1 Cfg#= 1 Atr=60 MxPwr=  0mA
+  I:  If#= 0 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=ff Driver=acm
+  E:  Ad=85(I) Atr=02(Bulk) MxPS=  64 Ivl=  0ms
+  E:  Ad=04(O) Atr=02(Bulk) MxPS=  64 Ivl=  0ms
+  E:  Ad=81(I) Atr=03(Int.) MxPS=  16 Ivl=128ms
+  C:* #Ifs= 2 Cfg#= 2 Atr=60 MxPwr=  0mA
+  I:  If#= 0 Alt= 0 #EPs= 1 Cls=02(comm.) Sub=02 Prot=01 Driver=acm
+  E:  Ad=81(I) Atr=03(Int.) MxPS=  16 Ivl=128ms
+  I:  If#= 1 Alt= 0 #EPs= 2 Cls=0a(data ) Sub=00 Prot=00 Driver=acm
+  E:  Ad=85(I) Atr=02(Bulk) MxPS=  64 Ivl=  0ms
+  E:  Ad=04(O) Atr=02(Bulk) MxPS=  64 Ivl=  0ms
+
+这三行的存在很关键（以及 ``Cls=`` 字段里出现的 ``comm`` 和 ``data`` 类）；
+它说明这是一个 ACM 设备。``Driver=acm`` 表示该设备正在使用 acm 驱动。
+如果只看到 ``Cls=ff(vend.)``，那就无能为力了：这说明你手上的设备使用的是
+厂商专有接口::
+
+    D:  Ver= 1.00 Cls=02(comm.) Sub=00 Prot=00 MxPS= 8 #Cfgs=  2
+    I:  If#= 0 Alt= 0 #EPs= 1 Cls=02(comm.) Sub=02 Prot=01 Driver=acm
+    I:  If#= 1 Alt= 0 #EPs= 2 Cls=0a(data ) Sub=00 Prot=00 Driver=acm
+
+在系统日志中应该可以看到::
+
+  usb.c: USB new device connect, assigned device number 2
+  usb.c: kmalloc IF c7691fa0, numif 1
+  usb.c: kmalloc IF c7b5f3e0, numif 2
+  usb.c: skipped 4 class/vendor specific interface descriptors
+  usb.c: new device strings: Mfr=1, Product=2, SerialNumber=3
+  usb.c: USB device number 2 default language ID 0x409
+  Manufacturer: 3Com Inc.
+  Product: 3Com U.S. Robotics Pro ISDN TA
+  SerialNumber: UFT53A49BVT7
+  acm.c: probing config 1
+  acm.c: probing config 2
+  ttyACM0: USB ACM device
+  acm.c: acm_control_msg: rq: 0x22 val: 0x0 len: 0x0 result: 0
+  acm.c: acm_control_msg: rq: 0x20 val: 0x0 len: 0x7 result: 7
+  usb.c: acm driver claimed interface c7b5f3e0
+  usb.c: acm driver claimed interface c7b5f3f8
+  usb.c: acm driver claimed interface c7691fa0
+
+如果以上都正常，请启动 ``minicom``，把它配置为连接 ``ttyACM`` 设备，
+然后尝试输入 ``at``。如果返回 ``OK``，说明一切工作正常。
diff --git a/Documentation/translations/zh_CN/usb/index.rst b/Documentation/translations/zh_CN/usb/index.rst
index 7cfe99a4dc0a..449e8ac2dff0 100644
--- a/Documentation/translations/zh_CN/usb/index.rst
+++ b/Documentation/translations/zh_CN/usb/index.rst
@@ -17,10 +17,10 @@ USB 支持
 .. toctree::
     :maxdepth: 1

+    acm

 Todolist:

-* acm
 * authorization
 * chipidea
 * dwc3
--
2.54.0


