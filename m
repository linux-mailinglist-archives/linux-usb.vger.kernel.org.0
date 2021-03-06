Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FD4A32FC79
	for <lists+linux-usb@lfdr.de>; Sat,  6 Mar 2021 19:31:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230390AbhCFSZd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 6 Mar 2021 13:25:33 -0500
Received: from netrider.rowland.org ([192.131.102.5]:58449 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S230311AbhCFSZd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 6 Mar 2021 13:25:33 -0500
Received: (qmail 77402 invoked by uid 1000); 6 Mar 2021 13:25:31 -0500
Date:   Sat, 6 Mar 2021 13:25:31 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Aaron Dewes <aaron.dewes@web.de>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Subject: Re: A question about UAS
Message-ID: <20210306182531.GA77074@rowland.harvard.edu>
References: <2ad0d2f9-0ef1-05b5-76db-b178107bfccb@web.de>
 <YEO1t63SQw1Ui4ce@kroah.com>
 <e5c24520-bc6d-8eec-4e51-6cbc30dd59a6@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5c24520-bc6d-8eec-4e51-6cbc30dd59a6@web.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Mar 06, 2021 at 06:27:06PM +0100, Aaron Dewes wrote:
> 
> > On Sat, Mar 06, 2021 at 05:34:32PM +0100, Aaron Dewes wrote:
> > > Hello!
> > > 
> > > Sorry if this suggestion/question sounds stupid, I don't have experience
> > > with the kernel code and this mailing list.
> > > 
> > > I'm a contributor to Umbrel (getumbrel.com), and we provide a software
> > > that allows to run a bitcoin node easily, and we've run into many people
> > > having UAS issues
> > What specific UAS issues?  And why not just fix those instead?
> 
> Sorry, I should've been more specific. When I said UAS issues, I meant
> that we've had many users who used drives that were incompatible with
> UAS, and that script is our way to detect that and fix it, because the
> kernel apparently often doesn't detect that, and I think that way would
> be a way to actually automatically detect such issues.

The kernel _does_ autodetect drives that don't claim to support uas.  
Are you saying that your users have drives which claim to support uas 
but don't actually support it?  If that's so, can you tell us what 
drives they are so we can put this information into the kernel?

And can you tell us what errors the users encounter?

Also, how can you be sure that the drives don't support uas at all, as 
opposed to supporting uas in general but not a few specific commands?

> Currently, drivers/usb/storage/unusual_devs.h disables UAS for a few
> devices, but autodetecting would be better in my opinion.

Autodetecting the way you want wouldn't really work very well.  It would 
require the user to plug in the drive and initiate some actiity on it 
which would generate a flurry of errors, so that the kernel could see 
that it should try usb-storage instead.  Then the user would have to 
unplug the drive and plug it in a second time so that usb-storage could 
manage it.

Alan Stern
