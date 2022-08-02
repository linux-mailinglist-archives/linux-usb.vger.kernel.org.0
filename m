Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80A76587CDE
	for <lists+linux-usb@lfdr.de>; Tue,  2 Aug 2022 15:07:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236320AbiHBNHd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Aug 2022 09:07:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232503AbiHBNHb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 Aug 2022 09:07:31 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 017B6BC2D
        for <linux-usb@vger.kernel.org>; Tue,  2 Aug 2022 06:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659445650; x=1690981650;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=WBBFsdI1fsGGVvCXxcDJOm0TImFrM69PAwokKLT0Yu4=;
  b=jkB2HqywcyvRKu1c8zvbetdq6p+7uwv8RK7YkN3fs4MzgQM7okJFUBk4
   QZYyor2zoEDAaBIyCV5/w6COuQZw/zW9EGgnbt0h2Xca7Qi5sXq61vSEE
   aJQUBDn1xK1XHmtDqDLHcK0fcvQiMk1xKjuTM15dfmZETR8z4aLFYo5uE
   pp/VBww559njekNua4cxT1rh6oqesH7gFSqet+1f8P7E+lzclgI6MZ9Eu
   xCRvOCms6/XWJ2cfGZUIIHTg1NzkEO+S547jSjjDwsMswJ9uTt11+KCqx
   AJf7pXiPKT8nlHcIfCyZzux4Wym4IH4p1qxu82wWYxkQ6kZwRlmI7Z/Fb
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10426"; a="375703573"
X-IronPort-AV: E=Sophos;i="5.93,210,1654585200"; 
   d="scan'208";a="375703573"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2022 06:07:30 -0700
X-IronPort-AV: E=Sophos;i="5.93,210,1654585200"; 
   d="scan'208";a="728825840"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2022 06:07:27 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 02 Aug 2022 16:07:25 +0300
Date:   Tue, 2 Aug 2022 16:07:24 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     =?utf-8?Q?=C5=81ukasz?= Bartosik <lb@semihalf.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        linux-usb@vger.kernel.org, upstream@semihalf.com
Subject: Re: [PATCH v2] thunderbolt: fix PCI device class after powering up
Message-ID: <YukhjOo4CteuM8q9@lahna>
References: <20220729094022.186496-1-lb@semihalf.com>
 <Yuep3lpI02gWiJY9@lahna>
 <CAK8ByeL4AJoXndO02Os0UPYZRiMeLmBjB-00VaEe-8KJF0tWzQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK8ByeL4AJoXndO02Os0UPYZRiMeLmBjB-00VaEe-8KJF0tWzQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 02, 2022 at 02:27:30PM +0200, Łukasz Bartosik wrote:
> >
> > Hi,
> >
> > On Fri, Jul 29, 2022 at 11:40:22AM +0200, Łukasz Bartosik wrote:
> > > A thunderbolt
> > > lspci -d 8086:9a1b -vmmknn
> > > Slot: 00:0d.2
> > > Class:        System peripheral [0880]
> > > Vendor:       Intel Corporation [8086]
> > > Device:       Tiger Lake-LP Thunderbolt 4 NHI #0 [9a1b]
> > >
> > > presents itself with PCI class 0x088000 after Chromebook boots.
> > > lspci -s 00:0d.2 -xxx
> > > 00:0d.2 System peripheral: Intel Corporation Tiger Lake-LP Thunderbolt 4
> > > NHI #0 (rev 01)
> > > 00: 86 80 1b 9a 00 00 10 00 01 00 80 08 00 00 00 00
> > > ...
> > >
> > > However after thunderbolt is powered up in nhi_probe()
> > > its class changes to 0x0c0340
> > > lspci -s 00:0d.2 -xxx
> > > 00:0d.2 System peripheral: Intel Corporation Tiger Lake-LP Thunderbolt 4
> > > NHI #0 (rev 01)
> > > 00: 86 80 1b 9a 06 04 10 00 01 40 03 0c 00 00 00 00
> > > ...
> > >
> > > which leaves pci_dev structure with old class value
> > > cat /sys/bus/pci/devices/0000:00:0d.2/class
> > > 0x088000
> >
> > This is completely unexpected. Which Chromebook this is and have you
> > tried to upgrade it to the latest?
> >
> 
> This happens on a Tiger Lake based reference Chromebook platform.
> The issue also happens on the latest ChromeOS image available for that platform.

Is this something available for purchase? I'm asking because I have Acer
Tiger Lake based Chromebook (740 spin or something) here and the TBT
controller class is "USB controller" all the time, and this is what is
expected. It should not change the class at any point.
