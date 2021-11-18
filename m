Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1CDF4553F8
	for <lists+linux-usb@lfdr.de>; Thu, 18 Nov 2021 05:53:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243067AbhKRE4q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 Nov 2021 23:56:46 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:52295 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243057AbhKRE4o (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Nov 2021 23:56:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1637211225; x=1668747225;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UGN28NHaeAT2m61iq/xftEs+1OZPte6wPM6zNcbkP9I=;
  b=q19774ZzMn06vnrNMzBbp1HutIJkrOxP9jqb5HiSI/eh18C6o4ihp5hu
   99qCiH7tJd7/7jcmLT1dxxvT4TpwBoMO6aarHrS/t8BNghLy+hbwap5nE
   DVGUnduiZp8JTYC9ewRWggGoR55oDQPdwqVD6hR/IAedqlMvczMnROg/E
   A=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 17 Nov 2021 20:53:43 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2021 20:53:43 -0800
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 17 Nov 2021 20:53:43 -0800
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 17 Nov 2021 20:53:41 -0800
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <quic_jackp@quicinc.com>,
        "Linyu Yuan" <quic_linyyuan@quicinc.com>
Subject: [PATCH 0/4] usb: gadget: configfs: several cleanup change
Date:   Thu, 18 Nov 2021 12:53:29 +0800
Message-ID: <1637211213-16400-1-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

only cleanup change, please check each change following.

Linyu Yuan (4):
  usb: gadget: configfs: simplify os_desc_item_to_gadget_info() helper
  usb: gadget: configfs: remove os_desc_attr_release()
  usb: gadget: configfs: use to_config_usb_cfg() in os_desc_link()
  usb: gadget: configfs: use to_usb_function_instance() in cfg (un)link
    func

 drivers/usb/gadget/configfs.c | 39 +++++++++------------------------------
 1 file changed, 9 insertions(+), 30 deletions(-)

-- 
2.7.4

