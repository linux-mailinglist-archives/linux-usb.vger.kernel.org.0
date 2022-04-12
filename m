Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B2514FDE95
	for <lists+linux-usb@lfdr.de>; Tue, 12 Apr 2022 13:54:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348674AbiDLLuy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Apr 2022 07:50:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354156AbiDLLsw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Apr 2022 07:48:52 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37FE75838E
        for <linux-usb@vger.kernel.org>; Tue, 12 Apr 2022 03:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1649759417; x=1681295417;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FppnTsoZl9F3KLtLqc+75wscQ7KZJdmCl7xdELoBx8c=;
  b=dZ6xIpdIdIInVWUrLh1mGxV4UW0MsCEU4X3e7C/KjbfROd885o5p5jNu
   AopMj2hoPhrt8qv7w5gPvrN/vz4YJWVDFLQLO4C5zeEB+ITKmZ/vloNNH
   C7BHZGx0RQsEzFgWtEszHPxaNhh5c02cI2/6LwPOl5h29GQrJfOnkCZeL
   c=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 12 Apr 2022 03:30:14 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2022 03:30:14 -0700
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 12 Apr 2022 03:30:13 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 12 Apr 2022 03:30:11 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <quic_jackp@quicinc.com>,
        "Linyu Yuan" <quic_linyyuan@quicinc.com>
Subject: [PATCH 0/3] usb: typec: ucsi: allow retry to find role switch
Date:   Tue, 12 Apr 2022 18:30:04 +0800
Message-ID: <1649759407-24049-1-git-send-email-quic_linyyuan@quicinc.com>
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

when one role switch module built as module, it may load later then
ucsi, this change series allow retry from ucsi.

Linyu Yuan (3):
  usb: typec: ucsi: set con->port to NULL when register port fail
  usb: typec: ucsi: add a common function ucsi_connector_clean()
  usb: typec: ucsi: retry find role swithch when module load late

 drivers/usb/typec/ucsi/ucsi.c | 75 +++++++++++++++++++++++--------------------
 drivers/usb/typec/ucsi/ucsi.h |  2 +-
 2 files changed, 41 insertions(+), 36 deletions(-)

-- 
2.7.4

