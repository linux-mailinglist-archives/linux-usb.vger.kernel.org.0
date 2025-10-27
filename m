Return-Path: <linux-usb+bounces-29690-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9C0C0D24E
	for <lists+linux-usb@lfdr.de>; Mon, 27 Oct 2025 12:24:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD0B8400A44
	for <lists+linux-usb@lfdr.de>; Mon, 27 Oct 2025 11:24:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE0B02F90D6;
	Mon, 27 Oct 2025 11:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="myHeg4nG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8062E9722
	for <linux-usb@vger.kernel.org>; Mon, 27 Oct 2025 11:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761564280; cv=none; b=lXVQnrNKGeOvfEEm/S+CyGP+atEZJRH5wmXon1mJ8acPLIQUmoCqGnsjYjUO2ahgXoUJlZjfkENVDIKMQuQgV3JyFgXPYatIwrXT4vdvA9pnC7IRv4bq3e4uDruyxrezfY0C4WKjITjntz/HSKl21Pb19YS+bB1H8zd1T8y8BPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761564280; c=relaxed/simple;
	bh=Tjn2XSdF4NEJWEm2F6LvPMPISBSVL+ChX6Q+leBvxl8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IVwomSkeKms25cMoe0kOp9CYsVoD5ytGDk2kxjTJbBnjtVv7JOIqIXZYUo8iObmAV5zPX3JzjQGuCwP/aBSpUsSetVUR2EkuMM0h0uLsWb/cBg6P4dDAqnkzGVJb1Z9sJznVrfsDeOz5vAwMkiuXvX9ci2d1cRmLuqloFHrdLEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=myHeg4nG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59R7Jucw2059256
	for <linux-usb@vger.kernel.org>; Mon, 27 Oct 2025 11:24:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gg+oaNrvUF9ILfhrptxODjwkkTizmc6ksl2GN2fI8Sw=; b=myHeg4nG95IXEage
	6WBFiaU261eLIJwivXFdqCUgGI87MV6Fm6N5FxeFLMb6pq76mUmaoKWRV+nI3EyA
	3SJJoXPWzZU9EE+iA1YzEO1OnaIIXTZzKDcI1zRvq1NLxfIZ300EXZ2b33bPLyxD
	ZT63QOlIlqXeSW893uNRZoGEfhmlUk/oJ5fEHdJC8LQSsO9t17gFwZ4Ay4KpxzEt
	2lo6S+gQw9jNTbS+TvR5sawEYEgU7dNGUcAesgNoyHLEbjnAAarTn9+IJVT68Jyk
	N2CvGXXIFila1yAiaSOzTF2CdBRI4vX34wv5PyFJeBoQMDEpwI3UFVeGJu3ibXgP
	ISo2EA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a248p8nna-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 27 Oct 2025 11:24:37 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-78117fbda6eso3235755b3a.3
        for <linux-usb@vger.kernel.org>; Mon, 27 Oct 2025 04:24:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761564277; x=1762169077;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gg+oaNrvUF9ILfhrptxODjwkkTizmc6ksl2GN2fI8Sw=;
        b=lbirZsSG7XW8zakD1c4Cyor2snJAcQwXeNu0BpjDwMHOZABji8lWjhxfhmaTuSZ2xI
         rr3DqG7K5UNC9z4wwWKshpQSbNsm29C5cCuYy96NsraMl1rmVzrUViSvTt//I9tDwODn
         v4FwKyvnnaS4kYixkLL66Xte79tWjvRp2OtufU6OCn4Zc8YMP1J7fi7nDVzOURjPpORh
         JMlTD1BsqmgeA268UeWgLS9kf8TSxlp7YNvU0QPXLiKdRe3/DQiYsjeuKRY6KYVHXlhD
         /wwXZtUkqHyNYwu8UwFve3vBgfw9ydi9hshoMA1TLtH7jdzJKW/ilISTkWG6q8lcZM4R
         5oAA==
X-Forwarded-Encrypted: i=1; AJvYcCUOJsiISOO5noNzxgL6rkBqZ8wJRm8jRI5m/RFMJWchu2dZKqI+wvH3kubK0vQK69Pjepusc/LHk9Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8QpN3MsjtM0zCaiCNoKaDI/Bxl2JbVbDYOUnH3u2wC43r0f0+
	UK21HV2hOGHwy9MTzqaInMlvFinj/FICHikKlQPmuZBZC6XZI0IBOinMFpDNcCWF9JfyXE+RCk2
	7QgIndnIP5okGhpeM5BSvObh87g6lNn9f/E5N8Tg4bt8mpGFGlR00AdaNQp7q0rc=
X-Gm-Gg: ASbGncsrkhCxpiPSBRniRsUsvCg1ruk2BuIbyqQ7ZAHLpqyVDUoUwfVrs9aOipdstDK
	s9TT0rosyuDJjRPPN/rnBAwe/2YmR3jTzmLcxxUNTiXfSliZRc6DpUGEUudX62Wb05RLA3258nu
	bIBIN3gLhwYxGVY4sD4/WGaNmkxzxLita2AF6QuR1qmSIL4M1vJWYqWL5+NKQY/EFOPQyyGNuo9
	9Gxkb4qxxVL6XEKu70Fh4G4TpesuaaGdBBb2DffE4ReQsdV6X0oiilLQJZQ+Fcyfsf6Lgo6mXtR
	6sfZCJqkN1axBgm0Ni7EzSyjBId4g53K6wPtztV8rBV5bklxhZJMtRIe4JBX3tdTgJZFgxqGTVK
	O8GtIT+D4sf1TY2kS48kXX7i93xo5e4CRudk=
X-Received: by 2002:a05:6a20:72a3:b0:334:79cd:fb13 with SMTP id adf61e73a8af0-334a85047abmr47340873637.4.1761564277354;
        Mon, 27 Oct 2025 04:24:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsjhBOZkZx9w9MCvltT4iIAvo+2a9fFa7BitzsuZT9Yb4/U1sE4CsXunT2tHtCEoQe/u6iag==
X-Received: by 2002:a05:6a20:72a3:b0:334:79cd:fb13 with SMTP id adf61e73a8af0-334a85047abmr47340843637.4.1761564276899;
        Mon, 27 Oct 2025 04:24:36 -0700 (PDT)
Received: from [192.168.1.3] ([122.169.146.201])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a41402e48esm7827559b3a.16.2025.10.27.04.24.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 04:24:36 -0700 (PDT)
Message-ID: <231e19ab-0ab7-4eb3-b472-258428a79cf1@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 16:54:31 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] usb: typec: hd3ss3220: Enable VBUS based on ID pin
 state
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251027072741.1050177-1-krishna.kurapati@oss.qualcomm.com>
 <20251027072741.1050177-3-krishna.kurapati@oss.qualcomm.com>
 <aP8_oZlJ4466BEf0@kuha.fi.intel.com>
Content-Language: en-US
From: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <aP8_oZlJ4466BEf0@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Zvzg6t7G c=1 sm=1 tr=0 ts=68ff5675 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=os7cmxGP5G+7zi0Bb7vKnA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=afDafrLgsQjIVlkna1UA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDEwNiBTYWx0ZWRfX2cVCHMMq+qqZ
 c/IYlHtCNYCDECdEOMnQfbyhFDJBTOKZkAxQfJ4e+jcsY7Orjm4azDU1l51o1ClanCpi2YzIGQw
 ZijkmqEhSCnHY7H4chEseO+Qpn+2oeTkZVKmoo4VtgQt1kPpBTG69NnBOFrXrjN1EtQxMAvROSp
 jKUPYyfOIO7WFV+0S1bgdc5UY5eOG/SgKq9W62nBDKFLZOu59grko28eTVD+CCD1oi0o2RU5yaB
 eO3WQkWy5dYsaIOG2tEUFGfw7q8RYVx1hw7j1mPvl3MGpNSpc/MGzzn/yW3sn/ejL+NKTGa9jUU
 LxGMjcMPOKTRBOlnaXSCqiaaaFtRNUJjhofKq0OdYIalzS9XNNSdt/vCzK1MpG+U/uxDZtWRl1H
 CXkSFQLixV9nNtPT3sbJLtx+YPyxog==
X-Proofpoint-ORIG-GUID: GJtwJGzjqhbt36mtpqVmZAv0Zz3HuI8b
X-Proofpoint-GUID: GJtwJGzjqhbt36mtpqVmZAv0Zz3HuI8b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270106



On 10/27/2025 3:17 PM, Heikki Krogerus wrote:
> Hi Krishna,
> 
>> +static int hd3ss3220_get_vbus_supply(struct hd3ss3220 *hd3ss3220)
>> +{
>> +	struct device_node *hd3ss3220_node = hd3ss3220->dev->of_node;
>> +	struct device_node *np;
>> +
>> +	np = of_graph_get_remote_node(hd3ss3220_node, 0, 0);
>> +	if (!np) {
>> +		dev_err(hd3ss3220->dev, "failed to get device node");
>> +		return -ENODEV;
>> +	}
> 
> So I guess that's the connector node. Why can't you just place the
> regulator reference to the hd3ss3220 controller node instead of the
> connector like the port controllers do?
> 
> That would allow us to do a simple devm_regulator_get_optional() call
> that's not tied to DT only.
> 

I did that in v1:
https://lore.kernel.org/all/20251002172539.586538-3-krishna.kurapati@oss.qualcomm.com/

But Dmitry mentioned that vbus supply must be in connector node:
https://lore.kernel.org/all/cbpne2d7yr2vpxmrrveqajlp3irzsglxroxyyjmviuci2ewted@6ewwp6yyybk5/

So keeping it in connector node.

>> +	hd3ss3220->vbus = of_regulator_get_optional(hd3ss3220->dev, np, "vbus");
>> +	if (IS_ERR(hd3ss3220->vbus))
>> +		hd3ss3220->vbus = NULL;
>> +
>> +	of_node_put(np);
>> +
>> +	return 0;
>> +}
>> +
>>   static int hd3ss3220_probe(struct i2c_client *client)
>>   {
>>   	struct typec_capability typec_cap = { };
> 
> <snip>
> 
>> +	ret = hd3ss3220_get_vbus_supply(hd3ss3220);
>> +	if (ret)
>> +		return dev_err_probe(hd3ss3220->dev, ret, "failed to get vbus\n");
> 
> I think you have resource leaks here. I'm pretty sure you need to do
> regulator_put() somewhere. You are also leaking the connector fwnode
> that was acquired just before this point..
> 

ACK. Will do regulator_put in cleanup path.
For device node of connector, i am doing of_node_put above.

>>   	if (IS_ERR(hd3ss3220->role_sw)) {
>>   		ret = PTR_ERR(hd3ss3220->role_sw);
>>   		goto err_put_fwnode;
> 
> Get the regulator here after the above condition. Then add a label for
> the regulator_put(). And you already have the handle to the connector
> fwnode so use that one instead of getting it again:
> 
>          hd3ss3220->vbus = of_regulator_get_optional(hd3ss3220->dev, to_of_node(connector), "vbus");
> 
> But do it like that only if you really can't place the vbus regulator
> reference to the controller node. I would really prefer that we could
> do a simple:
> 
>          hd3ss3220->vbus = devm_regulator_get_optional(hd3ss3220->dev, "vbus");

ACK.

Thanks for the review.

Regards,
Krishna,

