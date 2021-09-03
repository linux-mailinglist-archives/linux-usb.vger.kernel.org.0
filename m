Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 669873FF8EB
	for <lists+linux-usb@lfdr.de>; Fri,  3 Sep 2021 04:45:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346068AbhICCp7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Sep 2021 22:45:59 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:33479 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232101AbhICCp7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Sep 2021 22:45:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1630637100; x=1662173100;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SLIRCZnopNAGltVhmTJk3212jYNIIvUOxkYEnK+hnY8=;
  b=nPicZaShxRuw+kYfmV1pUuVeJujnFi+F5EnjcUGyMOEAVaHNj9R46gK1
   DlXPxwvmWgs1Hqv1hgbAcjTtacFZhv8rEoSfFAm/xnUjZtnKexRGN+C/a
   XkmPGv+YYxQfVGuD55c5NXupdEjxExVfqDnY2iPYi8LJWHpE1K6C7ZELR
   s=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 02 Sep 2021 19:44:59 -0700
X-QCInternal: smtphost
Received: from nalasex01b.na.qualcomm.com ([10.47.209.197])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2021 19:44:59 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Thu, 2 Sep 2021 19:44:57 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH v2 0/5] usb: gadget: configfs: add some trace event
Date:   Fri, 3 Sep 2021 10:44:47 +0800
Message-ID: <1630637092-30230-1-git-send-email-quic_linyyuan@quicinc.com>
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

Linyu Yuan (5):
  usb: gadget: configfs: expose some struct from configfs.c
  usb: gadget: configfs: change OS attributes operation
  usb: gadget: configfs: avoid list move operation of usb_function
  usb: gadget: configfs: add gadget_info for config group
  usb: gadget: configfs: add some trace event

 drivers/usb/gadget/Makefile         |   1 +
 drivers/usb/gadget/configfs.c       | 160 ++++++++++++-----------------------
 drivers/usb/gadget/configfs.h       |  71 ++++++++++++++++
 drivers/usb/gadget/configfs_trace.c |  43 ++++++++++
 drivers/usb/gadget/configfs_trace.h | 164 ++++++++++++++++++++++++++++++++++++
 5 files changed, 333 insertions(+), 106 deletions(-)
 create mode 100644 drivers/usb/gadget/configfs_trace.c
 create mode 100644 drivers/usb/gadget/configfs_trace.h

-- 
2.7.4

