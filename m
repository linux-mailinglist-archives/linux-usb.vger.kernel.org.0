Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EDDA18B6A
	for <lists+linux-usb@lfdr.de>; Thu,  9 May 2019 16:15:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726557AbfEIOO5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 May 2019 10:14:57 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:43752 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726571AbfEIOO5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 May 2019 10:14:57 -0400
Received: (qmail 5708 invoked by uid 2102); 9 May 2019 10:14:55 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 9 May 2019 10:14:55 -0400
Date:   Thu, 9 May 2019 10:14:55 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     EJ Hsu <ejh@nvidia.com>
cc:     "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [V2] usb: gadget: storage: Remove warning message
In-Reply-To: <BN7PR12MB264462BFFBDDACE928D2DCB9CF330@BN7PR12MB2644.namprd12.prod.outlook.com>
Message-ID: <Pine.LNX.4.44L0.1905091011520.1480-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 9 May 2019, EJ Hsu wrote:

> > You forgot to change fsg_unbind() to use FSG_STATE_DISCONNECT.  And when
> > that's done, it will no longer need to set common->new_fsg to NULL either.
> > 
> 
> Yes, we should change fsg_unbind() as well.
> 
> > This is sort of a band-aid approach.  The real problem is that the original design
> > of the driver never intended for there to be more than one outstanding
> > CONFIG_CHANGE event, so naturally there are scenarios where it doesn't work
> > right when that assumption is violated.  This patch addresses one of those
> > scenarios, but there may be others remaining.
> > 
> > Ultimately the problem boils down to synchronization with the composite core.
> 
> Thanks for your reviewing, I agree with your point.
> 
> > Some of the callbacks made by the core take time to fully process, so what
> > should happen if the core makes a second callback before the first one is
> > completely processed?
> > 
> > On the other hand, I can't think of anything better at the moment.
> > 
> > Alan Stern
> 
> Actually, composite core have tried to deal with this case by using a spinlock. 
> (please refer to the cdev->lock)
> The problem here is that the callback of fsg will delegate the request to 
> fsg_main_thread. That is, the handling of fsg request will run in parallel with 
> composite core.
> In my opinion, this issue can be avoided if we handle these request directly 
> in the callback of fsg instead of handing it over to fsg_main_thread. But this 
> might take too much time in the interrupt context, which is not good for 
> system performance.
> 
> Please correct me if there is anything wrong. Thanks

In theory, the mass-storage function could also be fixed to be more
careful about locking and synchronization.  For example, never set or
read common->next_fsg unless you're holding the fsg lock, and don't
raise a CONFIG_CHANGE exception if another one is already pending.

But I think your patch will be good enough for now, once you have fixed 
up the two issues mentioned earlier.

Alan Stern

