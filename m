Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF9BB19AF8D
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2020 18:19:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728419AbgDAQTG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Apr 2020 12:19:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:41444 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726205AbgDAQTG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 1 Apr 2020 12:19:06 -0400
Received: from localhost (unknown [122.167.76.164])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EFCF720658;
        Wed,  1 Apr 2020 16:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585757945;
        bh=ql/3BKobrv6oCuTKFClbHyvADcaW0x+JzG1g4y5CEzM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ibgo3Z5IqfLLIuCR4uHAR4C+0i9ByqCq8blKvUFyw/Elhylp8fQj9m7zxn5aHtKwp
         Oj/E/1xMvoKCJx9dtrrRppnSTN+eFC3PrgvUNTmjH2aSrRnbApEdVAk4F/y2Guk6jv
         sY2ZIuwiX2sGVd+Q2qjJ/Cj+0JQe0GO8U4uHQ2Sc=
Date:   Wed, 1 Apr 2020 21:48:52 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Christian Lamparter <chunkeey@gmail.com>
Cc:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Christian Lamparter <chunkeey@googlemail.com>,
        John Stultz <john.stultz@linaro.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Andreas =?iso-8859-1?Q?B=F6hler?= <dev@aboehler.at>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 3/5] usb: xhci: Add support for Renesas controller
 with memory
Message-ID: <20200401161852.GD72691@vkoul-mobl>
References: <20200323170601.419809-1-vkoul@kernel.org>
 <20200326115117.GZ72691@vkoul-mobl>
 <20200401125748.GC72691@vkoul-mobl>
 <9854066.43zovN3OMW@debian64>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9854066.43zovN3OMW@debian64>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Christian,

On 01-04-20, 17:39, Christian Lamparter wrote:
> On Wednesday, 1 April 2020 14:57:48 CEST Vinod Koul wrote:
> > On 26-03-20, 17:21, Vinod Koul wrote:
> > > On 26-03-20, 13:29, Mathias Nyman wrote:
> > > > On 23.3.2020 19.05, Vinod Koul wrote:
> > > > > Some rensas controller like uPD720201 and uPD720202 need firmware to be
> > > > > loaded. Add these devices in table and invoke renesas firmware loader
> > > > > functions to check and load the firmware into device memory when
> > > > > required.
> > > > > 
> > > > > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > > > > ---
> > > > >  drivers/usb/host/xhci-pci-renesas.c |  1 +
> > > > >  drivers/usb/host/xhci-pci.c         | 29 ++++++++++++++++++++++++++++-
> > > > >  drivers/usb/host/xhci-pci.h         |  3 +++
> > > > >  3 files changed, 32 insertions(+), 1 deletion(-)
> > > > > 
> > > > 
> > > > It's unfortunate if firmware loading couldn't be initiated in a PCI fixup hook
> > > > for this Renesas controller. What was the reason it failed?
> > > > 
> > > > Nicolas Saenz Julienne just submitted a solution like that for Raspberry Pi 4
> > > > where firmware loading is initiated in pci-quirks.c quirk_usb_early_handoff()
> > > > 
> > > > https://lore.kernel.org/lkml/20200324182812.20420-1-nsaenzjulienne@suse.de
> > > > 
> > > > Is he doing something different than what was done for the Renesas controller?
> > > 
> > > I tried and everytime ended up not getting firmware. Though I did not
> > > investigate a lot. Christian seemed to have tested sometime back as
> > > well.
> > > 
> > > Another problem is that we dont get driver_data in the quirk and there
> > > didnt seem a way to find the firmware name.
> > > 
> > > > > diff --git a/drivers/usb/host/xhci-pci-renesas.c b/drivers/usb/host/xhci-pci-renesas.c
> > > > > index c588277ac9b8..d413d53df94b 100644
> > > > > --- a/drivers/usb/host/xhci-pci-renesas.c
> > > > > +++ b/drivers/usb/host/xhci-pci-renesas.c
> > > > > @@ -336,6 +336,7 @@ static void renesas_fw_callback(const struct firmware *fw,
> > > > >  		goto cleanup;
> > > > >  	}
> > > > >  
> > > > > +	xhci_pci_probe(pdev, ctx->id);
> > > > >  	return;
> > > > 
> > > > I haven't looked into this but instead of calling xhci_pci_probe() here in the async fw
> > > > loading callback could we just return -EPROBE_DEFER until firmware is loaded when
> > > > xhci_pci_probe() is originally called?
> > > 
> > > Hmm, initially my thinking was how to tell device core to probe again,
> > > and then digging up I saw wait_for_device_probe() which can be used, let
> > > me try that
> > 
> > Sorry to report back that it doesn't work as planned :(
> > 
> > I modified the code to invoke the request_firmware_nowait() which will load
> > the firmware and provide the firmware in callback. Meanwhile return -EPROBE_DEFER.
> > 
> > After a bit, the core invokes the driver probe again and we hit the
> > roadblock. The request_firmware uses devres and allocates resources for
> > loading the firmware. The problem is that device core checks for this:
> > 
> > bus: 'pci': really_probe: probing driver xhci_hcd_pci with device 0000:01:00.0
> > pci 0000:01:00.0: Resources present before probing
> > 
> > And here the probe fails. In some cases the firmware_callback finishes
> > before this and we can probe again, but that is not very reliable.
> > 
> > I tested another way to use request_firmware() (sync version) and then
> > load the firmware in probe and load. The request is done only for
> > renesas devices if they dont have firmware already running.
> > So rest of the devices wont have any impact.
> > 
> > Now should we continue this way in the patchset or move to sync version.
> > Am okay either way.
> 
> Just a word of caution.
> 
> The problem with the usage of "sync" request_firmware in drivers is that if the
> code is built into the kernel the request_firmware() could be called before the
> (root) filesystem on which the firmware resides is ready.... So this will get
> weird during boot because what is the sync request_firmware() going to do? From what
> I know, this is why the funny _async firmware request APIs are even a thing...

So is your usage a module or inbuilt. I am using it as a module, so
seems okay. For inbuilt, someone needs to do make it in kernel or make
sure the initramfs has this :)

> (I took a quick peek into the RPI 4 code, but unlike this code it seems to fetch
> from nvmem/eeprom, is this right? I had a tons-of-fun dealing with caldata and
> firmware on UBIFS in UBI Volumes. So I'm prepared to test this cases. :D )

Okay I will send you this version to play around with.

> (Another possibility would be to use request_firmware_direct() here.
> Though, I don't know if it would be considered API Abuse to -EPROBE_DEFER
> on errors of request_firmware_direct() in order to wait for FSes to appear )

As I said we need to either accept the current change of having async
version and have firmware callback invoke probe to complete the load
action or move to sync. Which of the lesser devils are we going to be
happy with :)

-- 
~Vinod
