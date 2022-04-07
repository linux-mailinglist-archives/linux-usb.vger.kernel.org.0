Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6456A4F8528
	for <lists+linux-usb@lfdr.de>; Thu,  7 Apr 2022 18:48:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232772AbiDGQtJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Apr 2022 12:49:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230186AbiDGQtI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Apr 2022 12:49:08 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A03320F4E
        for <linux-usb@vger.kernel.org>; Thu,  7 Apr 2022 09:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649350021; x=1680886021;
  h=to:cc:references:from:subject:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=2YeD+40pBuF9EhoChxf4aO0rP9jRgivVVMkPWeuv7U4=;
  b=Iwp6AqQY6MWEXsO5jzAxKEf1SvwQ7FdrF4PSVaMGPZ+WDWpwr0HJa6Em
   /XSo+UVGln0zwgNKg+v5LpThI28tnClHzl/R//jdOeIKzsxrlZg1sLXMc
   rSC0Y39LPLOjcAozQSkyhkcvNirX5klcWHooW38nrhEqWKS/lu/J3XPHd
   xlU6n40cEuWx376k6pJOoIFdZYlZy6As4uDs/z2rVrYKRUM6mNbgitZPi
   kJ8xppvp0bZtx6zkSFtL86H7AXgKhcy0Iw5TZs+E2lLLK46nbsHDwbrO3
   TAPeVtQN2Zt9PcGrbC68mLFzxTHUzovqQjQdrPZvx5Hr6Ibbv+KSB6/hS
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="261372942"
X-IronPort-AV: E=Sophos;i="5.90,242,1643702400"; 
   d="scan'208";a="261372942"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2022 09:46:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,242,1643702400"; 
   d="scan'208";a="659135837"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orsmga004.jf.intel.com with ESMTP; 07 Apr 2022 09:46:47 -0700
To:     Luke Nowakowski-Krijger <luke.nowakowskikrijger@canonical.com>,
        linux-usb@vger.kernel.org
Cc:     hdegoede@redhat.com, chris.chiu@canonical.com,
        stern@rowland.harvard.edu, kishon@ti.com
References: <20220404163839.19102-1-luke.nowakowskikrijger@canonical.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: Deferring xhci primary roothub registration
Message-ID: <0ac85d29-afd0-c9e6-b697-0f2f3510a6e6@linux.intel.com>
Date:   Thu, 7 Apr 2022 19:48:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220404163839.19102-1-luke.nowakowskikrijger@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi

On 4.4.2022 19.38, Luke Nowakowski-Krijger wrote:
> Hello,
> 
> There have been some users using Ubuntu 5.4 based kernels with certain intel xHCI controllers that are experiencing USB devices not being detected during boot [4][5].
> This problem seems to have been reintroduced after the patchset that deferred primary roothub registration to address device enumeration before
> xHC is running was reverted due to regressions [1][2].
> 
> My question is if there has been any efforts to reintroduce these patches or any other fixes that I am not aware of to address the original problem [3]?

Not yet, thanks for the reminder.

> There seem to have been many bug fixes addressing the problems referenced in the original regression report [2] to do with this patch series,
> is there anything in the way of reintroducing these patches? From only looking at the mailing list discussions and various bug reports, I still am not exactly
> sure what the problems with these patches were in the first place.> 
> Anyways, these things seem pretty tricky and I would appreciate any insight on the matter :)

The race issues those patches exposed should be fixed by now, so I think we should
try to add those patches again.  

My understanding is that the patch [1] reducing root hub power-on-good delay in 5.13-rc1
revealed a enumeration issue due to roothub being active before host is running.

In 5.15-rc3 two patches [2], [3] were added to defer roothub registration.
This exposed a race when both roothubs were added at the same time, causing
regression and more enumeration issues, so patches [2] and [3] were reverted in 5.16-rc1.

The race issues were then later fixed in 5.16-rc3 with patches [4] and [5]

[1] 90d28fb53d4a ("usb: core: reduce power-on-good delay time of root hub").  5.13-rc1
[2] b7a0a792f864 ("xhci: Set HCD flag to defer primary roothub registration") 5.15-rc3 
[3] 58877b0824da ("usb: core: hcd: Add support for deferring roothub registration") 5.15-rc3
[4] 6ae6dc22d2d1 ("usb: hub: Fix usb enumeration issue due to address0 race") 5.16-rc3
[5] 6cca13de26ee ("usb: hub: Fix locking issues with address0_mutex") 5.16-rc3

-Mathias
