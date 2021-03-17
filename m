Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F84933F439
	for <lists+linux-usb@lfdr.de>; Wed, 17 Mar 2021 16:49:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232042AbhCQPsp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 Mar 2021 11:48:45 -0400
Received: from netrider.rowland.org ([192.131.102.5]:55401 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S232468AbhCQPsK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Mar 2021 11:48:10 -0400
Received: (qmail 490023 invoked by uid 1000); 17 Mar 2021 11:17:46 -0400
Date:   Wed, 17 Mar 2021 11:17:46 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Matthias Schwarzott <zzam@gentoo.org>,
        usb-storage@lists.one-eyed-alien.net, linux-usb@vger.kernel.org,
        systemd-devel@lists.freedesktop.org, hirofumi@mail.parknet.co.jp
Subject: Re: [systemd-devel] [usb-storage] Re: Amazon Kindle disconnect after
 Synchronize Cache
Message-ID: <20210317151746.GB488655@rowland.harvard.edu>
References: <20210309155046.GA176674@rowland.harvard.edu>
 <dfd2b281-3beb-9869-37b6-8bd48a6cf40f@gentoo.org>
 <20210310214648.GA236329@rowland.harvard.edu>
 <841a9a54-78ee-ffaa-fc3c-12defcf43b36@gentoo.org>
 <20210311143912.GA257360@rowland.harvard.edu>
 <f2acfeef-a81a-d7c0-90a8-b290a18cb742@gentoo.org>
 <20210316162650.GB448722@rowland.harvard.edu>
 <031a20c5-27c3-cc13-6e0b-a308644abce4@redhat.com>
 <20210316170433.GD448722@rowland.harvard.edu>
 <1d9f059e-8b21-0895-9a50-39b6b1a5cc5c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1d9f059e-8b21-0895-9a50-39b6b1a5cc5c@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Mar 17, 2021 at 01:21:50PM +0100, Hans de Goede wrote:
> Hi,
> 
> On 3/16/21 6:04 PM, Alan Stern wrote:
> > I think it would be mildly better, but not a whole lot.  Since the 
> > Kindle describes itself as having removable media, the kernel normally 
> > probes it periodically to make sure the media remains present.  The 
> > default probing interval is 2 seconds.  Reducing it to 0.9 seconds 
> > doesn't represent an exorbitant additional load IMO -- especially since 
> > Kindles don't tend to spend huge amounts of time connected to computers.
> 
> Ah, I did not know that the default polling interval was that low(ish),
> given that the default indeed is already that low, then changing it to
> 0.8 seconds would not be a big change.  And we probably have a lot of
> lower hanging fruit for unnecessary wakeups then that.

So we need to make a decision: Should the patch be merged, or should we 
punt the issue to userspace tools?

On the plus side, the patch is rather small and non-invasive (although 
it does allocate the last remaining bit in the 32-bit fflags field).  
There's also the advantage of sending the extra command only when it is 
needed, as opposed to increasing the overall frequency of TUR polling.

Any opinions?

Alan Stern
