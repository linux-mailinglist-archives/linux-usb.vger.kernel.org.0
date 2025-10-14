Return-Path: <linux-usb+bounces-29283-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A348BD9B51
	for <lists+linux-usb@lfdr.de>; Tue, 14 Oct 2025 15:29:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 113AE352FD6
	for <lists+linux-usb@lfdr.de>; Tue, 14 Oct 2025 13:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 515192FF16E;
	Tue, 14 Oct 2025 13:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ILJyri79"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4876B30BF6A
	for <linux-usb@vger.kernel.org>; Tue, 14 Oct 2025 13:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760448531; cv=none; b=lw9ImyCVI4UtCPLkokxSAV6yosWSU8O6myPSc/BfcIlYIIgD3w50N04fh6EeD9+3XLbngxQ2qyZglKzEJjpi6Zi4q6P8AUZXMwUA3tJl4qODzosNwlG7EAU/4GNWcqEw3VvnpG1kzCjp5XkXfo4t1qY6Ix0SnBlXi5G01EdbgPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760448531; c=relaxed/simple;
	bh=74VghsycGNMWOan5TOjrZsd2bCurtNuYWOOPyoyHuG4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hg0i0CP+fQZZyWTPlixLkpOQ6blVGExy9CtFpF4+ycp38CQUUnYVz4VmBboDWSAKUs4pAMEm9Zj5G3rqbveqkxEUb/mcKNV3VS97d/AZHTmnnB+y00/x2lsT+xGKyw21QYv/iidca/IvmYW/UZCXAbjXsZFXUoJr76kTbq/oQX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ILJyri79; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87Hme019887
	for <linux-usb@vger.kernel.org>; Tue, 14 Oct 2025 13:28:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TH3Wy1bSw9Z+42cb2jIA73zJRFGOGkqejjZW60B+Ils=; b=ILJyri79fqu3hf1A
	6sqi4p5WbER2T4+CJZzuONE73jt2WeOyY1QsIQ1tXNt+Qzfbcpz1JcJL3GLpx/wv
	SCeSFYumotXWGIw25qJUeiKQJYwXjLTu1f/2lX4Om8MkMcIo44FE68PjQP0tYG4Y
	2fUm+kXUimquR88R5AmHUpqbszlsamAADUNGl0gUKLE/scDJuKz4f3TGqQkQym4t
	yaZ2XBpDNjJaJQvelWDeAwcyoRebQra+s/mAu6BbdXK7wsSE9/Ek5Hv803lnLqkc
	9WRrbraG5kz8DWsasqkQzISsdr7OrBEJ7dUp05rns0Hst4lCrLL/NtAGHrzTlNyd
	d+MIdg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0c0krx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 14 Oct 2025 13:28:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-883feb13e83so3125596385a.1
        for <linux-usb@vger.kernel.org>; Tue, 14 Oct 2025 06:28:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760448528; x=1761053328;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TH3Wy1bSw9Z+42cb2jIA73zJRFGOGkqejjZW60B+Ils=;
        b=OE41TRy4hfYpZGtzfvisML+tEDGa64fccQno5eNSTMDTNpTpzYpgoCjg7JLA0RNbB3
         p1gr1AXKxEN+HiNb8F3e1x29X4c63JzNFPUdfubohZdXDAFPnDtki+UCqQrhMAtMG+fC
         6GjVFd3Za2ruQwnmJMpS0kuBr56RygatauRfIvN3e4t78iZm1cIh6NA7QptKiDfvRYGg
         W6q8CN8Yl3rNWgbzednUVtXFqxfPzApAuBIV50LWtS70K5K27B5tzKRT3JyPGqLuP9gq
         ADYt2NHZFn8/IFUBwpH4ZxycYOvGuTAnYQFFpow3B34V/AFiO+pSdlf4lakYePXf3vRY
         LXfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVREe0I49f3Tc5LWSS63iTfdCAxu3wLkai8Ha+UT8N26jrhl2B7+n9/c3o0Ei3OvIV8fWHlY71PQ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAWB8ffOksJuWlSEhPiu/eBWvn4etTeObuG9R+IpDYe56R9exq
	8+BY+jD8W/1fKIzSXjohiIrvKg+ldJgicQngNbSDd1WwZAM7woQ0jNqW0r6McwBNnwhVMMKTnP5
	KHxv+0y4ix9clCR02BM5TfcV3jlcxISp/OXqaps8hXofdkwfPcKpCSnQK+oyCntI=
X-Gm-Gg: ASbGnctWJB8OwegClAfxM5bKd9JfJAFc8AXu2zSvU2Gw1+64nZQlkPyZnAKOf77jC1d
	iAwroDJ/KqqDz8qOI+yLZ47ydnrdta+QfT0G27EyTC4CgSUgu9Z/ODm+df3nFDex2L//qMRM1K6
	+kP1g9ByENibiDbBYlyyt+IWrR+kabHJ9RNZnKEAjOIi2AZzhF0Se7SzC93xJNgi0akpt2yiYpz
	L5LQgjJMYkp46WqrCJrvWdHDLSUMvwRseN44VsdsW9EwvOOWsRG96B4SJBWPy7nQNX1/2vNeaeT
	SU6OlXVESzTB0OGC+oDfDhOmaGHP8JA9omgXGJwxpp8f/ojldLyNNaf87s09E52SH1Itv0KBGEq
	ClIl62iIzbiCSVYj9GDvkryXVfC9F7akT58hlUjNvQ8U/8bHJqxbMb1y1BBMkD0yYvyeo1OlL0E
	PREG9X
X-Received: by 2002:a05:620a:170d:b0:82a:9b78:3db1 with SMTP id af79cd13be357-883527b69camr3008959585a.69.1760448528076;
        Tue, 14 Oct 2025 06:28:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2bfAyGNnHmgq4ANdRlYx9LaJ9D28SHtQnX5Z/A+4bdTv14DYc6LMQKjCTLblXwmAOSBpbPA==
X-Received: by 2002:a05:620a:170d:b0:82a:9b78:3db1 with SMTP id af79cd13be357-883527b69camr3008954485a.69.1760448527335;
        Tue, 14 Oct 2025 06:28:47 -0700 (PDT)
Received: from ?IPV6:2001:99a:252:3300:d706:9b57:5996:15b4? (n2i9bzmlzk2z87merp0-1.v6.elisa-laajakaista.fi. [2001:99a:252:3300:d706:9b57:5996:15b4])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881fe5besm5252949e87.50.2025.10.14.06.28.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 06:28:46 -0700 (PDT)
Message-ID: <7392a020-c749-4928-895a-4e104d7e1769@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 16:28:46 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: ti,hd3ss3220: Add support for
 VBUS based on ID state
To: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
 <2a088c8f-5555-490e-a70d-308a876924ca@oss.qualcomm.com>
 <CAO9ioeX51SzaMS4TK7=xfCXBNYi7SGsMBZAv4FrZ1LzONWFw3A@mail.gmail.com>
 <654b804d-fbeb-45ea-a6fd-9d551224c934@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <654b804d-fbeb-45ea-a6fd-9d551224c934@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: xbda0uzARn0v-ueOWSDkk26K3p4CZLrk
X-Proofpoint-ORIG-GUID: xbda0uzARn0v-ueOWSDkk26K3p4CZLrk
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68ee5011 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=kfguzciIMWHQBG15V5QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfX3Pe+g8RIKUnW
 j3A1kmHH+nCOfZ2NaCdXMf4AGmLjPnGEA0K01J6jtXEfXxgV28/dCRb9g1sNCAZINdr6uJGePxd
 OWyN4sDm9r6dV7bIjBXp7Y4xVWUeZbz4D/ZcKAp3xbq3jDoCgkS+EgH3eaiYFyihZctrxEQWA3A
 n0b9BcE6AxA02/Y8mQkwu4A7wK/pFFlp7M61Gg0j9SY178FSs67eQXjrjFuuxbldaZ93fIcUaqM
 2ytbm4a8L7dMC0Wazn/HPLhidY4ASwCPge/a5HHvSciPcVA1AlvnQM7YHBtdA+7qyIPMUQlAD33
 fVOaLTxP1NVJp7XOh+CyciCPg+nu+0B7atmxVfojvY3/BcNJntNkNCv0qZvy0fM3OFWWFU3Zwn4
 ELFJscoKWpzBr2fCZEnIf/IBSvjS/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022

On 14/10/2025 05:39, Krishna Kurapati PSSNV wrote:
> 
> 
> On 10/13/2025 2:38 PM, Dmitry Baryshkov wrote:
>> On Mon, 13 Oct 2025 at 04:17, Krishna Kurapati PSSNV
>> <krishna.kurapati@oss.qualcomm.com> wrote:
>>>
>>>
>>>
>>> On 10/9/2025 8:08 PM, Dmitry Baryshkov wrote:
>>>> On Thu, Oct 09, 2025 at 08:15:43AM -0500, Rob Herring wrote:
>>>>> On Wed, Oct 08, 2025 at 09:31:59PM +0300, Dmitry Baryshkov wrote:
>>>>>> On Wed, Oct 08, 2025 at 11:27:49PM +0530, Krishna Kurapati wrote:
>>>>>>> Update the bindings to support reading ID state and VBUS, as per the
>>>>>>> HD3SS3220 data sheet. The ID pin is kept high if VBUS is not at 
>>>>>>> VSafe0V and
>>>>>>> asserted low once VBUS is at VSafe0V, enforcing the Type-C 
>>>>>>> requirement that
>>>>>>> VBUS must be at VSafe0V before re-enabling VBUS.
>>>>>>>
>>>>>>> Add id-gpios property to describe the input gpio for USB ID pin 
>>>>>>> and vbus-
>>>>>>> supply property to describe the regulator for USB VBUS.
>>>>>>>
>>>>>>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>>>>>>> ---
>>>>>>>    .../devicetree/bindings/usb/ti,hd3ss3220.yaml       | 13 +++++ 
>>>>>>> ++++++++
>>>>>>>    1 file changed, 13 insertions(+)
>>>>>>>
>>>>>>> diff --git a/Documentation/devicetree/bindings/usb/ 
>>>>>>> ti,hd3ss3220.yaml b/Documentation/devicetree/bindings/usb/ 
>>>>>>> ti,hd3ss3220.yaml
>>>>>>> index bec1c8047bc0..c869eece39a7 100644
>>>>>>> --- a/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
>>>>>>> +++ b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
>>>>>>> @@ -25,6 +25,19 @@ properties:
>>>>>>>      interrupts:
>>>>>>>        maxItems: 1
>>>>>>>
>>>>>>> +  id-gpios:
>>>>>>> +    description:
>>>>>>> +      An input gpio for USB ID pin. Upon detecting a UFP device, 
>>>>>>> HD3SS3220
>>>>>>> +      will keep ID pin high if VBUS is not at VSafe0V. Once VBUS 
>>>>>>> is at VSafe0V,
>>>>>>> +      the HD3SS3220 will assert ID pin low. This is done to 
>>>>>>> enforce Type-C
>>>>>>> +      requirement that VBUS must be at VSafe0V before re- 
>>>>>>> enabling VBUS.
>>>>>>> +
>>>>>>
>>>>>> Stray empty line?
>>>>>>
>>>>>>> +    maxItems: 1
>>>>>>> +
>>>>>>> +  vbus-supply:
>>>>>>> +    description: A phandle to the regulator for USB VBUS if 
>>>>>>> needed when host
>>>>>>> +      mode or dual role mode is supported.
>>>>>>
>>>>>> Why are we adding the property here while we can use the vbus- 
>>>>>> supply of
>>>>>> the usb-c-connector?
>>>>>
>>>>> Normally, that's my question on both of these, too. However, it does
>>>>> look like both are connected to the chip. There's VBUS_DET which is
>>>>> connected to Vbus (thru a 900k resistor). So having these here does 
>>>>> look
>>>>> like accurate representation of the h/w. The commit message should 
>>>>> make
>>>>> this more clear. Honestly, that's really the only part I care about.
>>>>> How it works is not so important.
>>>>
>>>> The VBUS_DET pin is used by the controller to detect the VBUS provided
>>>> by the USB-C partner and to identify when it's safe to turn on the
>>>> device's VBUS supply. I think this still fits into the description of
>>>> the connector's vbus-supply.
>>>>
>>
>>>    In case we put the vbus supply in usb-c-connector node, is there any
>>> way we can get its phandle reference in hd3 driver given that the
>>> connector node is not a child or parent of port controller node.
>>
>> Sure. Use devm_of_regulator_get() passing connector node to the function.
>>
> 
> I am not sure if I am asking the right question, but in case there are 
> multiple connector nodes, each one corresponding to one port controller 
> node, how do we get the reference of proper connector node in hd3 driver 
> since the port controller node and connector node are not parent/child 
> or each of them don't have reference to one another.

You have of graph connection between your Type-C controller and the 
USB-C connector. So you can use the of_graph API to get the connector's 
device node.

-- 
With best wishes
Dmitry

