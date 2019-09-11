Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DA88AF4C2
	for <lists+linux-usb@lfdr.de>; Wed, 11 Sep 2019 05:54:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726561AbfIKDyY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Sep 2019 23:54:24 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:49442 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726341AbfIKDyY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Sep 2019 23:54:24 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 082B96085C; Wed, 11 Sep 2019 03:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568174063;
        bh=lCfVEVyUpbiT7Rpsp/hjsOkf9hQsAf1v6risKYBkfgs=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=KpgFvYxOfLJc2ZaQWbaPMxMa6616HDVjfWf4JR3A5iE+rK50ZcWvjVxGSU9hr24rG
         hhzJ+vHUg2ZcybMr/0ITwKx1tRT1E7mpFtWLFzPXo9KtGnJ8m+QWPKip0tgMpGryBA
         FKR/arFCBW+9H+PCkr05e5vzrGuMnjPzbVZIyQCk=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.206.24.216] (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mgautam@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 31AA5604D4;
        Wed, 11 Sep 2019 03:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568174062;
        bh=lCfVEVyUpbiT7Rpsp/hjsOkf9hQsAf1v6risKYBkfgs=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=LhT+nvN9qVEWJlzmFNxqtqVPdGqf6CgceWIJrKh+7a0DIN4sZIhGNcY6GWnISzNYS
         PllvCz5eMulMhESZJpkViY+a8YLJvCM2577KJJDY4irDy8udeX2XW49KMf7TIVRfBe
         Zcjlwhvu23wk6x7/HW+zbQKAyNooecsXTfrPFuqc=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 31AA5604D4
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=mgautam@codeaurora.org
Subject: Re: EHSET with hub and PCIe root hub
To:     Peter Chen <peter.chen@nxp.com>,
        Allen Blaylock <AllenB@epiloglaser.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <BYAPR20MB25012D076C3D44E07BA32C89CCB60@BYAPR20MB2501.namprd20.prod.outlook.com>
 <20190911025750.GB22414@b29397-desktop>
From:   Manu Gautam <mgautam@codeaurora.org>
Message-ID: <917f584b-11c8-9656-e9a3-df251350c427@codeaurora.org>
Date:   Wed, 11 Sep 2019 09:24:18 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190911025750.GB22414@b29397-desktop>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 9/11/2019 8:27 AM, Peter Chen wrote:
> On 19-09-10 22:01:58, Allen Blaylock wrote:
>> I am trying to validate the USB on an embedded platform based on the NXP i.MX7. 
>> So far I have only been able to validate root ports on the board but also have a
>> PCIe xhci controller and a microchip USB3503 hub off of the HSIC port on the 
>> SoC which I would like to run the tests on. 
>>
>> I have reviewed the mailing list archives and found another discussion of using
>> the EHSET driver to validate a driver and they reference the same issue I am 
>> seeing. When I plug in the device I see 
>> usb_ehset_test: probe of <port path> failed with error -32
>> for either the PCIe root hub or the USB3503 HSIC hub.


I remember seeing some HUBs which fail to enter compliance mode
(STALL SetFeature request) if a device is connected to the port.
You can check usbmon logs if SetFeature request was sent to HUB.


>>
>> Further down in the mailing list chain Peter Chen states 
>>> Besides, do not connect HUB between your host board and emulation board 
>>> (for sending VID/PID).
>> but there is no additional information regarding this statement.
> EHSET is used to test embedded host electrical signal required by
> USB IF Compliance Test, not test the signal for USB HUB, since the
> EHSET module could only let embedded host controller enter test mode
> by writing TEST MODE registers follows EHCI or xHCI spec. Maybe the
> USB HUB could let its port enter test mode, but it needs to use other
> ways, maybe vendor specific commands.

IMO ehset should work with external HUB as well since all it takes to
put a HUB's port in compliance mode is sending a SetFeature request
which I believe driver already does. If HUB is sending stall then you
can try putting a different port in compliance which is not connected.

>
> For your PCIe xHCI controller, if it follows xHCI spec, it should work
> with EHSET, would you please debug it by code and see why return error?
>
> Peter
>> Looking around
>> it looks like the hubs have some mechanism for being tested[0] and the HSETT 
>> application for Windows supports testing of hubs according to the 
>> documentation.[1]
>>
>> Is this something there exists a module for or are either of these cases
>> unexpected behavior for the EHSET kernel module?
>>
>> Allen
>>
>> [0] https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fwww.testusb.com%2FHub_test.html&amp;data=02%7C01%7Cpeter.chen%40nxp.com%7C370e9acddb11494ec68008d7363a93fa%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C1%7C637037497528612416&amp;sdata=djXerGrLCkeITKRqg4KteuzNn5TMxeOhqif58DWJYUE%3D&amp;reserved=0
>> [1] https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fusb.org%2Fsites%2Fdefault%2Ffiles%2FHSETT_Instruction_0_4_1.pdf&amp;data=02%7C01%7Cpeter.chen%40nxp.com%7C370e9acddb11494ec68008d7363a93fa%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C1%7C637037497528612416&amp;sdata=gem9tyxRAWIppDFW%2Fpw08dPKqQQ9NMX%2BhH19V2SloiQ%3D&amp;reserved=0
>>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

