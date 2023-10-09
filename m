Return-Path: <linux-usb+bounces-1273-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A4B7BE4D5
	for <lists+linux-usb@lfdr.de>; Mon,  9 Oct 2023 17:33:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DD16281B8F
	for <lists+linux-usb@lfdr.de>; Mon,  9 Oct 2023 15:33:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17D0C374C6;
	Mon,  9 Oct 2023 15:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BlOvoPG2"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5BE36B14
	for <linux-usb@vger.kernel.org>; Mon,  9 Oct 2023 15:33:52 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BADB91;
	Mon,  9 Oct 2023 08:33:50 -0700 (PDT)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 399EdNL3006616;
	Mon, 9 Oct 2023 15:33:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=TNsRjNaebtSZQF4XGy9xAVqnLDbZaqIkz8VjpOQRnfs=;
 b=BlOvoPG24qHHc/Vt94Y0Uf325B77GGDKBId4R6RbU7ip7NdtQbS4bvr4YRnJLbIX2A3g
 5Ra75WaNPgsB3QHEqgqu65KIo2WwJyeGEZ1IfjgrBrrV7f68JQicd0JHJHRY5/+Xv2r/
 uTeGVkRENK5u1eCAJUT7y1gknZ/yhfureAieA2zt3YpQ5zYblqIueQShb8hsDfpC2I2P
 GJ7UWf1YR1QC0tje/yDUrO3Y5MF2eQV0UTo1tkRT7kp9tgWWVbeyRxIN/POThOEuwn1U
 BSwGiHI48MHMz3Xg4+AhEXj6FHSP1r7WTM4AA9AT+jdDCr9txpJsM+0T3V8Ayaf5fDtK RA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tkh6g2r5n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Oct 2023 15:33:47 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 399FXkoo029060
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Oct 2023 15:33:46 GMT
Received: from [10.216.9.133] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Mon, 9 Oct
 2023 08:33:41 -0700
Message-ID: <7681bac9-5b64-49cc-8e47-8d9f54d4e39f@quicinc.com>
Date: Mon, 9 Oct 2023 21:03:41 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] Documentation: usb: Update NCM configfs parameters
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>,
        onathan Corbet
	<corbet@lwn.net>,
        Linyu Yuan <quic_linyyuan@quicinc.com>, <linux-usb@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_ppratap@quicinc.com>, <quic_wcheng@quicinc.com>,
        <quic_jackp@quicinc.com>
References: <20231009142005.21338-1-quic_kriskura@quicinc.com>
 <2023100942-drop-down-abide-f8fe@gregkh>
 <e8a1cde2-0df1-4cc2-a6a1-e31a2a99dae3@quicinc.com>
 <2023100954-steadier-discolor-084f@gregkh>
From: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
In-Reply-To: <2023100954-steadier-discolor-084f@gregkh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vqNVTYUnDtEvKMfhPnC939Sb0Z4j9ndN
X-Proofpoint-ORIG-GUID: vqNVTYUnDtEvKMfhPnC939Sb0Z4j9ndN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-09_13,2023-10-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 clxscore=1015 mlxlogscore=846 bulkscore=0 lowpriorityscore=0 phishscore=0
 mlxscore=0 adultscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2310090128
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net



On 10/9/2023 8:51 PM, Greg Kroah-Hartman wrote:

>>>> diff --git a/Documentation/usb/gadget-testing.rst b/Documentation/usb/gadget-testing.rst
>>>> index 29072c166d23..6e5d96668e8e 100644
>>>> --- a/Documentation/usb/gadget-testing.rst
>>>> +++ b/Documentation/usb/gadget-testing.rst
>>>> @@ -448,15 +448,17 @@ Function-specific configfs interface
>>>>    The function name to use when creating the function directory is "ncm".
>>>>    The NCM function provides these attributes in its function directory:
>>>> -	=============== ==================================================
>>>> -	ifname		network device interface name associated with this
>>>> -			function instance
>>>> -	qmult		queue length multiplier for high and super speed
>>>> -	host_addr	MAC address of host's end of this
>>>> -			Ethernet over USB link
>>>> -	dev_addr	MAC address of device's end of this
>>>> -			Ethernet over USB link
>>>> -	=============== ==================================================
>>>> +	================= ====================================================
>>>> +	ifname		  network device interface name associated with this
>>>> +			  function instance
>>>> +	qmult		  queue length multiplier for high and super speed
>>>> +	host_addr	  MAC address of host's end of this
>>>> +			  Ethernet over USB link
>>>> +	dev_addr	  MAC address of device's end of this
>>>> +			  Ethernet over USB link
>>>> +	max_segment_size  Segment size required for P2P connections. This
>>>> +			  will inturn set MTU to (max_segment_size - 14 bytes)
>>>
>>> "inturn"???
>>>
>>>> +	================= ====================================================
>>>
>>> What commit id does this fix?
>>>
>> This is not a bug fix. It is just an addition of a new property. Does it
>> need a fixes tag ?
> 
> Where is the code for the new property?
> 
> Ah, it's in patch 2/2, that wasn't obvious, sorry.  Why is this a
> separate patch at all, shouldn't be part of the commit that adds the new
> property to the system?
> 

Sorry. I followed the practice of splitting patches like we usually do. 
Will club them up in a single patch in v2. Thanks for pointing this mistake.

Regards,
Krishna,

