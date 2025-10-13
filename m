Return-Path: <linux-usb+bounces-29183-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D31BD111E
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 03:17:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 707AE1894E73
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 01:17:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10CDB1F1313;
	Mon, 13 Oct 2025 01:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yr16g2if"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC2B154423
	for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 01:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760318234; cv=none; b=JpPLbq8MuACZdS7aRa8ew91vI7D1Xsvxur31Fsozy/ntsi+hDwitBOHywSS/5db24+mDqLgMVryVh818ajefQI+4YNrYkqpvKV/0+zhGEXEIaZPhMtWcqoR6l85ivF00XkqPpFnVLCG+GA3yZJE8pgXiOCyzTne+vmRoari+RIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760318234; c=relaxed/simple;
	bh=eLDXrWIZIZS9HoCmx0lw5R7FSldNWeUebH17d50SzwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RyRKo4xJb+qHm2UWTHjtP8WEVLs2O7CjSt4jHU8yRhXkrFUB7+3gQDkfoiERwwemCNYJdHqTGiOxO0xEQY/EyDulDeZPndCOYjb9RL5Mf3t6hsavTELT3UQLtrWIWZH7PrYvX+Tc7I+lr2X8wkLsg9CAXZ4OKjdB7NSGsTk9qq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yr16g2if; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59CN6nVr031657
	for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 01:17:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kr0l1PGyoz3ywSkxFsHdAj7RmD+86+u7L70Zpf7p2Ic=; b=Yr16g2ifz0A5E27m
	0jOePQAkbUw+Mc4ML2vKzh1MUuAPcktIQ7xn9sza/C6bKWe10zPxoQx327O/SHQA
	CTLvI736DXEM4y6f7seIwm6W5fhbXWdiY9u1pQwF6LAQodwKDGKZ5OIfQ6x9gDiC
	661ShsfImEi7ndY8zYPJjOhtiQFHRuW3i7p8zPXPEP2Is/797bt/TJVEF3xfX3Sr
	6ofPtdBccm1GS1TLp9rivdZS3EJ+aQFnv4PLUMNKhAxnAxoK4QFCPvfYkvZwKdtN
	BUpY/aG/jTSY43IdB43KCxfv9+W7lo9bE7GIcWr7GUeuonrxV0GBkKIVBx+mlyVH
	hMJKWw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qgdftr34-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 01:17:12 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b552f91033cso10138995a12.1
        for <linux-usb@vger.kernel.org>; Sun, 12 Oct 2025 18:17:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760318231; x=1760923031;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kr0l1PGyoz3ywSkxFsHdAj7RmD+86+u7L70Zpf7p2Ic=;
        b=BafN9ejJXFRoQic0MTxFxh5PK7YaiZex+wCtZCXhdEiBvyGOBNv4PreEtwFlKi36vy
         vxnx95QOBos7GvIwDQmyHOvRFpRwRElR/oEaA+jcupzLSSRom0hQURD3XqdFs46WHXsS
         z+27BWiwN9PIivOW7X+m68+7bAQ/3CCBhwBjgkvGEYPrsML+fGykN4U/uoMwbWh4RDBA
         D/pfVZQygsAlrIYUhVExe13H6yUy2BacIMVmeDChJ1XwERAl2Vf4P9wC4Wmjel20ymnO
         uzib0BqdXM0/YplxlySySyKtHljuVYNFCMWvoGWnV0sjnsNxi957X5ZX2iJQ3gbTeRgc
         +tXg==
X-Forwarded-Encrypted: i=1; AJvYcCU57//nfCTWMlOWTFf2zgGm5Qb1Rwrwty9/ffpcfWqThejnimisy4qsgNGrjVInyENsBnWCwpPuP7Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyX/wuH8XiKYkMV24q/xYUqRBFPtxNrsXbmezyfoNYScKI2Fo0D
	B+E52Ph/fKhoU7GtGjQFHOQvFwcWi8rHyoT5aaVuFVm8luWpcn8+n2o9EAAA8pT6v9mmzNJy8IU
	zDsLdv5O98uf0CLfoLRavXnvq8ZuQ6bxcshJsDzNu70q2GhvmvxDhF3E+LMlVEw4=
X-Gm-Gg: ASbGncty3yARcpdjs66e/bmRgzHHA0hF9K2zyGGhgSOq8OPS6IbtprPOcKbRn5N5l61
	5GPNHFM6N5C0jqW1/bSIfHrWboIbh2e8n6moUBC3GmudGqwNRhRSWPer4Vi2pJ18LiOe3x2rBYu
	Liz2CjX55jVn2sELj91skldrCCc12iy1aGJG4vI4HpA3rGOYKFplO0G8L191hzNuxIHp6dbyuxh
	AUSmypsBj+4SW0lHQn6aIhpEMWrDhUPyK0j2J2Mk+nSrejSVmIUw+o1gx4f6pbAoqgjXLVcy/5s
	YnX0Wk9vwUvqHYXQhEOq9c2qQaKtaWDxdRYn8uYc0Tk7skQRgdWIMe0qdWHkvfsyD9wBUA+qkqx
	Y
X-Received: by 2002:a05:6a20:94c9:b0:2fb:530a:d665 with SMTP id adf61e73a8af0-32da845feb7mr24545152637.47.1760318231234;
        Sun, 12 Oct 2025 18:17:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbXXwK6X9WWZzaeXl2x5oqTCDc2a3vDXCVPXq5BQZntaW2UbpT4Pvzz/GZ/t/MTiejgocc2A==
X-Received: by 2002:a05:6a20:94c9:b0:2fb:530a:d665 with SMTP id adf61e73a8af0-32da845feb7mr24545126637.47.1760318230792;
        Sun, 12 Oct 2025 18:17:10 -0700 (PDT)
Received: from [192.168.1.3] ([122.164.228.230])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b678df48a83sm8135399a12.31.2025.10.12.18.17.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Oct 2025 18:17:10 -0700 (PDT)
Message-ID: <2a088c8f-5555-490e-a70d-308a876924ca@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 06:47:04 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: ti,hd3ss3220: Add support for
 VBUS based on ID state
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251008175750.1770454-1-krishna.kurapati@oss.qualcomm.com>
 <20251008175750.1770454-2-krishna.kurapati@oss.qualcomm.com>
 <odikli6rfdyid5oqavurtqytgnwgh5hpmka2jt5tprpdw7cd72@icpnjnkfowt7>
 <20251009131543.GA379737-robh@kernel.org>
 <cbpne2d7yr2vpxmrrveqajlp3irzsglxroxyyjmviuci2ewted@6ewwp6yyybk5>
Content-Language: en-US
From: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <cbpne2d7yr2vpxmrrveqajlp3irzsglxroxyyjmviuci2ewted@6ewwp6yyybk5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyNSBTYWx0ZWRfXzRew1b6lm6vJ
 iGQUGM9Snf40SMEzn9vd2zNnTzKBuf2hXQft/3xJG6lI8kSH6MxqFk1w50IL3ZMwuPfGZ79LQdE
 Ql+auZd0uaVNqeQS/8KlWbVGdzzufCEbelk7Ii8gTrZ8i9AoRPiEncxZ1UTfIweQ8Zk/nE0m8TW
 P81Kw3qUrj6IQ3XPOrk6tfHsGL/rHbLUQ1Nz+N0vqzsJ7rO2NdzoK1KAmrWZj2uBu6jMAY/Nyby
 XtxuDQ7xWAMK2Fic6YAs0FyQ/7DTy0kRWvzxLklH9wqf+VwFhmUzhkiXvVgwdCLk7Xn4nmsV7VR
 0ifzutg0XnSzvSDppEmq+ZtHFv8z7uBFqpMz7h4l2nxE/ND8svXd6IpQQg6F+eDyuBTZCtvwtmS
 PZyIkP00OKLmZLxco/4/Ksm2I4qaUA==
X-Proofpoint-GUID: Lj1vowyWK1-e95sniwVHH-pvYJWkT1kh
X-Proofpoint-ORIG-GUID: Lj1vowyWK1-e95sniwVHH-pvYJWkT1kh
X-Authority-Analysis: v=2.4 cv=J4ynLQnS c=1 sm=1 tr=0 ts=68ec5318 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=8YinarrYfdS0Dhyguhy4yQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=JupwLAayHTYr5Hx-38AA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110025



On 10/9/2025 8:08 PM, Dmitry Baryshkov wrote:
> On Thu, Oct 09, 2025 at 08:15:43AM -0500, Rob Herring wrote:
>> On Wed, Oct 08, 2025 at 09:31:59PM +0300, Dmitry Baryshkov wrote:
>>> On Wed, Oct 08, 2025 at 11:27:49PM +0530, Krishna Kurapati wrote:
>>>> Update the bindings to support reading ID state and VBUS, as per the
>>>> HD3SS3220 data sheet. The ID pin is kept high if VBUS is not at VSafe0V and
>>>> asserted low once VBUS is at VSafe0V, enforcing the Type-C requirement that
>>>> VBUS must be at VSafe0V before re-enabling VBUS.
>>>>
>>>> Add id-gpios property to describe the input gpio for USB ID pin and vbus-
>>>> supply property to describe the regulator for USB VBUS.
>>>>
>>>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>>>> ---
>>>>   .../devicetree/bindings/usb/ti,hd3ss3220.yaml       | 13 +++++++++++++
>>>>   1 file changed, 13 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
>>>> index bec1c8047bc0..c869eece39a7 100644
>>>> --- a/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
>>>> +++ b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
>>>> @@ -25,6 +25,19 @@ properties:
>>>>     interrupts:
>>>>       maxItems: 1
>>>>   
>>>> +  id-gpios:
>>>> +    description:
>>>> +      An input gpio for USB ID pin. Upon detecting a UFP device, HD3SS3220
>>>> +      will keep ID pin high if VBUS is not at VSafe0V. Once VBUS is at VSafe0V,
>>>> +      the HD3SS3220 will assert ID pin low. This is done to enforce Type-C
>>>> +      requirement that VBUS must be at VSafe0V before re-enabling VBUS.
>>>> +
>>>
>>> Stray empty line?
>>>
>>>> +    maxItems: 1
>>>> +
>>>> +  vbus-supply:
>>>> +    description: A phandle to the regulator for USB VBUS if needed when host
>>>> +      mode or dual role mode is supported.
>>>
>>> Why are we adding the property here while we can use the vbus-supply of
>>> the usb-c-connector?
>>
>> Normally, that's my question on both of these, too. However, it does
>> look like both are connected to the chip. There's VBUS_DET which is
>> connected to Vbus (thru a 900k resistor). So having these here does look
>> like accurate representation of the h/w. The commit message should make
>> this more clear. Honestly, that's really the only part I care about.
>> How it works is not so important.
> 
> The VBUS_DET pin is used by the controller to detect the VBUS provided
> by the USB-C partner and to identify when it's safe to turn on the
> device's VBUS supply. I think this still fits into the description of
> the connector's vbus-supply.
> 


Hi Dmitry,

  In case we put the vbus supply in usb-c-connector node, is there any 
way we can get its phandle reference in hd3 driver given that the 
connector node is not a child or parent of port controller node.

Regards,
Krishna,

