Return-Path: <linux-usb+bounces-31905-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 09902CF2D9A
	for <lists+linux-usb@lfdr.de>; Mon, 05 Jan 2026 10:52:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DF1F730242A2
	for <lists+linux-usb@lfdr.de>; Mon,  5 Jan 2026 09:52:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7525F335554;
	Mon,  5 Jan 2026 09:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="VE3Gk/ZG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E44A2F5313
	for <linux-usb@vger.kernel.org>; Mon,  5 Jan 2026 09:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767606321; cv=none; b=Qvu2TG3PeGDE4gmmn6CcuB8ZPrOntZ4PWy2U+oaDllyztRSNcGtPJhzU9egYkbqP+KizmQiudtM1IQp1niiq/rDeYS+HIgKuBP7j9tCafSzUIU8QECyAaEPBCUEI16/ZYK6lUIiQoWyMMNwS5YNRTL/8W/x5Jx8Yq2jrjho3h+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767606321; c=relaxed/simple;
	bh=kSXQuGkgg8gTuyn+UWKx7YrYawCuqzQvq4MS3znYFIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=AzA9jAJFbAqqS2lr3muOaT+3ilusIamoJg3ifwBuHBJZREGx72865A4lew8FW3lyF38q1PSFNdnyb4CUgQgZlUumH+xliqzkcmQXnC7vOPmT11oyFw5h1+zrm8jLCx6K+8EI2Dx6uGJ2fq3ImVVgMDRKvuZcA0HenfB3jVFd2vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=VE3Gk/ZG; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20260105094510epoutp02dcd5e3b6adc2664377270a20fc01efb6~HzJMa4oe-2063720637epoutp02_
	for <linux-usb@vger.kernel.org>; Mon,  5 Jan 2026 09:45:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20260105094510epoutp02dcd5e3b6adc2664377270a20fc01efb6~HzJMa4oe-2063720637epoutp02_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1767606310;
	bh=kXSVhTAEzsy8W8N0+SgwNy/CIq9E7u07E9njpeC4ke8=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=VE3Gk/ZGrXl0mvJ6itQupj+2bPxL4SV9MikNJLLqDixLCl2RL4ZIkGi1fMhlbJJJN
	 UfT+APoF20a55O+Fmy8DYCDE9AbMpUmR8t/4TfvnYIQMK9aohLNsptY/kqTqFLczLy
	 hnK4kIQzNgMnL8CPNzmre43tLhGOThkDROiYtkHE=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20260105094510epcas5p35bce1076533d9b9ccb65588cd6daf23e~HzJMP7wZ32630626306epcas5p3Z;
	Mon,  5 Jan 2026 09:45:10 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.91]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4dl8Y062KJz6B9m6; Mon,  5 Jan
	2026 09:45:08 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20260105094508epcas5p32085b790b620e5f08293fa63115d89df~HzJKEv0Fv1665116651epcas5p3s;
	Mon,  5 Jan 2026 09:45:08 +0000 (GMT)
Received: from [107.122.5.126] (unknown [107.122.5.126]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260105094507epsmtip230fb197b8e3a425e64951c07c7d9c180~HzJJYiGrV1774817748epsmtip2N;
	Mon,  5 Jan 2026 09:45:07 +0000 (GMT)
Message-ID: <f8afe637-923c-4355-947c-bbb82dba4403@samsung.com>
Date: Mon, 5 Jan 2026 15:15:06 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] usb: gadget: uvc: Prevent smmu fault in unstopped
 stream uvc teardown
To: Udipto Goswami <udipto.goswami@oss.qualcomm.com>, Frederic Weisbecker
	<frederic@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Content-Language: en-US
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
In-Reply-To: <CAMTwNXDcHwMApfR87XzKCcePzHrrSYrzknH-+fnFoBJXYNFLmA@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260105094508epcas5p32085b790b620e5f08293fa63115d89df
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260105085407epcas5p481f61dc289af9b1f2c7cf067dc2db82d
References: <20260105050724.2041581-1-udipto.goswami@oss.qualcomm.com>
	<CGME20260105085407epcas5p481f61dc289af9b1f2c7cf067dc2db82d@epcas5p4.samsung.com>
	<CAMTwNXDcHwMApfR87XzKCcePzHrrSYrzknH-+fnFoBJXYNFLmA@mail.gmail.com>


On 1/5/2026 2:21 PM, Udipto Goswami wrote:
> On Mon, Jan 5, 2026 at 10:37 AM Udipto Goswami
> <udipto.goswami@oss.qualcomm.com> wrote:
>> When switching USB compositions while the camera is streaming, an SMMU
>> fault can occur because dwc3_remove_requests() unmaps buffers via
>> dwc3_gadget_giveback() while the controller hardware is still performing
>> DMA operations on subsequent requests in the started_list.
This may be a problem with how the DWC3 gadget driver handles 
isochronous endpoints when the function driver issues an EP‑disable 
request as part of compositions switch from UVC.

In the current dwc3_ep_disable implementation, the 
dwc3_gadget_giveback() request is issued without waiting for the 
completion of the End‑Transfer command that stops the active transfer.

>>
>> Fix this by adding a delay in uvc_video_complete() when handling the first
>> -ESHUTDOWN event  (detected by checking !UVC_QUEUE_DISCONNECTED) to allow
>> the controller to  complete in-flight DMA and drain its FIFO before
>> dwc3_remove_requests()  proceeds to unmap remaining buffers,
>> preventing the SMMU translation fault.
>>
>> Signed-off-by: Udipto Goswami <udipto.goswami@oss.qualcomm.com>
>> ---
>>   drivers/usb/gadget/function/uvc_video.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
>> index fb77b0b21790..04724bd44ab9 100644
>> --- a/drivers/usb/gadget/function/uvc_video.c
>> +++ b/drivers/usb/gadget/function/uvc_video.c
>> @@ -366,7 +366,15 @@ uvc_video_complete(struct usb_ep *ep, struct usb_request *req)
>>
>>          case -ESHUTDOWN:        /* disconnect from host. */
>>                  uvcg_dbg(&video->uvc->func, "VS request cancelled.\n");
>> +               if (!(queue->flags & UVC_QUEUE_DISCONNECTED))
>> +                       delay = 1;
> Apologies for the oversight. This revision has a compilation failure
> due to a missing declaration of the delay variable.
> If the code logic looks sound, I will prepare and send a corrected
> version after the review.
>
>>                  uvcg_queue_cancel(queue, 1);
>> +               if (delay) {
>> +                       if (in_interrupt() || irqs_disabled() || in_atomic())
>> +                                mdelay(1);
>> +                       else
>> +                               msleep(50);
>> +               }
>>                  break;


How you decided this delay time? And any reason why this delay is added 
after uvcg_queue_cancel?

>>
>>          default:
>> --
>> 2.34.1
>>
>

