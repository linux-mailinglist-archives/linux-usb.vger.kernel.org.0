Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1E1866449D
	for <lists+linux-usb@lfdr.de>; Tue, 10 Jan 2023 16:25:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238988AbjAJPZt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Jan 2023 10:25:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238914AbjAJPZI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Jan 2023 10:25:08 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A22B387F1D
        for <linux-usb@vger.kernel.org>; Tue, 10 Jan 2023 07:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673364307; x=1704900307;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=gRCBSl25jUsO5Fgis/lVUPk0AZmlAois08x+El8klcw=;
  b=aKxZva97D0QTZRKVGnlbg4beStHD/td2MKMTmT6B2A0mGUNysowO5rFy
   aVz+rj5F4LS0sMDTqHvQbFxkJ+TSP+7ZPOaIv8xEDtnH8xw8qvhWAiOVm
   AgNXVBsPBZaDIs6YJWHEutU3JkuYsyDtaJeY/Fs6jGaB81JAmYamI3F+c
   0G6dNhLI12mXWMBMThBVskbvOfl+Vo9hLj7V/MmHHYoXDUszNEsYpYjWE
   ri3rgUw0khoQjSAmeQw08SIGsHk98nO1PsaHiup2hzGgHBgSOdrlH8IQf
   xAVBjYIgXfduv6huJm8CicDGQJZfdQKeoJsq5b0xCzVUeXQdPnxoUtIK5
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="324406096"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; 
   d="scan'208";a="324406096"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2023 07:12:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="781093159"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; 
   d="scan'208";a="781093159"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 10 Jan 2023 07:12:13 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 56E13E1; Tue, 10 Jan 2023 17:12:47 +0200 (EET)
Date:   Tue, 10 Jan 2023 17:12:47 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Christian =?utf-8?Q?Schaubschl=C3=A4ger?= 
        <christian.schaubschlaeger@gmx.at>
Cc:     linux-usb@vger.kernel.org,
        "michael.simon@cpsd.at" <michael.simon@cpsd.at>
Subject: Re: Possible problem with thunderbolt 4
Message-ID: <Y72AbwKFd9snjZrJ@black.fi.intel.com>
References: <Y7ME7EwduIQE38+2@black.fi.intel.com>
 <a324ff2a-d014-83d2-4f30-b865db7c352b@gmx.at>
 <Y7QMlV82mtaApJwJ@black.fi.intel.com>
 <a8c1dd4b-7227-5ba2-97a4-a2dc3d561ea3@gmx.at>
 <Y7RSrLYfG1r8b+Zj@black.fi.intel.com>
 <86a6b7ca-4302-00fe-97f6-d48ebb5e6171@gmx.at>
 <Y7UzCY6ujQ2qtoq5@black.fi.intel.com>
 <057da4af-9507-fdc6-9588-160a88210674@gmx.at>
 <Y7wNnrlEWMOV4Cj/@black.fi.intel.com>
 <0f862f75-9805-f5d0-ef89-0b77d0ae8778@gmx.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0f862f75-9805-f5d0-ef89-0b77d0ae8778@gmx.at>
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

On Mon, Jan 09, 2023 at 03:21:15PM +0100, Christian Schaubschläger wrote:
> Hi,
> 
> > Okay it could be that Windows CM is doing something during the reboot,
> > like resetting the ports. Can you try the below hack patch and see if
> > that makes it work the same in Linux?
> 
> I'm afraid that doesn't make it work. I can see that usb4_port_reset
> is called 4 times when the machine is rebooted, but still the net
> device isn't there afterwards.

Okay thanks for checking. I'm discussing with our Windows folks if there
is something done differently in Windows side. They do similar reset in
certain flows but I'm not sure if it is exactly on "reboot" and it is
not clear whether Windows and Linux "reboot" in general is doing the
same thing either.

In the meantime, did we try this already?

0. Drop all kernel changes
1. Boot the system up, nothing connected
2. Plug in the dock
3. Check that it works (lspci etc.)
4. Unload the Thunderbolt driver

  # rmmod thunderbolt

5. Reboot the system
