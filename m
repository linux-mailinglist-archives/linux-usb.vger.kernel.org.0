Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4462681108
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jan 2023 15:09:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237161AbjA3OJo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Jan 2023 09:09:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237155AbjA3OJn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Jan 2023 09:09:43 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 293513B0F8
        for <linux-usb@vger.kernel.org>; Mon, 30 Jan 2023 06:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675087782; x=1706623782;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=zGf53nzh0yAcgS1Xxn2Wjeqtd3267aZBFr6gtgQPgwY=;
  b=N5VOuasRuSRI8p6teoF0CRdjBmT4HAPZmbnKqaQWM3wm1pLVTTfFUwBw
   yQv/26AgxWPfNNH+nITiO4IwZwG3thj3q29XUOGSmdUKFFa92N1lAqB/N
   3soP4kjhVVAUNDWXdkSQ7nVuXgB4z5rqIMyd12SVnwu/K6ohIrWOnsvJq
   uowEe7qwRhQf5ZNzjREMAibYXhCij0qtQVu5gPsPwKqeVIB//Y/w63LlA
   avCqooKhje6FUv/dwTzh1sk8jeqIeSy1VRGVROOzoBZ0hua0XuX/P8UH0
   KWa3CMw8oDK6gb5l3nXlPd4d/x+snhnFk1Q15SiXLOs62iG26w+/er5P5
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="307909170"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; 
   d="scan'208";a="307909170"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 06:09:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="666086441"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; 
   d="scan'208";a="666086441"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 30 Jan 2023 06:09:35 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 7CA7C152; Mon, 30 Jan 2023 16:10:12 +0200 (EET)
Date:   Mon, 30 Jan 2023 16:10:12 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Christian =?utf-8?Q?Schaubschl=C3=A4ger?= 
        <christian.schaubschlaeger@gmx.at>
Cc:     linux-usb@vger.kernel.org,
        "michael.simon@cpsd.at" <michael.simon@cpsd.at>
Subject: Re: Possible problem with thunderbolt 4
Message-ID: <Y9fPxIKIOrkHmjHS@black.fi.intel.com>
References: <0f862f75-9805-f5d0-ef89-0b77d0ae8778@gmx.at>
 <Y72AbwKFd9snjZrJ@black.fi.intel.com>
 <3ccb150b-dbd9-c9d0-0e8c-8c169f0d8faf@gmx.at>
 <Y76TS54PJpmseZs3@black.fi.intel.com>
 <8c2da730-ba9b-6ec7-d493-1a6a2ce54622@gmx.at>
 <Y8kXFFrue7l7DKf3@black.fi.intel.com>
 <78c5218a-67ef-d61d-09fe-2c2cf7fdc87f@gmx.at>
 <0c9e644e-a07d-e9bb-f8d6-692d2412fd30@gmx.at>
 <Y9PDRYHHYNSJWwGe@black.fi.intel.com>
 <47af73e9-0d3f-0ac2-52e6-b89a87bc602b@gmx.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <47af73e9-0d3f-0ac2-52e6-b89a87bc602b@gmx.at>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Mon, Jan 30, 2023 at 11:52:59AM +0100, Christian Schaubschläger wrote:
> Hi,
> 
> Am 27.01.23 um 13:27 schrieb Mika Westerberg:
> > Yeah, I just got report from the folks and unfortunately we were not
> > able to reproduce the issue in the lab. The PCIe tunnel stays up (or
> > gets re-created) after reboot from Linux and is visible in the UEFI
> > shell (so in the BIOS).
> >
> > So at the moment I'm out of ideas why this happens since Windows flows
> > should be the same. And we have no means to repro it locally to
> > investigate further :/
> 
> Ok. I try to get access to some more TB4 devices. Currently I have two
> (HP, Lenovo) that show the issue when the software connection manager
> is used.

We should be getting one HP EliteBook 630 G9 soon (I guess this is one
of the systems you see the issue). Once we get it we will try to repro
and investigate further.

> >> Another thought of mine was, if it wouldn't it be useful to have a kernel commandline switch (or thunderbolt module option) that allows the user to select whether the software connection manager should be used, or the firmware connection manager (if avialable)? I understand that in general using the sw connection manager is favorable because the OS then has control over the connection, but maybe there are use cases where letting the firmware doing the job is just fine (like in my case ;-)
> > Right, we may add one but I think it should be part of the USB4 _OSC
> > negotiation like the below patch (acpi.native_usb4_disable=1 in the
> > command line should switch to FW CM). We could also make it "automatic"
> > by adding a DMI quirks table that then sets this.
> >
> > diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
> > index 0c05ccde1f7a..7da4d56fb936 100644
> > --- a/drivers/acpi/bus.c
> > +++ b/drivers/acpi/bus.c
> > @@ -296,6 +296,9 @@ EXPORT_SYMBOL_GPL(osc_cpc_flexible_adr_space_confirmed);
> >  /*
> >   * ACPI 6.4 Operating System Capabilities for USB.
> >   */
> > +bool native_usb4_disable;
> > +module_param(native_usb4_disable, bool, 0644);
> > +
> >  bool osc_sb_native_usb4_support_confirmed;
> >  EXPORT_SYMBOL_GPL(osc_sb_native_usb4_support_confirmed);
> >
> > @@ -344,7 +347,7 @@ static void acpi_bus_osc_negotiate_platform_control(void)
> >  	if (IS_ENABLED(CONFIG_SCHED_MC_PRIO))
> >  		capbuf[OSC_SUPPORT_DWORD] |= OSC_SB_CPC_DIVERSE_HIGH_SUPPORT;
> >
> > -	if (IS_ENABLED(CONFIG_USB4))
> > +	if (IS_ENABLED(CONFIG_USB4) && !native_usb4_disable)
> >  		capbuf[OSC_SUPPORT_DWORD] |= OSC_SB_NATIVE_USB4_SUPPORT;
> >
> >  	if (!ghes_disable)
> That works fine on the HP, with that active the firmware connection manger is used! To make it 'automatic' would mean that on machines listed in this new DMI quirks table the software connection manager would be disabled, correct?

Yes, correct. However, since the software CM works as well except for
this case, I'm having some second thougths on adding a DMI quirk because
it makes certain things not be available, such as lane bonding for the
networking, and de-authorization of the PCIe tunnels among other things.
I think the command line option can be added regardless.
