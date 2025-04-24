Return-Path: <linux-usb+bounces-23421-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E38A9B50B
	for <lists+linux-usb@lfdr.de>; Thu, 24 Apr 2025 19:13:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE13C5A7279
	for <lists+linux-usb@lfdr.de>; Thu, 24 Apr 2025 17:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ACE628CF6F;
	Thu, 24 Apr 2025 17:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AA9O/wDP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9675C19C540
	for <linux-usb@vger.kernel.org>; Thu, 24 Apr 2025 17:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745514791; cv=none; b=FFmjO2Em/qjclLwgq+PLD7cjDqcVm3NziBb13tRG14RU1EdoZNyVRe/UhJmZBdFW1Ht7jIYrlzlGDiSHMJ5z7CLcsoWmvIF6u1g7Dvsw/te5H5H3Jhw2m6SpGi24rqbXjTv8w0yMBuY1KjVpd05EpGINX+iXqxAQ6qIrhFlizh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745514791; c=relaxed/simple;
	bh=JQE3mBdHEHFMQzAYutq8p3AN1+1LsUeaQd7+qm3qC5g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aOIM2OtGCzUWkyU5h8JH8It0Lv/lOiXujW0KGP+ZcB36PhkN2r35goNPuNKGAmir2yZIMy+E2MTF/V2V28Ux/GUioLU8wcOw0T1SW+O6C9TVZLadSXGpED7vxA7rSaQCibz5BQaxhcht1eqXH1gOaQeBkGgRyC5h6E+50WQToHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AA9O/wDP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OC3EjL011318
	for <linux-usb@vger.kernel.org>; Thu, 24 Apr 2025 17:13:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JQE3mBdHEHFMQzAYutq8p3AN1+1LsUeaQd7+qm3qC5g=; b=AA9O/wDPa+nYPvVI
	R4eEslFYfvLM1An7w3T8bZ2pTX0nBASwy5MwVVj/ZIIKaap1xf9/E/v72dJuPRTR
	Sp9cJAALFzkQOOkV5rK+7fibzQU6Y8qid9x22TpViRoVywQHtGWu8lhfBkZ8xTl0
	1ya2vrJ2FnWNnATs4a3fwLtbXL0GBCedyd4Ot6orEGPQzIa510z8ktjSywE1imU2
	NObbwy9H/BQT41Y6TvVdPX3kM8ATat3sSEFEdj1TqBb0OUmixgnEsAyCDqwLvP88
	zRq3wBSX26DpJkxJAGdaxxqTlWQeeOI0lgyFGa0qKu/NiIvxqH6bL7o/Vu89YopT
	pS35bw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3ecmp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 24 Apr 2025 17:13:08 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-6c8f99fef10so1151363a12.3
        for <linux-usb@vger.kernel.org>; Thu, 24 Apr 2025 10:13:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745514788; x=1746119588;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JQE3mBdHEHFMQzAYutq8p3AN1+1LsUeaQd7+qm3qC5g=;
        b=lqwkY1ORr+g6IL7gRKDAyRK+HrbVIlHepI4vpUshrH/hLN57gAaMwMfd2jjD3X2wse
         +lMPK+lqPpUJxEU3gORoskblXp/Yx5UexjG/nKmrxcl+xiAC/Z8DQ8qp9LRzuMh9IDrV
         nEuJ2iTkdoVui/49K7HuqyJV0lRkWCtm7QqH54XCysoBA8qNalOFRLobCKAdgvbj6NyD
         D0piyxleOJ3VOMZv4sFbbnpGe+2vp+S0c9BNsEnlR6wUiy7cWAVcotsMIfsEKIS3VUuf
         VShfm/xnxj9YQFdN2JW3CvCI1qFkitrBc1z5xVAhfXhlz5McO7ISIyjSMH1KGxGpPUVc
         bUNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMweMfvgyCKRBJHLRiNhTx2UZT0Y0jNGKGuL7CoTwJv2rbf8+UZnniDtSqh2V4zvDC1weeNcv3bpk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8wMjIeLRum5Zb9G5Myye0FWRnWqsNqv7HoiLyb9I1auKb7M7A
	K00OF5g5DkZoQWYUQBnLL8IQB/ZGlA4Y8G2k/bXMIBg5LwUuef1uSVUR5R6fOL5BdBurwZPxXDv
	3fR8pb24JEkmBPtIZ5toFsbUKEIH4R6My5Ep+JFNTglKdNmUOZRnG3vjNyEU=
X-Gm-Gg: ASbGncsA0NippNe77gqfIl5BZCFgEK8ZAIHVfHWsfce3VSZb/dXECVw+xLMQUbvxAc8
	x55+wBJN5n0m5bUM5UQZbpXuPHRkdpjwq2DfQkz7NVX9XYKHBYLZA1pttzKtpPG9dx11eE2q7WK
	9djvTsw4J4i/4yHcH+Fb3oKb8wRkaHVdoRAq3E6lpfVBt+Oa37t+mqPq0+Jwiy5UIbfHYEcQiSH
	zJsYp2951c4/BXu8EyQTGUEDBLg70IP3ZCgKQKekEMjoezvfLuTG1Uc/PxlnGtk1PvIeudIifr+
	GEsFFy/VYH1xQ7EErwQ26qjLCmo+l6XNITRJjbVzH0/j/nIlToVBaKolBhefNyeuOk4=
X-Received: by 2002:a05:6a21:6814:b0:204:4573:d856 with SMTP id adf61e73a8af0-2045658d414mr151683637.4.1745514787772;
        Thu, 24 Apr 2025 10:13:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBh6UbSZ7iBiPgDos14/2qpkdyV9G45BXz0sSqA0pmze/jGYg7FVG3UwSnpX6n3qo0KD+Oxg==
X-Received: by 2002:a05:6a21:6814:b0:204:4573:d856 with SMTP id adf61e73a8af0-2045658d414mr151627637.4.1745514787332;
        Thu, 24 Apr 2025 10:13:07 -0700 (PDT)
Received: from [10.71.109.146] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15fadec8c0sm1502146a12.68.2025.04.24.10.13.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 10:13:06 -0700 (PDT)
Message-ID: <575d63e7-f390-46ef-8687-30112849b442@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 10:13:05 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/10] arm64: defconfig: Add M31 eUSB2 PHY config
To: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
 <20250421-sm8750_usb_master-v5-10-25c79ed01d02@oss.qualcomm.com>
 <2d01bcd6-80e1-4c15-ab23-b5ea5b90f2b1@kernel.org>
Content-Language: en-US
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
In-Reply-To: <2d01bcd6-80e1-4c15-ab23-b5ea5b90f2b1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ScqDMByDM3A6UF-4UqRox4nbntdOdhbl
X-Proofpoint-GUID: ScqDMByDM3A6UF-4UqRox4nbntdOdhbl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDExOCBTYWx0ZWRfX/tTTu78DQcqA fXNgWjvZR/ZEJCGW7feRz1caXC+t92VqcKpoRJtaGQKInJ+IU56Gc3n6sguURgWdUh59RaiBZE8 4iI8zumwXEJxBFXrZAOv++rmE36OE0x7qdZfaQvgr6mTkSPPIETl5Xid6uiAmJQCxH9WXvLnEBK
 taQHjLSxy4zfyv2xl3/veRENzzRXN9GlGdmj1FTCRb0rCQ8pyzLbWBMl/hTB+yl3IqMRIW8Ni6T 9kEmmvfQZjtXx+i5vcN/XLBDMQnOzQFCNpPpSZIJCBeVKzpxomQ6KaGIXcxc+Bn5i4FyRd+qA36 lwQiF6HmkD3YaT7H6bRrG/LwxxaQjLuJeuzC6GBevpK7DjE/hnPAirhn2vFLvN4fZ0rBojCaGkv
 IpFPKQXjCUDcv60WRCUSSw7GixDensItXcvSAuS8dDCqH22z7rlbMPHnHuA6E7yrwnfLo3DO
X-Authority-Analysis: v=2.4 cv=Mepsu4/f c=1 sm=1 tr=0 ts=680a7124 cx=c_pps a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=SMseXh0oWhwDNy9TrckA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_07,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=711 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240118



On 4/24/2025 6:16 AM, Krzysztof Kozlowski wrote:
> On 22/04/2025 00:00, Melody Olvera wrote:
>> The SM8750 SoCs use an eUSB2 PHY driver different from the
> Qualcomm SM8750
>
> That's a defconfig for all vendors.

And...? Apologies, I understand what is actionable about this comment.
Please be clear what you want done about this.

>
>> already existing M31 USB driver because it requires a connection
>> to an eUSB2 repeater. Thus, for USB to probe and work properly on
>> SM8750, enable the additional driver.
> Commit msg should mention which board uses it.

Sure thing.

Thanks,
Melody

