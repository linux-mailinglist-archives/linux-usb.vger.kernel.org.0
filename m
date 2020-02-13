Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2258C15BC35
	for <lists+linux-usb@lfdr.de>; Thu, 13 Feb 2020 10:56:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729532AbgBMJ4J (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Feb 2020 04:56:09 -0500
Received: from mga01.intel.com ([192.55.52.88]:43419 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729494AbgBMJ4I (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 13 Feb 2020 04:56:08 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Feb 2020 01:56:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,436,1574150400"; 
   d="scan'208";a="234072335"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 13 Feb 2020 01:56:06 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id E1BD0193; Thu, 13 Feb 2020 11:56:04 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <yehezkel.bernat@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Nicholas Johnson <nicholas.johnson-opensource@outlook.com.au>,
        Lukas Wunner <lukas@wunner.de>
Subject: [PATCH] thunderbolt: Prevent crash if non-active NVMem file is read
Date:   Thu, 13 Feb 2020 12:56:04 +0300
Message-Id: <20200213095604.1074-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The driver does not populate .reg_read callback for the non-active NVMem
because the file is supposed to be write-only. However, it turns out
NVMem subsystem does not yet support this and expects that the .reg_read
callback is provided. If user reads the binary attribute it triggers
NULL pointer dereference like this one:

  BUG: kernel NULL pointer dereference, address: 0000000000000000
  ...
  Call Trace:
   bin_attr_nvmem_read+0x64/0x80
   kernfs_fop_read+0xa7/0x180
   vfs_read+0xbd/0x170
   ksys_read+0x5a/0xd0
   do_syscall_64+0x43/0x150
   entry_SYSCALL_64_after_hwframe+0x44/0xa9

Fix this in the driver by providing .reg_read callback that always
returns an error.

Reported-by: Nicholas Johnson <nicholas.johnson-opensource@outlook.com.au>
Fixes: e6b245ccd524 ("thunderbolt: Add support for host and device NVM firmware upgrade")
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: stable@vger.kernel.org
---
Once NVMem subsystem starts supporting write-only NVMems we can drop this
one.

 drivers/thunderbolt/switch.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index ad5479f21174..7d6ecc342508 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -348,6 +348,12 @@ static int tb_switch_nvm_read(void *priv, unsigned int offset, void *val,
 	return ret;
 }
 
+static int tb_switch_nvm_no_read(void *priv, unsigned int offset, void *val,
+				 size_t bytes)
+{
+	return -EPERM;
+}
+
 static int tb_switch_nvm_write(void *priv, unsigned int offset, void *val,
 			       size_t bytes)
 {
@@ -393,6 +399,7 @@ static struct nvmem_device *register_nvmem(struct tb_switch *sw, int id,
 		config.read_only = true;
 	} else {
 		config.name = "nvm_non_active";
+		config.reg_read = tb_switch_nvm_no_read;
 		config.reg_write = tb_switch_nvm_write;
 		config.root_only = true;
 	}
-- 
2.25.0

