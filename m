Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 072E44E19A5
	for <lists+linux-usb@lfdr.de>; Sun, 20 Mar 2022 05:35:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244695AbiCTEgg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 20 Mar 2022 00:36:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235846AbiCTEgf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 20 Mar 2022 00:36:35 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE101E0A3
        for <linux-usb@vger.kernel.org>; Sat, 19 Mar 2022 21:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1647750912; x=1679286912;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tTKHbn2YkSFuSf1kyl7GAFGyOcLZ6lJR3YxU94f9m40=;
  b=e/lsdGefK7EhWRjr/ZcsJHWFk9eXg/pLEI7lNlAfUWmBsWoKtyuIvGV7
   +e2w7ARm7VmliHqqCDZFYPUlW1GLgns8xnQ3SF6CUlKyLiGhDk2NaM48n
   IFljrZoGJ3tYmI2F1oVkFpUK+a9iVOhkR7XXsGtxj5dWzf9d4Ekf4EEN0
   c=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 19 Mar 2022 21:35:12 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2022 21:35:12 -0700
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Sat, 19 Mar 2022 21:35:11 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Sat, 19 Mar 2022 21:35:10 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <quic_jackp@quicinc.com>,
        "Linyu Yuan" <quic_linyyuan@quicinc.com>
Subject: [PATCH 0/4] usb: gadget: configfs: new trace events
Date:   Sun, 20 Mar 2022 12:35:00 +0800
Message-ID: <1647750904-6524-1-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
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
echo operation will touch a struct config_item.

It only have one trace event entry which store string,
provide several API which represent user operation and generate string
from  struct config_item.

As it is different from last year change, start a new thread.

[1] https://lore.kernel.org/linux-usb/1635229309-2821-1-git-send-email-quic_linyyuan@quicinc.com/

Linyu Yuan (4):
  usb: gadget: add trace event of configfs operation
  usb: gadget: add trace event of configfs group operation
  usb: gadget: add trace event of configfs link/unlink operation
  usb: gadget: add trace event of configfs write attributes operation

 drivers/usb/gadget/Makefile                    |   1 +
 drivers/usb/gadget/configfs.c                  | 188 +++++++++++++++++++++++++
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
 drivers/usb/gadget/function/uvc_configfs.c     |  42 ++++++
 drivers/usb/gadget/trace.h                     |  39 +++++
 include/linux/usb/composite.h                  |  18 +++
 include/linux/usb/gadget_configfs.h            |   4 +
 18 files changed, 376 insertions(+)
 create mode 100644 drivers/usb/gadget/trace.h

-- 
2.7.4

