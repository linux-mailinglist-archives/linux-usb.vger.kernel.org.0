Return-Path: <linux-usb+bounces-31272-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C943CACA4E
	for <lists+linux-usb@lfdr.de>; Mon, 08 Dec 2025 10:26:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 893CD30194C9
	for <lists+linux-usb@lfdr.de>; Mon,  8 Dec 2025 09:26:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 874AF30F92C;
	Mon,  8 Dec 2025 09:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="Zd50LU2/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-m3278.qiye.163.com (mail-m3278.qiye.163.com [220.197.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5452E2E173F;
	Mon,  8 Dec 2025 09:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765185965; cv=none; b=r7IGa84fYNgSqmEybh/MxCJ9uYVw2xlYYeWSO3IVsGtAUSW+p98XEpBexEB+xFw2ngy25sgyToIW2nulGYEACgwNMsoulUseEQOsqbX87GcE4dAipBHWNeB6I1x1TklQZuvHsIyB1QZKLvAsJ9NGYg0MTkKqSGgJkLSqQpZkhkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765185965; c=relaxed/simple;
	bh=/pdtbe3ONhgrRVBxiqIPqrBz2FOcbqKWg6iW4Wzylyw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=otBgPFvmRG4EXPmZIBfFoS9whhCYscZFQGz+zQf8+PuleYAfVeL4vcPyZaHVHeQAY0Do2XhAzcWzvlqyskhnvVwF+oSRY/fDFlQ6UPn8PkYp2B57LDaKKvdxcC5srJgrX1xICmGSZhGFJZwqFHKjjJ6zdKPP2jstkIuVKvzQ3do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=Zd50LU2/; arc=none smtp.client-ip=220.197.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Received: from server001 (unknown [222.130.22.244])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2c653527c;
	Mon, 8 Dec 2025 17:25:51 +0800 (GMT+08:00)
From: Kefan Bai <baikefan@leap-io-kernel.com>
To: linux-usb@vger.kernel.org,
	si.yanteng@linux.dev
Cc: seakeel@gmail.com,
	alexs@kernel.org,
	dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	doubled@leap-io-kernel.com
Subject: [PATCH v5 5/8] docs/zh_CN: Add dwc3.rst translation
Date: Mon,  8 Dec 2025 17:25:35 +0800
Message-ID: <2db4262245b49fcc25e50f2f82ad7a617c04a32f.1765180570.git.baikefan@leap-io-kernel.com>
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
X-HM-Tid: 0a9afd4815df09d5kunm314b94712b4eb99
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaThkfVh9LSUlKSUIYSExJGFYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlJSUlVSkhLVUlJVUlPT1lXWRYaDxIVHRRZQVlPS0hVSktISk5MTlVKS0
	tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=Zd50LU2/Xdmm9bV3rkvq02k2x04lC0PxqWjc+/qJGWcuTF9rILSxJLJUMsbFd1+g+XZICUhzMmc875PWRE00vuwZwLNxKX/9q8X/iUPiGRt9beKPYz2ATtOm2vkimeeoysyEo3BRstmFqYAw6V2toH8mSIhtR/IM160M1OupH5AfFDCUpnE5gPngRMyDL005WxCljxLZWXoEj+I0dAErK1meMnxWHrQL3V450fr/vMiVB7wOYaKIXJ9oQQE+9p69gnPZVVubG+ImQqKXkULkEkxtiMjLL7/1g3gqWyLlOHfjpMboBkxroj0uzNaP2LqEdIhOjUbMaYiTpTSq1LJhsg==; s=default; c=relaxed/relaxed; d=leap-io-kernel.com; v=1;
	bh=k+G5tJEasviYUE/icFGCWtslxSl8fqxkMyhQFYUpEIs=;
	h=date:mime-version:subject:message-id:from;

Translate .../usb/dwc3.rst into Chinese

Update the translation through commit ecefae6db042
("docs: usb: rename files to .rst and add them to drivers-api")

Reviewed-by: Yanteng Si <siyanteng@cqsoftware.com.cn>
Signed-off-by: Kefan Bai <baikefan@leap-io-kernel.com>
---
 Documentation/translations/zh_CN/usb/dwc3.rst | 60 +++++++++++++++++++
 .../translations/zh_CN/usb/index.rst          |  2 +-
 2 files changed, 61 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/usb/dwc3.rst

diff --git a/Documentation/translations/zh_CN/usb/dwc3.rst b/Documentation/translations/zh_CN/usb/dwc3.rst
new file mode 100644
index 000000000000..700aee545559
--- /dev/null
+++ b/Documentation/translations/zh_CN/usb/dwc3.rst
@@ -0,0 +1,60 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/usb/dwc3.rst
+:翻译:
+
+ 白钶凡 Kefan Bai <baikefan@leap-io-kernel.com>
+
+:校译:
+
+
+
+==========
+DWC3 驱动
+==========
+
+
+待完成
+~~~~~~
+
+在你阅读时可以随便挑点儿东西做 :)
+
+- 将中断处理程序转换为基于每端点线程的IRQ
+
+  事实证明，一些DWC3命令大约需要~1ms才能完成。
+  当前代码会一直自旋等待命令完成，这是不好的设计。
+
+  实现思路：
+
+  - DWC core实现了一个用于按端点解复用中断的IRQ控制器。中断号在
+    probe阶段分配，并归属于该设备。如果硬件通过MSI为每个端点
+    提供独立的中断，那么这个虚拟的IRQ控制器就可以被硬件真实的端点
+    中断所取代。
+
+  - 在调用usb_ep_enable()时会申请和分配中断资源，
+    在调用usb_ep_disable()时会释放中断资源。
+    最差的情况是32个中断，最少为ep0/1的两个中断。
+  - dwc3_send_gadget_ep_cmd()将在wait_for_completion_timeout()中休眠到命令完成。
+  - 中断处理程序分为以下几个部分：
+
+    - 设备的中断处理主程序
+      遍历每个事件，对其调用generic_handle_irq()。
+      在generic_handle_irq()返回后，确认事件计数器，最终完成中断处理。
+
+    - 设备的中断处理线程
+      无
+
+    - EP中断的处理主程序
+      读取事件并尝试处理它。所有需要休眠的操作都交给线程处理。
+      事件保存在每个端点的数据结构中。
+      需要注意：一旦把事件交给线程去处理，就要注意不要自己再去处理它，
+      否则可能会导致低优先级的事件先于高优先级事件被处理。
+
+    - EP中断的处理线程
+      处理剩余的EP工作，这些工作可能会导致休眠，例如等待命令完成。
+
+  延迟:
+
+   不应该增加延迟，因为中断线程具有较高优先级，会在用户空间普通任务之前运行
+   （除非用户更改了调度优先级）。
diff --git a/Documentation/translations/zh_CN/usb/index.rst b/Documentation/translations/zh_CN/usb/index.rst
index 6b7706e7df9f..e90465f0dc69 100644
--- a/Documentation/translations/zh_CN/usb/index.rst
+++ b/Documentation/translations/zh_CN/usb/index.rst
@@ -20,10 +20,10 @@ USB 支持
     acm
     authorization
     chipidea
+    dwc3

 Todolist:

-*   dwc3
 *   ehci
 *   usbmon
 *   functionfs
--
2.52.0


