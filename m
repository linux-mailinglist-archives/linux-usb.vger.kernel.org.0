Return-Path: <linux-usb+bounces-17792-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 502FD9D5830
	for <lists+linux-usb@lfdr.de>; Fri, 22 Nov 2024 03:16:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF5411F221EB
	for <lists+linux-usb@lfdr.de>; Fri, 22 Nov 2024 02:16:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5DA815ADAB;
	Fri, 22 Nov 2024 02:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l172e2LS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702A070824
	for <linux-usb@vger.kernel.org>; Fri, 22 Nov 2024 02:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732241738; cv=none; b=qvdFVxEUCft2SNwp4A7e7OlQowBEM66zVBlhULOuX6mGGFWMz6BnnGBnwxClc0nG9pdGvrTFuuX28zc4W7dfmyunODGFEFwIBqHTjGN+etn+dSnuxCDBpgcWy6lUuNcwNsWL1QnMQHdSyoPp6TPYz0Oc0wEPId+z292SqLaXK6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732241738; c=relaxed/simple;
	bh=VxyaAawq635VFwxzjMATQmgnv597ejgjim9U2dP1BzQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HhUhOyh2kIyaT9J+2H2QDhiARk0z0SGrpSHmzgryo7sZWL11h1Zd9kGJF7oWso1yp1D+3YfTL0gT45eI6jjPaZf3gOTWb2ezLI8usiNEnIrp3sc5xfv8RR1bJxkoaXJIwGuwlFU9jUEOkimIJt8dhVwUF2hsyk1OtzQ/fNXfvFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l172e2LS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ALGQs3h023179
	for <linux-usb@vger.kernel.org>; Fri, 22 Nov 2024 02:15:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Soz8pIZ6jRj2Y5v7S/U4s/n0e2OeYV7kUBu2uRLlbI0=; b=l172e2LS9szWZQOM
	QajQ9SZ7bgA5U+G3V724DLiyhJ5jTmibJ5oz3KXVtgJt99IT0mRj0rXsgb3xyCU4
	MaHTri/szhqM5bJ4atc/+P3oyljhPcTLP71Mf7uU5VyndU3G5yJlkTwyv1QIDLct
	tH3AjewNVks6Q2kcWCVYyzunDTLKzre2+BA/0Kl5ZVtChNSTtzmDY5CYMNU8q3bg
	faVl4ONiOb/Z5+6qu9TqWmcoI7gXOAhSqyL3fdzsjypXLli8NsrMcIlHyQHqWL+9
	JLH0D7Q+/YM/pZBYch4kEHrR4hLJhe7uDxm+JX7SovFlpr96iM0MBob1dxVsytHS
	3sxRZw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4320wk2rvy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 22 Nov 2024 02:15:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4609b352aa9so3685441cf.3
        for <linux-usb@vger.kernel.org>; Thu, 21 Nov 2024 18:15:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732241734; x=1732846534;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Soz8pIZ6jRj2Y5v7S/U4s/n0e2OeYV7kUBu2uRLlbI0=;
        b=HqpnVGivkxMmh9tXrZ3+MGF9ioQA1bLWHYRqogTWpjRvklQz1BP8zouxcgwNKeKx0g
         aYWfHN9Q+jsuQ8/jW/xbJWljKQNfnemHM1vDY45Qg071HpUOanT5LJG+dFqEdI0h8/5C
         ceWOpMU+8eLExCaI1WgQfIVf7cGC6SE7pz38MA2ebPVrM0Q5+XENE8OjJVzB+svJ0vBH
         d51qxoIwSzT1fuPeNrZYNZsgKCkrn1VGIA1lCjAGknKdWbyvQN4Pxzx0ZteByNnPm2+4
         qw8C5UHnHgIKaiifJ1lFKMXcau/zShFjIu7v8AS0d+UD4QhJ5P9SLuf8/9jiONTR6p77
         qi0g==
X-Forwarded-Encrypted: i=1; AJvYcCVCrlHKGdBFcP8Mss1k/nklldwFwqmL/u9JW2TDnQR99XrY1Gqu8Ixl4yy4ARVTSTwDYkl4Lco34mU=@vger.kernel.org
X-Gm-Message-State: AOJu0YydrIvxiLw1oQIDe1AX0aEwBBPMW6eH3uZ3L5n6++b+SueYrKbw
	BZqK6oh2l0hFiXfjR6F1r4OXyFl+Z+JzwFcu7eWPYRXbWyUda5iFDhLYTRBjXKj5QRjnKPsIYet
	abm9eJy7T0Bm67IwOYG9JSpXsbVmAJgW7K2uf7K8mFFzWs5G54eWMrStNqBA=
X-Gm-Gg: ASbGnct5G/mxnvce/Uqg62G+TweAFZAuh0LCrMd0G6FTRA4daiylOZMzd7Q3CzKwlr1
	KDxsHeM5hBZIqnS9sYv7Jm8Mkgq4DSrxHjy0xiTcNWUisjtZenhSG/WIzMQidvYSsONP+4z4dWB
	SidPHXIGIqncyvtbPdbPsqmpLTwBbInGESNMfVt6Z+aGqnKvE6LJ+FiW6iRLJ5loWI2MOPd5HOg
	cqlgeo+OOiFOTjp12yBv0vC+2PsCgXsVkaS1ZJG8DVTA3PKcZOL80HvuEBKcGj0mH9jXcchxoRY
	PpSzpjt6d/tmFbgHN2ezgPM43ENPmAE=
X-Received: by 2002:a05:622a:54f:b0:460:ab1b:5ab7 with SMTP id d75a77b69052e-4653d6169b7mr9099821cf.12.1732241734369;
        Thu, 21 Nov 2024 18:15:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFPk1lo1tsdbgqDNM7SSd71npxOR9gKFtFNgAppNMiNw7ZLX7BIToVocOUHAYiuJYlS0LI2Ag==
X-Received: by 2002:a05:622a:54f:b0:460:ab1b:5ab7 with SMTP id d75a77b69052e-4653d6169b7mr9099661cf.12.1732241733994;
        Thu, 21 Nov 2024 18:15:33 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d01d3be73fsm378301a12.39.2024.11.21.18.15.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Nov 2024 18:15:32 -0800 (PST)
Message-ID: <68366576-7b3e-4812-8e4e-ed0aa2b4cd01@oss.qualcomm.com>
Date: Fri, 22 Nov 2024 03:15:29 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: usb: qcom,dwc3: Make ss_phy_irq optional for
 X1E80100
To: Rob Herring <robh@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241116-topic-x1e_usb2_bindings-v1-1-dde2d63f428f@oss.qualcomm.com>
 <20241119171315.GA1805024-robh@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241119171315.GA1805024-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _qp1PJ6uBMaodKmySGpfM3Rc7QkKivNe
X-Proofpoint-GUID: _qp1PJ6uBMaodKmySGpfM3Rc7QkKivNe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=428
 adultscore=0 mlxscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411220017

On 19.11.2024 6:13 PM, Rob Herring wrote:
> On Sat, Nov 16, 2024 at 12:17:52PM +0100, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> X1 has multiple DWC3 hosts, including one that's USB2, which naturally
>> means it doesn't have a SuperSpeed interrupt. Make it optional to fix
>> warnings such as:
>>
>> usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
> 
> That's a good start, but what about all the other warnings for usb 
> interrupts?:
> 
>      13  usb@f92f8800: 'interrupt-names' is a required property
>      11  usb@76f8800: interrupt-names: ['pwr_event', 'qusb2_phy', 'hs_phy_irq'] is too short
>      11  usb@6af8800: interrupts: [[0, 347, 4], [0, 243, 4]] is too short
>      11  usb@6af8800: interrupt-names:1: 'qusb2_phy' was expected
>      11  usb@6af8800: interrupt-names:0: 'pwr_event' was expected
>      11  usb@6af8800: interrupt-names: ['hs_phy_irq', 'ss_phy_irq'] is too short
>       9  usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
>       7  usb@c2f8800: interrupt-names: ['pwr_event', 'qusb2_phy', 'hs_phy_irq'] is too short
>       5  usb@8af8800: interrupts-extended: [[1, 0, 134, 4]] is too short
>       5  usb@8af8800: interrupt-names: ['pwr_event'] is too short
>       4  usb@8af8800: interrupts: [[0, 62, 4]] is too short
>       4  usb@8af8800: interrupt-names: ['hs_phy_irq'] is too short

I'll address most of those shortly. Need to dig up a couple old devices
to make sure my findings reflect reality ;)

Konrad

