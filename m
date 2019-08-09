Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B899C87B7F
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2019 15:38:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405723AbfHINiG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Aug 2019 09:38:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:60360 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726152AbfHINiG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 9 Aug 2019 09:38:06 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D9B1220B7C;
        Fri,  9 Aug 2019 13:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565357885;
        bh=oHkoObse4PQEGR12IpcCPE1ydfTXKlPEBV2f08iF//I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QM7rjc/kZoUFj9bV7re0KYqX2IZAjqeEu7DSoUkwcun1g8f3l3mF0AzK9fNy0K9eG
         ll7MzUmw46se9ALqJcoCUjvEkxv2xOXrAwTY4RKNQMDsWB2opEkQRhulbOZpsw5AKi
         9Wjp7rp4632bARe9SljbMViDwQtvMwtQ5/W8FI1w=
Date:   Fri, 9 Aug 2019 15:38:03 +0200
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
Message-ID: <20190809133803.GD30876@kroah.com>
References: <Pine.LNX.4.44L0.1908081522290.1319-100000@iolanthe.rowland.org>
 <caf422aebd314ab8a5dd96ac2d9bb198@SVR-IES-MBX-03.mgc.mentorg.com>
 <20190809075555.GA20409@kroah.com>
 <8e43085507b849e49e858e5388f3e13c@SVR-IES-MBX-03.mgc.mentorg.com>
 <d7f1f3dc-03b3-34b8-657b-13c7b91ee361@redhat.com>
 <86ef050c477841a6951fd984b38c9f04@SVR-IES-MBX-03.mgc.mentorg.com>
 <9c955960-8b50-30dd-732a-92c62e5761cc@redhat.com>
 <932dbc769a80416eb736e6397c126ce9@SVR-IES-MBX-03.mgc.mentorg.com>
 <20190809125458.GA2230@kroah.com>
 <1565355625471.54150@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1565355625471.54150@mentor.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Aug 09, 2019 at 01:00:25PM +0000, Schmid, Carsten wrote:
> >>
> >> @Greg:
> >> I am still confident that my patch in __release_region should be taken in.
> >
> > Ok, submit it in a "real" way and we can consider it :)
> >
> > thanks,
> >
> > greg k-h
> 
> Already done, linux-kernel@vger.kernel.org, see
> https://www.spinics.net/lists/kernel/msg3218180.html

You didn't cc: any developer, that's a sure way to get a patch ignored
:(

Try resending it with at least the people who get_maintainer.pl says has
touched that file last in it.

Also, Linus is the unofficial resource.c maintainer.  I think he has a
set of userspace testing scripts for changes somewhere, so you should
 cc: him too.  And might as well add me :)

 thanks,

 greg k-h
