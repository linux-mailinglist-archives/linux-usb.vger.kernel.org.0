Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9950C5B19B2
	for <lists+linux-usb@lfdr.de>; Thu,  8 Sep 2022 12:11:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230488AbiIHKLt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Sep 2022 06:11:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbiIHKLo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Sep 2022 06:11:44 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC01692F45
        for <linux-usb@vger.kernel.org>; Thu,  8 Sep 2022 03:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662631903; x=1694167903;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=U0spLMns4Gy5VlXQ//TDZvlv9VgaX+rG7em6INR6qSM=;
  b=PU9hwQpiaFjR0MGtgz7a0gr1YV0B7hadBTYucmEf1Z74y4gwXafGGC/o
   03L2otTOdk5QgTdpOHObhQdbVB54JVj9xCsaGHUpmsIaRIH8ze+56tXE6
   wZoJAr1k0xOm/h4BcPHtrmXhwP+mekv5XibV0gfjUXMUAI/J8q7r9NETJ
   2o2QVmV1z8c5xQSm3m9cPkG3+2iaXkSQFAoKbPO+a1vK+j4gpp6Zxn6Id
   PW9CtP62mFmYP/pHaRfcTu0mcNQZcwh10UP7dbEN4TgZxcfkaqPZAJjIZ
   kGsxzbZD/nsWNVJufXUxR3j3M+9ZRJ2C9Ffu2SfiqPCHNrcapFM024Uom
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10463"; a="276864970"
X-IronPort-AV: E=Sophos;i="5.93,299,1654585200"; 
   d="scan'208";a="276864970"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2022 03:11:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,299,1654585200"; 
   d="scan'208";a="757145757"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 08 Sep 2022 03:11:41 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 08 Sep 2022 13:11:40 +0300
Date:   Thu, 8 Sep 2022 13:11:40 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Daniel Martin <consume.noise@gmail.com>
Cc:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: dwc3: multiple ones and speed?
Message-ID: <Yxm/3Gr/4U32EMaC@kuha.fi.intel.com>
References: <CADscph3w83NsduPiOBw+4H1o4jFmktFnoRnMJ5+J6eBD4=0+NQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADscph3w83NsduPiOBw+4H1o4jFmktFnoRnMJ5+J6eBD4=0+NQ@mail.gmail.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Thu, Sep 08, 2022 at 10:51:00AM +0200, Daniel Martin wrote:
> Hi Heikki,
> 
> `git blame drivers/usb/dwc3/dwc3-pci.c` said, that you might be the
> right person to ask. ;-)

Felipe is the dwc3 driver and also the USB gadget subsystem
maintainer. I'll add him here, and also the linux-usb ml.

> - Do you know of any device (preferably Intel x86_64) that has more
> than one dwc3 controller?
> - Do you have any speed comparisions for devices with a dwc3 acting in
> device mode (i. e. throughput and latency of a storage gadget)?

I'm sorry I don't. But perhaps Felipe or someone else on the list has?

> I've got a few Rock Pi X at the moment, though its gadget performance
> isn't that satisfying and I don't know if the Cherry Trail Z8350 or
> the included dwc3 is the limiting factor.
> 
> [1] https://wiki.radxa.com/RockpiX

You should explain a bit more about what you are doing, and with which
exact gadget driver?

Br,

-- 
heikki
