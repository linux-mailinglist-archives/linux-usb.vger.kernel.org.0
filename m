Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84E6E65C387
	for <lists+linux-usb@lfdr.de>; Tue,  3 Jan 2023 17:07:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237815AbjACQHK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Jan 2023 11:07:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238038AbjACQGl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 Jan 2023 11:06:41 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F88FCE5
        for <linux-usb@vger.kernel.org>; Tue,  3 Jan 2023 08:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672762000; x=1704298000;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=x62o2ewofM0lBIzqM3l/3Rpf/5QtfI/0XLlh5FYkukA=;
  b=bS9KOZez/1+4dlbahfZ7xm8i+hDcrQ9ZD2JZjC4JkTqZJvFoEzShKwb0
   B13vNVCUQoYklTNum9J2jJwewp66k49VpUOZ5eznVD4pJeHijBiYlQr24
   O+niWYyB6FyK9NZd1SunGYUyTeIJplIbHt3YGFnedkELPTAirPHLo+jeF
   vV/3iFwrT8MkRO6WgmnG5aPibDPXX3e6jWuqlSjfwI9xvqf2H/b483n3B
   yB0sxNVO/jaVZVnsTOFHlXb01rqtjwGIVP2MbW4ac3cq5I7DvbmrJqXFp
   XzxWHzIJIp092oC7ACqR9NGJv4Li0nY5DB7UlWRerL5RmSZ9CvdR9R+yY
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="321759198"
X-IronPort-AV: E=Sophos;i="5.96,297,1665471600"; 
   d="scan'208";a="321759198"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2023 08:06:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="648260216"
X-IronPort-AV: E=Sophos;i="5.96,297,1665471600"; 
   d="scan'208";a="648260216"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 03 Jan 2023 08:06:37 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 3B349F4; Tue,  3 Jan 2023 18:07:08 +0200 (EET)
Date:   Tue, 3 Jan 2023 18:07:08 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Christian =?utf-8?Q?Schaubschl=C3=A4ger?= 
        <christian.schaubschlaeger@gmx.at>
Cc:     linux-usb@vger.kernel.org,
        "michael.simon@cpsd.at" <michael.simon@cpsd.at>
Subject: Re: Possible problem with thunderbolt 4
Message-ID: <Y7RSrLYfG1r8b+Zj@black.fi.intel.com>
References: <Y67RoYvbRC6OgfOq@black.fi.intel.com>
 <272a5f28-5733-3aa1-ff3e-57febd3b217f@gmx.at>
 <Y67X5JrnRxYN/pns@black.fi.intel.com>
 <00dbeaf9-4d2c-3e3a-fa39-4c232b3a68e6@gmx.at>
 <Y7K7zLoAQVyv0zD5@black.fi.intel.com>
 <011df027-5381-1e10-9c54-e0935ae549f9@gmx.at>
 <Y7ME7EwduIQE38+2@black.fi.intel.com>
 <a324ff2a-d014-83d2-4f30-b865db7c352b@gmx.at>
 <Y7QMlV82mtaApJwJ@black.fi.intel.com>
 <a8c1dd4b-7227-5ba2-97a4-a2dc3d561ea3@gmx.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a8c1dd4b-7227-5ba2-97a4-a2dc3d561ea3@gmx.at>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Tue, Jan 03, 2023 at 01:14:09PM +0100, Christian Schaubschläger wrote:
> >
> > 0. Remove the hack patch if not already.
> >
> > Steps 1-3 same as before.
> >
> > 4. Disable runtime PM from the PCIe root ports:
> >
> >   # echo on > /sys/bus/pci/devices/0000:00:07.0/power/control
> >   # echo on > /sys/bus/pci/devices/0000:00:07.1/power/control
> >   # echo on > /sys/bus/pci/devices/0000:00:07.2/power/control
> >   # echo on > /sys/bus/pci/devices/0000:00:07.3/power/control
> >
> > (or how many Thunderbolt PCIE root ports you have, disable it from all of them).
> >
> > 5. De-authorize the PCIe tunnel
> >
> >   # echo 0 > /sys/bus/thunderbolt/devices/.../authorized
> >
> > 6. Soft reboot
> >
> > Does this change anything or the behavior is the same?
> No, that doesn't change anything; though I'm not sure how many
> Thunderbolt PCIe root ports I have; I guess only one: 0000:00:07.0 -
> please have a look into the attached lspci output.
> 
> dmesg after the above two steps:
> 
> [   91.655320] pcieport 0000:00:07.0: pciehp: Slot(3): Link Down
> [   91.657353] pcieport 0000:00:07.0: pciehp: Slot(3): Card not present
> [   91.659525] igc 0000:2c:00.0 eth1: PHC removed
> [   91.786204] pcieport 0000:04:03.0: Unable to change power state from D3hot to D0, device inaccessible
> [   91.788645] pcieport 0000:04:03.0: Runtime PM usage count underflow!
> [   91.790766] pcieport 0000:04:02.0: Unable to change power state from D3hot to D0, device inaccessible
> [   91.793156] pcieport 0000:04:02.0: Runtime PM usage count underflow!
> [   91.795341] pcieport 0000:04:01.0: Unable to change power state from D3hot to D0, device inaccessible
> [   91.797797] pcieport 0000:04:01.0: Runtime PM usage count underflow!
> [   91.800031] pcieport 0000:04:00.0: Unable to change power state from D3hot to D0, device inaccessible
> [   91.802671] pci_bus 0000:05: busn_res: [bus 05] is released
> [   91.805004] pci 0000:04:00.0: Removing from iommu group 16
> [   91.807261] pci_bus 0000:06: busn_res: [bus 06-12] is released
> [   91.809582] pci 0000:04:01.0: Removing from iommu group 17
> [   91.811925] pci_bus 0000:13: busn_res: [bus 13-1f] is released
> [   91.814303] pci 0000:04:02.0: Removing from iommu group 18
> [   91.816604] pci_bus 0000:20: busn_res: [bus 20-2b] is released
> [   91.818985] pci 0000:04:03.0: Removing from iommu group 19
> [   91.821412] pci 0000:2c:00.0: Removing from iommu group 21
> [   91.823875] pci_bus 0000:2c: busn_res: [bus 2c] is released
> [   91.826241] pci 0000:04:04.0: Removing from iommu group 20
> [   91.828592] pci_bus 0000:04: busn_res: [bus 04-2c] is released
> [   91.831018] pci 0000:03:00.0: Removing from iommu group 15
> 
> Still, no network interface after the reboot in the firmware...

Okay you have only one Thunderbolt PCIe root port just as you correctly
guessed (07.0). At this point I'm running out of ideas what to check or
try. We have seen similar but only when there is no battery on the
device which is not your case, I suppose. In this case the initial USB4
link state is kind of "open" so it may come up or not.
