Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D73B9549C26
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jun 2022 20:50:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243936AbiFMSuN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Jun 2022 14:50:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243610AbiFMSuB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Jun 2022 14:50:01 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1347CEAD12
        for <linux-usb@vger.kernel.org>; Mon, 13 Jun 2022 08:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655135321; x=1686671321;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YV1u128bptBEeS4TuW+YczW2sk55JeqWv5VbG1swMZg=;
  b=VxYNS8UIKc4Sch9DYBxez4BpBZztLOv7J6N1FaoM2hBXxiBeEcpXnLyA
   QshadkGYpH3W2YMegzmAqlPA7z9xKQFENqvXKxJr58iyQd4jeNsmESWCV
   J8NHIhe0Iq+u25CUSJW/PBBiqFX3FR4cKKeseVm3AFXwik5/FzhM8/65Y
   owWKwyhdM2+sp3fkkR2R0A7CGzboU+IhVUWX5u9AIQUBJgpebzMWW7/zD
   H8l/WjRMIHeTXamiKPP1KQdyv3qgDQhCb/uy+c0IQV13gnkV6VJdNu+rw
   61TniAw3kyQXN8Dla4ZwDJnNe+bTP8zDBgBEU9dnjIQahxUHu4kvd8a8t
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="278359994"
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; 
   d="scan'208";a="278359994"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2022 08:48:40 -0700
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; 
   d="scan'208";a="726329854"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2022 08:48:38 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1o0mIt-000bA4-Dl;
        Mon, 13 Jun 2022 18:48:35 +0300
Date:   Mon, 13 Jun 2022 18:48:35 +0300
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Ferry Toth <ftoth@exalondelft.nl>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>, linux-usb@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-phy@lists.infradead.org
Subject: Re: [PATCH 6/9] phy: ti: tusb1210: Improve ulpi_read()/_write()
 error checking
Message-ID: <YqdcU8nE/SMr353v@smile.fi.intel.com>
References: <20220205164535.179231-1-hdegoede@redhat.com>
 <20220205164535.179231-7-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220205164535.179231-7-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

+Cc: Ferry

On Sat, Feb 05, 2022 at 05:45:32PM +0100, Hans de Goede wrote:
> ulpi_read() and ulpi_write() calls can fail. Add wrapper functions to log
> errors when this happens and add error checking to the read + write of
> the phy parameters from the TUSB1210_VENDOR_SPECIFIC2 register.


This patch seems to break Intel Merrifield platform.

Before:

[   36.333644] xhci-hcd xhci-hcd.1.auto: xHCI Host Controller
[   36.339828] xhci-hcd xhci-hcd.1.auto: new USB bus registered, assigned bus number 1
[   36.352566] xhci-hcd xhci-hcd.1.auto: hcc params 0x0220f06c hci version 0x100 quirks 0x0000000002010010
[   36.367062] xhci-hcd xhci-hcd.1.auto: irq 16, io mem 0xf9100000
[   36.378429] xhci-hcd xhci-hcd.1.auto: xHCI Host Controller
[   36.384705] xhci-hcd xhci-hcd.1.auto: new USB bus registered, assigned bus number 2

After:
[   32.986776] tusb1210 dwc3.0.auto.ulpi: error -110 writing val 0x41 to reg 0x80
[   32.994053] phy phy-dwc3.0.auto.ulpi.0: phy poweron failed --> -110
[   33.000601] dwc3 dwc3.0.auto: error -ETIMEDOUT: failed to initialize core
[   33.007486] dwc3: probe of dwc3.0.auto failed with error -110


Any ideas?

P.S> There is no bisect log, since it's done manually with a good guess by
Ferry. I have just reverted patches on ULPI from this series and start applying
them one-by-one.

-- 
With Best Regards,
Andy Shevchenko


