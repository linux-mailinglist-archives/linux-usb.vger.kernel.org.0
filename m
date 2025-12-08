Return-Path: <linux-usb+bounces-31278-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D94CACB38
	for <lists+linux-usb@lfdr.de>; Mon, 08 Dec 2025 10:41:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 60BAF301D612
	for <lists+linux-usb@lfdr.de>; Mon,  8 Dec 2025 09:41:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A97823246FF;
	Mon,  8 Dec 2025 09:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="JuDSyeid"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-m49201.qiye.163.com (mail-m49201.qiye.163.com [45.254.49.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24133242B0;
	Mon,  8 Dec 2025 09:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765186275; cv=none; b=JUvLxIYBi9PMfnfkmhgFzDomhmmnvLy85z1kmpurpu5EJVnA1MCY6Kc24U5flNDkeKen+Ny61CT59/NKsTIL8Rjge/dDao7iTO5Wfz8HHtDU6JH+rjuY+z0MYT90gI6ZaBNxzQRWVrxNSbqWvoFQ0Snfma5lJuGujK0FI9Rp+EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765186275; c=relaxed/simple;
	bh=pL3WTA7kUiUHbK9sk8kcP3FOQkSRClNFlwVAs7mZQFo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FyI2zvSRSA+E48wrflC2HQpy8zvRCRX7c8THziBJJis9JCgs5bPY/og4u0RDhveLmhE512MNFvbk6ANpW3rrSs5nX3P0tZCrAzu4y7UGlCTSEnJdyaJD6UPAQ1lwq1IC8E6zfgYGOesRKjXldLdcBAdU1sHSm8s0TiySJSsX860=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=JuDSyeid; arc=none smtp.client-ip=45.254.49.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Received: from server001 (unknown [222.130.22.244])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2c653529c;
	Mon, 8 Dec 2025 17:25:57 +0800 (GMT+08:00)
From: Kefan Bai <baikefan@leap-io-kernel.com>
To: linux-usb@vger.kernel.org,
	si.yanteng@linux.dev
Cc: seakeel@gmail.com,
	alexs@kernel.org,
	dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	doubled@leap-io-kernel.com
Subject: [PATCH v5 8/8] docs/zh_CN: Add CREDITS translation
Date: Mon,  8 Dec 2025 17:25:38 +0800
Message-ID: <8b77d86d6896aa23887a6a7bfc5603c54b549344.1765180570.git.baikefan@leap-io-kernel.com>
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
X-HM-Tid: 0a9afd482db109d5kunm314b94712b4edfa
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaHhkdVhoZSx8fH00ZTkxITlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlJSUlVSkhLVUlJVUlPT1lXWRYaDxIVHRRZQVlPS0hVSktJQkNDTFVKS0
	tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=JuDSyeidScuJRV9eOC2/fiOnSG2ry4hMAX21Gzr01kYaeqVz18GmjRGJ44doVOx3gbbzho45kUZl/psWV2OM33cX8rzTq6t1adE/M87JFQJWczJiWP7+GtKWywGHNmAK1ZKjGxOZNzuysElNTjL7b72lxQ7jPVJTqnebR9gjsiQ2LBrXMoa69dhYR4+KlP+GEWOF6DSscdxZXkVowyIqqaGx8W6Jxid0JXTlIxZQiMrshbPld2NA40DylYlANuAOuCJxzFR4F5UyWFL7e+ehLGuVW/Xk7fpDZVaQLtcLmiEIqSMm38sUiXZY7fLV3nFm375/uqa/JaRYHPJgVbCnJA==; s=default; c=relaxed/relaxed; d=leap-io-kernel.com; v=1;
	bh=kIpIFRgb3AvoQoLkJ9MTOPbf8FK3PA10rtW8zNLkxGM=;
	h=date:mime-version:subject:message-id:from;

Translate .../usb/CREDITS into Chinese

Update the translation through commit 7b2328c5a009
("docs: Fix typo in usb/CREDITS")

Reviewed-by: Yanteng Si <siyanteng@cqsoftware.com.cn>
Signed-off-by: Kefan Bai <baikefan@leap-io-kernel.com>
---
 Documentation/translations/zh_CN/usb/CREDITS | 153 +++++++++++++++++++
 1 file changed, 153 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/usb/CREDITS

diff --git a/Documentation/translations/zh_CN/usb/CREDITS b/Documentation/translations/zh_CN/usb/CREDITS
new file mode 100644
index 000000000000..ae8d489e62ff
--- /dev/null
+++ b/Documentation/translations/zh_CN/usb/CREDITS
@@ -0,0 +1,153 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/usb/CREDITS
+:翻译:
+
+ 白钶凡 Kefan Bai <baikefan@leap-io-kernel.com>
+
+:校译:
+
+
+
+简易版Linux USB驱动致谢名单：
+
+以下人员为USB驱动代码作出了贡献（按姓氏字母顺序排列）。
+我相信这份名单还应更长一些，但维护起来确实不易。
+如果你希望加入的话，请提交补丁。
+
+  Georg Acher <acher@informatik.tu-muenchen.de>
+  David Brownell <dbrownell@users.sourceforge.net>
+  Alan Cox <alan@lxorguk.ukuu.org.uk>
+  Randy Dunlap <randy.dunlap@intel.com>
+  Johannes Erdfelt <johannes@erdfelt.com>
+  Deti Fliegl <deti@fliegl.de>
+  ham <ham@unsuave.com>
+  Bradley M Keryan <keryan@andrew.cmu.edu>
+  Greg Kroah-Hartman <greg@kroah.com>
+  Pavel Machek <pavel@suse.cz>
+  Paul Mackerras <paulus@cs.anu.edu.au>
+  Petko Manlolov <petkan@dce.bg>
+  David E. Nelson <dnelson@jump.net>
+  Vojtech Pavlik <vojtech@suse.cz>
+  Bill Ryder <bryder@sgi.com>
+  Thomas Sailer <sailer@ife.ee.ethz.ch>
+  Gregory P. Smith <greg@electricrain.com>
+  Linus Torvalds <torvalds@linux-foundation.org>
+  Roman Weissgaerber <weissg@vienna.at>
+  <Kazuki.Yasumatsu@fujixerox.co.jp>
+
+特别感谢：
+
+  Inaky Perez Gonzalez <inaky@peloncho.fis.ucm.es>
+  感谢他发起了Linux USB驱动的开发工作，并编写了
+  大部分早期的uusbd驱动。我们从那项工作中学到
+  了很多东西。
+
+  The NetBSD & FreeBSD的USB开发者们
+  感谢他们在Linux USB邮件列表中的建议与经验分享。
+
+附加感谢：
+  以下公司与个人在硬件、支持、开发上对我们进行过捐赠与帮助
+  （摘自Inaky原始驱动中的THANKS文件）：
+
+    以下公司曾帮助我们开发Linux USB / UUSBD：
+
+        - 3Com GmbH捐赠了一台ISDN Pro TA，并在技术问题和测试设备上提供支持。
+          我从未想到能获得如此慷慨的帮助。
+
+        - USAR Systems提供了优秀的USB评估套件，使我们能够
+          测试Linux USB驱动与最新USB规范的兼容性。USAR Systems
+          认识到开源操作系统的重要性，并提供了硬件支持，感谢他们！
+
+        - 感谢英特尔提供的宝贵帮助。
+
+        - 我们与Cherry进行了合作，让Linux成为了第一个原生支持USB键盘的操作系统。
+          Cherry是全球最大的键盘制造商之一。
+
+        - CMD Technology, Inc慷慨捐赠了一块CSA-6700 PCI-to-USB控制卡，
+          用于测试OHCI实现。
+
+        - 感谢Keytronic的支持，使其键盘能够被数百万Linux用户使用。
+
+        - ing büro h doran [http://www.ibhdoran.com]!
+          在欧洲几乎买不到后置USB接口面板的主板，而我自制的版本很糟糕 ：）。
+          感谢他们提供了漂亮的USB配件！
+
+        - Genius Germany捐赠了一只USB鼠标用于测试鼠标启动协议，并提供了
+          F-23数字摇杆和NetMouse Pro。感谢！
+
+        - AVM GmbH Berlin支持我们开发Linux下的AVM ISDN控制器B1 USB驱动。
+          AVM是领先的ISDN控制器制造商，其主动式设计对包括Linux在内的
+          所有操作系统开放。
+
+        - 非常感谢Y-E Data, Inc捐赠的FlashBuster-U USB软驱，
+          使我们能够测试bulk传输代码。
+
+        - 感谢Logitech捐赠了一只三轴USB鼠标。
+
+          Logitech设计、制造并销售各种人机接口设备，
+          如键盘、鼠标、轨迹球、摄像头、扬声器及游戏控制设备。
+
+          感谢他们捐赠了USB鼠标、摇杆和扫描仪，
+          以支持Linux用户使用Logitech及其他USB设备。
+
+          Logitech亦是1999年2月11日维也纳Linux大会的官方赞助商，
+          我们在会上展示了Linux USB的最新进展。
+
+        - 感谢CATC提供了USB Inspector，用于揭示UHCI实现的内部细节。
+
+        - 感谢Entrega提供了PCI-USB转换卡、集线器和转换器产品用于开发。
+
+        - 感谢ConnectTech提供了WhiteHEAT USB转串口转换器及相关文档，
+          使得驱动得以编写。
+
+        - 感谢ADMtek提供了Pegasus与Pegasus II评估板、规格说明和开发建议。
+
+    个人感谢名单（排名不分先后）
+
+        - Oren Tirosh <orenti@hishome.net>,
+          耐心解答了我关于USB的各种疑问，并提出了许多很棒的想法。
+
+        - Jochen Karrer <karrer@wpfd25.physik.uni-wuerzburg.de>,
+          找到了致命的bug并给予了宝贵建议。
+
+        - Edmund Humemberger <ed@atnet.at>, 在公共关系与管理工作上，他
+          为Linux-USB项目付出了巨大的努力。
+
+        - Alberto Menegazzi <flash@flash.iol.it>开始编写UUSBD文档，加油！
+
+        - Ric Klaren <ia_ric@cs.utwente.nl>编写了优秀的入门文档，
+          与Alberto的作品形成良性竞争：）。
+
+        - Christian Groessler <cpg@aladdin.de>帮助解决了很多麻烦的小问题。
+
+        - Paul MacKerras改进了OHCI实现，推动了对iMac的支持，
+          并提供了大量的改进意见。
+
+        - Fernando Herrera <fherrera@eurielec.etsit.upm.es>
+          负责撰写和维护期待已久的UUSBD FAQ！
+
+        - Rasca Gmelch <thron@gmx.de>重新启用了raw驱动，
+          修复了错误并创建了uusbd-utils包。
+
+        - Peter Dettori <dettori@ozy.dec.com>疯狂地挖掘bug并提出了
+          酷炫的改进建议，太棒了！
+
+        - 自由软件与Linux社区的所有成员，
+          包括FSF、GNU项目、MIT X联盟、TeX社区等等，谢谢你们！
+
+        - 大大的感谢送给Richard Stallman和他的Emacs！
+
+        - 感谢linux-usb邮件列表的所有成员，他们阅读了那么多邮件，
+          并且提出了大量的建议！
+
+        - 感谢USB Implementers论坛成员们的帮助与支持。
+
+        - Nathan Myers <ncm@cantrip.org>，感谢他的建议！（希望你喜欢Cibeles的派对）
+
+        - 感谢Linus Torvalds创建、开发并管理Linux。
+
+        - Mike Smith, Craig Keithley, Thierry Giron和Janet Schank
+          感谢他们让我明白标准USB集线器其实并没有那么标准，
+          这有助于我们在标准集线器驱动中加入厂商特定的特性。
--
2.52.0


