Return-Path: <linux-usb+bounces-1270-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F14447BE3FF
	for <lists+linux-usb@lfdr.de>; Mon,  9 Oct 2023 17:10:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37BD01C20BC0
	for <lists+linux-usb@lfdr.de>; Mon,  9 Oct 2023 15:10:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 912D5358B0;
	Mon,  9 Oct 2023 15:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DyP39lJo"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDF83589F
	for <linux-usb@vger.kernel.org>; Mon,  9 Oct 2023 15:10:47 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03072C6;
	Mon,  9 Oct 2023 08:10:46 -0700 (PDT)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 399Cwieo022942;
	Mon, 9 Oct 2023 15:10:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=B/wRgybsjJ1sAIWYnpU9qmmwEL5sakzw3inby55M10Y=;
 b=DyP39lJoRXtuLngn2Yh5BFB/kXaW8BPbCsnvc92XwuRlY+2UKtZ4X0wB7IFRTcD7JDwm
 8g/60nL9pebfdKjsl7pqsC/pgCoysJUD3Ir6Oiqt0fcMWHNTWRJ2fqsD0VtjIrkegmUp
 Y72guXNGuRyHFaTT9zkFqUckeOXt367shL00X24XqyGjBAWCtvRLUTRQpba6sgFbKp8Y
 xVtIXLqX5AJAPhE/XDy3v4ucoQlpn8Oks13I43E/1UvgYX9+tEnPkp140PW0tLMtu1ck
 dZssKoosmXaApFof+L35mjdzFW7weFFXytOmD5oldIJugshDdJZDdeB5sEbYmD0Z+DKG aQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tmj0d8938-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Oct 2023 15:10:37 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 399FAad3001230
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Oct 2023 15:10:36 GMT
Received: from [10.216.9.133] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Mon, 9 Oct
 2023 08:10:32 -0700
Message-ID: <e8a1cde2-0df1-4cc2-a6a1-e31a2a99dae3@quicinc.com>
Date: Mon, 9 Oct 2023 20:40:27 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] Documentation: usb: Update NCM configfs parameters
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
Content-Language: en-US
From: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
In-Reply-To: <2023100942-drop-down-abide-f8fe@gregkh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: BZRko8uEnyc5hjw7-c-xg9S-rqttXMu8
X-Proofpoint-ORIG-GUID: BZRko8uEnyc5hjw7-c-xg9S-rqttXMu8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-09_13,2023-10-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 spamscore=0 mlxscore=0 mlxlogscore=889 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2309180000 definitions=main-2310090125
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net



On 10/9/2023 8:35 PM, Greg Kroah-Hartman wrote:
> On Mon, Oct 09, 2023 at 07:50:04PM +0530, Krishna Kurapati wrote:
>> Updateed NCM configfs parameters by adding max_segment_size
>> property and describing its effect on MTU configuration of
>> NCM interface.
> 
> "Updated"?

My bad. Will fix it in v2.
> 
>>
>> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
>> ---
>>   Documentation/usb/gadget-testing.rst | 20 +++++++++++---------
>>   1 file changed, 11 insertions(+), 9 deletions(-)
>>
>> diff --git a/Documentation/usb/gadget-testing.rst b/Documentation/usb/gadget-testing.rst
>> index 29072c166d23..6e5d96668e8e 100644
>> --- a/Documentation/usb/gadget-testing.rst
>> +++ b/Documentation/usb/gadget-testing.rst
>> @@ -448,15 +448,17 @@ Function-specific configfs interface
>>   The function name to use when creating the function directory is "ncm".
>>   The NCM function provides these attributes in its function directory:
>>   
>> -	=============== ==================================================
>> -	ifname		network device interface name associated with this
>> -			function instance
>> -	qmult		queue length multiplier for high and super speed
>> -	host_addr	MAC address of host's end of this
>> -			Ethernet over USB link
>> -	dev_addr	MAC address of device's end of this
>> -			Ethernet over USB link
>> -	=============== ==================================================
>> +	================= ====================================================
>> +	ifname		  network device interface name associated with this
>> +			  function instance
>> +	qmult		  queue length multiplier for high and super speed
>> +	host_addr	  MAC address of host's end of this
>> +			  Ethernet over USB link
>> +	dev_addr	  MAC address of device's end of this
>> +			  Ethernet over USB link
>> +	max_segment_size  Segment size required for P2P connections. This
>> +			  will inturn set MTU to (max_segment_size - 14 bytes)
> 
> "inturn"???
> 
>> +	================= ====================================================
>>   
> 
> What commit id does this fix?
> 
This is not a bug fix. It is just an addition of a new property. Does it 
need a fixes tag ?

Regards,
Krishna,

