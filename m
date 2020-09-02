Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 002BC25AB6D
	for <lists+linux-usb@lfdr.de>; Wed,  2 Sep 2020 14:49:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbgIBMte (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Sep 2020 08:49:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726946AbgIBMtP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Sep 2020 08:49:15 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21BFEC061244
        for <linux-usb@vger.kernel.org>; Wed,  2 Sep 2020 05:49:09 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id w3so5719914ljo.5
        for <linux-usb@vger.kernel.org>; Wed, 02 Sep 2020 05:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LqTtPLBtsEDSbZmcl4IMKK5jwQ20N2yF7JqxomiN65g=;
        b=FI4UwPM/VoHfwqSsZeFJspW1QaZx7u+R7F4xvLB9c8Mi2HtH397ze9v64wThJLlDzd
         IK5Zf8ZeUIurxMQ7Sdjjb5k75eXp36q6A++iFXj8B3Xf2OGnZAhFFZYhZPRCec/oqhH1
         dpkF2wjb36E4ZPFlOowBhMHDIGdGXzAeOAnJMsLGdfgXuTUlQwzoaSUEpep1xPOXOlU2
         upj58/xLx9KGPCHo795Aib9R9onw6CK5bG6sysOqMBECmCvtU+VHIwV9HTIJvVYRkoAX
         HzDzzlxQ4c3yInPL0muhEwyggyh2w90QbcZ7eo79FTwE9BqKRRbGLl4zmv7WAZqO330G
         K6iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LqTtPLBtsEDSbZmcl4IMKK5jwQ20N2yF7JqxomiN65g=;
        b=PQYurJYvfD16GErUb3OmwfJ6fDAJxOL2VdxiCL9ZBxauUIsztSBLm1/QS9aNBJz81Q
         mQw6+ecpbpfoPfbX4ZHtbVg3Qqm5nJQUBb621V+e3WhkIpiMqeg7PThEEsqZlvwC7xZv
         DxG64H+aKdmEXmCKJU+IW1oXShlEKoEL6W9RmHnXu6jAaXbIDWHTAO9bSUlM3l7OvhKl
         wwQHZUoZUNK26mA69sWiocFk/dEix+IpnfT99jN+8OyJEGUx9h8agtJTV+LieVrj5ppt
         4m9q+eGfQR1CTXWE4lIF6TFpMukKtgLssjR/3mbCHG9Y/0VotkhfYqyCfDf/s1akL70Q
         LH0Q==
X-Gm-Message-State: AOAM533t8BsSl5O0MIvlPiwu5zO6LhDPDemAAd24wBKConzepgdnHurK
        hkBo1fqHFS8aH9m+FeHl3DXu1E2dqDk1Qa2N+Z4=
X-Google-Smtp-Source: ABdhPJyTGW3H3YDITnLM58g3t70g+a5Osoa+KMiwZkVpgQaCm08+o3fEtdLcsBQoxZDUrxQvmoC6NGzyvL7177yk8aM=
X-Received: by 2002:a2e:8ed4:: with SMTP id e20mr3427555ljl.403.1599050947442;
 Wed, 02 Sep 2020 05:49:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200902003018.4870-1-festevam@gmail.com> <20200902003018.4870-5-festevam@gmail.com>
 <CAK8P3a3dND41JAVNRrQacuTXg2TJ+kTC1oCE5wBs+xGsUDCDKg@mail.gmail.com>
In-Reply-To: <CAK8P3a3dND41JAVNRrQacuTXg2TJ+kTC1oCE5wBs+xGsUDCDKg@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Wed, 2 Sep 2020 09:48:55 -0300
Message-ID: <CAOMZO5DDNqCOkHvyNdrGe7PM5RVCLr=2KOnP0ZnA3aOqy_cDOQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] ARM: imx: Remove ehci board files
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sascha Hauer <kernel@pengutronix.de>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        USB list <linux-usb@vger.kernel.org>,
        gregkh <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Arnd,

On Wed, Sep 2, 2020 at 5:49 AM Arnd Bergmann <arnd@arndb.de> wrote:

> Do you plan to send another patch to remove linux/platform_data/usb-ehci-mxc.h
> and parts of drivers/usb/host/ehci-mxc.c, to get merged by the USB maintainers?
> I suppose we could merge that at the same time through the soc tree, or
> separately, but it would make sense to get it done.

Yes, I plan to remove the drivers pieces after this series lands into
a -rc1 release.

Besides drivers/usb/host/ehci-mxc.c that you mentioned, there are
other drivers that can also be removed:

drivers/usb/host/imx21-hcd.c
drivers/usb/host/imx21-dbg.c
drivers/pinctrl/freescale/pinctrl-imx21.c
drivers/clk/imx/clk-imx21.c

Thanks,

Fabio Estevam
