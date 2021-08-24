Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 367D73F56DB
	for <lists+linux-usb@lfdr.de>; Tue, 24 Aug 2021 05:55:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234262AbhHXD4A (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Aug 2021 23:56:00 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:65129 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234015AbhHXDzu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 Aug 2021 23:55:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1629777307; x=1661313307;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=04OjMIrpxZND5rvAOFzzah9GLGi2slx/MyvO0Ot4seA=;
  b=n+gM3s2j9ZmKS5ZimuNj4qtwTiRGZFtImQFs60gz9aqkmK5M+5LRRoyJ
   VQUofj8KuyVLs2KsiR06BpP7pMeyRUHLPoPN97XIeFqTLt//M1qkFVjj7
   un0wQhvtaq7EaIBTDHEantbHkVVnbgSDohbq2q+hG3qmdy9oS+B9pgDRc
   8=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 23 Aug 2021 20:55:03 -0700
X-QCInternal: smtphost
Received: from nalasex01a.na.qualcomm.com ([10.47.209.196])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2021 20:55:02 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.922.7;
 Mon, 23 Aug 2021 20:55:00 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH V4 0/3] usb: gadget: configfs: add three trace entries
Date:   Tue, 24 Aug 2021 11:54:38 +0800
Message-ID: <1629777281-30188-1-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanexm03h.na.qualcomm.com (10.85.0.50) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

when debug USB gadget issue, it is better to understand
what configuration was done from user space.

v3->v4: split into three changes
v2->v3: add more change log
v1->v2: fix typo tree -> three of subject line

Linyu Yuan (3):
  usb: gadget: configfs: add UDC trace entry
  usb: gadget: configfs: add function link trace entry
  usb: gadget: configfs: add function unlink trace entry

 drivers/usb/gadget/Makefile         |  1 +
 drivers/usb/gadget/configfs.c       | 11 ++++++
 drivers/usb/gadget/configfs_trace.c |  7 ++++
 drivers/usb/gadget/configfs_trace.h | 73 +++++++++++++++++++++++++++++++++++++
 4 files changed, 92 insertions(+)
 create mode 100644 drivers/usb/gadget/configfs_trace.c
 create mode 100644 drivers/usb/gadget/configfs_trace.h

-- 
2.7.4

