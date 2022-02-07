Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B5B94ABF28
	for <lists+linux-usb@lfdr.de>; Mon,  7 Feb 2022 14:23:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1385504AbiBGMs6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Feb 2022 07:48:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386658AbiBGLfR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Feb 2022 06:35:17 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AB15C043188
        for <linux-usb@vger.kernel.org>; Mon,  7 Feb 2022 03:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644233716; x=1675769716;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=INFWVmw4ej4Dv6BBxsYk089kJARY4yN7pRH+2wVAQ1I=;
  b=AUiorgFvq5qTxf4zy2zWhjw+tTtoKo5Cmar7Jpw1O8RxRtXAxcfK3SBf
   WY/hw1HbVlP6cYxM19bDqEbhy3OURrFewjuW/yfrtQ6pbB3tK2zLol/nd
   z9NBG/0+Lh+EG4hGZd7kjk1wqAxIr3fin9ysqOw55WBaZL3V2iFuPYm5X
   xVPtq4xPcKzn1AgsDecQn+O4ZnuiJHRLBSoR8rtkIIfQ13CIJ5g2/pq+d
   61P4nN+tRq8gZeCwyFu/mZGgZFZxLqh5L16cXYc51w2jXPsUSEbS76xvt
   NE1UcJIWyL8JCmMTQY9gQRnuUY3aPAaa5ILUmzRkBPp5unWrDggQauxUx
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="273216188"
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; 
   d="scan'208";a="273216188"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2022 03:35:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; 
   d="scan'208";a="677731080"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 07 Feb 2022 03:35:12 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 07 Feb 2022 13:35:11 +0200
Date:   Mon, 7 Feb 2022 13:35:11 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-usb <linux-usb@vger.kernel.org>
Subject: Re: long ucsi_acpi_platform_driver_init
Message-ID: <YgED7x4tylyFzvsR@kuha.fi.intel.com>
References: <b9993432-0192-f546-bf67-bb462f51e209@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9993432-0192-f546-bf67-bb462f51e209@infradead.org>
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Feb 06, 2022 at 05:28:48PM -0800, Randy Dunlap wrote:
> Hi,
> 
> On my custom 5.16, 5.17-rc1, and 5.17-rc2 kernels I am seeing
> ucsi_acpi_platform_driver_init() take around 60 seconds.
> 
> [    2.733138] calling  ucsi_acpi_platform_driver_init+0x0/0x1000 [ucsi_acpi] @ 470
> [   64.603126] initcall ucsi_acpi_platform_driver_init+0x0/0x1000 [ucsi_acpi] returned 0 after 58690601 usecs

I don't have any ideas what could be causing it to take that long?
That driver does not really do anything else except it queues a work
that then actually initialises the UCSI interface. The probe() in that
driver (ucsi_acpi) does not stay and wait for the initialisation to
finish.

Can you check are the USB Type-C devices appearing under
/sys/class/typec faster then that?

Also, if the driver is a module, can you check does it always take
that long if you unload and the reload the module (ucsi_acpi.ko)?

> Did I miss some other (needed) Kconfig option or is something missing in
> my system's ACPI tables e.g.?

There shouldn't be any dependencies that are missing, but it would not
hurt to take a look at your acpi tables. Can you send acpidump?

Though, I doubt there is anything missing from there either.

> DMI: Dell Inc. Inspiron 15 5510/076F7Y, BIOS 2.4.1 11/05/2021

thanks,

-- 
heikki
