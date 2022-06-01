Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41277539BFA
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jun 2022 06:17:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232160AbiFAEPi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Jun 2022 00:15:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231753AbiFAEPd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Jun 2022 00:15:33 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DA782F01D
        for <linux-usb@vger.kernel.org>; Tue, 31 May 2022 21:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1654056932; x=1685592932;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=KXMaHbchQz01OpuywDGg7YXwNHRebIAtjJ5pjIw1stI=;
  b=meyHTZ89OZ+vHf4lfQaWlaRCDipVG5b4+SlP5qDnsFNgSr+LbaAJCiG3
   hxrvqeHHQoibkp71Bf9u2TU7Cg7mStnAdBnI72XyU/WUGDUQ/32yrvATh
   pqgLpSdzfvm17BQ9o3R664ee9evlZKrIMlACDmybHgKmAYJZrnhLxm+xS
   0=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 31 May 2022 21:15:31 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2022 21:15:31 -0700
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 31 May 2022 21:15:31 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 31 May 2022 21:15:29 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>,
        Michael Wu <michael@allwinnertech.com>,
        "John Keeping" <john@metanate.com>,
        Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH v3 0/2] usb: f_fs: safe operation in ffs_epfile_io()
Date:   Wed, 1 Jun 2022 12:15:14 +0800
Message-ID: <1654056916-2062-1-git-send-email-quic_linyyuan@quicinc.com>
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

Fix two possible issue in ffs_epfile_io() when operation at blocking mode.

v1: https://lore.kernel.org/linux-usb/1653989775-14267-1-git-send-email-quic_linyyuan@quicinc.com/
v2: correct interrupted variable according comment from John Keeping
v3: (v2: https://lore.kernel.org/linux-usb/1654006119-23869-1-git-send-email-quic_linyyuan@quicinc.com/)
    add Revived-by from John keeping,
    after offline discussion, add Reported-by from Michael Wu

Linyu Yuan (2):
  usb: gadget: f_fs: change ep->status safe in ffs_epfile_io()
  usb: gadget: f_fs: change ep->ep safe in ffs_epfile_io()

 drivers/usb/gadget/function/f_fs.c | 38 +++++++++++++++++++++++---------------
 1 file changed, 23 insertions(+), 15 deletions(-)

-- 
2.7.4

