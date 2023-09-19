Return-Path: <linux-usb+bounces-351-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE167A5669
	for <lists+linux-usb@lfdr.de>; Tue, 19 Sep 2023 02:02:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73F8E281A77
	for <lists+linux-usb@lfdr.de>; Tue, 19 Sep 2023 00:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BC25341AB;
	Tue, 19 Sep 2023 00:01:58 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C08450F6
	for <linux-usb@vger.kernel.org>; Tue, 19 Sep 2023 00:01:56 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5004D97
	for <linux-usb@vger.kernel.org>; Mon, 18 Sep 2023 17:01:54 -0700 (PDT)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38INExkh025725;
	Tue, 19 Sep 2023 00:01:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=n5HdAZzjmPTQ/TJscgTAjnMyBWueyUkZ89hyVgmvofo=;
 b=lr/WEahBNtP32rtMb0E2UGHK96JEWam6Tfg8cREeGh/KRMhb/iuR1alrPTQOGh/3wjbl
 p3sPRYWP0qr7XfDHy69ZjFcVobTN3ETF9Xivgw+HK12CjksNXYntCj/aKKjswYhd2zL6
 4TvhEHeYmgEvuhzY6SJTedufWxDNo4jl+g+e2hIrKLmm2Y6e6KWyzNqZEeebc99zMneA
 USJOrpf+WSFKm2xsOs5LVWaQtgSkmNTiD7dIKCKDuuPHAh2qnGULnsxdo7HOIBb8c2kI
 vBEq8nDKJ6uNepvIllBwrYnJl9IfOQS/Yy7wE2uBh3AVNCxc4eiyTPyhEOyzoZwBPLI3 KA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t6mts9mjf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Sep 2023 00:01:47 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38J01kFM002256
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Sep 2023 00:01:46 GMT
Received: from [10.253.14.73] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Mon, 18 Sep
 2023 17:01:45 -0700
Message-ID: <afaffda9-d9aa-6f88-7fad-fab7c1eead2e@quicinc.com>
Date: Tue, 19 Sep 2023 08:01:43 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v7 2/4] usb: gadget: add anonymous definition in some
 struct for trace purpose
To: Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, <linux-usb@vger.kernel.org>
References: <20230918112534.2108-1-quic_linyyuan@quicinc.com>
 <20230918112534.2108-3-quic_linyyuan@quicinc.com>
 <2023091831-applause-headless-8e91@gregkh>
 <19324523-5431-4796-b770-d38526030e0d@rowland.harvard.edu>
Content-Language: en-US
From: Linyu Yuan <quic_linyyuan@quicinc.com>
In-Reply-To: <19324523-5431-4796-b770-d38526030e0d@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: EpyN6lQwWFfF_FdGcCZA_qtqnbWquHNA
X-Proofpoint-ORIG-GUID: EpyN6lQwWFfF_FdGcCZA_qtqnbWquHNA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-18_11,2023-09-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0 mlxlogscore=472
 malwarescore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309180207
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net


On 9/18/2023 10:14 PM, Alan Stern wrote:
> On Mon, Sep 18, 2023 at 02:06:34PM +0200, Greg Kroah-Hartman wrote:
>> On Mon, Sep 18, 2023 at 07:25:32PM +0800, Linyu Yuan wrote:
>>> Some UDC trace event will save usb udc information, but it use one int
>>> size buffer to save one bit information of usb udc, it waste trace buffer.
>>>
>>> Add anonymous union which have u32 members can be used by trace event
>>> during fast assign stage to save more entries with same trace ring buffer
>>> size.
>>>
>>> In order to access each bit with BIT() macro, add different definition for
>>> each bit fields according host little/big endian to make sure it has same
>>> eacho bit field have same bit position in memory.
>> typo?
>>
>>> Add some macros or helper for later trace event usage which follow the
>>> udc structs, As when possible future changes to udc related structs,
>>> developers will easy notice them.
>> This isn't going to work at all, there's nothing to keep the two in
>> sync.
>>
>> As you are using bitmasks now, wonderful, just use those only and ignore
>> the bitfield definitions, that's not going to work mixing the two at
>> all.
> Greg is right.  If you really want to access these fields using bitmask
> operations, you should do it by changing all of the fields into
> bitmasks; mixing bitmasks and bitfields is not a good idea.
>
> For example, in order to do this you will have to change the definition
> of struct usb_gadget.  Replace
>
> 	unsigned			sg_supported:1;
> 	unsigned			is_otg:1;
> 	unsigned			is_a_peripheral:1;
> 	unsigned			b_hnp_enable:1;
> 	unsigned			a_hnp_support:1;
> 	unsigned			a_alt_hnp_support:1;
> 	unsigned			hnp_polling_support:1;
> 	unsigned			host_request_flag:1;
> 	unsigned			quirk_ep_out_aligned_size:1;
> 	unsigned			quirk_altset_not_supp:1;
> 	unsigned			quirk_stall_not_supp:1;
> 	unsigned			quirk_zlp_not_supp:1;
> 	unsigned			quirk_avoids_skb_reserve:1;
> 	unsigned			is_selfpowered:1;
> 	unsigned			deactivated:1;
> 	unsigned			connected:1;
> 	unsigned			lpm_capable:1;
> 	unsigned			wakeup_capable:1;
> 	unsigned			wakeup_armed:1;
>
> with
>
> 	unsigned int			dw1;
>
> #define USB_GADGET_SG_SUPPORTED		BIT(0)
> #define USB_GADGET_IS_OTG		BIT(1)
> ...
> #define USB_GADGET_WAKEUP_ARMED		BIT(18)
>
> Then change all the drivers that use these fields.  For example, change
>
> 	g->connected = 1;
>
> to
>
> 	g->dw1 |= USB_GADGET_CONNECTED;
>
> and change
>
> 	if (g->is_selfpowered)
>
> to
>
> 	if (g->dw1 & USB_GADGET_IS_SELFPOWERED)
>
> Or if you prefer, invent some inline routines or macros that will handle
> this for you.


it is a lot of changes. i only expect  common and minimal 
change(macros/helpers) in gadget.h.


if you have better idea, please help share a patch.


>
> Make these changes in every gadget and UDC driver.  Then it will be
> safe to say
>
> 	__entry->dw1 = g->dw1;
>
> in the fast assign stage.  But it's not safe to use bitfields in the
> gadget and UDC drivers while using bitmasks in the tracing code.


thanks everyone for reviewing for a long time, it is end from my side of 
this topic.


>
> Alan Stern

