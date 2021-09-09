Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A82934050B8
	for <lists+linux-usb@lfdr.de>; Thu,  9 Sep 2021 14:42:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346551AbhIIMbm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Sep 2021 08:31:42 -0400
Received: from mga17.intel.com ([192.55.52.151]:12573 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1353464AbhIIM2u (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 9 Sep 2021 08:28:50 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10101"; a="200971333"
X-IronPort-AV: E=Sophos;i="5.85,280,1624345200"; 
   d="scan'208";a="200971333"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2021 05:19:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,280,1624345200"; 
   d="scan'208";a="606806900"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 09 Sep 2021 05:19:50 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 09 Sep 2021 15:19:50 +0300
Date:   Thu, 9 Sep 2021 15:19:50 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Ulrich Huber <ulrich@huberulrich.de>
Cc:     linux-usb@vger.kernel.org
Subject: Re: ucsi_acpi GET_CONNECTOR_STATUS failed (-5)
Message-ID: <YTn75r/QUSjjQ0BV@kuha.fi.intel.com>
References: <b36249c5-776a-9338-bb9f-ae6a5c446860@huberulrich.de>
 <YSX7hZnCoFSXTFJe@kuha.fi.intel.com>
 <0e77017d-9358-a691-6293-234fcbab6a31@huberulrich.de>
 <a7f971ef-c3aa-aadc-e453-4c667a414131@huberulrich.de>
 <YSekP0+tq6ISq6my@kuha.fi.intel.com>
 <3fe6d701-bc14-9b26-a5af-aa38fe7c585e@huberulrich.de>
 <YSoGcC4Z1EP0S3KQ@kuha.fi.intel.com>
 <7e06ae23-1cdd-7fe5-8b56-d4a2f80809f2@huberulrich.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e06ae23-1cdd-7fe5-8b56-d4a2f80809f2@huberulrich.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Ulrich,

On Sun, Aug 29, 2021 at 01:02:54PM +0200, Ulrich Huber wrote:
> 
> On 28.08.21 11:48, Heikki Krogerus wrote:
> > On Thu, Aug 26, 2021 at 09:50:58PM +0200, Ulrich Huber wrote:
> > > I just got around to test your patches. They seem to solve the issue
> > > completely! Whatever I tried, the behavior of the port stayed consistent and
> > > no error messages appeared in the log.
> > > 
> > > I'll continue using the patch for now and will notify you, should any issue
> > > appear.
> > Great! If there are no problems, I'll send them to Greg after the next
> > -rc1.
> 
> It seems I just found one such problem. After waking from hibernation I get
> the following entries in the kernel log:
> 
> Aug 29 11:55:31 lenovo-ulrich kernel: ucsi_acpi USBC000:00:
> GET_CONNECTOR_STATUS failed (-5)
> Aug 29 11:55:31 lenovo-ulrich kernel: ucsi_acpi USBC000:00:
> GET_CONNECTOR_STATUS failed (-5)
> Aug 29 11:55:31 lenovo-ulrich kernel: usb 3-6: reset high-speed USB device
> number 3 using xhci_hcd
> Aug 29 11:55:31 lenovo-ulrich kernel: ish-hid
> {33AECD58-B679-4E54-9BD9-A04D34F0C226}: [hid-ish]: enum_devices_do>
> Aug 29 11:55:31 lenovo-ulrich kernel: usb 3-10: reset full-speed USB device
> number 4 using xhci_hcd
> Aug 29 11:55:31 lenovo-ulrich kernel: usb 3-5: reset full-speed USB device
> number 2 using xhci_hcd
> 
> It is obviously related with the system resetting the hardware after waking
> up. Most likely the driver tries to communicate with the device while it is
> in a state where it is not able to respond. I do not get this after each
> hibernation, so far it is the first time I have seen this. I'll try to find
> a way to reproduce this.

Any updates?

Would it make sense to go ahead with my series now anyway at this
point since it seems to fix the other problems?

thanks,

-- 
heikki
