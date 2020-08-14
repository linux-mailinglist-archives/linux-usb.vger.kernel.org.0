Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 933F92445D3
	for <lists+linux-usb@lfdr.de>; Fri, 14 Aug 2020 09:28:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726122AbgHNH2j (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Aug 2020 03:28:39 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:2603 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726091AbgHNH2j (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 14 Aug 2020 03:28:39 -0400
Received: from lhreml724-chm.china.huawei.com (unknown [172.18.7.108])
        by Forcepoint Email with ESMTP id B0DB4524511D522D1195;
        Fri, 14 Aug 2020 08:28:36 +0100 (IST)
Received: from [127.0.0.1] (10.47.4.107) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Fri, 14 Aug
 2020 08:28:36 +0100
Subject: Re: [Report]: BUG: KASAN: use-after-free in usb_hcd_pci_remove
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <b5f23591-50c1-f01e-31a0-879eeec3ab3f@huawei.com>
 <20200813182811.GA4035999@kroah.com>
From:   John Garry <john.garry@huawei.com>
Message-ID: <00274550-e14c-79a8-7c6e-aa58ada74fd4@huawei.com>
Date:   Fri, 14 Aug 2020 08:26:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20200813182811.GA4035999@kroah.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.47.4.107]
X-ClientProxiedBy: lhreml726-chm.china.huawei.com (10.201.108.77) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 13/08/2020 19:28, Greg Kroah-Hartman wrote:
>> [58.950967] hub 8-0:1.0: USB hub found
>> [58.954894] hub 8-0:1.0: 1 port detected
>> [58.961651] usbcore: registered new interface driver usb-storage
>>
>> Ring any bells? I don't mind debugging the real issue, but good to know it's
>> not already solved. I didn't see anything on linux-usb archives, apart from
>> this:
>> https://lore.kernel.org/linux-usb/1566554761464.60146@mentor.com/  which
>> doesn't look too familiar.
>>
>> I couldn't recreate on v5.8, but this triggering this seems a bit fragile
>> even on linux-next.
> Looks new.  Any chance you can run 'git bisect' to track this down?
> 

Hi Greg,

I need to find a reliable reproducer. I could only reproduce when some 
other seemingly unrelated kernel config options were enabled. Let me see 
if I can reproduce based on Linus' kernel (it will be 5.9-rc now), and 
go from there.

Thanks,
John
