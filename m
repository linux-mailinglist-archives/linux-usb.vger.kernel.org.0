Return-Path: <linux-usb+bounces-32356-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BD513D21763
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 22:53:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 267C7301FD61
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 21:53:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDD3E3A8FEA;
	Wed, 14 Jan 2026 21:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cdg50+QP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GVVcLm8A"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529A138F954
	for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 21:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768427581; cv=none; b=BEEy/punxm/S/NOpaTkU1vrmJRbSLQPXRaQ8cPHvVzYoBBsISiohWaGH4LhM8VpRayGknXN1rT1Fg+QiyvhOudb8LcD8dHI89L78C0FjQQa8JJeLK3pB1vDijK6UQ0GxEyuDzq7huhCANY89Tw0sXaY2HfcLqTynFEqXuo/Oit8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768427581; c=relaxed/simple;
	bh=UUEf5rAfbiLQj64m+WE8UuO45dPfSZfsIrkA+XZUuUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rbPzCLWfNjKTTMDfGoaGSz+iILmivk9n3v8NZuoR2jTABz0H1k93g4TwGQ/YXg4Kd+br7lBbZmJDAx9svGD2F+tA0/87d4jI/P5hGfOk5FEoVcol7OYxt5y/T5JwajNsuPiJvSQns5tEE5L1C5PjHABBUCJNkEpx4QGWPmYqmO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cdg50+QP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GVVcLm8A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EGmC5q3296453
	for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 21:52:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mXXKzKH61dvsjX23qk92268u
	au0Rcf+1wCgw2oxpBt0=; b=cdg50+QPM2UrSJnw4EKTFZ3MBOQQXKj7y+xxhw4G
	4JwflThEcejK5TV+Tkd9/DpEqvG0tEwn7ztNiJYCVOtIgSwiuSse8aIjt4kkdFju
	bDdRaHfJHAoKIGCH6OAqhOM8q/rNOq/+6UY/qG1TpLQsJhMdyhyMwz63MaYfrszM
	kRvRs1/nPqPg0oydTKIxWwa8NsF9XjijNO4aWmdOeWAiBt7ZXau1+g85LEKS/poN
	jbO8y3k/pBras+4T3vfR5irCW+ZM+R0tTHBS2Aca9Qbec+ULNcbMV2H31oen0q/x
	66XHGmLbmgbgGBM2/IMBsYcQ3+sVIKJxOM8Z8+Z679mtYQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp8t2tcx6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 21:52:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c52fd47227so57240985a.2
        for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 13:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768427573; x=1769032373; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mXXKzKH61dvsjX23qk92268uau0Rcf+1wCgw2oxpBt0=;
        b=GVVcLm8Aa6HW/dXriYyJ8TwpO+lmDTpAwYHhyswmfbXm2tkVESAtNOlu1+xDdbMbC9
         Q+yowDpYjpE8Yib2+VOkeICrcdZq5oNkr41I5uDyGp4r+ZmY2JsqaTjzunT7vHyHlU2i
         ATcrdbMw489s7UCJo9fL6iVZnd49LmkfX6ZWyVrWsAkfpzJt5JmyGb/vYPTO7ievi1IZ
         aROXh1sH3cz0LDQmfWCDjZmY+dt+ixsGbOMfuL9UWQRzRhAFHh8UsRAXF7/t0pql0m5U
         c7BQuUuJjPKtYkRPf2+R4gKv5OLH+3qCuPcfg5tzML1eWxaJpHpAnYxVrldUAKvAus8E
         SuyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768427573; x=1769032373;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mXXKzKH61dvsjX23qk92268uau0Rcf+1wCgw2oxpBt0=;
        b=ZtJ2zUcIH2VC3FMfZQ5Sha4te4t8RlV4Pkv1AEMy+GZT2M5ztc/lwWUe/fcvQmi+ds
         lslwEZvUL/rCzTJq+90F49r93X8VwIyjFoPKKxld5A3dADy6uDmDoCvCGdZ0n0sZsQRu
         zZfpRuf22vFCLPe8T9P4cSVrjP7YphXOiLTxplpw8EgCbhdVMQJY4Gl4B+b7y9Q/WpMx
         GROXWoEiA3NrBN3U1meDZkzilFpsn5xl0i3TU+IaG7N0Pc9Iws/h7Lru7MF0t2jeB1OF
         +WrAM8KOVMJCsAkNJ4Bpl3twoua6mB2eA/Lz0jHTzTz0A4Oje9pI2i2yO6cQc7b7xrgk
         mWSw==
X-Forwarded-Encrypted: i=1; AJvYcCUzIbI5fYLgJwue94mvNVKl0wlvqiRRiq15DPOM6pFQyfhyMxb4n0MzcdG6njy0pBlu1xYj6TN4Zm0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLStaXXp6agD5UtcNHmMZO8MhpPe/SeIPPA/IoarZ0PwtkC0iL
	LJfeqdeExiCSuMrY3FRJJY9EJ8vs/q8iIwOGl7kUUoonzHgunXpCIWmT7lZJKDeeTuGKCfasMaC
	V1vGT3ce9kuI3rfAPs5dtxxfl84UPpHEBsJq94AwpMjHPBNzLpQCwVrPEiYJGGFA=
X-Gm-Gg: AY/fxX6ctvui8vRGqsD+oIy9lVC59pKpqYlZnEBu+nlF9ojnIWDlvi8dM/SayIWuNY2
	Lb54QJuqap2zW0fEg6Do0O8P6pgY1HpUN/gsDv+gGSrcTmsblneIlt7hQHhN/ae/1DP//Blb7cs
	srQ8UPbMROebxL4AAAkMlarlbH7SQQRQl+rnuyQrRwYhFxmZ1IXvAKMi5gYE04VOe+S/rnBlZ+E
	QPhtwL/rwnQCex73z0my+g5lKXGvZWHHe43x4ozON7vNYZwypjugUQNGHvn9G6eNWOFpVvJ3c3d
	ckCz95tPDeILSDU2ggM94KoHFGcxOG7PGTSlC8ISAAfT4c6aN6SBQFoTKAcLQYTxRDTBaGQGv+m
	cyPU9plnPhRZO6EanBqS0BkcZL4myVhFFOC2swjkCIelc5vc5bQuj2v3sTleUvYh+A+a9eZzhiN
	orsGjvNsEQBSMckxzvWBgDs7Y=
X-Received: by 2002:a05:620a:19a2:b0:8b2:ec5c:20cf with SMTP id af79cd13be357-8c52fb05526mr581401885a.9.1768427573011;
        Wed, 14 Jan 2026 13:52:53 -0800 (PST)
X-Received: by 2002:a05:620a:19a2:b0:8b2:ec5c:20cf with SMTP id af79cd13be357-8c52fb05526mr581398185a.9.1768427572535;
        Wed, 14 Jan 2026 13:52:52 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59ba102088bsm1061646e87.31.2026.01.14.13.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 13:52:50 -0800 (PST)
Date: Wed, 14 Jan 2026 23:52:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        abel.vesa@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v4 4/4] soc: qcom: pmic_glink: Add charger PDR service
 path and service name to client data
Message-ID: <4xmpzkerelzmetkobjw6y6okazwyipocrg74scfeoh4l3nd5qd@huhap5cwwlby>
References: <20260114211759.2740309-1-anjelique.melendez@oss.qualcomm.com>
 <20260114211759.2740309-5-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114211759.2740309-5-anjelique.melendez@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=YPaSCBGx c=1 sm=1 tr=0 ts=69681035 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ES-LWyGZB6HvuNGBYh8A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDE3OSBTYWx0ZWRfX4pEBN4rkUZvD
 vrVh+rubtd3P7qWD/h5Sg7S84ZhJvNBhk97b4QOdgVUlK3KJNKS8ln+8yzVmz2Aac9GUfynj3Pi
 hRbks0whm0g7+Zudqo6fGposkJmO0azxiMqzYfIlw7YrYi/JFzRSBLdR1ar0gX8fcZq3p7PF7Kr
 zG6915V1NmSH/tW/JDc+MxkBKNLzEjpqgXDJz8GIoT0XvM/87n3l1l5w8y1YgsNRLqPtsBkdc6T
 5w+a9KEQkDKX5nAWuCsJt/X8EM+vbWA23F8dSauoM9i9iNlT4F3pE/V0qiuqc6wXCphIfpcHbeC
 Lvco2nhHD5lpY5UfeKhA5MipRfTY7nFTocDH2ddgbqIRmSjryn8r2gV5ns9r/1Ry1hEUA/qymzn
 mr+IBoHnG5pbAXumbAyR4DTSzoGfop1Ee2gRoG0sPYA4i0fmKlugPt3CKr6bSSj+IxciZAPjLqI
 UIpNm8xJq5Gabm1U5Rw==
X-Proofpoint-GUID: uuLSLBw1EbVF6kLJjtvf6ITZ9R7s56WJ
X-Proofpoint-ORIG-GUID: uuLSLBw1EbVF6kLJjtvf6ITZ9R7s56WJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_06,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140179

On Wed, Jan 14, 2026 at 01:17:59PM -0800, Anjelique Melendez wrote:
> Currently, the charger PD service path and service name are hard coded
> however these paths are not guaranteed to be the same between SOCs. For
> example, on Kaanapali and Glymur, Charger FW runs on SOCCP(another subsystem)
> which does not have any specific charger PDs defined.
> 
> Define charger PDR service path and service name as client data so that
> each PMIC generation can properly define these paths.
> 
> While at it, add qcom,kaanapali-pmic-glink and qcom,glymur-pmic-glink
> compatible strings.
> 
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/pmic_glink.c | 66 ++++++++++++++++++++++-------------
>  1 file changed, 42 insertions(+), 24 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

