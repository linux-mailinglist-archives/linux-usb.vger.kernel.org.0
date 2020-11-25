Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D53C32C4298
	for <lists+linux-usb@lfdr.de>; Wed, 25 Nov 2020 16:06:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729989AbgKYPEV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Nov 2020 10:04:21 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:40604 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727614AbgKYPEV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 25 Nov 2020 10:04:21 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0APF45fd102151;
        Wed, 25 Nov 2020 09:04:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1606316645;
        bh=abbitnCOhB4/7GZNMu7oESPWpbhlDGq3AlXmkk73T8Q=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=OBCvNGYTxI/LJ0xY2UMJmIAqfBPQEUfZe2MPpgXUo9rTlNcqRQPnLnwogr5dcoj7C
         HHQxu4p7DFTUYRMyhxJIROpCg9Rl64OntdIZz8lh724Y8phlPfFH5l5FDknT2j5mFG
         3Lo+Gfg+ppUd/dHEYYHbVkilQbEHzkTkDORX0tEY=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0APF45X9031923
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 25 Nov 2020 09:04:05 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 25
 Nov 2020 09:04:05 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 25 Nov 2020 09:04:05 -0600
Received: from [10.24.69.198] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0APF3tXj058491;
        Wed, 25 Nov 2020 09:03:58 -0600
Subject: Re: [PATCH v3 00/10] Introduced new Cadence USBSSP DRD Driver.
To:     Pawel Laszczak <pawell@cadence.com>,
        Peter Chen <peter.chen@nxp.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "colin.king@canonical.com" <colin.king@canonical.com>,
        "rogerq@ti.com" <rogerq@ti.com>, Rahul Kumar <kurahul@cadence.com>,
        "Govindraju, Aswath" <a-govindraju@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>
References: <20201119141307.8342-1-pawell@cadence.com>
 <20201124075023.GC32310@b29397-desktop>
 <DM6PR07MB55299F262CEA81216999CB05DDFB0@DM6PR07MB5529.namprd07.prod.outlook.com>
 <45ffc5f8-f9de-e14d-3d03-9ef1f1c848d9@ti.com>
 <DM6PR07MB5529316FE42279C77BB43317DDFB0@DM6PR07MB5529.namprd07.prod.outlook.com>
From:   Sekhar Nori <nsekhar@ti.com>
Message-ID: <24639633-919c-7082-fbde-dc613a7a71d0@ti.com>
Date:   Wed, 25 Nov 2020 20:33:54 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <DM6PR07MB5529316FE42279C77BB43317DDFB0@DM6PR07MB5529.namprd07.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 24/11/20 3:22 PM, Pawel Laszczak wrote:
> Sekhar,
> 
>>
>>
>> On 24/11/20 2:51 PM, Pawel Laszczak wrote:
>>> Peter,
>>>
>>>> On 20-11-19 15:12:57, Pawel Laszczak wrote:
>>>>> This patch introduce new Cadence USBSS DRD driver to linux kernel.
>>>>>
>>>>> The Cadence USBSS DRD Controller is a highly configurable IP Core which
>>>>> can be instantiated as Dual-Role Device (DRD), Peripheral Only and
>>>>> Host Only (XHCI)configurations.
>>>>>
>>>>> The current driver has been validated with FPGA burned. We have support
>>>>> for PCIe bus, which is used on FPGA prototyping.
>>>>>
>>>>> The host side of USBSS-DRD controller is compliance with XHCI
>>>>> specification, so it works with standard XHCI Linux driver.
>>>>>
>>>>> The device side of USBSS DRD controller is compliant with XHCI.
>>>>> The architecture for device side is almost the same as for host side,
>>>>> and most of the XHCI specification can be used to understand how
>>>>> this controller operates.
>>>>>
>>>>> This controller and driver support Full Speed, Hight Speed, Supper Speed
>>>>> and Supper Speed Plus USB protocol.
>>>>>
>>>>> The prefix cdnsp used in driver has chosen by analogy to cdn3 driver.
>>>>> The last letter of this acronym means PLUS. The formal name of controller
>>>>> is USBSSP but it's to generic so I've decided to use CDNSP.
>>>>>
>>>>> The patch 1: adds support for DRD CDNSP.
>>>>> The patch 2: separates common code that can be reusable by cdnsp driver.
>>>>> The patch 3: moves reusable code to separate module.
>>>>> The patch 4: changes prefixes in reusable code from cdns3 to common cdns.
>>>>> The patch 5: adopts gadget_dev pointer in cdns structure to make possible
>>>>>              use it in both drivers.
>>>>> The patches 6-8: add the main part of driver and has been intentionally
>>>>>              split into 3 part. In my opinion such division should not
>>>>>              affect understanding and reviewing the driver, and cause that
>>>>>              main patch (7/8) is little smaller. Patch 6 introduces main
>>>>>              header file for driver, 7 is the main part that implements all
>>>>>              functionality of driver and 8 introduces tracepoints.
>>>>> The patch 9: Adds cdns3 prefixes to files related with USBSS driver.
>>>>> the patch 10: Adds USBSSP DRD IP driver entry to MAINTAINERS file.
>>>>>
>>>>> Changlog from v2:
>>>>> - removed not used pdev parameter from cdnsp_read/wite_64 functions
>>>>> - fixed incorrect value assigned to CDNSP_ENDPOINTS_NUM (32 -> 31)
>>>>> - replaced some constant value with CDNSP_ENDPOINTS_NUM macro
>>>>> - replaced 'true' with '1' in bits description in cdnsp-gadget.h file
>>>>> - fixed some typos
>>>>> - some other less important changes suggested by Peter Chen
>>>>
>>>> Hi Pawel,
>>>>
>>>> I have updated my -next tree as the latest usb-next tree which v5.10-rc4
>>>> is included, would you please rebase my tree and send again, I could apply your
>>>> patches and test, if test could pass, I will apply it to my -next tree.
>>>> You don't need to rebase again since it is a huge patch set, will take some
>>>> efforts for rebase.
>>>>
>>>
>>> I'll try to post it tomorrow.
>>
>> Pawel, have you tested TI J7 for regressions after this series? After
>> your latest changes, can you post a tree which someone in TI can test?
> 
> No I haven't test it on J7.  For testing I'm using PCIe based platform for
> both cnds3 and cdnsp driver. 

Do you have access to J7 EVM? Are you willing to test it there to make
sure nothing broke?

> 
> Why you can't use the latest kernel version and current series ? 

Sure. Let me try that. Looking at some other traffic on this thread, I
was not sure where this applies. So, this applies to latest of Linus's
tree? I re-read the cover letter but cannot find this information.

Thanks,
Sekhar
