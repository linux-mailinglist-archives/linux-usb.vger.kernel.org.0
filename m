Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 870B33F1C30
	for <lists+linux-usb@lfdr.de>; Thu, 19 Aug 2021 17:06:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239300AbhHSPHJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Aug 2021 11:07:09 -0400
Received: from netrider.rowland.org ([192.131.102.5]:48383 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S238292AbhHSPHI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Aug 2021 11:07:08 -0400
Received: (qmail 229339 invoked by uid 1000); 19 Aug 2021 11:06:30 -0400
Date:   Thu, 19 Aug 2021 11:06:30 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Rui Miguel Silva <rui.silva@linaro.org>,
        kernel test robot <lkp@intel.com>,
        clang-built-linux@googlegroups.com, kbuild-all@lists.01.org,
        linux-usb@vger.kernel.org
Subject: Re: [usb:usb-testing 54/97] drivers/usb/isp1760/isp1760-hcd.c:735:2:
 warning: Value stored to 'scratch' is never read
 [clang-analyzer-deadcode.DeadStores]
Message-ID: <20210819150630.GB228422@rowland.harvard.edu>
References: <202108190619.wLK5u4fO-lkp@intel.com>
 <CDNBNHH65Z6Z.3P3H9W04XAHDB@arch-thunder>
 <YR5xuManlukIAf3L@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YR5xuManlukIAf3L@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 19, 2021 at 04:59:04PM +0200, Greg Kroah-Hartman wrote:
> On Thu, Aug 19, 2021 at 08:47:37AM +0100, Rui Miguel Silva wrote:
> > Hi,
> > On Wed Aug 18, 2021 at 11:09 PM WEST, kernel test robot wrote:

> > >    drivers/usb/isp1760/isp1760-core.c:490:2: warning: Value stored to 'udc_enabled' is never read [clang-analyzer-deadcode.DeadStores]
> > >            udc_enabled = ((devflags & ISP1760_FLAG_ISP1763) ||
> > >            ^             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >    drivers/usb/isp1760/isp1760-core.c:490:2: note: Value stored to 'udc_enabled' is never read
> > >            udc_enabled = ((devflags & ISP1760_FLAG_ISP1763) ||
> > >            ^             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >    Suppressed 4 warnings (4 in non-user code).
> > >    Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
> > >    4 warnings generated.
> > >    Suppressed 4 warnings (4 in non-user code).
> > >    Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
> > >    9 warnings generated.
> > > >> drivers/usb/isp1760/isp1760-hcd.c:735:2: warning: Value stored to 'scratch' is never read [clang-analyzer-deadcode.DeadStores]
> > >            scratch = isp1760_hcd_read(hcd, HC_CHIP_ID_HIGH);
> > >            ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > 
> > yeah, this is desired behaviour, this read is only to make sure  that
> > we make something different than the pattern to test go over the bus.
> > However I will take a look to this warning and other clang warnings
> > that I am seeing in this report.
> 
> This is why I hate this type of warning, doing a read like this is
> totally normal for drivers.  Compilers that think this is something they
> can ignore or warn about are just wrong.

No, no.  The compiler isn't complaining about the call to 
isp1760_hcd_read(); it's complaining about the fact that scratch 
stores the return value.  Since the value isn't used anywhere, there's 
no point in storing it.

You can get rid of the warning by changing the line to:

		(void) isp1760_hcd_read(hcd, HC_CHIP_ID_HIGH);

(The (void) cast isn't really necessary; it's just there to point out 
that the return value is being thrown away.  You can omit it if you 
prefer.)

Likewise for the store to udc_enabled.

Alan Stern
