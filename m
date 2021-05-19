Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32026389124
	for <lists+linux-usb@lfdr.de>; Wed, 19 May 2021 16:37:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242611AbhESOib (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 May 2021 10:38:31 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:3036 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242135AbhESOia (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 May 2021 10:38:30 -0400
Received: from dggems706-chm.china.huawei.com (unknown [172.30.72.58])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Flb2q0bftzQp8j;
        Wed, 19 May 2021 22:33:39 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggems706-chm.china.huawei.com (10.3.19.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 19 May 2021 22:37:09 +0800
Received: from [127.0.0.1] (10.174.177.72) by dggpemm500006.china.huawei.com
 (7.185.36.236) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 19 May
 2021 22:37:08 +0800
Subject: Re: [PATCH 1/1] usb: xhci: remove unused variable 'len' in
 xhci_unmap_temp_buf()
From:   "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Mathias Nyman <mathias.nyman@intel.com>,
        linux-usb <linux-usb@vger.kernel.org>
References: <20210519123304.7885-1-thunder.leizhen@huawei.com>
 <YKUOra3I+c+xeO+s@kroah.com>
 <c7d39376-d18a-73db-dc33-03925e606ca3@huawei.com>
Message-ID: <d5755fc6-3c1d-f780-5105-d39771c73427@huawei.com>
Date:   Wed, 19 May 2021 22:37:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <c7d39376-d18a-73db-dc33-03925e606ca3@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.177.72]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500006.china.huawei.com (7.185.36.236)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 2021/5/19 21:40, Leizhen (ThunderTown) wrote:
> 
> 
> On 2021/5/19 21:12, Greg Kroah-Hartman wrote:
>> On Wed, May 19, 2021 at 08:33:04PM +0800, Zhen Lei wrote:
>>> GCC reports the following warning with W=1:
>>>
>>> drivers/usb/host/xhci.c:1349:15: warning:
>>>  variable 'len' set but not used [-Wunused-but-set-variable]
>>>  1349 |  unsigned int len;
>>>       |               ^~~
>>>
>>> This variable is not used, remove it to fix the warning.
>>>
>>> Reported-by: Hulk Robot <hulkci@huawei.com>
>>> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
>>> ---
>>>  drivers/usb/host/xhci.c | 3 +--
>>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
>>> index 27283654ca08..a75ed4a00997 100644
>>> --- a/drivers/usb/host/xhci.c
>>> +++ b/drivers/usb/host/xhci.c
>>> @@ -1346,7 +1346,6 @@ static bool xhci_urb_temp_buffer_required(struct usb_hcd *hcd,
>>>  
>>>  static void xhci_unmap_temp_buf(struct usb_hcd *hcd, struct urb *urb)
>>>  {
>>> -	unsigned int len;
>>>  	unsigned int buf_len;
>>>  	enum dma_data_direction dir;
>>>  
>>> @@ -1362,7 +1361,7 @@ static void xhci_unmap_temp_buf(struct usb_hcd *hcd, struct urb *urb)
>>>  				 dir);
>>>  
>>>  	if (usb_urb_dir_in(urb))
>>> -		len = sg_pcopy_from_buffer(urb->sg, urb->num_sgs,
>>> +		(void)sg_pcopy_from_buffer(urb->sg, urb->num_sgs,
>>>  					   urb->transfer_buffer,
>>>  					   buf_len,
>>>  					   0);
>>> -- 
>>> 2.25.1
>>>
>>>
>>
>> Wow, no.  I keep telling you that this is not ok.  Why keep sending
>> this?
> 
> Sorry, I forgot to google it, someone already posted it.

Hi, Greg Kroah-Hartman:
  I've read your two exchange emails from https://patchwork.kernel.org/project/linux-usb/patch/20210306120644.74406-1-zhangkun4jr@163.com/#24019765
  How about just give a warning when the copy is not complete? This W=1 warning will probably be detected by someone else.

> 
>>
>> greg k-h
>>
>> .
>>

