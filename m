Return-Path: <linux-usb+bounces-29935-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B8024C236C8
	for <lists+linux-usb@lfdr.de>; Fri, 31 Oct 2025 07:46:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5C6E934B000
	for <lists+linux-usb@lfdr.de>; Fri, 31 Oct 2025 06:46:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38250EEBA;
	Fri, 31 Oct 2025 06:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lfv11ZxU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fWTbR1TN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8AD34D389
	for <linux-usb@vger.kernel.org>; Fri, 31 Oct 2025 06:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761893154; cv=none; b=OCohBMWkEXAoIbSY9nWhNRAFP6hNOe5R/fnp2m5r0QmVLFHU2AUTLWqkQBjam4fULm8Dige0oRUF8tFkrRDvp98YtYrrVFSokuwk/tfleFgQHVLCELQRrze4yfOxX5A9EvGdpvoQ8Ng/q99JsJNRd73vtaGrr95zpDtDCgRhF84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761893154; c=relaxed/simple;
	bh=4mDKPiwijcCUcLECjmk1k70WoDUtyStMf561zAWJbWQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KInM0NZjFhQKSvJKVh5uCqT3yeGmL2uwCtC2/5IqSJe9c+CyT9jDCB/Zwb0EVUzYC8TQcJExPGXQdGnFsD9PevITGKRGdXT1NhzdrnBCzRMGFD3NwWkoLB4cMw+2yU8oNxBSHTz+5Q2FhUpBSPm4ZXnZ9ItGfMbLbhrTcDd+2ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lfv11ZxU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fWTbR1TN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V184KV1513338
	for <linux-usb@vger.kernel.org>; Fri, 31 Oct 2025 06:45:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8+POVQ2MjdX0Ko68NYFwX8sDHAhvCK/iScwO3CN7WR8=; b=lfv11ZxUfBeydLcS
	h0WgM4WqU59FWCjRTe3Nv7rjtVSFSHuLDlP7OD/tsb/d8OKy+VWb8gofKoxtzXLm
	tc5oLjLJbXg5EWVQF+hOf3bmVtnrgFSAbab264RkB9eyOj/eqK+1ulnQ6Ep4W3LN
	rfIQ8nc3xXtBr2EusjfAhE0HscsP4ZtKI+YVU1EEiocRK+xqNF4gaOlyyN0G1Z6E
	layTY9gIGj4fWCjKGu0ArXJ7+aBUZvM21PDZAjtSdUzZ8Vvl7nG6ajoBYQAYwmAb
	HriSPHBPdfGbynzxtwspfLjhsuRti9HVH9ZBhFC/wlcpTYV4nqXQ01xX5U9eaBVn
	v3rL1w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4k69gqhy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 31 Oct 2025 06:45:52 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7810912fc31so1964178b3a.3
        for <linux-usb@vger.kernel.org>; Thu, 30 Oct 2025 23:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761893151; x=1762497951; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8+POVQ2MjdX0Ko68NYFwX8sDHAhvCK/iScwO3CN7WR8=;
        b=fWTbR1TNL68tYgcg1GYPi4S1Qxo1xrMCUTlspxngsN9ybZL5X8wfxZR62N30NLbosa
         Kc5OL7FZC08cHME/7i0u4eMAvNegmCSekhYp55M4D1XjN1PqExl0YvqlOkRAIfyzqs76
         30eHPvpuhS9c3EmaDl0dHxJddoan+TaKyixCd3OHs7lRBGe44oU2q9RH4scoIEbHEcOl
         fqyjT1JY2wDq6RsxXdWOJSGiOqGp3WXtUH5+E7o9YR4rHIjiZ9wrMqvUC07mFA0NIm8c
         ye5+9HPa/cHgp6FspjHdWZCqVsHTKVX0u3nD9qEZqdN/pHHaA7aFXGESUcfA/mhtm3Ca
         Z++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761893151; x=1762497951;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8+POVQ2MjdX0Ko68NYFwX8sDHAhvCK/iScwO3CN7WR8=;
        b=kKKF/f4KCkznPqYJW3I0lhEtGmmHK9apE5VRkj7/Szwx2LMXN51r2YqyJOJiIZnp9v
         swIh6bjCMsuhLk1mtHP7UB8a9zXI/u19EpeIL0DljtzpwkmxicmmGCMIc1qoWacVIHk7
         ZjjWNfQa+aRXwHukwIuDV/rsvOBs+Cyfy5TYDo7tE/g8E570oYP1mhuxAWdZSkhUpZ4z
         k5gH6LmnqF1CQgs2IShabkRlUwDlvBZaS6KpsxhAeCMT6lGX/fGKDF644cFszVtU9YKq
         cfLRi9nFvel0i2y7UdHwW+PhZvO//JSekMw406fJuuJlk+y9zLqqAUGZlxGS058D+TvT
         9Zug==
X-Forwarded-Encrypted: i=1; AJvYcCWm0tamHNVAuJ54V4fno/CfxzGfKWZuq7sG7acP3qhpCZr2mG86P6vvosMZUUy9QmouktPjBA9AxdE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFWZ5r7JwMD4uYRnSeOVRwNgkbOg7J9bS+3oFw7IMV1wu6N3L1
	fjrpuKqFttS9qqLOo/aDJ550ezGxEYRv7cwxOyhJgjtx6RrcqeQpKtuQkBVMDosYKhct1GdUHAM
	u4nmYUqd99zQ3EVgQ1snu97PTyHXry/rdHelWwaRw9u6ZQy9eOV4u57JEL8BPCYk=
X-Gm-Gg: ASbGnctRVsQkBcingV0l5A24iWyENusR7yjRhSqAUROs11ckaXGR2oazayox3Te8qrx
	AhUFVK9Zcfev8yx2Y0xTA39ZNmHqMEbVK+VpmmbcTMj8afaDL0MiGRKxFtqNOAZegkpQKPBoywQ
	SvA1xgqwqBQWhLzskTS29UkSRNhUOsKNoTqi7LERaxuKBSU4Bvcqy5IvamoQK8P13EcEQPvhss6
	xiHqTXxb0ar7E+IpYuMLjhq9Y6hOrqe2tbn1ARNK5dXk9GpnhWAfSf3qgckMl3587NJSGecrG8t
	FkCLL0LONii0mX1KpELcrQZn27ST9iXInxnToMTlR3YwU9cA5Z8w6LmCj+i9qWmONSGQfYHUjP+
	/dr0Syla8CBeNVNZ6EcchPU4Vq/zKiAFkiA==
X-Received: by 2002:a05:6a00:4b4c:b0:781:16de:cc1a with SMTP id d2e1a72fcca58-7a779eefde4mr3424208b3a.32.1761893151056;
        Thu, 30 Oct 2025 23:45:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF73VoIykEZxaNOFz9IRm7VMZZgIVQu6YxsNUcvXtPMIg+/AsyYNHrOPS/22IPBLWrpXB6VFQ==
X-Received: by 2002:a05:6a00:4b4c:b0:781:16de:cc1a with SMTP id d2e1a72fcca58-7a779eefde4mr3424172b3a.32.1761893150519;
        Thu, 30 Oct 2025 23:45:50 -0700 (PDT)
Received: from [192.168.1.3] ([122.178.56.191])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7d8d72733sm1012662b3a.21.2025.10.30.23.45.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 23:45:50 -0700 (PDT)
Message-ID: <243611cf-5083-40d0-a52a-02ab068aa942@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 12:15:44 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] usb: typec: hd3ss3220: Enable VBUS based on ID pin
 state
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251027072741.1050177-1-krishna.kurapati@oss.qualcomm.com>
 <20251027072741.1050177-3-krishna.kurapati@oss.qualcomm.com>
 <aP8_oZlJ4466BEf0@kuha.fi.intel.com>
 <34atfkavrxtv5xdekrlhhkxx4rxs3ueclxrmou5pquym5fsycv@i7mv7ssdlm2v>
Content-Language: en-US
From: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <34atfkavrxtv5xdekrlhhkxx4rxs3ueclxrmou5pquym5fsycv@i7mv7ssdlm2v>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: EemwD5y6J9KRowaXANX-KLeJtlnqUj0U
X-Proofpoint-GUID: EemwD5y6J9KRowaXANX-KLeJtlnqUj0U
X-Authority-Analysis: v=2.4 cv=OYaVzxTY c=1 sm=1 tr=0 ts=69045b20 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nBTQbq2h+7tEuhtSPO5ERQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EwX5Vcz9EM-XOFURiZgA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDA2MCBTYWx0ZWRfX3yLVM98ecqOC
 /97dwRuC6i4YMaqh2l3zeASd9vVvlh7nrEQMZx0RQIEN+9kAEd6eamzPx6xj6xXsGR4iepXwDrG
 smXIXy1F6VEUPVZV7rWVrmur5hyTci7+JKHtYZDkkoq9LXkzzXjFiqGlMA5uWOdJNlpRzobmEN/
 puox5PPJzil4HhBgauA5TrBh00cOiO+BsyjTJsLBoVeYt+EkrM+/ESWxkwf62jgS5rZ7F5uT3sL
 BFxSP0K44F8yljCPYvIRN3+5iMHuZFUwPa/GWAZ1Pjh82jZCXJqUevF0cJG6cYww9ce5ukB0VLc
 2kz3n9kWGlaaipAw5rhjOQppLiBOe8yIXMgLhBUXzkRj6RxL5Q3IRAyCdHcrDVKWdlGeMxCCl2o
 0/b20bQ/ACf+yP8jRfZELAdbsOPdxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310060



On 10/27/2025 6:49 PM, Dmitry Baryshkov wrote:
> On Mon, Oct 27, 2025 at 11:47:13AM +0200, Heikki Krogerus wrote:
>> Hi Krishna,
>>
>>> +static int hd3ss3220_get_vbus_supply(struct hd3ss3220 *hd3ss3220)
>>> +{
>>> +	struct device_node *hd3ss3220_node = hd3ss3220->dev->of_node;
>>> +	struct device_node *np;
>>> +
>>> +	np = of_graph_get_remote_node(hd3ss3220_node, 0, 0);
>>> +	if (!np) {
>>> +		dev_err(hd3ss3220->dev, "failed to get device node");
>>> +		return -ENODEV;
>>> +	}
>>
>> So I guess that's the connector node. Why can't you just place the
>> regulator reference to the hd3ss3220 controller node instead of the
>> connector like the port controllers do?
>>
>> That would allow us to do a simple devm_regulator_get_optional() call
>> that's not tied to DT only.
> 
> But we have devm_of_regulator_get_optional(), it was mentioned in the
> previous email if I'm not mistaken. If we need, we should add
> devm_fwnode_regulator_get(_optional).
> 
> vbus supply is described as a part of the usb-c-connector schema, so
> it is not that logical to describe it as a part of the Type-C
> controller.
> 
> 

I tried the following as suggested:

hd3ss3220->vbus =  devm_of_regulator_get_optional(hd3ss3220->dev, 
to_of_node(connector),
if (IS_ERR(hd3ss3220->vbus))
   hd3ss3220->vbus = NULL;

If there is a vbus supply I see its returning proper handle pointer.
Else it returned ENODEV. (which is fine for our case as there is no vbus 
in DT).

Can I mark the function as a void one. Instead of returning any int 
value, would it be fine if to just mark vbus as NULL and proceed ?

Regards,
Krishna,

