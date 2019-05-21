Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2C8125183
	for <lists+linux-usb@lfdr.de>; Tue, 21 May 2019 16:08:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728560AbfEUOIM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 May 2019 10:08:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:40064 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726900AbfEUOIK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 21 May 2019 10:08:10 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B5EAA21479;
        Tue, 21 May 2019 14:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558447689;
        bh=5hjjwXS4coY6l92BBwT+eDWta2KJkHuDOp+dppOub6M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rfjUoOwQiXLxbiVe7vVDh+8d/MybBlnua52BYU24U66qhJIXdoMI7u87hp/WwDlVp
         2WMAjkCTXOPjaCId2jg21FeI/R8klnhLdeM0QLTJFIhhUNnJ2OWnvzhe42OgJHJ+0F
         FEMLrs5DA0s2GcXr+o21yqbpJTRoQMOBB0y9dvhg=
Date:   Tue, 21 May 2019 16:08:05 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     kbuild test robot <lkp@intel.com>, kbuild-all@01.org,
        linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: Re: [usb:usb-linus 3/10] drivers/media//usb/siano/smsusb.c:447:37:
 warning: 'in_maxp' may be used uninitialized in this function
Message-ID: <20190521140805.GA24615@kroah.com>
References: <20190521130913.GA7273@kroah.com>
 <Pine.LNX.4.44L0.1905210948590.1634-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1905210948590.1634-100000@iolanthe.rowland.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 21, 2019 at 09:49:36AM -0400, Alan Stern wrote:
> On Tue, 21 May 2019, Greg Kroah-Hartman wrote:
> 
> > On Tue, May 21, 2019 at 04:48:47PM +0800, kbuild test robot wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
> > > head:   53c7b63f797c96a30c21dd3b781fafaae096a12b
> > > commit: 31e0456de5be379b10fea0fa94a681057114a96e [3/10] media: usb: siano: Fix general protection fault in smsusb
> > > config: mips-allmodconfig (attached as .config)
> > > compiler: mips-linux-gcc (GCC) 8.1.0
> > > reproduce:
> > >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> > >         chmod +x ~/bin/make.cross
> > >         git checkout 31e0456de5be379b10fea0fa94a681057114a96e
> > >         # save the attached .config to linux build tree
> > >         GCC_VERSION=8.1.0 make.cross ARCH=mips 
> > > 
> > > If you fix the issue, kindly add following tag
> > > Reported-by: kbuild test robot <lkp@intel.com>
> > > 
> > > Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
> > > http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings
> > 
> > False positive, gcc isn't smart enough here.
> 
> Should I send a patch initializing the value to 0 anyway?

Probably :(

