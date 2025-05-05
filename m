Return-Path: <linux-usb+bounces-23725-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8360EAA955E
	for <lists+linux-usb@lfdr.de>; Mon,  5 May 2025 16:19:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02DE83BB03A
	for <lists+linux-usb@lfdr.de>; Mon,  5 May 2025 14:18:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7645725C717;
	Mon,  5 May 2025 14:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b4PAbizK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1160025A33E
	for <linux-usb@vger.kernel.org>; Mon,  5 May 2025 14:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746454737; cv=none; b=qC8otAlfMdxDP8+I3e1jBQ94etsdrjZgO2aAtoN3aWa7YZds4+Z3qNRoYr4AnxEZhF+yDVRQ7guXrMWYL3O6iPIsyeFbkUPctqmDQzdYIrC8sfOOZAkCY8TnQuytWo1wEZVnjj0AMUoLBTd0s74lWM2m1mlTi8TXKrG7714ZmD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746454737; c=relaxed/simple;
	bh=3Vf+AaQhANAKR4iErxV8pfkN6oisAXDi42nAcHc040E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hnk8OPmCcJoVHNpHw0T/W2pEuStIjb24s0rhiGuJpwKFzHMh0uDOFkGoq82ebqnsP9uradyBu7YcTN91OYzO1WufJCMrUagMqwhVtBf0UFM5bqP+FuaQICqsRYpREEhvNIT/53O/8jjPvNBCYCQXK7sFiU0apTzFBKULb4OBWm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b4PAbizK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545BojX2029526
	for <linux-usb@vger.kernel.org>; Mon, 5 May 2025 14:18:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4OMp8lVlfqOS6nQjtVYiy+vsTT7GaERnrIvMt0I4OI8=; b=b4PAbizKQdgKo4Sz
	hAnB7gq3XzspJ7yxkI0rAfW/7gt8MI6H80NV0PqEJqNV3uxySOCpIdYv4a0kcI2M
	g1H+XyC3/zZ8nd+XzuT6p7yv5WQH3G5GZtwy8+MHRWRMP7nTsg1OhRLVB8Ao2Q2x
	LkOtxTrcjQC+ePkmFGRmr3CN7it78qUDiXOhLLNJydEezJTaB/wbSUgoAEn3EOEG
	rKFYA+c7uVYVYrRyokY177Tx7LL2A80L42El0vWjD1xeGlYr1oHgT2qD08MrheoD
	BeqGEQ6MFyy3CrqaZ4pB2puT0olee4bxczYriQ4HokKGlV5XmOK/jOHNeDjjVuKv
	NniVyQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9nkvduc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 05 May 2025 14:18:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c760637fe5so200681585a.0
        for <linux-usb@vger.kernel.org>; Mon, 05 May 2025 07:18:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746454734; x=1747059534;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4OMp8lVlfqOS6nQjtVYiy+vsTT7GaERnrIvMt0I4OI8=;
        b=DjgDPfw/EOtlh1L5ULk0e79EnItwvzD/y1VNToCFuGBmUUJJAp6L/kq5PHVnOZ65IE
         FPrTW7NNO1c93JJ+vxqZnZBI7Ts5nDvGS3OfeG/jdbGStHGMZnSM97SksvNtI34/mh5W
         s89qkCeQ+Tui5Ov94+lpaU+/RyV0T5ToBJ/yAjLnjUq1G5UQnMwhJmTobiXcJTmLK5ei
         wYkxXz8dHQh071NjeAUy0WeePYqrI5eObjtnx9IUDSTKnvnaw/xkb+wGs1JiNhdrmvjm
         seNvL9e1mn4egnS/c0zzzXsp/VlAa8NoYLoajwqzwjq486JVYcrEmhGfzUr0ws1K13Dc
         BGew==
X-Forwarded-Encrypted: i=1; AJvYcCV43Q2KCSNSaEJqPZ4YhH2a26f2spWXgjlj3MCkvJdusIrKOLdgEzeJCaWIE2SmRf4IAu7vb6skowI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkKTkIyYJVxUStvGhEQ/3MNo/ZyKajRC1SSuGvodrW9Igwx63n
	HYBMlSzdXN/s+O7WCKmWoFCICsar0pqOrr6juK58K88X92b2mRdd6iRSJToBrqiiLB+NP30ook0
	b+4b/wbvAhWJhQs5ZZBd27WsMWDn/OuRPn83OQG9V3VYj/qnhni5X2wGDPa0=
X-Gm-Gg: ASbGncsrvp8dtX+PfxWlHhf4v0gjKWGTAIG7YusAfmsumEW1oCfQyLcsYtQhlgcXqIM
	xsGEG+qRXqv7L3lYUh1Umy9z+we1FgxfRjcpoIHIpH3vh25rVawBoE+AAJbCDG8djSIkcNKXT/g
	lJ/67t+37SlQHcsp6OF6wAyQu4+FtyiYSGj5edBB/nPrE0H7gd2qxsOBjNeyDm6IKzQPwwMCmbz
	30OW/MbOsHBt+hh5U+3EhtFOArYMB8ecYPc7fV/u6p+GOkMciLT3CyNk5hKSLhgP8l65F9ArEIz
	OWKwRySvHsLNsmJRX23eElrr1lk2k/RnV3H4hiVtftFJNA5i2LgqTKVXmNtm/MjqqVlXlsdZHaO
	ZUxZ6c35fxfbaaT3kCeE2BjPG262l4nfmRehkwRL+LM+jdySb14ENYVAu1kZprJJmrdVR
X-Received: by 2002:a05:620a:1a0e:b0:7c5:e283:7d0a with SMTP id af79cd13be357-7cadfe15ab6mr1528030485a.30.1746454733841;
        Mon, 05 May 2025 07:18:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxLIuDmlMk0BDjjG/jcKroZx3ooAtnxfCFD86oCFhHuF1R3mpWcw+w7OoB3Ift4T6LrXoRzw==
X-Received: by 2002:a05:620a:1a0e:b0:7c5:e283:7d0a with SMTP id af79cd13be357-7cadfe15ab6mr1528024685a.30.1746454733441;
        Mon, 05 May 2025 07:18:53 -0700 (PDT)
Received: from ?IPV6:2001:14bb:671:42db:147e:6740:cd7c:7688? (2001-14bb-671-42db-147e-6740-cd7c-7688.rev.dnainternet.fi. [2001:14bb:671:42db:147e:6740:cd7c:7688])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94f2043sm1707308e87.179.2025.05.05.07.18.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 07:18:52 -0700 (PDT)
Message-ID: <4a186d4f-9966-4569-bee2-77e237cf0c54@oss.qualcomm.com>
Date: Mon, 5 May 2025 17:18:49 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] Various dt-bindings fixes
To: Rob Herring <robh@kernel.org>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Robert Foss <rfoss@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Rohit Agarwal <quic_rohiagar@quicinc.com>,
        Kyle Deng <quic_chunkaid@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-usb@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
 <174637445759.1385605.15383087742490646226.b4-ty@oss.qualcomm.com>
 <CAL_JsqKr8Xd8uxFzE0YJTyD+V6N++VV8SX-GB5Xt0_BKkeoGUQ@mail.gmail.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <CAL_JsqKr8Xd8uxFzE0YJTyD+V6N++VV8SX-GB5Xt0_BKkeoGUQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDEzNyBTYWx0ZWRfX41GAAnW1I98W
 A6/2DBN47351YB2fjS+b8xxz/98jlmSRKbn3wbJxb1Y+fCkRFFnwZB11H0Q/03jNbptG7+7Nf2U
 uuw2fIztg/DA9y0Sl4UmxZK1K7PU+hTzyKDEi9KN+e5ZIuxwsi/dmy2F4e/TNMDMU6Yye4aTgKt
 Yip89MHS4JnkpkN60+juTqDAqrGl0XTpYr0wK/G/pVmEERDE1dNTEwDPHfjzCNEd8iBOQFR6W4q
 FCgN2bZKUnOHBdOfx752j7AXE5t07qAPk86IKdgrTL0ldPP9saaY8tff67Q7c9IpjS1NysFHRZh
 ZNR+x61AC56c8ujxnn0tTEXZrk1x164mMQTirERLhz129kBpsm3cD1TsjwlNRqM2ho6We8jse8N
 qaykFIiTDaP3xsYGxdXXKFjpPBv0MkZacLXVj3viuaXsc76QBQid5uAZohJqmeRDiHyGPr2A
X-Proofpoint-GUID: Qz4gko8ZxJnr21S6Fcdfh_LVmqtCPGOM
X-Authority-Analysis: v=2.4 cv=LpeSymdc c=1 sm=1 tr=0 ts=6818c8cf cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Y8Lu5Vov3j2QtJBI0v0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Vxmtnl_E_bksehYqCbjh:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: Qz4gko8ZxJnr21S6Fcdfh_LVmqtCPGOM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_06,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=978 adultscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050137

On 05/05/2025 14:56, Rob Herring wrote:
> On Sun, May 4, 2025 at 11:13 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>
>>
>> On Thu, 06 Mar 2025 19:11:12 +0100, Konrad Dybcio wrote:
>>> A set of not quite related bindings warnings fixes.
>>>
>>>
>>
>> Applied, thanks!
>>
>> [02/11] dt-bindings: display: msm: sm8350-mdss: Describe the CPU-CFG icc path
>>          https://gitlab.freedesktop.org/lumag/msm/-/commit/60b8d3a2365a
> 
> And now there's a warning in linux-next:
> 
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.example.dtb:
> display-subsystem@ae00000 (qcom,sm8350-mdss): interconnect-names:
> ['mdp0-mem', 'mdp1-mem'] is too short
>          from schema $id:
> http://devicetree.org/schemas/display/msm/qcom,sm8350-mdss.yaml#
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.example.dtb:
> display-subsystem@ae00000 (qcom,sm8350-mdss): interconnects:
> [[4294967295, 7, 0, 4294967295, 1, 0], [4294967295, 8, 0, 4294967295,
> 1, 0]] is too short
>          from schema $id:
> http://devicetree.org/schemas/display/msm/qcom,sm8350-mdss.yaml#

I've sent a patch fixing the issue, 
https://lore.kernel.org/linux-arm-msm/20250505-sm8350-fix-example-v1-1-36d5d9ccba66@oss.qualcomm.com/

-- 
With best wishes
Dmitry

