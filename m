Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23A8E25110
	for <lists+linux-usb@lfdr.de>; Tue, 21 May 2019 15:49:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728175AbfEUNti (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 May 2019 09:49:38 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:32968 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727262AbfEUNth (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 May 2019 09:49:37 -0400
Received: (qmail 1836 invoked by uid 2102); 21 May 2019 09:49:36 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 21 May 2019 09:49:36 -0400
Date:   Tue, 21 May 2019 09:49:36 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
cc:     kbuild test robot <lkp@intel.com>, <kbuild-all@01.org>,
        <linux-usb@vger.kernel.org>, Johan Hovold <johan@kernel.org>
Subject: Re: [usb:usb-linus 3/10] drivers/media//usb/siano/smsusb.c:447:37:
 warning: 'in_maxp' may be used uninitialized in this function
In-Reply-To: <20190521130913.GA7273@kroah.com>
Message-ID: <Pine.LNX.4.44L0.1905210948590.1634-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 21 May 2019, Greg Kroah-Hartman wrote:

> On Tue, May 21, 2019 at 04:48:47PM +0800, kbuild test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
> > head:   53c7b63f797c96a30c21dd3b781fafaae096a12b
> > commit: 31e0456de5be379b10fea0fa94a681057114a96e [3/10] media: usb: siano: Fix general protection fault in smsusb
> > config: mips-allmodconfig (attached as .config)
> > compiler: mips-linux-gcc (GCC) 8.1.0
> > reproduce:
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         git checkout 31e0456de5be379b10fea0fa94a681057114a96e
> >         # save the attached .config to linux build tree
> >         GCC_VERSION=8.1.0 make.cross ARCH=mips 
> > 
> > If you fix the issue, kindly add following tag
> > Reported-by: kbuild test robot <lkp@intel.com>
> > 
> > Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
> > http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings
> 
> False positive, gcc isn't smart enough here.

Should I send a patch initializing the value to 0 anyway?

Alan Stern

