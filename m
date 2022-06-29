Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7503C55FB3E
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jun 2022 11:03:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230226AbiF2JDK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Jun 2022 05:03:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231256AbiF2JDJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Jun 2022 05:03:09 -0400
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB4F324F3D
        for <linux-usb@vger.kernel.org>; Wed, 29 Jun 2022 02:03:02 -0700 (PDT)
X-UUID: 2b5594239dae4aefb2b4314bf4e70ff8-20220629
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7,REQID:fcdd13a8-c918-46d0-af8b-75d78fa1d17f,OB:0,LO
        B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,RULE:Release_Ham,ACT
        ION:release,TS:95
X-CID-INFO: VERSION:1.1.7,REQID:fcdd13a8-c918-46d0-af8b-75d78fa1d17f,OB:0,LOB:
        0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,RULE:Spam_GS981B3D,ACT
        ION:quarantine,TS:95
X-CID-META: VersionHash:87442a2,CLOUDID:1ad0f262-0b3f-4b2c-b3a6-ed5c044366a0,C
        OID:d255aea6f365,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
        RL:0,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: 2b5594239dae4aefb2b4314bf4e70ff8-20220629
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 308305505; Wed, 29 Jun 2022 17:02:58 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Wed, 29 Jun 2022 17:02:56 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 29 Jun 2022 17:02:54 +0800
Message-ID: <cd7169df640fe6dab85f6d94cb8f40c181e08d2b.camel@mediatek.com>
Subject: support USB 3.2 function remote wake
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Felipe Balbi <balbi@kernel.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        <linux-usb@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Date:   Wed, 29 Jun 2022 17:02:54 +0800
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK:  N
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H2,
        RDNS_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,T_SPF_HELO_TEMPERROR,
        UNPARSEABLE_RELAY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I plan to support function remote wakeup on our usb3 device controller
driver.

A function may signal that it wants to exit from Function Suspend by
sending a Function Wake Notification to the host, and the notification
need knows the first interface number in this function.
But the current gadget ops:
    int (*wakeup)(struct usb_gadget *);
does not provide information about interface number;

There seems to be two ways:
1. add a new parameter as below,
    int (*wakeup)(struct usb_gadget *, u8 intf);
2. add a new ops, such as,
    int (*function_wakeup)(struct usb_gadget *, u8 intf);

Do you have any suggestions?

Thanks a lot

