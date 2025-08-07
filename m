Return-Path: <linux-usb+bounces-26581-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9916BB1D85C
	for <lists+linux-usb@lfdr.de>; Thu,  7 Aug 2025 14:57:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C19141653AF
	for <lists+linux-usb@lfdr.de>; Thu,  7 Aug 2025 12:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7BF62566E2;
	Thu,  7 Aug 2025 12:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SqHaH9ZJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CE13594C
	for <linux-usb@vger.kernel.org>; Thu,  7 Aug 2025 12:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754571421; cv=none; b=Ot1/O9fu+xH9TOWhwbLbjIweQz0WFwD1ZTR7AgRz1hOwIet6KhnWWyWODncfO+921NglLKtjokB7lpGzth4JSlwEpzBv5PjHi5Ze97nplk8AsY0ZPFp0bxJH3XWzeC0XtLmGpsAQwVNdUQa7yQMTzLgTeZqKDtR/lczhFd35bm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754571421; c=relaxed/simple;
	bh=+ti21F36hzIyeMi3iqLYoXGECEKA4dF5hB1/sbWmpNk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FPpIR9RtLVZ5Fd7nQ9JpBzyHyIPM8QLCi/VV1QsdY5YLOP7S+xnUyrgIOQX4q2/tzelyQLFpxWvCiP03Dmg+7O/Yl653o2is0SCSlYivD92/6Ajoswvh0fwzoUAocpeKQeH18RXwtaci1kQFj422zRvZvDL7WHSEILhOXRAeTn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SqHaH9ZJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5779D48w024853
	for <linux-usb@vger.kernel.org>; Thu, 7 Aug 2025 12:56:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rs/suGrOJP0BPrfZE4kiooTTaEQ8m0Lae2xORIeWkZA=; b=SqHaH9ZJWkJpW10y
	c0fiTZ79fUI+/4eeFZoqwHJn/LbUDVZ7Zrxo7ichxr8jG53VUxSFIBvCOZa1LpSH
	tbsHIwBGAW4VuCOmLK9Qg9XJgvWhJvuVBUL6QcrMYPnmJpa3Vd0lagG5jhPfCg0B
	TEFGguketGQPmMSf5ayc6NdgD6BzXyh6IZRk2GYKs2GTf4LW1xxh9FD0fKwRAzO5
	0CKJL96INsNfSf4lL+4mxvI9Ld/n/pSUQ6OwFkOYrxtaOTOFP7OtGjfbvP0B+oy9
	PNNUvpdJxi8wV7TOuheKGnYZnASXKsfcPkVGNheu/v70w7jqVfJwttY7BbA/iIMv
	GGiuEQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw1e979-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 07 Aug 2025 12:56:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b06ad8dadeso2393641cf.1
        for <linux-usb@vger.kernel.org>; Thu, 07 Aug 2025 05:56:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754571418; x=1755176218;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rs/suGrOJP0BPrfZE4kiooTTaEQ8m0Lae2xORIeWkZA=;
        b=XLUFik1gBBsMCU0zd/b9Fs1i7nDEhlfgUYk+3OXA2GOUdsvu1Sk1AdVNe68m+YUXvI
         PrK6gcl9XRYoukTPvXmfW8iFiRlM9eHg9DzmgBqv6T5pJRNqNmttQxFlJCp/jnvyemw6
         kIN8SGAACSlE32PnfuuC0/u6DJLMtmEk8MQiwXI0EOAlNmM6CXjLpdyjX8oum8caBl36
         xXyMTyP3ADfIK+Flo2nckw32YfAVW3pjoiRAimUSFMWvq3Cgya3fyIWLQ8qDzrmypGRc
         H0R5l+x8euyEzR3x6S3nCN+tzT4jG6BaR+XndcTmtZOF6Im5ikVdXBQ0/owU5FqmA2kZ
         7uAA==
X-Forwarded-Encrypted: i=1; AJvYcCWsvZP3y7+g+8Qtt7lcwNRDY+XXBS4GF75IA/NtQ2mu1TIoxV+eL+GtDY/sSg0FfBtCfUUSikNRIws=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQV23PObkYJ+e+vvGRIezOkd+TMwmV7gn1ePY9z1JR3gQvB6Ak
	CYJW+r4G0fAP414+tIVj09dZzHvY896plpQrOtCRup4FmnsxA2EDcWEX7Velx7NQLY7ILPunr+j
	VUfVJF5h9yYZUDvxX8hp1FUI2xBpnLQsWR0YelMCDAmyeex+GvL/yaxj/z84gN98=
X-Gm-Gg: ASbGnctZxKfYilPmXKM317dDFUT105AsE69SMinu4o3vLfpm7LKSQF+FV9cXnXbmNl3
	iH5NppVQdy0xvQYvE2q9FpT4YEala1PXaAa6iPTjlm6tq2VUqm3P+v7PdK++ychqQBThCz8KOgB
	0fx2yf0N1A4tAXPyjT+fmhLRIqYTNiTwILiM84gAhGChBLQiTV9TxEEwGFLNojKKYWdQf+llSEK
	ul3UpkhAVMb66Lbs5GJpVJGEUWgPvXszZ/OIeV5t92RRoYBD3nRwgW5AhY5QB04nGKsfFFdJhmR
	Cka5vXGF3bw5zl/H695Dq6Pklu25bJcax7QMt+B9ghdrr3Ai7Kl+9CJLdBlfzvpxfSJdTA/nKxc
	tdj40+N0ObPBp1Hc1kQ==
X-Received: by 2002:ac8:5749:0:b0:472:2122:5a37 with SMTP id d75a77b69052e-4b09135e41amr53229471cf.4.1754571417872;
        Thu, 07 Aug 2025 05:56:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZnomUsqZ2CreTcOGq6BMGfm1RnWr01IsDdTPln/U7H3ddYFyVhGlaxBP4aHtRcryBUJPKiQ==
X-Received: by 2002:ac8:5749:0:b0:472:2122:5a37 with SMTP id d75a77b69052e-4b09135e41amr53229281cf.4.1754571417408;
        Thu, 07 Aug 2025 05:56:57 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a23bedcsm1300244566b.120.2025.08.07.05.56.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 05:56:56 -0700 (PDT)
Message-ID: <abcbdb9a-f067-4bd1-be17-fe11b24dfacc@oss.qualcomm.com>
Date: Thu, 7 Aug 2025 14:56:55 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] usb: dwc3: qcom: Implement glue callbacks to
 facilitate runtime suspend
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20250806095828.1582917-1-krishna.kurapati@oss.qualcomm.com>
 <20250806095828.1582917-3-krishna.kurapati@oss.qualcomm.com>
 <83c54b3e-8e31-4ca1-9ca6-31703211d507@oss.qualcomm.com>
 <233c62be-c0fa-499e-9f8f-e90cf0b23aa3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <233c62be-c0fa-499e-9f8f-e90cf0b23aa3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX4BSqmeVTqyW5
 ljlLIw/38wclzusf2FWAdeOJBXInszdOqRotZpRbNceHhVUplz62QozbVQq8OeDMT20vqTz9cao
 EYq7iI/Q5VrXV+2r9QsHN3Kw1dBjqgGFljEWIm6pEnCG6sIY0Y2JktLV3FTVIbro5ZTm8IWcoou
 11vbq2/f2HsdOgAhUb49x0380PLEAuQO8V8bw8yk0PCRmzFyy/XRPaq80uE1bFaIXDyYvfCNrir
 fSTVMAzqNxbBmCyC7asvs95A+boFZ1+UaFzkmteyh9uk7ocqhHyhE9qNfoCsXrLk0s0ayYuy0SW
 SNJTMvsLblm+GmaajqzzviRgHNYpz2XWtyAkP5WEnu8Y1TU+Y5CpuCkStFnWGDXS/4Bbw/C+dX+
 sC4n9gqF
X-Authority-Analysis: v=2.4 cv=Ha4UTjE8 c=1 sm=1 tr=0 ts=6894a29b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=ft_1D6qkK9_HpyV9u2kA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: tAynAwxHoOMG-W9uhyNUyMWB10MfJVYF
X-Proofpoint-GUID: tAynAwxHoOMG-W9uhyNUyMWB10MfJVYF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

On 8/7/25 7:17 AM, Krishna Kurapati wrote:
> 
> 
> On 8/6/2025 4:02 PM, Konrad Dybcio wrote:
>> On 8/6/25 11:58 AM, Krishna Kurapati wrote:
> 

[...]

>>> +    if (qcom->mode == USB_DR_MODE_HOST) {
>>> +        qcom->current_role = USB_ROLE_HOST;
>>> +    } else if (qcom->mode == USB_DR_MODE_PERIPHERAL) {
>>> +        qcom->current_role = USB_ROLE_DEVICE;
>>> +        dwc3_qcom_vbus_override_enable(qcom, true);
>>> +    } else {
>>> +        if ((device_property_read_bool(dev, "usb-role-switch")) &&
>>> +            (usb_get_role_switch_default_mode(dev) == USB_DR_MODE_HOST))
>>
>> currently this will never be true on any qcom dt ("role-switch-default-mode" is
>> not present anywhere)
> 
> Agree. But I wrote for the sake of covering all cases and just in case anyone uses this property tomorrow.

This is fine, just wanted to make sure this is intended

Konrad

