Return-Path: <linux-usb+bounces-31482-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B224CCC3BC6
	for <lists+linux-usb@lfdr.de>; Tue, 16 Dec 2025 15:50:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C41430EB4D7
	for <lists+linux-usb@lfdr.de>; Tue, 16 Dec 2025 14:40:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AF7233DEDF;
	Tue, 16 Dec 2025 14:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lDDXeXg0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hP0ZZB05"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7607029E109
	for <linux-usb@vger.kernel.org>; Tue, 16 Dec 2025 14:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765895489; cv=none; b=Ztg7K6hYRWqkr3gMZMWtd9LRrTwjq7yps/LU3hN9g8lM8GCCX7R7Zr5PzMpBfl+HZjEyZ+bkXudr8QUUOvhp8f70JGxEh1eqW/bmHkmo3jb4djPpwUAYAbafSVdsZfCJes2A0yh+kUp7oy7rzcEQI1lzZuc6BJz1QBtG15TRdrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765895489; c=relaxed/simple;
	bh=QaOSxt70WcF0WTGsdepdZK1aqmiHSnTO8Rb2UJchHro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M6QcAR0wJ8FdPesrg4CdkZxcC64YoPruduNpt9CmwBK5kMDzIcGbN6OHctBXGt6PWmljRdHK0mKO75PaRaxaZOQda2l5Ds1Sfk4KzQ2tB0rDosf9L+i3wZKIQWv5bou/1jrEaWFkrTDZvolxZ3Lv2xA1nznEPFE0fJMHkV5+psk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lDDXeXg0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hP0ZZB05; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BGDSLqp3745809
	for <linux-usb@vger.kernel.org>; Tue, 16 Dec 2025 14:31:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=t6HtwCYPPxf1srad/iUA3f0d
	zz0vs32EM6j9h5yZtxM=; b=lDDXeXg0nL23eVZ8vXImTM/HbMla0zAl1YDwBJ+z
	Mp9Mb8HCJ7hfeE9oga1igCtCh/JvhY+HKUaTptcc+yBEf89bL0EOEajquhb+ySPj
	ROz10lD7C4sbuB0SyggMf1QfyhbrrZXBpnCCXZYB3BNbKKN321nZ6v7mXWbVVZ43
	PaXUy0+Rt9aAdHuEIIuBxHhiC/eoDao/vgFh6ZsAny/xT8xGZvEKTUihRMi15WJP
	K3UEXnwNeVTJeTJj7XbTsBBJL+S7A7ySvZsjpb4flGRoPGRxSkefpYYXqoXZoSBl
	LqC79VQ5CntMRCXSGFAULvcFwZCnShgBUORO83PCOHdu+w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b33xj1brp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 16 Dec 2025 14:31:27 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34c5d6193daso5879095a91.1
        for <linux-usb@vger.kernel.org>; Tue, 16 Dec 2025 06:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765895486; x=1766500286; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t6HtwCYPPxf1srad/iUA3f0dzz0vs32EM6j9h5yZtxM=;
        b=hP0ZZB05lBbddShO6ZMcqJt+Y6XL/iXj32t8koscSyW7p8tY++gmBrnl7w82aeL2Ox
         lBEm5T3pIhliHMTKj7WS/LcrcUb/hZmZ4FrH7y9lHE1fv7F/NehaRZqWasS0Y1hzb2aG
         cIVBRVnDsqO2w6I7kFnxT+Kd5kqgpG6lerNv3FJsgCQoRC/tU/2SEyTYhjdIqWoP4bT+
         lIOLkP5tJLvo3F6UN3wgD27jNSvClSbfK4230hrptOJNsRuh86971Qq+YYUFSyAHNKx4
         yBMqImsvdi+J8KfE1XL7bQayNs3JQ9wvFRfxo09lkDlZbd0hfvBmXEZMklYRZCHD4n5g
         2etA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765895486; x=1766500286;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t6HtwCYPPxf1srad/iUA3f0dzz0vs32EM6j9h5yZtxM=;
        b=hmRtMq303k4B4Y0945xnjEa4daM3RqktBrMndThbvPyNrg1uNF9DE4fwqEsKdOZYbB
         dVRU/qq3Wb+Y+k9l69fHuEIYY6aIo2dyJcBVRHyn5ioldetTbZAdYmHjl8aS+QCOA7xD
         52a/gWOI92BWzZGwycDolPBgb50fxMgsFTLB9/WQcZpGQGmxlG8AdXRhchKBaF9vlczy
         zW1uvB/xoRTchxT0pRdUOTvk8nmSUJXCUYgOw8Fn4yT0pGZlyln6Bp2CtyFPdUm2eFG0
         elDYAwHd2EyuPwygNPGusfqZXJc20Wh3VGQuN/2VGbWER8N7vJhFqsbluDq/BJqEpCPc
         AF0w==
X-Forwarded-Encrypted: i=1; AJvYcCUqntFl/kW00StdfeHJWvdWtkrk6UF16Ldlmggz+0tolhxNhyG3XCXTOAHVAH7H48K1eV9jKX2LttA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3dVya1FgPMlzGQVckaHTKDz2YejhZzgJwYfG0oVyZTRSZuyKB
	sA4wc6YBmCCTRlRwNx5MRGMqzFzgNjPDhKYonCIEl8gUDOibH4kE4VepWa5JAV64bRYBkrQIq48
	GMNs3Ghig944FLDj5D8C31jA36KPpgbO+O2bNwfVK9w8mPdU7+vK3iOG7cWN2WCn8vZIBSQVgBH
	36zVCUmjhI9el3M1QmyicjKW+a0KTUOOAStPzPbQ==
X-Gm-Gg: AY/fxX6JLh2LduWmwF2KwpzfoJT9oGkj7Lvc4fIoOEN78XgvXn7GQtwbsz+OgjQ8aqf
	MYafli27W2bg7M9vUu8RTwYXsi9xrTDMhUhPJbp+MI/h1ICZ/HQx1bDHagRfEvHSWVVe+I2fVmD
	eVp3mfp7MJ2ufQkTKCojHUxqMXlZLU8wEZOD28Bi4oMIyoxsHv3gw55VJ7menugemcACY=
X-Received: by 2002:a17:90b:3912:b0:335:2eef:4ca8 with SMTP id 98e67ed59e1d1-34abd77fbbdmr13293939a91.33.1765895486179;
        Tue, 16 Dec 2025 06:31:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGLLKjl3yXTZLBqKXuGvS5MsqCvnHw9aSMHnoHONnTP3jCx3lxj2emkqaVRFoxjLcS/xASXuG0cIDpHQWta2Zw=
X-Received: by 2002:a17:90b:3912:b0:335:2eef:4ca8 with SMTP id
 98e67ed59e1d1-34abd77fbbdmr13293904a91.33.1765895485577; Tue, 16 Dec 2025
 06:31:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251216120749.94007-1-swati.agarwal@oss.qualcomm.com>
In-Reply-To: <20251216120749.94007-1-swati.agarwal@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 16 Dec 2025 16:31:14 +0200
X-Gm-Features: AQt7F2rboXhQ8AIn54ZCDs86ywskZGPiHjLOrxK5sIOqrJbXnWiu8WdP5nH1e_Y
Message-ID: <CAO9ioeV=D9wpcar33L11YGBApdW+NdE+36q+oVx+8zL=9LJ2Pw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Enable USB1 controller in host mode
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        =?UTF-8?B?SiAuIE5ldXNjaMOkZmVy?= <j.ne@posteo.net>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Pin-yen Lin <treapking@chromium.org>,
        Catalin Popescu <catalin.popescu@leica-geosystems.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: 0cqLXxw7ykBYxeK_3raw__s0O9oUMse5
X-Proofpoint-GUID: 0cqLXxw7ykBYxeK_3raw__s0O9oUMse5
X-Authority-Analysis: v=2.4 cv=KtNAGGWN c=1 sm=1 tr=0 ts=69416d3f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=U_kbcgyDCDXhmsJV3fcA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDEyNCBTYWx0ZWRfXysn2PecVOP0O
 TtTnO7FPTrkKlH3dqi7bjrE2MBrrcRbsW9Q2gseoQyfA2YjhR9fdYujBrn7DTVT1Dr62hYa1yog
 4FuQtFKfOd9WvzWB152myywyeMMjlYC2PSUfr/c6YVFULMC3fsZJsH1k4GGXXy8NyrrU6p/HDku
 Q07BL5/gfKyjEXE7h+lYTz7XjH/AnvW+xaRXu5rjjf732osOrZ4bUeRCwW076ebUL+HLFJpGoK6
 QgK4+kYO5SIZjgZihmmibzg3GKzjaOVkV0/w1YZh08bvHqV/ViCs+9+kWHd7r3+s5tr0D87klJ1
 xOD6j6dSqgMEQN+OL5LMWlIRda7rgf9bV2u/76mlaEPFdSK9zRlcE2xwdS7PjdLN7GD1HtmL0e4
 9WwR4XqB2qDj1MPu46a9TEl60fsJwg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160124

On Tue, 16 Dec 2025 at 14:08, Swati Agarwal
<swati.agarwal@oss.qualcomm.com> wrote:
>
> Enable USB1 controller in host mode on EVK platforms.

Which EVK? Whose? You are sending patches to non-Qualcomm mailing
lists, so don't assume that everybody knows what you are talking
about.

BTW: you really didn't use b4 (nor did you use get_maintainers). So,
you've missed several mailing lists. Please repost the patchset
including the necessary MLs.

>
> changes in v2:
> Added Genesys Logic GL3590 hub support.
> Renamed hd3ss3220_ instance for primary port controller.
>
> Link to v1:
> https://lore.kernel.org/all/20251203-swati-v1-1-250efcb4e6a7@oss.qualcomm.com/
>
> Swati Agarwal (4):
>   dt-bindings: usb: Add binding for Genesys Logic GL3590 hub
>   usb: misc: onboard_usb_hub: Add Genesys Logic GL3590 hub support
>   arm64: dts: qcom: lemans-evk: Rename hd3ss3220_ instance for primary
>     port controller
>   arm64: dts: qcom: lemans-evk: Enable USB1 controller for host mode
>
>  .../bindings/usb/genesys,gl850g.yaml          |   1 +
>  arch/arm64/boot/dts/qcom/lemans-evk.dts       | 167 +++++++++++++++++-
>  drivers/usb/misc/onboard_usb_dev.c            |   1 +
>  drivers/usb/misc/onboard_usb_dev.h            |   1 +
>  4 files changed, 166 insertions(+), 4 deletions(-)
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry

