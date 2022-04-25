Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 528C050DDBD
	for <lists+linux-usb@lfdr.de>; Mon, 25 Apr 2022 12:18:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238243AbiDYKVq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Apr 2022 06:21:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239708AbiDYKVn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Apr 2022 06:21:43 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 940BB3BA40
        for <linux-usb@vger.kernel.org>; Mon, 25 Apr 2022 03:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1650881892; x=1682417892;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NTR+fqumKlbVUqrU3Sfj+HY8a5anfq3+8LjINCzfa2E=;
  b=drsUaTxMvr617z0o5+7pxfwCygGd3TGzjI+7nS7wjhQuT3Ud+LPGdn2V
   U9J9zaPQBgjzIvESg0+hSINkc1kawZ17UXramOehctwbsp/KPWv5haVq9
   ND9OCgLDvSqk0pKnfs1aQKesoF40PHlvAzSpX/D6Ww1HjJLAHjbZz2Y7Y
   E=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 25 Apr 2022 03:18:12 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2022 03:18:12 -0700
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 25 Apr 2022 03:18:11 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 25 Apr 2022 03:18:10 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <quic_jackp@quicinc.com>,
        "Linyu Yuan" <quic_linyyuan@quicinc.com>
Subject: [PATCH v7 0/2] usb: typec: ucsi: allow retry to find role switch
Date:   Mon, 25 Apr 2022 18:18:04 +0800
Message-ID: <1650881886-25530-1-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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

v7: change break condition in ucsi_unregister_connectors()

Linyu Yuan (2):
  usb: typec: ucsi: add a common function ucsi_unregister_connectors()
  usb: typec: ucsi: Wait for the USB role switches

 drivers/usb/typec/ucsi/ucsi.c | 85 +++++++++++++++++++++++++------------------
 drivers/usb/typec/ucsi/ucsi.h |  6 ++-
 2 files changed, 54 insertions(+), 37 deletions(-)

-- 
2.7.4

