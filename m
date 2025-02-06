Return-Path: <linux-usb+bounces-20201-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A651CA29F9E
	for <lists+linux-usb@lfdr.de>; Thu,  6 Feb 2025 05:24:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 028103A7689
	for <lists+linux-usb@lfdr.de>; Thu,  6 Feb 2025 04:24:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC45515A843;
	Thu,  6 Feb 2025 04:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c8nkR86c"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDF21527B4
	for <linux-usb@vger.kernel.org>; Thu,  6 Feb 2025 04:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738815859; cv=none; b=dhyAEje/XEde9E4Ro4OCTVoWN0PsEkWD0+Np1AMl62qaQ3WPYJiC07Qya4xodzWNfjOpIpmuLucFjhWICluEDUJFrKb82opoWjsI89n/+QvqA90Pp3a3Ej01CPW7wbuXMRLgwja9MI9T0qdBzgNApGl3bdrMrkQ8vDRqZTyocUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738815859; c=relaxed/simple;
	bh=x3RoQDABbP3pMXuxhTOvr017iXEkAiYBJfNFjunIDd4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l9eo8eKwX2XADH6B5LGx5ISUqysLA8gOLyBwhIJwtG27aQ/0MNJkH1o8Lcwf2FZNF8sQzh0ulNaPiZ1VxAbkoXRwjIzI/js2dhEJ/0WUH7olhH/r/soe68pp3ixiPSuKs66OnaPgI4HDGD3jeF+gsaXTSw0i6KkuceEP44CpUSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c8nkR86c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5161j1Ai029812
	for <linux-usb@vger.kernel.org>; Thu, 6 Feb 2025 04:24:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UzZDnfGZLX8HvjMJIk88Bhmcd/aj0bIaFc3nWEIhLaE=; b=c8nkR86c6BC5hEkn
	06WRCLGJhjYiKrGQITC3YOwKgG2fU73gFNkFFVrEH+dTurP/GEgsT+p38xGymqX7
	9U5g4bPctb0MTuKHlzqdsGNicCkLYjxPdOmWpnCydGMxy2P+3EsfVXhsRcC7+35b
	hQjwNkV6nEVPvaxwKHomkaohsUGAJNGmzliFXjv1nQzDe4aUXd9T8DKwim7i703f
	67yKf6btiWDYi37YPQWUkzn2E3B4hKuWrrdPAa6VjhpZ05wANiZHBfm+oGHHGNb8
	1jOmWVq1W/N0uqb1SpwM+nrffrQRuTpvmc0lxCwVSdoF8FuCVTTDWWogpSB421Py
	RrcSAA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44mkpjr9hf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 06 Feb 2025 04:24:16 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-21f078fc592so15553445ad.1
        for <linux-usb@vger.kernel.org>; Wed, 05 Feb 2025 20:24:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738815855; x=1739420655;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UzZDnfGZLX8HvjMJIk88Bhmcd/aj0bIaFc3nWEIhLaE=;
        b=tT/eY3OmO1pNEYWIhddRDlGp3aDxYeuKR/CFD0IpXL8tqEZKBAIOvgB74CY7wEGAg5
         yXbk7zEcLY+hNAxin5+4vjkUM5cqwKl9yoREeYMGzQ8kp1ZZWcs5ZXLfAJ+BqBpz0hOh
         UF5dYVe9y+fXKRBz94hGw4Gf3htAsZOD8EGXyBxaKL2kKO2WH6SrHuaO6TbDpAe0HIxJ
         UYI8HEeiFtpDts7G7P/hPom/p/j3kRhDkQRq6iGKJyF7Wy6/dWMILC61uCCmT//y6MH7
         vWKCmbRKHKAYJ9U/H6OMAta6Uqw4+Xu5Vi2cCCXGyhN/V0JJzPcmmEq2NRIOMtOigg8x
         fYaA==
X-Forwarded-Encrypted: i=1; AJvYcCWPHf9mav6RYMkMvmp3H7LdVxnIMyKPaLg/a4DctUN9s4IEr9XCAsn9/lQ4NIEGcwKs8l2eNzfa02o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzecWZIqBglDW4fIsuLYgv2H7EFYCRSji0XM9vLPjxS6hUCYuLK
	n3DKE+9OKFbevytoHvBaEasQ8kElL6BaiNfD2ZDpKysI59heUVAYe3OdeWNZ9yk7ktHHt1TVK2D
	36uk9P82jtMJw+1gsR0OtxwtNQv7rgvVxz+uczgp8cpYNMhL0rDw4PenrtiE=
X-Gm-Gg: ASbGnctu14SPdvTRoCtKb2qC2Y02J4MJsHjxMYEYMHfwxubMQZGTF4aVzbKQiNaLHNE
	+q5ewPL3IcNohHXeJ/rKinXF1R4kYZa+Ovnq1AMU7nYFt44n3RCU8ZxwuXQIY74t8dLdrHU0r+r
	G+gBZRo7BC25CcKhD8oibuqS0SZKchkofc8vB8onp5JnnllcDaCAOCdNFHPGDA7b3YxoMhCg5MG
	ggqlj5mr4Rjio+LVJzH66sSWIy7gGchsIpxfT+w8h3qlDknHN1rAIKvzLpmPzMfS4zoHEemYcsx
	pyt9OOiuoElMWhCI/uJiK7c+26q29g==
X-Received: by 2002:a05:6a21:8cc2:b0:1e1:b12e:edb8 with SMTP id adf61e73a8af0-1ede88b2334mr12379132637.30.1738815855150;
        Wed, 05 Feb 2025 20:24:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH4bOrr5uUDRlCbMOWSGKN7WtxiRHglYPcsXxM0kkvRTF76K3q2h/bgcDp9ITqdP4O/UH8rzg==
X-Received: by 2002:a05:6a21:8cc2:b0:1e1:b12e:edb8 with SMTP id adf61e73a8af0-1ede88b2334mr12379098637.30.1738815854768;
        Wed, 05 Feb 2025 20:24:14 -0800 (PST)
Received: from [10.218.35.239] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad51af780ccsm190657a12.71.2025.02.05.20.24.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 20:24:14 -0800 (PST)
Message-ID: <33a19657-a890-4d59-b7ea-5798cf8f7d9b@oss.qualcomm.com>
Date: Thu, 6 Feb 2025 09:54:09 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOetlOWkjTogW1BBVENIIHYzXSB1c2I6IGdhZGdldDogdV9zZXJp?=
 =?UTF-8?Q?al=3A_Disable_ep_before_setting_port_to_null_to_fix_the_crash_cau?=
 =?UTF-8?Q?sed_by_port_being_null?=
To: Pelle Windestam <pelle@windestam.se>,
        =?UTF-8?B?6IOh6L+e5Yuk?=
 <hulianqin@vivo.com>,
        "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>
Cc: "mwalle@kernel.org" <mwalle@kernel.org>,
        "quic_jjohnson@quicinc.com" <quic_jjohnson@quicinc.com>,
        David Brownell <dbrownell@users.sourceforge.net>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "opensource.kernel" <opensource.kernel@vivo.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        Brad Griffis <bgriffis@nvidia.com>,
        Harshit Mogalapalli <harshit.m.mogalapalli@gmail.com>
References: <TYUPR06MB621733B5AC690DBDF80A0DCCD2042@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <1037c1ad-9230-4181-b9c3-167dbaa47644@nvidia.com>
 <2025011633-cavity-earthworm-2b5e@gregkh>
 <3d9db530-a0b7-4f18-9ad4-233356dfe68c@nvidia.com>
 <e3a457d6-092b-4b7a-9032-50daddab6f1f@nvidia.com>
 <0fa6c6db-fd75-4a09-b4fa-d6a98bb8afac@stanley.mountain>
 <TYUPR06MB621712E6A082791B397088BFD2F72@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <f264888e-6100-4812-9661-ffad174f45af@windestam.se>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <f264888e-6100-4812-9661-ffad174f45af@windestam.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: i702us1_n3kpX0bbj1BUIN3r7RL_OBZe
X-Proofpoint-GUID: i702us1_n3kpX0bbj1BUIN3r7RL_OBZe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_01,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0
 clxscore=1015 malwarescore=0 mlxlogscore=499 lowpriorityscore=0
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502060033



On 06-02-25 12:59 am, Pelle Windestam wrote:
>>>>>> Odd, you have a usb-serial gadget device in this system that is
>>>>>> disconnecting somehow?  That oops doesn't point to anything in the
>>>>>> usb gadget codebase, "all" we have done is move the call to
>>>>>> shutdown the endpoints to earlier in the disconnect function.
>>>>>
>>>>> Yes the board starts usb-serial and usb-ethernet gadget and on
>>>>> reboot when tearing it down I am seeing the above. As soon as it
>>>>> disables the tegra-xudc endpoints (as seen above) the board appears to
>>> stall.
>>>>>
>>>>>> I'm glad to revert this, but it feels really odd that this is
>>>>>> causing you an rcu stall issue.
>>>>>
>>>>> Thanks. I can't say I understand it either, but I am certain it is
>>>>> caused by this change.
>>>>>
> 
> I do not have much to add in terms of solutions but want to chime in
> that the same issue happened to me the other day when I upgraded my
> kernel. It manifests itself with the rcu stall whenever I try to reboot
> my device with the USB-cable connected (it is a usb-serial gadget
> device). Moving the usb_ep_disable() calls to outside the lock (where
> they were before the patch) solves it.

Are you also using tegra-xudc ? ep_disable routine may be called in an
atomic (interrupt) context.

Regards,
Prashanth K

