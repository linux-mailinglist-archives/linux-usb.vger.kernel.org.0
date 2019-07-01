Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B281133F1A
	for <lists+linux-usb@lfdr.de>; Tue,  4 Jun 2019 08:43:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726728AbfFDGnn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 Jun 2019 02:43:43 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:50335 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726410AbfFDGnn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 4 Jun 2019 02:43:43 -0400
X-UUID: 2e603b6cad4e44d19cccac9ff12737bb-20190604
X-UUID: 2e603b6cad4e44d19cccac9ff12737bb-20190604
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 546401711; Tue, 04 Jun 2019 14:43:35 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Tue, 4 Jun
 2019 14:43:34 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 4 Jun 2019 14:43:33 +0800
Message-ID: <1559630613.8487.60.camel@mhfsdcap03>
Subject: Re: [PATCH v6 05/10] usb: roles: Introduce stubs for the exiting
 functions in role.h.
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Li Jun <jun.li@nxp.com>,
        "Badhri Jagan Sridharan" <badhri@google.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Min Guo <min.guo@mediatek.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        Biju Das <biju.das@bp.renesas.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Yu Chen <chenyu56@huawei.com>,
        John Stultz <john.stultz@linaro.org>
Date:   Tue, 4 Jun 2019 14:43:33 +0800
In-Reply-To: <20190603131929.GC10397@kroah.com>
References: <1559115828-19146-1-git-send-email-chunfeng.yun@mediatek.com>
         <1559115828-19146-6-git-send-email-chunfeng.yun@mediatek.com>
         <20190603131929.GC10397@kroah.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-MTK:  N
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 2019-06-03 at 15:19 +0200, Greg Kroah-Hartman wrote:
> On Wed, May 29, 2019 at 03:43:43PM +0800, Chunfeng Yun wrote:
> > From: Yu Chen <chenyu56@huawei.com>
> > 
> > This patch adds stubs for the exiting functions while
> > CONFIG_USB_ROLE_SWITCH does not enabled.
> > 
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Cc: Hans de Goede <hdegoede@redhat.com>
> > Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
> > Cc: John Stultz <john.stultz@linaro.org>
> > Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Signed-off-by: Yu Chen <chenyu56@huawei.com>
> 
> Same here, you need to sign off on it too.
Ok, thanks
> 
> thanks,
> 
> greg k-h


