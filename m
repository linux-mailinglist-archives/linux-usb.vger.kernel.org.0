Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 502C4E9528
	for <lists+linux-usb@lfdr.de>; Wed, 30 Oct 2019 03:59:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727166AbfJ3C7j (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Oct 2019 22:59:39 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:26172 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726714AbfJ3C7i (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Oct 2019 22:59:38 -0400
X-UUID: 8724ae1046364aa8be58c46b1651877e-20191030
X-UUID: 8724ae1046364aa8be58c46b1651877e-20191030
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 294978755; Wed, 30 Oct 2019 10:59:24 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Wed, 30 Oct
 2019 10:59:19 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 30 Oct 2019 10:59:19 +0800
Message-ID: <1572404361.18464.24.camel@mhfsdcap03>
Subject: Re: [PATCH 1/5] phy: rockchip: add inno-usb3 phy driver
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Peter Geis <pgwipeout@gmail.com>
CC:     <katsuhiro@katsuster.net>, <linux-rockchip@lists.infradead.org>,
        <linux-usb@vger.kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Heiko Stuebner" <heiko@sntech.de>
Date:   Wed, 30 Oct 2019 10:59:21 +0800
In-Reply-To: <CAMdYzYoOQ_C_f2v-3XBid8X0fc6z3Bw0XqRi3CQiwCzRLT-_0g@mail.gmail.com>
References: <20191028182254.30739-1-pgwipeout@gmail.com>
         <20191028182254.30739-2-pgwipeout@gmail.com>
         <1572315115.18464.11.camel@mhfsdcap03>
         <CAMdYzYoOQ_C_f2v-3XBid8X0fc6z3Bw0XqRi3CQiwCzRLT-_0g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-SNTS-SMTP: 0AE19865E2DAD4FAC6FEAE85F7F15EF9A86E6F117FE265F40C325C4671791EE82000:8
X-MTK:  N
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 2019-10-29 at 11:26 -0400, Peter Geis wrote:
> On Mon, Oct 28, 2019 at 10:12 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
> >
> > On Mon, 2019-10-28 at 18:22 +0000, Peter Geis wrote:
> > > Add the rockchip innosilicon usb3 phy driver, supporting devices such as the rk3328.
> > > Pulled from:
> > > https://github.com/FireflyTeam/kernel/blob/roc-rk3328-cc/drivers/phy/rockchip/phy-rockchip-inno-usb3.c
> > >
> > > Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> > > ---
> > >  drivers/phy/rockchip/Kconfig                  |    9 +
> > >  drivers/phy/rockchip/Makefile                 |    1 +
> > >  drivers/phy/rockchip/phy-rockchip-inno-usb3.c | 1107 +++++++++++++++++
> > >  3 files changed, 1117 insertions(+)
> > >  create mode 100644 drivers/phy/rockchip/phy-rockchip-inno-usb3.c
> > >
...
> > > +static int rk3328_u3phy_pipe_power(struct rockchip_u3phy *u3phy,
> > > +                                struct rockchip_u3phy_port *u3phy_port,
> > > +                                bool on)
> > > +{
> > > +     unsigned int reg;
> > > +
> > > +     if (on) {
> > > +             reg = readl(u3phy_port->base + 0x1a8);
> > > +             reg &= ~BIT(4); /* ldo power up */
> > > +             writel(reg, u3phy_port->base + 0x1a8);
> > > +
> > > +             reg = readl(u3phy_port->base + 0x044);
> > > +             reg &= ~BIT(4); /* bg power on */
> > > +             writel(reg, u3phy_port->base + 0x044);
> > > +
> > > +             reg = readl(u3phy_port->base + 0x150);
> > > +             reg |= BIT(6); /* tx bias enable */
> > > +             writel(reg, u3phy_port->base + 0x150);
> > > +
> > > +             reg = readl(u3phy_port->base + 0x080);
> > > +             reg &= ~BIT(2); /* tx cm power up */
> > > +             writel(reg, u3phy_port->base + 0x080);
> > > +
> > > +             reg = readl(u3phy_port->base + 0x0c0);
> > > +             /* tx obs enable and rx cm enable */
> > > +             reg |= (BIT(3) | BIT(4));
> > > +             writel(reg, u3phy_port->base + 0x0c0);
> > > +
> > > +             udelay(1);
> > > +     } else {
> > > +             reg = readl(u3phy_port->base + 0x1a8);
> > > +             reg |= BIT(4); /* ldo power down */
> > > +             writel(reg, u3phy_port->base + 0x1a8);
> > > +
> > > +             reg = readl(u3phy_port->base + 0x044);
> > > +             reg |= BIT(4); /* bg power down */
> > > +             writel(reg, u3phy_port->base + 0x044);
> > > +
> > > +             reg = readl(u3phy_port->base + 0x150);
> > > +             reg &= ~BIT(6); /* tx bias disable */
> > > +             writel(reg, u3phy_port->base + 0x150);
> > > +
> > > +             reg = readl(u3phy_port->base + 0x080);
> > > +             reg |= BIT(2); /* tx cm power down */
> > > +             writel(reg, u3phy_port->base + 0x080);
> > > +
> > > +             reg = readl(u3phy_port->base + 0x0c0);
> > > +             /* tx obs disable and rx cm disable */
> > > +             reg &= ~(BIT(3) | BIT(4));
> > > +             writel(reg, u3phy_port->base + 0x0c0);
> > > +     }
> > Try to avoid magic number
> 
> Since this was not my driver, I only pulled it in and made the
> necessary changes to get it working, I tried to refrain from
> modifications as much as possible.
> Do you want me to convert these addresses to definitions based on the
> comments in the code?
It's better to follow register names defined in register map doc if you
have
> 
> >
> > > +
> > > +     return 0;
> > > +}
> > > +


