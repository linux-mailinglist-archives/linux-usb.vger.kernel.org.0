Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 141156D18AD
	for <lists+linux-usb@lfdr.de>; Fri, 31 Mar 2023 09:34:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230425AbjCaHeG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 31 Mar 2023 03:34:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230318AbjCaHeE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 31 Mar 2023 03:34:04 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58A53191C1
        for <linux-usb@vger.kernel.org>; Fri, 31 Mar 2023 00:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680248037; x=1711784037;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=d4FM1GOTG+KuT4O7xIi9JM4FRI+vpAPK1dcrPngUVo0=;
  b=Ojkz9W4ejuGSCHqSTLeAJI8mlG6yqvitiiQTWcZqPmEiwMvZOZ8k8eLN
   9WY7L6mnkr/OC8BYE12GjTDxI40VshyHy7EFlVXx4vWVN3zBFIaFgEqGs
   KSJDIUzh5KOwScTaAbsa7J2EXWl/NTyXs/z5U2BGaSoiM+d8S7tKVqzeA
   it4vQxaMhauuJwXit52oeEOYnIZQChRvqSXXNWMba2S7bCkQY3A4RqZjz
   2BD4b0L5Ks9p18GB0F3ShkoMsFQGYqF4JoVIUNk9P9FyBA22IuJ84hN8p
   SU0NUUWxVnM8WwYSNg3HnjyeNJ3xRRE67yN9TbEElKDdR7F8I9yNLcSYU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="404099709"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="404099709"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2023 00:33:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="685027295"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="685027295"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orsmga002.jf.intel.com with ESMTP; 31 Mar 2023 00:33:45 -0700
Message-ID: <2fa0510f-2bef-8e6c-3531-1a99a659bd6b@linux.intel.com>
Date:   Fri, 31 Mar 2023 10:35:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Subject: Re: [PATCH 1/3] xhci: also avoid the XHCI_ZERO_64B_REGS quirk with a
 passthrough iommu
Content-Language: en-US
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        D Scott Phillips <scott@os.amperecomputing.com>,
        Marc Zyngier <maz@kernel.org>
References: <20230330143056.1390020-1-mathias.nyman@linux.intel.com>
 <20230330143056.1390020-2-mathias.nyman@linux.intel.com>
 <ZCWfev2C6G7AUHN0@kroah.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <ZCWfev2C6G7AUHN0@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 30.3.2023 17.40, Greg KH wrote:
> On Thu, Mar 30, 2023 at 05:30:54PM +0300, Mathias Nyman wrote:
>> From: D Scott Phillips <scott@os.amperecomputing.com>
>>
>> Previously the quirk was skipped when no iommu was present. The same
>> rationale for skipping the quirk also applies in the iommu.passthrough=1
>> case.
>>
>> Skip applying the XHCI_ZERO_64B_REGS quirk if the device's iommu domain is
>> passthrough.
>>
>> Fixes: 12de0a35c996 ("xhci: Add quirk to zero 64bit registers on Renesas PCIe controllers")
> 
> Why not also for stable?

Ah, yes, this should go to stable as well.

Thanks
Mathias

