Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3472E433701
	for <lists+linux-usb@lfdr.de>; Tue, 19 Oct 2021 15:26:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235861AbhJSN26 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Oct 2021 09:28:58 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:8771 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235743AbhJSN25 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Oct 2021 09:28:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1634650005; x=1666186005;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LBrqyaiN9KluujmGOKPgjwTDMvGMGd6Dcj+elihCbhI=;
  b=YizLDF+J00mK5Jx4a1Pwr74H7JArH2gp72LA/C5gr/TeudT8QLnjkEb5
   c1GNfznn6CH6DKM3ER/CdG5DGw1JlQTXx8D8gQ4t2gRT5XT21fgtkpK16
   9pFPyJzsqkxLg7B12+7zHDDfzEPMDu4fGW5rFgliuIRzCJgn2wp468hT0
   Q=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 19 Oct 2021 06:26:44 -0700
X-QCInternal: smtphost
Received: from nalasex01b.na.qualcomm.com ([10.47.209.197])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2021 06:26:43 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Tue, 19 Oct 2021 06:26:42 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <jackp@quicinc.com>,
        Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH v12 0/4] usb: gadget: configfs: add some trace event
Date:   Tue, 19 Oct 2021 21:26:33 +0800
Message-ID: <1634649997-28745-1-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
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

trace event will looks like as below,
config_usb_cfg_link: g1: 0 0 0 0 0 0 0 0 0000 0510 6 0 {1 80 2 Function FS Gadget,}; - (null)
gadget_dev_desc_UDC_store: g1: 0 0 0 0 0 0 0 0 0000 0510 6 0 {1 80 2 Function FS Gadget,}; - dummy_udc
unregister_gadget: g1: 0 0 0 0 0 0 0 0 0000 0510 6 0 {1 80 2 Function FS Gadget,}; - dummy_udc
config_usb_cfg_unlink: g1: 0 0 0 0 0 0 0 0 0000 0510 6 0 {1 80 2 }, - (null)

Linyu Yuan (4):
  usb: gadget: configfs: add cfg_to_gadget_info() helper
  usb: gadget: configfs: change config attributes file operation
  usb: gadget: configfs: use gi->lock to protect write operation
  usb: gadget: add configfs trace events

 drivers/usb/gadget/configfs.c       |  61 ++++++++++---
 drivers/usb/gadget/configfs_trace.h | 168 ++++++++++++++++++++++++++++++++++++
 2 files changed, 218 insertions(+), 11 deletions(-)
 create mode 100644 drivers/usb/gadget/configfs_trace.h

-- 
2.7.4

