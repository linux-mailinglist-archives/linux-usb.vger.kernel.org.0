Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4461C1172AE
	for <lists+linux-usb@lfdr.de>; Mon,  9 Dec 2019 18:24:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbfLIRYR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Dec 2019 12:24:17 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:54382 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726265AbfLIRYR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Dec 2019 12:24:17 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB9HOCKp107743;
        Mon, 9 Dec 2019 11:24:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1575912252;
        bh=3AzuSrnA9AKNu+frGlN9Vx3Ur4LUQcdYSPvwOHRnbTM=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=UwUzIJeRm32hNBQDEdj3QQxmCSn5WYHZezoacvxuRxcgeB7DiphLYaB7U17QjuWiS
         jnOm803vdE3AFph49vPvDuVtX4I+s5epJIE/6h2Az3nQ4TTJq522OOJtIv82Zxs2j0
         vAUHMi/N4z4mXiJ7IqmSbcVBy2mqgkoKgsEVH4nw=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB9HOCkE097817;
        Mon, 9 Dec 2019 11:24:12 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 9 Dec
 2019 11:24:11 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 9 Dec 2019 11:24:11 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB9HOBpL031494;
        Mon, 9 Dec 2019 11:24:11 -0600
Date:   Mon, 9 Dec 2019 11:23:39 -0600
From:   Bin Liu <b-liu@ti.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH] musb: davinci: Convert to use GPIO descriptor
Message-ID: <20191209172339.GB26131@uda0271908>
Mail-Followup-To: Bin Liu <b-liu@ti.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-usb <linux-usb@vger.kernel.org>, Sekhar Nori <nsekhar@ti.com>,
        Tony Lindgren <tony@atomide.com>
References: <20191205142200.145252-1-linus.walleij@linaro.org>
 <20191205201936.GA19754@uda0271908>
 <CACRpkdb1dY-fnH8Muse7gFoxzA2PhpLFskWJ+dz6DHbvm7H7zQ@mail.gmail.com>
 <CAMpxmJWRbQOFP_Ftq7q89P-f=3A3Q_wCKaRv6Zki=UJPsPqjvg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpxmJWRbQOFP_Ftq7q89P-f=3A3Q_wCKaRv6Zki=UJPsPqjvg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Dec 09, 2019 at 11:41:29AM +0100, Bartosz Golaszewski wrote:
> pon., 9 gru 2019 o 01:25 Linus Walleij <linus.walleij@linaro.org> napisał(a):
> >
> > On Thu, Dec 5, 2019 at 9:20 PM Bin Liu <b-liu@ti.com> wrote:
> > > On Thu, Dec 05, 2019 at 03:22:00PM +0100, Linus Walleij wrote:
> > > > The DaVinci MUSB glue contains an optional GPIO line to
> > > > control VBUS power, convert this to use a GPIO descriptor
> > > > and augment the EVM board file to provide this descriptor.
> > > >
> > > > I can't get this driver to compile properly and it depends
> > > > on broken but when I didn get it to compile brokenly, it
> > > > did at least not complain about THIS code being broken so
> > > > I don't think I broke the driver any more than what it
> > > > already is.
> > > >
> > > > I did away with the ifdefs that do not work with
> > > > multiplatform anyway so the day someone decides to
> > > > resurrect the code, the path to get it working should be
> > > > easier as well since DaVinci is now multiplatform.
> > >
> > > Generally I don't take such patches unless they are part of the effort
> > > to un-broken the driver. But is this patch a prerequisite of any cleanup
> > > in DaVinci family or ARM architecture? What is the motivation of this
> > > patch?
> >
> > The motivation is the clean-up of the internal GPIO API for the
> > kernel. It is described in drivers/gpio/TODO
> >
> > I can propose a patch simply deleting the code if you prefer that,
> > then whoever want to resurrect it can still get it out of git if
> > they need. As long as nothing includes <linux/gpio.h> anymore,
> > I am happy.
> >
> > Yours,
> > Linus Walleij
> 
> I have a related WiP series that removes calls to legacy GPIO API from
> the dm355-evm which uses the same driver. Hopefully this week I'll
> have some time to take a look at it, especially since I've got the
> relevant HW now. Who knows, maybe I'll even resurrect this code. :)
> 
> In other words: please hold off removing of this driver.

Sounds good. I will review and consider taking this patch then. Thanks.
-Bin.
