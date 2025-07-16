Return-Path: <linux-usb+bounces-25877-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3DDB073CC
	for <lists+linux-usb@lfdr.de>; Wed, 16 Jul 2025 12:44:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDA0C583415
	for <lists+linux-usb@lfdr.de>; Wed, 16 Jul 2025 10:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47F332E36EE;
	Wed, 16 Jul 2025 10:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QDqMyDRL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252752F2C5A
	for <linux-usb@vger.kernel.org>; Wed, 16 Jul 2025 10:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752662673; cv=none; b=jWFWF2cLK9QYy8ZPwwwClo1/EMeonWPGOkQQV8UGSWnZ9WJaN5GICmufqhp3V+PNZjlMrcq7N1AnEiBspvFmfeIP4GC1rYVpEky8IOwOR3P+UvUqSRWF+HHTfaD2kExHWDKkr7HAYF0pG+L1pzdGSkU+/2ur4jSrllTKuTQpSx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752662673; c=relaxed/simple;
	bh=Tin8r+U+w/3y+LP84mrbjl934s1RYjdcEk4TcBbna10=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bOg1i+7IIJg1MaU3CalCbjdE7ux1OG7Oahu7ZUeP+HrLM+zaA8H5C0/NIkaXcCgRSeSRRaAhDzOnukVDDlQeBw3gYKr2ztCZ9Rk1/eWMxN/pd9Qir24CtGcBJnpxN6Dlw26T54Ot4i30gNDNdBiJBP6fE3avmUi5pLR01JGGH6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QDqMyDRL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56G6Tq0A017603
	for <linux-usb@vger.kernel.org>; Wed, 16 Jul 2025 10:44:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GwojsqO00L46el7Hbe+U3o4hx2hTDdeThYiZKwFHZxw=; b=QDqMyDRL3w7yoE72
	BEOQUgysZCP0FV8AwWjuS9dyoHCrUtA4l1s4LU7ErFNnPgS5mRpIlVRRt23sBzw+
	vvkY+ZgVylMrGMiw9yI8g7weJO81zikOKoI4buzIx/yQFVj1auteKDEPApKonbC3
	4lPZmhQ453+KgEeXrSBS0g6dGCQdOOUtIKdtn4Xw/CT4zHQrha3lr/x1mF+hZHhb
	oByoe7fRpi4TRLITCxmRj+xj88sWFUAaAvLTsF3mJ/4H89ZbURMIWgZpzPghVFGd
	f8nN+CP44BAEyzTfrNL9ou96L4A89JcH7tf78kH01sd85JnuJN0bPUP6OU7/BSOW
	q8sf4g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufu8bfnc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 16 Jul 2025 10:44:30 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ab60b83e11so2208451cf.1
        for <linux-usb@vger.kernel.org>; Wed, 16 Jul 2025 03:44:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752662670; x=1753267470;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GwojsqO00L46el7Hbe+U3o4hx2hTDdeThYiZKwFHZxw=;
        b=SF/Xc65QOgJebzXw+H+9DdxNhxPA7g13gQ5/ddpvGZUUXFfbpx1xE1OPJKCcphq4jt
         5sa/DC/Mv8KRlqsX3Dj433yvSBQhtuoHh+n4eAy1Tutq2zuc+kYVQlkLgaRWLkpuCIYT
         FD0cTGGKuLQ/j5j+4IN+ClBGCZ11Sr+DXCOter/rYtY1o8P4i4digDVahm1WvMgzX+du
         Ls7YLQxg5wRsRbFc8V0a9ag67S4p5FFhI2GgICI/OkhYoLADOyGF1tp/CtGfsjAkolru
         Yl2EBw1hkVHFGlHxYxgk09p07CKH5hwsC2nrChQQhVwf5dtKbo3A+PJWslK3Zd6VSlpr
         j6Eg==
X-Forwarded-Encrypted: i=1; AJvYcCWoAe2dvQQFLaRmaxEOvhT/HM12ep80guJykvY4KX4yOSEforK3cjya9uV6ozhsgFyO1sdr+rSBfck=@vger.kernel.org
X-Gm-Message-State: AOJu0YywyA3rM1hKXwReNbIfNK68R4f9Lb2Gnhs6xq27DzzVuyy3Neou
	UH6nLUqdU3F4pytEgrfQYHCYXKjYe0zYjndV2wPVJqUxbmTH320u7dyUcpmtz4/BqEDxfzjbfkK
	wuKvG8hTiS7AfVAshtMnSeizeOe+6cANU3/W7M9ztSDIDIRe+XDdbDHrlB5hsk94=
X-Gm-Gg: ASbGncvuOraE1W/jz2wHdK+vAWF3MNta2q8N21g0zt/IgXW4cdHon0Y51zBBSh4laEI
	B46bkBsiJLaA/PUdtnAyp/t/W5ydgCRYhJ8EazPKy6n1r5kICtOhCHVJpP8buDKfEvLErfXvYMv
	Y9ml4gzF78HFkoqrgL2psQTKtr7bA2g1B2bJyRFSbhqPT+TyiIOIRXD/0SqIOdlK0m7Zk80fcCo
	3JEJS7y1WSYP5APaLpMXY25EEVvvotmhL3X/wjqU01cdPbQM9tIBXLw7w0aBwcwW183b396U8fd
	0Jp5GPXTr5/oGSRKUGXROR4BjaJe7fQLPSqrp3tOcVY518EVkxwVhRgKKnxBAWtZdFlkBbjllcP
	btKBPRDh1N10vnhBPYYwg
X-Received: by 2002:a05:622a:1b20:b0:4ab:806f:e30f with SMTP id d75a77b69052e-4ab90cc3a56mr14294911cf.14.1752662669722;
        Wed, 16 Jul 2025 03:44:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9VYocXZ0PhMt9kgWk1/jx5BjJs0UQSzRLjaw/6hz7Y8Imt/1VQJqU11+DAf4VNiNJClKZrQ==
X-Received: by 2002:a05:622a:1b20:b0:4ab:806f:e30f with SMTP id d75a77b69052e-4ab90cc3a56mr14294601cf.14.1752662668802;
        Wed, 16 Jul 2025 03:44:28 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7ee45ebsm1163531566b.43.2025.07.16.03.44.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 03:44:28 -0700 (PDT)
Message-ID: <697bb6b0-ecca-4392-9e7c-8d4ef75ec96c@oss.qualcomm.com>
Date: Wed, 16 Jul 2025 12:44:26 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: typec: ucsi: ucsi_glink: Increase buffer size to
 support UCSI v2
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc: lumag@kernel.org, neil.armstrong@linaro.org, johan+linaro@kernel.org,
        quic_bjorande@quicinc.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250716005224.312155-1-anjelique.melendez@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250716005224.312155-1-anjelique.melendez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDA5NiBTYWx0ZWRfX/f8xOrVm3AnE
 OR2JzKo376OYwawoMhE5Em539G+JGCqd4GtTPySx9XDyxkE+1/BkBw4wG9dBRDhVjUjHTy+ViCt
 Zf7dgRd5zQ6FYhU0vsrF0TOP9YyPjkWoiRYBPf2IgaXxduNkbY3J3ajGX5JN7G+tLvzZ1w0Xkn3
 QB5WmWcDNhzXllCDT+9PWRiGjn7aL9cc3FpprCoKs8ZnKalqbKOTk9ki9+AQAtTV0m6OTe7HnhP
 8ayd6X2ZHfI+oBuWmJj2lVSVpbRAZ/mnyEvTxzRDmI/dzFg09HRbHlWqMBC+a1dUtGKvYYhYJ2F
 617N9h7aymAa3Y0aE84Jf15Nhjxdeg80VmWLxH8uLszhqD8lK8KLa9aHzpHyR4Xc0V3rcHCZP0r
 XTrWU8EWVeUGxC4d0OcZpNFn1JwVHPjqO3VmJ4N1Op9vistrbCEAqzZ9eRn7UZOWwFcfRkKw
X-Proofpoint-ORIG-GUID: MT4rxBJITHchKPcnnn_ScY_ZkG_pGxKI
X-Proofpoint-GUID: MT4rxBJITHchKPcnnn_ScY_ZkG_pGxKI
X-Authority-Analysis: v=2.4 cv=f59IBPyM c=1 sm=1 tr=0 ts=6877828e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=TdU0opj9kUmyj219TpoA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=322 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507160096

On 7/16/25 2:52 AM, Anjelique Melendez wrote:
> UCSI v2 specification has increased the MSG_IN and MSG_OUT size from
> 16 bytes to 256 bytes each for the message exchange between OPM and PPM
> This makes the total buffer size increase from 48 bytes to 528 bytes.
> Update the buffer size to support this increase.
> 
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> ---
> Changes since v1:
>  - Defined buf size in terms of other UCSI defines
>  - Removed UCSI_BUF_SIZE and used the explicit v1 or v2 buffer size macros
>  - Removed Qualcomm copyright
>  - link: https://lore.kernel.org/all/20250624222922.2010820-1-anjelique.melendez@oss.qualcomm.com/
> ---

[...]

> +	if (!ucsi->ucsi->version || ucsi->ucsi->version >= UCSI_VERSION_2_1) {

You mention V2 everywhere, but then check for V2_1 here - is that
intended?

Konrad

