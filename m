Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98463401A91
	for <lists+linux-usb@lfdr.de>; Mon,  6 Sep 2021 13:28:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236106AbhIFL2v (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Sep 2021 07:28:51 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:30061 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234323AbhIFL2v (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Sep 2021 07:28:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1630927667; x=1662463667;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mcTurobT3wGYEJvgxhgjH4SdDv51Phorb8IRli3laHg=;
  b=dnjnBtpH//6r7D+JwMwNMt4lEriJq5ULgM4Uo1eyfydsAjeoiTgMBsvN
   Stb+8ffDH6//KFd1D90yVIJDQ3pJ3pt2MZuIInqlXicl9T1jITwGjeV6z
   S5NzfKvVUFbRbOuM3UeTswt0VVs9C99x2/WXbVXa7lXdYKSe2rVQqBJFe
   Y=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 06 Sep 2021 04:27:47 -0700
X-QCInternal: smtphost
Received: from nalasex01b.na.qualcomm.com ([10.47.209.197])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2021 04:27:47 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Mon, 6 Sep 2021 04:27:45 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH v4 0/3] usb: gadget: configfs: add some trace event
Date:   Mon, 6 Sep 2021 19:27:38 +0800
Message-ID: <1630927661-11307-1-git-send-email-quic_linyyuan@quicinc.com>
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

Linyu Yuan (3):
  usb: gadget: configfs: avoid list move operation of usb_function
  usb: gadget: configfs: add gadget_info for config group
  usb: gadget: configfs: add some trace event

 drivers/usb/gadget/configfs.c       | 114 ++++++++++++++++++------
 drivers/usb/gadget/configfs_trace.h | 167 ++++++++++++++++++++++++++++++++++++
 2 files changed, 256 insertions(+), 25 deletions(-)
 create mode 100644 drivers/usb/gadget/configfs_trace.h

-- 
2.7.4

