Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D3F264F330
	for <lists+linux-usb@lfdr.de>; Fri, 16 Dec 2022 22:33:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229843AbiLPVdO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Dec 2022 16:33:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229736AbiLPVdM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 16 Dec 2022 16:33:12 -0500
Received: from h1.cmg1.smtp.forpsi.com (h1.cmg1.smtp.forpsi.com [81.2.195.162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2B8161D7B
        for <linux-usb@vger.kernel.org>; Fri, 16 Dec 2022 13:33:06 -0800 (PST)
Received: from lenoch ([80.95.121.122])
        by cmgsmtp with ESMTPSA
        id 6IKEpIgnXPm6C6IKFpezxW; Fri, 16 Dec 2022 22:33:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1671226384; bh=W2f5Htun3KX6pfgwvJpB+CCPwEQij4gvVLLkW8jEaCk=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=e4A3Vv2RIGbKz7rNOS+NHoEeDGA1qKWd7O9C56dj9+U0uYCV0PbKU3Q9BAv58BEQ4
         klDJ3YpW9TJVavDUEG/KOyfNjZn+5esE0Pqj8EQM7xFhZRx2N36SLmV4AhALg0+2ZM
         4LzTQqXp0RvDBMJfJiF4S8xSMZFiZaC5Ec+YxzqXJ40FiaBzfSrgpe7PoLJf12tYm8
         DMlI7oWBy1/cTlV8zruwulezDpjgQl02/pPfAjz4C+9QuNJ75BKhI48VrYyoTkTtRh
         EJRNCWdRgpKdbXxxwmXqnuCEtIrnUFbBSdApov+jJAhXu5MrAuPHup17TzH8fWhPbM
         FoNMWn+5Qo/uA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1671226384; bh=W2f5Htun3KX6pfgwvJpB+CCPwEQij4gvVLLkW8jEaCk=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=e4A3Vv2RIGbKz7rNOS+NHoEeDGA1qKWd7O9C56dj9+U0uYCV0PbKU3Q9BAv58BEQ4
         klDJ3YpW9TJVavDUEG/KOyfNjZn+5esE0Pqj8EQM7xFhZRx2N36SLmV4AhALg0+2ZM
         4LzTQqXp0RvDBMJfJiF4S8xSMZFiZaC5Ec+YxzqXJ40FiaBzfSrgpe7PoLJf12tYm8
         DMlI7oWBy1/cTlV8zruwulezDpjgQl02/pPfAjz4C+9QuNJ75BKhI48VrYyoTkTtRh
         EJRNCWdRgpKdbXxxwmXqnuCEtIrnUFbBSdApov+jJAhXu5MrAuPHup17TzH8fWhPbM
         FoNMWn+5Qo/uA==
Date:   Fri, 16 Dec 2022 22:32:59 +0100
From:   Ladislav Michl <oss-lists@triops.cz>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: xHCI host dies on device unplug
Message-ID: <Y5zkCxQqBWR+/b4F@lenoch>
References: <Y45iXb6VCNiz7ZVd@lenoch>
 <Y49A1Pv6dUScQ9x/@lenoch>
 <Y5tHWwHctY6wr+CJ@lenoch>
 <abfec817-0b32-ece3-4965-7503aa5a77fa@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abfec817-0b32-ece3-4965-7503aa5a77fa@linux.intel.com>
X-CMAE-Envelope: MS4wfMp175Z2T44Uqi03dD84LvTQ/VABgfT5MaH64+hm5DiowWgj0b35vUE6XHB/K4fFNBBRLlfCGa4Guku+NiTITd3dRvFHFrY8e5tIrJzvMwqumdlhvQGY
 Zud/kdpNL3658uRyIpQa8gkhVY2XvN5mBfxGjIxqeMM2P3095LnqmodmkNNSvG9joFGiKrGihBaKWIGoaiKUxMUIAflErnlo/n4=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

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
> 
> I wrote some patches that checks the event ring for this event during
> timeout.
> 
> code is in a stop_endpoint_fixes branch in my tree:
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git stop_endpoint_fixes
> https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/log/?h=stop_endpoint_fixes

Added three topmost patches from your stop_endpoint_fixes branch to my tree,
also added debug showing both xhci_pending_interrupt and
xhci_pending_command_completion returns zero, when uplug happens,
so host still dies.

> Another thing would be checking command and event rings for this stop endpoint command.
> So Instead of killing host at timeout, do nothing, and check sysfs after the disconnect:

Just to be sure I got you right, this is the change in xhci-ring.c
that "does nothing":
@@ -1627,8 +1631,6 @@ void xhci_handle_command_timeout(struct work_struct *work)
 		if (ep)
 			ep->ep_state &= ~EP_STOP_CMD_PENDING;
 
-		xhci_halt(xhci);
-		xhci_hc_died(xhci);
 		goto time_out_completed;
 	}
 
> cat /sys/kernel/debug/usb/xhci/<address>/event-ring/trbs
> cat /sys/kernel/debug/usb/xhci/<address>/command-ring/trbs

# cat /sys/kernel/debug/usb/xhci/xhci-hcd.0.auto/event-ring/trbs
0x00000000028f5000: TRB 0000000002ee1d70 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f5010: TRB 0000000002ee1da0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f5020: TRB 0000000002ee1dd0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f5030: TRB 0000000002ee1e00 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f5040: TRB 0000000002ee1e30 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f5050: TRB 0000000002ee1e60 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f5060: TRB 0000000002ee1e90 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f5070: TRB 0000000002ee1ec0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f5080: TRB 0000000002ee1ef0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f5090: TRB 0000000002ee1f20 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f50a0: TRB 0000000002ee1f50 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f50b0: TRB 0000000002ee1f80 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f50c0: TRB 0000000002ee1fb0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f50d0: TRB 0000000002ee1fe0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f50e0: TRB 00000000036c9020 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f50f0: TRB 00000000036c9050 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f5100: TRB 00000000036c9080 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f5110: TRB 00000000036c90b0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f5120: TRB 00000000036c90e0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f5130: TRB 00000000036c9110 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f5140: TRB 00000000036c9140 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f5150: TRB 00000000036c9170 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f5160: TRB 00000000036c91a0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f5170: TRB 00000000036c91d0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f5180: TRB 00000000036c9200 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f5190: TRB 00000000036c9230 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f51a0: TRB 00000000036c9260 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f51b0: TRB 00000000036c9290 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f51c0: TRB 00000000036c92c0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f51d0: TRB 00000000036c92f0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f51e0: TRB 00000000036c9320 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f51f0: TRB 00000000036c9350 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f5200: TRB 00000000036c9380 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f5210: TRB 00000000036c93b0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f5220: TRB 00000000036c93e0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f5230: TRB 00000000036c9410 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f5240: TRB 00000000036c9440 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f5250: TRB 00000000036c9470 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f5260: TRB 00000000036c94a0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f5270: TRB 00000000036c94d0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f5280: TRB 00000000036c9500 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f5290: TRB 00000000036c9530 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f52a0: TRB 00000000036c9560 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f52b0: TRB 00000000036c9590 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f52c0: TRB 00000000036c95c0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f52d0: TRB 00000000036c95f0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f52e0: TRB 00000000036c9620 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f52f0: TRB 00000000036c9650 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f5300: TRB 00000000036c9680 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f5310: TRB 00000000036c96b0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f5320: TRB 00000000036c96e0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f5330: TRB 00000000036c9710 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f5340: TRB 00000000036c9740 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f5350: TRB 00000000036c9770 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f5360: TRB 00000000036c97a0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f5370: TRB 00000000036c97d0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f5380: TRB 00000000036c9800 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f5390: TRB 00000000036c9830 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f53a0: TRB 00000000036c9860 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f53b0: TRB 00000000036c9890 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f53c0: TRB 00000000036c98c0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f53d0: TRB 00000000036c98f0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f53e0: TRB 00000000036c9920 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f53f0: TRB 00000000036c9950 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f5400: TRB 00000000036c9980 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f5410: TRB 00000000036c99b0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f5420: TRB 00000000036c99e0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f5430: TRB 00000000036c9a10 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f5440: TRB 00000000036c9a40 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f5450: TRB 00000000036c9a70 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f5460: TRB 00000000036c9aa0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f5470: TRB 00000000036c9ad0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f5480: TRB 00000000036c9b00 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f5490: TRB 00000000036c9b30 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f54a0: TRB 00000000036c9b60 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f54b0: TRB 00000000036c9b90 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f54c0: TRB 00000000036c9bc0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f54d0: TRB 00000000036c9bf0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f54e0: TRB 00000000036c9c20 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f54f0: TRB 00000000036c9c50 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f5500: TRB 00000000036c9c80 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f5510: TRB 00000000036c9cb0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f5520: TRB 00000000036c9ce0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f5530: TRB 00000000036c9d10 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
0x00000000028f5540: TRB 00000000030fa9a0 status 'USB Transaction Error' len 3860 slot 1 ep 3 type 'Transfer Event' flags e:c
0x00000000028f5550: TRB 00000000035e8180 status 'Success' len 0 slot 1 ep 0 type 'Command Completion Event' flags e:c
0x00000000028f5560: TRB 0000000001000000 status 'Success' len 0 slot 0 ep 0 type 'Port Status Change Event' flags e:c
0x00000000028f5570: TRB 00000000030fa9a0 status 'USB Transaction Error' len 3860 slot 1 ep 3 type 'Transfer Event' flags e:c
0x00000000028f5580: TRB 00000000035e8190 status 'Success' len 0 slot 1 ep 0 type 'Command Completion Event' flags e:c
0x00000000028f5590: TRB 00000000030fa9a0 status 'USB Transaction Error' len 3860 slot 1 ep 3 type 'Transfer Event' flags e:c
0x00000000028f55a0: TRB 00000000035e81a0 status 'Success' len 0 slot 1 ep 0 type 'Command Completion Event' flags e:c
0x00000000028f55b0: TRB 0000000002ee1e90 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f55c0: TRB 0000000002ee1ec0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f55d0: TRB 0000000002ee1ef0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f55e0: TRB 0000000002ee1f20 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f55f0: TRB 0000000002ee1f50 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5600: TRB 0000000002ee1f80 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5610: TRB 0000000002ee1fb0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5620: TRB 0000000002ee1fe0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5630: TRB 00000000036c9020 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5640: TRB 00000000036c9050 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5650: TRB 00000000030fa990 status 'Short Packet' len 3632 slot 1 ep 3 type 'Transfer Event' flags e:C
0x00000000028f5660: TRB 00000000036c9080 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5670: TRB 00000000036c90b0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5680: TRB 00000000036c90e0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5690: TRB 00000000036c9110 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f56a0: TRB 00000000036c9140 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f56b0: TRB 00000000036c9170 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f56c0: TRB 00000000036c91a0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f56d0: TRB 00000000036c91d0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f56e0: TRB 00000000036c9200 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f56f0: TRB 00000000036c9230 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5700: TRB 00000000036c9260 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5710: TRB 00000000036c9290 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5720: TRB 00000000036c92c0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5730: TRB 00000000036c92f0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5740: TRB 00000000036c9320 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5750: TRB 00000000036c9350 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5760: TRB 00000000036c9380 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5770: TRB 00000000036c93b0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5780: TRB 00000000036c93e0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5790: TRB 00000000036c9410 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f57a0: TRB 00000000036c9440 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f57b0: TRB 00000000036c9470 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f57c0: TRB 00000000036c94a0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f57d0: TRB 00000000036c94d0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f57e0: TRB 00000000036c9500 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f57f0: TRB 00000000036c9530 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5800: TRB 00000000036c9560 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5810: TRB 00000000036c9590 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5820: TRB 00000000036c95c0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5830: TRB 00000000036c95f0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5840: TRB 00000000036c9620 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5850: TRB 00000000036c9650 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5860: TRB 00000000036c9680 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5870: TRB 00000000036c96b0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5880: TRB 00000000036c96e0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5890: TRB 00000000036c9710 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f58a0: TRB 00000000036c9740 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f58b0: TRB 00000000036c9770 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f58c0: TRB 00000000036c97a0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f58d0: TRB 00000000036c97d0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f58e0: TRB 00000000036c9800 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f58f0: TRB 00000000036c9830 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5900: TRB 00000000036c9860 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5910: TRB 00000000036c9890 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5920: TRB 00000000036c98c0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5930: TRB 00000000036c98f0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5940: TRB 00000000036c9920 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5950: TRB 00000000036c9950 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5960: TRB 00000000036c9980 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5970: TRB 00000000036c99b0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5980: TRB 00000000036c99e0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5990: TRB 00000000036c9a10 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f59a0: TRB 00000000036c9a40 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f59b0: TRB 00000000036c9a70 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f59c0: TRB 00000000036c9aa0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f59d0: TRB 00000000036c9ad0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f59e0: TRB 00000000036c9b00 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f59f0: TRB 00000000036c9b30 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5a00: TRB 00000000036c9b60 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5a10: TRB 00000000036c9b90 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5a20: TRB 00000000036c9bc0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5a30: TRB 00000000036c9bf0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5a40: TRB 00000000036c9c20 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5a50: TRB 00000000036c9c50 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5a60: TRB 00000000036c9c80 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5a70: TRB 00000000036c9cb0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5a80: TRB 00000000036c9ce0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5a90: TRB 00000000036c9d10 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5aa0: TRB 00000000036c9d40 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5ab0: TRB 00000000036c9d70 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5ac0: TRB 00000000036c9da0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5ad0: TRB 00000000036c9dd0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5ae0: TRB 00000000036c9e00 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5af0: TRB 00000000036c9e30 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5b00: TRB 00000000036c9e60 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5b10: TRB 00000000036c9e90 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5b20: TRB 00000000036c9ec0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5b30: TRB 00000000036c9ef0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5b40: TRB 00000000036c9f20 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5b50: TRB 00000000036c9f50 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5b60: TRB 00000000036c9f80 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5b70: TRB 00000000036c9fb0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5b80: TRB 00000000036c9fe0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5b90: TRB 0000000002ee1020 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5ba0: TRB 0000000002ee1050 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5bb0: TRB 0000000002ee1080 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5bc0: TRB 0000000002ee10b0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5bd0: TRB 0000000002ee10e0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5be0: TRB 0000000002ee1110 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5bf0: TRB 0000000002ee1140 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5c00: TRB 0000000002ee1170 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5c10: TRB 0000000002ee11a0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5c20: TRB 0000000002ee11d0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5c30: TRB 0000000002ee1200 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5c40: TRB 0000000002ee1230 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5c50: TRB 0000000002ee1260 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5c60: TRB 0000000002ee1290 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5c70: TRB 0000000002ee12c0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5c80: TRB 0000000002ee12f0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5c90: TRB 0000000002ee1320 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5ca0: TRB 0000000002ee1350 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5cb0: TRB 0000000002ee1380 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5cc0: TRB 0000000002ee13b0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5cd0: TRB 0000000002ee13e0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5ce0: TRB 0000000002ee1410 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5cf0: TRB 0000000002ee1440 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5d00: TRB 0000000002ee1470 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5d10: TRB 0000000002ee14a0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5d20: TRB 0000000002ee14d0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5d30: TRB 0000000002ee1500 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5d40: TRB 0000000002ee1530 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5d50: TRB 0000000002ee1560 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5d60: TRB 0000000002ee1590 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5d70: TRB 0000000002ee15c0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5d80: TRB 0000000002ee15f0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5d90: TRB 0000000002ee1620 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5da0: TRB 0000000002ee1650 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5db0: TRB 0000000002ee1680 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5dc0: TRB 0000000002ee16b0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5dd0: TRB 0000000002ee16e0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5de0: TRB 0000000002ee1710 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5df0: TRB 0000000002ee1740 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5e00: TRB 0000000002ee1770 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5e10: TRB 0000000002ee17a0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5e20: TRB 0000000002ee17d0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5e30: TRB 0000000002ee1800 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5e40: TRB 0000000002ee1830 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5e50: TRB 0000000002ee1860 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5e60: TRB 0000000002ee1890 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5e70: TRB 0000000002ee18c0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5e80: TRB 0000000002ee18f0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5e90: TRB 0000000002ee1920 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5ea0: TRB 0000000002ee1950 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5eb0: TRB 0000000002ee1980 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5ec0: TRB 0000000002ee19b0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5ed0: TRB 0000000002ee19e0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5ee0: TRB 0000000002ee1a10 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5ef0: TRB 0000000002ee1a40 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5f00: TRB 0000000002ee1a70 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5f10: TRB 0000000002ee1aa0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5f20: TRB 0000000002ee1ad0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5f30: TRB 0000000002ee1b00 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5f40: TRB 0000000002ee1b30 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5f50: TRB 0000000002ee1b60 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5f60: TRB 0000000002ee1b90 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5f70: TRB 0000000002ee1bc0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5f80: TRB 0000000002ee1bf0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5f90: TRB 0000000002ee1c20 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5fa0: TRB 0000000002ee1c50 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5fb0: TRB 0000000002ee1c80 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5fc0: TRB 0000000002ee1cb0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5fd0: TRB 0000000002ee1ce0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5fe0: TRB 0000000002ee1d10 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
0x00000000028f5ff0: TRB 0000000002ee1d40 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:C
# cat /sys/kernel/debug/usb/xhci/xhci-hcd.0.auto/command-ring/trbs 
0x00000000035e8000: Stop Ring Command: slot 1 sp 0 ep 3 flags c
0x00000000035e8010: Set TR Dequeue Pointer Command: deq 00000000030fa801 stream 0 slot 1 ep 3 flags c
0x00000000035e8020: Stop Ring Command: slot 1 sp 0 ep 3 flags c
0x00000000035e8030: Set TR Dequeue Pointer Command: deq 00000000030fa811 stream 0 slot 1 ep 3 flags c
0x00000000035e8040: Stop Ring Command: slot 1 sp 0 ep 3 flags c
0x00000000035e8050: Set TR Dequeue Pointer Command: deq 00000000030fa821 stream 0 slot 1 ep 3 flags c
0x00000000035e8060: Stop Ring Command: slot 1 sp 0 ep 3 flags c
0x00000000035e8070: Set TR Dequeue Pointer Command: deq 00000000030fa831 stream 0 slot 1 ep 3 flags c
0x00000000035e8080: Stop Ring Command: slot 1 sp 0 ep 3 flags c
0x00000000035e8090: Set TR Dequeue Pointer Command: deq 00000000030fa841 stream 0 slot 1 ep 3 flags c
0x00000000035e80a0: Stop Ring Command: slot 1 sp 0 ep 3 flags c
0x00000000035e80b0: Set TR Dequeue Pointer Command: deq 00000000030fa851 stream 0 slot 1 ep 3 flags c
0x00000000035e80c0: Stop Ring Command: slot 1 sp 0 ep 3 flags c
0x00000000035e80d0: Set TR Dequeue Pointer Command: deq 00000000030fa861 stream 0 slot 1 ep 3 flags c
0x00000000035e80e0: Stop Ring Command: slot 1 sp 0 ep 3 flags c
0x00000000035e80f0: Set TR Dequeue Pointer Command: deq 00000000030fa871 stream 0 slot 1 ep 3 flags c
0x00000000035e8100: Stop Ring Command: slot 1 sp 0 ep 3 flags c
0x00000000035e8110: Set TR Dequeue Pointer Command: deq 00000000030fa881 stream 0 slot 1 ep 3 flags c
0x00000000035e8120: Stop Ring Command: slot 1 sp 0 ep 3 flags c
0x00000000035e8130: Set TR Dequeue Pointer Command: deq 00000000030fa891 stream 0 slot 1 ep 3 flags c
0x00000000035e8140: Stop Ring Command: slot 1 sp 0 ep 3 flags c
0x00000000035e8150: Set TR Dequeue Pointer Command: deq 00000000030fa8a1 stream 0 slot 1 ep 3 flags c
0x00000000035e8160: Stop Ring Command: slot 1 sp 0 ep 3 flags c
0x00000000035e8170: Set TR Dequeue Pointer Command: deq 00000000030fa8b1 stream 0 slot 1 ep 3 flags c
0x00000000035e8180: Reset Endpoint Command: ctx 0000000000000000 slot 1 ep 3 flags T:c
0x00000000035e8190: Reset Endpoint Command: ctx 0000000000000000 slot 1 ep 3 flags T:c
0x00000000035e81a0: Reset Endpoint Command: ctx 0000000000000000 slot 1 ep 3 flags T:c
0x00000000035e81b0: Stop Ring Command: slot 1 sp 0 ep 3 flags c
0x00000000035e81c0: Set TR Dequeue Pointer Command: deq 00000000030fa0e1 stream 0 slot 1 ep 3 flags C
0x00000000035e81d0: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e81e0: Set TR Dequeue Pointer Command: deq 00000000030fa0f1 stream 0 slot 1 ep 3 flags C
0x00000000035e81f0: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8200: Set TR Dequeue Pointer Command: deq 00000000030fa101 stream 0 slot 1 ep 3 flags C
0x00000000035e8210: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8220: Set TR Dequeue Pointer Command: deq 00000000030fa111 stream 0 slot 1 ep 3 flags C
0x00000000035e8230: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8240: Set TR Dequeue Pointer Command: deq 00000000030fa121 stream 0 slot 1 ep 3 flags C
0x00000000035e8250: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8260: Set TR Dequeue Pointer Command: deq 00000000030fa131 stream 0 slot 1 ep 3 flags C
0x00000000035e8270: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8280: Set TR Dequeue Pointer Command: deq 00000000030fa141 stream 0 slot 1 ep 3 flags C
0x00000000035e8290: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e82a0: Set TR Dequeue Pointer Command: deq 00000000030fa151 stream 0 slot 1 ep 3 flags C
0x00000000035e82b0: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e82c0: Set TR Dequeue Pointer Command: deq 00000000030fa161 stream 0 slot 1 ep 3 flags C
0x00000000035e82d0: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e82e0: Set TR Dequeue Pointer Command: deq 00000000030fa171 stream 0 slot 1 ep 3 flags C
0x00000000035e82f0: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8300: Set TR Dequeue Pointer Command: deq 00000000030fa181 stream 0 slot 1 ep 3 flags C
0x00000000035e8310: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8320: Set TR Dequeue Pointer Command: deq 00000000030fa191 stream 0 slot 1 ep 3 flags C
0x00000000035e8330: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8340: Set TR Dequeue Pointer Command: deq 00000000030fa1a1 stream 0 slot 1 ep 3 flags C
0x00000000035e8350: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8360: Set TR Dequeue Pointer Command: deq 00000000030fa1b1 stream 0 slot 1 ep 3 flags C
0x00000000035e8370: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8380: Set TR Dequeue Pointer Command: deq 00000000030fa1c1 stream 0 slot 1 ep 3 flags C
0x00000000035e8390: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e83a0: Set TR Dequeue Pointer Command: deq 00000000030fa1d1 stream 0 slot 1 ep 3 flags C
0x00000000035e83b0: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e83c0: Set TR Dequeue Pointer Command: deq 00000000030fa1e1 stream 0 slot 1 ep 3 flags C
0x00000000035e83d0: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e83e0: Set TR Dequeue Pointer Command: deq 00000000030fa1f1 stream 0 slot 1 ep 3 flags C
0x00000000035e83f0: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8400: Set TR Dequeue Pointer Command: deq 00000000030fa201 stream 0 slot 1 ep 3 flags C
0x00000000035e8410: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8420: Set TR Dequeue Pointer Command: deq 00000000030fa211 stream 0 slot 1 ep 3 flags C
0x00000000035e8430: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8440: Set TR Dequeue Pointer Command: deq 00000000030fa221 stream 0 slot 1 ep 3 flags C
0x00000000035e8450: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8460: Set TR Dequeue Pointer Command: deq 00000000030fa231 stream 0 slot 1 ep 3 flags C
0x00000000035e8470: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8480: Set TR Dequeue Pointer Command: deq 00000000030fa241 stream 0 slot 1 ep 3 flags C
0x00000000035e8490: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e84a0: Set TR Dequeue Pointer Command: deq 00000000030fa251 stream 0 slot 1 ep 3 flags C
0x00000000035e84b0: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e84c0: Set TR Dequeue Pointer Command: deq 00000000030fa261 stream 0 slot 1 ep 3 flags C
0x00000000035e84d0: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e84e0: Set TR Dequeue Pointer Command: deq 00000000030fa271 stream 0 slot 1 ep 3 flags C
0x00000000035e84f0: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8500: Set TR Dequeue Pointer Command: deq 00000000030fa281 stream 0 slot 1 ep 3 flags C
0x00000000035e8510: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8520: Set TR Dequeue Pointer Command: deq 00000000030fa291 stream 0 slot 1 ep 3 flags C
0x00000000035e8530: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8540: Set TR Dequeue Pointer Command: deq 00000000030fa2a1 stream 0 slot 1 ep 3 flags C
0x00000000035e8550: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8560: Set TR Dequeue Pointer Command: deq 00000000030fa2b1 stream 0 slot 1 ep 3 flags C
0x00000000035e8570: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8580: Set TR Dequeue Pointer Command: deq 00000000030fa2c1 stream 0 slot 1 ep 3 flags C
0x00000000035e8590: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e85a0: Set TR Dequeue Pointer Command: deq 00000000030fa2d1 stream 0 slot 1 ep 3 flags C
0x00000000035e85b0: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e85c0: Set TR Dequeue Pointer Command: deq 00000000030fa2e1 stream 0 slot 1 ep 3 flags C
0x00000000035e85d0: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e85e0: Set TR Dequeue Pointer Command: deq 00000000030fa2f1 stream 0 slot 1 ep 3 flags C
0x00000000035e85f0: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8600: Set TR Dequeue Pointer Command: deq 00000000030fa301 stream 0 slot 1 ep 3 flags C
0x00000000035e8610: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8620: Set TR Dequeue Pointer Command: deq 00000000030fa311 stream 0 slot 1 ep 3 flags C
0x00000000035e8630: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8640: Set TR Dequeue Pointer Command: deq 00000000030fa321 stream 0 slot 1 ep 3 flags C
0x00000000035e8650: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8660: Set TR Dequeue Pointer Command: deq 00000000030fa331 stream 0 slot 1 ep 3 flags C
0x00000000035e8670: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8680: Set TR Dequeue Pointer Command: deq 00000000030fa341 stream 0 slot 1 ep 3 flags C
0x00000000035e8690: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e86a0: Set TR Dequeue Pointer Command: deq 00000000030fa351 stream 0 slot 1 ep 3 flags C
0x00000000035e86b0: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e86c0: Set TR Dequeue Pointer Command: deq 00000000030fa361 stream 0 slot 1 ep 3 flags C
0x00000000035e86d0: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e86e0: Set TR Dequeue Pointer Command: deq 00000000030fa371 stream 0 slot 1 ep 3 flags C
0x00000000035e86f0: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8700: Set TR Dequeue Pointer Command: deq 00000000030fa381 stream 0 slot 1 ep 3 flags C
0x00000000035e8710: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8720: Set TR Dequeue Pointer Command: deq 00000000030fa391 stream 0 slot 1 ep 3 flags C
0x00000000035e8730: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8740: Set TR Dequeue Pointer Command: deq 00000000030fa3a1 stream 0 slot 1 ep 3 flags C
0x00000000035e8750: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8760: Set TR Dequeue Pointer Command: deq 00000000030fa3b1 stream 0 slot 1 ep 3 flags C
0x00000000035e8770: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8780: Set TR Dequeue Pointer Command: deq 00000000030fa3c1 stream 0 slot 1 ep 3 flags C
0x00000000035e8790: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e87a0: Set TR Dequeue Pointer Command: deq 00000000030fa3d1 stream 0 slot 1 ep 3 flags C
0x00000000035e87b0: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e87c0: Set TR Dequeue Pointer Command: deq 00000000030fa3e1 stream 0 slot 1 ep 3 flags C
0x00000000035e87d0: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e87e0: Set TR Dequeue Pointer Command: deq 00000000030fa3f1 stream 0 slot 1 ep 3 flags C
0x00000000035e87f0: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8800: Set TR Dequeue Pointer Command: deq 00000000030fa401 stream 0 slot 1 ep 3 flags C
0x00000000035e8810: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8820: Set TR Dequeue Pointer Command: deq 00000000030fa411 stream 0 slot 1 ep 3 flags C
0x00000000035e8830: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8840: Set TR Dequeue Pointer Command: deq 00000000030fa421 stream 0 slot 1 ep 3 flags C
0x00000000035e8850: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8860: Set TR Dequeue Pointer Command: deq 00000000030fa431 stream 0 slot 1 ep 3 flags C
0x00000000035e8870: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8880: Set TR Dequeue Pointer Command: deq 00000000030fa441 stream 0 slot 1 ep 3 flags C
0x00000000035e8890: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e88a0: Set TR Dequeue Pointer Command: deq 00000000030fa451 stream 0 slot 1 ep 3 flags C
0x00000000035e88b0: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e88c0: Set TR Dequeue Pointer Command: deq 00000000030fa461 stream 0 slot 1 ep 3 flags C
0x00000000035e88d0: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e88e0: Set TR Dequeue Pointer Command: deq 00000000030fa471 stream 0 slot 1 ep 3 flags C
0x00000000035e88f0: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8900: Set TR Dequeue Pointer Command: deq 00000000030fa481 stream 0 slot 1 ep 3 flags C
0x00000000035e8910: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8920: Set TR Dequeue Pointer Command: deq 00000000030fa491 stream 0 slot 1 ep 3 flags C
0x00000000035e8930: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8940: Set TR Dequeue Pointer Command: deq 00000000030fa4a1 stream 0 slot 1 ep 3 flags C
0x00000000035e8950: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8960: Set TR Dequeue Pointer Command: deq 00000000030fa4b1 stream 0 slot 1 ep 3 flags C
0x00000000035e8970: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8980: Set TR Dequeue Pointer Command: deq 00000000030fa4c1 stream 0 slot 1 ep 3 flags C
0x00000000035e8990: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e89a0: Set TR Dequeue Pointer Command: deq 00000000030fa4d1 stream 0 slot 1 ep 3 flags C
0x00000000035e89b0: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e89c0: Set TR Dequeue Pointer Command: deq 00000000030fa4e1 stream 0 slot 1 ep 3 flags C
0x00000000035e89d0: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e89e0: Set TR Dequeue Pointer Command: deq 00000000030fa4f1 stream 0 slot 1 ep 3 flags C
0x00000000035e89f0: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8a00: Set TR Dequeue Pointer Command: deq 00000000030fa501 stream 0 slot 1 ep 3 flags C
0x00000000035e8a10: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8a20: Set TR Dequeue Pointer Command: deq 00000000030fa511 stream 0 slot 1 ep 3 flags C
0x00000000035e8a30: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8a40: Set TR Dequeue Pointer Command: deq 00000000030fa521 stream 0 slot 1 ep 3 flags C
0x00000000035e8a50: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8a60: Set TR Dequeue Pointer Command: deq 00000000030fa531 stream 0 slot 1 ep 3 flags C
0x00000000035e8a70: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8a80: Set TR Dequeue Pointer Command: deq 00000000030fa541 stream 0 slot 1 ep 3 flags C
0x00000000035e8a90: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8aa0: Set TR Dequeue Pointer Command: deq 00000000030fa551 stream 0 slot 1 ep 3 flags C
0x00000000035e8ab0: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8ac0: Set TR Dequeue Pointer Command: deq 00000000030fa561 stream 0 slot 1 ep 3 flags C
0x00000000035e8ad0: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8ae0: Set TR Dequeue Pointer Command: deq 00000000030fa571 stream 0 slot 1 ep 3 flags C
0x00000000035e8af0: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8b00: Set TR Dequeue Pointer Command: deq 00000000030fa581 stream 0 slot 1 ep 3 flags C
0x00000000035e8b10: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8b20: Set TR Dequeue Pointer Command: deq 00000000030fa591 stream 0 slot 1 ep 3 flags C
0x00000000035e8b30: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8b40: Set TR Dequeue Pointer Command: deq 00000000030fa5a1 stream 0 slot 1 ep 3 flags C
0x00000000035e8b50: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8b60: Set TR Dequeue Pointer Command: deq 00000000030fa5b1 stream 0 slot 1 ep 3 flags C
0x00000000035e8b70: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8b80: Set TR Dequeue Pointer Command: deq 00000000030fa5c1 stream 0 slot 1 ep 3 flags C
0x00000000035e8b90: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8ba0: Set TR Dequeue Pointer Command: deq 00000000030fa5d1 stream 0 slot 1 ep 3 flags C
0x00000000035e8bb0: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8bc0: Set TR Dequeue Pointer Command: deq 00000000030fa5e1 stream 0 slot 1 ep 3 flags C
0x00000000035e8bd0: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8be0: Set TR Dequeue Pointer Command: deq 00000000030fa5f1 stream 0 slot 1 ep 3 flags C
0x00000000035e8bf0: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8c00: Set TR Dequeue Pointer Command: deq 00000000030fa601 stream 0 slot 1 ep 3 flags C
0x00000000035e8c10: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8c20: Set TR Dequeue Pointer Command: deq 00000000030fa611 stream 0 slot 1 ep 3 flags C
0x00000000035e8c30: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8c40: Set TR Dequeue Pointer Command: deq 00000000030fa621 stream 0 slot 1 ep 3 flags C
0x00000000035e8c50: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8c60: Set TR Dequeue Pointer Command: deq 00000000030fa631 stream 0 slot 1 ep 3 flags C
0x00000000035e8c70: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8c80: Set TR Dequeue Pointer Command: deq 00000000030fa641 stream 0 slot 1 ep 3 flags C
0x00000000035e8c90: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8ca0: Set TR Dequeue Pointer Command: deq 00000000030fa651 stream 0 slot 1 ep 3 flags C
0x00000000035e8cb0: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8cc0: Set TR Dequeue Pointer Command: deq 00000000030fa661 stream 0 slot 1 ep 3 flags C
0x00000000035e8cd0: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8ce0: Set TR Dequeue Pointer Command: deq 00000000030fa671 stream 0 slot 1 ep 3 flags C
0x00000000035e8cf0: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8d00: Set TR Dequeue Pointer Command: deq 00000000030fa681 stream 0 slot 1 ep 3 flags C
0x00000000035e8d10: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8d20: Set TR Dequeue Pointer Command: deq 00000000030fa691 stream 0 slot 1 ep 3 flags C
0x00000000035e8d30: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8d40: Set TR Dequeue Pointer Command: deq 00000000030fa6a1 stream 0 slot 1 ep 3 flags C
0x00000000035e8d50: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8d60: Set TR Dequeue Pointer Command: deq 00000000030fa6b1 stream 0 slot 1 ep 3 flags C
0x00000000035e8d70: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8d80: Set TR Dequeue Pointer Command: deq 00000000030fa6c1 stream 0 slot 1 ep 3 flags C
0x00000000035e8d90: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8da0: Set TR Dequeue Pointer Command: deq 00000000030fa6d1 stream 0 slot 1 ep 3 flags C
0x00000000035e8db0: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8dc0: Set TR Dequeue Pointer Command: deq 00000000030fa6e1 stream 0 slot 1 ep 3 flags C
0x00000000035e8dd0: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8de0: Set TR Dequeue Pointer Command: deq 00000000030fa6f1 stream 0 slot 1 ep 3 flags C
0x00000000035e8df0: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8e00: Set TR Dequeue Pointer Command: deq 00000000030fa701 stream 0 slot 1 ep 3 flags C
0x00000000035e8e10: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8e20: Set TR Dequeue Pointer Command: deq 00000000030fa711 stream 0 slot 1 ep 3 flags C
0x00000000035e8e30: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8e40: Set TR Dequeue Pointer Command: deq 00000000030fa721 stream 0 slot 1 ep 3 flags C
0x00000000035e8e50: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8e60: Set TR Dequeue Pointer Command: deq 00000000030fa731 stream 0 slot 1 ep 3 flags C
0x00000000035e8e70: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8e80: Set TR Dequeue Pointer Command: deq 00000000030fa741 stream 0 slot 1 ep 3 flags C
0x00000000035e8e90: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8ea0: Set TR Dequeue Pointer Command: deq 00000000030fa751 stream 0 slot 1 ep 3 flags C
0x00000000035e8eb0: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8ec0: Set TR Dequeue Pointer Command: deq 00000000030fa761 stream 0 slot 1 ep 3 flags C
0x00000000035e8ed0: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8ee0: Set TR Dequeue Pointer Command: deq 00000000030fa771 stream 0 slot 1 ep 3 flags C
0x00000000035e8ef0: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8f00: Set TR Dequeue Pointer Command: deq 00000000030fa781 stream 0 slot 1 ep 3 flags C
0x00000000035e8f10: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8f20: Set TR Dequeue Pointer Command: deq 00000000030fa791 stream 0 slot 1 ep 3 flags C
0x00000000035e8f30: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8f40: Set TR Dequeue Pointer Command: deq 00000000030fa7a1 stream 0 slot 1 ep 3 flags C
0x00000000035e8f50: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8f60: Set TR Dequeue Pointer Command: deq 00000000030fa7b1 stream 0 slot 1 ep 3 flags C
0x00000000035e8f70: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8f80: Set TR Dequeue Pointer Command: deq 00000000030fa7c1 stream 0 slot 1 ep 3 flags C
0x00000000035e8f90: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8fa0: Set TR Dequeue Pointer Command: deq 00000000030fa7d1 stream 0 slot 1 ep 3 flags C
0x00000000035e8fb0: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8fc0: Set TR Dequeue Pointer Command: deq 00000000030fa7e1 stream 0 slot 1 ep 3 flags C
0x00000000035e8fd0: Stop Ring Command: slot 1 sp 0 ep 3 flags C
0x00000000035e8fe0: Set TR Dequeue Pointer Command: deq 00000000030fa7f1 stream 0 slot 1 ep 3 flags C
0x00000000035e8ff0: LINK 00000000035e8000 intr 0 type 'Link' flags i:c:T:C

