Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2153965981B
	for <lists+linux-usb@lfdr.de>; Fri, 30 Dec 2022 13:21:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231197AbiL3MV2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Dec 2022 07:21:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbiL3MV1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Dec 2022 07:21:27 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 434CBDE1
        for <linux-usb@vger.kernel.org>; Fri, 30 Dec 2022 04:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672402884; x=1703938884;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=tSSk6VgtsN9bQ51nJXbPYdbqIBrPmXntG4GU/PPUxhs=;
  b=FwGQazpBekmeDkKUZA9m/wxW7MVEXSj/FMauOO1W1AtXhO2p8PFDNN40
   UyrHpbNC1IMrNqKnwQwct4zIMywbusdAqZbiNU6aPCW+5hzLmZnCRJ/od
   dGc6xkZ/wo/2l1ACysFj/Cocc7IFAOcLrdBkR98eyYS3WWR0nFJW4YRQs
   NbUvqSaQTxsASFoko2JWMTOv61BbuPf4+d2ijt8p6PK3yE8APuWLDod8+
   Z241M/EkhxgJfoC9vcVJM6hpgpFH07DAxijBDfMyyRts6/9HIRWoQhgI1
   sglt5D9fqTJDv+npFSrgXO9dLtTtQO4002BG43MY90RyNwSiHH87zTMuM
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10575"; a="383498674"
X-IronPort-AV: E=Sophos;i="5.96,287,1665471600"; 
   d="scan'208";a="383498674"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2022 04:21:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10575"; a="655851575"
X-IronPort-AV: E=Sophos;i="5.96,287,1665471600"; 
   d="scan'208";a="655851575"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 30 Dec 2022 04:21:24 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 6A7A3F8; Fri, 30 Dec 2022 14:21:56 +0200 (EET)
Date:   Fri, 30 Dec 2022 14:21:56 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Christian =?utf-8?Q?Schaubschl=C3=A4ger?= 
        <christian.schaubschlaeger@gmx.at>
Cc:     linux-usb@vger.kernel.org,
        "michael.simon@cpsd.at" <michael.simon@cpsd.at>
Subject: Re: Possible problem with thunderbolt 4
Message-ID: <Y67X5JrnRxYN/pns@black.fi.intel.com>
References: <b556f5ed-5ee8-9990-9910-afd60db93310@gmx.at>
 <Y6sBI+xrkQaWtQxo@black.fi.intel.com>
 <588ed5c7-864f-46b5-d7d7-af6c32ca2c52@gmx.at>
 <Y66vWYdLLAOG81+f@black.fi.intel.com>
 <c334eb1f-1130-04d7-e7a6-cce9a90fd2e8@gmx.at>
 <Y67RoYvbRC6OgfOq@black.fi.intel.com>
 <272a5f28-5733-3aa1-ff3e-57febd3b217f@gmx.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <272a5f28-5733-3aa1-ff3e-57febd3b217f@gmx.at>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Dec 30, 2022 at 01:08:36PM +0100, Christian Schaubschläger wrote:
> 
> > No but this is not the "final" solution - just an experiment.
> >
> > Okay so we have this:
> >
> > - When both Linux and Windows uses the same firmware connection manager
> >   all work.
> >
> > - If you install Windows 11 (or whatever the fresh one is that actually
> >   supports USB4 and software connection manager) you end up in the
> >   exact same situation.
> I'm running Win10 22H2 on this machine... I could upgrade to Win11 if this helps.

Most likely it will just make the Windows work like Linux (so PXE does
not work) therere I don't suggest doing that.

> > Can you try following:
> >
> > 1. Go back to CONFIG_USB4=m
> > 2. Boot the system up
> > 3. Check that the PCIe tunneling is up and things work as expected
> > 4. Unplug the dock
> > 5. Unload the Thunderbolt driver
> >
> >   # rmmod thunderbolt
> >
> > 6. Plug the dock back
> > 7. Soft reboot the system
> >
> > Does this make the PXE boot see the connected device?
> After these steps the firmware sees the connected device!

OK.

> If I just remove the module without un- and re-plugging the cable, the
> connection is not there in the firmware after the reboot.

Right because the driver leaves all the tunnels up so the boot firmware
then finds the PCIe tunnels established.

One more experiment if you will.

Same steps 1-3 as above but then do this:

4. Disconnect the PCIe tunnel directly:

  # echo 0 > /sys/bus/thunderbolt/devices/DEVICE/authorized

(where DEVICE is typically 0-1 or 0-3 in Intel platforms)

5. Check in lspci that it is not visible anymore
6. Soft boot the system.

In other words this leaves the USB4 link and other tunnels up but not
PCIe.
