Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 420D442D8B8
	for <lists+linux-usb@lfdr.de>; Thu, 14 Oct 2021 14:02:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230267AbhJNMEl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 Oct 2021 08:04:41 -0400
Received: from mga06.intel.com ([134.134.136.31]:15082 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230172AbhJNMEi (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 14 Oct 2021 08:04:38 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="288529651"
X-IronPort-AV: E=Sophos;i="5.85,372,1624345200"; 
   d="scan'208";a="288529651"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2021 05:02:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,372,1624345200"; 
   d="scan'208";a="626775646"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 14 Oct 2021 05:02:03 -0700
Subject: Re: [PATCH 1/1] usb: xhci: Enable runtime-pm by default on AMD Yellow
 Carp platform
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>
References: <20211013151633.67355-1-mathias.nyman@linux.intel.com>
 <20211013151633.67355-2-mathias.nyman@linux.intel.com>
 <YWcMkCR0U/sWGujD@kroah.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <94f2ecef-94a8-6da5-95a6-ed12f6820b54@linux.intel.com>
Date:   Thu, 14 Oct 2021 15:03:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YWcMkCR0U/sWGujD@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 13.10.2021 19.42, Greg KH wrote:
> On Wed, Oct 13, 2021 at 06:16:33PM +0300, Mathias Nyman wrote:
>> From: Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>
>>
>> AMD's Yellow Carp platform supports runtime power management for
>> XHCI Controllers, so enable the same by default for all XHCI Controllers.
>>
>> Signed-off-by: Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>
>> Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
>> Reviewed-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
>> ---
>>  drivers/usb/host/xhci-pci.c | 15 +++++++++++++++
>>  1 file changed, 15 insertions(+)
>>
>> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
>> index 2c9f25ca8edd..0e571d6af2ab 100644
>> --- a/drivers/usb/host/xhci-pci.c
>> +++ b/drivers/usb/host/xhci-pci.c
>> @@ -69,6 +69,12 @@
>>  #define PCI_DEVICE_ID_ASMEDIA_1142_XHCI			0x1242
>>  #define PCI_DEVICE_ID_ASMEDIA_2142_XHCI			0x2142
>>  #define PCI_DEVICE_ID_ASMEDIA_3242_XHCI			0x3242
>> +#define PCI_DEVICE_ID_AMD_YELLOW_CARP_XHCI_1	0x161a
>> +#define PCI_DEVICE_ID_AMD_YELLOW_CARP_XHCI_2	0x161b
>> +#define PCI_DEVICE_ID_AMD_YELLOW_CARP_XHCI_3	0x161d
>> +#define PCI_DEVICE_ID_AMD_YELLOW_CARP_XHCI_4	0x161e
>> +#define PCI_DEVICE_ID_AMD_YELLOW_CARP_XHCI_5	0x15d6
>> +#define PCI_DEVICE_ID_AMD_YELLOW_CARP_XHCI_6	0x15d7
> 
> Please keep the ids aligned whenever possible.  Why is there not 2 tabs
> being used here?

I'll fix that  and resend 

-Mathias

