Return-Path: <linux-usb+bounces-30165-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A43BEC3C118
	for <lists+linux-usb@lfdr.de>; Thu, 06 Nov 2025 16:33:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B592518818BE
	for <lists+linux-usb@lfdr.de>; Thu,  6 Nov 2025 15:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC1E1289E17;
	Thu,  6 Nov 2025 15:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XSTpOU3h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OyeZ+Lyt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9913E28751F
	for <linux-usb@vger.kernel.org>; Thu,  6 Nov 2025 15:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762443075; cv=none; b=irQMF1s4sRfWcDbSiq51zbAInMvz/SNG4R7Hx1xQaQtHzVlYhzRKV87uYrnkv1qHOhPanXz81zo6hBIBa73Hb2suLR1T7jQuUpwrzA5DIf7d1Do8IikqjHgtt51FauF3U3s17tJHb1qQj2QvF5KYubt4tFliXxSkg12kbD6yEXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762443075; c=relaxed/simple;
	bh=d0f2bwoEjV6DeTx6fkmoJqsBnaW11PpPaYDMEC9kOpw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lIp4MN53dWPsE0T+C5HfGu+3dwyLBTz1p3rULes5GRG80iAUMx7h6IRR5nJHHECamLq0fcJf3Hhj29D7YIWhACKHNQxy5PGc64XipBAx+9yiDpLJHFhFY8sTD6MBMdfYj7ruN/W0DgwJkKabcERvXnQ50ZaCpsUnf6z8bgJt14s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XSTpOU3h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OyeZ+Lyt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A6ASiDo3748374
	for <linux-usb@vger.kernel.org>; Thu, 6 Nov 2025 15:31:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EO+nd39qsWV2EUlkl0SmdHZLP9GsrFgkZZtOwLjvreA=; b=XSTpOU3hTSbP/MX0
	R8F9gqG9GGfbRzTTCeEfKZ01iQJerygV9Wt96XVJOac5UE3CX1+98jpXWSNvMBJ8
	nDfD9PXd1l8q4rnXLLSCbJrRI+si4dbIS9KpQM64hAHLr+6o1gOd6SJPwsipPV2K
	pvtfWNGPQ4/2VhFmYY3LHB1j+yc5H/hQP6ToG5kWeqZtj40nd9icVceClumaI6c6
	/BTg3/cagqXYk1K1XYImS0uPsBAG7GE4X9r3PLfvYIjd6OrHi1f6C+5/ZEwSPuWm
	wL/dcCp5BsLnVWa2hPuPsLB8oqIc4KDFSixICzyT31veI4iL0TBrsG+y9yMKb2oG
	b6RqQA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8sy6guat-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 06 Nov 2025 15:31:12 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b969f3f5bb1so845201a12.0
        for <linux-usb@vger.kernel.org>; Thu, 06 Nov 2025 07:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762443071; x=1763047871; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EO+nd39qsWV2EUlkl0SmdHZLP9GsrFgkZZtOwLjvreA=;
        b=OyeZ+Lyt2heOLcif2dIY+Rf1U1F5ihzI2OBZeSJtWYNCzwvnYLYfUSrO0tZBPlED3P
         cy9sBvz5Nbky4z0Mo5rXdaFFWImGRt+cGrhBZmr2TqyCWpuNU9LzfXb/0DmZ9/xlUXwE
         lu7G42xGyKxsqlZweWWCVtpWbKsJAHIFS1isxIcaCeNoMX77NvKSyTsC2NavGJsE57hK
         iR06Zm6C/5jKC8QO93q/NPZ6NR9LPDnTpkekxowQcG51EcgGm7L1PJkZsyzE/Vxh1KdK
         I4qYSW4QYbPmAu9EymZE3sARfFSk+mdzbSMAW+9P5kXF8i+OYTaNLTk+j10dxPWvawtE
         TaWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762443071; x=1763047871;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EO+nd39qsWV2EUlkl0SmdHZLP9GsrFgkZZtOwLjvreA=;
        b=oy+ugAW0nFxT/N+uwQ1ABa/EEa4VAG186iCg/5wszN+gsFuP0XMtHt8Bav5/k49Oc2
         aTxN9prNZbVVqAuOrLAeB83mzTADgNQgy0AAn/zq1UYG13QGLPewcB0F7f2+OinKkxsu
         SbzsAbZK6s9Z8try8uzUmD7w+I/RVqNjBfKaz9DxtEmA2xdUXUTwwgImqzJ1UlbDP63S
         uSQNFQbfI1525F6PSB2Qy+haWYjEaWUFZM6Wml6hfcydMoITTpVOulVK0DUV8BpdiRAp
         jVLxEibHb2TeOhKPl8uef7fh5gdhEsSJyvfUr/kWk/ADevIQ30u8j/d8sKp27T7gGtM9
         Pjjw==
X-Forwarded-Encrypted: i=1; AJvYcCU62StgU3s1xtzimNSUKErYqMsxHMLKMxK/9qwpIjrWRwenPbOalsDjXlIka3A8l20yUFwbgAmnXHQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNLgVeX4N7DibOMPP6pNI3cT19vYgPlIUfCntrAhJ7QEs80ulS
	n+1I7jNCuuVmsuK12WlwqFyF9d7vi3Z2rSMC64tTvvd2NBMKeHdu1CMl0uhgpFfrSLCWg96v9UP
	qqk6hNZosnCNZnjot0RX8E1cJxA5+xjIdH8pUslsLe0avl108/hsFdT1N+xJtbd3Q3lc9eA8=
X-Gm-Gg: ASbGncv5xeeguz8WBhfjUt3uIPVwIPLlMAS6nEEMDAj7tVPsbvhE4Jhf+TfKOaWxuYh
	Dl2KkX725RAHb0tmjanmXXqk1ZX+iC+UXvRIU3GwhXo2XBxTLIf73GcWZ48JaW5l6kB/ZDsN01/
	xPy8rDAMOui5CA6BCFUGgv21vWgDETQk1ZKQxRsL7/wBPXkYb/b9ct23VNfE3bGngPwbxg5jQiM
	mxDB0+s/86I6hD5r3tG3U5pfCzQKRzAAnEg+05W6l72nKlhEbThMbiK83otMxtinH4ZLDPUZpNa
	e1oQeUW1H0MlvTpO/nAMJXuOgLCKQMjivrvLPiy7vQCe4dVONjST3iJLKZFshIShsyPj7i6dyaZ
	KTmQCC4SAP7cf2+Ib9n+5ASGlXI92KvN8JA==
X-Received: by 2002:a05:6a21:3d84:b0:34f:bf12:8e27 with SMTP id adf61e73a8af0-34fbf128ea8mr8971374637.13.1762443071061;
        Thu, 06 Nov 2025 07:31:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFOUzd1uTbvbHMqzgt2Y+kkpQNb+36amLdPBWT1pIua+eKBDxydfZowU9JJoXxPJtX6EG/QJQ==
X-Received: by 2002:a05:6a21:3d84:b0:34f:bf12:8e27 with SMTP id adf61e73a8af0-34fbf128ea8mr8971308637.13.1762443070469;
        Thu, 06 Nov 2025 07:31:10 -0800 (PST)
Received: from [192.168.1.3] ([182.65.157.163])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7af82205b11sm3147569b3a.45.2025.11.06.07.31.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 07:31:10 -0800 (PST)
Message-ID: <9bd003e0-4600-4b5f-97d7-efefe687f358@oss.qualcomm.com>
Date: Thu, 6 Nov 2025 21:01:03 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] usb: typec: hd3ss3220: Enable VBUS based on ID pin
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
References: <20251102164819.2798754-1-krishna.kurapati@oss.qualcomm.com>
 <20251102164819.2798754-3-krishna.kurapati@oss.qualcomm.com>
 <aQxyfjYosVd_kPKC@kuha.fi.intel.com>
Content-Language: en-US
From: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <aQxyfjYosVd_kPKC@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AYu83nXG c=1 sm=1 tr=0 ts=690cbf40 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fO48qRZoIuIFQjWVjTpNpw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=YkpnwElOSCd70Td7CIoA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDEyMiBTYWx0ZWRfXws+VVi7vLTmG
 lsw7T8MMj5dGfCQJcF5u92loE+GgV7+VFKdKw6WYZUda6w2PPXNKird+lD/I5Uiy7lGKiXaXi4E
 JdGjhZwYC3YPZ26cZoid2VO7OxhISvGf624LJr6sc3a3cWt4oM6nVN8fxQMrU7uUdHx7iQGGTip
 JbNufWMbH9P5Kzy0gNHajE3sbvaA9OJMMKpmIuwkfdXbCUOLSxd7dT//28nk0jlrnFzK6Qc8mCe
 q476jFdeUqjnkN5Hs8P4zHQCj7mTbDkE7S/lo6Wt6hqncQ4tJJgiAakU67swp13bhUnNAgs/zWV
 1lNK3JOOB4lg3pFNlI5DMLJ0Nxfy+TcVNOrneIJe5mJ+gz4n8hrv9fUjzYr8urTH4jIqcGyIj1F
 pi65+24X96XCkh4ac47Tu5AYcU7sJg==
X-Proofpoint-ORIG-GUID: ItUb-PcdaruYwf-DJUvy6hq_DlAhHnKG
X-Proofpoint-GUID: ItUb-PcdaruYwf-DJUvy6hq_DlAhHnKG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511060122



On 11/6/2025 3:35 PM, Heikki Krogerus wrote:
> Hi Krishna,
> 
> Sun, Nov 02, 2025 at 10:18:19PM +0530, Krishna Kurapati kirjoitti:
>> There is a ID pin present on HD3SS3220 controller that can be routed
>> to SoC. As per the datasheet:
>>
>> "Upon detecting a UFP device, HD3SS3220 will keep ID pin high if VBUS is
>> not at VSafe0V. Once VBUS is at VSafe0V, the HD3SS3220 will assert ID pin
>> low. This is done to enforce Type-C requirement that VBUS must be at
>> VSafe0V before re-enabling VBUS"
>>
>> Add support to read the ID pin state and enable VBUS accordingly.
>>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> ---
>>   drivers/usb/typec/hd3ss3220.c | 72 +++++++++++++++++++++++++++++++++++
>>   1 file changed, 72 insertions(+)
>>
>> diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
>> index 3ecc688dda82..75fbda42eaf4 100644
>> --- a/drivers/usb/typec/hd3ss3220.c
>> +++ b/drivers/usb/typec/hd3ss3220.c
>> @@ -15,6 +15,9 @@
>>   #include <linux/usb/typec.h>
>>   #include <linux/delay.h>
>>   #include <linux/workqueue.h>
>> +#include <linux/gpio/consumer.h>
>> +#include <linux/regulator/consumer.h>
>> +#include <linux/of_graph.h>
>>   
>>   #define HD3SS3220_REG_CN_STAT		0x08
>>   #define HD3SS3220_REG_CN_STAT_CTRL	0x09
>> @@ -54,6 +57,11 @@ struct hd3ss3220 {
>>   	struct delayed_work output_poll_work;
>>   	enum usb_role role_state;
>>   	bool poll;
>> +
>> +	struct gpio_desc *id_gpiod;
>> +	int id_irq;
>> +
>> +	struct regulator *vbus;
>>   };
>>   
>>   static int hd3ss3220_set_power_opmode(struct hd3ss3220 *hd3ss3220, int power_opmode)
>> @@ -319,6 +327,44 @@ static const struct regmap_config config = {
>>   	.max_register = 0x0A,
>>   };
>>   
>> +static irqreturn_t hd3ss3220_id_isr(int irq, void *dev_id)
>> +{
>> +	struct hd3ss3220 *hd3ss3220 = dev_id;
>> +	int ret;
>> +	int id;
>> +
>> +	if (!hd3ss3220->vbus)
>> +		return IRQ_HANDLED;
> 
> If you don't need this routine unless there is a vbus regulator, then
> don't register it at all if there is no vbus regulator.
> 

Will move vbus check before id retrieval in probe and ignore retrieval 
of ID if vbus is absent.

>> +	id = hd3ss3220->id_gpiod ? gpiod_get_value_cansleep(hd3ss3220->id_gpiod) : 1;
> 
> You still don't need to check for hd3ss3220->id_gpiod - this function
> will not get called unless it's there.
> 
>          if (gpiod_get_value_cansleep(hd3ss3220->id_gpiod))
>                  ret = regulator_disable(hd3ss3220->vbus);
>          else
>                  ret = regulator_enable(hd3ss3220->vbus);
> 

ACK.

> Note:
> 
> If you are concerned that the reference to the id_gpiod may be
> released before this routine is unregistered, then that condition will
> not help. The hd3ss3220->id_gpiod member is _not_ NULL after the
> reference is released.
> 
> If you need a specific order in which the references are released,
> then you can't use the resource management (devm_*) to automate things
> for you.

There is no specific order. So the id part I can keep it intact except 
for checking presence of ID pin in interrupt handler.

> 
>> +	if (!id) {
>> +		ret = regulator_enable(hd3ss3220->vbus);
>> +		if (ret)
>> +			dev_err(hd3ss3220->dev, "enable vbus regulator failed\n");
>> +	} else {
>> +		regulator_disable(hd3ss3220->vbus);
>> +	}
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static int hd3ss3220_get_vbus_supply(struct hd3ss3220 *hd3ss3220,
>> +				     struct fwnode_handle *connector)
>> +{
>> +	int ret  = 0;
>> +
>> +	hd3ss3220->vbus = devm_of_regulator_get_optional(hd3ss3220->dev,
>> +							 to_of_node(connector),
>> +							 "vbus");
>> +	if (PTR_ERR(hd3ss3220->vbus) == -ENODEV)
>> +		hd3ss3220->vbus = NULL;
>> +	else if (IS_ERR(hd3ss3220->vbus))
>> +		ret = PTR_ERR(hd3ss3220->vbus);
> 
> So the regulator API's optional functions return -ENODEV instead of NULL :(
> In any case, don't double assign the member. Use local variable.
> 
>          struct regulator *vbus;
> 
>          vbus = devm_of_regulator_get_optional(...
>          if (IS_ERR(vbus) && vbus != ERR_PTR(-ENODEV))
>                  return PTR_ERR(vbus);
> 
>          hd3ss3220->vbus = vbus;
>          return 0;
> 
> I don't think you need this function - just do that in the probe function.
> 

ACK.

Regards,
Krishna,

