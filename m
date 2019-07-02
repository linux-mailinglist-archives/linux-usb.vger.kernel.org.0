Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25FBF5D127
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jul 2019 16:05:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726765AbfGBOFO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Jul 2019 10:05:14 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:2892 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726544AbfGBOFO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 Jul 2019 10:05:14 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d1b649d0000>; Tue, 02 Jul 2019 07:05:17 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 02 Jul 2019 07:05:13 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 02 Jul 2019 07:05:13 -0700
Received: from [10.19.101.123] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 2 Jul
 2019 14:05:12 +0000
Subject: Re: [PATCH] usb: storage: skip only when uas driver is loaded
To:     Oliver Neukum <oneukum@suse.com>,
        Greg KH <gregkh@linuxfoundation.org>
CC:     <usb-storage@lists.one-eyed-alien.net>,
        <stern@rowland.harvard.edu>, <linux-usb@vger.kernel.org>
References: <20190701084848.32502-1-jckuo@nvidia.com>
 <20190701085248.GA28681@kroah.com>
 <8e8e8703-8620-b625-4917-bbb8d999caa4@nvidia.com>
 <20190702044249.GA694@kroah.com>
 <f6ed2505-5da9-c217-a052-a19d197c5c8e@nvidia.com>
 <f43e7ecf-64d5-20d2-0461-85a55fa28a33@nvidia.com>
 <1562058690.5819.9.camel@suse.com>
X-Nvconfidentiality: public
From:   JC Kuo <jckuo@nvidia.com>
Message-ID: <6e764566-d6f5-c064-cd4d-66261a238d8f@nvidia.com>
Date:   Tue, 2 Jul 2019 22:05:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1562058690.5819.9.camel@suse.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL106.nvidia.com (172.18.146.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1562076317; bh=u0nrsxxaPM7VQn2VqTchA+WakCKxVWQqKElq0je1hss=;
        h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=YoQ1fD25I9GGVzGN+eXUdj1Ig6sRONfhgLhMyZ/E2okyLfiOHAZfao6eEPqz/j3Ez
         0T51j9AgAX9XIFT3O8LGa90u8qA38fWWoOhuv9TiYZn7Icfw/9D4pIwQ+DLsXA6iw6
         z5Y6XaUtiSs05UcWbmLsc58yU1vv23OXeu6f4D4Ff+czmqz1+mu53WgpmxDxgZAhv1
         MkhbZsT3j0u+A1eFimEt4e3E00fFtxrER+irOoa1TmBDluXiX673j7AKHlC3pcO3Eu
         2N0ic+JpC6ddfInjonPtwRFyhkvCgQHSWZO+A7U+1+GLe5eCDPdZxrd3TEz3vRsorR
         lHZyKfZEnNvDQ==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 7/2/19 5:11 PM, Oliver Neukum wrote:
> Am Dienstag, den 02.07.2019, 14:56 +0800 schrieb JC Kuo:
>>
>> Since blacklisting uas kernel module is not a good idea and could break UAS
> 
> Then don't do it. If you don't want a driver loaded for a device
> blacklisting the driver must not magically assign another driver.
> 
>> capable storage functionality, do we consider forbidding making uas driver
>> as module? That means to make CONFIG_USB_UAS a bool option.
> 
> No. Absolutely not. We cannot force people to build UAS into their
> kernel or not use it. Building either driver not at all, modular
> or statically are all valid use cases. Just not building UAS must
> trigger a fallback. And we must have a flag to override the kernel's
> decision
> 
> Making driver assignments depend on module loading order is a very bad
> idea. We also have the necessary quirk in one way. I would accept a
> patch adding a flag to force usage of UAS, but other than that, the
> existing code is as it must be.
> 
> 	Regards
> 		Oliver
> 
Hi Greg and Oliver,
Thank you so much for your time and guidance. I understood that we can make
use of usb-storage quirks parameter to blacklist any UAS capable device.

I don't see the uas issue myself. I was trying to describe a situation that
user having issue with UAS storage and would like to blacklist uas module when
the user is not aware of the usb-storage quirks parameter.

https://marc.info/?l=linux-usb&m=143385909823645&w=2

UAS capable devices are backward-compatible with legacy Bulk-only protocol.
Therefore, IMHO, ideally if system software doesn't have UAS support, system
software should enable the UAS device with Bulk-only protocol, unless
usb-storage driver is not there as well.

Now the only valid way to disable UAS support for all UAS devices is to disable
CONFIG_USB_UAS option and rebuild kernel. Blacklisting uas driver is intuitive,
however it doesn't really disable UAS support but actually prevents UAS devices
to be functional even though usb-storage driver is there and the devices indeed
support Bulk-only protocol.



Thanks,
JC
