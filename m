Return-Path: <linux-usb+bounces-37862-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKC5LffZDmrPCgYAu9opvQ
	(envelope-from <linux-usb+bounces-37862-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 12:09:59 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF5A5A2FC1
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 12:09:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7925A30CC9C4
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 10:02:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD85938332A;
	Thu, 21 May 2026 10:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="PqmSQ0hA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-m19731109.qiye.163.com (mail-m19731109.qiye.163.com [220.197.31.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A343383333;
	Thu, 21 May 2026 10:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.109
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779357650; cv=none; b=EMfGZ5Ulwwe0L6zA/PySmCxJJAOx9GyGsxX1wZvLfSwtyl7L4pqTi9sDGHOQGhZBP4UyX5GEsiXghmUGxHhxkS1d8kIVrR0xB+PZXe/44lKtaQmVx3EzUvASt9jWom8pWOBWquLPQjiL7W01nUhR9H/JlWGlgNfhtEJ0X3AX9DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779357650; c=relaxed/simple;
	bh=q4Nd4g86OVyRsmXyqsdRUlITwX42dLTgDg9h++XMzAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NXCWRtUq5HT3GhxVgHHYB4pQdbzp1UiK9y3kFIJGhJrcFo0kHnpz8Bw3/Kqwi7Qy9OyjcdfrtUYdbW4aWU1IM+T0hibijjCcXS2b9feHj/sqiMjuFsmtvsasCuPcXA99uPhtEaFBYF8y09QLQdUZOkdhNV/xXEDY2jd/t53Ks3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=PqmSQ0hA; arc=none smtp.client-ip=220.197.31.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Received: from server001 (unknown [222.130.22.242])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3f4cebb11;
	Thu, 21 May 2026 17:55:25 +0800 (GMT+08:00)
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
Subject: [PATCH v7 8/8] docs/zh_CN: Add CREDITS translation
Date: Thu, 21 May 2026 17:55:13 +0800
Message-ID: <634084009a0833a70efd269229919476ffe81b22.1779355170.git.baikefan@leap-io-kernel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1779355170.git.baikefan@leap-io-kernel.com>
References: <cover.1779355170.git.baikefan@leap-io-kernel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e49f6183109d5kunm49815c9e65cb7
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCHkJJVk5NSEwdGh5OHkhPSlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUlVSkhLVUlJVUlPSVlXWRYaDxIVHRRZQVlPS0hVSk
	tJQkNDTFVKS0tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=PqmSQ0hARSbARSpIoUBIwAfDj56IKDRNDFR4C90eSXm1KeiTA/iBZSuA1XJUPUSHxVtZa3ZIIlJe3ZIcoULRnItmhcEdltoRwyQS0gYfq+dBuwfiSYgOujpNjzfYqYvcSbosk2gLLdnKFbGE+UvJ8WEWDdb81ILvQrCLXSnxyPS/Enx2eW7JnIRmUhr0J4CXcqrj1bCEbeAnHYDQzFih3WO5UDPJM6TI/zR704HGkuX4vqng+s68thTQBRwKzOF5pGcLOP8+3nXNWfROQ/6Bg7OtA5VSd0lRYx5Liux86O/+ycZ3ktNVVsP6nIMJdWlyFo5zIGCq8T1StZNzTN3bkQ==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=eJ7Mk4dT0iryUbzjIwTC89RoXiislC6Dm4WJZ1Q0MiI=;
	h=date:mime-version:subject:message-id:from;
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[leap-io-kernel.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[leap-io-kernel.com:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,gmail.com,kernel.org,hust.edu.cn,lwn.net,vger.kernel.org,leap-io-kernel.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-37862-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[leap-io-kernel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[baikefan@leap-io-kernel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: CBF5A5A2FC1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Translate .../usb/CREDITS into Chinese

Update the translation through commit 7b2328c5a009
("docs: Fix typo in usb/CREDITS")

Reviewed-by: Yanteng Si <siyanteng@cqsoftware.com.cn>
Signed-off-by: Kefan Bai <baikefan@leap-io-kernel.com>
---
 Documentation/translations/zh_CN/usb/CREDITS | 163 +++++++++++++++++++
 1 file changed, 163 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/usb/CREDITS

diff --git a/Documentation/translations/zh_CN/usb/CREDITS b/Documentation/translations/zh_CN/usb/CREDITS
new file mode 100644
index 000000000000..c133b1a5daff
--- /dev/null
+++ b/Documentation/translations/zh_CN/usb/CREDITS
@@ -0,0 +1,163 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/usb/CREDITS
+
+:翻译:
+
+ 白钶凡 Kefan Bai <baikefan@leap-io-kernel.com>
+
+:校译:
+
+
+简易 Linux USB 驱动的致谢名单：
+
+以下人员都为 Linux USB 驱动代码作出了贡献
+（按姓氏字母顺序排列）。我相信这份名单本应
+更长一些，但确实不容易维护。
+如需将自己加入名单，请提交补丁。
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
+  感谢他发起了 Linux USB 驱动开发工作，并编写了体量较大的 uusbd
+  驱动中的大部分代码。我们从那项工作中学到了很多。
+
+  NetBSD 和 FreeBSD 的 USB 开发者们
+  感谢他们加入 Linux USB 邮件列表，提供建议并分享实现经验。
+
+附加感谢：
+  还要感谢以下公司与个人在硬件、支持、时间投入和开发方面提供的捐赠与帮助
+  （摘自 Inaky 驱动原始的 THANKS 文件）：
+
+    以下公司曾帮助我们开发 Linux USB / UUSBD：
+
+        - 3Com GmbH 捐赠了一台 ISDN Pro TA，并在技术问题和测试设备方面为我
+          提供支持。没想到能得到这么大的帮助。
+
+        - USAR Systems 向我们提供了他们出色的 USB 评估套件，
+          使我们能够测试 Linux USB 驱动对最新 USB 规范的符合性。
+          USAR Systems 认识到保持开放操作系统与时俱进的重要性，
+          并以硬件支持这个项目。感谢！
+
+        - 感谢英特尔提供的宝贵帮助。
+
+        - 我们与 Cherry 合作，使 Linux 成为首个内置 USB 支持的操作系统。
+          Cherry 是全球最大的键盘制造商之一。
+
+        - CMD Technology, Inc. 慷慨捐赠了一块 CSA-6700 PCI-to-USB
+          控制卡，用于测试 OHCI 实现。
+
+        - 由于他们对我们的支持，Keytronic 可以放心，
+          他们的键盘能卖给至少 300 万 Linux 用户中的一部分。
+
+        - ing büro h doran [http://www.ibhdoran.com]!
+          在欧洲，想给主板买一个 PC 背板 USB 连接器几乎是不可能的
+          （我自己做的那个相当糟糕 :)）。现在我知道该去哪里买漂亮的 USB
+          配件了！
+
+        - Genius Germany 捐赠了一只 USB 鼠标，用于测试鼠标启动协议；
+          他们还捐赠了 F-23 数字摇杆和 NetMouse Pro。感谢！
+
+        - AVM GmbH Berlin 支持我们开发 Linux 下的 AVM ISDN Controller B1 USB 驱动。
+          AVM 是领先的 ISDN 控制器制造商，其主动式设计对包括 Linux 在内的
+          所有操作系统平台开放。
+
+        - 非常感谢 Y-E Data, Inc 捐赠的 FlashBuster-U USB 软驱，
+          使我们能够测试批量传输代码。
+
+        - 感谢 Logitech 捐赠了一只三轴 USB 鼠标。
+
+          Logitech 负责设计、制造并销售各种人机接口设备，
+          在键盘、鼠标、轨迹球、摄像头、扬声器，以及面向游戏和专业用途的
+          控制设备方面拥有悠久历史和丰富经验。
+
+          作为这些设备广为人知的供应商和销售商，他们捐赠了 USB 鼠标、
+          摇杆和扫描仪，以表明 Linux 的重要性，也让 Logitech 的客户
+          能在自己喜欢的操作系统上获得支持，并让所有 Linux 用户都能使用
+          Logitech 以及其他 USB 硬件。
+
+          Logitech 也是 1999 年 2 月 11 日维也纳 Linux 大会的官方赞助商，
+          我们将在会上展示 Linux USB 工作的最新进展。
+
+        - 感谢 CATC 提供 USB Inspector，帮助我们揭开 UHCI 内部实现中
+          那些不为人知的角落。
+
+        - 感谢 Entrega 为开发工作提供 PCI 转 USB 卡、集线器和转换器产品。
+
+        - 感谢 ConnectTech 提供 WhiteHEAT USB 转串口转换器以及相关文档，
+          让这个驱动得以写成。
+
+        - 感谢 ADMtek 提供 Pegasus 和 Pegasus II 评估板、规格说明，
+          以及驱动开发过程中的宝贵建议。
+
+    另外还要感谢以下个人（嘿，顺序不分先后 :)）
+
+        - Oren Tirosh <orenti@hishome.net>,
+          他非常耐心地听我唠叨各种 USB 疑问，还给了很多很酷的想法。
+
+        - Jochen Karrer <karrer@wpfd25.physik.uni-wuerzburg.de>,
+          指出了致命 bug，并给出了宝贵建议。
+
+        - Edmund Humemberger <ed@atnet.at>，他在公共关系与项目管理方面
+          为 Linux-USB 项目付出了巨大的努力。
+
+        - Alberto Menegazzi <flash@flash.iol.it> 正在着手编写 UUSBD 文档，加油！
+
+        - Ric Klaren <ia_ric@cs.utwente.nl> 编写了很好的入门文档，
+          与 Alberto 的作品形成良性竞争：）。
+
+        - Christian Groessler <cpg@aladdin.de>，感谢他在那些棘手细节上的帮助。
+
+        - Paul MacKerras 改进了 OHCI 实现，推动了对 iMac 的支持，
+          并提供了大量的改进意见。
+
+        - Fernando Herrera <fherrera@eurielec.etsit.upm.es>
+          负责撰写、维护并不断补充那份期待已久、独一无二又精彩的
+          UUSBD FAQ！太棒了！
+
+        - Rasca Gmelch <thron@gmx.de> 重新启用了 raw 驱动，
+          指出了一些错误，并启动了 uusbd-utils 软件包。
+
+        - Peter Dettori <dettori@ozy.dec.com>，像疯了一样挖掘 bug，
+          还提出了很多很酷的建议，太棒了！
+
+        - 自由软件与 Linux 社区的所有成员，包括 FSF、GNU 项目、
+          MIT X 联盟、TeX 社区等等，谢谢你们！
+
+        - 特别感谢 Richard Stallman 创造了 Emacs！
+
+        - 感谢 linux-usb 邮件列表的所有成员，读了那么多邮件——不开玩笑了，
+          感谢你们提出的所有建议！
+
+        - 感谢 USB Implementers Forum 成员们的帮助与支持。
+
+        - Nathan Myers <ncm@cantrip.org>，感谢他的建议！
+          （希望你喜欢 Cibeles 的派对。）
+
+        - 感谢 Linus Torvalds 创建、开发并管理 Linux。
+
+        - Mike Smith、Craig Keithley、Thierry Giron 和 Janet Schank
+          感谢他们让我认识到标准 USB 集线器其实也没那么“标准”，
+          这有助于我们在标准集线器驱动中加入厂商特定的特殊处理。
--
2.54.0


