Return-Path: <linux-usb+bounces-37859-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNYNHLDaDmrmCgYAu9opvQ
	(envelope-from <linux-usb+bounces-37859-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 12:13:04 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 777EB5A30B2
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 12:13:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0DAE930BFAC5
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 09:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43720381B0C;
	Thu, 21 May 2026 09:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="BDIsGZu9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-m4785125151.xmail.ntesmail.com (mail-m4785125151.xmail.ntesmail.com [47.85.125.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D83C38C2A5;
	Thu, 21 May 2026 09:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.85.125.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779357329; cv=none; b=g0MTps9t7IWVg82csnLya90nAYNyokveNbX4CJv1MIfBMF1/ja8PuXei69uCvlm/eASLkPwk6ObJnwU60hwHBsMyFIaDO+ktD9uTD+vJR2l3DZx72bE0AjZMgEPL8o0RzxO3TbhS8Ej7ATae7W3Y65rj0x5TK0wPd6j7k+qxxLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779357329; c=relaxed/simple;
	bh=SvsD/eROY6ga7U5SE6oCL4uEmPdnRthdSmfQHQxLx3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G9Oddpkz9pSd8h3xQ7HUD9ovuRvzlbzvy6DuFXkK563nGRo+wKzb+Zy9ghRBCu4WsfltG1cO4SNz6fZoOJ3i+dn+EiE3PapHP9VBO806b8tqoTuVkyW8pvHaokvbyLjv6poEpT85bMu20r6PWvKeh5kOS3N7hna+3NtIAAThO84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=BDIsGZu9; arc=none smtp.client-ip=47.85.125.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Received: from server001 (unknown [222.130.22.242])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3f4cebae9;
	Thu, 21 May 2026 17:55:18 +0800 (GMT+08:00)
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
Subject: [PATCH v7 1/8] docs/zh_CN: Add index.rst translation
Date: Thu, 21 May 2026 17:55:06 +0800
Message-ID: <27f8c02f2d78b37dd5d640fbafaa60d0f0ea9c95.1779355170.git.baikefan@leap-io-kernel.com>
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
X-HM-Tid: 0a9e49f5feb309d5kunm49815c9e65c72
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZQ0IdVhlKGUhDTktLSE8dTlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUlVSkhLVUlJVUlPSVlXWRYaDxIVHRRZQVlLVUtVS1
	VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=BDIsGZu9V6/NK0LwjLFJ2WDZN86Kr4HY/Fd/YAOSiZfn2Xk4D+gr6iykr+f6B7ABVCSmzQJUc6RyTDkqVJOohCrTXNG/py1oB8dPZlm0k0r3QdWMkMRyXLZNC7i7gcvitJE+14dzbk14lnALNpjbD29ppoYeQIZcvOqLDIVMkM3dV4sEB/wDq5DlVFrcxNOyHDFrhA7jzdBMK3SRTaz6XjJEbuEWaVYy9FoikEdaAwhi5qV1xteOYMydPT7Hw+GuVeaIQjWsvcO3p4FGZLR1+h6S2BYqb5eKpawhWMslioYf2DpBvqWJzjYCimzdWt9uhmWt/7Ss/SXPdac0J9E4Kg==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=2SlI7NOsT6ZnGLYQioDUNQ5bkZp2NLA7u43buQA/HxM=;
	h=date:mime-version:subject:message-id:from;
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[leap-io-kernel.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[leap-io-kernel.com:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,gmail.com,kernel.org,hust.edu.cn,lwn.net,vger.kernel.org,leap-io-kernel.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-37859-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[leap-io-kernel.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[baikefan@leap-io-kernel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cqsoftware.com.cn:email]
X-Rspamd-Queue-Id: 777EB5A30B2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
index 000000000000..b4cb0ccaa39b
--- /dev/null
+++ b/Documentation/translations/zh_CN/usb/index.rst
@@ -0,0 +1,54 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/usb/index.rst
+
+:翻译:
+
+ 白钶凡 Kefan Bai <baikefan@leap-io-kernel.com>
+
+:校译:
+
+
+========
+USB 支持
+========
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
+   ====
+
+   * :ref:`genindex`
--
2.54.0


