Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7476933DA34
	for <lists+linux-usb@lfdr.de>; Tue, 16 Mar 2021 18:05:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238995AbhCPRFP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Mar 2021 13:05:15 -0400
Received: from netrider.rowland.org ([192.131.102.5]:46557 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S239072AbhCPREf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Mar 2021 13:04:35 -0400
Received: (qmail 453081 invoked by uid 1000); 16 Mar 2021 13:04:33 -0400
Date:   Tue, 16 Mar 2021 13:04:33 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Matthias Schwarzott <zzam@gentoo.org>,
        usb-storage@lists.one-eyed-alien.net, linux-usb@vger.kernel.org,
        systemd-devel@lists.freedesktop.org, hirofumi@mail.parknet.co.jp
Subject: Re: [systemd-devel] [usb-storage] Re: Amazon Kindle disconnect after
 Synchronize Cache
Message-ID: <20210316170433.GD448722@rowland.harvard.edu>
References: <20210307165856.GA104554@rowland.harvard.edu>
 <268e646f-d4ea-3190-f1b9-8e69bfc1b019@gentoo.org>
 <20210309155046.GA176674@rowland.harvard.edu>
 <dfd2b281-3beb-9869-37b6-8bd48a6cf40f@gentoo.org>
 <20210310214648.GA236329@rowland.harvard.edu>
 <841a9a54-78ee-ffaa-fc3c-12defcf43b36@gentoo.org>
 <20210311143912.GA257360@rowland.harvard.edu>
 <f2acfeef-a81a-d7c0-90a8-b290a18cb742@gentoo.org>
 <20210316162650.GB448722@rowland.harvard.edu>
 <031a20c5-27c3-cc13-6e0b-a308644abce4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <031a20c5-27c3-cc13-6e0b-a308644abce4@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Mar 16, 2021 at 05:43:34PM +0100, Hans de Goede wrote:
> Hi,
> 
> On 3/16/21 5:26 PM, Alan Stern wrote:
> > On Tue, Mar 16, 2021 at 06:26:30AM +0100, Matthias Schwarzott wrote:
> >> I implemented solution 3b. This is the pullrequest for udev (systemd
> >> repository):
> >>
> >> 	https://github.com/systemd/systemd/pull/19002
> >>
> >> Now Lennart asks if udev is the best place for such hacks/work-arounds?
> >>
> >> Well, I implemented it as suggested by Alan (see above). This was the
> >> simplest of the considered alternatives. Different quirks in kernel has been
> >> considered, but are more effort to be implemented.
> > 
> > Lennart probably isn't aware how the usb-storage driver works.  It does 
> > not create commands on its own; it merely sends the commands that it 
> > gets from higher SCSI layers.
> > 
> > It may be possible to modify the SCSI core, to make it send a TEST UNIT 
> > READY command immediately following any SYNCHRONIZE CACHE to a Kindle.
> > 
> > However, there may be an easier solution.  usb-storage does indeed send 
> > a command of its own, REQUEST SENSE, to get error data when a command 
> > fails.  The patch below will make it do the same thing whenever it sends 
> > a SYNCHRONIZE CACHE to a Kindle, failure or not.
> > 
> > The only question is whether the Kindle will regard REQUEST SENSE as a 
> > sufficient indication that it shouldn't do an eject.  The only way to 
> > find out is by testing the patch.
> > 
> > Alan Stern
> 
> Thank you for this patch, yes if this works it would IMHO be
> a much better solution then the udev rule.

I think it would be mildly better, but not a whole lot.  Since the 
Kindle describes itself as having removable media, the kernel normally 
probes it periodically to make sure the media remains present.  The 
default probing interval is 2 seconds.  Reducing it to 0.9 seconds 
doesn't represent an exorbitant additional load IMO -- especially since 
Kindles don't tend to spend huge amounts of time connected to computers.

If it's merely a question of where to change the polling interval from 
the default (automatically in the kernel or by userspace), that also 
doesn't seem like a terribly important choice.  Certainly a udev rule or 
hwdb entry is a lot easier to maintain than special-case code in the 
kernel.

> One question though, if this works to fix the undesired ejects,
> will an actual eject (using e.g. the eject utility as say
> "sudo eject /dev/sda") still be seen as an eject by the kindle
> after this ?

It should be.  Maybe Matthias will try it and let us know.

> Because that is actually kind of important for everyone using their
> Kindle with Calibre, breaking that would not be good.

Of course.

Alan Stern
