Return-Path: <linux-usb+bounces-29974-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0C3C279AC
	for <lists+linux-usb@lfdr.de>; Sat, 01 Nov 2025 09:33:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 63A844E1B11
	for <lists+linux-usb@lfdr.de>; Sat,  1 Nov 2025 08:33:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0730929BD85;
	Sat,  1 Nov 2025 08:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GQeoVRO4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TNtxl4YG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF49D22FDEA
	for <linux-usb@vger.kernel.org>; Sat,  1 Nov 2025 08:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761985997; cv=none; b=f+r9UIVlxsvcx5aaGmDdY7QLl1I0ajdXAZXqoCumo+hTt1f5b1ZndlhysoL4qPZqmtpiXWWjYhI970LVzkk+yz+kL1sLHa/EoIVGNHXq0i2j7lRTh5pJZT4gPwnwKfaM0sk9CMfu99GDZmjsGcBOg0s09Pun6E8cZlbJKjvrFp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761985997; c=relaxed/simple;
	bh=ObLleuuXiCyy0k0GQHPeloDgr9wtasoxLe9QBhJ45bk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JDiYtTAh99yDgy9j8eYTuv4+ygKco1r7IEBDBl5rpTlYgU0LkzCzKFNOFtjWfepR8Rlo5IHBTs2igh7H7xGrchaytTLrjdNLnzIX9uv+mwD3Te2qwfWLQGGSoctWsQQkMzX7XaHYmS8B3PjHAKlsTt+s1xvPgmzWcXUJS+LYZZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GQeoVRO4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TNtxl4YG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A10gdsX137440
	for <linux-usb@vger.kernel.org>; Sat, 1 Nov 2025 08:33:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nqJXnUpVCG/ORqhL7yku/zLy0QQjobgUxwiDLmcz9GQ=; b=GQeoVRO4V7xjPWIQ
	4HV7eJ/QYPWuIQZ25OcSfFi6t4syFHwTBIzLcUWJrl/Q7UlvxOaPmR8iDdcNLJGU
	ODYe1OfJpDcp5WOhDLhcWP/uzXd8sEYDOTY82szozpGBdbJQeeVCP3Q5Ty5nyDwY
	p7bSi7OcTDH3OZcm7W9RLcsYrykC1ajV5jlmmGQLYJDzmBAcSovBb7cjjbB8gXKl
	YElow+ZjF2WHQr4ZROVUb/5HhVqlXrcsPO4Zj2vyezBG2iifhsAI941+Wno5MLIY
	EpXotCfKnofx0jlLYwSkAIR1geqwH3mBuOBFdtXvuROY4Km9sbfQmZvQtn57ORwm
	7RAkKA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a57we8jh4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 01 Nov 2025 08:33:14 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e884663b25so79472791cf.0
        for <linux-usb@vger.kernel.org>; Sat, 01 Nov 2025 01:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761985994; x=1762590794; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nqJXnUpVCG/ORqhL7yku/zLy0QQjobgUxwiDLmcz9GQ=;
        b=TNtxl4YGBlo7S6eTxsqacJHNrxn3eCX7ftPaa1PKT7rLV3gw0u3H56N3J52Ljm4uXJ
         CzTUMtEQvH0HBAxx7dzzQDfoNoGr3Ztn4KQyvhQEmtrWP7n5DY8z9IMdDRwtIsF5pjEy
         tDTGl1CmnVcLa9WmEuNFCDk0DN8cr+tZnYGQ9/aCU5uR41HedsIlbuD3lb+01//g2oZk
         WTOQXyGbMFRdD1jhqPZQhqxVcJBXhi0LFCFw4KQ2PQeGnu1k1SMqkkwvhFnRgOhgqdtp
         Tz2qR+7AYnCuW7lRRkOt1cwxGjL2c8bRJa6sC/sOkJxcyjQPgB8HqnESMEGJO2F7NHY2
         Ugig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761985994; x=1762590794;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nqJXnUpVCG/ORqhL7yku/zLy0QQjobgUxwiDLmcz9GQ=;
        b=wXSK4i7SK+kg4vY2ixWAJZbE2UJShUwEehRekM7QkyTbEibaGqXKckeOBNvvTDuoCl
         +xWFRzPNns/WwpnQMB8sdkQR3Wvh9FZergks1kxHcCy5ir/1fah7YAgj8JjdXqRKhHk9
         JCP+3eiBEJ9265zzkzF9cTjX6DNISlfEQMk+vFOmgrviV1umPbDaaXyqVWxNDO0Nl5Ck
         REuvfz60xS92QG26yfKO8+plWeWqFZ4VepkznV4HkT5IuYG14rqhOF2nzHDsqUL0PIQ5
         qRKu4zEi6pvBmndyut1FxB3HGNclYXDs13/pzX6R71I8NEM1vfzbP6bgO0zQzO0LbX3G
         m8GQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZJRHZyoPAtRgg5mFhkzUEeMnIDKDVeReK2QoGjc+vVBK78AwGftcBkji0OIleqDBOqhNhuFUEZDE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDza8N1ocU5LDjN/rjO8iL6+dp0Wdxswuc23gbigAchhy27SMX
	Myk7mYPzISXfoyS3Rj/xtJ5f0dT1OPNR9awJUp/TthozayL/PRVumFafbQzblvKOKtVDuHLRyFf
	vxfjRPkBQLXFYvSLwp66jl9ISWc96lGwJ7wET4TN2uYvysUMjD8Li37Do1x98JGw=
X-Gm-Gg: ASbGncuAYK/FSzy9Z8ejqNwNqddKppYwxkckmCDLGWcp8I8U8IU5yrM0vudLDSroNWc
	gb0PuVrmXQC0cpT7Ro00DToz8VlFDwXfy0CrbbA+C5fcDRWaRvvyMssoKh+vE4oQsH+YnaP1GcT
	aSA6whdIMbbeF1oNQC97ju61EtN7pOpE5RUkNLFXZ4D3ayCM1oawa0XAgSEygsxXzXH6izGLi2x
	pigf/JVb1YHvSqSPVuWhp/+WCCeJNo6fu7Aj+ksO0zwhsdnZlKANhb/8NuuyUjcTvMXpJU4dr4j
	aLolI9mR0qXzOj/+uVrdNDWyLW//ixq+v+AZ501kZn2kmvjGf6CU+qBdZe27iAGYa5/QcuyZkpY
	ozA66zCJRVg+l/xkBt34imhjsQVOlUEVgwIW2AkCGzMRzN4D6vq9kA+Bh1tMtaPU5nJfh0+EQVU
	qTWFw=
X-Received: by 2002:a05:622a:f:b0:4ec:ef6e:585 with SMTP id d75a77b69052e-4ed31092e52mr69845161cf.73.1761985993713;
        Sat, 01 Nov 2025 01:33:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjxlNcvtZemgfEzaurOLn39ILOXBdIZYV/GaAa2BB1Q8njXxqv+Q1dUujxX/PkvYCAJHX3CQ==
X-Received: by 2002:a05:622a:f:b0:4ec:ef6e:585 with SMTP id d75a77b69052e-4ed31092e52mr69845011cf.73.1761985993287;
        Sat, 01 Nov 2025 01:33:13 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9? (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37a1bfb457esm9257311fa.18.2025.11.01.01.33.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Nov 2025 01:33:12 -0700 (PDT)
Message-ID: <8a9b245c-50fe-4750-bf22-e6d76242c5fa@oss.qualcomm.com>
Date: Sat, 1 Nov 2025 10:33:11 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] usb: typec: hd3ss3220: Enable VBUS based on ID pin
 state
To: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>,
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
 <243611cf-5083-40d0-a52a-02ab068aa942@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <243611cf-5083-40d0-a52a-02ab068aa942@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=M85A6iws c=1 sm=1 tr=0 ts=6905c5ca cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=C6kTdvVOAsgpZHLSUp4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: Hb2FMTCcWJ_i-nxCCtvMUK9FWWK7XewZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDA3MiBTYWx0ZWRfX/BRZ6aD6Gmcj
 dCw6Ay7o4G9+GMvny2L/weX4JFGseXmkVtqJeQejvhW64qMVIr+pLlhRo59TKyg88/oVpRCG+cN
 qRewJiywxI498B3MTpQZY0uapYRLpaM7ItfNxZnCqJzmzCbaHKa4Eqta/Yr1XdUGgamMbu/BMsN
 2UUItwtEUijKY6KPA0JzhYfsPGwEw82XjT0vgBrsb3G9wZTabvko5KHsKIraJRnPEy4vVfP/tJe
 OAfE1KrFbsHXn+rLgbAg+TPAXFEbY5h/jyx1I4J3RIjeMwyewWKN6yoxhv40NU7Th49+AtFNzQs
 a4nJq+bWGUKXP3Fmri6R2dMh5Xd//bkhjdDuotHKfI4zSh4l5MN+mrqN3y7tjjhEbLhSn6qZgd7
 HWTQ7cw5hiVgtvX8Bai2kCFMwoaRNQ==
X-Proofpoint-GUID: Hb2FMTCcWJ_i-nxCCtvMUK9FWWK7XewZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-01_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511010072

On 31/10/2025 08:45, Krishna Kurapati PSSNV wrote:
> 
> 
> On 10/27/2025 6:49 PM, Dmitry Baryshkov wrote:
>> On Mon, Oct 27, 2025 at 11:47:13AM +0200, Heikki Krogerus wrote:
>>> Hi Krishna,
>>>
>>>> +static int hd3ss3220_get_vbus_supply(struct hd3ss3220 *hd3ss3220)
>>>> +{
>>>> +    struct device_node *hd3ss3220_node = hd3ss3220->dev->of_node;
>>>> +    struct device_node *np;
>>>> +
>>>> +    np = of_graph_get_remote_node(hd3ss3220_node, 0, 0);
>>>> +    if (!np) {
>>>> +        dev_err(hd3ss3220->dev, "failed to get device node");
>>>> +        return -ENODEV;
>>>> +    }
>>>
>>> So I guess that's the connector node. Why can't you just place the
>>> regulator reference to the hd3ss3220 controller node instead of the
>>> connector like the port controllers do?
>>>
>>> That would allow us to do a simple devm_regulator_get_optional() call
>>> that's not tied to DT only.
>>
>> But we have devm_of_regulator_get_optional(), it was mentioned in the
>> previous email if I'm not mistaken. If we need, we should add
>> devm_fwnode_regulator_get(_optional).
>>
>> vbus supply is described as a part of the usb-c-connector schema, so
>> it is not that logical to describe it as a part of the Type-C
>> controller.
>>
>>
> 
> I tried the following as suggested:
> 
> hd3ss3220->vbus =  devm_of_regulator_get_optional(hd3ss3220->dev, 
> to_of_node(connector),
> if (IS_ERR(hd3ss3220->vbus))
>    hd3ss3220->vbus = NULL;
> 
> If there is a vbus supply I see its returning proper handle pointer.
> Else it returned ENODEV. (which is fine for our case as there is no vbus 
> in DT).
> 
> Can I mark the function as a void one. Instead of returning any int 
> value, would it be fine if to just mark vbus as NULL and proceed ?

You can only ignore -ENODEV. Any other error should be propagated back 
and cause an error in probing the hd3ss3220 driver.

> 
> Regards,
> Krishna,


-- 
With best wishes
Dmitry

