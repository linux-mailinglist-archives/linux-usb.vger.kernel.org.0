Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF2F7538DD7
	for <lists+linux-usb@lfdr.de>; Tue, 31 May 2022 11:36:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245319AbiEaJgY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 May 2022 05:36:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238680AbiEaJgX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 May 2022 05:36:23 -0400
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F2EF819BE
        for <linux-usb@vger.kernel.org>; Tue, 31 May 2022 02:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1653989782; x=1685525782;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CRd+0vixje8x8KfN2Pkxtt7YwDEJRpyNPrKJcNe2Bjk=;
  b=piSJLaeACGKK3ix/psYRcB1heHSSe95SuV4KOU+Wcr0rxTErBXLEoWql
   lvdqHfIxelKt7VI/AevYAV0Rwu+Gnk682jheOXerCMDW4O9JRGwDGaRU8
   VYhN32WgoRsYuJCy3ZhFoX3xbQGhPcMf6eDjxSjPn8fFmMDyNo/wOhKR2
   Q=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 31 May 2022 02:36:22 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2022 02:36:21 -0700
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 31 May 2022 02:36:21 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 31 May 2022 02:36:19 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>,
        Michael Wu <michael@allwinnertech.com>,
        "John Keeping" <john@metanate.com>,
        Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH v1 0/2] usb: f_fs: safe operation in ffs_epfile_io()
Date:   Tue, 31 May 2022 17:36:13 +0800
Message-ID: <1653989775-14267-1-git-send-email-quic_linyyuan@quicinc.com>
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

Fix two possible issue in ffs_epfile_io() when operation at blocking mode.

(note: Two changes queue internally for a long time, when I saw Michael Wu
send a patch[1], I also share to him, there is some discussion
but still not get his ACK. now also saw John Keeping comment
the change, this change is doing a little difference, hope it not break
the rules.)

[1]
https://lore.kernel.org/linux-usb/YpUJkxWBNuZiW7Xk@donbot/T/#m52a26046ed0e3ca4e7b4181c7c808f9e6d1f3ba5

Linyu Yuan (2):
  usb: gadget: ffs: change ep->status safe in ffs_epfile_io()
  usb: gadget: ffs: change ep->ep safe in ffs_epfile_io()

 drivers/usb/gadget/function/f_fs.c | 38 +++++++++++++++++++++++---------------
 1 file changed, 23 insertions(+), 15 deletions(-)

-- 
2.7.4

