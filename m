Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED2C446DE5A
	for <lists+linux-usb@lfdr.de>; Wed,  8 Dec 2021 23:24:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233176AbhLHW2b (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Dec 2021 17:28:31 -0500
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:32222 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229533AbhLHW2a (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Dec 2021 17:28:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1639002296;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=5FZQ9q6pI30tAT8LPhHIX1LZdLQPCa9ocXuC/Zmueq8=;
        b=nUryQwfS+Vk731Ef5xSC8utxBnMFQC0COldwawp9rmFiloZ9x/EcWWAuSt2/A5FkdLUu5l
        0lt4oisN4EOJOL+plkYYL2jNc++ygRGjY92maPT2zkYO/03+gxIvAS5G7FmUyIrIs2a6MP
        8IN3aqpjKn/4I/r/N2qKmgdsHnp1wPU=
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-9-zaoGtEXPMHeHCRw18CeYZA-1; Wed, 08 Dec 2021 23:24:55 +0100
X-MC-Unique: zaoGtEXPMHeHCRw18CeYZA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pa+Zz3F4n/hBIph5mP1i6qtlo395CJDt3i8wGj9a3Wq8vKM7Tz7hYrusKb7hfpoykIINyOMvjv2D8ItfxgAfSFQteUnFU2NqeDRxW3eq6dGSqj7xNhZmHOs9q0v7MQfFrTkpLj9+SSLHmDsILwMfMYBL5pPclMraaUEIkDbv2N7mBiCi7jKU0Uj4nMNuJslLEDPnK8A6Jb6dv87nVGoZ/5oDERSe0hpd91EKWCBKLdXE9iutWFJ0tTGvJLCqex1i4anIaxJga5FeLo6Ik57LWoGxSTE4g6X7BI2agJ1UVIPF8hVJ54aLGZgZbuGX534KyZpoRsNmvxbIgAQVbS+2gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5FZQ9q6pI30tAT8LPhHIX1LZdLQPCa9ocXuC/Zmueq8=;
 b=Nzx12hmKF7MmkQgoE3UcvOUwExGrQGI3uBlhd9K/LxcuVUMcTARDhbvwp87gEwPx15+ZC8BekCK59Aivclq2V+0XCvO0HaUh4zrKEKkZH5MA2EBkfMZ2bf61hCJoRNdRVynZ9ZZHNwiXS/cyj3YI9i6Jvic5mxets39LtDZjsvGSlLcAh2TJuVfUKPKR10Ej7EqqDsUIQ4b3uBduPzyCT7RsAJr8vLT5K688YztVpmwNuI7gJk6L0br4bLRw4tmzDqPHTT7xvSy4mNnEK4Gacl+6KuE+mcyaXrAlEqAoOIejid9yed+VvHvhQOL7Td93olFIZHfMArOGCcFWjW8Kkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from DB7PR04MB5050.eurprd04.prod.outlook.com (2603:10a6:10:22::23)
 by DB8PR04MB6492.eurprd04.prod.outlook.com (2603:10a6:10:109::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Wed, 8 Dec
 2021 22:24:52 +0000
Received: from DB7PR04MB5050.eurprd04.prod.outlook.com
 ([fe80::e9d6:1be9:d046:af1]) by DB7PR04MB5050.eurprd04.prod.outlook.com
 ([fe80::e9d6:1be9:d046:af1%7]) with mapi id 15.20.4755.024; Wed, 8 Dec 2021
 22:24:52 +0000
Subject: Re: [RFC]first draft of the new driver writing guide
To:     Jonathan Corbet <corbet@lwn.net>, Oliver Neukum <oneukum@suse.com>,
        linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Hortmann <philipp.g.hortmann@gmail.com>,
        "Theodore Y. Ts'o" <tytso@mit.edu>
References: <601d2a8b-9d67-1d4f-41d4-ee71f4efa9ea@suse.com>
 <87pmq7xdak.fsf@meer.lwn.net>
From:   Oliver Neukum <oneukum@suse.com>
Message-ID: <b7039e51-d57f-1132-5e1b-78767b3a5728@suse.com>
Date:   Wed, 8 Dec 2021 23:24:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <87pmq7xdak.fsf@meer.lwn.net>
Content-Type: multipart/mixed;
 boundary="------------1B84478CFEF74181526E8364"
Content-Language: en-US
X-ClientProxiedBy: AS9PR0301CA0037.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::22) To DB7PR04MB5050.eurprd04.prod.outlook.com
 (2603:10a6:10:22::23)
MIME-Version: 1.0
Received: from localhost.localdomain (2001:a61:3b82:1901:9d6b:5ffd:1b6b:2163) by AS9PR0301CA0037.eurprd03.prod.outlook.com (2603:10a6:20b:469::22) with Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport; Wed, 8 Dec 2021 22:24:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75d4cc96-91ba-4bb8-81b5-08d9ba998dbe
X-MS-TrafficTypeDiagnostic: DB8PR04MB6492:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS: <DB8PR04MB6492D75F64AE886ACA94B07CC76F9@DB8PR04MB6492.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x8As/4PrqBFpBS2sQYeXOdKWjaT9WK+NBvayrt6C8Wo3cl2p0/3n73d+5xdiXnVCsnlBKKw4VIMoqlwAD8WN2ePh0XcTgb4PtKmQMdyoVhn/QsdLV9rO9a1ddvQFcl46hGiikP/tLvoE2X7OQqG804mcC3u1KwelQ/lv+3voiWe+M6cGXtyD9P/Q57x8OJ0RcDUUSiQtvz36R0wUDXPFn2ZfEhQsywpUMEWwbPBQOOEOrgFkGJgMPbRKnlkRF8mJ3KB7yCE2vj+VjDF/sUWANbDOLzIRZ8N+fjS96uuz93aLGOPoAQemfoLyXYDjgtr9iEO8zMkaCM+gY1e2vGmo+vZERSv+HLEGF7mVR32SwSnicKGqIRCb+ZScNhMB3bzMJGUD0bb7FegCJhWE7wGxgTS3PEqA+Lpvgx2PYSOULjS6wQwvxNiQq2neujYgmkFL91k3jkB7WrFb5kimPkBZwN3fRCpXXi0eMgxeNq2x5kW+D/fvpp1qfkZPDDU4T/g6LfdnW/afLa4AEzSScAogmx90it0dQca87SalAQtYAauRg0V6yHL1SZfnVRST1r72+i5hOGCoSwWW4PgFU8/ud3Kd4lErRbGFuTRpetlk3OGCyrAfRGnPotD4pefEgC7BF7pZ0kLl6Pz+9U6ovkTFud8/R74kCFnVcN2Ldl5Aln7du+7zx7KOENsL5OBOQOaSdAt7wAvIETIYknxXSYa8MbezXgae9+aEbYN4F7hH1VNm9JAWQrTNdxIHEyAkll/xJ2HckdqcqizE6LP9E9dmXS2X0zpimTFHYMzWucyogtDpLuyPNKCGEjiGctlpIBHi
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5050.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(966005)(186003)(31686004)(235185007)(5660300002)(6512007)(83380400001)(53546011)(6506007)(36756003)(4326008)(30864003)(8936002)(38100700002)(33964004)(110136005)(66946007)(86362001)(31696002)(66556008)(316002)(6486002)(8676002)(54906003)(508600001)(2616005)(66476007)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjFWVUI1cUorR1AzU1VJMnptRHpRZU5yMUR2elBrU0cwRHcyZ2IvSTUwN3Nx?=
 =?utf-8?B?MDVmaG9QUTJNTCthRWVoREE0cWpJekRQb1R1bFYrV3NZazl2MDlyeU13TFNT?=
 =?utf-8?B?WFE1bFVGWEFyR3FMd0JMd3pzTTU1dmlocU5RNlgxZldNS2JvSFVSRVUwMTV6?=
 =?utf-8?B?UEt3ei9rWm82YjZxUXVOWm5yODMrNnVJVWMvSEZkSk1ja1BYQUkwazM5cm11?=
 =?utf-8?B?TTVibUlyd3JrTzJMOEJYcmRza21HV00vOXR6U0x5cEtnVW1CbXBYS0tpdDQ0?=
 =?utf-8?B?V1d4MzhkN2o1ZktHU1dRWFlsalEwRkpCemc1anRubDZ0L21BUWJMMVgxRU9D?=
 =?utf-8?B?M0RzTTkvbWVMYXJiMzZWOFdUSWluejVRVVJBUG4zQXV4Sk0xaXVWeW1vTjF5?=
 =?utf-8?B?czAxZ3hxdHRNY2JPWkt6N0hXdWVMczVCb1pVR2F3OWFDZERRaC9UNVQySWhl?=
 =?utf-8?B?aFpMRGtoVVZmMG1XVk9uUE53YUxhUlYya1BiNW1VT09PQXRnWWJMU1RJM1JD?=
 =?utf-8?B?QVpjY3hiTmxoWU1wdzliRXM2MkR1MFBHM0dCNDg2ZzVJaG1oOU1FTDR1QWQv?=
 =?utf-8?B?ZEVFdDdIYkpIcFRzdW9qSkVyWVFMaFJhbEUvUWR3ODNta3RXcDNCTzN3Skdx?=
 =?utf-8?B?N2w5NlFKOG5SaHRaamxnVjhoTWRlYzlrY1Z2Q1hXaUFxcXNSbldmcVB2c1BZ?=
 =?utf-8?B?NTlWTlBCM0R5SzFDbEw4cVU1emlMSzVQRyswM1UwUEQzelYvWU42aDUrSkhk?=
 =?utf-8?B?TEZocU4zc2dwMWVlRDJKRmpEUG12cUV4eFgwVERlYkxKRFZpK0tLd09SL0hS?=
 =?utf-8?B?YldhOVJaVExveDI1VFNXUy9sVEdDUjZFQTFKOGRHSnhxTkVNcEV1cHF4cWFK?=
 =?utf-8?B?UVFlK0x4VCswS05JQVMzczh2QzRWNVRIdm56M2pwaFd3bGhuckZicU54Z0xl?=
 =?utf-8?B?WHA4b3RDZjh6L0FjUzU2ZUFGS0k4eEJMVktoaGdlblcrWnN2QmtGWTVFVmJm?=
 =?utf-8?B?TW55OGdIR3czWU90S2ZuTGFBTmNqOXplc0ZnbUpheXQrQTFHMWIwaSs3ejRU?=
 =?utf-8?B?N0F0MXhQeDgyZmVzWkZVRnc3N2pvN3h2NFNhQmpFZEwvT25wV1pxcWJ1TUVx?=
 =?utf-8?B?RDE0K0pTVGNiSUtFMVk0QUVzcm12Q1Q0WGFqVlNzVXlCbjcwUTF0U05BR214?=
 =?utf-8?B?bXR3TzNtNTI1dktNVXplL05WcE1GcTF0a3pzUVNKajJwbTFtUEtpdDRLWFhj?=
 =?utf-8?B?NXlONHV5VDAwVE1OZkNIdXJiM2VxSDY1Q0dnUnNXZGhZUmJ6TDIrTndsbmhz?=
 =?utf-8?B?ZnBqQTJKbVNXMHFSTmp1UWVWSXVOMFkybmJTK1p6b25aeEt0OWVnMkM1UWhj?=
 =?utf-8?B?OW0rWEJFYk9IbjhyZnM2enQzSzg1TXFoSGwyc1N1d2hicGhkL0JvT3YrRFFi?=
 =?utf-8?B?RGhUWHR1MTVEZmpYVFNDL0xCZWJ0SWptUjdSc2xPa0xRSUIzeDBvYWpBK0lx?=
 =?utf-8?B?WDdacXZCUW1DemtiOCttS3Z4b0FQSjJXSG1EbDRBUnBQSmFMaThFMm5oa0V3?=
 =?utf-8?B?ZDlpa25QOXlnRGNjWEpLWi9SOU9QMkk5SG9YOG4rSnFPZlFmVHNLYUM2VTgz?=
 =?utf-8?B?QjgwOWVORU1JeWovOTFzUTVzOU9rREFXYVdrQ3ppb2hSOUpiYzh4bWE2TXpR?=
 =?utf-8?B?WDcySFEwK2dSSVJHeXNpZDlLT3N2OXc2UDlidEVHQVd1Wkl6L05zZldQaTJa?=
 =?utf-8?B?VUlybUszYXNJcFoxTDhDSFp1MXZRY1lSejNnWTErd04wakVGY2pVV2lvZGRJ?=
 =?utf-8?B?YXhBSjFteks1d0ZzVzh1ZTJEQUJwSmdhQkN2WDBFUVppbDNXNDZueG9TL3BJ?=
 =?utf-8?B?WE95THdEY09VclBOcFVkbTh5MzlKL0ZjbFppSnFlaVJ6SE5DZCtzT3Q4YldJ?=
 =?utf-8?B?UDQzaGlJa1JrUnFuL1ZtSnBNR2s1STBXUTM5RlNaOFd5bldYTXdTemgrOWo5?=
 =?utf-8?B?aE13Z0VKOFJuaXBCSG91bDl4N2UwN0RuaUpSNHF1eE5oR3N0RWM5YXJ3Vkta?=
 =?utf-8?B?VFlzaUV0Sm5NTmtXS25tVXBkUkwxU1l4MHMwaVc4OHZGWTdRZ2RwNkwya2wx?=
 =?utf-8?B?akxISmlhTDh5d0pSalZ1YWs1bi84V2RCKzNmeWNRRkdKMytqRnV6UG9FQWhm?=
 =?utf-8?B?SzZUSE1nbDRnR3g4NElESVR4OHRTRlZOTkpJMzNlUWI4WjhydmtFZzNQWmtF?=
 =?utf-8?Q?8SXvPxyta+qYZbtxfFUHEQ16v8yXUPzIswM1AUgyXo=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75d4cc96-91ba-4bb8-81b5-08d9ba998dbe
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5050.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2021 22:24:52.4528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TeukxI7WwgNYlWu2uU2aL+/MfQOMLUP34RMbJSzLMabrV/bRQ307XgqDXcalK2aEjsHORemOHbVeABytEoyMcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6492
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--------------1B84478CFEF74181526E8364
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit


On 08.12.21 17:38, Jonathan Corbet wrote:
> Glad to see work on the docs!  Some comments, mostly nits...I'm


Adding the new version. Things I am not commenting upon
I have changed as you have suggested.

>> static struct usb_driver uas_driver = {
>>     .name = "uas",
>>     .probe = uas_probe,
>>     .disconnect = uas_disconnect,
>>     .pre_reset = uas_pre_reset,
>>     .post_reset = uas_post_reset,
>>     .suspend = uas_suspend,
>>     .resume = uas_resume,
>>     .reset_resume = uas_reset_resume,
>>     .drvwrap.driver.shutdown = uas_shutdown,
>>     .id_table = uas_usb_ids,
>> };
> This, of course, will need to be indented to render properly; there are
> others with the same problem.
How?
>
>
>> The variable name is a string that describes the driver. It is used in
>> informational messages printed to the system log. Within the system it has
>> no further function.
> Is it worth considering just pulling in the kerneldoc description of
> this structure rather than repeating (parts of) it here?

I think not. I see the kerneldocs as the "how" and this document as the
"why".
If I repeat kerneldocs, I would on the contrary cut that part out.

> We should probably show coding-style-compliant comments :)
I am afraid I have to quote what is actually there
> Overall, the idea of taking code from real drivers seems like good one,

OK, so it looks like there is objection to deleting the skeleton driver.
Technically adding documentation does not depend on it.

Should I write something based on actual examples while keeping the
text about the skeleton driver?

> but I worry that jumping between multiple drivers might confuse the
> points a bit.  Might it be better to pick a single one and us it
> everywhere?
Part of the purpose of this exercise is to show how to adapt to the
requirements of different devices and drivers
> Also, how are you going to keep the document up to date as the driver
> itself changes?  There are mechanisms in Sphinx to extract code directly
> from the source files; we don't really use them, so far, but could maybe
> consider it.  That would keep the (rendered) document current at the
> cost of significantly reducing the readability of the plain-text
> version.
I am not going to tell the experts and maintaiers of documentation how
to keep it maintained. Patches are welcome.

Some questions if I may

1. Part of this is strictly speaking about how to write a hotplugging
driver,
not specific to USB. Should I split the document?

2. Should I write more about reasons and design?

    Regards
        Oliver



.. _writing-usb-driver:

==========================
Writing USB Device Drivers
==========================

:Author: Greg Kroah-Hartman
:Author: Oliver Neukum

Introduction
============

The Linux USB subsystem has grown from supporting only two different
types of devices in the 2.2.7 kernel (mice and keyboards), to dozens
of different types of devices in the 5.x kernels. Linux currently supports
almost all USB class devices (standard types of devices like keyboards,
mice, modems, printers and speakers) and an ever-growing number of
vendor-specific devices (such as USB to serial converters, digital
cameras, Ethernet devices and MP3 players). For a full list of the
different USB devices currently supported, see Resources.

The remaining kinds of USB devices that do not have support on Linux are
almost all vendor-specific devices. Each vendor decides to implement a
custom protocol to talk to their device, so a custom driver usually
needs to be created. Some vendors are open with their USB protocols and
help with the creation of Linux drivers, while others do not publish
them, and developers are forced to reverse-engineer. See Resources for
some links to handy reverse-engineering tools.

This article tries to show best practices in writing USB drivers
based on examples taken from various drivers in the kernel. I will
concentrate on those who use a simple character device as an interface
to user space to not obscure the specifics of USB with those of
other subsystems.

Linux USB Basics
================

If you are going to write a Linux USB driver, please become familiar
with the USB protocol specification. It can be found, along with many
other useful documents, at the USB home page (see Resources). An
excellent introduction to the Linux USB subsystem can be found at the
USB Working Devices List (see Resources). It explains how the Linux USB
subsystem is structured and introduces the reader to the concept of USB
URBs (USB Request Blocks), which are essential to USB drivers.

The first thing a Linux USB driver needs to do is register itself with
the Linux USB subsystem, giving it some information about which devices
the driver supports and which functions to call when a device supported
by the driver is inserted or removed from the system. All of this
information is passed to the USB subsystem in the "struct usb_driver"
structure. Just about any driver can serve as an example::

static struct usb_driver uas_driver = {
    .name = "uas",
    .probe = uas_probe,
    .disconnect = uas_disconnect,
    .pre_reset = uas_pre_reset,
    .post_reset = uas_post_reset,
    .suspend = uas_suspend,
    .resume = uas_resume,
    .reset_resume = uas_reset_resume,
    .drvwrap.driver.shutdown = uas_shutdown,
    .id_table = uas_usb_ids,
};


The variable name is a string that describes the driver. It is used in
informational messages printed to the system log. Within the system it has
no further function.

The next two function pointers, probe and disconnect are called in
response to
an addition event, that is when a device is added or removed to the system
or a new driver loaded and a match occurs.
Which devices match a driver is controlled by the id_table variable.

The actual registration with the USB subsystem referencing the declared
table is done either via the module_usb_driver(), as shown in the chaoskey
driver::

static struct usb_driver chaoskey_driver = {
    .name = DRIVER_SHORT,
    .probe = chaoskey_probe,
    .disconnect = chaoskey_disconnect,
    .suspend = chaoskey_suspend,
    .resume = chaoskey_resume,
    .reset_resume = chaoskey_resume,
    .id_table = chaoskey_table,
    .supports_autosuspend = 1,
};

module_usb_driver(chaoskey_driver);

It is also possible to define an __init function called when the module
containing the driver is loaded and to register the driver in that::

static int __init uas_init(void)
{
    int rv;

    workqueue = alloc_workqueue("uas", WQ_MEM_RECLAIM, 0);
    if (!workqueue)
        return -ENOMEM;

    rv = usb_register(&uas_driver);
    if (rv) {
        destroy_workqueue(workqueue);
        return -ENOMEM;
    }

    return 0;
}

module_init(uas_init);

The USB driver is then registered with a call to usb_register(). This manner
of initialisation should only be used if resources for the whole driver,
like
the workqueue in UAS, need to be initialised or allocated.


When the driver is unloaded from the system, it needs to deregister
itself with the USB subsystem. This is done with usb_deregister()
function::

static void __exit uas_exit(void)
{
    usb_deregister(&uas_driver);
    destroy_workqueue(workqueue);
}

A driver shall bother with this only if it does not use module_usb_driver().


To enable the linux-hotplug system to load the driver automatically when
the device is plugged in, you need to create a ``MODULE_DEVICE_TABLE``.
The following code tells the hotplug scripts that this module supports
device with a given specific vendor and product ID::

static const struct usb_device_id chaoskey_table[] = {
    { USB_DEVICE(CHAOSKEY_VENDOR_ID, CHAOSKEY_PRODUCT_ID) },
    { USB_DEVICE(ALEA_VENDOR_ID, ALEA_PRODUCT_ID) },
    { },
};
MODULE_DEVICE_TABLE(usb, chaoskey_table);

Drivers typically reuse the table given to the USB subsystem for matching
for this purpose.

There are other macros that can be used in describing a struct
:c:type:`usb_device_id` for drivers that support a whole class of USB
drivers. See :ref:`usb.h <usb_header>` for more information on this.

Device operation
================

When a device is plugged in that matches the device ID
pattern that your driver registered with the USB core, the probe
function is called. The "struct usb_interface" structure and
the interface ID are passed to the function::

static int uas_probe(struct usb_interface *intf, const struct
usb_device_id *id)


The driver now needs to verify that this device is actually one that it
can accept. If so, it returns 0. If not, or if any error occurs during
initialization, an errorcode (such as ``-ENOMEM`` or ``-ENODEV``) is
returned from the probe function.

Drivers usually start out allocating memory for a representation
of that device in kernel space::

static int usblp_probe(struct usb_interface *intf,
               const struct usb_device_id *id)
{
    struct usb_device *dev = interface_to_usbdev(intf);
    struct usblp *usblp;
    int protocol;
    int retval;

    /* Malloc and start initializing usblp structure so we can use it
     * directly. */
    usblp = kzalloc(sizeof(struct usblp), GFP_KERNEL);
    if (!usblp) {
        retval = -ENOMEM;
        goto abort_ret;
    }

Then they check out the suitability of the device::

    protocol = usblp_select_alts(usblp);
    if (protocol < 0) {
        dev_dbg(&intf->dev,
            "incompatible printer-class device 0x%4.4X/0x%4.4X\n",
            le16_to_cpu(dev->descriptor.idVendor),
            le16_to_cpu(dev->descriptor.idProduct));
        retval = -ENODEV;
        goto abort;
    }

And penultimately they may put the device into a correct initial state::

    /* Setup the selected alternate setting and endpoints. */
    if (usblp_set_protocol(usblp, protocol) < 0) {
        retval = -ENODEV;    /* ->probe isn't ->ioctl */
        goto abort;
    }

Only as the very last step may the device be registered with the USB
subsystem,
if a character device is intended as an interface to user space::

    retval = usb_register_dev(intf, &usblp_class);
    if (retval) {
        dev_err(&intf->dev,
            "usblp: Not able to get a minor (base %u, slice default): %d\n",
            USBLP_MINOR_BASE, retval);
        goto abort_intfdata;
    }

or with another subsystem, like SCSI core in UAS::

    result = scsi_add_host(shost, &intf->dev);
    if (result)
        goto free_streams;

At this point your device is live and your driver must be fully operational.
No mutual exclusion to probe() is provided.

Conversely, when the device is removed from the USB bus, the disconnect
function is called with the interface pointer. The driver needs to shut down
any pending URBs that are in the USB system.
Remember that a device may still be open at this stage as far as user space
is concerned. Subsequent operations need to fail gracefully and enough state
retained for this purpose. That means some deferred cleanup in those cases.

Now that the device is plugged into the system and the driver is bound
to the device, any of the functions in the "struct file_operations"
structure
that were passed to the USB subsystem will be called from a user program
trying to talk to the device. The first function called will be open(), as
the program tries to open the device for I/O. We increment our private
usage count and save a pointer to our internal structure in the file
structure. This is done so that future calls to file operations will
enable the driver to determine which device the user is addressing. All
of this is done in the following example::

static int chaoskey_open(struct inode *inode, struct file *file)
{
    struct chaoskey *dev;
    struct usb_interface *interface;

    /* get the interface from minor number and driver information */
    interface = usb_find_interface(&chaoskey_driver, iminor(inode));
    if (!interface)
        return -ENODEV;

    usb_dbg(interface, "open");

    dev = usb_get_intfdata(interface);
    if (!dev) {
        usb_dbg(interface, "open (dev)");
        return -ENODEV;
    }

    file->private_data = dev;
    mutex_lock(&dev->lock);
    ++dev->open;
    mutex_unlock(&dev->lock);

Multiple calls can race. Proper locking needs to be used in the driver.
A private count needs to be maintained because the driver must be able
to determine when the last user of an unplugged device goes away.

After the open function is called, the read and write functions are
called to receive and send data to the device. We are using cdc-wdm
as an example::

static ssize_t wdm_write
(struct file *file, const char __user *buffer, size_t count, loff_t *ppos)

Data transfers to devices are described, initiated and controlled by means
of a data structure called URB, which a separate tutorial is provided for.
A write operation basically splits up its data into URBs and submits them
in the right order.
The basic operation is complicated by the requirements of the USB subsystem
that URBs not be used while power management operations or resets are
under way. Drivers need to heck for such conditions or make sure that the
device be not in power save::

    if (test_bit(WDM_DISCONNECTING, &desc->flags)) {
        rv = -ENODEV;
        goto out_free_mem_lock;
    }

    r = usb_autopm_get_interface(desc->intf);
    if (r < 0) {
        rv = usb_translate_errors(r);
        goto out_free_mem_lock;
    }

and::

    if (test_bit(WDM_RESETTING, &desc->flags))
        r = -EIO;

The usb_bulk_msg() function can be very useful for doing single reads
or writes to a device; however, if you need to read or write constantly to
a device, it is recommended to set up your own URBs and submit them to
the USB subsystem. Not using your own URBs prevents you from interrupting
ongoing transfers and does not allow you to use the ful bus bandwidth.

Whenever user space closes a file, the release operation is called::

 static int chaoskey_release(struct inode *inode, struct file *file)
 
 In addition to a conventional device, which needs to only stop IO,
 USB need to handle that a device has already gone away. In that case
 the driver needs to remove any reference to the device once the last user
 closes the device::
 
     --dev->open;

    if (!dev->present) {
        if (dev->open == 0) {
            mutex_unlock(&dev->lock);
            chaoskey_free(dev);
        } else
            mutex_unlock(&dev->lock);
    } else
        mutex_unlock(&dev->lock);

One of the more difficult problems that USB drivers must be able to
handle smoothly is the fact that the USB device may be removed from the
system at any point in time, even if a program is currently talking to
it. It needs to be able to shut down any current reads and writes and
notify the user-space programs that the device is no longer there. The
following code (function ``chaoskey_disconnect``) is an example of how to do
this::

static void chaoskey_disconnect(struct usb_interface *interface)
{
    struct chaoskey    *dev;

    usb_dbg(interface, "disconnect");
    dev = usb_get_intfdata(interface);
    if (!dev) {
        usb_dbg(interface, "disconnect failed - no dev");
        return;
    }

    if (dev->hwrng_registered)
        hwrng_unregister(&dev->hwrng);

    usb_deregister_dev(interface, &chaoskey_class);

    usb_set_intfdata(interface, NULL);
    mutex_lock(&dev->lock);

    dev->present = false;
    usb_poison_urb(dev->urb);

    if (!dev->open) {
        mutex_unlock(&dev->lock);
        chaoskey_free(dev);
    } else
        mutex_unlock(&dev->lock);

    usb_dbg(interface, "disconnect done");
}

First, the device is deregistered from the system::

    usb_deregister_dev(interface, &chaoskey_class);

That step prevents any new users of the device and generates an event
reported to user space.

Second the device is internally marked not present, thereby entering a kind
of undead state::

    usb_set_intfdata(interface, NULL);
    mutex_lock(&dev->lock);

    dev->present = false;

Third any present and future IO is terminated::

    usb_poison_urb(dev->urb);

Only in the last step is the internal representation removed, if and
only if, no users are left::

    if (!dev->open) {
        mutex_unlock(&dev->lock);
        chaoskey_free(dev);

These operations must be performed in this specific order.


Operations on the whole device
==============================

Keep in mind that drivers for USB devices are technically drivers for
interfaces of USB devices. Some operations, namely reset and power
management apply to the whole device. For those the drivers must
coordinate. This is done in such a way that before an operation one
function is called and after an operation another function is called.

For reset the following methods are provided::

    .pre_reset = uas_pre_reset,
    .post_reset = uas_post_reset,

After pre_reset() the device must have ceased all IO and may not begin
new IO. This is done here::

static int wdm_pre_reset(struct usb_interface *intf)
{
    struct wdm_device *desc = wdm_find_device(intf);

    /*
     * we notify everybody using poll of
     * an exceptional situation
     * must be done before recovery lest a spontaneous
     * message from the device is lost
     */
    spin_lock_irq(&desc->iuspin);
    set_bit(WDM_RESETTING, &desc->flags);    /* inform read/write */
    set_bit(WDM_READ, &desc->flags);    /* unblock read */
    clear_bit(WDM_IN_USE, &desc->flags);    /* unblock write */
    desc->rerr = -EINTR;
    spin_unlock_irq(&desc->iuspin);
    wake_up_all(&desc->wait);

And all new IO must be prevented::

    poison_urbs(desc);
    cancel_work_sync(&desc->rxwork);
    cancel_work_sync(&desc->service_outs_intr);

After post_reset() IO can be restarted::

static int wdm_post_reset(struct usb_interface *intf)
{
    struct wdm_device *desc = wdm_find_device(intf);
    int rv;

    unpoison_urbs(desc);
    clear_bit(WDM_OVERFLOW, &desc->flags);
    clear_bit(WDM_RESETTING, &desc->flags);

That may involve bringing the device back to an operable state,
from the default state like UAS shows::

    err = uas_configure_endpoints(devinfo);
    if (err && err != -ENODEV)
        shost_printk(KERN_ERR, shost,
                 "%s: alloc streams error %d after reset",
                 __func__, err);

The driver must also somehow notify that the device may have lost data
or state. That can be done either in pre_reset(), like cdc-wdm does::

     spin_lock_irq(&desc->iuspin);
    set_bit(WDM_RESETTING, &desc->flags);    /* inform read/write */
    set_bit(WDM_READ, &desc->flags);    /* unblock read */
    clear_bit(WDM_IN_USE, &desc->flags);    /* unblock write */
    desc->rerr = -EINTR;
    spin_unlock_irq(&desc->iuspin);

or it can be done in post reset, like UAS does::

    /* we must unblock the host in every case lest we deadlock */
    spin_lock_irqsave(shost->host_lock, flags);
    scsi_report_bus_reset(shost, 0);
    spin_unlock_irqrestore(shost->host_lock, flags);

The operations for power management are covered in their own article.


Conclusion
==========

Writing Linux USB device drivers is not a difficult task as the
chaoskey or usblp drivers show. These drivers, combined with the other
current
USB drivers, should provide enough examples to help a beginning author
create a working driver in a minimal amount of time. The linux-usb-devel
mailing list archives also contain a lot of helpful information.

Resources
=========

The Linux USB Project:
http://www.linux-usb.org/

Linux Hotplug Project:
http://linux-hotplug.sourceforge.net/

linux-usb Mailing List Archives:
https://lore.kernel.org/linux-usb/

Programming Guide for Linux USB Device Drivers:
https://lmu.web.psi.ch/docu/manuals/software_manuals/linux_sl/usb_linux_programming_guide.pdf

USB Home Page: https://www.usb.org


--------------1B84478CFEF74181526E8364
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-Documentation-change-examples-to-real-drivers-to-del.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-Documentation-change-examples-to-real-drivers-to-del.pa";
 filename*1="tch"

From b02271da7b8b1e10af7c16ed43a9adc6127f5f28 Mon Sep 17 00:00:00 2001
From: Oliver Neukum <oneukum@suse.com>
Date: Wed, 8 Dec 2021 15:25:25 +0100
Subject: [PATCH] Documentation: change examples to real drivers to delete
 usb-skeleton

usb-skeleton has become a victim of bitrot and this would set in again,
even if it were fixed and the documentation updated. Hence its use as
a source of examples in the documentation is removed and replaced
by examples from actual drivers in their current state.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 .../driver-api/usb/writing_usb_driver.rst     | 583 ++++++++++++------
 1 file changed, 379 insertions(+), 204 deletions(-)

diff --git a/Documentation/driver-api/usb/writing_usb_driver.rst b/Documentation/driver-api/usb/writing_usb_driver.rst
index 95c4f5d14052..141f7f0250cf 100644
--- a/Documentation/driver-api/usb/writing_usb_driver.rst
+++ b/Documentation/driver-api/usb/writing_usb_driver.rst
@@ -5,13 +5,14 @@ Writing USB Device Drivers
 ==========================
 
 :Author: Greg Kroah-Hartman
+:Author: Oliver Neukum
 
 Introduction
 ============
 
 The Linux USB subsystem has grown from supporting only two different
-types of devices in the 2.2.7 kernel (mice and keyboards), to over 20
-different types of devices in the 2.4 kernel. Linux currently supports
+types of devices in the 2.2.7 kernel (mice and keyboards), to dozens
+of different types of devices in the 5.x kernels. Linux currently supports
 almost all USB class devices (standard types of devices like keyboards,
 mice, modems, printers and speakers) and an ever-growing number of
 vendor-specific devices (such as USB to serial converters, digital
@@ -26,14 +27,11 @@ help with the creation of Linux drivers, while others do not publish
 them, and developers are forced to reverse-engineer. See Resources for
 some links to handy reverse-engineering tools.
 
-Because each different protocol causes a new driver to be created, I
-have written a generic USB driver skeleton, modelled after the
-pci-skeleton.c file in the kernel source tree upon which many PCI
-network drivers have been based. This USB skeleton can be found at
-drivers/usb/usb-skeleton.c in the kernel source tree. In this article I
-will walk through the basics of the skeleton driver, explaining the
-different pieces and what needs to be done to customize it to your
-specific device.
+This article tries to show best practices in writing USB drivers
+based on examples taken from various drivers in the kernel. I will
+concentrate on those who use a simple character device as an interface
+to user space to not obscure the specifics of USB with those of
+other subsystems.
 
 Linux USB Basics
 ================
@@ -44,90 +42,109 @@ other useful documents, at the USB home page (see Resources). An
 excellent introduction to the Linux USB subsystem can be found at the
 USB Working Devices List (see Resources). It explains how the Linux USB
 subsystem is structured and introduces the reader to the concept of USB
-urbs (USB Request Blocks), which are essential to USB drivers.
+URBs (USB Request Blocks), which are essential to USB drivers.
 
 The first thing a Linux USB driver needs to do is register itself with
 the Linux USB subsystem, giving it some information about which devices
 the driver supports and which functions to call when a device supported
 by the driver is inserted or removed from the system. All of this
-information is passed to the USB subsystem in the :c:type:`usb_driver`
-structure. The skeleton driver declares a :c:type:`usb_driver` as::
-
-    static struct usb_driver skel_driver = {
-	    .name        = "skeleton",
-	    .probe       = skel_probe,
-	    .disconnect  = skel_disconnect,
-	    .suspend     = skel_suspend,
-	    .resume      = skel_resume,
-	    .pre_reset   = skel_pre_reset,
-	    .post_reset  = skel_post_reset,
-	    .id_table    = skel_table,
-	    .supports_autosuspend = 1,
-    };
+information is passed to the USB subsystem in the "struct usb_driver"
+structure. Just about any driver can serve as an example::
+
+static struct usb_driver uas_driver = {
+	.name = "uas",
+	.probe = uas_probe,
+	.disconnect = uas_disconnect,
+	.pre_reset = uas_pre_reset,
+	.post_reset = uas_post_reset,
+	.suspend = uas_suspend,
+	.resume = uas_resume,
+	.reset_resume = uas_reset_resume,
+	.drvwrap.driver.shutdown = uas_shutdown,
+	.id_table = uas_usb_ids,
+};
 
 
 The variable name is a string that describes the driver. It is used in
-informational messages printed to the system log. The probe and
-disconnect function pointers are called when a device that matches the
-information provided in the ``id_table`` variable is either seen or
-removed.
-
-The fops and minor variables are optional. Most USB drivers hook into
-another kernel subsystem, such as the SCSI, network or TTY subsystem.
-These types of drivers register themselves with the other kernel
-subsystem, and any user-space interactions are provided through that
-interface. But for drivers that do not have a matching kernel subsystem,
-such as MP3 players or scanners, a method of interacting with user space
-is needed. The USB subsystem provides a way to register a minor device
-number and a set of :c:type:`file_operations` function pointers that enable
-this user-space interaction. The skeleton driver needs this kind of
-interface, so it provides a minor starting number and a pointer to its
-:c:type:`file_operations` functions.
-
-The USB driver is then registered with a call to usb_register(),
-usually in the driver's init function, as shown here::
-
-    static int __init usb_skel_init(void)
-    {
-	    int result;
-
-	    /* register this driver with the USB subsystem */
-	    result = usb_register(&skel_driver);
-	    if (result < 0) {
-		    pr_err("usb_register failed for the %s driver. Error number %d\n",
-		           skel_driver.name, result);
-		    return -1;
-	    }
-
-	    return 0;
-    }
-    module_init(usb_skel_init);
+informational messages printed to the system log. Within the system it has
+no further function.
+
+The next two function pointers, probe and disconnect are called in response to
+an addition event, that is when a device is added or removed to the system
+or a new driver loaded and a match occurs.
+Which devices match a driver is controlled by the id_table variable.
+
+The actual registration with the USB subsystem referencing the declared
+table is done either via the module_usb_driver(), as shown in the chaoskey
+driver::
+
+static struct usb_driver chaoskey_driver = {
+	.name = DRIVER_SHORT,
+	.probe = chaoskey_probe,
+	.disconnect = chaoskey_disconnect,
+	.suspend = chaoskey_suspend,
+	.resume = chaoskey_resume,
+	.reset_resume = chaoskey_resume,
+	.id_table = chaoskey_table,
+	.supports_autosuspend = 1,
+};
+
+module_usb_driver(chaoskey_driver);
+
+It is also possible to define an __init function called when the module
+containing the driver is loaded and to register the driver in that::
+
+static int __init uas_init(void)
+{
+	int rv;
+
+	workqueue = alloc_workqueue("uas", WQ_MEM_RECLAIM, 0);
+	if (!workqueue)
+		return -ENOMEM;
+
+	rv = usb_register(&uas_driver);
+	if (rv) {
+		destroy_workqueue(workqueue);
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+module_init(uas_init);
+
+The USB driver is then registered with a call to usb_register(). This manner
+of initialisation should only be used if resources for the whole driver, like
+the workqueue in UAS, need to be initialised or allocated.
 
 
 When the driver is unloaded from the system, it needs to deregister
 itself with the USB subsystem. This is done with usb_deregister()
 function::
 
-    static void __exit usb_skel_exit(void)
-    {
-	    /* deregister this driver with the USB subsystem */
-	    usb_deregister(&skel_driver);
-    }
-    module_exit(usb_skel_exit);
+static void __exit uas_exit(void)
+{
+	usb_deregister(&uas_driver);
+	destroy_workqueue(workqueue);
+}
+
+A driver shall bother with this only if it does not use module_usb_driver().
 
 
 To enable the linux-hotplug system to load the driver automatically when
 the device is plugged in, you need to create a ``MODULE_DEVICE_TABLE``.
-The following code tells the hotplug scripts that this module supports a
-single device with a specific vendor and product ID::
+The following code tells the hotplug scripts that this module supports
+device with a given specific vendor and product ID::
 
-    /* table of devices that work with this driver */
-    static struct usb_device_id skel_table [] = {
-	    { USB_DEVICE(USB_SKEL_VENDOR_ID, USB_SKEL_PRODUCT_ID) },
-	    { }                      /* Terminating entry */
-    };
-    MODULE_DEVICE_TABLE (usb, skel_table);
+static const struct usb_device_id chaoskey_table[] = {
+	{ USB_DEVICE(CHAOSKEY_VENDOR_ID, CHAOSKEY_PRODUCT_ID) },
+	{ USB_DEVICE(ALEA_VENDOR_ID, ALEA_PRODUCT_ID) },
+	{ },
+};
+MODULE_DEVICE_TABLE(usb, chaoskey_table);
 
+Drivers typically reuse the table given to the USB subsystem for matching
+for this purpose.
 
 There are other macros that can be used in describing a struct
 :c:type:`usb_device_id` for drivers that support a whole class of USB
@@ -136,13 +153,12 @@ drivers. See :ref:`usb.h <usb_header>` for more information on this.
 Device operation
 ================
 
-When a device is plugged into the USB bus that matches the device ID
+When a device is plugged in that matches the device ID
 pattern that your driver registered with the USB core, the probe
-function is called. The :c:type:`usb_device` structure, interface number and
+function is called. The "struct usb_interface" structure and
 the interface ID are passed to the function::
 
-    static int skel_probe(struct usb_interface *interface,
-	const struct usb_device_id *id)
+static int uas_probe(struct usb_interface *intf, const struct usb_device_id *id)
 
 
 The driver now needs to verify that this device is actually one that it
@@ -150,162 +166,321 @@ can accept. If so, it returns 0. If not, or if any error occurs during
 initialization, an errorcode (such as ``-ENOMEM`` or ``-ENODEV``) is
 returned from the probe function.
 
-In the skeleton driver, we determine what end points are marked as
-bulk-in and bulk-out. We create buffers to hold the data that will be
-sent and received from the device, and a USB urb to write data to the
-device is initialized.
+Drivers usually start out allocating memory for a representation
+of that device in kernel space::
+
+static int usblp_probe(struct usb_interface *intf,
+		       const struct usb_device_id *id)
+{
+	struct usb_device *dev = interface_to_usbdev(intf);
+	struct usblp *usblp;
+	int protocol;
+	int retval;
+
+	/* Malloc and start initializing usblp structure so we can use it
+	 * directly. */
+	usblp = kzalloc(sizeof(struct usblp), GFP_KERNEL);
+	if (!usblp) {
+		retval = -ENOMEM;
+		goto abort_ret;
+	}
+
+Then they check out the suitability of the device::
+
+	protocol = usblp_select_alts(usblp);
+	if (protocol < 0) {
+		dev_dbg(&intf->dev,
+			"incompatible printer-class device 0x%4.4X/0x%4.4X\n",
+			le16_to_cpu(dev->descriptor.idVendor),
+			le16_to_cpu(dev->descriptor.idProduct));
+		retval = -ENODEV;
+		goto abort;
+	}
+
+And penultimately they may put the device into a correct initial state::
+
+	/* Setup the selected alternate setting and endpoints. */
+	if (usblp_set_protocol(usblp, protocol) < 0) {
+		retval = -ENODEV;	/* ->probe isn't ->ioctl */
+		goto abort;
+	}
+
+Only as the very last step may the device be registered with the USB subsystem,
+if a character device is intended as an interface to user space::
+
+	retval = usb_register_dev(intf, &usblp_class);
+	if (retval) {
+		dev_err(&intf->dev,
+			"usblp: Not able to get a minor (base %u, slice default): %d\n",
+			USBLP_MINOR_BASE, retval);
+		goto abort_intfdata;
+	}
+
+or with another subsystem, like SCSI core in UAS::
+
+	result = scsi_add_host(shost, &intf->dev);
+	if (result)
+		goto free_streams;
+
+At this point your device is live and your driver must be fully operational.
+No mutual exclusion to probe() is provided.
 
 Conversely, when the device is removed from the USB bus, the disconnect
-function is called with the device pointer. The driver needs to clean
-any private data that has been allocated at this time and to shut down
-any pending urbs that are in the USB system.
+function is called with the interface pointer. The driver needs to shut down
+any pending URBs that are in the USB system.
+Remember that a device may still be open at this stage as far as user space
+is concerned. Subsequent operations need to fail gracefully and enough state
+retained for this purpose. That means some deferred cleanup in those cases.
 
 Now that the device is plugged into the system and the driver is bound
-to the device, any of the functions in the :c:type:`file_operations` structure
+to the device, any of the functions in the "struct file_operations" structure
 that were passed to the USB subsystem will be called from a user program
-trying to talk to the device. The first function called will be open, as
+trying to talk to the device. The first function called will be open(), as
 the program tries to open the device for I/O. We increment our private
 usage count and save a pointer to our internal structure in the file
 structure. This is done so that future calls to file operations will
 enable the driver to determine which device the user is addressing. All
-of this is done with the following code::
+of this is done in the following example::
 
-    /* increment our usage count for the device */
-    kref_get(&dev->kref);
+static int chaoskey_open(struct inode *inode, struct file *file)
+{
+	struct chaoskey *dev;
+	struct usb_interface *interface;
 
-    /* save our object in the file's private structure */
-    file->private_data = dev;
+	/* get the interface from minor number and driver information */
+	interface = usb_find_interface(&chaoskey_driver, iminor(inode));
+	if (!interface)
+		return -ENODEV;
 
+	usb_dbg(interface, "open");
 
-After the open function is called, the read and write functions are
-called to receive and send data to the device. In the ``skel_write``
-function, we receive a pointer to some data that the user wants to send
-to the device and the size of the data. The function determines how much
-data it can send to the device based on the size of the write urb it has
-created (this size depends on the size of the bulk out end point that
-the device has). Then it copies the data from user space to kernel
-space, points the urb to the data and submits the urb to the USB
-subsystem. This can be seen in the following code::
-
-    /* we can only write as much as 1 urb will hold */
-    size_t writesize = min_t(size_t, count, MAX_TRANSFER);
-
-    /* copy the data from user space into our urb */
-    copy_from_user(buf, user_buffer, writesize);
-
-    /* set up our urb */
-    usb_fill_bulk_urb(urb,
-		      dev->udev,
-		      usb_sndbulkpipe(dev->udev, dev->bulk_out_endpointAddr),
-		      buf,
-		      writesize,
-		      skel_write_bulk_callback,
-		      dev);
-
-    /* send the data out the bulk port */
-    retval = usb_submit_urb(urb, GFP_KERNEL);
-    if (retval) {
-	    dev_err(&dev->interface->dev,
-                "%s - failed submitting write urb, error %d\n",
-                __func__, retval);
-    }
-
-
-When the write urb is filled up with the proper information using the
-:c:func:`usb_fill_bulk_urb` function, we point the urb's completion callback
-to call our own ``skel_write_bulk_callback`` function. This function is
-called when the urb is finished by the USB subsystem. The callback
-function is called in interrupt context, so caution must be taken not to
-do very much processing at that time. Our implementation of
-``skel_write_bulk_callback`` merely reports if the urb was completed
-successfully or not and then returns.
-
-The read function works a bit differently from the write function in
-that we do not use an urb to transfer data from the device to the
-driver. Instead we call the :c:func:`usb_bulk_msg` function, which can be used
-to send or receive data from a device without having to create urbs and
-handle urb completion callback functions. We call the :c:func:`usb_bulk_msg`
-function, giving it a buffer into which to place any data received from
-the device and a timeout value. If the timeout period expires without
-receiving any data from the device, the function will fail and return an
-error message. This can be shown with the following code::
-
-    /* do an immediate bulk read to get data from the device */
-    retval = usb_bulk_msg (skel->dev,
-			   usb_rcvbulkpipe (skel->dev,
-			   skel->bulk_in_endpointAddr),
-			   skel->bulk_in_buffer,
-			   skel->bulk_in_size,
-			   &count, 5000);
-    /* if the read was successful, copy the data to user space */
-    if (!retval) {
-	    if (copy_to_user (buffer, skel->bulk_in_buffer, count))
-		    retval = -EFAULT;
-	    else
-		    retval = count;
-    }
-
-
-The :c:func:`usb_bulk_msg` function can be very useful for doing single reads
-or writes to a device; however, if you need to read or write constantly to
-a device, it is recommended to set up your own urbs and submit them to
-the USB subsystem.
+	dev = usb_get_intfdata(interface);
+	if (!dev) {
+		usb_dbg(interface, "open (dev)");
+		return -ENODEV;
+	}
 
-When the user program releases the file handle that it has been using to
-talk to the device, the release function in the driver is called. In
-this function we decrement our private usage count and wait for possible
-pending writes::
+	file->private_data = dev;
+	mutex_lock(&dev->lock);
+	++dev->open;
+	mutex_unlock(&dev->lock);
 
-    /* decrement our usage count for the device */
-    --skel->open_count;
+Multiple calls can race. Proper locking needs to be used in the driver.
+A private count needs to be maintained because the driver must be able
+to determine when the last user of an unplugged device goes away.
 
+After the open function is called, the read and write functions are
+called to receive and send data to the device. We are using cdc-wdm
+as an example::
+
+static ssize_t wdm_write
+(struct file *file, const char __user *buffer, size_t count, loff_t *ppos)
+
+Data transfers to devices are described, initiated and controlled by means
+of a data structure called URB, which a separate tutorial is provided for.
+A write operation basically splits up its data into URBs and submits them
+in the right order.
+The basic operation is complicated by the requirements of the USB subsystem
+that URBs not be used while power management operations or resets are
+under way. Drivers need to heck for such conditions or make sure that the
+device be not in power save::
+
+	if (test_bit(WDM_DISCONNECTING, &desc->flags)) {
+		rv = -ENODEV;
+		goto out_free_mem_lock;
+	}
+
+	r = usb_autopm_get_interface(desc->intf);
+	if (r < 0) {
+		rv = usb_translate_errors(r);
+		goto out_free_mem_lock;
+	}
+
+and::
+
+	if (test_bit(WDM_RESETTING, &desc->flags))
+		r = -EIO;
+
+The usb_bulk_msg() function can be very useful for doing single reads
+or writes to a device; however, if you need to read or write constantly to
+a device, it is recommended to set up your own URBs and submit them to
+the USB subsystem. Not using your own URBs prevents you from interrupting
+ongoing transfers and does not allow you to use the ful bus bandwidth.
+
+Whenever user space closes a file, the release operation is called::
+
+ static int chaoskey_release(struct inode *inode, struct file *file)
+ 
+ In addition to a conventional device, which needs to only stop IO,
+ USB need to handle that a device has already gone away. In that case
+ the driver needs to remove any reference to the device once the last user
+ closes the device::
+ 
+ 	--dev->open;
+
+	if (!dev->present) {
+		if (dev->open == 0) {
+			mutex_unlock(&dev->lock);
+			chaoskey_free(dev);
+		} else
+			mutex_unlock(&dev->lock);
+	} else
+		mutex_unlock(&dev->lock);
 
 One of the more difficult problems that USB drivers must be able to
 handle smoothly is the fact that the USB device may be removed from the
 system at any point in time, even if a program is currently talking to
 it. It needs to be able to shut down any current reads and writes and
 notify the user-space programs that the device is no longer there. The
-following code (function ``skel_delete``) is an example of how to do
+following code (function ``chaoskey_disconnect``) is an example of how to do
 this::
 
-    static inline void skel_delete (struct usb_skel *dev)
-    {
-	kfree (dev->bulk_in_buffer);
-	if (dev->bulk_out_buffer != NULL)
-	    usb_free_coherent (dev->udev, dev->bulk_out_size,
-		dev->bulk_out_buffer,
-		dev->write_urb->transfer_dma);
-	usb_free_urb (dev->write_urb);
-	kfree (dev);
-    }
-
-
-If a program currently has an open handle to the device, we reset the
-flag ``device_present``. For every read, write, release and other
-functions that expect a device to be present, the driver first checks
-this flag to see if the device is still present. If not, it releases
-that the device has disappeared, and a ``-ENODEV`` error is returned to the
-user-space program. When the release function is eventually called, it
-determines if there is no device and if not, it does the cleanup that
-the ``skel_disconnect`` function normally does if there are no open files
-on the device (see Listing 5).
-
-Isochronous Data
-================
+static void chaoskey_disconnect(struct usb_interface *interface)
+{
+	struct chaoskey	*dev;
+
+	usb_dbg(interface, "disconnect");
+	dev = usb_get_intfdata(interface);
+	if (!dev) {
+		usb_dbg(interface, "disconnect failed - no dev");
+		return;
+	}
+
+	if (dev->hwrng_registered)
+		hwrng_unregister(&dev->hwrng);
+
+	usb_deregister_dev(interface, &chaoskey_class);
+
+	usb_set_intfdata(interface, NULL);
+	mutex_lock(&dev->lock);
+
+	dev->present = false;
+	usb_poison_urb(dev->urb);
+
+	if (!dev->open) {
+		mutex_unlock(&dev->lock);
+		chaoskey_free(dev);
+	} else
+		mutex_unlock(&dev->lock);
+
+	usb_dbg(interface, "disconnect done");
+}
+
+First, the device is deregistered from the system::
+
+	usb_deregister_dev(interface, &chaoskey_class);
+
+That step prevents any new users of the device and generates an event
+reported to user space.
+
+Second the device is internally marked not present, thereby entering a kind
+of undead state::
+
+	usb_set_intfdata(interface, NULL);
+	mutex_lock(&dev->lock);
+
+	dev->present = false;
+
+Third any present and future IO is terminated::
+
+	usb_poison_urb(dev->urb);
+
+Only in the last step is the internal representation removed, if and
+only if, no users are left::
+
+	if (!dev->open) {
+		mutex_unlock(&dev->lock);
+		chaoskey_free(dev);
+
+These operations must be performed in this specific order.
+
+
+Operations on the whole device
+==============================
+
+Keep in mind that drivers for USB devices are technically drivers for
+interfaces of USB devices. Some operations, namely reset and power
+management apply to the whole device. For those the drivers must
+coordinate. This is done in such a way that before an operation one
+function is called and after an operation another function is called.
+
+For reset the following methods are provided::
+
+	.pre_reset = uas_pre_reset,
+	.post_reset = uas_post_reset,
+
+After pre_reset() the device must have ceased all IO and may not begin
+new IO. This is done here::
+
+static int wdm_pre_reset(struct usb_interface *intf)
+{
+	struct wdm_device *desc = wdm_find_device(intf);
+
+	/*
+	 * we notify everybody using poll of
+	 * an exceptional situation
+	 * must be done before recovery lest a spontaneous
+	 * message from the device is lost
+	 */
+	spin_lock_irq(&desc->iuspin);
+	set_bit(WDM_RESETTING, &desc->flags);	/* inform read/write */
+	set_bit(WDM_READ, &desc->flags);	/* unblock read */
+	clear_bit(WDM_IN_USE, &desc->flags);	/* unblock write */
+	desc->rerr = -EINTR;
+	spin_unlock_irq(&desc->iuspin);
+	wake_up_all(&desc->wait);
+
+And all new IO must be prevented::
+
+	poison_urbs(desc);
+	cancel_work_sync(&desc->rxwork);
+	cancel_work_sync(&desc->service_outs_intr);
+
+After post_reset() IO can be restarted::
+
+static int wdm_post_reset(struct usb_interface *intf)
+{
+	struct wdm_device *desc = wdm_find_device(intf);
+	int rv;
+
+	unpoison_urbs(desc);
+	clear_bit(WDM_OVERFLOW, &desc->flags);
+	clear_bit(WDM_RESETTING, &desc->flags);
+
+That may involve bringing the device back to an operable state,
+from the default state like UAS shows::
+
+	err = uas_configure_endpoints(devinfo);
+	if (err && err != -ENODEV)
+		shost_printk(KERN_ERR, shost,
+			     "%s: alloc streams error %d after reset",
+			     __func__, err);
+
+The driver must also somehow notify that the device may have lost data
+or state. That can be done either in pre_reset(), like cdc-wdm does::
+
+ 	spin_lock_irq(&desc->iuspin);
+	set_bit(WDM_RESETTING, &desc->flags);	/* inform read/write */
+	set_bit(WDM_READ, &desc->flags);	/* unblock read */
+	clear_bit(WDM_IN_USE, &desc->flags);	/* unblock write */
+	desc->rerr = -EINTR;
+	spin_unlock_irq(&desc->iuspin);
+
+or it can be done in post reset, like UAS does::
+
+	/* we must unblock the host in every case lest we deadlock */
+	spin_lock_irqsave(shost->host_lock, flags);
+	scsi_report_bus_reset(shost, 0);
+	spin_unlock_irqrestore(shost->host_lock, flags);
+
+The operations for power management are covered in their own article.
 
-This usb-skeleton driver does not have any examples of interrupt or
-isochronous data being sent to or from the device. Interrupt data is
-sent almost exactly as bulk data is, with a few minor exceptions.
-Isochronous data works differently with continuous streams of data being
-sent to or from the device. The audio and video camera drivers are very
-good examples of drivers that handle isochronous data and will be useful
-if you also need to do this.
 
 Conclusion
 ==========
 
 Writing Linux USB device drivers is not a difficult task as the
-usb-skeleton driver shows. This driver, combined with the other current
+chaoskey or usblp drivers show. These drivers, combined with the other current
 USB drivers, should provide enough examples to help a beginning author
 create a working driver in a minimal amount of time. The linux-usb-devel
 mailing list archives also contain a lot of helpful information.
-- 
2.26.2


--------------1B84478CFEF74181526E8364--

