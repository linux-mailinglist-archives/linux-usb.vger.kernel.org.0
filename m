Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A010B225246
	for <lists+linux-usb@lfdr.de>; Sun, 19 Jul 2020 16:47:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726073AbgGSOrR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Jul 2020 10:47:17 -0400
Received: from netrider.rowland.org ([192.131.102.5]:43033 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1725988AbgGSOrR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 19 Jul 2020 10:47:17 -0400
Received: (qmail 1200568 invoked by uid 1000); 19 Jul 2020 10:47:15 -0400
Date:   Sun, 19 Jul 2020 10:47:15 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Achim Dahlhoff <achimdahlhoff@gmx.de>
Cc:     linux-usb@vger.kernel.org
Subject: Re: bug: Reproduceable hung-task in snd_usb_pcm or usb-core in VM
 with Behringer device.
Message-ID: <20200719144715.GB1200012@rowland.harvard.edu>
References: <trinity-384b299a-61b0-461c-9abb-1a00fc942b85-1595083781938@3c-app-gmx-bap08>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <trinity-384b299a-61b0-461c-9abb-1a00fc942b85-1595083781938@3c-app-gmx-bap08>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jul 18, 2020 at 04:49:41PM +0200, Achim Dahlhoff wrote:
> Reproduceable hung-task in snd_usb_pcm or usb-core in VM with Behringer device.
> 
> Hello maintainers of usb,
> 
> I found a reproduceable hung-task problem when trying to use Behringer 
> "Uphoria" audio devices inside VMware workstation, on Debian-SID with 
> kernel 5.7 or with 5.8-rc5 . Kernel-trace and USB IDs are included.
> 
> Am I right to post here?

Yes.

> The problem occurs every time when accessing the devices.
> The problem does NOT occur with:
>  - another sound device (griffin)
>  - on native Linux on another machine

What about when you use the problematic machine with native Linux?  
That's really the most important case.

> I cannot tell if it is a bug with VMware, the Behringer audio devices, 
> or if this might point to a bug in snd_usb_pcm.

If the device works on the same machine under native Linux then most 
likely it is a problem in VMware.

If it doesn't, the failure symptoms (a hang inside usb_kill_urb) 
indicate a problem in the USB host controller hardware or driver, not in 
snd_usb_pcm or the audio device.

> If you have an idea what to try I can apply patches, rebuild kernel 
> and try if an improvement works.

Try booting from a "Live" distribution and see what happens, if you 
don't want to install Linux on the test machine.

Alan Stern
