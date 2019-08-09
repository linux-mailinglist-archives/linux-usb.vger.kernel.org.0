Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9EE487A9B
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2019 14:55:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406802AbfHIMzB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Aug 2019 08:55:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:41846 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726505AbfHIMzB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 9 Aug 2019 08:55:01 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F1B3020B7C;
        Fri,  9 Aug 2019 12:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565355300;
        bh=wVSbwdE+QsZ0ywu7/8DSOEeXkcgMi1ZNqvYyvYvUp+k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LYSNhUqbWasx46Kx6lvS5JL7Ayu3tg/3bjgtvvGdTrPshtMjmnmXkdY4xve9E48Is
         2q3B6MsLvZOAVNVxJS6vjyGs2pjJWbfdL5x/l7tx71A4TaI6cPAbpXdFtF7deFXBh+
         8+oEK7e1aFFGcgmBX9wmv7z11cM8tJuM6124OBo4=
Date:   Fri, 9 Aug 2019 14:54:58 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     "Schmid, Carsten" <Carsten_Schmid@mentor.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Andrey Konovalov <andreyknvl@google.com>,
        Oliver Neukum <oneukum@suse.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        syzbot <syzbot+ef5de9c4f99c4edb4e49@syzkaller.appspotmail.com>,
        USB list <linux-usb@vger.kernel.org>,
        Hillf Danton <hdanton@sina.com>
Subject: Re: AW: AW: KASAN: use-after-free Read in usbhid_power
Message-ID: <20190809125458.GA2230@kroah.com>
References: <CAAeHK+wb8=Z65_1CGcj0ShT6+NiQSDKhEkBVx+8vPe3kJF8+6g@mail.gmail.com>
 <Pine.LNX.4.44L0.1908081522290.1319-100000@iolanthe.rowland.org>
 <caf422aebd314ab8a5dd96ac2d9bb198@SVR-IES-MBX-03.mgc.mentorg.com>
 <20190809075555.GA20409@kroah.com>
 <8e43085507b849e49e858e5388f3e13c@SVR-IES-MBX-03.mgc.mentorg.com>
 <d7f1f3dc-03b3-34b8-657b-13c7b91ee361@redhat.com>
 <86ef050c477841a6951fd984b38c9f04@SVR-IES-MBX-03.mgc.mentorg.com>
 <9c955960-8b50-30dd-732a-92c62e5761cc@redhat.com>
 <932dbc769a80416eb736e6397c126ce9@SVR-IES-MBX-03.mgc.mentorg.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <932dbc769a80416eb736e6397c126ce9@SVR-IES-MBX-03.mgc.mentorg.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Aug 09, 2019 at 12:38:35PM +0000, Schmid, Carsten wrote:
> Hi again,
> 
> >>
> >> Hey, i did not want to trigger an eartquake in the basement of the kernel ;-)
> >> My intention was to prevent some crashes, and help developers to find their bugs.
> >> I think my patch exactly does this.
> > 
> > Hehe, actually drivers not being able to block unbind has been bugging me
> > for
> > a while now, because there are cases where this would be really helpful.
> >>> 1) make resources refcounted, have child resources take a ref on the parent
> >>> 2) Disallow unbind on devices with bound child-devices?
> >>>
> >> Exactly what i was thinking of in first attempts.
> >> But i fear that would break even more use cases.
> >>
> >> Hans, directly regarding the driver:
> >> The problem i see is that the xhci_intel_unregister_pdev which is added
> >> as an action with devm_add_action_or_reset() is called late by the framework,
> >> later than the usb_hcd_pci_remove() in xhci_pci_remove.
> >> Is there any chance to trigger this before?
> >> This is what Greg meant with "right order".
> > 
> > Ah, I missed that part, sure that should be easy, just stop using
> > devm_add_action_or_reset() and do the xhci_intel_unregister_pdev()
> > manually at the right time. The downside of this is that you also
> > need to make sure it happens at the right time from probe error-paths
> > but given the bug you are hitting, I guess that is probably
> > already a problem.
> > 
> @Hans:
> Sure, will have a look at this. I think i have found where to do that,
> but need to check how to get the pdev pointer there ....
> 
> @Greg:
> I am still confident that my patch in __release_region should be taken in.

Ok, submit it in a "real" way and we can consider it :)

thanks,

greg k-h
