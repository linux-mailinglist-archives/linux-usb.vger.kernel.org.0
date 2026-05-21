Return-Path: <linux-usb+bounces-37860-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIEEJMnbDmrmCgYAu9opvQ
	(envelope-from <linux-usb+bounces-37860-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 12:17:45 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A61A5A31EC
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 12:17:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9142530F4112
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 10:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB593384CDA;
	Thu, 21 May 2026 10:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="DSgJPL8N"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-m1973187.qiye.163.com (mail-m1973187.qiye.163.com [220.197.31.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7FD383339;
	Thu, 21 May 2026 10:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779357647; cv=none; b=cZ3MMI+yFE1CC4jRgF135w7PbydhkPbpLysf4pBrz6q+xAOg04qkkZiTr+zk2As+U+9+JhiS4IH8uPB7u7/b7p/xPT/zImJ1/MV3YWaEgPat6hopAUBL6q3NrwTRJXYO39nRfN6lM81LLZyTMiF7yLIh1H02he/ynDYf1nZkOrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779357647; c=relaxed/simple;
	bh=KRxTIOUjIexLfKP3OZOgHBgHd7PVT1QML4v8D6K1IKo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O5focmGDh4uo2aH5WRzouXp37mQ6RedHdQ2w/+CTGhd/rQr7LVYErufkBWWGMV2Od4iYmzLgWpSl9ze55X0U5ctGJ428cD1wjRe2d8972DcC7+eVdzda+CyCQk4vFA6RKBY3RjL+H1IfNnGVu4eoq0t8KBTMzuWfREHfGTMbnNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=DSgJPL8N; arc=none smtp.client-ip=220.197.31.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Received: from server001 (unknown [222.130.22.242])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3f4cebaff;
	Thu, 21 May 2026 17:55:22 +0800 (GMT+08:00)
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
Subject: [PATCH v7 5/8] docs/zh_CN: Add dwc3.rst translation
Date: Thu, 21 May 2026 17:55:10 +0800
Message-ID: <1fd5678e36ebeb4f37e224a59136ef4f4dcc8340.1779355170.git.baikefan@leap-io-kernel.com>
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
X-HM-Tid: 0a9e49f60d0709d5kunm49815c9e65c9a
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDTBodVk5NTUNPGUwZHUMZH1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUlVSkhLVUlJVUlPSVlXWRYaDxIVHRRZQVlPS0hVSk
	tISk5MTlVKS0tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=DSgJPL8Ni7McqUESoJw/cPXbKfVVZOSfHAIADmXRp0s4D/rO7XkJ3OURFDUV43jEt4afGOf7VMNeBlHBSsuRdMHkQGGhoD3VUwagCVrnoXI6en1GNYLATniEWotjiiT2FHD0p+/+iK8tnwJzPdJxkkUaGgz77konnuVQ4Ut++95V3xP/3kqxX2Ac5uBBzafi8HZzwPFFpbiK9W0QfWSXtReT0PzDHA21ahZ36u2TPR4mwfhalpfPEvzBp5RKJ3mhqhNDVqU50mZgWQ9i2KLH1lBeQfmuo5H9eAmV1zZlHJuHaWN5Qhb1qaXr5PuWLIUE1SMc2WL5EbReoH3oezj6kg==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=e9o5649fqTmSCjXx6OFnrGLYW+RiulY3hU4tzlocNKk=;
	h=date:mime-version:subject:message-id:from;
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[leap-io-kernel.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[leap-io-kernel.com:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,gmail.com,kernel.org,hust.edu.cn,lwn.net,vger.kernel.org,leap-io-kernel.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-37860-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[leap-io-kernel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[baikefan@leap-io-kernel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cqsoftware.com.cn:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 8A61A5A31EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Translate .../usb/dwc3.rst into Chinese

Update the translation through commit ecefae6db042
("docs: usb: rename files to .rst and add them to drivers-api")

Reviewed-by: Yanteng Si <siyanteng@cqsoftware.com.cn>
Signed-off-by: Kefan Bai <baikefan@leap-io-kernel.com>
---
 Documentation/translations/zh_CN/usb/dwc3.rst | 63 +++++++++++++++++++
 .../translations/zh_CN/usb/index.rst          |  2 +-
 2 files changed, 64 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/usb/dwc3.rst

diff --git a/Documentation/translations/zh_CN/usb/dwc3.rst b/Documentation/translations/zh_CN/usb/dwc3.rst
new file mode 100644
index 000000000000..3468ce50c5ba
--- /dev/null
+++ b/Documentation/translations/zh_CN/usb/dwc3.rst
@@ -0,0 +1,63 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/usb/dwc3.rst
+
+:翻译:
+
+ 白钶凡 Kefan Bai <baikefan@leap-io-kernel.com>
+
+:校译:
+
+
+=========
+DWC3 驱动
+=========
+
+
+待办
+~~~~
+
+阅读时如果想顺手认领点任务，可以从下面挑一项 :)
+
+- 将中断处理程序改为每个端点各自使用线程化 IRQ
+
+  事实证明，有些 DWC3 命令大约需要 ``~1 ms`` 才能完成。
+  当前代码会一直自旋等待命令完成，这种设计并不好。
+
+  实现思路：
+
+  - DWC 核心实现了一个按端点对中断进行解复用的 IRQ 控制器。
+    中断号在探测（``probe``）阶段分配，并归属于该设备。
+    如果硬件通过 ``MSI`` 为每个端点提供独立中断，
+    那么这个“虚拟”IRQ 控制器就可以被真实的端点中断取代。
+
+  - 在调用 ``usb_ep_enable()`` 时请求并分配中断资源，
+    在调用 ``usb_ep_disable()`` 时释放中断资源。
+    最坏情况下需要 32 个中断，最少是 ``ep0/1`` 的两个中断。
+  - ``dwc3_send_gadget_ep_cmd()`` 将在 ``wait_for_completion_timeout()``
+    中休眠，直到命令完成。
+  - 中断处理程序分为以下几个部分：
+
+    - 设备级主中断处理程序
+      遍历每个事件，并对其调用 ``generic_handle_irq()``。
+      从 ``generic_handle_irq()`` 返回后，确认事件计数器，使中断最终消失。
+
+    - 设备级线程化处理程序
+      无。
+
+    - 端点中断的主处理程序
+      读取事件并尽量处理它。凡是需要睡眠的操作都交给线程处理。
+      事件保存在每个端点的数据结构中。
+      还要注意，一旦把某项工作交给线程处理，
+      就不要再在主处理程序里处理它，
+      以免出现优先级反转之类的问题。
+
+    - 端点中断的线程化处理程序
+      处理剩余的端点工作，这些工作可能会睡眠，例如等待命令完成。
+
+  延迟:
+
+   不应增加延迟，因为中断线程具有较高优先级，
+   会在普通用户态任务之前运行
+   （除非用户更改了调度优先级）。
diff --git a/Documentation/translations/zh_CN/usb/index.rst b/Documentation/translations/zh_CN/usb/index.rst
index e6d0a4fceff7..7c739627077b 100644
--- a/Documentation/translations/zh_CN/usb/index.rst
+++ b/Documentation/translations/zh_CN/usb/index.rst
@@ -20,10 +20,10 @@ USB 支持
     acm
     authorization
     chipidea
+    dwc3

 Todolist:

-* dwc3
 * ehci
 * usbmon
 * functionfs
--
2.54.0


