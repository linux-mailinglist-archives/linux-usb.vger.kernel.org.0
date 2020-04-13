Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B60A1A6AC2
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2020 19:00:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732276AbgDMRAd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Apr 2020 13:00:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732122AbgDMRAc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Apr 2020 13:00:32 -0400
X-Greylist: delayed 8956 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 13 Apr 2020 10:00:31 PDT
Received: from mail-out.m-online.net (mail-out.m-online.net [IPv6:2001:a60:0:28:0:1:25:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFF47C0A3BDC
        for <linux-usb@vger.kernel.org>; Mon, 13 Apr 2020 10:00:31 -0700 (PDT)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 491FHL1tgsz1rrKd;
        Mon, 13 Apr 2020 19:00:30 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 491FHL0psjz1r0cX;
        Mon, 13 Apr 2020 19:00:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id YHPzYlpeKzba; Mon, 13 Apr 2020 19:00:29 +0200 (CEST)
X-Auth-Info: n62lZ2A70y0gSv9XIExeZKJAP+VZvGk04+fubKFT/Fs=
Received: from [IPv6:::1] (unknown [195.140.253.167])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Mon, 13 Apr 2020 19:00:29 +0200 (CEST)
Subject: Re: [PATCH] [RFC] usb: dwc2: Run the core connect in dwc2_hcd_init()
To:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc:     Amelie Delaunay <amelie.delaunay@st.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <20200413143107.181669-1-marex@denx.de>
 <31b679d3-d3e4-0220-ec4b-58eada4d21d4@synopsys.com>
 <b20fb33d-7fdd-5785-8f72-74900eb4d328@denx.de>
 <9906c2da-8a20-eae7-d69e-6947085edf84@synopsys.com>
From:   Marek Vasut <marex@denx.de>
Message-ID: <b64f41ac-2d70-55a3-ab6a-77383cd463eb@denx.de>
Date:   Mon, 13 Apr 2020 19:00:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <9906c2da-8a20-eae7-d69e-6947085edf84@synopsys.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 4/13/20 5:27 PM, Minas Harutyunyan wrote:
> Hi,

Hi,

> On 4/13/2020 6:54 PM, Marek Vasut wrote:
>> On 4/13/20 4:45 PM, Minas Harutyunyan wrote:
>>> Hi,
>>
>> Hi,
>>
>>> On 4/13/2020 6:31 PM, Marek Vasut wrote:
>>>> On STM32MP1 without the STUSB1600 USB-C chip (i.e. with plain USB-OTG
>>>
>>> Could you please provide GSNPSID, GHWCFG1-4 register values for STM32MP1.
>>
>> GSNPSID = 0x4f54330a
>> GHWCFG1 = 0x00000000
>> GHWCFG2 = 0x228fe150
>> GHWCFG3 = 0x03b892e8
>> GHWCFG4 = 0xe3f00030
>>
> STM32MP1 core doesn't support ACG feature: GHWCFG4_ACG_SUPPORTED = 0. 
> So, in your patch for STM32MP1 at least these lines are no meaning:
> 
> +	/* Enable ACG feature in device mode,if supported */
> +	dwc2_enable_acg(hsotg);

The comment says it enables the ACG only if it's supported.

> Looks like you just copied this chirp from dwc2_conn_id_status_change() 
> function.

Yes, that's correct, verbatim.

> dwc2_hsotg_core_init_disconnected() function is device mode function, 
> not sure that it's safe to call it for host mode in dwc2_hcd_init().

OK well, if I don't use this patch and I plug in a USB cable from the
host PC, then the STM32MP1 isn't detected by the host PC. Do you have
any idea what the correct fix would be then ?
