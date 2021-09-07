Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC0044021FF
	for <lists+linux-usb@lfdr.de>; Tue,  7 Sep 2021 04:30:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231728AbhIGBKw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Sep 2021 21:10:52 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:40848 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229975AbhIGBKv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Sep 2021 21:10:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1630976986; x=1662512986;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=thMca9ri3x3AN48X2IVF6TiEco7Qo1elLB3GyGbvLOA=;
  b=PXN+yR5tJI6NbvHjDPqnHK92WMn+wXZrv6oVc31c2qHn48gRWZ3M10me
   vnS6njmrFkB1QB2FWZBwm7bAloiSfnAKVKj25m5MoSx05I8+TrJVf6bRR
   0DPJcBUo78+/l4cQhbmAqUA/Ij8XU4b/VkKahsKWNUa4Ckz/LGwmsL0BM
   I=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 06 Sep 2021 18:09:46 -0700
X-QCInternal: smtphost
Received: from nalasex01b.na.qualcomm.com ([10.47.209.197])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2021 18:09:46 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Mon, 6 Sep 2021 18:09:41 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH v5 0/3] usb: gadget: configfs: add some trace event
Date:   Tue, 7 Sep 2021 09:09:34 +0800
Message-ID: <1630976977-13938-1-git-send-email-quic_linyyuan@quicinc.com>
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

this series make some minor change to gadget configfs
which allow common trace from configfs layer.

follow suggestion from Felipe Balbi in link below,
https://lore.kernel.org/linux-usb/1629777281-30188-1-git-send-email-quic_linyyuan@quicinc.com/

v2: fix two issue Reported-by: kernel test robot <lkp@intel.com>
v3: do not move private structure to configfs.h
v4: add missing new file configfs_trace.h
v5: lost some change of v2, add it again

Linyu Yuan (3):
  usb: gadget: configfs: avoid list move operation of usb_function
  usb: gadget: configfs: add gadget_info for config group
  usb: gadget: configfs: add some trace event

 drivers/usb/gadget/configfs.c       | 117 +++++++++++++++++++------
 drivers/usb/gadget/configfs_trace.h | 167 ++++++++++++++++++++++++++++++++++++
 2 files changed, 256 insertions(+), 28 deletions(-)
 create mode 100644 drivers/usb/gadget/configfs_trace.h

-- 
2.7.4

