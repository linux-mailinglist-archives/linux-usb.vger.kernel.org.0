Return-Path: <linux-usb+bounces-37193-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLhlNjOPAGrfKAEAu9opvQ
	(envelope-from <linux-usb+bounces-37193-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 10 May 2026 15:59:15 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8B450480F
	for <lists+linux-usb@lfdr.de>; Sun, 10 May 2026 15:59:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F832300CBD5
	for <lists+linux-usb@lfdr.de>; Sun, 10 May 2026 13:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29B04393DC1;
	Sun, 10 May 2026 13:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="MC35XeA8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-m49222.qiye.163.com (mail-m49222.qiye.163.com [45.254.49.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2A431B838;
	Sun, 10 May 2026 13:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778421548; cv=none; b=GIRP/s7TLochdYAxBh8ZQeKj3L7TprDMxqyMUGRojUdlTkLqpj/deV/V6UQDutXPYInQjq73CAuH/db12J3b/IEX0DymM7XqY6aeJph31bP42G7gEjEWX9bdzJrONnot+Pm0bzP5qqCydwgqTmKMbh22Z1hlqIC6p2b1berY430=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778421548; c=relaxed/simple;
	bh=Xm8e0k70wN8h7qvMjH9bn6+VZyOj/LPDwBB4asA7UEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sndv3VMGZk7mvzmeZhslrctviyFr1At4zbZzoDeTxh0A+5lYtG+JmSHJPUR1fKq6ujAFucCfJvVFMfZhYtExllD6LFQqMx00B0L9RKWBhZI3tuzRYNocM/nfF87MTrTLODT6HeqSmn2peOy/EdBnTuJRX8sYepR7AAlzCjINZjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=MC35XeA8; arc=none smtp.client-ip=45.254.49.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Received: from server001 (unknown [222.130.22.242])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3dd2c6ffd;
	Sun, 10 May 2026 21:53:45 +0800 (GMT+08:00)
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
Subject: [PATCH v6 1/8] docs/zh_CN: Add index.rst translation
Date: Sun, 10 May 2026 21:53:32 +0800
Message-ID: <8446bc5a1dbebc5ef5fb94cba14e91e1a395cf6a.1778415392.git.baikefan@leap-io-kernel.com>
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
X-HM-Tid: 0a9e122a585309d5kunm9f76e21d35e08e
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZTxlLVkofSUJPQ0tJQ05IQlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUlVSkhLVUlJVUlPSVlXWRYaDxIVHRRZQVlLVUtVS1
	VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=MC35XeA8JpC9cjIdzQe4duttYWYYctfKkAJF8RXD2wSxEcrd3hWhyYcNnTKlhSbQQSn3oB3pGUR4ocpI4W57qthYjS7U/ybHMnilu+SIepVydilKqj1A0/V2Laj4AYMPYO1X3vDDffYyKLEZXLmHvavMDLAIdXJ8BJcIvog1MJNPSq2zvVb8xOJ5PH00BfSOmhx7M1iU2YHpHytov+TnbgQGSV3T+8oQiPy0dDPpRD1+F7yTx5aXLpptLsnSttSZhJnHHqUBvUs/MtEsFfaQc9T+/5OxxRnzfxHPU8Bn3BCLn67Ik6+xngUSWsTx+Y95G25OqJ++xsIHwQyXzM2jyQ==; s=default; c=relaxed/relaxed; d=leap-io-kernel.com; v=1;
	bh=ViCGcHPSjkTyQxBhxpIUHdZfpurb7NdFZ+dWkLF6Co4=;
	h=date:mime-version:subject:message-id:from;
X-Rspamd-Queue-Id: 3C8B450480F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[leap-io-kernel.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[leap-io-kernel.com:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,gmail.com,kernel.org,hust.edu.cn,lwn.net,vger.kernel.org,leap-io-kernel.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-37193-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[leap-io-kernel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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

Translate .../usb/index.rst into Chinese and update subsystem-apis.rst

Update the translation through commit a592a36e4937
("Documentation: use a source-read extension for the index link boilerplate")

Reviewed-by: Yanteng Si <siyanteng@cqsoftware.com.cn>
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
index 000000000000..7cfe99a4dc0a
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
+* acm
+* authorization
+* chipidea
+* dwc3
+* ehci
+* usbmon
+* functionfs
+* functionfs-desc
+* gadget_configfs
+* gadget_hid
+* gadget_multi
+* gadget_printer
+* gadget_serial
+* gadget_uvc
+* gadget-testing
+* iuu_phoenix
+* mass-storage
+* misc_usbsevseg
+* mtouchusb
+* ohci
+* raw-gadget
+* usbip_protocol
+* usb-serial
+* usb-help
+* text_files
+
+.. only::  subproject and html
+
+   索引
+   =======
+
+   * :ref:`genindex`
--
2.54.0


