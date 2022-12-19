Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABC3D651510
	for <lists+linux-usb@lfdr.de>; Mon, 19 Dec 2022 22:45:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232532AbiLSVpx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Dec 2022 16:45:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232117AbiLSVpv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Dec 2022 16:45:51 -0500
Received: from h2.cmg1.smtp.forpsi.com (h2.cmg1.smtp.forpsi.com [81.2.195.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3D2326D3
        for <linux-usb@vger.kernel.org>; Mon, 19 Dec 2022 13:45:48 -0800 (PST)
Received: from lenoch ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id 7Nx9pliOiPm6C7NxBplKIn; Mon, 19 Dec 2022 22:45:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1671486346; bh=NKbc23NBK5BLr/xqBDh7wQ03PlrsII3+Pq0wUHCHi7w=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=rD8tiNIkdK2+pSAcXwCddLZVewnKHuiDKdTS/UXxnmz25jQYglDr8V0eYJfdje+bC
         NDIG6y9cFa+qMB0akc36CE6/VkV9RbxSMmzGkTMerUixqenc+e0zVe2HjeoUAC091l
         YXUMZV2+3+GdS4uqEu6nYz/dldbrKKPPHldA4YxostTXwQSQXyTRMGOCgxMc3uBKHG
         u8bEij4K7eMjRASv3RnMC0tjqF//aiQx+qBzMUN9e2YNg3iwEKCVEN7A1BnXn9Y5cE
         Sb26320+NwSH0MvGgr5KKfV2/1cxF/dlWzmwNQeWFi3xCDnXZyHHOeeIMr6CyzM53R
         6CQXNeK6wU2gw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1671486346; bh=NKbc23NBK5BLr/xqBDh7wQ03PlrsII3+Pq0wUHCHi7w=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=rD8tiNIkdK2+pSAcXwCddLZVewnKHuiDKdTS/UXxnmz25jQYglDr8V0eYJfdje+bC
         NDIG6y9cFa+qMB0akc36CE6/VkV9RbxSMmzGkTMerUixqenc+e0zVe2HjeoUAC091l
         YXUMZV2+3+GdS4uqEu6nYz/dldbrKKPPHldA4YxostTXwQSQXyTRMGOCgxMc3uBKHG
         u8bEij4K7eMjRASv3RnMC0tjqF//aiQx+qBzMUN9e2YNg3iwEKCVEN7A1BnXn9Y5cE
         Sb26320+NwSH0MvGgr5KKfV2/1cxF/dlWzmwNQeWFi3xCDnXZyHHOeeIMr6CyzM53R
         6CQXNeK6wU2gw==
Date:   Mon, 19 Dec 2022 22:45:43 +0100
From:   Ladislav Michl <oss-lists@triops.cz>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: xHCI host dies on device unplug
Message-ID: <Y6Dbh1xJucfNvwXq@lenoch>
References: <Y45iXb6VCNiz7ZVd@lenoch>
 <Y49A1Pv6dUScQ9x/@lenoch>
 <Y5tHWwHctY6wr+CJ@lenoch>
 <abfec817-0b32-ece3-4965-7503aa5a77fa@linux.intel.com>
 <Y5zkCxQqBWR+/b4F@lenoch>
 <983a1eb1-4599-517b-6c88-63a0051ae261@linux.intel.com>
 <Y6Ct5s5fIoA9FsAt@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y6Ct5s5fIoA9FsAt@lenoch>
X-CMAE-Envelope: MS4wfKziIYS2Bg50qU77fn+gwNai2R9LGvmk69m6/B0U416ZFuBROZnVBlquTr+aYavA5vujTU6lQIsQcuaf6IdNhlB+GaG02aRPaZwEz0TsbpYPvmYOiFeE
 Q9/gMj4SWWPb+sPGdmSHA+anHSqT4sbNqGBlsAU5IKTjgaxKIF/Ca5Rb4rwxMjvsp5Ud6CgP+nWNK+Sh9iO8MNYTxsHAaWzFhE0=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Dec 19, 2022 at 07:31:02PM +0100, Ladislav Michl wrote:
> On Mon, Dec 19, 2022 at 02:25:46PM +0200, Mathias Nyman wrote:
> > On 16.12.2022 23.32, Ladislav Michl wrote:
> > > On Fri, Dec 16, 2022 at 12:13:23PM +0200, Mathias Nyman wrote:
> > > > On 15.12.2022 18.12, Ladislav Michl wrote:
> > > > > +Cc Mathias as he last touched this code path and may know more :)
> > > > > 
> > > > > On Tue, Dec 06, 2022 at 02:17:08PM +0100, Ladislav Michl wrote:
> > > > > > On Mon, Dec 05, 2022 at 10:27:57PM +0100, Ladislav Michl wrote:
> > > > > > > I'm running current linux.git on custom Marvell OCTEON III CN7020
> > > > > > > based board. USB devices like FTDI (idVendor=0403, idProduct=6001,
> > > > > > > bcdDevice= 6.00) Realtek WiFi dongle (idVendor=0bda, idProduct=8179,
> > > > > > > bcdDevice= 0.00) works without issues, while Ralink WiFi dongle
> > > > > > > (idVendor=148f, idProduct=5370, bcdDevice= 1.01) kills the host on
> > > > > > > disconnect:
> > > > > > > xhci-hcd xhci-hcd.0.auto: xHCI host not responding to stop endpoint command
> > > > > > > xhci-hcd xhci-hcd.0.auto: xHCI host controller not responding, assume dead
> > > > > > > xhci-hcd xhci-hcd.0.auto: HC died; cleaning up
> > > > > > > 
> > > > > > > Unfortunately I do not have a datasheet for CN7020 SoC, so it is hard
> > > > > > > to tell if there is any errata :/ In case anyone see a clue in debug
> > > > > > > logs bellow, I'll happily give it a try.
> > > > > > 
> > > > > > So I do have datasheet now. As a wild guess I tried to use dlmc_ref_clk0
> > > > > > instead of dlmc_ref_clk1 as a refclk-type-ss and it fixed unplug death.
> > > > > > I have no clue why, but anyway - sorry for the noise :) Perhaps Octeon's
> > > > > > clock init is worth to be verified...
> > > > > 
> > > > > After all whenever xhci dies with "xHCI host not responding to stop endpoint
> > > > > command" depends also on temperature, so there seems to be race somewhere.
> > > > > 
> > > > > As a quick and dirty verification, whenever xhci really died, following patch
> > > > > was tested and it fixed issue. It just treats ep as if stop endpoint command
> > > > > succeeded. Any clues? I'll happily provide more traces.
> > > > 
> > > > It's possible the controller did complete the stop endpoint command but driver
> > > > didn't get the interrupt for the event for some reason.
> > > > 
> > 
> > Looks like controller didn't complete the stop endpoint command.
> > 
> > Event for last completed command (before cycle bit change "c" -> "C") was:
> >   0x00000000028f55a0: TRB 00000000035e81a0 status 'Success' len 0 slot 1 ep 0 type 'Command Completion Event' flags e:c,
> > 
> > This was for command at 35e81a0, which in the command ring was:
> >   0x00000000035e81a0: Reset Endpoint Command: ctx 0000000000000000 slot 1 ep 3 flags T:c
> > 
> > The stop endpoint command was the next command queued, at 35e81b0:
> >   0x00000000035e81b0: Stop Ring Command: slot 1 sp 0 ep 3 flags c
> > 
> > There were a lot of URBs queued for this device, and they are cancelled one by one after disconnect.
> > 
> > Was this the only device connected? If so does connecting another usb device to another root port help?
> > Just to test if the host for some reason partially stops a while after last device disconnect?
> 
> Device is connected directly into SoC. Once connected into HUB, host doesn't die
> (as noted in other email, sorry for not replying to my own message, so it got lost)
> It seems as intentional (power management?) optimization. If another device is
> plugged in before 5 sec timeout expires, host completes stop endpoint command.
> 
> Unfortunately I cannot find anything describing this behavior in
> documentation, so I'll ask manufacturer support.

As support is usually slow I asked search engine first and this sounds
familiar:
"Synopsis Designware USB3 IP earlier than v3.00a which is configured in silicon
with DWC_USB3_SUSPEND_ON_DISCONNECT_EN=1, would need a specific quirk to prevent
xhci host controller from dying when device is disconnected."

usb: dwc3: Add quirk for Synopsis device disconnection errata
https://patchwork.kernel.org/project/linux-omap/patch/1424151697-2084-5-git-send-email-Sneeker.Yeh@tw.fujitsu.com/

Any clue what happened with that? I haven't found any meaningfull traces...

> Both solutions, do nothing or reset controller once last device is unpluged
> works, but I doubt they are suitable for mainline kernel without further
> investigation.
> 
> > Another thing is that the stop endpoint command fails after three soft reset tries,
> > does disabling soft reset help?
> 
> No, this does not cause any change.
> 
> 	ladis
