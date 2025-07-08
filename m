Return-Path: <linux-usb+bounces-25583-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F063BAFC905
	for <lists+linux-usb@lfdr.de>; Tue,  8 Jul 2025 12:57:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16D233AE90A
	for <lists+linux-usb@lfdr.de>; Tue,  8 Jul 2025 10:57:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93BB62D8777;
	Tue,  8 Jul 2025 10:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MnaKSVj5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53802D23A6
	for <linux-usb@vger.kernel.org>; Tue,  8 Jul 2025 10:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751972251; cv=none; b=kp8CgMwpr+vUmaiISgR8jm4C7DG14cErjhPloivHdimIQ41t4WNIN7kh0MQ+226zMsOR5hfGVDh9O1wKMtbLfS8UgfYxYJvGcTRS8XlbjCf6A+E0uaUHvcqHgzaNoZbbDQkGzQaPbRPpWDdm6t17wOXnXokriJEHT2TiIbX4y+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751972251; c=relaxed/simple;
	bh=KQmoX6nrC3iOjojW5GpuVT6EIS2Nwlzk+oP2PlFfsy8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OvJLZe0VbDK6U/TwZkMYUqMazWopSzP8baYxOduPIjJ1P1F+vlHTRPqAMpeC3EBeNy8Lva4uzf9DfccEeAxLC9jemRah7T/haw+P7GkdMpd2ZlJ9PtFvXzSE73iRyf0oBK8cOI95de0yso5XCeuDGJGskK5YV7zlWHauTXnzMT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MnaKSVj5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AAbgc017169
	for <linux-usb@vger.kernel.org>; Tue, 8 Jul 2025 10:57:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GIF5DKT27vfXZVCXrF8mPns2kUF2CyYYqvaNZxZDDQY=; b=MnaKSVj5uWdAkQ/u
	6eAWM/90uIMGTELEc1QOQiJYiYdlfsR7Nu2UdeHOFXa753xT21WXFyP0IVDmoUYN
	oQPaV1nr4ZUGunffV2Mki2zK11qXsf2O0KRS0j3xtpfJBUjSp2rG4QOpABfss2Cs
	LPlHiH+UB2yBnzbvXN/mpvpkl8z8oKADQ8zSX0UpGuBcyYziZOK9f3leRfuFHv0c
	70XJyDIDByzl+g2i+lPIUHF2R76ioybIjRnm0Cs47Ma7Xqep2upOYWbkjRgX6OGa
	BlsXn7pK8DYaoxDpEEkDzoLqtlZh6G3ond6EPVVvtYbPxbXAWLpj1Gkv08RkZn2m
	hjV8BQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pvtkm776-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 08 Jul 2025 10:57:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a804126ed6so13625131cf.1
        for <linux-usb@vger.kernel.org>; Tue, 08 Jul 2025 03:57:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751972247; x=1752577047;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GIF5DKT27vfXZVCXrF8mPns2kUF2CyYYqvaNZxZDDQY=;
        b=PQnREaB4QQlK/hbaoxIaOquym7q47WTG2zJSbI7BvpoVxSmdFC4PkLZSfDpMK5oQ6B
         5eYI2lFOlWslZiqVoeTFSHxyICnfBeSHvZYPaJqxroooSu0hxfLLN44QRsd81VLjePtH
         1SPKg7p398RPzW2UJNG7ykatgon35AtkiyLWy1FwrHfEic3TKE1A0Dd64iT1V/IOocG1
         7lIbcGAQz0VyAr99BBkLZbYbN+BUi4j3Xp7lDpdeMpbOKSyTQtn+/C4XgzxJERmCiMXo
         HW+jj6Haai0LHqZomSrtTBK4wRZsgaVJxp40fx5Fi9nLXTsJKY3fZiJFSmP4UghGzTpJ
         13pA==
X-Forwarded-Encrypted: i=1; AJvYcCXo/GcSixPK5awINaidP9KzCi1JIX4XHwL1pr+IrEmm+9LetTYu0OK40bag87LJvb0dCxmII+n21ro=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+geaFeLQTbDsgGYK6jV5GNPqjTu4ifmjknSyehmDXSoMr//Vm
	DGTIygBf4We0Tnh/SKe/k6M1/xr8IXPi52u74xj5j+5oo/qtzoX+TAnpeHnjeFUNbyO/K98ROdO
	W9GHGci2LWWwnHRvTfphUAb3tfMV+1xIQ6IUEfaKyDGKTdPZwW9F43DnjcwOjJkF10S7OfGU=
X-Gm-Gg: ASbGncuQxHrLioz5CpRNaD0oiqO6qW1muUUS5EFd7e05v64vJfjjrFv/vt2P9ExXInw
	43DUb46778ujkcmaYoC1oETa+gvy0XtYrAvfU+ACqbQx5Uz6Q8JTbpSesHFcPNEN3ULx76QFtXE
	npKRNQB01NDmYvEpROpv5sw+RUb4FyeNmWeghGBl4hmM2ohkuLs/HSqa6TJsXS1w/GutxhSeDWS
	+u0jghf+sv2bzI+CDE3oNsAwYu7uUVzxv6NamsyhIcWzJCmeDln+ppsT+WDc9CSJ133U68Y6mId
	7KDCBx4uTBhZfs+ROncKgDlizoeB5B1pxDje/xNOiCO5cwRdPLsMhN/rIDShvTdGHR9rTLpKOr7
	6dSo=
X-Received: by 2002:a05:622a:58c5:b0:475:1c59:1748 with SMTP id d75a77b69052e-4a9977451a6mr98009731cf.11.1751972247078;
        Tue, 08 Jul 2025 03:57:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZt2S+mAamOHM9eCscgbyUrXKj31C/cdnLpzexomatqLRtS+49FFgn7qQCYjgEVPgfBjzG3Q==
X-Received: by 2002:a05:622a:58c5:b0:475:1c59:1748 with SMTP id d75a77b69052e-4a9977451a6mr98009541cf.11.1751972246669;
        Tue, 08 Jul 2025 03:57:26 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fca69657fsm6993938a12.26.2025.07.08.03.57.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 03:57:26 -0700 (PDT)
Message-ID: <85aea6a4-cb14-4fbc-bf97-7de513aa0eb7@oss.qualcomm.com>
Date: Tue, 8 Jul 2025 12:57:24 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] usb: misc: qcom_eud: Access EUD_MODE_MANAGER2 through
 secure calls
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
References: <20250708085208.19089-1-komal.bajaj@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250708085208.19089-1-komal.bajaj@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDA5MCBTYWx0ZWRfX+3Sd5ehEJW3b
 Li3qwUu9iJeMB6OuzuS7XUHPZNKOkq98uGuLwjw9gwfsCFznIKNQJWP9SPfg1rWKhQJh2Nz04Q7
 d4dZZJDSTIyP3xXE1CteyFBHJen/u0OMJpeUeSfX6yIKJJpbH5AYotQ25vuxUAHAtDrSX1Y7i5t
 uedqOiCcUi+pJrixGy3Uo7DoGbbx7dStGG4oI2js0ly/ZOexeGlJIT1GzdzEw4bTjI/dUMJ0iJF
 VBxUnM35SBnTlzKGwIFpyd+Ahbqj3XsK5bv0IjTRc4Cz4m/FCsbZ0AY6ONmRS8Oj9sS5sVTddW+
 hcLL7y6qu9SltJVPJ4XOg3dqlJzYZzgtyxsJREpX2DgJRW/9dchgISZLtlYbB7NnqclTpneSXpY
 DALGFlin8GXPBnCrDPJK9wLmc08JbTrh5+FlhTKtS9Q8/KirqffjSZARhrzSdNdgfAQ1mVs/
X-Authority-Analysis: v=2.4 cv=Vq0jA/2n c=1 sm=1 tr=0 ts=686cf998 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=6MIUTFbEWCSSVVwswsMA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: qMx0U4ZOjpaZjHFlgqpxH-cBJovJby8o
X-Proofpoint-GUID: qMx0U4ZOjpaZjHFlgqpxH-cBJovJby8o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0
 suspectscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507080090

On 7/8/25 10:52 AM, Komal Bajaj wrote:
> EUD_MODE_MANAGER2 register is mapped to a memory region that is marked
> as read-only for HLOS, enforcing access restrictions that prohibit
> direct memory-mapped writes via writel().
> 
> Attempts to write to this region from HLOS can result in silent failures
> or memory access violations, particularly when toggling EUD (Embedded
> USB Debugger) state. To ensure secure register access, modify the driver
> to use qcom_scm_io_writel(), which routes the write operation to Qualcomm
> Secure Channel Monitor (SCM). SCM has the necessary permissions to access
> protected memory regions, enabling reliable control over EUD state.
> 
> SC7280, the only user of EUD is also affected, indicating that this could
> never have worked on a properly fused device.
> 
> Fixes: 9a1bf58ccd44 ("usb: misc: eud: Add driver support for Embedded USB Debugger(EUD)")
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---

[...]

>  static void disable_eud(struct eud_chip *priv)
>  {
> +	int ret;
> +
> +	ret = qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 0);
> +	if (ret)
> +		return;

we're not doing anything interesting with the return value.. but taking
a quick look at the call chain, I don't think this API produces any
error messages - let's print one then, for the odd case where TZ likely
needs fixing..

also this is ultra nitty, but please add a newline after the 'return'
so that it matches the change you made above

Konrad

