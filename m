Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78DC4584CE2
	for <lists+linux-usb@lfdr.de>; Fri, 29 Jul 2022 09:47:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234945AbiG2HrD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 Jul 2022 03:47:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235005AbiG2Hqk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 29 Jul 2022 03:46:40 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 301B782FAD
        for <linux-usb@vger.kernel.org>; Fri, 29 Jul 2022 00:45:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A2763B826FD
        for <linux-usb@vger.kernel.org>; Fri, 29 Jul 2022 07:45:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2148C433D7;
        Fri, 29 Jul 2022 07:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1659080742;
        bh=lrBA6ubPpp6YBbaMEE/OmacZmSTQUkZjKvgE9adl4Hc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sTIN/pSSGgQMu3s6oL+h7TL1j6cgUPypWmMlKVwRZM2gUbfphlj8Px908b18GKC8c
         XBP3yLXH5X5NFFnpE+BmJLgVxU/qXKReu08PsXXoXdEDhvh4n877NJi/chNVTHKt+W
         eunBTYm68Z4pMLFUCokl46EmvWYIbpF+QGK7WcvE=
Date:   Fri, 29 Jul 2022 09:45:39 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     =?utf-8?Q?=C5=81ukasz?= Bartosik <lb@semihalf.com>
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        linux-usb@vger.kernel.org, upstream@semihalf.com
Subject: Re: [PATCH v1] thunderbolt: fix PCI device class after powering up
Message-ID: <YuOQIxz/jZVX0qlG@kroah.com>
References: <20220728131608.31901-1-lukasz.bartosik@semihalf.com>
 <YuKOERUVa1/mPX9j@kroah.com>
 <CAK8Bye+PPeGxvELUH41BG8n=E1DaGTNWtMz+wis7n-VOL57aSA@mail.gmail.com>
 <YuK/awQVEZHxYk6e@kroah.com>
 <CAK8ByeKZ2BdpdjBCA+WF1RAFqGD9swsekw7ez_S-5q3SGP+rcg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK8ByeKZ2BdpdjBCA+WF1RAFqGD9swsekw7ez_S-5q3SGP+rcg@mail.gmail.com>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 28, 2022 at 07:17:37PM +0200, Łukasz Bartosik wrote:
> >
> > On Thu, Jul 28, 2022 at 06:31:47PM +0200, Łukasz Bartosik wrote:
> > > >
> > > > On Thu, Jul 28, 2022 at 03:16:08PM +0200, Lukasz Bartosik wrote:
> > > > > From: Łukasz Bartosik <lb@semihalf.com>
> > > > >
> > > > > A thunderbolt
> > > > > lspci -d 8086:9a1b -vmmknn
> > > > > Slot: 00:0d.2
> > > > > Class:        System peripheral [0880]
> > > > > Vendor:       Intel Corporation [8086]
> > > > > Device:       Tiger Lake-LP Thunderbolt 4 NHI #0 [9a1b]
> > > > >
> > > > > presents itself with PCI class 0x088000 after Chromebook boots.
> > > > > lspci -s 00:0d.2 -xxx
> > > > > 00:0d.2 System peripheral: Intel Corporation Tiger Lake-LP Thunderbolt 4
> > > > > NHI #0 (rev 01)
> > > > > 00: 86 80 1b 9a 00 00 10 00 01 00 80 08 00 00 00 00
> > > > > ...
> > > > >
> > > > > However after thunderbolt is powered up in nhi_probe()
> > > > > its class changes to 0x0c0340
> > > > > lspci -s 00:0d.2 -xxx
> > > > > 00:0d.2 System peripheral: Intel Corporation Tiger Lake-LP Thunderbolt 4
> > > > > NHI #0 (rev 01)
> > > > > 00: 86 80 1b 9a 06 04 10 00 01 40 03 0c 00 00 00 00
> > > > > ...
> > > > >
> > > > > which leaves pci_dev structure with old class value
> > > > > cat /sys/bus/pci/devices/0000:00:0d.2/class
> > > > > 0x088000
> > > > >
> > > > > This fix updates PCI device class in pci_dev structure after
> > > > > thunderbolt is powered up.
> > > > >
> > > > > Fixes: 3cdb9446a117 ("thunderbolt: Add support for Intel Ice Lake")
> > > > > Signed-off-by: Łukasz Bartosik <lb@semihalf.com>
> > > > > ---
> > > > >  drivers/thunderbolt/nhi_ops.c | 5 +++++
> > > > >  1 file changed, 5 insertions(+)
> > > > >
> > > > > diff --git a/drivers/thunderbolt/nhi_ops.c b/drivers/thunderbolt/nhi_ops.c
> > > > > index 96da07e88c52..6a343d7e3f90 100644
> > > > > --- a/drivers/thunderbolt/nhi_ops.c
> > > > > +++ b/drivers/thunderbolt/nhi_ops.c
> > > > > @@ -160,12 +160,17 @@ static int icl_nhi_suspend_noirq(struct tb_nhi *nhi, bool wakeup)
> > > > >
> > > > >  static int icl_nhi_resume(struct tb_nhi *nhi)
> > > > >  {
> > > > > +     u32 class;
> > > > >       int ret;
> > > > >
> > > > >       ret = icl_nhi_force_power(nhi, true);
> > > > >       if (ret)
> > > > >               return ret;
> > > > >
> > > > > +     /* Set device class code as it might have changed after powering up */
> > > > > +     pci_read_config_dword(nhi->pdev, PCI_CLASS_REVISION, &class);
> > > > > +     nhi->pdev->class = class >> 8;
> > > >
> > > > What about the revision field, why not set that as well:
> > > >         nhi->pdev->revision = class & 0xff;
> > > >
> > > > If the value is overwritten for 3 of the bytes, why not the 4th?
> > >
> > > Fair point but I observed class change, revision stayed the same.
> > > I read class and revision before and after icl_nhi_force_power() with
> > > pci_read_config_dword(nhi->pdev, PCI_CLASS_REVISION, &class);
> > > It changed from 0x8800001 -> 0xc034001
> > >
> > > > Also this feels odd, what is changing the bytes here?  Why only the
> > > > class?  What else changed and what caused it?
> > >
> > > I compared 64 bytes of config space before and after modprobing
> > > thunderbolt module
> > > Before modprobe
> > > lspci -s 00:0d.2 -x
> > > 00:0d.2 System peripheral: Intel Corporation Tiger Lake-LP Thunderbolt
> > > 4 NHI #0 (rev 01)
> > > 00: 86 80 1b 9a 00 00 10 00 01 00 80 08 00 00 00 00
> > > 10: 04 00 a0 80 02 00 00 00 04 80 a4 80 02 00 00 00
> > > 20: 00 00 00 00 00 00 00 00 00 00 00 00 22 22 11 11
> > > 30: 00 00 00 00 80 00 00 00 00 00 00 00 ff 01 00 00
> > >
> > > After modprobe
> > > lspci -s 00:0d.2 -x
> > > 00:0d.2 System peripheral: Intel Corporation Tiger Lake-LP Thunderbolt
> > > 4 NHI #0 (rev 01)
> > > 00: 86 80 1b 9a 06 04 10 00 01 40 03 0c 00 00 00 00
> > > 10: 04 00 a0 80 02 00 00 00 04 80 a4 80 02 00 00 00
> > > 20: 00 00 00 00 00 00 00 00 00 00 00 00 22 22 11 11
> > > 30: 00 00 00 00 80 00 00 00 00 00 00 00 ff 01 00 00
> > >
> > > The diff is in class 00 80 08 -> 40 03 0c
> > > and command 00 00 -> 06 04
> > >
> > > The value 40 03 0c is defined as PCI_CLASS_SERIAL_USB_USB4 in
> > > drivers/thunderbolt/nhi.h
> > >
> > > I think the device itself changed the class because I tried to change
> > > class value with setpci command and it seems to be read-only.
> >
> > Wait huh?  You can't change the class of a device in the configuration,
> > that is read-only.
> 
> Sorry my statement might have been confusing. I tried to change class
> value with setpci
> as an experiment to make sure it is read-only and it is ro.
> 
> > So this is working properly without this patch, right?
> 
> After thunderbolt is probed its class changes from  00 80 08 -> 40 03 0c
> and without this patch thunderbolt's pci_dev struct is left holding
> old class value 00 80 08
> which is not correct.

Ah, ok, but you might have just gotten lucky about the revision being
the same.  Please also restore that as it comes from the same read
transaction.

thanks,

greg k-h
