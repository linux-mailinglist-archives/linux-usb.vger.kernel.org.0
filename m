Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 601361D2378
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2020 02:10:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732861AbgENAKz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 May 2020 20:10:55 -0400
Received: from mail-out.m-online.net ([212.18.0.9]:53180 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732847AbgENAKy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 May 2020 20:10:54 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 49MsQ40N9Sz1qwHF;
        Thu, 14 May 2020 02:10:52 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 49MsQ36kr6z1qql9;
        Thu, 14 May 2020 02:10:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id UcXuma9s3gUf; Thu, 14 May 2020 02:10:50 +0200 (CEST)
X-Auth-Info: pDbjZIujs990QHoy+5gZo83IMt9a3Vm9+iOh9/LlrLo=
Received: from [IPv6:::1] (unknown [195.140.253.167])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Thu, 14 May 2020 02:10:50 +0200 (CEST)
Subject: Re: [PATCH] [RFC] usb: dwc2: Run the core connect in dwc2_hcd_init()
From:   Marek Vasut <marex@denx.de>
To:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc:     Amelie Delaunay <amelie.delaunay@st.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <20200413143107.181669-1-marex@denx.de>
 <31b679d3-d3e4-0220-ec4b-58eada4d21d4@synopsys.com>
 <b20fb33d-7fdd-5785-8f72-74900eb4d328@denx.de>
 <9906c2da-8a20-eae7-d69e-6947085edf84@synopsys.com>
 <b64f41ac-2d70-55a3-ab6a-77383cd463eb@denx.de>
 <d1b36da4-b506-2f86-f5ad-95bf3aac4485@synopsys.com>
 <c35e95cf-7f72-4a49-a0e1-efc0701d613d@denx.de>
 <867a776d-1e2c-2207-4387-072d2a8423fb@synopsys.com>
 <a6d681c5-d5fa-51d8-a320-6f6e9844c93a@denx.de>
 <4b4478aa-85bd-c05c-b5d0-e11dc35eb623@synopsys.com>
 <6ea2270d-19a4-7e8b-42fb-37a4a9d81e1f@denx.de>
 <8fb53f3a-a02b-3c53-0d9d-22b707bda786@synopsys.com>
 <671f36e3-367e-bcdf-0da7-f7ad82cf6284@denx.de>
 <ebb175be-edc1-892f-4537-a7402fd4460e@synopsys.com>
 <bb4835f6-a6c7-61cf-d4f0-eddbb5d6dea9@denx.de>
 <8de7047f-4d49-349b-983a-31c4ab66562f@synopsys.com>
 <c59c58e6-648c-bcb3-cbd4-9e78f9021bb7@denx.de>
Message-ID: <d67d69a6-651f-f214-5119-bbbd68b4c2d5@denx.de>
Date:   Thu, 14 May 2020 02:10:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <c59c58e6-648c-bcb3-cbd4-9e78f9021bb7@denx.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 4/22/20 4:21 PM, Marek Vasut wrote:
> On 4/22/20 3:45 PM, Minas Harutyunyan wrote:
>> Hi,
> 
> Hi,
> 
>> On 4/20/2020 4:09 PM, Marek Vasut wrote:
>>> On 4/17/20 11:00 AM, Minas Harutyunyan wrote:
>>>> Hi,
>>>
>>> Hi,
>>>
>>>> On 4/16/2020 6:31 PM, Marek Vasut wrote:
>>>>> On 4/16/20 3:37 PM, Minas Harutyunyan wrote:
>>>>
>> Looks like I found cause of issue. According to your logs GINTMSK set 
>> host masks, at least USB Reset not unmasked which required for device mode.
>> Why it happen. During dwc2 driver probe first initialized device part 
>> then host part. Because of your g_zero is builtin in Kernel it 
>> immediately bound to dwc2, as result called main device initialization 
>> dwc2_hsotg_core_init_disconnected() which at least set GINTMSK for 
>> device mode. After gadget side initialization done, dwc2 go to host 
>> initialization hcd_init() and reset GINTMSK to host masks. In this case 
>> connecting cable to host will ignore USBReset and stacked. Your initial 
>> patch including call to function dwc2_hsotg_core_init_disconnected(), 
>> which allow to restore device mode masks and on cable connect start 
>> working as device.
>> First to check my assumption, please build g_zero as module and modprobe 
>> it after dwc2 modprobe will be done. If the tests will pass then will 
>> think how resolve issue with builtin functions.
> 
> Using g_zero as a module seems to work too, so please proceed.

Any news on using g_zero as built-in ?
