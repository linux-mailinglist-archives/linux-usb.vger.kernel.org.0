Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18E994B9575
	for <lists+linux-usb@lfdr.de>; Thu, 17 Feb 2022 02:25:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230226AbiBQBXM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Feb 2022 20:23:12 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:52744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230161AbiBQBXL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Feb 2022 20:23:11 -0500
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 793201F2246
        for <linux-usb@vger.kernel.org>; Wed, 16 Feb 2022 17:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1645060978; x=1676596978;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Yh0U+Fpze+az2LWG9k9AT/kjycKUsufdPMlhzP1JJXQ=;
  b=dXcSbIie+aZ4/pXLSLxGf/XsieatNmXV+n/U6WIviEKCBlgbn3halp+U
   GGcGpdxzytn3GD4f2q95LbrLA7zI6ZKBWKixlNOifhxwIP+Np6Be645oN
   tEMdsv2AAvKrXlB1UFfvCADQw96YF9BHBXK5VJkJ/QQCDwFEniWlHPzI7
   I=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 16 Feb 2022 17:22:58 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2022 17:22:57 -0800
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Wed, 16 Feb 2022 17:22:57 -0800
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 16 Feb 2022 17:22:56 -0800
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <quic_jackp@quicinc.com>,
        "Linyu Yuan" <quic_linyyuan@quicinc.com>
Subject: [PATCH v2 0/5] usb: xhci: fix of some code/comment
Date:   Thu, 17 Feb 2022 09:22:46 +0800
Message-ID: <1645060971-27141-1-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
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

Only samll change, no description here.

v2: fix checkpatch warning on patch#1,
    thanks to Sergei Shtylyov and Greg Kroah-Hartman

Linyu Yuan (5):
  usb: host: xhci: use ffs() in xhci_mem_init()
  usb: host: xhci: fix a comment typo in xhci_mem_init()
  usb: host: xhci: update hci_version operation in xhci_gen_setup()
  usb: host: xhci: add blank line in xhci_halt()
  usb: host: xhci: remove init to some ret/retval

 drivers/usb/host/xhci-mem.c |  8 ++------
 drivers/usb/host/xhci.c     | 14 ++++++++------
 2 files changed, 10 insertions(+), 12 deletions(-)

-- 
2.7.4

