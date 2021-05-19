Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 410A8388F4E
	for <lists+linux-usb@lfdr.de>; Wed, 19 May 2021 15:40:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346584AbhESNla (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 May 2021 09:41:30 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:3600 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232021AbhESNl3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 May 2021 09:41:29 -0400
Received: from dggems704-chm.china.huawei.com (unknown [172.30.72.59])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FlYpQ48VYzmXZj;
        Wed, 19 May 2021 21:37:50 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggems704-chm.china.huawei.com (10.3.19.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 19 May 2021 21:40:06 +0800
Received: from [127.0.0.1] (10.174.177.72) by dggpemm500006.china.huawei.com
 (7.185.36.236) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 19 May
 2021 21:40:06 +0800
Subject: Re: [PATCH 1/1] usb: xhci: remove unused variable 'len' in
 xhci_unmap_temp_buf()
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Mathias Nyman <mathias.nyman@intel.com>,
        linux-usb <linux-usb@vger.kernel.org>
References: <20210519123304.7885-1-thunder.leizhen@huawei.com>
 <YKUOra3I+c+xeO+s@kroah.com>
From:   "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <c7d39376-d18a-73db-dc33-03925e606ca3@huawei.com>
Date:   Wed, 19 May 2021 21:40:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <YKUOra3I+c+xeO+s@kroah.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.177.72]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500006.china.huawei.com (7.185.36.236)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 2021/5/19 21:12, Greg Kroah-Hartman wrote:
> On Wed, May 19, 2021 at 08:33:04PM +0800, Zhen Lei wrote:
>> GCC reports the following warning with W=1:
>>
>> drivers/usb/host/xhci.c:1349:15: warning:
>>  variable 'len' set but not used [-Wunused-but-set-variable]
>>  1349 |  unsigned int len;
>>       |               ^~~
>>
>> This variable is not used, remove it to fix the warning.
>>
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
>> ---
>>  drivers/usb/host/xhci.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
>> index 27283654ca08..a75ed4a00997 100644
>> --- a/drivers/usb/host/xhci.c
>> +++ b/drivers/usb/host/xhci.c
>> @@ -1346,7 +1346,6 @@ static bool xhci_urb_temp_buffer_required(struct usb_hcd *hcd,
>>  
>>  static void xhci_unmap_temp_buf(struct usb_hcd *hcd, struct urb *urb)
>>  {
>> -	unsigned int len;
>>  	unsigned int buf_len;
>>  	enum dma_data_direction dir;
>>  
>> @@ -1362,7 +1361,7 @@ static void xhci_unmap_temp_buf(struct usb_hcd *hcd, struct urb *urb)
>>  				 dir);
>>  
>>  	if (usb_urb_dir_in(urb))
>> -		len = sg_pcopy_from_buffer(urb->sg, urb->num_sgs,
>> +		(void)sg_pcopy_from_buffer(urb->sg, urb->num_sgs,
>>  					   urb->transfer_buffer,
>>  					   buf_len,
>>  					   0);
>> -- 
>> 2.25.1
>>
>>
> 
> Wow, no.  I keep telling you that this is not ok.  Why keep sending
> this?

Sorry, I forgot to google it, someone already posted it.

> 
> greg k-h
> 
> .
> 

