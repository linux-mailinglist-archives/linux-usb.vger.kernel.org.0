Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C48C70DD0E
	for <lists+linux-usb@lfdr.de>; Tue, 23 May 2023 14:54:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236840AbjEWMyl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 May 2023 08:54:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234328AbjEWMyk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 May 2023 08:54:40 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5F29126
        for <linux-usb@vger.kernel.org>; Tue, 23 May 2023 05:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684846477; x=1716382477;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=9eVLmuqblr0h9AVJ8GhHamXZ4+6PTBY/o5MU8TGsQi4=;
  b=Uva0nGPsFyJ62vi6IOtBT5ltvQfIAzx40dVfzSsO8LmwbYUSI8a0Z0l9
   ziTCWDnb7hE0RFG43eV+qDleDYaROblS266HBib/N+oJJJufvOZF9EDdd
   QhW2jeFSDSyuM5yMZGL2ccaiUK9XI3OfpjTfClVnhEf1IMQxjAYJY+FH+
   w3/6uWaQy0SZVBndGo9+cTGsds/L9gTJP6PfJ1fAIpDUNRg3QRW+LYX+6
   l8vE5emKhd6z1izioCRBJvgVbqzYXzBdEWawgTbnxwUFWBI2o7twUHWit
   uS9zzN5Y9Ru9xYv7OP2jRY7nm66cEL2Bn8EMU8BdMO0xgyYUC04/la/cZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="333588683"
X-IronPort-AV: E=Sophos;i="6.00,186,1681196400"; 
   d="scan'208";a="333588683"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2023 05:54:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="706993610"
X-IronPort-AV: E=Sophos;i="6.00,186,1681196400"; 
   d="scan'208";a="706993610"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 23 May 2023 05:54:35 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 5B2813B9; Tue, 23 May 2023 15:54:39 +0300 (EEST)
Date:   Tue, 23 May 2023 15:54:39 +0300
From:   "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>
To:     =?utf-8?B?TW/FhCw=?= Tomasz <tomasz.mon@nordicsemi.no>
Cc:     "YehezkelShB@gmail.com" <YehezkelShB@gmail.com>,
        "andreas.noever@gmail.com" <andreas.noever@gmail.com>,
        "michael.jamet@intel.com" <michael.jamet@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: USB 2.0 host controller for Thunderbolt 4
Message-ID: <20230523125439.GP45886@black.fi.intel.com>
References: <bd807b391dec726401e36a25f8c8987571d771be.camel@nordicsemi.no>
 <20230523090132.GO45886@black.fi.intel.com>
 <551c6ce270bac239fbcebd5280e426851b84ee0e.camel@nordicsemi.no>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <551c6ce270bac239fbcebd5280e426851b84ee0e.camel@nordicsemi.no>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 23, 2023 at 09:45:49AM +0000, Moń, Tomasz wrote:
> On Tue, 2023-05-23 at 12:01 +0300, Mika Westerberg wrote:
> > On Tue, May 23, 2023 at 10:53:17AM +0200, Tomasz Moń wrote:
> > > When I connect Thunderbolt 3 dock, two new host controllers show up:
> > >   * usb5 - USB 2.0 High-Speed
> > >   * usb6 - USB 3.0 SuperSpeed
> > > 
> > > Devices connected through Thunderbolt 3 dock end up on expected host
> > > controllers, i.e. Low/Full/High-Speed devices connect to usb5 and
> > > SuperSpeed devices end up on usb6.
> > > 
> > > Is Thunderbolt 3 essentially tunnelling the USB 2.0 traffic (by
> > > tunnelling PCIe xHCI host controller traffic) on the superspeed
> > > differential pairs (operating in alternate TBT3 mode)?
> > 
> > It is not. The USB 2.x wires are separate on type-C cables.
> 
> Yes, the USB 2.x wires are separate on type-C cables. But this does not
> answer the question why there is new USB 2.0 High-Speed controller
> showing up that the devices do connect to.

So for the xHCI on the dock itself, I think this is what you mean, it is
just a normal PCIe endpoint and all that traffic goes over a PCIe
tunnel, including the USB 2.x.
