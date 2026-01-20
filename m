Return-Path: <linux-usb+bounces-32549-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGtTF8bnb2lhUQAAu9opvQ
	(envelope-from <linux-usb+bounces-32549-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 21:38:30 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5D14B6C6
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 21:38:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A7B3EA64750
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 18:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B33F744E05E;
	Tue, 20 Jan 2026 18:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JQ9OYISh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8427B44CAFE
	for <linux-usb@vger.kernel.org>; Tue, 20 Jan 2026 18:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768932732; cv=none; b=PqoWOOHA5WMJ4TOpj0ThEQ3hqkNDjLT90ptrrmQJ2FtD65R3G6s1pHnvahhskcKUX2BYwv+0kzwrQVf7BkL6icQTPKR1yB5lzEsmF5eQUXZWtMmNN1e8klnfXZPCovC6ivqqDkL9Tdk8qHgO+4JgRB6LALjIC8lJM81V9xquEXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768932732; c=relaxed/simple;
	bh=2ioqgKNJG4CDvzxiwQUNry8NcuvtGhb3/JxGfrs5Ma8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uMlI6EkfG4tI43hS/w1JZm9YItKHeERpIjAf7SMk787MNZRQd5ZZDKXzR/tQCGtgHhA2WPSpjjaGHQ2cYA0W65PCwlY3JlGazIJ8rQGzU5MZdgOArZK/d3uQnvDEXZZ0FHaDJc1ogoaMWRBpn8qaQVmwBNZ4Cfta0s8vrqbzlj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JQ9OYISh; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768932730; x=1800468730;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2ioqgKNJG4CDvzxiwQUNry8NcuvtGhb3/JxGfrs5Ma8=;
  b=JQ9OYIShuB32qx74jrbFol0h6/W4v76I575Bi0OP6EsI224ywxwfmBfa
   qnl0akGvnG8sclgNWUA4C/IvQ9Q9ApNB8n+kymtQJ8oT9lqXHdWh3xe3g
   9UQV1dcFgmkPV4T6cnHT5Pz8cSMhKs2L1WkN/jnaTUz0sSqnz1pnGXpzr
   E0p/dTpwkYMSJGcOZmQc+6nqi3XNlk5xExDmNc3hw8S6RI4c6+FIxshFT
   rYkQZx8L0kLzFaR5VUan7V9z+RFFO/SYGCn4Tq74qt2y+9kxM+W1UpfE6
   4IGjMNiH+1yCTv0evJrZhdkmo2rB2Na7yxlSK4cpbQpvFLkd995vyPkMR
   g==;
X-CSE-ConnectionGUID: eJ+o9eLaRwe0gz9SqT6oFA==
X-CSE-MsgGUID: s8IO8CtsT8WOLd/yNNTS1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70055588"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="70055588"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 10:12:09 -0800
X-CSE-ConnectionGUID: BEsc7aPPRDK7W0ypL/VmAg==
X-CSE-MsgGUID: Mz59BMsORYeoPS6npeZ7yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="205997440"
Received: from abityuts-desk.ger.corp.intel.com (HELO mnyman-desk.home) ([10.245.244.215])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 10:12:08 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 2/4] xhci: dbc: allow setting device serial number through sysfs
Date: Tue, 20 Jan 2026 20:11:46 +0200
Message-ID: <20260120181148.128712-3-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120181148.128712-1-mathias.nyman@linux.intel.com>
References: <20260120181148.128712-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[intel.com,none];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32549-lists,linux-usb=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-usb];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,chromium.org:email,linux.intel.com:mid]
X-Rspamd-Queue-Id: AB5D14B6C6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Łukasz Bartosik <ukaszb@chromium.org>

Add dbc_serial sysfs attribute to allow changing the serial number
string descriptor presented by the debug device when a host requests a
string descriptor with iSerialNumber index.

Value can only be changed while debug capability (DbC) is in disabled
state to prevent USB device descriptor change while connected to a USB
host.

The default value is "0001".
The field length can be from 1 to 126 characters.
String is terminated at null or newline, driver does not support empty
string.

[ mn: Improve commit message and sysfs entry documentation ]
Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 .../testing/sysfs-bus-pci-drivers-xhci_hcd    | 15 ++++++++
 drivers/usb/host/xhci-dbgcap.c                | 36 +++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd b/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd
index fc82aa4e54b0..b0e8ded09c16 100644
--- a/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd
+++ b/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd
@@ -85,3 +85,18 @@ Description:
 		up to 5000. The default value is 64 ms.
 		This polling interval is used while DbC is enabled but has no
 		active data transfers.
+
+What:		/sys/bus/pci/drivers/xhci_hcd/.../dbc_serial
+Date:		January 2026
+Contact:	Łukasz Bartosik <ukaszb@chromium.org>
+Description:
+		The dbc_serial attribute allows to change the serial number
+		string descriptor presented by the debug device when a host
+		requests a string descriptor with iSerialNumber index.
+		Index is found in the iSerialNumber field in the device
+		descriptor.
+		Value can only be changed while debug capability (DbC) is in
+		disabled state to prevent USB device descriptor change while
+		connected to a USB host.
+		The default value is "0001".
+		The field length can be from 1 to 126 characters.
diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index 4ba8edb37e51..a78d386ffdc3 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -1210,6 +1210,40 @@ static ssize_t dbc_bcdDevice_store(struct device *dev,
 	return size;
 }
 
+static ssize_t dbc_serial_show(struct device *dev,
+			    struct device_attribute *attr,
+			    char *buf)
+{
+	struct xhci_hcd	*xhci = hcd_to_xhci(dev_get_drvdata(dev));
+	struct xhci_dbc	*dbc = xhci->dbc;
+
+	return sysfs_emit(buf, "%s\n", dbc->str.serial);
+}
+
+static ssize_t dbc_serial_store(struct device *dev,
+			     struct device_attribute *attr,
+			     const char *buf, size_t size)
+{
+	struct xhci_hcd	*xhci = hcd_to_xhci(dev_get_drvdata(dev));
+	struct xhci_dbc	*dbc = xhci->dbc;
+	size_t len;
+
+	if (dbc->state != DS_DISABLED)
+		return -EBUSY;
+
+	len = strcspn(buf, "\n");
+	if (!len)
+		return -EINVAL;
+
+	if (len > USB_MAX_STRING_LEN)
+		return -E2BIG;
+
+	memcpy(dbc->str.serial, buf, len);
+	dbc->str.serial[len] = '\0';
+
+	return size;
+}
+
 static ssize_t dbc_bInterfaceProtocol_show(struct device *dev,
 				 struct device_attribute *attr,
 				 char *buf)
@@ -1297,6 +1331,7 @@ static DEVICE_ATTR_RW(dbc);
 static DEVICE_ATTR_RW(dbc_idVendor);
 static DEVICE_ATTR_RW(dbc_idProduct);
 static DEVICE_ATTR_RW(dbc_bcdDevice);
+static DEVICE_ATTR_RW(dbc_serial);
 static DEVICE_ATTR_RW(dbc_bInterfaceProtocol);
 static DEVICE_ATTR_RW(dbc_poll_interval_ms);
 
@@ -1305,6 +1340,7 @@ static struct attribute *dbc_dev_attrs[] = {
 	&dev_attr_dbc_idVendor.attr,
 	&dev_attr_dbc_idProduct.attr,
 	&dev_attr_dbc_bcdDevice.attr,
+	&dev_attr_dbc_serial.attr,
 	&dev_attr_dbc_bInterfaceProtocol.attr,
 	&dev_attr_dbc_poll_interval_ms.attr,
 	NULL
-- 
2.43.0


