Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1062350AE62
	for <lists+linux-usb@lfdr.de>; Fri, 22 Apr 2022 05:10:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1443687AbiDVDNZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Apr 2022 23:13:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1443711AbiDVDNV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 Apr 2022 23:13:21 -0400
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4F914C789
        for <linux-usb@vger.kernel.org>; Thu, 21 Apr 2022 20:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1650597029; x=1682133029;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yQT4Yhe1yYQ74V8uQQq6ck22PH5SnEJXar5bttdSMJ4=;
  b=R+/hfGhpSxL54PVRMbIE1IbqExYCv4jqabWOyuJOOo2MqEQR1fFfMJMc
   6/U4VBr99fSMQ5sULsZ+F9xDwGWqEc5vCxe0CkICgwwZy4eQbIIVM078i
   jgvQkwcP2mKh4AwYcPHYy/zaSJWcMnvHfZDTj1d7BlN50whqDlx9EHCi8
   o=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 21 Apr 2022 20:10:28 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2022 20:10:28 -0700
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 21 Apr 2022 20:10:27 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 21 Apr 2022 20:10:26 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <quic_jackp@quicinc.com>,
        "Linyu Yuan" <quic_linyyuan@quicinc.com>
Subject: [PATCH v5 0/3] usb: typec: ucsi: allow retry to find role switch
Date:   Fri, 22 Apr 2022 11:10:19 +0800
Message-ID: <1650597022-19793-1-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
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

Linyu Yuan (3):
  usb: typec: ucsi: add a common function ucsi_unregister_connectors()
  usb: typec: ucsi: do not allocate one extra unused connector
  usb: typec: ucsi: Wait for the USB role switches

 drivers/usb/typec/ucsi/ucsi.c | 86 +++++++++++++++++++++++++------------------
 drivers/usb/typec/ucsi/ucsi.h |  6 ++-
 2 files changed, 55 insertions(+), 37 deletions(-)

-- 
2.7.4

