Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CD3343AC3A
	for <lists+linux-usb@lfdr.de>; Tue, 26 Oct 2021 08:22:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230234AbhJZGYW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Oct 2021 02:24:22 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:41408 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230160AbhJZGYV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Oct 2021 02:24:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1635229318; x=1666765318;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wY+s3IQcpoz0HD/Vtk0LsLeHJ0yGIl6M9q95TZdn0IY=;
  b=JF3oalQ/yzvRkpvFl1P35KFRrSK3guPBcCJu3DpRsZg7om0Tsk00BSzf
   3xLMhkrKYas3NhjCllKY4vOVNh5urI5nXG9sqO9n2FUfV+ubFKidvJk/T
   FIL8bEXi+/P/K+mza9qIDnHE72XbnYgOZ1ADEQhhVo2jTRNKILjy41gSa
   Q=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 25 Oct 2021 23:21:58 -0700
X-QCInternal: smtphost
Received: from nalasex01b.na.qualcomm.com ([10.47.209.197])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2021 23:21:58 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Mon, 25 Oct 2021 23:21:56 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <jackp@quicinc.com>,
        Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH v13 0/2] usb: gadget: configfs: add some trace event
Date:   Tue, 26 Oct 2021 14:21:47 +0800
Message-ID: <1635229309-2821-1-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

this series make some minor change to gadget configfs and
add some important trace event from configfs layer.

follow suggestion from Felipe Balbi in link below,
https://lore.kernel.org/linux-usb/1629777281-30188-1-git-send-email-quic_linyyuan@quicinc.com/

v2: fix two issue Reported-by: kernel test robot <lkp@intel.com>
v3: do not move private structure to configfs.h
v4: add missing new file configfs_trace.h
v5: lost some change of v2, add it again
v6: fix comments from Greg Kroah-Hartman
v7: three minor changes according to coding rules
v8: change two trace location
v9: fix when config is empty
v10: fix wrong api in v9
v11: split to three changes, minor change to trace event print format
v12: use mutex lock gi->lock to make sure data safe for trace
v13: rebase; add more trace entries; define three event class to remove lock concern

trace event will looks like as below,
config_usb_cfg_link: dummy: dummy: 1 128 2 gser
configfs_composite_bind: dummy: dummy_udc.0: 0 0 0 0 0 0 0 0 0000 00 00 00 00 0000 0000 0515 6 0 0000000000000000000000000000
gadget_dev_desc_UDC_store: dummy: dummy_udc.0: 0 0 0 0 0 0 0 0 0000 00 00 00 00 0000 0000 0515 6 0 0000000000000000000000000000
configfs_composite_reset: dummy: dummy_udc.0: 0 0 0 0 0 0 0 0 0000 00 00 00 00 0000 0000 0515 6 0 0000000000000000000000000000
configfs_composite_resume: dummy: dummy_udc.0: 0 0 0 0 0 0 0 0 0000 00 00 00 00 0000 0000 0515 6 0 0000000000000000000000000000
configfs_composite_setup: dummy: dummy_udc.0: 0 0 0 0 1 0 0 0 0200 00 00 00 40 0000 0000 0515 6 0 0000000000000000000000000000
configfs_composite_reset: dummy: dummy_udc.0: 0 0 0 0 0 0 0 0 0200 00 00 00 40 0000 0000 0515 6 0 0000000000000000000000000000
configfs_composite_resume: dummy: dummy_udc.0: 0 0 0 0 0 0 0 0 0200 00 00 00 40 0000 0000 0515 6 0 0000000000000000000000000000
configfs_composite_setup: dummy: dummy_udc.0: 0 0 0 0 1 0 0 0 0200 00 00 00 40 0000 0000 0515 6 0 0000000000000000000000000000
configfs_composite_setup: dummy: dummy_udc.0: 0 0 0 0 1 0 0 0 0200 00 00 00 40 0000 0000 0515 6 0 0000000000000000000000000000
configfs_composite_setup: dummy: dummy_udc.0: 0 0 0 0 1 0 0 0 0200 00 00 00 40 0000 0000 0515 6 0 0000000000000000000000000000
configfs_composite_setup: dummy: dummy_udc.0: 0 0 0 0 1 0 0 0 0200 00 00 00 40 0000 0000 0515 6 0 0000000000000000000000000000
unregister_gadget: dummy: dummy_udc.0: 0 0 0 0 0 0 0 0 0200 00 00 00 40 0000 0000 0515 6 0 0000000000000000000000000000
configfs_composite_suspend: dummy: dummy_udc.0: 0 0 0 1 0 0 0 0 0200 00 00 00 40 0000 0000 0515 6 0 0000000000000000000000000000
configfs_composite_disconnect: dummy: dummy_udc.0: 0 0 0 0 0 0 0 0 0200 00 00 00 40 0000 0000 0515 6 0 0000000000000000000000000000
configfs_composite_unbind: dummy: dummy_udc.0: 1 0 0 0 0 0 0 0 0200 00 00 00 40 0000 0000 0515 6 0 0000000000000000000000000000
gadget_dev_desc_UDC_store: dummy: (null): 1 0 0 0 0 0 0 0 0200 00 00 00 40 0000 0000 0515 6 0 0000000000000000000000000000


Linyu Yuan (2):
  usb: gadget: configfs: add explicit gi variable
  usb: gadget: configfs: add trace events

 drivers/usb/gadget/configfs.c       |  62 +++++---
 drivers/usb/gadget/configfs_trace.h | 273 ++++++++++++++++++++++++++++++++++++
 2 files changed, 319 insertions(+), 16 deletions(-)
 create mode 100644 drivers/usb/gadget/configfs_trace.h

-- 
2.7.4

