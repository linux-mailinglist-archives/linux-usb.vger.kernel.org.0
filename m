Return-Path: <linux-usb+bounces-14216-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A2537961D67
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2024 06:11:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 14F5EB21E13
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2024 04:11:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C13CB1420D8;
	Wed, 28 Aug 2024 04:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="i5bVOaov"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6D21DA21;
	Wed, 28 Aug 2024 04:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724818288; cv=none; b=nIXkrbHffJvaRzNsnNygonhDb4Tk5mX8+fdySBUUFjoOIid8vXeaDVITqaH5Soe+bo7yPMDj3U1en6iLdkCvIdQTd9yq4PX0FDAtXOyB0udeVHBuGOf9HtZ+9Me3C3eSUjCoLku+JNrCHte8syXf3I0JkU1VYmnfG8H6sL48c18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724818288; c=relaxed/simple;
	bh=qgkBj3XLOswSombZfzQeBF9pmB4ZPEywspV6gRvK8X8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=sHg5bl+0jEwD/zb9nvcvrc843n6qx7YC/juA9d9T9pCoDOCdN3n5a/Dxr/tvWUyvltejMWRRwyQ+/HoGIvHXZZ4/NQDXeJFdgxhNgXQRymxeVg6JrXPEOoNGc1UC9em03x43poGEIg1D0UjGw/P0PfWymnfQajMYt2s1fF4sJdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=i5bVOaov; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47RLaK7c018483;
	Wed, 28 Aug 2024 04:11:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XB3nitMDrhcgYWDNF7i/xDc7nt8v4/tU5UOice/FsLQ=; b=i5bVOaovkwnfnyBj
	oxZ18P00ZOv3oE8QJ2KdcUb7O4Q2Ft6y5fQhb40I+WO+usVmrx6XS/KcaW46qbsx
	J5vvC8Dm9pKxQEFufASFgy8gzOMXr7EL0WbGTyCVjRLrwjhDO5f4rWjK5WSzgmnc
	WgUrWReELcdULFpv6suGZXrI4YTp8nfqO3vgH6FV9i4SllEs0nw1mVJAPeumnimE
	10PU33kZCsHtEbmL8ZLYMJpw1gI0dcRVKvnKpBR3gD7Q8iMeqvr9jrBbgF8GPyr7
	bfHU9G13WnrTwAJ6KtOWX1Uh3Eani3pZfnhibD3EvcXS9uFTDBfyPIk1xeNuvLa1
	JA7fzA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419pv08mra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 04:11:18 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47S4BGtt026494
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 04:11:16 GMT
Received: from [10.217.219.148] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 27 Aug
 2024 21:11:10 -0700
Message-ID: <93955b6d-0ce1-42cb-ad18-a82e2e8cfca9@quicinc.com>
Date: Wed, 28 Aug 2024 09:41:02 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: dwc3: gadget: Fix TX FIFO size for HS ISOC endpoints
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jing Leng
	<jleng@ambarella.com>, Felipe Balbi <balbi@kernel.org>,
        Jack Pham
	<quic_jackp@quicinc.com>,
        "kernel@quicinc.com" <kernel@quicinc.com>,
        "Wesley
 Cheng" <quic_wcheng@quicinc.com>,
        Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>,
        Daniel Scally
	<dan.scally@ideasonboard.com>,
        Vijayavardhan Vennapusa
	<quic_vvreddy@quicinc.com>,
        Krishna Kurapati <quic_kriskura@quicinc.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20240827054956.28241-1-quic_akakum@quicinc.com>
 <20240827231552.7yokoe7jqdm3wduu@synopsys.com>
Content-Language: en-US
From: AKASH KUMAR <quic_akakum@quicinc.com>
In-Reply-To: <20240827231552.7yokoe7jqdm3wduu@synopsys.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: HPuyTsXJL0o3NzgyxJyNHMzwNJZErJTV
X-Proofpoint-ORIG-GUID: HPuyTsXJL0o3NzgyxJyNHMzwNJZErJTV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_02,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 mlxlogscore=947 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408280027

Hi Thinh,

On 8/28/2024 4:45 AM, Thinh Nguyen wrote:
> On Tue, Aug 27, 2024, Akash Kumar wrote:
>> Use 2K TX FIFO size for low-resolution UVC cameras to support the
>> maximum possible UVC instances. Restrict 2K TX FIFO size based on
>> the minimum maxburst required to run low-resolution UVC cameras.
>>
>> Signed-off-by: Akash Kumar <quic_akakum@quicinc.com>
>> ---
>>   drivers/usb/dwc3/gadget.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>> index 89fc690fdf34..f342ccda6705 100644
>> --- a/drivers/usb/dwc3/gadget.c
>> +++ b/drivers/usb/dwc3/gadget.c
>> @@ -788,6 +788,10 @@ static int dwc3_gadget_resize_tx_fifos(struct dwc3_ep *dep)
>>   	     usb_endpoint_xfer_isoc(dep->endpoint.desc)) && DWC3_IP_IS(DWC31))
>>   		num_fifos = dwc->tx_fifo_resize_max_num;
>>   
>> +	if (dep->endpoint.maxburst <= 1 &&
>> +	    usb_endpoint_xfer_isoc(dep->endpoint.desc))
>> +		num_fifos = 2;
>> +
>>   	/* FIFO size for a single buffer */
>>   	fifo = dwc3_gadget_calc_tx_fifo_size(dwc, 1);
>>   
>> -- 
>> 2.17.1
>>
> These settings are starting to get too specific for each application.
> Can we find a better calculation?
>
> Perhaps something like this? (code not tested)
>
> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index 9a18973ebc05..d54b08f92aea 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -908,15 +908,10 @@ static int dwc3_gadget_resize_tx_fifos(struct dwc3_ep *dep)
>   
>   	ram1_depth = DWC3_RAM1_DEPTH(dwc->hwparams.hwparams7);
>   
> -	if ((dep->endpoint.maxburst > 1 &&
> -	     usb_endpoint_xfer_bulk(dep->endpoint.desc)) ||
> +	if (usb_endpoint_xfer_bulk(dep->endpoint.desc) ||
>   	    usb_endpoint_xfer_isoc(dep->endpoint.desc))
> -		num_fifos = 3;
> -
> -	if (dep->endpoint.maxburst > 6 &&
> -	    (usb_endpoint_xfer_bulk(dep->endpoint.desc) ||
> -	     usb_endpoint_xfer_isoc(dep->endpoint.desc)) && DWC3_IP_IS(DWC31))
> -		num_fifos = dwc->tx_fifo_resize_max_num;
> +		num_fifos = min_t(unsigned int, dep->endpoint.maxburst + 1,
> +				  dwc->tx_fifo_resize_max_num);
>   
>   	/* FIFO size for a single buffer */
>   	fifo = dwc3_gadget_calc_tx_fifo_size(dwc, 1);
>
should be fine for me, as earlier there was no case handling for 
maxburst <= 1, by allocating fifo based on maxburst itself

should be a good solution and will work for all as they customize based 
on maxburst through init scripts, let me test and update.

Thanks,
Akash

