Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06CB84E610A
	for <lists+linux-usb@lfdr.de>; Thu, 24 Mar 2022 10:22:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349206AbiCXJXi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Mar 2022 05:23:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349204AbiCXJXg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Mar 2022 05:23:36 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57A3F9E9D8
        for <linux-usb@vger.kernel.org>; Thu, 24 Mar 2022 02:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648113725; x=1679649725;
  h=to:cc:references:from:subject:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=OG6tWMaxkXMVWubRqz2gQ53VryJ6+Cepfme6f0+32QM=;
  b=HtSPeuWzl50HZOHNa8d71dsaNAunKgw1LEFvz0UxwCT9AuulGlHKYO6Q
   9DEs03DBYqk0wcqnAFcpJwSnMxBGLLHRWu5AK2E9rCwSp/U4fj/ETxLIL
   YQM1cmDkQjuXuU4p00S1M86wvuaEgN7ivgS8L4vA/8B4zd0iUo3lY1QBt
   wWwCUf0Yx3HjR2QZZXH2Cz1523EqmBSjui65hK1uxorQ69qTD4alzkXK3
   rQPhSsvj5j9FV3F2haaIktdVZUVoQITGsrRjCpr2YWt+e+m/oFiyDj57a
   S3wrjRr3W0kgDWUGBG7nf9+8XYzvjqAjAr2N79/8d5axHYm3pfxAIbnvA
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10295"; a="283184889"
X-IronPort-AV: E=Sophos;i="5.90,206,1643702400"; 
   d="scan'208";a="283184889"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2022 02:22:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,206,1643702400"; 
   d="scan'208";a="649781191"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orsmga004.jf.intel.com with ESMTP; 24 Mar 2022 02:22:02 -0700
To:     Heiner Kallweit <hkallweit1@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Linux USB Mailing List <linux-usb@vger.kernel.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Jack Pham <quic_jackp@quicinc.com>,
        Tung Nguyen <tunguyen@apm.com>
References: <0684616b-5cc0-e9f6-7015-ce709c6d4386@gmail.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v2 0/5] usb: host: xhci-plat: omit shared hcd if either of
 the root hubs has no ports
Message-ID: <cd18385f-cc94-45fc-4a39-60e05dd6031e@linux.intel.com>
Date:   Thu, 24 Mar 2022 11:23:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <0684616b-5cc0-e9f6-7015-ce709c6d4386@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-8.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 17.3.2022 0.08, Heiner Kallweit wrote:
> I have a system with a low-cost Amlogic S905W SoC that supports USB3
> but has a USB3 root hub with no ports. This results in an error
> message and a hcd that is good for nothing. The USB2 root hub has
> ports and works normally.
> I think we can do better and omit creating a shared hcd if either of
> the root hubs has no ports. This series is based on discussion [0].
> 
> The series works as intended for me. What I couldn't test is the case
> of the USB2 root hub having no ports.
> 
> Follow-up to this series could be applying the xhci-plat extension
> to other xhci drivers.
> 

Thanks,
Patches look good but something must have changed since you submitted them.
I can't apply them neatly on usb-next, usb-linus, 5.17, or 5.17-rc8


On top of usb-next I get:
Applying: usb: host: xhci-plat: create shared hcd after having added main hcd
error: patch failed: drivers/usb/host/xhci-plat.c:313
error: drivers/usb/host/xhci-plat.c: patch does not apply
Patch failed at 0003 usb: host: xhci-plat: create shared hcd after having added main hcd

-Mathias
