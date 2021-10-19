Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 194EC432FFC
	for <lists+linux-usb@lfdr.de>; Tue, 19 Oct 2021 09:44:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234538AbhJSHqy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Oct 2021 03:46:54 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:34074 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234132AbhJSHqx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Oct 2021 03:46:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1634629481; x=1666165481;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=omu0zvp46diWd+kq6KZZAbW4jAtlZjV2yT/23w7NbvE=;
  b=vIv0v+Ztxbm6K6l7diwneMsm7R3PkK3PrSq1tyXsLMfqYEU5WkV45kw0
   wmnKL5tFh56+K1XG3y0Dd4i9WM5CMrrcFn7VPsyNbNntThFf+YSzIWyQW
   noi+Iufhuu2TNQiH9o4RSy/97p7BQTIgB3E7urciLEeQ4jzud8ZgIz4rF
   s=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 19 Oct 2021 00:44:41 -0700
X-QCInternal: smtphost
Received: from nalasex01b.na.qualcomm.com ([10.47.209.197])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2021 00:44:40 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Tue, 19 Oct 2021 00:44:38 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <jackp@quicinc.com>,
        Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH v11 0/3] usb: gadget: configfs: add some trace event
Date:   Tue, 19 Oct 2021 15:44:29 +0800
Message-ID: <1634629473-15411-1-git-send-email-quic_linyyuan@quicinc.com>
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

trace event will looks like as below,
config_usb_cfg_link: g1: 0 0 0 0 0 0 0 0 0000 0510 6 0 {1 80 2 Function FS Gadget,}; - (null)
gadget_dev_desc_UDC_store: g1: 0 0 0 0 0 0 0 0 0000 0510 6 0 {1 80 2 Function FS Gadget,}; - dummy_udc
unregister_gadget: g1: 0 0 0 0 0 0 0 0 0000 0510 6 0 {1 80 2 Function FS Gadget,}; - dummy_udc
config_usb_cfg_unlink: g1: 0 0 0 0 0 0 0 0 0000 0510 6 0 {1 80 2 }, - (null)


Linyu Yuan (3):
  usb: gadget: configfs: add cfg_to_gadget_info() helper
  usb: gadget: configfs: change config attributes file operation
  usb: gadget: add configfs trace events

 drivers/usb/gadget/configfs.c       |  39 +++++++--
 drivers/usb/gadget/configfs_trace.h | 166 ++++++++++++++++++++++++++++++++++++
 2 files changed, 196 insertions(+), 9 deletions(-)
 create mode 100644 drivers/usb/gadget/configfs_trace.h

-- 
2.7.4

