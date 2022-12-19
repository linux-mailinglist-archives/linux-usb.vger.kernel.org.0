Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01F776507F9
	for <lists+linux-usb@lfdr.de>; Mon, 19 Dec 2022 08:11:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231450AbiLSHLS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Dec 2022 02:11:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231394AbiLSHLP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Dec 2022 02:11:15 -0500
Received: from h1.cmg2.smtp.forpsi.com (h1.cmg2.smtp.forpsi.com [81.2.195.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 095C0219D
        for <linux-usb@vger.kernel.org>; Sun, 18 Dec 2022 23:11:12 -0800 (PST)
Received: from lenoch ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id 7AImp6jMTv5uI7AIopSNaR; Mon, 19 Dec 2022 08:11:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1671433870; bh=6i5C4+OH3Tid2jiq5igaPkFJqdwmCMxiRoJ4phiFfX4=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=2JCH2TzaL6+sooHktF+kQ2T56xrEWiVMcbS7SpbyQIGls2D8ryKz6pJlHQoLRjw7u
         G4oTRMaW87kFdr5HFcpN2cDvkD82rt4Ei5RdhuLtvI0JBSnE1mTQdGV7yr83q2jyKH
         HzDF/E98Lx4MYTgolzGUg8WuLNlJBLpqx6yG9Ec7RrRJpviDibITwxzOlo1Of08AkX
         4IdFHjnZSj0EksjvHKKpx6pSXcVVoiwIwoHtYV2IBbwpi/qRO6UVVi10dzBVNbvQDm
         k3TmeHxSkGSOyMugJpooYRm0wqbpwaDpN/DiFTtp2T1Z7WYpyOQVDI8JO/aH0X5mq8
         E7hKBjhlHwwxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1671433870; bh=6i5C4+OH3Tid2jiq5igaPkFJqdwmCMxiRoJ4phiFfX4=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=2JCH2TzaL6+sooHktF+kQ2T56xrEWiVMcbS7SpbyQIGls2D8ryKz6pJlHQoLRjw7u
         G4oTRMaW87kFdr5HFcpN2cDvkD82rt4Ei5RdhuLtvI0JBSnE1mTQdGV7yr83q2jyKH
         HzDF/E98Lx4MYTgolzGUg8WuLNlJBLpqx6yG9Ec7RrRJpviDibITwxzOlo1Of08AkX
         4IdFHjnZSj0EksjvHKKpx6pSXcVVoiwIwoHtYV2IBbwpi/qRO6UVVi10dzBVNbvQDm
         k3TmeHxSkGSOyMugJpooYRm0wqbpwaDpN/DiFTtp2T1Z7WYpyOQVDI8JO/aH0X5mq8
         E7hKBjhlHwwxg==
Date:   Mon, 19 Dec 2022 08:11:08 +0100
From:   Ladislav Michl <oss-lists@triops.cz>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: xHCI host dies on device unplug
Message-ID: <Y6AOjAx2qFnyv9k5@lenoch>
References: <Y45iXb6VCNiz7ZVd@lenoch>
 <Y49A1Pv6dUScQ9x/@lenoch>
 <Y5tHWwHctY6wr+CJ@lenoch>
 <abfec817-0b32-ece3-4965-7503aa5a77fa@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abfec817-0b32-ece3-4965-7503aa5a77fa@linux.intel.com>
X-CMAE-Envelope: MS4wfBLrfU1DIt7tkpqKT7ig3aU1va+9DwSQytYZ38uFuU6lqJQRyPiAmKub9NCjUw+JoEUK91EGTC0Ck4BjDCmL7qOMFQAEFzuNenwz3iwjyYtafFQpodNu
 cMIbAKbwLCZii0DsvNFHxTwfMaS7vqmy/Oq8nqEoHjXN6G5zDMMYq08vhPMt54f9B+sCaYFzW/UXUNCkJPdOc9dGI5gg6Gx5KgM=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Mathias,

On Fri, Dec 16, 2022 at 12:13:23PM +0200, Mathias Nyman wrote:
> On 15.12.2022 18.12, Ladislav Michl wrote:
> > +Cc Mathias as he last touched this code path and may know more :)
> > 
> > On Tue, Dec 06, 2022 at 02:17:08PM +0100, Ladislav Michl wrote:
> > > On Mon, Dec 05, 2022 at 10:27:57PM +0100, Ladislav Michl wrote:
> > > > I'm running current linux.git on custom Marvell OCTEON III CN7020
> > > > based board. USB devices like FTDI (idVendor=0403, idProduct=6001,
> > > > bcdDevice= 6.00) Realtek WiFi dongle (idVendor=0bda, idProduct=8179,
> > > > bcdDevice= 0.00) works without issues, while Ralink WiFi dongle
> > > > (idVendor=148f, idProduct=5370, bcdDevice= 1.01) kills the host on
> > > > disconnect:
> > > > xhci-hcd xhci-hcd.0.auto: xHCI host not responding to stop endpoint command
> > > > xhci-hcd xhci-hcd.0.auto: xHCI host controller not responding, assume dead
> > > > xhci-hcd xhci-hcd.0.auto: HC died; cleaning up
> > > > 
> > > > Unfortunately I do not have a datasheet for CN7020 SoC, so it is hard
> > > > to tell if there is any errata :/ In case anyone see a clue in debug
> > > > logs bellow, I'll happily give it a try.
> > > 
> > > So I do have datasheet now. As a wild guess I tried to use dlmc_ref_clk0
> > > instead of dlmc_ref_clk1 as a refclk-type-ss and it fixed unplug death.
> > > I have no clue why, but anyway - sorry for the noise :) Perhaps Octeon's
> > > clock init is worth to be verified...
> > 
> > After all whenever xhci dies with "xHCI host not responding to stop endpoint
> > command" depends also on temperature, so there seems to be race somewhere.
> > 
> > As a quick and dirty verification, whenever xhci really died, following patch
> > was tested and it fixed issue. It just treats ep as if stop endpoint command
> > succeeded. Any clues? I'll happily provide more traces.
> 
> It's possible the controller did complete the stop endpoint command but driver
> didn't get the interrupt for the event for some reason.

Hmm, event did not complete for device directly connected to the xHCI port.
However for the same device connected to the HUB, everything works as
expected no matter if device is disconnected from the HUB or the HUB
with device is disconnected altogether.

> I wrote some patches that checks the event ring for this event during
> timeout.

In case device is plugged back before timeout kills xHCI, controller is
still working reliably.

> code is in a stop_endpoint_fixes branch in my tree:
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git stop_endpoint_fixes
> https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/log/?h=stop_endpoint_fixes
> 
> Another thing would be checking command and event rings for this stop endpoint command.
> So Instead of killing host at timeout, do nothing, and check sysfs after the disconnect:
> 
> cat /sys/kernel/debug/usb/xhci/<address>/event-ring/trbs
> cat /sys/kernel/debug/usb/xhci/<address>/command-ring/trbs
> 
> -Mathias
