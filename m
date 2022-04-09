Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49C084FA19E
	for <lists+linux-usb@lfdr.de>; Sat,  9 Apr 2022 04:20:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240581AbiDICWI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 Apr 2022 22:22:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229939AbiDICWH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 8 Apr 2022 22:22:07 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 393432BFC0F
        for <linux-usb@vger.kernel.org>; Fri,  8 Apr 2022 19:20:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2AA0D62264
        for <linux-usb@vger.kernel.org>; Sat,  9 Apr 2022 02:20:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7B18C385A3;
        Sat,  9 Apr 2022 02:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649470799;
        bh=2fZxFj3xelePElUio1V95W1kW8lNcg1Bm7+fQn3Vx7k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Gicb2opCNxC0Oim7v4yr0OKRLia7DTo9+Wr39pemLhyrqZvbXWA13pBhnjopz/Rw4
         qj8u65bq6uCbH/VLi5gx4fbkDdLYzn0i+SCTDG9WDkQkx0maylYVx5dzAyZ7hB6Ysx
         zp5AqmyDeHaRg3UzfiPzUyeQYMKGiLY/MkQGTGd2Bz6TOWQ4AHNddZ2K3s0t8RbgPS
         IA4N5hd8s6W0xG+D7odxDq8jdisC3qxslNaD2wRGWWDY78hEWArApt/V9HHXesAtor
         +Pjf2tSzaxnAG/Qxne08KX0E5Th1ycersbQJKFw2D31QJOQh0zyLcmKbhcHG9nyk4k
         zyW0TO6TnToWg==
Date:   Sat, 9 Apr 2022 10:19:48 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Peter Chen <hzpeterchen@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        USB list <linux-usb@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: (EXT) Re: [RFC 1/1] usb: chipidea: ci_hdrc_imx: disable runtime
 pm for HSIC interface
Message-ID: <20220409021948.GA3618@Peter>
References: <20220302094239.3075014-1-alexander.stein@ew.tq-group.com>
 <CAL411-o8TPNv8vAfdPtzTaFkOGc7EmwNJv1Jxc-YUv1wc_vq0g@mail.gmail.com>
 <1891703.PYKUYFuaPT@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1891703.PYKUYFuaPT@steina-w>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 22-03-29 10:14:36, Alexander Stein wrote:
> Hello Peter,
> 
> Am Dienstag, 15. März 2022, 02:23:23 CEST schrieb Peter Chen:
> > On Wed, Mar 2, 2022 at 5:42 PM Alexander Stein
> > 
> > <alexander.stein@ew.tq-group.com> wrote:
> > > With the add of power-domain support in commit 02f8eb40ef7b ("ARM: dts:
> > > imx7s: Add power domain for imx7d HSIC") runtime suspend will disable
> > > the power-domain. This prevents IRQs to occur when a new device is
> > > attached
> > > on a downstream hub.
> > > 
> > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > ---
> > > Our board TQMa7x + MBa7x (i.MX7 based) uses a HSIC link to mounted USB HUB
> > > on usbh device. Cold plugging an USB mass storage device is working fine.
> > > But once the last non-HUB device is disconnected the ci_hdrc device goes
> > > into runtime suspend.
> > 
> > Would you please show the difference between cold boot and runtime
> > suspend after disconnecting
> > the last USB device?
> > 
> > - Power domain on/off status for HUB device
> > - Runtime suspend status at /sys entry for HUB device
> > - "/sys/..power/wakeup" /sys entry  for HUB device
> 
> I hope I got all entries you requested.
> 
> For reference this is the bus topology:
> lsusb -t
> /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=ci_hdrc/1p, 480M
> /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=ci_hdrc/1p, 480M
>     |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 480M
>         |__ Port 2: Dev 3, If 0, Class=Mass Storage, Driver=usb-storage, 480M
> 
> Bus 2 is a different connector and doesn't matter here. I'm disconnecting 'Dev 
> 3' in this scenario.
> 
> After boot up with the bus as shown above:
> $ cat /sys/bus/usb/devices/1-1/power/wakeup
> disabled
> $ cat /sys/bus/usb/devices/1-1/power/runtime_status
> active
> $ cat /sys/kernel/debug/pm_genpd/usb-hsic-phy/current_state
> on
> 
> After disconnecting Dev 3 from the bus ('usb 1-1.2: USB disconnect, device 
> number 3' in dmesg) the status changes as follows (without the patch):
> $ cat /sys/bus/usb/devices/1-1/power/wakeup
> disabled
> $ cat /sys/bus/usb/devices/1-1/power/runtime_status
> suspended
> $ cat /sys/kernel/debug/pm_genpd/usb-hsic-phy/current_state
> off-0
> 
> For the record, when applying the posted patch this changes into:
> $ cat /sys/bus/usb/devices/1-1/power/wakeup
> disabled
> $ cat /sys/bus/usb/devices/1-1/power/runtime_status
> suspended
> $ cat /sys/kernel/debug/pm_genpd/usb-hsic-phy/current_state
> on
> 

Okay, I think the problem here is the power domain for USB controller is
off at runtime, but USB controller/PHY needs to detect the USB wakeup
signal at runtime, so the USB controller/PHY's power domain should be
not off. The proper change may keep power domain on at runtime, and the
power domain could be off at system suspend.

The controller/PHY clk could be off at runtime, it does not affect the
wakeup detecting from controll/PHY side.

-- 

Thanks,
Peter Chen

