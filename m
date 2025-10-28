Return-Path: <linux-usb+bounces-29799-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 811DEC15D1C
	for <lists+linux-usb@lfdr.de>; Tue, 28 Oct 2025 17:31:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64CF53A6869
	for <lists+linux-usb@lfdr.de>; Tue, 28 Oct 2025 16:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C170283C8E;
	Tue, 28 Oct 2025 16:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ip7FL2Ax";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cn9n6Epi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4996A21CC59
	for <linux-usb@vger.kernel.org>; Tue, 28 Oct 2025 16:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761668666; cv=none; b=Uznesczn8sU4x0SH+hNZEzlxuP46dSjO5ZgW1PNbSJ70ce0hAeMsXUUR7RGxHaWDhlavBIskN/ABIplc0FPwJ3qA1xQ9QBZTnjm6wdmCHrbzc0NXMevMAnnUZhJYIkvzRrij2KEl3ZO7od+hGjx/F2nExUsf0VgBx/VyiqUGj4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761668666; c=relaxed/simple;
	bh=VOOUd0yB2hDhZwiksvorsIKV3pFxYwvb/WQjdsJBQiI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g8v6n9mlrgS53alfMFsVlOMiAuO5fg9cpYWrQtTPJQutQ9+qvqeCiFiqS+kAV1LHo1wpmFP9ZU4U+HEaNAaJr6jbCgaL80M9PvmIehORogAcTBV/ljCQPGy8z1T/oj2C27EhSYZ/zKIWVCtA7klEadXQM4bHo4Gn0GMIzB0L2IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ip7FL2Ax; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cn9n6Epi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SEoOrL1861164
	for <linux-usb@vger.kernel.org>; Tue, 28 Oct 2025 16:24:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jtUdNX9bE+KPstFHDmJc5ogo2QH/VceXzJSQsB/Peq8=; b=ip7FL2AxE1KMSvjB
	OqeNoqRvNNBf/Nq+fQVY7/YBZXKCdAc4i4J53sIK9wSLU6MFnpia7l2lk6lTi4DW
	GYOgkABHBwoaC0stRcfrC1oj/Kk9GHkSt+Qw/xBUVyLAWL2d2pDP+lhxqVqx8Ojf
	g/sgjHTBY9c4/4erO/KD088sxLlO0rVixAKzVIvCYZB9Unwn4YTBkAkpR9YshbDe
	4G4SILdiMbfZFs5XMbRzk/WxyD2H0fgpnJVb5BSckBtkKV7rggBa6YjRHiGu1Jnv
	3ABPr06xWySFD0Y8+GMpqPBQeTMCpdSuhdc7vKm36pmdAK36rej3Nx//7Ek1T/pW
	/A1RXg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2ur3h5p0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 28 Oct 2025 16:24:24 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-818bf399f8aso197056706d6.2
        for <linux-usb@vger.kernel.org>; Tue, 28 Oct 2025 09:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761668663; x=1762273463; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jtUdNX9bE+KPstFHDmJc5ogo2QH/VceXzJSQsB/Peq8=;
        b=Cn9n6EpiZnds+1weKmfj5Blnte3ssFN794F1halXvxiOti02sFnvpyu1R8oB/heiJ8
         9/Z4GZvjpvuFF1vaz0QaSRfZRtXzXjhQf3OpBz9jpAJwEeaHXG8R4ZG+oEU3zeSM+5yN
         cdZriGBWdl7LjkXbxcTK64ecZPOMD/9bT2BSQKtSC/w5Z8uAEhOPfi6eeYabafcsxrwo
         zUI4toFvAslo9JX1ULV4oiEuQTj/AjUg3InvtQ7ZppA083pNPGsz5R0tm6J7ZoCXWHhE
         86ORUhsBp6Cjydgz1C/h02kFtPMsteF48FXheTIJT9KtySnNKuX0miSCetcn37IwFYuW
         LINg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761668663; x=1762273463;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jtUdNX9bE+KPstFHDmJc5ogo2QH/VceXzJSQsB/Peq8=;
        b=DDyZCvmTjHjmXD03oQ5xhDHLAy6biCqDV+Zg23l5gxfXsIrHjxVZoinztr9dSuu0Rl
         tsN9LWFPHKYzhbdUEmwLanZWgnO0Y8JFuEFqcX2nP2gYaeSLZrUvMNv5KNg/gzbQRX72
         v5B0tzmJPrrnmmoNu8/XYSahOLHZGTRrqFaDAQDOygV5hNaBS2GPzhMbr/lAyNpHgNV+
         Cu4fbOEkZkes3Tqq7gGkw3t7GYWNkiBSzb7ubtXdvTWbXaSyfeLIz4qxnY/YoyxoBJ7I
         4MGsO4JgLzOi30plUOyAkTQbE7XPGTINqFMERDR0lLX6Xj3Al+MwwgkJ3LJQ0BxYieNv
         8Onw==
X-Forwarded-Encrypted: i=1; AJvYcCVXVxyHsonPwV+xiL0T6gngLIhhj98dpdyaX8y0HRPG9W3fyNNYIYA34JhhKnQO9QSoQN07bH5YNYQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgeUZPQHypu+kqv/H5FYcHrco8zQajBJh+nbJhx39gMHaK7vxS
	GoDSDsdb49KLoxkCaPFD7x5//N/gEJIgvKNCO2kK9eoxrU+gdYf+gMlXSquliaHwlQTOlPDvPf+
	y+Hf2LNR6ENOEV5E0ycDbEdXXqFlWmpYbn+3kUs8EOqRpvBoMXyQG38EBaJfvdI0=
X-Gm-Gg: ASbGncuHGf+7BNFv/DWf8oryFIL7V0hyjjDjZ4SU5SSJ2DizTbjK9WcMUVsa8kagB0H
	lp3YsLzUapyOArcYA0nKYhHfuu26phrc+VOymlgecO/ksUABIv0swKoeas8vCf1vDwPE8WS8Ybg
	ZsJr2fsx+84LpKq4wrl/8JKaoVbbdCccR0aWnNkc51YPbY1sH39R6Ie6JEMygPp/xqpJaCKIVXM
	hFUtLvxsfUNRn509+Qe1SfxLRfbqJhbEs3zA1ka3P2odpQN7Z16dB6AMiW9J2XXFLDvaNX7Isvs
	vM06GKIvw+UxdpRcJvRn3BCnxg3UvfsthN4S/r9AAmkFQTZ2CFlVdZAAhZP2w71WmfvR7zdyI11
	CVuMB/Al2bhB4cmDfn4y79WFDBruqwNBEnDUf2+Hz78aa1nN54b3OFSsG6G+vv1QMhhio2kFT3k
	yOlg==
X-Received: by 2002:ac8:5715:0:b0:4da:155a:76fc with SMTP id d75a77b69052e-4ed0743d17dmr55587791cf.16.1761668663433;
        Tue, 28 Oct 2025 09:24:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCKOFPOmfgrI7A8CxeXrD8u3C3qKFzqHwtQzNQov7iv1sjzmfKzAIHqNkJuAiIPIF5+4qzRQ==
X-Received: by 2002:ac8:5715:0:b0:4da:155a:76fc with SMTP id d75a77b69052e-4ed0743d17dmr55587131cf.16.1761668662840;
        Tue, 28 Oct 2025 09:24:22 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9? (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f41ce8sm3240866e87.6.2025.10.28.09.24.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 09:24:22 -0700 (PDT)
Message-ID: <23b6e21b-40e1-419f-9314-97eb685b9aef@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 18:24:21 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: typec: ucsi: Set orientation_aware if UCSI version
 is 2.x and above
To: Abel Vesa <abel.vesa@linaro.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251028-b4-ucsi-set-orientation-aware-on-version-2-and-above-v1-1-d3425f5679af@linaro.org>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20251028-b4-ucsi-set-orientation-aware-on-version-2-and-above-v1-1-d3425f5679af@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDEzOCBTYWx0ZWRfX5CkOeQAslDNO
 sceSDJP9qbIlMpwC9rQWgzQHkOKHpgk4DPPuIhfBQm2d9HKnbPwKIl8vEORRIWge+PsVy83p+RR
 b4IbJSVLBtaYo6QVMITzzqBmiIQtNBjXrwg0Sm/XgcUMqgqdC3VNrGAxwF4edBWyQ09i7FIh/yL
 y55HMm/kG71ZJhgbzZA194UKGAVBXNMzqCdbRe2mpVaGlO22nDfbqQOZYHb6oLAjc0cwnNJS4Gf
 KylZCCnFgACA48/8BbGAp2aOb+wg4x3Onj600ODQtXvxCo/MqjAEV7fxwlQ1jemu26VmamcCzxs
 wcrm9QMEYkFpIjrYv6pkzgDfZPO/rcf/uZUguiNBA0GLYP04U8+vC3srqf72qqF6ttH2OegNmgx
 tyPxPn+vPI9/oMXFbSHW94xpELdmUg==
X-Authority-Analysis: v=2.4 cv=Jub8bc4C c=1 sm=1 tr=0 ts=6900ee38 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=R3k_ItCzhSAMZnOdhvsA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: unchPPdTJ7AxHw6ysotCD_o2z0BkPR_v
X-Proofpoint-ORIG-GUID: unchPPdTJ7AxHw6ysotCD_o2z0BkPR_v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_06,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280138

On 28/10/2025 17:43, Abel Vesa wrote:
> For UCSI 2.0 and above, since the orientation is part of the paylad,
> set the orientation_aware by default and let the implementation specific
> update_connector op override if necessary.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>   drivers/usb/typec/ucsi/ucsi.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index ed23edab776354f08452c539d75d27132b8c44dd..84afa9bfc65b6e6ad0a8c1856252299c16562baf 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -1637,6 +1637,9 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
>   	cap->driver_data = con;
>   	cap->ops = &ucsi_ops;
>   
> +	if (ucsi->version >= UCSI_VERSION_2_0)
> +		con->typec_cap.orientation_aware = true;

This is not enough. You should also parse the data and call 
typec_set_orientation().

> +
>   	if (ucsi->ops->update_connector)
>   		ucsi->ops->update_connector(con);
>   
> 
> ---
> base-commit: f7d2388eeec24966fc4d5cf32d706f0514f29ac5
> change-id: 20251028-b4-ucsi-set-orientation-aware-on-version-2-and-above-b79245d4b066
> 
> Best regards,


-- 
With best wishes
Dmitry

