Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2BC4719F4D
	for <lists+linux-usb@lfdr.de>; Thu,  1 Jun 2023 16:12:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233802AbjFAOLz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 1 Jun 2023 10:11:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233644AbjFAOLu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 1 Jun 2023 10:11:50 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FC081A8
        for <linux-usb@vger.kernel.org>; Thu,  1 Jun 2023 07:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685628700; x=1717164700;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=fBzSVctiiv5IQG4PNDADxVHLPH30EpPwiyttQznok7Y=;
  b=SSryRYsNwFrz6aJP+8TY4yGs4x3mqQ9R+DKvRRxO7kadoWlIMkvZnlim
   iIt0ImKueKAF5cuG2RXNpsaCBcJygrIPvIE1XWuIyOn1jG1dp7x3sU3sC
   K/WkOQddQbhyE/l+atBF2m8rpF8XWLMFo8BBNG9kQc5z4EnwyaIxhanQb
   F/0cCrplEL/yTPhXMbnGwDXrb0L5rgqIY0C5rVgA43dS1AHERVaRJZVoE
   We5iUup+JjONfgcl8angEOuR3dwUfVQnBXvmq6LC+iUw4L5b68U2U8a+t
   ls6yjGRDgwRve7vBOfG6jqxzA16PQZz/C/NCE+vJLG7Prs+OwN/FTfWwY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="345116846"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; 
   d="scan'208";a="345116846"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 06:53:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="740368423"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; 
   d="scan'208";a="740368423"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orsmga001.jf.intel.com with ESMTP; 01 Jun 2023 06:53:20 -0700
Message-ID: <dd62787f-a04c-01ce-6a16-6a116f0f9c3b@linux.intel.com>
Date:   Thu, 1 Jun 2023 16:54:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Content-Language: en-US
To:     =?UTF-8?Q?Christian_Schaubschl=c3=a4ger?= 
        <christian.schaubschlaeger@gmx.at>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
References: <a45b9989-c9da-bf4e-94c8-3e1341777b4d@gmx.at>
 <20230526123655.GW45886@black.fi.intel.com>
 <0bbb844d-3348-dc28-311a-d4111f8a7f81@linux.intel.com>
 <2d12af30-4a7c-5fb3-fab8-5759296c68ac@gmx.at>
 <20230530105039.GF45886@black.fi.intel.com>
 <d6e7e0d5-0b30-d66c-2ee8-4f0c0caef0b9@gmx.at>
 <20230530121756.GG45886@black.fi.intel.com>
 <a22f8874-c2b3-92a5-e858-b877872e5284@gmx.at>
 <894ba559-9233-4428-69e7-7c0bf5c7556e@gmx.at>
 <b45b5e8a-756e-fd76-64af-d3e376997a31@linux.intel.com>
 <618d9789-fc5a-10b3-6dc9-27be5bbff666@gmx.at>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: USB issue on a TB4 controller?
In-Reply-To: <618d9789-fc5a-10b3-6dc9-27be5bbff666@gmx.at>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 31.5.2023 14.56, Christian Schaubschläger wrote:
> Hi,
> 
>> Attached is a patch that adds more debugging, adds a minimum
>> "power on to power good" delay, (as hub reports 0ms), and checks port link
>> states during hub initialization.
>>
>> Does it help? Could you take logs with that patch applied.
>>
>> Only dmesg with xhci and usbcore dynamic debug are needed.
>> xhci traces won't help as issue seems to be between the hub inthe dock and the NIC
> 
> patch applied, see logs in the attachment. The behaviour is unchanged.
> 
> Thanks,
> Christian

Thanks,

In the failed case the hub in the dock doesn't show any activity
on port4 where the NIC is connected. No changes, link isn't in any
error state. It looks just like any empty port.

I don't have any idea what's going on.

I guess it's not possible to connect a protocol analyzer between the
hub in the dock and the NIC?

ok success case:

[    1.712754] usb 6-2-port1: status 02a0 change 0000
[    1.713070] usb 6-2-port2: status 02a0 change 0000
[    1.713567] usb 6-2-port3: status 0203 change 0010  <- another hub
[    1.714184] usb 6-2-port4: status 0203 change 0010  <- NIC

nok failed case:

[    1.716756] usb 6-2-port1: status 02a0 change 0000
[    1.717036] usb 6-2-port2: status 02a0 change 0000
[    1.717395] usb 6-2-port3: status 0203 change 0010  <- another hub
[    1.717976] usb 6-2-port4: status 02a0 change 0000

Thanks
Mathias
