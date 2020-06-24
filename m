Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 175352075F7
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jun 2020 16:45:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390970AbgFXOpO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Jun 2020 10:45:14 -0400
Received: from netrider.rowland.org ([192.131.102.5]:44581 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S2389583AbgFXOpO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Jun 2020 10:45:14 -0400
Received: (qmail 216110 invoked by uid 1000); 24 Jun 2020 10:45:13 -0400
Date:   Wed, 24 Jun 2020 10:45:13 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Microchip USB2642 Hub not resuming from USB autosuspend
Message-ID: <20200624144513.GB214996@rowland.harvard.edu>
References: <8738e4d3-62b1-0144-107d-ff42000ed6c6@puri.sm>
 <021b18e4-343d-76d2-5d35-817d576f503e@puri.sm>
 <20200623145453.GA178927@rowland.harvard.edu>
 <db8405e4-3026-9b3e-3e00-169b3559cac2@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db8405e4-3026-9b3e-3e00-169b3559cac2@puri.sm>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

[CC: list drastically trimmed]

On Wed, Jun 24, 2020 at 09:22:42AM +0200, Martin Kepplinger wrote:
> On 23.06.20 16:54, Alan Stern wrote:
> > I don't understand this.  As far as I know, runtime-PM support in the SCSI 
> > and block layers has been complete for many years.  If you have to do 
> > anything extra (like applying the patch in the email you mentioned) then 
> > something is broken.  The device should be able to go into runtime suspend 
> > just fine with the current code -- even when a file system is mounted.
> > 
> 
> The scsi and usb layers have good implementations for runtime pm for a
> long time indeed. The scsi drivers though vary: for example sr indeed
> suspends when unused, when mounted and open too.
> 
> look at the sd driver in comparison though: From what I see, it "uses"
> autopm (runtime pm) as it would let the device suspend, but never
> resumes from it (except when removing and probing again). My suspicion
> is that it's not really used for that reason.
> 
> I might be wrong of course - I usually don't look at scsi code and I'm
> so thankful for feedback. That's what I read though and also what my
> tests verify. Hence the patch to the sd driver that makes enabling
> runtime pm result in a usable device (granted, not yet saving as much
> power as it really could, but that can be added later).

I haven't looked at this code or tested it for a long time, so maybe it 
isn't working properly.

Still, here's the general idea of how it's _intended_ to work: The 
runtime PM control for sd lies not in the sd driver itself but in the 
block layer core.  If a SCSI drive is suspended when a block request is 
issued, the block layer initiates a runtime resume.  See the kerneldoc for 
blk_pm_runtime_init() and the following functions in block/blk-pm.c.

If you need a more detailed explanation, please ask.

Alan Stern
