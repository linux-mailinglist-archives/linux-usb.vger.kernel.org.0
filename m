Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 969B14D7F48
	for <lists+linux-usb@lfdr.de>; Mon, 14 Mar 2022 10:58:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236072AbiCNJ7Z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Mar 2022 05:59:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231392AbiCNJ7Y (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Mar 2022 05:59:24 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72C3413EBB
        for <linux-usb@vger.kernel.org>; Mon, 14 Mar 2022 02:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647251893; x=1678787893;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ewO8ZT0KnYgPFiDA6NjrROPM+pMOJuWqQIubpOvBq5o=;
  b=lbwUM6lObpD45TcO3TV9t7PFbdXbch6nuqXNUiLl4/45K84VWFqJalVU
   pbzg/GX/BmJPfMRGVcqax0XG62DA8CHsSlABXCnUIRLUKKp07moqODvUK
   QY1yskCYbB6Tccw7R6EWlI9gFmE85d/ogtiIYR0dSbHVT1zHxCVSeMV0b
   8pvzyC+52JCjKNvMKKIOXFejytuXQS1NMnCPnGjXg0eImlEvgd0fF+I1Q
   7evxl4Klwk5T1SEiFLz0mY9arW7OhvD1b6cXQ0OkDayYoEzHiDuOccSbX
   Mx/NTWJMhPy7WqfcIKS22eZRQ4WQW++LWkwo/HcXfD37tSJC9VrZRSyZ/
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10285"; a="255711692"
X-IronPort-AV: E=Sophos;i="5.90,180,1643702400"; 
   d="scan'208";a="255711692"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2022 02:58:13 -0700
X-IronPort-AV: E=Sophos;i="5.90,180,1643702400"; 
   d="scan'208";a="539899583"
Received: from smile.fi.intel.com ([10.237.72.59])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2022 02:58:11 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nThSE-00H8np-VY;
        Mon, 14 Mar 2022 11:57:30 +0200
Date:   Mon, 14 Mar 2022 11:57:30 +0200
From:   "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>
To:     micklorain <micklorain@protonmail.com>
Cc:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>
Subject: Re: [PATCH v1] usb: hcd: Try MSI interrupts on PCI devices
Message-ID: <Yi8Rih9KZ7BrtbvP@smile.fi.intel.com>
References: <PxIByDyBRcsbpcmVhGSNDFAoUcMmb78ctXCkw6fbpx25TGlCHvA6SJjjFkNr1FfQZMntYPTNyvEnblxzAZ8a6jP9ddLpKeCN6Chi_2FuexU=@protonmail.com>
 <Yh03mFSESvwT8Wt0@smile.fi.intel.com>
 <GCkSeDmZAyagb-3ogwNAwxsKYpxXSQRM6HeO_O9WxSYO1-8WL8ook5WQ9JchpyBqo4SIJ2XuW2DWFJeJrCzqzcedaBjNvfjNLZo1j3hU5tc=@protonmail.com>
 <YijoMAZJ1elUfZnh@smile.fi.intel.com>
 <pVZSQtquqT8_tNfgSacEQWJO4agPMHUT5gF3FkkWuJ3LERhq0JswT2y22oDz7Jvn_Vz28uA8rS2SAfJbPwq3EEQi2Vb-zySZdBozgVdR308=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pVZSQtquqT8_tNfgSacEQWJO4agPMHUT5gF3FkkWuJ3LERhq0JswT2y22oDz7Jvn_Vz28uA8rS2SAfJbPwq3EEQi2Vb-zySZdBozgVdR308=@protonmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Mar 13, 2022 at 09:44:36PM +0000, micklorain wrote:
> On Wednesday, March 9th, 2022 at 18:47, andriy.shevchenko@linux.intel.com <andriy.shevchenko@linux.intel.com> wrote:
> > On Sun, Mar 06, 2022 at 04:09:49PM +0000, micklorain wrote:
> > > On Monday, February 28th, 2022 at 21:59, andriy.shevchenko@linux.intel.com andriy.shevchenko@linux.intel.com wrote:
> > > > On Mon, Feb 28, 2022 at 08:12:47PM +0000, micklorain wrote:

> > ...
> >
> > > > Last time I have got something similar it becomes that PCI bridge which is used
> > > >
> > > > to connect USB controller to the PCI Root Bridge was not capable of MSI, while
> > > >
> > > > advertising that capability. I.o.w. HW bug.
> > > >
> > > > To understand if it's something similar, please run (under the root) each of
> > > >
> > > > the following commands:
> > > >
> > > > lspci -nk -vvv
> > > >
> > > > cat /proc/interrupts
> > > >
> > > > in both cases, i.e. working and non-working.
> > > >
> > > > And then share the output (all 4 files).
> >
> > > Thanks for your reply.
> > >
> > > This is the results of the commands you requested :
> > >
> > > * When things work (commit dcb85f85fa6f142aae1fe86f399d4503d49f2b60 with commit 306c54d0edb6ba94d39877524dddebaad7770cf2 reverted)
> > >
> > > - lspci -nk -vvv :
> > >
> > > https://paste.debian.net/hidden/77d92dc9/
> > >
> > > - cat /proc/interrupts
> > >
> > > https://paste.debian.net/hidden/67208c8e/
> > >
> > > * When things are broken (commit dcb85f85fa6f142aae1fe86f399d4503d49f2b60)
> > >
> > > - lspci -nk -vvv :
> > >
> > > https://paste.debian.net/hidden/121362b3/
> > >
> > > - cat /proc/interrupts :
> > >
> > > https://paste.debian.net/hidden/dbe8d1bb/
> > >
> > > Hope this can help.
> >
> > Thank you for sharing. Are you able to compile a kernel and boot it? If so,
> >
> > can you try the following patch?
> 
> I tried the patch, but it didn't help...
> 
> >
> > diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> >
> > index 65f7f6b0576c..149742aa5f4d 100644
> >
> > --- a/drivers/pci/quirks.c
> >
> > +++ b/drivers/pci/quirks.c
> >
> > @@ -3041,6 +3041,13 @@ DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_BROADCOM,
> >
> > PCI_DEVICE_ID_TIGON3_5715S,
> >
> > quirk_msi_intx_disable_bug);
> >
> > +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI, 0x4386, quirk_msi_intx_disable_ati_bug);
> >
> > +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI, 0x4387, quirk_msi_intx_disable_ati_bug);
> >
> > +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI, 0x4388, quirk_msi_intx_disable_ati_bug);
> >
> > +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI, 0x4389, quirk_msi_intx_disable_ati_bug);
> >
> > +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI, 0x438a, quirk_msi_intx_disable_ati_bug);
> >
> > +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI, 0x438b, quirk_msi_intx_disable_ati_bug);
> >
> > +
> >
> > DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI, 0x4390,
> >
> > quirk_msi_intx_disable_ati_bug);
> >
> > DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI, 0x4391,
> >
> > In case it doesn't help, remove 'ati_' part from the function name and try again.
> 
> ... but removing 'ati_' from the function name indeed fixed my issue.
> 
> Will this fix be upstreamed now ?

I will do it ASAP. Thanks for report and testing!

-- 
With Best Regards,
Andy Shevchenko


