Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82D62214D11
	for <lists+linux-usb@lfdr.de>; Sun,  5 Jul 2020 16:24:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726942AbgGEOYC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 5 Jul 2020 10:24:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:37282 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726781AbgGEOYC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 5 Jul 2020 10:24:02 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5603B20723;
        Sun,  5 Jul 2020 14:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593959041;
        bh=WoiFfdydL5uBwsrBclylNIpIQlcXb/syTbEFYBWsSaI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FZL2wCPcmPEKQBE7dJkJzZ6YGdks9o/N1C8YGJusCL9BfZ5GqfmTg/UvGmsAqb7U1
         9APMgfl2u0CnVGi3qTu0pSrOKBnW1NXmhi6TlDYTvIamIGTNKKa9yHhg/nVSfe1g0I
         m8S9rJTFyY+Co2P9gczTMuiCFKLGQEYe4I+cbSQQ=
Date:   Sun, 5 Jul 2020 16:24:03 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Diego Elio =?iso-8859-1?Q?Petten=F2?= <flameeyes@flameeyes.com>
Cc:     Pete Zaitcev <zaitcev@redhat.com>,
        Paolo Abeni <paolo.abeni@gmail.com>,
        Kris Katterjohn <katterjohn@gmail.com>,
        linux-usb@vger.kernel.org
Subject: Re: usbmon structures headers?
Message-ID: <20200705142403.GA1629177@kroah.com>
References: <ce1a62d3-4fd7-40a3-919f-9f8bb4130884@www.fastmail.com>
 <74a26b91-489f-4c04-a53e-8930a9df9bd6@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <74a26b91-489f-4c04-a53e-8930a9df9bd6@www.fastmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jul 04, 2020 at 10:46:09PM +0100, Diego Elio Pettenò wrote:
> (Updating Paolo's email, that is out of date in both sources.)
> 
> On Sat, Jul 4, 2020, at 22:43, Diego Elio Pettenò wrote:
> > Hi folks,
> > 
> > I'm trying to write a quick implementation of usbmon capture in Cython, 
> > for an Apache-2.0 licensed project[1].
> > 
> > As I followed the documentation[2], I realised that the definition of 
> > ioctl constants and structures for usbmon are not exposed in headers at 
> > all, only in the sources[3]. This makes it… a bit of a problem, because 
> > I'm not sure if mimicking the structures in Cython falls into the 
> > syscall exception at that point.
> > 
> > Interesting enough, libpcap appears to define the same values, but 
> > apply an MIT license to them[4], so I could copy them from there, but I 
> > thought I would at least check first, if this should be exposed in the 
> > first place.
> > 
> > Please advise!
> > 
> > [1]: https://github.com/Flameeyes/usbmon-tools
> > [2]: https://www.kernel.org/doc/Documentation/usb/usbmon.txt
> > [3]: https://github.com/torvalds/linux/blob/master/drivers/usb/mon/mon_bin.c
> > [4]: https://github.com/the-tcpdump-group/libpcap/blob/master/pcap-usb-linux.c

Yeah, we really should put those structures in include/uapi/ with the
proper license.  Care to make a patch for it?

thanks,

greg k-h
