Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCD7F1FD24C
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jun 2020 18:37:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726926AbgFQQhf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 Jun 2020 12:37:35 -0400
Received: from netrider.rowland.org ([192.131.102.5]:58741 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726540AbgFQQhf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Jun 2020 12:37:35 -0400
Received: (qmail 16621 invoked by uid 1000); 17 Jun 2020 12:37:34 -0400
Date:   Wed, 17 Jun 2020 12:37:34 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Till =?iso-8859-1?Q?D=F6rges?= <doerges@pre-sense.de>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Ext. HDDs not working under Linux via USB 3.0 but under Windows
Message-ID: <20200617163734.GC11314@rowland.harvard.edu>
References: <512118bc-e639-2387-e608-56b7e30fc3b2@pre-sense.de>
 <20200523154817.GA7091@rowland.harvard.edu>
 <34933b01-e4b0-10da-c935-9e6a9a6ae427@pre-sense.de>
 <20200523203349.GA12853@rowland.harvard.edu>
 <5bd5e8be-f8a9-9456-cced-c2bc75455556@pre-sense.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5bd5e8be-f8a9-9456-cced-c2bc75455556@pre-sense.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 17, 2020 at 06:02:32PM +0200, Till Dörges wrote:
> Hi Alan,
> 
> sorry for the delay. It took me a while to get back to this.
> 
> Am 23.05.20 um 22:33 schrieb Alan Stern:
> 
> >>>> I'm trying to get external HDDs from Sony to work under Linux with USB 3.0.
> >> [...]
> >>>>  - PSZ-HA2T: idVendor=054c, idProduct=087d
> >>>>  - PSZ-HA1T: idVendor=054c, idProduct=087d
> >>>>  - PSZ-HA50: idVendor=054c, idProduct=087d
> >>>>  - PSZ-HC1T: idVendor=054c, idProduct=0c4f
> >> [...]
> >>>> I've also tried several of the quirk settings
> >>>> (https://github.com/torvalds/linux/blob/ead751507de86d90fa250431e9990a8b881f713c/drivers/usb/storage/usb.c#L527).
> 
> [...]
> >>> Try adding an entry to the unusual_uas.h file for the device, specifying 
> >>> the USB_FL_NO_REPORT_OPCODES flag.
> >>
> >> I'm not sure I understand correctly. Do I have to compile the uas Kernel module
> >> myself if I want to test a flag?
> >>
> >> Because with setting the f flag (via options usb-storage quirks=054c:087d:f) the
> >> PSZ-HA*1*T starts behaving nicely.
> >>
> >> --- snip ---
> >> $ cat /sys/module/usb_storage/parameters/quirks
> >> 054c:087d:f,054c:0c4f:f
> >> --- snip ---
> >>
> >>
> >> The PSZ-HA*2*T, however, still doesn't work with that.
> Since the device stopped working under windows, I'm guessing that it's simply broken.
> 
> I'll try to get my hands on a new sample.
> 
> 
> The PSZ-HA50 and the PSZ-HA1T work nicely when attached to USB 3.0 with this setting:
> 
> --- snip ---
> $ cat /sys/module/usb_storage/parameters/quirks
> 054c:087d:u
> --- snip ---
> 
> W/o this quirk they do not work.
> 
> 
> I'd be surprised if a non-broken PSZ-HA2T behaved any differently.
> 
> So perhaps you might want to consider adding that quirk directly into the Kernel?
> 
> 
> FTR, the PSZ-HC1T just worked.

Okay.  If you would like to write a patch for the quirk and submit it, you 
can.  Otherwise I'll write one for you.

Alan Stern
