Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A416A2B001B
	for <lists+linux-usb@lfdr.de>; Thu, 12 Nov 2020 08:07:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726903AbgKLHH1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Nov 2020 02:07:27 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:7517 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725996AbgKLHH0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 Nov 2020 02:07:26 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CWt2V0QWMzhkkv;
        Thu, 12 Nov 2020 15:07:14 +0800 (CST)
Received: from huawei.com (10.69.192.56) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Thu, 12 Nov 2020
 15:07:14 +0800
From:   Luo Jiaxing <luojiaxing@huawei.com>
To:     <akpm@linux-foundation.org>, <viro@zeniv.linux.org.uk>,
        <andriy.shevchenko@linux.intel.com>
CC:     <linux-kernel@vger.kernel.org>, <martin.petersen@oracle.com>,
        <john.garry@huawei.com>, <himanshu.madhani@cavium.com>,
        <felipe.balbi@linux.intel.com>, <gregkh@linuxfoundation.org>,
        <uma.shankar@intel.com>, <anshuman.gupta@intel.com>,
        <animesh.manna@intel.com>, <linux-usb@vger.kernel.org>,
        <linux-scsi@vger.kernel.org>, <linuxarm@huawei.com>
Subject: [PATCH v4 0/5] Introduce a new helper macro DEFINE_SHOW_STORE_ATTRIBUTE at seq_file.c
Date:   Thu, 12 Nov 2020 15:07:38 +0800
Message-ID: <1605164864-58944-1-git-send-email-luojiaxing@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

We already own DEFINE_SHOW_ATTRIBUTE() helper macro for defining attribute
for read-only file, but we found many of drivers also want a helper macro
for read-write file too.

So we add this macro to help decrease code duplication.

---
 v1->v2:
        1.Rename DEFINE_STORE_ATTRIBUTE() to DEFINE_SHOW_STORE_ATTRIBUTE().
	2.AI Viro points out that he doesn't like the definition of macros
	  like DEFINE_SHOW_ATTRIBUTE.
 v2->v3:
        1.Fixed some spelling mistakes in commit.
        2.Revision description are added for easy tracing.

 v3->v4:
	1.Add AI Viro's comment to v1->v2's revision description.
	2.Fixed a spelling mistakes of "marco" to "macro".
---

Luo Jiaxing (5):
  seq_file: Introduce DEFINE_SHOW_STORE_ATTRIBUTE() helper macro
  scsi: hisi_sas: Introduce DEFINE_SHOW_STORE_ATTRIBUTE for debugfs
  scsi: qla2xxx: Introduce DEFINE_SHOW_STORE_ATTRIBUTE for debugfs
  usb: dwc3: debugfs: Introduce DEFINE_SHOW_STORE_ATTRIBUTE
  drm/i915/display: Introduce DEFINE_SHOW_STORE_ATTRIBUTE for debugfs

 .../gpu/drm/i915/display/intel_display_debugfs.c   |  55 +--------
 drivers/scsi/hisi_sas/hisi_sas_main.c              | 135 +++------------------
 drivers/scsi/qla2xxx/qla_dfs.c                     |  19 +--
 drivers/usb/dwc3/debugfs.c                         |  52 +-------
 include/linux/seq_file.h                           |  15 +++
 5 files changed, 41 insertions(+), 235 deletions(-)

-- 
2.7.4

