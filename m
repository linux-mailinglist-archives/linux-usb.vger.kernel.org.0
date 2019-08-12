Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 828A789F09
	for <lists+linux-usb@lfdr.de>; Mon, 12 Aug 2019 15:00:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728694AbfHLNA3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Aug 2019 09:00:29 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:57833 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726219AbfHLNA3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Aug 2019 09:00:29 -0400
X-UUID: 53c2d70d97e64f8699f36aab25cc9aef-20190812
X-UUID: 53c2d70d97e64f8699f36aab25cc9aef-20190812
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 371178606; Mon, 12 Aug 2019 21:00:20 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Mon, 12 Aug
 2019 21:00:18 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 12 Aug 2019 21:00:17 +0800
Message-ID: <1565614819.23705.51.camel@mhfsdcap03>
Subject: Re: [Patch V6 7/8] usb: gadget: Add UDC driver for tegra XUSB
 device mode controller
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Felipe Balbi <balbi@kernel.org>
CC:     Nagarjuna Kristam <nkristam@nvidia.com>,
        <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <mark.rutland@arm.com>,
        <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>
Date:   Mon, 12 Aug 2019 21:00:19 +0800
In-Reply-To: <871rxqtupm.fsf@gmail.com>
References: <1565257046-9890-1-git-send-email-nkristam@nvidia.com>
         <1565257046-9890-8-git-send-email-nkristam@nvidia.com>
         <1565613783.23705.49.camel@mhfsdcap03> <871rxqtupm.fsf@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-SNTS-SMTP: 4804CDD8EB6E645A292BB2AC41A650CFF13D0421FF3FBABBE2C36AD4823CFE292000:8
X-MTK:  N
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 2019-08-12 at 15:49 +0300, Felipe Balbi wrote:
> Hi,
> 
> Chunfeng Yun <chunfeng.yun@mediatek.com> writes:
> >> +/* XUSB_DEV registers */
> >> +#define SPARAM 0x000
> >> +#define  SPARAM_ERSTMAX_SHIFT 16
> >> +#define  SPARAM_ERSTMAX_MASK GENMASK(4, 0)
> >> +#define DB 0x004
> >> +#define  DB_TARGET_SHIFT 8
> >> +#define  DB_TARGET_MASK GENMASK(7, 0)
> >> +#define  DB_STREAMID_SHIFT 16
> >> +#define  DB_STREAMID_MASK GENMASK(15, 0)
> > To me, define it as :
> > #define  DB_STREAMID_MASK GENMASK(31, 16),
> > it's more clearer.
> > and define another macro
> > #define  DB_STREAMID(x) (((x) & 0xffff) << 16)
> 
> perhaps?
> 
> #define DB_STREAMID(x)	(((x) << 16) & DB_STREAMID_MASK)
It's a better way :)

> 
> Otherwise you end up defining the mask twice.
> 


