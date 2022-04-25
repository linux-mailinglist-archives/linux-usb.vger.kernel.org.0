Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23DFE50DBF0
	for <lists+linux-usb@lfdr.de>; Mon, 25 Apr 2022 11:03:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241510AbiDYJFl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Apr 2022 05:05:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241483AbiDYJFQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Apr 2022 05:05:16 -0400
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 256B7340EE
        for <linux-usb@vger.kernel.org>; Mon, 25 Apr 2022 02:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1650877269; x=1682413269;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BZlFnzWxZaWW3n+ZomkKUkTW9Y6zphnaXLMVDNhwXaQ=;
  b=icqJZGOHzQHtuUBHKJpCgPl/fTRcp4/kIotBSTkrRnf76o8F6uZ5LJqB
   UwmQZ7SMAQoBEwXfvhEp3n/IPThK/fsmRmbcscYTdTlqZ/rfp4WZ1fkwN
   h1s+5Poy4LS/q4vf9+SmMNc4aHWcjQhRYJjt8we0hf2+CFc10+gpaCsnI
   s=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 25 Apr 2022 02:01:00 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2022 02:01:00 -0700
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 25 Apr 2022 02:00:59 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 25 Apr 2022 02:00:57 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <quic_jackp@quicinc.com>,
        "Linyu Yuan" <quic_linyyuan@quicinc.com>
Subject: [PATCH v6 0/2] usb: typec: ucsi: allow retry to find role switch
Date:   Mon, 25 Apr 2022 17:00:50 +0800
Message-ID: <1650877252-10401-1-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

when one role switch module built as module, it may load late than
ucsi, this change series allow retry from ucsi.

v2: improve ucsi_connector_clean() to cover all condition,
    and add one new change to avoid allocate one unused connector.

v3: fix comment from ucsi maintainer.

v4: fix review comment from Heikki Krogerus,
    merge patch#1 and patch#2 in V3 into one patch,
    add counter for retry limit,
    and some other minor fix.

v5: only update commit description of two patches

v6: fix review comment from Heikki Krogerus,
    merge patch#1 and patch#2 in v5 into one change,
    remove con->port = NULL; which is not needed.
    add Revieved-by tag for patch#3 in v5.

Linyu Yuan (2):
  usb: typec: ucsi: add a common function ucsi_unregister_connectors()
  usb: typec: ucsi: Wait for the USB role switches

 drivers/usb/typec/ucsi/ucsi.c | 85 +++++++++++++++++++++++++------------------
 drivers/usb/typec/ucsi/ucsi.h |  6 ++-
 2 files changed, 54 insertions(+), 37 deletions(-)

-- 
2.7.4

