Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B95863A3CF0
	for <lists+linux-usb@lfdr.de>; Fri, 11 Jun 2021 09:22:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230001AbhFKHYb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Jun 2021 03:24:31 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:38991 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229960AbhFKHYb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Jun 2021 03:24:31 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.nyi.internal (Postfix) with ESMTP id 33F9258049A;
        Fri, 11 Jun 2021 03:22:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Fri, 11 Jun 2021 03:22:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=5YiBwSdJLoDEOuRL8pQdjIm/ZNz
        uYm4POR9BQWZtsjM=; b=bavhkSfyRzKNkX8FNZRL8hkH9uvCbEVL6rnAIlbrJGL
        2QAS0CcVBZSAY9PZMRUocXYoZwDTOSxVJjq3yIS8uTb3BXl/tCwCF2yMBDzDZCP3
        +3l00ntbu3F51/ib8kFUeQiyvsJHMgG2kV8/oOkIOTH/Nw1A6XfNfMsxdCsfzfrG
        q/M7miFPzOyikxXedLIaY/HFHOfAB4w6wZqd8ed6GzrvcHN/ul36QiMzHZQOS6hG
        QoVHIjwTaXWKIVyWTk2MOk6PfOAAVxkZChCRwOg3niGAg0UbZlAtKDRyb+pUYWP8
        62v7dlpKDIoLi1vm2vSf0D1UCocYeMTzHUJJLMWTxcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=5YiBwS
        dJLoDEOuRL8pQdjIm/ZNzuYm4POR9BQWZtsjM=; b=WyXK0gwJM5S3YsE/kfzxsB
        XRwgEoBgE1AMNiLveVNxXX2uAHinlJT5ZfIf7d8Aq2+rg3M6BLFrJnXncp/1sEn7
        mRtJ4HwPHYyXeJHaZbR2JpufP6TZnzJU/yvNRhrjkcLSr4hw1wKJg6iiJV5fAAK1
        Q5eR6wgpd7wuPbqcmSnrfUIfmxBuE7WbKqHq+m6ud5iBKd6wAsMEjHaAP5mue5hq
        MdowuMrlKojI3odxyjty79W0b9mePGPNIxb2ZDbqzi5qWHSK8AFjBKhY3NOw1gd2
        Y6VuaMZhAorKq+wkdbeTrN2u+X2cS+I7xPoSmCaFaNLHNaARJh7xlwz445IYkEWg
        ==
X-ME-Sender: <xms:OA_DYBuxPaYS5eOfoigk4vSNFM7iNNX0c30FPsckJPsAdehkbO3lqw>
    <xme:OA_DYKfGPCxN4DcyVM3y_ISr0jXNWhDEQaTcwkjBhEuNrGHgNPOlLYHi9PM45LnSM
    tBrlR5b4xhGyQ>
X-ME-Received: <xmr:OA_DYEz3rluolu-UXfxgujOwtQ8cjD95foMpdJqr39CXG3k0tBq5Ae4mEEaEpnEuWsuACjCQA9_4bH-Amr8gv2B8oxSx0Mvm>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeduiedguddujecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuhe
    ejgfffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
    hhrdgtohhm
X-ME-Proxy: <xmx:OA_DYIP_oGJj1FMyHaWTBzHVbWcY9FjuAg-yBm7tM3jDUD-M40uRRA>
    <xmx:OA_DYB9BJAcDr4lkz7ZTJbgmHMLDnJOqPfkiulxSmTfgdOzBaCcdAQ>
    <xmx:OA_DYIUwbAjcwyks2_ZZE29fXR4CBEIA3evuddaaigerVNhAJwGRwQ>
    <xmx:OQ_DYNt04Ga9NCZtAr3M3EZ6SAl97qadXUhDTT7sRkXMoS3sb0vZUg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Jun 2021 03:22:31 -0400 (EDT)
Date:   Fri, 11 Jun 2021 09:22:28 +0200
From:   Greg KH <greg@kroah.com>
To:     Leo Li <leoyang.li@nxp.com>
Cc:     Joel Stanley <joel@jms.id.au>, Fabio Estevam <festevam@gmail.com>,
        Peter Chen <peter.chen@nxp.com>, Arnd Bergmann <arnd@arndb.de>,
        Felipe Balbi <balbi@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Ran Wang <ran.wang_1@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2] usb: gadget: fsl: Re-enable driver for ARM SoCs
Message-ID: <YMMPNPhxZ9YCQk8K@kroah.com>
References: <20210610034957.93376-1-joel@jms.id.au>
 <CACPK8XegSCS074LJvpO2gOpvpDO_hgWORX4FNcxGe7j9xrGS8w@mail.gmail.com>
 <VI1PR04MB447897CA4041F8B38AB761B68F349@VI1PR04MB4478.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VI1PR04MB447897CA4041F8B38AB761B68F349@VI1PR04MB4478.eurprd04.prod.outlook.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 11, 2021 at 02:11:27AM +0000, Leo Li wrote:
> 
> 
> > -----Original Message-----
> > From: Joel Stanley <joel@jms.id.au>
> > Sent: Thursday, June 10, 2021 9:01 PM
> > To: Fabio Estevam <festevam@gmail.com>; Peter Chen
> > <peter.chen@nxp.com>; Arnd Bergmann <arnd@arndb.de>; Felipe Balbi
> > <balbi@kernel.org>; Shawn Guo <shawnguo@kernel.org>; Leo Li
> > <leoyang.li@nxp.com>; dl-linux-imx <linux-imx@nxp.com>; Stephen
> > Rothwell <sfr@canb.auug.org.au>
> > Cc: linux-usb@vger.kernel.org; Linux ARM <linux-arm-
> > kernel@lists.infradead.org>
> > Subject: Re: [PATCH v2] usb: gadget: fsl: Re-enable driver for ARM SoCs
> > 
> > On Thu, 10 Jun 2021 at 03:50, Joel Stanley <joel@jms.id.au> wrote:
> > >
> > > The commit a390bef7db1f ("usb: gadget: fsl_mxc_udc: Remove the
> > > driver") dropped the ARCH_MXC dependency from USB_FSL_USB2,
> > leaving it
> > > depending solely on FSL_SOC.
> > >
> > > FSL_SOC is powerpc only; it was briefly available on ARM in 2014 but
> > > was removed by commit cfd074ad8600 ("ARM: imx: temporarily remove
> > > CONFIG_SOC_FSL from LS1021A"). Therefore the driver can no longer be
> > > enabled on ARM platforms.
> > >
> > > This appears to be a mistake as arm64's ARCH_LAYERSCAPE and arm32
> > > SOC_LS1021A SoCs use this symbol. It's enabled in these defconfigs:
> > >
> > > arch/arm/configs/imx_v6_v7_defconfig:CONFIG_USB_FSL_USB2=y
> > > arch/arm/configs/multi_v7_defconfig:CONFIG_USB_FSL_USB2=y
> > > arch/powerpc/configs/mgcoge_defconfig:CONFIG_USB_FSL_USB2=y
> > > arch/powerpc/configs/mpc512x_defconfig:CONFIG_USB_FSL_USB2=y
> > >
> > > To fix, expand the dependencies so USB_FSL_USB2 can be enabled on the
> > > ARM platforms, and with COMPILE_TEST.
> > 
> > This didn't work out, as there's some missing clock initialisation calls that were
> > removed when fsl_mxc_udc was deleted:
> > 
> > arm-linux-gnueabi-ld: drivers/usb/gadget/udc/fsl_udc_core.o: in function
> > `fsl_udc_remove':
> > fsl_udc_core.c:(.text+0xc88): undefined reference to `fsl_udc_clk_release'
> > arm-linux-gnueabi-ld: drivers/usb/gadget/udc/fsl_udc_core.o: in function
> > `fsl_udc_probe':
> > fsl_udc_core.c:(.text+0x1c44): undefined reference to `fsl_udc_clk_init'
> > arm-linux-gnueabi-ld: fsl_udc_core.c:(.text+0x1dcc): undefined reference to
> > `fsl_udc_clk_finalize'
> > arm-linux-gnueabi-ld: fsl_udc_core.c:(.text+0x1fe8): undefined reference to
> > `fsl_udc_clk_release'
> > 
> > We could add them back, but it's not clear if this driver is still maintained. I'm
> > looking to the NXP people for input here.
> 
> Adding Ran Wang to the loop.  I think we will maintain the driver to keep the legacy platforms working but will not add new users of this driver.

Now reverted in my tree.

thanks,

greg k-h
