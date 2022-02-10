Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E46FE4B107F
	for <lists+linux-usb@lfdr.de>; Thu, 10 Feb 2022 15:34:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242983AbiBJOeL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Feb 2022 09:34:11 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:46874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242968AbiBJOeK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Feb 2022 09:34:10 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A568A233
        for <linux-usb@vger.kernel.org>; Thu, 10 Feb 2022 06:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644503651; x=1676039651;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Vn3zYALB+FVwUszhnepeZ8GdrxabEg7CU6TlPqQD4eo=;
  b=leIk943g4oFgMLddBo0+D8Ilxn9YPvkvTiiNEx8C2f2qT+/81gKs64Ak
   uXI42A5TGYJFHFdeSCZPVGn4Uoo9dyvtNdv5jg1ScQSwDp/QGIBdnp8vX
   HhTsda6fajBWl6puDpFxplDFAJmqjuGBPRxC3HMa6LStpgovP/0aIO28k
   tgOcjoXM2M5hqEuEY/BO7LYlV/kV3LpJ70ZlJfHjK/nG8ihwbIjA/eI28
   LHFI52wTffHF6wb4dYY1mXJOS0cWT+czynNOHL+iM/sLbXA7rG88GAbT6
   KXOThgx9GdN/7gaKnz7khH9PGY53AuMzLhT0Gd4qKXPWlYhshGL/oe0HA
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10253"; a="233061616"
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; 
   d="scan'208";a="233061616"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2022 06:34:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; 
   d="scan'208";a="679164218"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 10 Feb 2022 06:34:08 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 10 Feb 2022 16:34:08 +0200
Date:   Thu, 10 Feb 2022 16:34:08 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-usb <linux-usb@vger.kernel.org>
Subject: Re: long ucsi_acpi_platform_driver_init
Message-ID: <YgUiYGzxefv2tp9S@kuha.fi.intel.com>
References: <b9993432-0192-f546-bf67-bb462f51e209@infradead.org>
 <YgED7x4tylyFzvsR@kuha.fi.intel.com>
 <7702d384-a0ce-51a5-221d-9241a9453d5e@infradead.org>
 <YgPROWZkZlIo0ZnU@kuha.fi.intel.com>
 <4c7bb41f-2639-2acc-1b35-e16c0fb9dad2@infradead.org>
 <6256a6e5-cb82-48d9-3012-76750bedab3f@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6256a6e5-cb82-48d9-3012-76750bedab3f@infradead.org>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Feb 09, 2022 at 10:11:30PM -0800, Randy Dunlap wrote:
> Hi again,
> 
> On 2/9/22 09:14, Randy Dunlap wrote:
> > Hi,
> > 
> > On 2/9/22 06:35, Heikki Krogerus wrote:
> >> On Mon, Feb 07, 2022 at 09:01:50AM -0800, Randy Dunlap wrote:
> >>>
> >>>
> >>> On 2/7/22 03:35, Heikki Krogerus wrote:
> >>>> On Sun, Feb 06, 2022 at 05:28:48PM -0800, Randy Dunlap wrote:
> >>>>> Hi,
> >>>>>
> >>>>> On my custom 5.16, 5.17-rc1, and 5.17-rc2 kernels I am seeing
> >>>>> ucsi_acpi_platform_driver_init() take around 60 seconds.
> >>>>>
> >>>>> [    2.733138] calling  ucsi_acpi_platform_driver_init+0x0/0x1000 [ucsi_acpi] @ 470
> >>>>> [   64.603126] initcall ucsi_acpi_platform_driver_init+0x0/0x1000 [ucsi_acpi] returned 0 after 58690601 usecs
> >>>>
> >>>> I don't have any ideas what could be causing it to take that long?
> >>>> That driver does not really do anything else except it queues a work
> >>>> that then actually initialises the UCSI interface. The probe() in that
> >>>> driver (ucsi_acpi) does not stay and wait for the initialisation to
> >>>> finish.
> >>>>
> >>>> Can you check are the USB Type-C devices appearing under
> >>>> /sys/class/typec faster then that?
> >>>
> >>> One entry there:
> >>>
> >>> lrwxrwxrwx 1 root root 0 Feb  7 08:57 port0 -> ../../devices/platform/USBC000:00/typec/port0/
> >>>
> >>> Do you want more than that?
> >>
> >> You should have a port there for every physical USB Type-C
> >> port on you system.
> > 
> > Yes, I have only one Type-C port.
> > 
> >> I can't really tell from that was the port registered before
> >> ucsi_acpi_platform_driver_init() finished or not.
> > 
> > Sorry, I didn't understand the first time...
> > 
> > I rebooted and checked /sys/class/typec multiple times. It was empty until
> > the end of ucsi_acpi_platform_driver_init() roughly 55 seconds later.
> > 
> 
> Good news. Pretty sure that it's not a problem with ucsi_acpi code.
> 
> I noticed that there were a few kernel log messages about firmware loading
> near the ucsi_acpi init messages so I looked at my kernel's config options.
> 
> I had this one set/enabled:
> 
> config FW_LOADER_USER_HELPER_FALLBACK
> 	bool "Force the firmware sysfs fallback mechanism when possible"
> 	depends on FW_LOADER_USER_HELPER
> 	help
> ...
> 	  If you are unsure about this, say N here.
> 
> After disabling it, there is no significant delay in ucsi_acpi_platform_driver_init.
> 
> I'm happy to blame it on this kernel config option.

OK, that works for me, at least for now.

thanks,

-- 
heikki
