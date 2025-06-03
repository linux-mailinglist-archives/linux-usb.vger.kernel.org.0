Return-Path: <linux-usb+bounces-24442-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3E7ACC094
	for <lists+linux-usb@lfdr.de>; Tue,  3 Jun 2025 08:59:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E7927A32F3
	for <lists+linux-usb@lfdr.de>; Tue,  3 Jun 2025 06:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A46E8268C69;
	Tue,  3 Jun 2025 06:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G1b6teRp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E18267F70
	for <linux-usb@vger.kernel.org>; Tue,  3 Jun 2025 06:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748933960; cv=none; b=OhVH/tHGIETLHjwmzXWhs4jVaVR2LCCJgf4Grz78hHR8HCqcP0/YCz+SEGizwhybe7aoaFdyiv6o3hFNg9scdEEx+SxqoxIpiBO9ZEULMRj4kBqMHd3UnhIImfdwWmc2Sc1lUaZlYY2JTFKHGxQqJF9Kh2XPtutEjZg5Ag6QFSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748933960; c=relaxed/simple;
	bh=yIl91cIODbcq6rOSVNz4VGeqdOw6XOvYiMSRWZsk0uY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EP4Kpu70PjBpm4/UKrVewcSXBNa+K/vPLDcUGgByfZfS1hAlEXdyKxdS3zM2QTN0aVy+h+MMyms/7WGS1vqtJyOu94gq965Ov8BGhQ/pP5oodJY7nzKwTpI217GUxFTJvUjSduqtJZLCvgd0ZZkPJGTPgXUQlUKL5HQCbgix9NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G1b6teRp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5536P645016397
	for <linux-usb@vger.kernel.org>; Tue, 3 Jun 2025 06:59:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O88Sfa6gWtkGp5uiGxYhsgS/QzkSjFVA7I558x1JjIE=; b=G1b6teRpu84OEJhK
	W/VaIX6157DxmGKESVyCRWKNHxBN2l/F1tUpMIteOjmR4oLIH7nNjiwew6psKOzN
	bBcFcUDulVJbXpNzCw4A5YVPrArTD/ddqE6aDLl08PXG8gK0yyUzptN7CFGwtzeO
	foWkmS8EPPejJ0p0bHmYImfCj1OaZ4skpZ+LLlq32fGZhOFftHBgRM2/rINFMk0q
	I1Fm1EF0SZ3FOMx9eRU5aT1zpYNGMNCLLGLER2K5OyQS7EfybDqSdLyegWraSWfW
	DKsZ1QuydLSMQQCFdqJ/iFKOHWf6niZCLP1Qj6AWPq0w+EeCHSSYLqzTGZITo0LK
	GQnFHQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8yhmjv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 03 Jun 2025 06:59:17 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-311a6b43ed7so4397582a91.1
        for <linux-usb@vger.kernel.org>; Mon, 02 Jun 2025 23:59:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748933956; x=1749538756;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O88Sfa6gWtkGp5uiGxYhsgS/QzkSjFVA7I558x1JjIE=;
        b=YQAuFh+7RPzhl0nsASkT3eykNWsMgfpbdAQISV4aOQddtnMSS14CaBnN+xZDzRd58p
         y1JMXUL72xgAKix5ol4aBvnBjNomP2vwNS/y/eHZP1D1QGYZnNQFlSIM38LepBcR5j/S
         zcV+PB15MRhUrIRqwpw1ODqof4Nr/OIydoLaBFzJy1frt5GlMGtvAcgTFoPzgiJm3yKa
         Gmu+UliSx8L674xCsu0GHniWw3XjzSFdtfHu1RqN6yvM8O/LwvVmRKnt7QB4iJCxtxtD
         MD229m4+VS+hgsQ5DlZwVYm8u2OeTt/gzlXt7/LTWh8MGwRC4OUE0qNn9BJ05R/LUQyv
         IUpw==
X-Forwarded-Encrypted: i=1; AJvYcCW+J77zb8VthB69Qx462dCbS2RJf7xzFQg2+m/bd11ddWIuC6pGek/1Kh2yN6iJuPZj/2qwpKJjUHc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwD5xjrJQ7uXczcE7y/Zrjcbn5QugEljahuyL5u3S5hHvxGKIiQ
	HU1j23z9W5ZeQaqGw6kBc0Ae8M3g5xr6Gki37ugPXBMIh7zkv+9FvRyGmt8uUiPDl+xALp3/D49
	Xy5kqub2D5DeB0b0qomJnELXFUhGgmDR0/Rt/usI3oqi3OP/h6F9jGreJxCu2jyk=
X-Gm-Gg: ASbGncsUZ/ZX/DFG/d6dtDIU3k4ZyB8aVMiDWmhc4q5mFc/E5iISQecmB70KPL04v70
	6kmWqHqZpBxniGr5/ocQ/t/NJsdXQYAsztsPQX7ImX0wlVGURwcH7stwNCniI+ziESvw4Y/Xrpm
	Ba4YTTNZGgJDrnzrtxD720eCSZ3g6483POUaic/iOQ+K0AFlqihFH0HKkK7iuF3ewcgv0ojacH6
	IzueOoFia8SeDAApz8bMX4TgDu7awaMgBOOk1x5kXRLdKTEjXUHlGCgrogPq9DXFfdQGVHec1ox
	ME7d226laBQ+sZaEw+epjXH4lBahIaWfhA1sewKHNt7OpdPIKwojwBtmalKZ25T6ARRl476wq+R
	X
X-Received: by 2002:a17:90b:1dd1:b0:312:1147:7b16 with SMTP id 98e67ed59e1d1-3127c75a1f6mr16567633a91.35.1748933956175;
        Mon, 02 Jun 2025 23:59:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/449gaCP9UeICVPOMl7ImevR8RyxYzaDJddV9j5cUxAmjFJ/jq43ySQCuFyd+RVw0vYtQrg==
X-Received: by 2002:a17:90b:1dd1:b0:312:1147:7b16 with SMTP id 98e67ed59e1d1-3127c75a1f6mr16567596a91.35.1748933955725;
        Mon, 02 Jun 2025 23:59:15 -0700 (PDT)
Received: from [10.133.33.127] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e2e5e77sm6640325a91.20.2025.06.02.23.59.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 23:59:15 -0700 (PDT)
Message-ID: <c4be4b97-6104-45e3-b555-6691e369c3a4@oss.qualcomm.com>
Date: Tue, 3 Jun 2025 14:59:11 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] dt-bindings: soc: qcom: pmic-glink: Move X1E80100
 out of fallbacks
To: Krzysztof Kozlowski <krzk@kernel.org>, Sebastian Reichel
 <sre@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org
References: <20250530-qcom_battmgr_update-v2-0-9e377193a656@oss.qualcomm.com>
 <20250530-qcom_battmgr_update-v2-6-9e377193a656@oss.qualcomm.com>
 <4e093835-af3b-4a84-b42f-fa7d3a6f60a1@kernel.org>
 <14cba9ae-e3bb-46e8-a800-be5d979b2e06@oss.qualcomm.com>
 <b07200a2-4e7b-480e-a683-d116e7da8de8@kernel.org>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <b07200a2-4e7b-480e-a683-d116e7da8de8@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDA1OSBTYWx0ZWRfX/WhxMjU4E+Oh
 vb2DSFWVFRXp5NpyJGR0pZ+kiJpdYaYuihBC69liO9KgepelLsVK3Ti2HKquDeHtPN7GPu+hbQX
 gIUXnNgflg4kTWHtrOso+d/Ew/PVajYpXRbnIySVP0Hh3jZ5UEfp3O3AsWzZMRzkGJ/stKch40n
 RzQfwNs0nFup4Ob+nnk4EiiM4qeYxUQnmEzRcHG4BWuYa/m84nFt+faCN/mb+0JH5+15HzNmxIu
 fzZW4fpTLp0ueshsngm2GWHyoIm9S2YFBAlf059zce+ZKeKeok4Mj+8o2wDgJ3IY+Yg/6iQBdwb
 Fh4v2zvOfE6WFHuiyxyF4KwAbiY+UeIVv3pV2l/TGVVLewgd21HXNi84P3o6Yow2RFk/nhQ6Uqk
 Rc9R0w2bSc88BpRsqmq6Y4ZnPApy5oXykOWIDiTSlOYrBff85nWvzdmZeJstOeSPcMzjzwtx
X-Proofpoint-ORIG-GUID: aAY16InOwIpnGvBumqfWz06iMQNriz5D
X-Proofpoint-GUID: aAY16InOwIpnGvBumqfWz06iMQNriz5D
X-Authority-Analysis: v=2.4 cv=T/uMT+KQ c=1 sm=1 tr=0 ts=683e9d45 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=dyB-bXEIEhcmCqCGgV4A:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=832 suspectscore=0 impostorscore=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0
 adultscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506030059


On 6/3/2025 2:47 PM, Krzysztof Kozlowski wrote:
> On 03/06/2025 08:42, Fenglin Wu wrote:
>> On 6/2/2025 3:40 PM, Krzysztof Kozlowski wrote:
>>> On 30/05/2025 09:35, Fenglin Wu via B4 Relay wrote:
>>>> From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>>>>
>>>> Move X1E80100 out of the fallbacks of SM8550 in pmic-glink support.
>>> Why?
>>>
>>> Do not describe what you do here, it's obvious. We see it from the diff.
>>>
>>>
>>> Best regards,
>>> Krzysztof
>> Previously, in qcom_battmgr driver, x1e80100 was specified with a match
>> data the same as sc8280xp, also sm8550 was treated a fallback of sm8350
>> without the need of a match data.
>>
>> In ucsi_glink driver, sm8550 had a match data and x1e80100 was treated
>> as a fallback of sm8550. There was no issues to make x1e80100 as a
>> fallback of sm8550 from both qcom_battmgr and ucsi_glink driver perspective.
>>
>> In patch [5/8] in this series, in qcom_battmgr driver, it added charge
>> control functionality for sm8550 and x1e80100 differently hence
>> different match data was specified for them, and it makes x1e80100 ad
>> sm8550 incompatible and they need to be treated differently.
> So you break ABI and that's your problem to fix. You cannot make devices
> incompatible without good justification.

I would say x1e80100 and sm8550 are different and incompatible from a 
battery management firmware support perspective. The x1e80100 follows 
the sc8280xp as a compute platform, whereas the sm8550 follows the 
sm8350 as a mobile platform.

The difference between them was initially ignored because the sm8550 
could use everything that the sm8350 has, and no match data needed to be 
specified for it. However, now the sm8550 has new features that the 
sm8350 doesn't have, requiring us to treat it differently, thus the 
incompatibility was acknowledged.

>
> Best regards,
> Krzysztof

