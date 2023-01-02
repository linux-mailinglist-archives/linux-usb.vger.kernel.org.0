Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02D9D65B506
	for <lists+linux-usb@lfdr.de>; Mon,  2 Jan 2023 17:22:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234525AbjABQWl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 Jan 2023 11:22:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229691AbjABQWj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 Jan 2023 11:22:39 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 305E2BFA
        for <linux-usb@vger.kernel.org>; Mon,  2 Jan 2023 08:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672676559; x=1704212559;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=MIDUQx0ATZNLSZPZvn+dD2ZbqAe4bcCkOUCiC6n410A=;
  b=a0yYYn7gM0U6m/uaAs+ros7YUwNZKqPM6cxJWfAKVxutBI+VwW0HKoLP
   p5kvCj4ZKfPSmzm9IIRyMy6EUZfl2uRC85zE1A/IDLcQHquibX/z8Y4eh
   iVH620jH/ogYoZgZa3kv6StuYkDbGquS+EkoVbzanPuY6h1uiXtbwjlJS
   w4b8IVCZgQkuTJjIxKHZccpmMUrZQsa9XsJjvDyHO4Ewe8jEwnyfNFi9t
   w1nNLMvf6srGxfaDwxxPr6zQB5rPXbDtH6rhe0t3fCiFDA2AfLuYlwOLr
   HbzeJE1r+FhkrUeyL4wtEiSc+SXQfWXi8Wr/djiCrGnrAcnzBDEFoBhqn
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10578"; a="348727894"
X-IronPort-AV: E=Sophos;i="5.96,294,1665471600"; 
   d="scan'208";a="348727894"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2023 08:22:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10578"; a="778603429"
X-IronPort-AV: E=Sophos;i="5.96,294,1665471600"; 
   d="scan'208";a="778603429"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 02 Jan 2023 08:22:37 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id E326CF4; Mon,  2 Jan 2023 18:23:08 +0200 (EET)
Date:   Mon, 2 Jan 2023 18:23:08 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Christian =?utf-8?Q?Schaubschl=C3=A4ger?= 
        <christian.schaubschlaeger@gmx.at>
Cc:     linux-usb@vger.kernel.org,
        "michael.simon@cpsd.at" <michael.simon@cpsd.at>
Subject: Re: Possible problem with thunderbolt 4
Message-ID: <Y7ME7EwduIQE38+2@black.fi.intel.com>
References: <Y6sBI+xrkQaWtQxo@black.fi.intel.com>
 <588ed5c7-864f-46b5-d7d7-af6c32ca2c52@gmx.at>
 <Y66vWYdLLAOG81+f@black.fi.intel.com>
 <c334eb1f-1130-04d7-e7a6-cce9a90fd2e8@gmx.at>
 <Y67RoYvbRC6OgfOq@black.fi.intel.com>
 <272a5f28-5733-3aa1-ff3e-57febd3b217f@gmx.at>
 <Y67X5JrnRxYN/pns@black.fi.intel.com>
 <00dbeaf9-4d2c-3e3a-fa39-4c232b3a68e6@gmx.at>
 <Y7K7zLoAQVyv0zD5@black.fi.intel.com>
 <011df027-5381-1e10-9c54-e0935ae549f9@gmx.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <011df027-5381-1e10-9c54-e0935ae549f9@gmx.at>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Mon, Jan 02, 2023 at 12:45:40PM +0100, Christian Schaubschläger wrote:
> Hi,
> 
> >> After echoing 0 to the 'authorized' file, the devices disappear in
> >> linux from the PCI bus, but unfortunately don't show up in the
> >> firmware after the reboot...
> > Okay it may be that the USB 3 tunnel that is still up makes the CM in
> > BIOS to think the hardware is in unexected state or so.
> >
> > This was Thunderbolt 4 dock, right? Do you happen to have Thunderbolt 3
> > device or Thunderbolt 3 active cable around? If yes then there is only
> > the PCIe tunnel so doing the above de-authorization should in theory
> > work. If no then one option is to add the ->shutdown() hook to tear down
> > the tunnels.
> I have a slightly older EliteBook with a TB3 controller. The TB4 Dock works flawlessly with this.
> And I have the predecessor of the TB4 Dock which also uses TB3. This
> works fine on the new EliteBook with the TB4 controller.
> 
> Both docks have their thunderbolt cables 'built-in', so I cannot switch cables...

I see.

> Any more tests I could make?

Can you try the below hack? It should tear down all tunnels during
reboot so the firmware should see pristine path configuration spaces
(assuming it is looking at them and failing because if already configure
paths).

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 1711dc19b1e2..e0544843e242 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -1982,13 +1982,7 @@ static void tb_stop(struct tb *tb)
 	cancel_delayed_work(&tcm->remove_work);
 	/* tunnels are only present after everything has been initialized */
 	list_for_each_entry_safe(tunnel, n, &tcm->tunnel_list, list) {
-		/*
-		 * DMA tunnels require the driver to be functional so we
-		 * tear them down. Other protocol tunnels can be left
-		 * intact.
-		 */
-		if (tb_tunnel_is_dma(tunnel))
-			tb_tunnel_deactivate(tunnel);
+		tb_tunnel_deactivate(tunnel);
 		tb_tunnel_free(tunnel);
 	}
 	tb_switch_remove(tb->root_switch);
