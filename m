Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9AD04EBAAD
	for <lists+linux-usb@lfdr.de>; Wed, 30 Mar 2022 08:18:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238574AbiC3GUB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Mar 2022 02:20:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241944AbiC3GUB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Mar 2022 02:20:01 -0400
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5365719D
        for <linux-usb@vger.kernel.org>; Tue, 29 Mar 2022 23:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1648621095; x=1680157095;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sS1nbe9riMKVLtU8Qj8436doVhqChAjXa99SW+hBdfQ=;
  b=pCks+HHp75RYuT7EYSA1zy0DWIeb815anjhLm9CEcRB2qYg7viH22JYx
   GcazZRTL/yz3M9ayRPRiyrtBaiQINgcVT/q2IHzkqKk5A5aIO4FAu47jP
   9SaGNEStnEfGa0F39sPlFgOWO05N0IaYVV9XFZ3PF4gJi6n0gxk43wEdQ
   k=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 29 Mar 2022 23:18:15 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2022 23:18:14 -0700
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 29 Mar 2022 23:18:14 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 29 Mar 2022 23:18:12 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <quic_jackp@quicinc.com>,
        "Linyu Yuan" <quic_linyyuan@quicinc.com>
Subject: [PATCH v4 0/5] usb: gadget: configfs: new trace events
Date:   Wed, 30 Mar 2022 14:18:02 +0800
Message-ID: <1648621087-14948-1-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Last year I try to add trace event support for usb gadget configfs [1],
this time the idea is change a lot, the purpose is trace all user space
operation to gadget configuration, include gadget and it's function.

In usb gadget configfs, mainly user can do mkdir/rmdir a group,
link/unlink a function, change gadget/function attributes,
each operation will touch a struct config_item.

It only have one trace event entry which store string,
provide several API which represent user operation and generate string
from  struct config_item.

example output,
   mkdir-80      [000] .....    44.555106: gadget_configfs: mkdir dummy
      sh-76      [000] .....    44.562609: gadget_configfs: echo dummy/idVendor 0x05C6

   mkdir-81      [000] .....    44.569795: gadget_configfs: mkdir dummy/functions/eem.0
      sh-76      [000] .....    44.600221: gadget_configfs: echo dummy/functions/eem.0/dev_addr 1e:77:46:4b:1e:96

   mkdir-82      [000] .....    44.615542: gadget_configfs: mkdir dummy/configs/dummy.1
      ln-83      [000] .....    44.628997: gadget_configfs: link dummy/configs/dummy.1 dummy/functions/eem.0
      sh-76      [000] .....    44.634506: gadget_configfs: echo dummy/configs/dummy.1/MaxPower 500

   mkdir-84      [000] .....    44.642265: gadget_configfs: mkdir dummy/configs/dummy.1/strings/0x409
      sh-76      [000] .....    44.663886: gadget_configfs: echo dummy/configs/dummy.1/strings/0x409/configuration dummy

   rmdir-85      [000] .....    64.255507: gadget_configfs: rmdir dummy/configs/dummy.1/strings/0x409
      rm-86      [000] .....    64.263926: gadget_configfs: unlink dummy/configs/dummy.1 dummy/functions/eem.0
   rmdir-87      [000] .....    64.279768: gadget_configfs: rmdir dummy/configs/dummy.1
   rmdir-88      [000] .....    64.328124: gadget_configfs: rmdir dummy/functions/eem.0
   rmdir-89      [000] .....    64.992085: gadget_configfs: rmdir dummy


As it is different from last year change, start a new thread.

[1] https://lore.kernel.org/linux-usb/1635229309-2821-1-git-send-email-quic_linyyuan@quicinc.com/

V2: add example output
V3: add trace.c and move all APIs to it
v4: fix memory leak in v3

Linyu Yuan (5):
  usb: gadget: remove gadgets_type storage type 'static'
  usb: gadget: add trace event of configfs operation
  usb: gadget: add trace event of configfs group operation
  usb: gadget: add trace event of configfs link/unlink operation
  usb: gadget: add trace event of configfs write attributes operation

 drivers/usb/gadget/Makefile                    |   2 +
 drivers/usb/gadget/configfs.c                  |  45 ++++++-
 drivers/usb/gadget/function/f_acm.c            |   1 +
 drivers/usb/gadget/function/f_hid.c            |   4 +
 drivers/usb/gadget/function/f_loopback.c       |   4 +
 drivers/usb/gadget/function/f_mass_storage.c   |  20 +++
 drivers/usb/gadget/function/f_midi.c           |   6 +
 drivers/usb/gadget/function/f_printer.c        |   4 +
 drivers/usb/gadget/function/f_serial.c         |   1 +
 drivers/usb/gadget/function/f_sourcesink.c     |  16 +++
 drivers/usb/gadget/function/f_uac1.c           |   6 +
 drivers/usb/gadget/function/f_uac1_legacy.c    |   4 +
 drivers/usb/gadget/function/f_uac2.c           |   8 ++
 drivers/usb/gadget/function/u_ether_configfs.h |  10 ++
 drivers/usb/gadget/function/uvc_configfs.c     |  42 +++++++
 drivers/usb/gadget/trace.c                     | 163 +++++++++++++++++++++++++
 drivers/usb/gadget/trace.h                     |  39 ++++++
 include/linux/usb/composite.h                  |  18 +++
 include/linux/usb/gadget_configfs.h            |   4 +
 19 files changed, 396 insertions(+), 1 deletion(-)
 create mode 100644 drivers/usb/gadget/trace.c
 create mode 100644 drivers/usb/gadget/trace.h

-- 
2.7.4

