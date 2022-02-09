Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0736F4AF42D
	for <lists+linux-usb@lfdr.de>; Wed,  9 Feb 2022 15:35:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233202AbiBIOfh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Feb 2022 09:35:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231747AbiBIOfg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Feb 2022 09:35:36 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3ACAC06157B
        for <linux-usb@vger.kernel.org>; Wed,  9 Feb 2022 06:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644417339; x=1675953339;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=R5Dd+VLpDPxT6H4D3AQzioCVCsJZ0lg4if0+PTOUxvA=;
  b=am6MNoXykhXTbP5ugyhK8C6X6wVbl0gjz1sIpNF/F4Nhedjf240DQqSZ
   +54Mbb9kD8yEV7ENxKnTztkKqkRx132k1wf9aCv6aGVPd0V2qVhE02uC9
   RslEacM8KPqTWijnjVs9WEFxUDyd6zItcpJ045914tj669eLZL3buuRsp
   BBos7oDZ8Cm/fE10tqpOTTZlaxn/PYNIOol1ZcHMe27sPjgIB+8XtKz5W
   R0xMztbW+Nvb4U4HDSgchLXDOVtOtnekFLYL9MtjTL4RHmpMDBcRvAhus
   tun+a4cW13/n+Rcg4YMHkViO80VSnRZ9JOjhJnezK/pLU1Blp3lmyDH7F
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="246799218"
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600"; 
   d="scan'208";a="246799218"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2022 06:35:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600"; 
   d="scan'208";a="678610809"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 09 Feb 2022 06:35:37 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 09 Feb 2022 16:35:37 +0200
Date:   Wed, 9 Feb 2022 16:35:37 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-usb <linux-usb@vger.kernel.org>
Subject: Re: long ucsi_acpi_platform_driver_init
Message-ID: <YgPROWZkZlIo0ZnU@kuha.fi.intel.com>
References: <b9993432-0192-f546-bf67-bb462f51e209@infradead.org>
 <YgED7x4tylyFzvsR@kuha.fi.intel.com>
 <7702d384-a0ce-51a5-221d-9241a9453d5e@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7702d384-a0ce-51a5-221d-9241a9453d5e@infradead.org>
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Feb 07, 2022 at 09:01:50AM -0800, Randy Dunlap wrote:
> 
> 
> On 2/7/22 03:35, Heikki Krogerus wrote:
> > On Sun, Feb 06, 2022 at 05:28:48PM -0800, Randy Dunlap wrote:
> >> Hi,
> >>
> >> On my custom 5.16, 5.17-rc1, and 5.17-rc2 kernels I am seeing
> >> ucsi_acpi_platform_driver_init() take around 60 seconds.
> >>
> >> [    2.733138] calling  ucsi_acpi_platform_driver_init+0x0/0x1000 [ucsi_acpi] @ 470
> >> [   64.603126] initcall ucsi_acpi_platform_driver_init+0x0/0x1000 [ucsi_acpi] returned 0 after 58690601 usecs
> > 
> > I don't have any ideas what could be causing it to take that long?
> > That driver does not really do anything else except it queues a work
> > that then actually initialises the UCSI interface. The probe() in that
> > driver (ucsi_acpi) does not stay and wait for the initialisation to
> > finish.
> > 
> > Can you check are the USB Type-C devices appearing under
> > /sys/class/typec faster then that?
> 
> One entry there:
> 
> lrwxrwxrwx 1 root root 0 Feb  7 08:57 port0 -> ../../devices/platform/USBC000:00/typec/port0/
> 
> Do you want more than that?

You should have a port there for every physical USB Type-C
port on you system.

I can't really tell from that was the port registered before
ucsi_acpi_platform_driver_init() finished or not.

> > Also, if the driver is a module, can you check does it always take
> > that long if you unload and the reload the module (ucsi_acpi.ko)?
> > 
> >> Did I miss some other (needed) Kconfig option or is something missing in
> >> my system's ACPI tables e.g.?
> > 
> > There shouldn't be any dependencies that are missing, but it would not
> > hurt to take a look at your acpi tables. Can you send acpidump?
> > 
> > Though, I doubt there is anything missing from there either.
> > 
> >> DMI: Dell Inc. Inspiron 15 5510/076F7Y, BIOS 2.4.1 11/05/2021
> 
> The (large) acpidump output is here:
>   http://www.infradead.org/~rdunlap/doc/dell15-acpidump.out.gz

Thanks!

Br,

-- 
heikki
