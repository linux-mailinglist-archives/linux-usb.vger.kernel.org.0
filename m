Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B229130C030
	for <lists+linux-usb@lfdr.de>; Tue,  2 Feb 2021 14:53:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233090AbhBBNvK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Feb 2021 08:51:10 -0500
Received: from mga06.intel.com ([134.134.136.31]:50874 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233011AbhBBNsp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 2 Feb 2021 08:48:45 -0500
IronPort-SDR: LCqgA4oTitdj3WPzt9GGjv2h9DVEsZ9CKPJTiBGeuEYsf1srd8sscgJzbbx/WyZH+uNEekpe9K
 IBTLBhBxGTLQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="242368464"
X-IronPort-AV: E=Sophos;i="5.79,395,1602572400"; 
   d="scan'208";a="242368464"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2021 05:46:58 -0800
IronPort-SDR: LCD/QKN6fcvXZdH3WkWLFFKV01q+1OlQSLExUqlDQyVPi6RCM2tGh5udhwJWGlXMPP0DxEh02u
 MVW9rEtBfrUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,395,1602572400"; 
   d="scan'208";a="391475746"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by orsmga008.jf.intel.com with ESMTP; 02 Feb 2021 05:46:56 -0800
Subject: Re: [PATCH] usb: pci-quirks: add XHCI_COMP_MODE_QUIRK for disabling
 amd xhci D3cold
To:     "Liang, Prike" <Prike.Liang@amd.com>, Greg KH <greg@kroah.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>
References: <1611020924-17178-1-git-send-email-Prike.Liang@amd.com>
 <YBFPdf6Mc0ZgPsuy@kroah.com> <YBFSFhgk+O40GYhO@kroah.com>
 <BYAPR12MB3238626A32C6E62DA008B72CFBB69@BYAPR12MB3238.namprd12.prod.outlook.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Autocrypt: addr=mathias.nyman@linux.intel.com; prefer-encrypt=mutual; keydata=
 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 fiD/
Message-ID: <39a54be4-dc68-8385-bb65-9c7619e16cf6@linux.intel.com>
Date:   Tue, 2 Feb 2021 15:48:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <BYAPR12MB3238626A32C6E62DA008B72CFBB69@BYAPR12MB3238.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 1.2.2021 16.08, Liang, Prike wrote:
> [AMD Official Use Only - Internal Distribution Only]
> 
>>
>> On Wed, Jan 27, 2021 at 12:33:09PM +0100, Greg KH wrote:
>>> On Tue, Jan 19, 2021 at 09:48:44AM +0800, Prike Liang wrote:
>>>> During xhci suspend some AMD USB host will lose port status change
>>>> events and need to have the registers polled during D3, so now just avoid
>> D3cold.
>>>>
>>>> Signed-off-by: Prike Liang <Prike.Liang@amd.com>
>>>> ---
>>>>  drivers/usb/host/xhci-pci.c | 5 +++++
>>>>  1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/drivers/usb/host/xhci-pci.c
>>>> b/drivers/usb/host/xhci-pci.c index 3feaafe..bff817a 100644
>>>> --- a/drivers/usb/host/xhci-pci.c
>>>> +++ b/drivers/usb/host/xhci-pci.c
>>>> @@ -170,6 +170,11 @@ static void xhci_pci_quirks(struct device *dev,
>> struct xhci_hcd *xhci)
>>>>  (pdev->device == PCI_DEVICE_ID_AMD_PROMONTORYA_1)))
>>>>  xhci->quirks |= XHCI_U2_DISABLE_WAKE;
>>>>
>>>> +if (pdev->vendor == PCI_VENDOR_ID_AMD &&
>>>> +pdev->device == 0x1639) {
>>>> +xhci->quirks |= XHCI_COMP_MODE_QUIRK;
>>>> +}
>>>
>>> Why not add this check to the
>>> xhci_compliance_mode_recovery_timer_quirk_check() function instead,
>>> where all other systems that need this quirk are tested for?
>>
>> Ah, you don't have a pci device at that point in time.  But, why aren't you
>> making the same calls that the caller of that function does when setting this
>> quirk here?  Isn't that also required?
>>
> [Prike]  Thanks comment. This XHCI host port status lost issue was seen on the s2idle wake up period and poll the CNR bit failed in xhci_resume() that eventually result in the XHCI device resume failed. However, this issue may not totally caused by the entry of XHCI compliance mode and seems only partially enable the COMP flag with disable XHCI D3cold can work around this failed case. Regards to this issue maybe we needn't the COMP quirk and only need disable the D3cold for some specific XHCI device during processing xhci_pci_suspend().

The XHCI_COMP_MODE_QUIRK is for cases where ports suddenly go to compliance mode.
For those we start a timer that polls each port every 2 seconds and checks for 
compliance mode, and recovers from it. Timer is not running while xhci is suspended.
Can you see any port ending up in compliance mode?

The 'Controller Not Ready' (CNR) bit not being cleared by host in resume 
sounds like the actual problem.

-Mathias
