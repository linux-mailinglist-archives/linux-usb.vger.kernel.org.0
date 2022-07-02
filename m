Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAC1A563F2D
	for <lists+linux-usb@lfdr.de>; Sat,  2 Jul 2022 11:09:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231557AbiGBJJk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 2 Jul 2022 05:09:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231540AbiGBJJj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 2 Jul 2022 05:09:39 -0400
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E15821ADB3
        for <linux-usb@vger.kernel.org>; Sat,  2 Jul 2022 02:09:36 -0700 (PDT)
X-UUID: 0095c05ae3ad4ae5860fd9202def3370-20220702
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7,REQID:51ec707d-2b1a-4e41-85f0-7aafcad8ad1b,OB:0,LO
        B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
        ON:release,TS:0
X-CID-META: VersionHash:87442a2,CLOUDID:466a5b86-57f0-47ca-ba27-fe8c57fbf305,C
        OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
        ,QS:nil,BEC:nil,COL:0
X-UUID: 0095c05ae3ad4ae5860fd9202def3370-20220702
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 807459761; Sat, 02 Jul 2022 17:09:31 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sat, 2 Jul 2022 17:09:30 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 2 Jul 2022 17:09:30 +0800
Message-ID: <f6f308d2ffe9a40d3182a923308162d7c4d80a6b.camel@mediatek.com>
Subject: Re: support USB 3.2 function remote wake
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Felipe Balbi <balbi@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        <linux-usb@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Date:   Sat, 2 Jul 2022 17:09:30 +0800
In-Reply-To: <Yrwn6Y7OMdPtN+g/@kroah.com>
References: <cd7169df640fe6dab85f6d94cb8f40c181e08d2b.camel@mediatek.com>
         <Yrwn6Y7OMdPtN+g/@kroah.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK:  N
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 2022-06-29 at 12:22 +0200, Greg Kroah-Hartman wrote:
> On Wed, Jun 29, 2022 at 05:02:54PM +0800, Chunfeng Yun wrote:
> > Hi,
> > 
> > I plan to support function remote wakeup on our usb3 device
> > controller
> > driver.
> 
> Is this based on dwc3 or some new silicon?
Based on mtu3;

> 
> > A function may signal that it wants to exit from Function Suspend
> > by
> > sending a Function Wake Notification to the host, and the
> > notification
> > need knows the first interface number in this function.
> > But the current gadget ops:
> >     int (*wakeup)(struct usb_gadget *);
> > does not provide information about interface number;
> 
> Why would the interface matter as you need to do this for the whole
> device, not just one interface, right?
Yes, it is, but usb3.2 only supports function remote wakeup.

I look at the code of core/hub.c, as described in function
usb_enable_remote_wakeup():
" For USB-3 devices: Assume there's only one function on the device and
enable remote wake for the first interface.  FIXME if the interface
association descriptor shows there's more than one function.
"
It assume the interface number is 0, and don't support multi-function
devices with IAD.

> 
> > There seems to be two ways:
> > 1. add a new parameter as below,
> >     int (*wakeup)(struct usb_gadget *, u8 intf);
> > 2. add a new ops, such as,
> >     int (*function_wakeup)(struct usb_gadget *, u8 intf);
> > 
> > Do you have any suggestions?
> 
> Look at what the existing ones do, 
Yes, I looked at all existing ones that support remote wakeup, but
seems no one support function wakeup (maybe also assume the interface
number is 0 if it does);

If we also follow the ways of host, no need change ops.
but there is also limitation for composite device with IAD;


> I do not think you have different
> suspend levels per USB interface, but rather the whole device.

>   Try it
> and see.
> 
> thanks,
> 
> greg k-h

