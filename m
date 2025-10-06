Return-Path: <linux-usb+bounces-28903-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C60ABBDC9E
	for <lists+linux-usb@lfdr.de>; Mon, 06 Oct 2025 12:50:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4F7B74EC5CA
	for <lists+linux-usb@lfdr.de>; Mon,  6 Oct 2025 10:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7108264636;
	Mon,  6 Oct 2025 10:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GoznwhWC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40BD23FC5A
	for <linux-usb@vger.kernel.org>; Mon,  6 Oct 2025 10:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759747776; cv=none; b=OMETYWuTO/hebOQMtnDWexUVXDlXNnVoil0rbsvBq3UZ00WgK/T1jMb/VzOT7++N3UcVfoq4fop2iKPrgqxClzx3SsyJJ5lPX4sMv+ygGI+YA/PMdF0lr6GxqKnkjMCehDiU8Wv5BYcxW0dCZJal9RI+knOnUZ2aLkmradWNjQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759747776; c=relaxed/simple;
	bh=x71PrHPLBC3o+Re2qS7/l/9Tp2/YYxE8yRMamqWUugk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Go1dNW82C9F9hZsZ3PUFT6R61qFpOUUH1RyruiBVlTI254pOi0ciX/xW7Raez1CnsYNkTaG+fXMJCBCAdmBAoKFmCN0Tv4N8R2HWkCa5zkffcN7IC24fX8wXJ6SRkAv1whlRggoRBT61Jk40h/klpR4z09b0uWycIQ8i8Utp4wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GoznwhWC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59607BUn013320
	for <linux-usb@vger.kernel.org>; Mon, 6 Oct 2025 10:49:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	drmnN38OlIqORdZDnJMTiW0WKN2hGOxhxcBoXK8cfco=; b=GoznwhWCEQdAi6Bq
	8Gg7Lc4qNeNbQGRzJ8XB//x0lAKC5J1uZwuYEasv3JPayzgGTivpQp/q0gS+b9xS
	bxxU1Z4P6VKPgCds1YOihU1w6q02DcqMk0LTXyz8i0hIf9IcDyif4Fhidpl6AQKT
	PGR5t7LBwPTjO0SI3/1du8smyaxrXYAU8/QV/0fJYy2+jPkTB88LQ5l2erS83e1O
	JUXPqCN3VccmMxWl6aV7m9IcweZBBK2xXOCP9qVytGE+OgPXeCt6lc71fv/ufnQ0
	xvUdt7VBJYT35T/eFRQ7NgxsxFqdeDfLzqWQHNpzuLG2m6P4Jd9k+DxPrAihhdAj
	plQ2lw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtwgkpx1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 06 Oct 2025 10:49:33 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8747323272dso14574416d6.2
        for <linux-usb@vger.kernel.org>; Mon, 06 Oct 2025 03:49:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759747773; x=1760352573;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=drmnN38OlIqORdZDnJMTiW0WKN2hGOxhxcBoXK8cfco=;
        b=dCvhPCxq0z+DrMxtzM+15uh6jxwGMQn9uSLkOTP+pO5Qi1AwbQVkBVylurgyT8kvnc
         /l8CNIAc/+DI0KI4O7QLubJim2dldo7ZlWZRbyDS2xvZ8xYwyRB6y6lQaAkn5E7+elgZ
         OMcDKlBLtwPzrNqx4m5cYVPfc6w0HZvcWpidcb+4RyFz/kVXL6tNLxtsSKrdYLcbzoD8
         7ycTMvkD4Qu0XR5nlvBoNAq6rCMMxKsjzzW178lLrHWjAatcl60GBz4YbE8TAJjfBbEw
         rq0zE1AJiz2l6HnYG5n1p/WSI0bIY3wMImLdu28ChYdjeCtvLdnd1X6TwFU+7+RIkF/U
         vYCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBOcHXoD7aXNkdC+qNfwkszMGlT6De757G4adcXJxW6uIIibNTS1JDpmmQnhselAeCKs2eIfldbBQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZHLfOts9WN6oyO9Y9mYd3e7qCRXGgWwX0yEgkQ5NlCCWo82FY
	T27APMI7pobmthMRV8kjIkYgkACYVdqVotm0iATd9lCiqz6Y3tX8dXwWcSqRSk9qlOnc25hJYbT
	oRzq3FyOJk2y1K57IX7emShjbJnLaXXuE7/J0oI0zZig33CIrRtTvBMW7dOCu6X4=
X-Gm-Gg: ASbGncsHjwzr86v9SDorODAlkV2z/RnhmUVrLzL5HycjnitKhicam/llSCPhmMSl3E/
	nmh/PGYjYXy1wShFUtK5TEsxYoYy8WIavZASSQV6guz5ECSlaH4k6hSaa9u7Htk8pzfCbU4OO0U
	SJPKQQzqFAJyzHIWv+yzCC1C5fOKGie8FhBbbbtXUKPuNSFu64TV4kOps0OhexOxsEg1vpLPipn
	TMDFzRJhWVWh0t5Z+qMn8wYJqforDkbl2VUv2H8G8mM7en9mWbEjOzgr55rLTmprKuFYRjiQSYM
	YvWcuLLKkOYvpTcW2ZsN2piDUnTStmnk+vttvracmJLFkGHfdeXYbPWao8/PuKULRR+ov9k38SQ
	kRu8XLkZKyQrBsjr4A3qTFI6Ablk=
X-Received: by 2002:a05:6214:512:b0:879:e928:5213 with SMTP id 6a1803df08f44-879e9285584mr49477096d6.5.1759747772601;
        Mon, 06 Oct 2025 03:49:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+VTWvo+yiJd2hka5IitB6LJFZiNkwhD2oNWTU0fPQwx+hny/k3raTEntXTMOxMdhTcNd53w==
X-Received: by 2002:a05:6214:512:b0:879:e928:5213 with SMTP id 6a1803df08f44-879e9285584mr49476946d6.5.1759747772073;
        Mon, 06 Oct 2025 03:49:32 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6396f73ae64sm4690940a12.9.2025.10.06.03.49.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 03:49:31 -0700 (PDT)
Message-ID: <7390eaf3-0215-49d6-8605-bf573d693ad9@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 12:49:29 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] usb: typec: ucsi_glink: Increase buffer size to
 support UCSI v2
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc: lumag@kernel.org, neil.armstrong@linaro.org, johan+linaro@kernel.org,
        quic_bjorande@quicinc.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20251003002044.2944497-1-anjelique.melendez@oss.qualcomm.com>
 <20251003002044.2944497-3-anjelique.melendez@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251003002044.2944497-3-anjelique.melendez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxOSBTYWx0ZWRfX99/jxZMY2xDg
 bITY9/dIOk+qmoWLMhNvHeV9edxf+6/qxZKfJvpyGygbu5Q8gUGM4VNeYNPMkylh/lcetQinOpU
 SNuTbvp4bY3tZkRF5927W6bn1eVHTQSo5+nhyKnx+AFihgWSp7vNtXD6Dz9y/P9cDzZz+VB/PxJ
 aBXI3hCJ4GMRc52QW0UrwwfZaaHKutfspsu7l5OoBabTL6GMIyPJPA3NuzaRcS78wayzW6W4DiN
 kbZcvoGslwSG0v5rtd8wKQZ6XGenpwCicJ7X1sjUnbId92A+s84gcioq4ljcRjaDb5Kb2ds7vc4
 +GCJ4GKNj75uwZ2xZog+J1ysB/0wOHJ8nV6gat1a0EGDY3tMbJ/RaZqaf485DsxG57HIEctOFNN
 YbqzgqT/v0dYxDoxcuBvfhJO0qil4A==
X-Authority-Analysis: v=2.4 cv=B6O0EetM c=1 sm=1 tr=0 ts=68e39ebd cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=lVQGjyMV5vUjVYruhmoA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: kvb2GTWsbwIFHmMuiQQrpTIes9T0W6BU
X-Proofpoint-ORIG-GUID: kvb2GTWsbwIFHmMuiQQrpTIes9T0W6BU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_03,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510040019

On 10/3/25 2:20 AM, Anjelique Melendez wrote:
> UCSI v2 specification has increased the MSG_IN and MSG_OUT size from
> 16 bytes to 256 bytes each for the message exchange between OPM and PPM
> This makes the total buffer size increase from 48 bytes to 528 bytes.
> Update the buffer size to support this increase.
> 
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> ---

[...]

>  static void pmic_glink_ucsi_read_ack(struct pmic_glink_ucsi *ucsi, const void *data, int len)
>  {
> -	const struct ucsi_read_buf_resp_msg *resp = data;
> +	u32 ret_code, resp_len, buf_len = 0;
> +	u8 *buf;
> +
> +	if (ucsi->ucsi->version) {
> +		if (ucsi->ucsi->version >= UCSI_VERSION_2_0) {
> +			buf = ((struct ucsi_read_buf_resp_msg *)data)->buf.v2_buf;
> +			buf_len = UCSI_BUF_V2_SIZE;
> +		} else {
> +			buf = ((struct ucsi_read_buf_resp_msg *)data)->buf.v1_buf;
> +			buf_len = UCSI_BUF_V1_SIZE;
> +		}
> +	} else if (!ucsi->ucsi_registered) {
> +		/*
> +		 * If UCSI version is not known yet because device is not registered, choose buffer
> +		 * size which best fits incoming data
> +		 */
> +		if (len > sizeof(struct pmic_glink_hdr) + UCSI_BUF_V2_SIZE) {
> +			buf = ((struct ucsi_read_buf_resp_msg *)data)->buf.v2_buf;
> +			buf_len = UCSI_BUF_V2_SIZE;
> +		} else {
> +			buf = ((struct ucsi_read_buf_resp_msg *)data)->buf.v1_buf;
> +			buf_len = UCSI_BUF_V1_SIZE;
> +		}
> +	}

else warn & return.. otherwise in an unlikely scenario the rproc sends us
some appropriately-sized garbage, the below size check may still not be enough

> +	resp_len = sizeof(struct pmic_glink_hdr) + buf_len + sizeof(u32);
>  
> -	if (resp->ret_code)
> +	if (len > resp_len)
> +		return;
> +
> +	/* Ensure that buffer_len leaves space for ret_code to be read back from memory */
> +	if (buf_len > len - sizeof(struct pmic_glink_hdr) - sizeof(u32))
> +		buf_len = len - sizeof(struct pmic_glink_hdr) - sizeof(u32);

I assume clipping the data is.. fine? I don't know the deep insides of
UCSI, but I'd assume this should always be plenty space for an ack

Konrad

