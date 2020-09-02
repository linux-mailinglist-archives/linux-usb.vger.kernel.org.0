Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 484A225A8E8
	for <lists+linux-usb@lfdr.de>; Wed,  2 Sep 2020 11:50:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726312AbgIBJt7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Sep 2020 05:49:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726140AbgIBJt6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Sep 2020 05:49:58 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7AE7C061244
        for <linux-usb@vger.kernel.org>; Wed,  2 Sep 2020 02:49:57 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id f127so669180lfd.7
        for <linux-usb@vger.kernel.org>; Wed, 02 Sep 2020 02:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OPZtp5DzOlQtWdJ5Q7fRyQG3H1XFy+ULW0/pyHEjAi0=;
        b=vec1yE9qBA+CUJOInxgow9FHnQ/b3Bft2ntjsRy78Aq4cmZET1WUEPSD70bZai37f5
         9tPNxS6fjIOwWnfKhllOX9CXFjonsbTPTgyXZxnfVp2XdJL7HdcxjwYxHzsyaCXPvP9R
         edfZ+E4mVNJi55LvlFd5bzRxUk93v6pP2tyTq8JT+jfktGVX3HSSIsbLUDoB4eSzu0uk
         JET1KX8+oeywm1XZY9z/OzTTniX+bBr/TZIkObK/XLZOUWhiztDAhN3sExg6CmEnGSuZ
         KgjukarBFALDnVLUZoPnSeIf9V6AwHAnR9P/7o4n57clMOl4j9OwxKRyHqZc1u1TRYUJ
         DfQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OPZtp5DzOlQtWdJ5Q7fRyQG3H1XFy+ULW0/pyHEjAi0=;
        b=bowilYbOX55+AJbTX1zPpRsYAaxRANQ5CPX+A28B+XGyC61/UbUrnwKKe7nD5KWmSL
         f2TCoQiJCX/CC5QXyQKfC1LRqNEBhkSlUH3qx38VeYjL2N1CP3Rxo6VLvJjs6rJCnBDn
         oU30y11n4toGtSAhT1dsjoSwTdx96SeJsj3bsj09ZTdYPWzNDAf2u1ZkFXIbucu5H0f0
         EyO7jrAWeGkItHFzDL2Fh9LziuozxJQgeoupI367LuWrxfWr6uj4fEJmrmi3fL0j5D+c
         SkS3n0YvDkrHI6P2tVFTsjhwU/smbFuzv7Nmkh2ucDPAmuP+9cV5KoZter2hS1H2N6rD
         pkjw==
X-Gm-Message-State: AOAM531zy9kpldJS4l+6H+Lu0OUvxvyNtCTZJhbYym+iIYurMjwplgCP
        pZLnncVrR/rK4N+n68+9KswECU6nOYlIsWaW6k18yWTK6uo=
X-Google-Smtp-Source: ABdhPJxvWGwnrS5gG/w9CjUku7n8zMo64gFSW1jofh194aO87iVHOdifoMcEUTEjSrtI4Ad9/Df9AIhcAlMVmuRVhHs=
X-Received: by 2002:a05:6512:2010:: with SMTP id a16mr2878060lfb.196.1599040196126;
 Wed, 02 Sep 2020 02:49:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200825021120.4926-1-peter.chen@nxp.com> <20200825021120.4926-4-peter.chen@nxp.com>
 <87eensi5tc.fsf@kernel.org> <20200828011613.GC13910@b29397-desktop>
In-Reply-To: <20200828011613.GC13910@b29397-desktop>
From:   Peter Chen <hzpeterchen@gmail.com>
Date:   Wed, 2 Sep 2020 17:49:44 +0800
Message-ID: <CAL411-qhZ9iBY+CZO-g=w+Rmo7dQO92QJ25=phC+vJfSooNZfw@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] usb: cdns3: imx: add glue layer runtime pm implementation
To:     Peter Chen <peter.chen@nxp.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "pawell@cadence.com" <pawell@cadence.com>,
        "rogerq@ti.com" <rogerq@ti.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Jun Li <jun.li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

B
> >
> > > Add imx glue layer runtime pm implementation, and the runtime
> > > pm is default off.
> > >
> > > Reviewed-by: Pawel Laszczak <pawell@cadence.com>
> > > Signed-off-by: Peter Chen <peter.chen@nxp.com>
> > > ---
> > >  drivers/usb/cdns3/cdns3-imx.c | 203 ++++++++++++++++++++++++++++++++--
> > >  1 file changed, 192 insertions(+), 11 deletions(-)
> > >
> > > diff --git a/drivers/usb/cdns3/cdns3-imx.c b/drivers/usb/cdns3/cdns3-imx.c
> > > index aba988e71958..a413df26e948 100644
> > > --- a/drivers/usb/cdns3/cdns3-imx.c
> > > +++ b/drivers/usb/cdns3/cdns3-imx.c
> > > @@ -15,6 +15,8 @@
> > >  #include <linux/io.h>
> > >  #include <linux/of_platform.h>
> > >  #include <linux/iopoll.h>
> > > +#include <linux/pm_runtime.h>
> > > +#include "core.h"
> > >
> > >  #define USB3_CORE_CTRL1    0x00
> > >  #define USB3_CORE_CTRL2    0x04
> > > @@ -32,7 +34,7 @@
> > >  /* Register bits definition */
> > >
> > >  /* USB3_CORE_CTRL1 */
> > > -#define SW_RESET_MASK      (0x3f << 26)
> > > +#define SW_RESET_MASK      GENMASK(31, 26)
> >
> > why is this part of adding imx runtime pm?
>
> Sorry, will delete this improvement
> >
> > > @@ -44,17 +46,17 @@
> > >  #define OC_DISABLE BIT(9)
> > >  #define MDCTRL_CLK_SEL     BIT(7)
> > >  #define MODE_STRAP_MASK    (0x7)
> > > -#define DEV_MODE   (1 << 2)
> > > -#define HOST_MODE  (1 << 1)
> > > -#define OTG_MODE   (1 << 0)
> > > +#define DEV_MODE   BIT(2)
> > > +#define HOST_MODE  BIT(1)
> > > +#define OTG_MODE   BIT(0)
> >
> > and these?
>
> Sorry, will delete this improvement
>
> >
> > >
> > >  /* USB3_INT_REG */
> > >  #define CLK_125_REQ        BIT(29)
> > >  #define LPM_CLK_REQ        BIT(28)
> > >  #define DEVU3_WAEKUP_EN    BIT(14)
> > >  #define OTG_WAKEUP_EN      BIT(12)
> > > -#define DEV_INT_EN (3 << 8) /* DEV INT b9:8 */
> > > -#define HOST_INT1_EN (1 << 0) /* HOST INT b7:0 */
> > > +#define DEV_INT_EN GENMASK(9, 8) /* DEV INT b9:8 */
> > > +#define HOST_INT1_EN       BIT(0) /* HOST INT b7:0 */
> >
> Sorry, will delete this improvement
>
> >
> > > @@ -62,15 +64,34 @@
> > >  #define HOST_POWER_ON_READY        BIT(12)
> > >
> > >  /* USB3_SSPHY_STATUS */
> > > -#define CLK_VALID_MASK             (0x3f << 26)
> > > -#define CLK_VALID_COMPARE_BITS     (0xf << 28)
> > > -#define PHY_REFCLK_REQ             (1 << 0)
> > > +#define CLK_VALID_MASK             GENMASK(31, 26)
> > > +#define CLK_VALID_COMPARE_BITS     GENMASK(31, 28)
> > > +#define PHY_REFCLK_REQ             BIT(0)
> >
>
> Sorry, will delete this improvement
>
> >
> > > +/* OTG registers definition */
> > > +#define OTGSTS             0x4
> > > +/* OTGSTS */
> > > +#define OTG_NRDY   BIT(11)
> > > +
> > > +/* xHCI registers definition  */
> > > +#define XECP_PM_PMCSR              0x8018
> > > +#define XECP_AUX_CTRL_REG1 0x8120
> > > +
> > > +/* Register bits definition */
> > > +/* XECP_AUX_CTRL_REG1 */
> > > +#define CFG_RXDET_P3_EN            BIT(15)
> > > +
> > > +/* XECP_PM_PMCSR */
> > > +#define PS_MASK                    GENMASK(1, 0)
> > > +#define PS_D0                      0
> > > +#define PS_D1                      1
> >
> > I think only these are part of $subject
>
> Yes, you are right.
>
> >
> > >  struct cdns_imx {
> > >     struct device *dev;
> > >     void __iomem *noncore;
> > >     struct clk_bulk_data *clks;
> > >     int num_clks;
> > > +   struct platform_device *cdns3_pdev;
> > >  };
> > >
> > >  static inline u32 cdns_imx_readl(struct cdns_imx *data, u32 offset)
> > > @@ -126,6 +147,20 @@ static int cdns_imx_noncore_init(struct cdns_imx *data)
> > >     return ret;
> > >  }
> > >
> > > +static int cdns_imx_platform_suspend(struct device *dev,
> > > +   bool suspend, bool wakeup);
> > > +static struct cdns3_platform_data cdns_imx_pdata = {
> >
> > make it const?
>
> Will change

After thinking more, the platform data may be different for
different glue layer platforms. I will keep this unchanging.

Peter
