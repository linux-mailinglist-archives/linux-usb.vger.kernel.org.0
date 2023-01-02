Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A025F65B04A
	for <lists+linux-usb@lfdr.de>; Mon,  2 Jan 2023 12:10:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231653AbjABLKk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 Jan 2023 06:10:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229997AbjABLKi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 Jan 2023 06:10:38 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3519662D5
        for <linux-usb@vger.kernel.org>; Mon,  2 Jan 2023 03:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672657838; x=1704193838;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=3A3qJeBNHPl2rkGmxmLtX5n5bWyGB9rf0S2oRPpe5HI=;
  b=JSl0kD1FzupPx3lAWK25lAWEyVNb7eYQAv6vLk+x57aluwABAGdpzVs9
   i/y8KM06kftDmw8JYrbr58FZDrso78vWxHNHVJXww4FN6CVIo66XVakaT
   BYq6sxuNxGP2CHM9vetq0urIB725YMO0QeHxjHf/sUOJHGLsY5jDEOQQF
   Tdt678T+yy+1HKpPa28nsa1In5QrLUjASERUBswzqdD7w3PHtQeUoUd6g
   nEphhYR4q0fkYGfCJ21YXNa2jkpgbrauiriVxflldEf+jd1RzpI/2SwKw
   yoGJK/u+6ZonVZhlwMuDdu4GEuCVolN297jA7B8e5lOTbbEO+zVpwrwlv
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10577"; a="348684974"
X-IronPort-AV: E=Sophos;i="5.96,293,1665471600"; 
   d="scan'208";a="348684974"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2023 03:10:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10577"; a="743167572"
X-IronPort-AV: E=Sophos;i="5.96,293,1665471600"; 
   d="scan'208";a="743167572"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 02 Jan 2023 03:10:36 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 2DB00F4; Mon,  2 Jan 2023 13:11:08 +0200 (EET)
Date:   Mon, 2 Jan 2023 13:11:08 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Christian =?utf-8?Q?Schaubschl=C3=A4ger?= 
        <christian.schaubschlaeger@gmx.at>
Cc:     linux-usb@vger.kernel.org,
        "michael.simon@cpsd.at" <michael.simon@cpsd.at>
Subject: Re: Possible problem with thunderbolt 4
Message-ID: <Y7K7zLoAQVyv0zD5@black.fi.intel.com>
References: <b556f5ed-5ee8-9990-9910-afd60db93310@gmx.at>
 <Y6sBI+xrkQaWtQxo@black.fi.intel.com>
 <588ed5c7-864f-46b5-d7d7-af6c32ca2c52@gmx.at>
 <Y66vWYdLLAOG81+f@black.fi.intel.com>
 <c334eb1f-1130-04d7-e7a6-cce9a90fd2e8@gmx.at>
 <Y67RoYvbRC6OgfOq@black.fi.intel.com>
 <272a5f28-5733-3aa1-ff3e-57febd3b217f@gmx.at>
 <Y67X5JrnRxYN/pns@black.fi.intel.com>
 <00dbeaf9-4d2c-3e3a-fa39-4c232b3a68e6@gmx.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <00dbeaf9-4d2c-3e3a-fa39-4c232b3a68e6@gmx.at>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jan 02, 2023 at 09:56:18AM +0100, Christian Schaubschläger wrote:
> Hi, (and happy new year!)
> 
> >> If I just remove the module without un- and re-plugging the cable, the
> >> connection is not there in the firmware after the reboot.
> > Right because the driver leaves all the tunnels up so the boot firmware
> > then finds the PCIe tunnels established.
> 
> So maybe it's a firmware issue? If the kernel leaves the tunnels in
> place, but the firmware doesn't see them?

It probably sees them and that's the issue.

> > One more experiment if you will.
> >
> > Same steps 1-3 as above but then do this:
> >
> > 4. Disconnect the PCIe tunnel directly:
> >
> >   # echo 0 > /sys/bus/thunderbolt/devices/DEVICE/authorized
> >
> > (where DEVICE is typically 0-1 or 0-3 in Intel platforms)
> >
> > 5. Check in lspci that it is not visible anymore
> > 6. Soft boot the system.
> >
> > In other words this leaves the USB4 link and other tunnels up but not
> > PCIe.
> After echoing 0 to the 'authorized' file, the devices disappear in
> linux from the PCI bus, but unfortunately don't show up in the
> firmware after the reboot...

Okay it may be that the USB 3 tunnel that is still up makes the CM in
BIOS to think the hardware is in unexected state or so.

This was Thunderbolt 4 dock, right? Do you happen to have Thunderbolt 3
device or Thunderbolt 3 active cable around? If yes then there is only
the PCIe tunnel so doing the above de-authorization should in theory
work. If no then one option is to add the ->shutdown() hook to tear down
the tunnels.
