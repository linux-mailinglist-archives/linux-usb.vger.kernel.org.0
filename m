Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EABAB6380
	for <lists+linux-usb@lfdr.de>; Wed, 18 Sep 2019 14:44:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731285AbfIRMoK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Sep 2019 08:44:10 -0400
Received: from mga07.intel.com ([134.134.136.100]:15846 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725902AbfIRMoK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 18 Sep 2019 08:44:10 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Sep 2019 05:44:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,520,1559545200"; 
   d="scan'208";a="186455979"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by fmsmga008.fm.intel.com with ESMTP; 18 Sep 2019 05:44:07 -0700
Subject: Re: [RFT PATCH] xhci: Prevent device initiated U1/U2 link pm if exit
 latency is too long
To:     Jan Schmidt <jan@centricular.com>
Cc:     p.zabel@pengutronix.de, linux-usb@vger.kernel.org
References: <7e3aca8f-3918-08be-f1fd-cb3299c2af16@centricular.com>
 <1568732029-11186-1-git-send-email-mathias.nyman@linux.intel.com>
 <8a372d28-a011-4060-ac12-2291fdc33a4d@centricular.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <1efe04f6-d2b5-78c9-38eb-5fe093a7e7b8@linux.intel.com>
Date:   Wed, 18 Sep 2019 15:46:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8a372d28-a011-4060-ac12-2291fdc33a4d@centricular.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 17.9.2019 18.56, Jan Schmidt wrote:
> 
> 
> On 18/9/19 12:53 am, Mathias Nyman wrote:
>> If host/hub initiated link pm is prevented by a driver flag we still must
>> ensure that periodic endpoints have longer service intervals than link pm
>> exit latency before allowing device initiated link pm.
>>
>> Fix this by continue walking and checking endpoint service interval if
>> xhci_get_timeout_no_hub_lpm() returns anything else than USB3_LPM_DISABLED
>>
>> While at it fix the split line error message
>>
>> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> 
> I tested by forcing the driver->disable_hub_initiated_lpm check and
> confirm a) Other USB devices still work as I expect them to b) without
> this patch, I'm back to only 1 working Oculus Rift Sensor. With it, I
> can capture 3 simultaneously.
> 
> Tested-by: Jan Schmidt <jan@centricular.com>
> 

Great, thanks, I'll queue up that patch as well with your Tested-by tag

-Mathias
