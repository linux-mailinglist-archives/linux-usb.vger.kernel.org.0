Return-Path: <linux-usb+bounces-25753-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E756AB03A20
	for <lists+linux-usb@lfdr.de>; Mon, 14 Jul 2025 10:56:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BEF4179F93
	for <lists+linux-usb@lfdr.de>; Mon, 14 Jul 2025 08:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C452C23E320;
	Mon, 14 Jul 2025 08:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pVKSxzIQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A999B23D2AC
	for <linux-usb@vger.kernel.org>; Mon, 14 Jul 2025 08:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752483370; cv=none; b=b49hUWdKi/3iinud0M/ufHWJfOnyL4UE7o/zaCbWbBUN/hDg987N9tuDGrHjUO/VVR5FZBIzZxgidAJZJQPy3s+eUx9ppXcPmv+AMD22hsojZJczfdst6v2NsnxOOCMnRQaLpldEaiK8kXP8vXsKMVG11izXzvkM4SAQDdKz+KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752483370; c=relaxed/simple;
	bh=X4I+rX7MASVYPmxglye1FOXudOJ3WWjuc7xvNa75H00=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rjFEkd6kppSXvygggcDokpx9NnxFFmQyrC5/GAEGvn8iy2xsap/4yVY2NOYdzLg5l0c7N80VCy/3NxGVc+3DFOyXKT1+T6jA3KO0ESdiCSQfLIeIAo6RfP8zQpnrJ1AtXMl1fBnm3SvgXxn7O6XRkgrbiMF/P2YFtK4jvcV1cwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pVKSxzIQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56DNA3Tk032297
	for <linux-usb@vger.kernel.org>; Mon, 14 Jul 2025 08:56:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5jY0WGc6ztQzUZ3gymsyEgC3n2Bv8t4dcCvQb5/DBr8=; b=pVKSxzIQrhKpDbPi
	r5coC3MplEo48xRgsX5iu1wil4cZlcdLj/qXYycNo0fQI/0YVH92iMmb3cVCZB/u
	i+QJ9/3lADJmAl99qFOuwIOsW03gGT4Of8kGu4ZcvNb/FvPkZ+Z7L4VEF2/Esfqh
	pvi0lzNiN4DrvK1DDX5emiJuufWiQ0xGqCJxnAsENLy4WCpDWXvJXW6JNC1GxOSM
	BJmmjbkQ/t98PISBMf9oI26tbu0Xx/rg1yHLs6FAr3Gix3IEK3KFs0je0/Wms8rI
	nlkqjX+9KLU1qF8cv0g+yVQzz1p1h4mpnmsh9fpHsKX5M0icSpxvGFbRmRhGR/c/
	Vk1BZg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufvbbvjb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 14 Jul 2025 08:56:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ab3bd0f8d5so806591cf.1
        for <linux-usb@vger.kernel.org>; Mon, 14 Jul 2025 01:56:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752483367; x=1753088167;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5jY0WGc6ztQzUZ3gymsyEgC3n2Bv8t4dcCvQb5/DBr8=;
        b=ROFQaB87mTLL5UaaSkIKoNBjnFbUqE1EJYgj32LzpmgadDzbtPB+7vCLsuv4BuQZ5b
         YJLlRRicQH4D2AnJWyfsoAXxK3a8vk1k5NjheU2teGAl/jZt6b6JSikmERxg8Y/ulAWW
         TGeDjRs82GISJbd5tkJGfzPtS9uY62qXgLF1ROuY99TfrYiBRLMyqdDzklIO1AivsIWp
         UkcTfDIyYHxpEhzJmHLP5I+1D/rrWOHNaaRm5AKd9UKw2ZgywiNfwbK2LYT2/0NYy4L3
         t9Vj7soLNq6akOacPfCZkfgd2SaapK28CjY1Mk/uuZETf8JWJq86NZPkn2M2zV5vHYur
         YmDw==
X-Forwarded-Encrypted: i=1; AJvYcCUUq7lDBpNzGkLwFtVCnUrxOwC1emdgGHb8/kc2vT6DbDUU/eZt1CogdtubAn8JrH/8OrRIZBBG4GQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSX7YWmE+osuUrzdhbHfweOvy6S87wUMf6TC4Yf47T5H1c+R/z
	FLIr/nOmj6Tu2FQfyjgzy9T8ZfUnfG4jJ6vYY6CerkNk2MDX0YJ6/S/Ak6jpcDGF1WMihFheoKl
	QOoUMCcR66oK3UCjXO/VCEHb1uBEdDzF8SX7nN9uVnq/j3jsl+LMyWMJWAHEBIpo=
X-Gm-Gg: ASbGncvuvSQZUtbLlLQIztYmmunod1RbW83cqEgdvPrSyvUMeHME22pf1+Y7hwZLTDn
	Q4xlHoA3wWTm/VCTTCcpLdkt6TFQbE/p6MeKMQfotAs5b+qSl0SgCHx/PNYEgtWQ7+vsegusoXa
	gbv8fXYDcTspgq1ThN9OamQ2siVc/SUuDRWtnnv5/CX3+JPYdYP3HOYrvMovdK+qKJw0W7ZYUNV
	aF2w3wQcGGQLZfxXTOHpbzFYe2v1FV5MjvCOY30Vxbf3WwqCdYTvuGKpQgeaSxVXld2/A84gPqk
	hvmxMEWE573N0ST4aNxWGDUIV2+AGkhBxvn3wB/3eJxLWhjWZdaTZ1o0EbREcy8x0IVu/3WZ9WE
	lhqNfma/lCzc4bDF/pwk+
X-Received: by 2002:a05:620a:472b:b0:7d3:b0a3:6aa7 with SMTP id af79cd13be357-7dde9953e8amr657113685a.3.1752483366619;
        Mon, 14 Jul 2025 01:56:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNHAGDmj1FNKm7Td/jrJizwNYUh9v+mDxMjEP9OpPhXFzcce8+hBlEif0l1OBFKxoCqJ1Zqw==
X-Received: by 2002:a05:620a:472b:b0:7d3:b0a3:6aa7 with SMTP id af79cd13be357-7dde9953e8amr657112785a.3.1752483366190;
        Mon, 14 Jul 2025 01:56:06 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e910ddsm792022066b.18.2025.07.14.01.56.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 01:56:05 -0700 (PDT)
Message-ID: <7095596c-58b6-4581-9823-0f924b4ca005@oss.qualcomm.com>
Date: Mon, 14 Jul 2025 10:56:04 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] usb: dwc3: qcom: Remove extcon functionality from glue
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250714044703.2091075-1-krishna.kurapati@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250714044703.2091075-1-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA1MiBTYWx0ZWRfX/BZ7470aITVt
 hxaIY9b7UmBUJ7ORmGlz7sKufMlPxj0ZsobySqljAduMjh3fNPDd7VCbA23VblUN68sQdDRonP3
 l4e6Mi1XZfG5HHvGEZo2EDX9ItpAsOx3pWlbjNgMcOkPS8MtTN1t6BhaVyc9aGFtRR54bIZD3nH
 7z+J32NrNO7A3IgaXfFGcwo+AMnCZ/ENfL64/ETkf/B4IVjU9uYDENuDk+XmrnOf4l82SRJMS16
 xQ74JyjbE0Vb7C1vx8V5qkhcz2u4qaqdH9XGOZpzzP8Dc5QxzTcvR0yvzO7aXvk9/KnD3jR3lXk
 FUduuaQoqerFbutOp5quTLOtj18GGopPpvOs5/9estQc43tTSbtqZJMWx3GIjFgXOK2PpL40LMu
 uXjNCeQIUZkftyj9MLfMFcM/n7+y/mMVruq9hxhZ+Go4evBTcZmjAy4uDFrEeVS1XyE49ko0
X-Proofpoint-GUID: YJWkmWR2xw95bjLaUZoGqb46GFEzlD0u
X-Authority-Analysis: v=2.4 cv=RPSzH5i+ c=1 sm=1 tr=0 ts=6874c627 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=gYDs5GclryXmtiFo2a0A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: YJWkmWR2xw95bjLaUZoGqb46GFEzlD0u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=819 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140052

On 7/14/25 6:47 AM, Krishna Kurapati wrote:
> Deprecate usage of extcon functionality from the glue driver. Now
> that the glue driver is a flattened implementation, all existing
> DTs would eventually move to new bindings. While doing so let them
> make use of role-switch/ typec frameworks to provide role data
> rather than using extcon.
> 
> On upstream, summary of targets/platforms using extcon is as follows:
> 
> 1. MSM8916 and MSM8939 use Chipidea controller, hence the changes have no
> effect on them.
> 
> 2. Of the other extcon users, most of them use "linux,extcon-usb-gpio"
> driver which relies on id/vbus gpios to inform role changes. This can be
> transitioned to role switch based driver (usb-conn-gpio) while flattening
> those platforms to move away from extcon and rely on role
> switching.
> 
> 3. The one target that uses dwc3 controller and extcon and is not based
> on reading gpios is "arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi".
> This platform uses TI chip to provide extcon. If usb on this platform is
> being flattneed, then effort should be put in to define a usb-c-connector
> device in DT and make use of role switch functionality in TUSB320L driver.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

