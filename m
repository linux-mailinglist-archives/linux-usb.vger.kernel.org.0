Return-Path: <linux-usb+bounces-31270-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 438ADCACA4B
	for <lists+linux-usb@lfdr.de>; Mon, 08 Dec 2025 10:26:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE518304A295
	for <lists+linux-usb@lfdr.de>; Mon,  8 Dec 2025 09:25:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C86B303C94;
	Mon,  8 Dec 2025 09:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="b7BRsnMl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-m49223.qiye.163.com (mail-m49223.qiye.163.com [45.254.49.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31322DF13B;
	Mon,  8 Dec 2025 09:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765185956; cv=none; b=bj7rlVBUTBbCaEA1/cUeX0h0KM2lb3ufunn2HbX34B0krPNGf14QSLOwahiCcphsOYZrvjhBWd9HxPlncTglwp9+l+bdvS1mjGcB/p2jl9rCLNViGgw0qtYf/wl4koFS46CLjAKf5VN+Pnzcga6MnpGbLYiVrDSaTWFK1aEGPYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765185956; c=relaxed/simple;
	bh=lLSf55e3RFiWxq1g4uZKvyZCgHbiq3IoDG5B7oom3FE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=od61vXAUI4UAYYW86YBeIzxkmhvzJ6f7VShX3xrYJOnuqm112JMfjMYKQZDs16i9TnAUctSC/Au+P/p2OYh9Pj4rkQ0g8t/+f6agqNAlKqTjtekUrpwH6TTJ5dVOXWIM5p7SBLLBzehPEc05XsMr0u3SesQOSwiJUtKc9xqwXFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=b7BRsnMl; arc=none smtp.client-ip=45.254.49.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Received: from server001 (unknown [222.130.22.244])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2c6535239;
	Mon, 8 Dec 2025 17:25:42 +0800 (GMT+08:00)
From: Kefan Bai <baikefan@leap-io-kernel.com>
To: linux-usb@vger.kernel.org,
	si.yanteng@linux.dev
Cc: seakeel@gmail.com,
	alexs@kernel.org,
	dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	doubled@leap-io-kernel.com
Subject: [PATCH v5 1/8] docs/zh_CN: Add index.rst translation
Date: Mon,  8 Dec 2025 17:25:31 +0800
Message-ID: <874e4d8b28638ff36d0cd9fb76962c23b41cff96.1765180570.git.baikefan@leap-io-kernel.com>
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
X-HM-Tid: 0a9afd47f5ae09d5kunm314b94712b4e642
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDHU0aVk5KSElNQkNDTB1JGFYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlJSUlVSkhLVUlJVUlPT1lXWRYaDxIVHRRZQVlPS0hVSktJQkNDTFVKS0
	tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=b7BRsnMlttV6w6JVTEoZXfEkbOZDKjqYuTmu5U4V92yPhWF9n9+Gad78vPdK1iMnyL13+wLw95waFtTvYh5CwBwfhEEC9hVz5Nw9SL5rCdvdqx/3tjE2QP2z7Vq53MtjHncW7gRxF5iSJVaRQrB6wDynqZHAKXAc2VcHgJw+MgsaQo/t4519f5ljIZ9NrvyB3TdejKrSJSa3OFBieHCk8s2Z43KSLDFJZaITVekn88fY1fnd0sW9Ca8lBnJIJYjoZJavmL3bEToQpHZ1rvtG3x9GTB8r+rRvGbW+irfF+70akdLuyve6WS4CMWDO+GnYFlQkHDucWX8wx7Di6wixuw==; s=default; c=relaxed/relaxed; d=leap-io-kernel.com; v=1;
	bh=DDe7z/YAAzUTVe1KboOcG+TaksfTjvLPnWI4UE+ujFY=;
	h=date:mime-version:subject:message-id:from;

Translate .../usb/index.rst into Chinese and update subsystem-apis.rst

Update the translation through commit c26cee817f8b
("usb: gadget: f_fs: add capability for dfu functional descriptor")

Signed-off-by: Kefan Bai <baikefan@leap-io-kernel.com>
---
 .../translations/zh_CN/subsystem-apis.rst     |  2 +-
 .../translations/zh_CN/usb/index.rst          | 54 +++++++++++++++++++
 2 files changed, 55 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/usb/index.rst

diff --git a/Documentation/translations/zh_CN/subsystem-apis.rst b/Documentation/translations/zh_CN/subsystem-apis.rst
index 830217140fb6..b52e1feb0167 100644
--- a/Documentation/translations/zh_CN/subsystem-apis.rst
+++ b/Documentation/translations/zh_CN/subsystem-apis.rst
@@ -90,6 +90,7 @@ TODOList:
    security/index
    PCI/index
    peci/index
+   usb/index

 TODOList:

@@ -104,6 +105,5 @@ TODOList:
 * accel/index
 * crypto/index
 * bpf/index
-* usb/index
 * misc-devices/index
 * wmi/index
diff --git a/Documentation/translations/zh_CN/usb/index.rst b/Documentation/translations/zh_CN/usb/index.rst
new file mode 100644
index 000000000000..a75062cae766
--- /dev/null
+++ b/Documentation/translations/zh_CN/usb/index.rst
@@ -0,0 +1,54 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/usb/index.rst
+:翻译:
+
+ 白钶凡 Kefan Bai <baikefan@leap-io-kernel.com>
+
+:校译:
+
+
+
+===========
+USB 支持
+===========
+
+.. toctree::
+    :maxdepth: 1
+
+
+Todolist:
+
+*   acm
+*   authorization
+*   chipidea
+*   dwc3
+*   ehci
+*   usbmon
+*   functionfs
+*   functionfs-desc
+*   gadget_configfs
+*   gadget_hid
+*   gadget_multi
+*   gadget_printer
+*   gadget_serial
+*   gadget_uvc
+*   gadget-testing
+*   iuu_phoenix
+*   mass-storage
+*   misc_usbsevseg
+*   mtouchusb
+*   ohci
+*   raw-gadget
+*   usbip_protocol
+*   usb-serial
+*   usb-help
+*   text_files
+
+.. only::  subproject and html
+
+   索引
+   =======
+
+   * :ref:`genindex`
--
2.52.0


