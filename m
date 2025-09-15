Return-Path: <linux-usb+bounces-28101-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBDAB5761D
	for <lists+linux-usb@lfdr.de>; Mon, 15 Sep 2025 12:19:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A67F83A7413
	for <lists+linux-usb@lfdr.de>; Mon, 15 Sep 2025 10:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B0432FB615;
	Mon, 15 Sep 2025 10:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K+s1jNkw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D62628C006
	for <linux-usb@vger.kernel.org>; Mon, 15 Sep 2025 10:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757931565; cv=none; b=CIZ1rm+MwrFlIOp5RziPhu4ygMIDyTBGYV/+lrUZEj7VS4jEGApDgPoIwUF0JbDDp0qGPbeLgXqodGP3ot4nO+ESkj108grc0KCZCYmsEfUiUeCWxWIAXFeDkAHjh22QNowOt7Xf6TzhgtipX+wCFsG95xRzFZIGb79T8iZm+6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757931565; c=relaxed/simple;
	bh=GAvNiOwNLiOuGEpGEUrLWK+3lyHdXQJWYPvsInpu3LM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ds8evZnBbh9SHaZt0n8A5lMgW7fJ4eC6Dl6jnBq0HILTTj8Wfaaja50GDYlPXj0UywAU2hhXXznVpQKWTLkCb2XNyOohxjgVz379yutF5Gb1q03/6MxoH+nafHCoVjnAlAJlEkIS3s+TFqVqfkM7hGr6mDHYBn5Q1mSM321eYu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K+s1jNkw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F9QIfv021850
	for <linux-usb@vger.kernel.org>; Mon, 15 Sep 2025 10:19:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ge/q8lJD6Zf1XgGE/wTrOzdR
	wImk+MA4Q8tIDE6bFjc=; b=K+s1jNkwlUVxTPUGExGvCnuguYqROv5q6NYchZ5A
	zFWQdyrpLqSJn9SA/OVxSPSBXVXo3YMQJDI5sGDZULn6rxPZlMAgqW1achPvd7ac
	VSmeXyNK4V7NjemehnIFmyBlqmfLmgkP5fyVsokav7s3jKXo6DrRmw5rtCgQE/cy
	9xTKJ+1oaIz7rOV0KNUIOc4jrvKyR7pGRbf1tvAKxqknRx2zDHPkaO2AG8oDJlQv
	z5WAykYlZ6XxLWJ4oSSf6tQN3CWD6KSuJUXBxGhMwcPY1jpE/NBIWcX2WFBVH8C0
	Rl1jvkLS/BRRDcGyiS2vf9r7oFzOHqb6GpB7Tdg/JflUmg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496g5n05p7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 15 Sep 2025 10:19:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b7ad72bc9fso4262731cf.0
        for <linux-usb@vger.kernel.org>; Mon, 15 Sep 2025 03:19:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757931562; x=1758536362;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ge/q8lJD6Zf1XgGE/wTrOzdRwImk+MA4Q8tIDE6bFjc=;
        b=QaDkwnxzFdbL3ENItFg6bDNv+O9eLcwLIOJV3gfKii6Hq8RZI4OBKDhbejGTLFekPJ
         /fp3+TkI/PushTXh0b5Kg9IA0kMEaSwL3dFrMof83wgrFfCGzUSUX4gFXgfUgVB5g8ml
         WyKES+6ARS/AIuHMMmGdv+xcIz+wiu+6m+xS+4WiqNGToPTxYxmsoBFO8Ka0L0ltralo
         w/VQSzA85IKvhz+eMD7jovWcZE3M+WinhdhQoV96pfbKQLk7PtwMpy3l1KubRO0gPgPe
         B2JFL1hhnUvYiRVSJeLHqN8YaAunc0cgK5P1SDiBYR1ktvjNeObz3T+1qhmpr4R+e7bY
         ILdg==
X-Forwarded-Encrypted: i=1; AJvYcCW+G35HIKD7esval67m5I1C2S7qc92DqE1XoPqEbx+ttQjm1PYS3zu4rSoelmnNlsqVZhLdN8g8tdA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhsP8Gr9QcoBYZMHepTtU5NHklS/FW+idVyXcwrddO+VDHB9sn
	MqgLeBX9Z8IMfi548gI28LhzvjuXJVmXhhc8ZaVIrTF+PKk0Fm/IMXAUeHmDR8FzoxvkJ997pDC
	Gy2oWK+O3wlTp4w2+1hjRGXjYl8cmr+5RvzHnBOecvyUTzKQngwyEhad4+4jxfwk=
X-Gm-Gg: ASbGncvsL50+ucOr5KYFVaa25i8ZEWiXf1hnL/rDyj93WXAB9OLa9x9eZ1yO1+gG+h+
	HjP77Ind21fmJuEeZxkN0128qFWm/AFFt+txGkUA6gFaE21qQzcHMrgm780r45G2fj952w4Frtb
	mtKHvKPha3LVTxwg6lPLPmjIg/+3pLU0FnFkXmHuG1KrHqY2hWYkhhr3TicPQ4fleHAHB4w9GqH
	GmHrmBNOdxwmzKzL7MArES506b7n1E6WgQs41RzABam6YiyGLpMWJRT4vgJ/0Vs/KSi57NeXbQd
	xrLbEP3P94w/egvNC45AlvHqN+1aaJ045KWm/NS+05kl5Ifnltvfnm64Ln3rZ/0DAJFTMduI4FQ
	8eChk7iU0k+hdAMsugsvmc2W0qy2nvfc1qjyCrSlqbfG8Gky3MPhx
X-Received: by 2002:a05:6214:f0f:b0:780:24d7:fd35 with SMTP id 6a1803df08f44-78024d80119mr41691746d6.43.1757931561995;
        Mon, 15 Sep 2025 03:19:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1FfXw0j6mkQjJ9r007AeakGY/pEvt0j/darfeawFeiMBnS9aGTLYNeE5U7vTUK75m0TpsgA==
X-Received: by 2002:a05:6214:f0f:b0:780:24d7:fd35 with SMTP id 6a1803df08f44-78024d80119mr41691366d6.43.1757931561502;
        Mon, 15 Sep 2025 03:19:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e6460f21asm3476750e87.106.2025.09.15.03.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 03:19:20 -0700 (PDT)
Date: Mon, 15 Sep 2025 13:19:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: fenglin.wu@oss.qualcomm.com
Cc: Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        =?utf-8?Q?Gy=C3=B6rgy?= Kurucz <me@kuruczgy.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 5/8] power: supply: qcom_battmgr: update compats for
 SM8550 and X1E80100
Message-ID: <f3s2srlmvuj7wmh4rndffmbfrzylbuq4rsu7pqqrnqa5fgsmch@t5f4dgmqtgys>
References: <20250915-qcom_battmgr_update-v4-0-6f6464a41afe@oss.qualcomm.com>
 <20250915-qcom_battmgr_update-v4-5-6f6464a41afe@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915-qcom_battmgr_update-v4-5-6f6464a41afe@oss.qualcomm.com>
X-Proofpoint-GUID: bV5WR3358fVjCqJsa_62190DDGYla1t9
X-Proofpoint-ORIG-GUID: bV5WR3358fVjCqJsa_62190DDGYla1t9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA4NyBTYWx0ZWRfX0b/51A1o1YGH
 q56oeuw6olz8kzK8Awu4DautNdRSyANSpUmO8AJZi7hDpj+/Yajiq4Zs1wNA2VBD3rC4x4duSTM
 fQH0RMFfp+Bj9Gp8SUUEZ/fTKhzqeeQsOOQeD5HXNc3eAnRzvaHQoiDFbSjsG04EJnLb8B3M8LK
 cFYqGTcEUx5C2GgxhPwB8jw0ORtyLwtDkBkcmTHoAdvqoTbWHBSgk5OlmBmtAFvz6GXGMoMtaZ+
 /JXISO1EPJESX6IoXTXYsmHh8R+qvMXpVckeHSm8YPBj/a4/JMP1/64/MJdba6D/XMOYysA1B93
 q4hfcwfzHV5fdHSzhVeNhK2+QLYoDnlyVK2NcwE0+ZK0TKdiZUvhAWG8hSzhwDBRx+IinwzP+Nq
 bzbNiV55
X-Authority-Analysis: v=2.4 cv=SaD3duRu c=1 sm=1 tr=0 ts=68c7e82b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=q0q343tyEA3zizLlqU8A:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_04,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150087

On Mon, Sep 15, 2025 at 04:49:57PM +0800, Fenglin Wu via B4 Relay wrote:
> From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> 
> Add variant definitions for SM8550 and X1E80100 platforms. Add a compat
> for SM8550 and update match data for X1E80100 specifically so that they
> could be handled differently in supporting charge control functionality.

Why?

> 
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on Thinkpad T14S OLED
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
>  drivers/power/supply/qcom_battmgr.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qcom_battmgr.c
> index 008e241e3eac3574a78459a2256e006e48c9f508..174d3f83ac2b070bb90c21a498686e91cc629ebe 100644
> --- a/drivers/power/supply/qcom_battmgr.c
> +++ b/drivers/power/supply/qcom_battmgr.c
> @@ -19,8 +19,10 @@
>  #define BATTMGR_STRING_LEN	128
>  
>  enum qcom_battmgr_variant {
> -	QCOM_BATTMGR_SM8350,
>  	QCOM_BATTMGR_SC8280XP,
> +	QCOM_BATTMGR_SM8350,
> +	QCOM_BATTMGR_SM8550,
> +	QCOM_BATTMGR_X1E80100,
>  };
>  
>  #define BATTMGR_BAT_STATUS		0x1
> @@ -1333,7 +1335,8 @@ static void qcom_battmgr_pdr_notify(void *priv, int state)
>  static const struct of_device_id qcom_battmgr_of_variants[] = {
>  	{ .compatible = "qcom,sc8180x-pmic-glink", .data = (void *)QCOM_BATTMGR_SC8280XP },
>  	{ .compatible = "qcom,sc8280xp-pmic-glink", .data = (void *)QCOM_BATTMGR_SC8280XP },
> -	{ .compatible = "qcom,x1e80100-pmic-glink", .data = (void *)QCOM_BATTMGR_SC8280XP },
> +	{ .compatible = "qcom,sm8550-pmic-glink", .data = (void *)QCOM_BATTMGR_SM8550 },
> +	{ .compatible = "qcom,x1e80100-pmic-glink", .data = (void *)QCOM_BATTMGR_X1E80100 },
>  	/* Unmatched devices falls back to QCOM_BATTMGR_SM8350 */
>  	{}
>  };
> 
> -- 
> 2.34.1
> 
> 

-- 
With best wishes
Dmitry

