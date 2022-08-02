Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3649B587E90
	for <lists+linux-usb@lfdr.de>; Tue,  2 Aug 2022 17:07:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231271AbiHBPHB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Aug 2022 11:07:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230497AbiHBPG6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 Aug 2022 11:06:58 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA34DDD3
        for <linux-usb@vger.kernel.org>; Tue,  2 Aug 2022 08:06:53 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id y13so12481549ejp.13
        for <linux-usb@vger.kernel.org>; Tue, 02 Aug 2022 08:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=czlQRRw4wf34jy5V1aejP4PCqstdb7kIcZ7rGrcUmqI=;
        b=pMkxp22s1U6+qgQMpdxHa2WfuG6Fy+Y4HZzBLML9MbFd7HKxLx7f6bO6+4xZkxyWU9
         V3lzmxRPM5JLrMSGKHAK+80D+DjuNXg3v7+eChR9+h9myqndVNVG9byDXwlQSFTuJbtP
         SDbQGvudFPjseym0SNY9rSob1DArrkJBY5b0vjQm0As+9jccSBSJLyNBca9ddhwIYVti
         JbLpy9KqOTa0LQUNI3Xbzz+nJBAyvb04WW98x/49OryIGd2FeZkqyr78yecw5kL/WfB/
         UwZpL+ppiTS/h0fAdq9jnTXi1AH3v7W27re/sCSpgtTWuQMttVyKx7dg9uuNX/BB+Yd4
         49Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=czlQRRw4wf34jy5V1aejP4PCqstdb7kIcZ7rGrcUmqI=;
        b=FwDtp2jmRxROkpd5dZPFp6KYMOq/jVmRwYjiAYd6vVAgkYSSB3s8vhLduv7LpuxVaS
         Xy72hNU6S79XlDe5i/YZ3r0ovfyBc9BgRiYyUr/UWtV7tBPIXqGhyOGWvcXHS4ELXiWC
         sMBrwRyQ0rSC91oyErKDxsW2cuxEA/yjgsF+ReyFWUoPZTxk3p7D/j0Z258rLyXxc/GU
         S0RmTQmM2XLhMhnhVMUj0GytJCarijtWHbFvsCTg4v0NyBzNPZfUvas0a///MsWtoLsj
         eL1yM8i1NenLz94w16jyz9WZeJWdVqiSAIY3aUWgV6mDpUyA/zhhSCTKO0fdBT7QEwdZ
         1blA==
X-Gm-Message-State: AJIora+5Nai253GRFuS+RAnqfTlsDkIjusd4PDPq9NSit3Z8mo+lk1kD
        8KJV4Q+LF9QEjilIgTqo3rdYSmn0slfOgMvXeuSs
X-Google-Smtp-Source: AGRyM1vqbVxax9ixl7m+zjGtQPxTUuH+G/Zx/J0iEzmZSGaFUYFBmG5leuD0d4tNyWUpRQHnARA2vb36Uz6ArOBsJm0=
X-Received: by 2002:a17:906:a089:b0:72f:826b:e084 with SMTP id
 q9-20020a170906a08900b0072f826be084mr17049854ejy.708.1659452812164; Tue, 02
 Aug 2022 08:06:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220729094022.186496-1-lb@semihalf.com> <Yuep3lpI02gWiJY9@lahna>
 <CAK8ByeL4AJoXndO02Os0UPYZRiMeLmBjB-00VaEe-8KJF0tWzQ@mail.gmail.com> <YukhjOo4CteuM8q9@lahna>
In-Reply-To: <YukhjOo4CteuM8q9@lahna>
From:   =?UTF-8?Q?=C5=81ukasz_Bartosik?= <lb@semihalf.com>
Date:   Tue, 2 Aug 2022 17:06:40 +0200
Message-ID: <CAK8ByeJ0=rbGr5+GZ_dDhMRnHjYxuCO9_cZONuXSz2tyL+QLzw@mail.gmail.com>
Subject: Re: [PATCH v2] thunderbolt: fix PCI device class after powering up
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        linux-usb@vger.kernel.org, upstream@semihalf.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

>
> On Tue, Aug 02, 2022 at 02:27:30PM +0200, =C5=81ukasz Bartosik wrote:
> > >
> > > Hi,
> > >
> > > On Fri, Jul 29, 2022 at 11:40:22AM +0200, =C5=81ukasz Bartosik wrote:
> > > > A thunderbolt
> > > > lspci -d 8086:9a1b -vmmknn
> > > > Slot: 00:0d.2
> > > > Class:        System peripheral [0880]
> > > > Vendor:       Intel Corporation [8086]
> > > > Device:       Tiger Lake-LP Thunderbolt 4 NHI #0 [9a1b]
> > > >
> > > > presents itself with PCI class 0x088000 after Chromebook boots.
> > > > lspci -s 00:0d.2 -xxx
> > > > 00:0d.2 System peripheral: Intel Corporation Tiger Lake-LP Thunderb=
olt 4
> > > > NHI #0 (rev 01)
> > > > 00: 86 80 1b 9a 00 00 10 00 01 00 80 08 00 00 00 00
> > > > ...
> > > >
> > > > However after thunderbolt is powered up in nhi_probe()
> > > > its class changes to 0x0c0340
> > > > lspci -s 00:0d.2 -xxx
> > > > 00:0d.2 System peripheral: Intel Corporation Tiger Lake-LP Thunderb=
olt 4
> > > > NHI #0 (rev 01)
> > > > 00: 86 80 1b 9a 06 04 10 00 01 40 03 0c 00 00 00 00
> > > > ...
> > > >
> > > > which leaves pci_dev structure with old class value
> > > > cat /sys/bus/pci/devices/0000:00:0d.2/class
> > > > 0x088000
> > >
> > > This is completely unexpected. Which Chromebook this is and have you
> > > tried to upgrade it to the latest?
> > >
> >
> > This happens on a Tiger Lake based reference Chromebook platform.
> > The issue also happens on the latest ChromeOS image available for that =
platform.
>
> Is this something available for purchase? I'm asking because I have Acer
> Tiger Lake based Chromebook (740 spin or something) here and the TBT
> controller class is "USB controller" all the time, and this is what is
> expected. It should not change the class at any point.

Sorry this platform is not available on the market.

I compared the platform where I see the issue with another platform
where thunderbolt is "usb controller" all the time
and I noticed one difference in function icl_nhi_force_power() in
drivers/thunderbolt/nhi_ops.c I observed the value of VS_CAP_22
after being read and before being written again with additional bits
set. And on the platform where thunderbolt is "usb controller" all the
time
this value was 0x22061002 after reading and 0x22061002 before being
written. The value has not changed
which suggest that thunderbolt was already powered up during probe.

On the platform where I observe the issue where thunderbolt class
changes the observed
read value was 0x6061000 and then 0x22061002 before being written.
That's the difference I spotted.

Anyway I can provide logs or run experiments to shed more light on the
issue. Just need
to know what might be useful ?

Thanks,
Lukasz
