Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F29012A3EC6
	for <lists+linux-usb@lfdr.de>; Tue,  3 Nov 2020 09:19:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727236AbgKCITV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Nov 2020 03:19:21 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:7040 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725878AbgKCITV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 Nov 2020 03:19:21 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CQN3n58KnzhXhX;
        Tue,  3 Nov 2020 16:19:17 +0800 (CST)
Received: from [127.0.0.1] (10.57.22.126) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Tue, 3 Nov 2020
 16:19:09 +0800
Subject: Re: [PATCH v2 0/5] Introduce a new helper marco
 DEFINE_SHOW_STORE_ATTRIBUTE at seq_file.c
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     <akpm@linux-foundation.org>, <viro@zeniv.linux.org.uk>,
        <andriy.shevchenko@linux.intel.com>,
        <linux-kernel@vger.kernel.org>, <martin.petersen@oracle.com>,
        <john.garry@huawei.com>, <himanshu.madhani@cavium.com>,
        <felipe.balbi@linux.intel.com>, <uma.shankar@intel.com>,
        <anshuman.gupta@intel.com>, <animesh.manna@intel.com>,
        <linux-usb@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linuxarm@huawei.com>
References: <1604046722-15531-1-git-send-email-luojiaxing@huawei.com>
 <20201030084448.GA1625087@kroah.com>
From:   luojiaxing <luojiaxing@huawei.com>
Message-ID: <d4852df0-d7e0-ee7e-352c-58eaf47c2c72@huawei.com>
Date:   Tue, 3 Nov 2020 16:19:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20201030084448.GA1625087@kroah.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.57.22.126]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi

On 2020/10/30 16:44, Greg KH wrote:
> On Fri, Oct 30, 2020 at 04:31:57PM +0800, Luo Jiaxing wrote:
>> We already own DEFINE_SHOW_ATTRIBUTE() helper macro for defining attribute
>> for read-only file, but we found many of drivers also want a helper marco for
>> read-write file too.
>>
>> So we try to add this macro to help decrease code duplication.
>>
>> Luo Jiaxing (5):
>>    seq_file: Introduce DEFINE_SHOW_STORE_ATTRIBUTE() helper macro
>>    scsi: hisi_sas: Introduce DEFINE_SHOW_STORE_ATTRIBUTE for debugfs
>>    scsi: qla2xxx: Introduce DEFINE_SHOW_STORE_ATTRIBUTE for debugfs
>>    usb: dwc3: debugfs: Introduce DEFINE_SHOW_STORE_ATTRIBUTE
>>    drm/i915/display: Introduce DEFINE_SHOW_STORE_ATTRIBUTE for debugfs
> What changed from v1?


Sorry, I should add a commit for the change.


In v1, Andy pointed out that the old name of DEFINE_STORE_ATTRIBUTE was 
easily misunderstood as a write-only file rather than a read-write file.

Therefore, it is changed to DEFINE_SHOW_STORE_ATTRIBUTE according to his 
suggestion.


Thanks

Jiaxing


>
> thanks,
>
> greg k-h
>
> .
>

