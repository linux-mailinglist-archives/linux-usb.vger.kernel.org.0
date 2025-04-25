Return-Path: <linux-usb+bounces-23438-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEC6A9C31C
	for <lists+linux-usb@lfdr.de>; Fri, 25 Apr 2025 11:18:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E5FA7ACF4A
	for <lists+linux-usb@lfdr.de>; Fri, 25 Apr 2025 09:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66D0A235345;
	Fri, 25 Apr 2025 09:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="muQgx57P"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9F61B6D11
	for <linux-usb@vger.kernel.org>; Fri, 25 Apr 2025 09:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745572668; cv=none; b=SM0Ks924eKlbZ+ytq6nvhg0IsTWrtHPjSLkPUxGef2ZVnOCx11Nt+8bb0H7GMLT7oEGCmmnTWCtesqgeLnBQ/EpTaieEBf+FZPeHIbNqXsvHvHwMgLRpcDjsIOtrlM/pguVenx/j3R1ChvDWJWiVNI/H/+SUd7TFqqYtiD8wa0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745572668; c=relaxed/simple;
	bh=Cgy/ew99CTAyh8TT8GWMGcHdWQLx7SIMZeGyXxuUhzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g+9Baok5phpIm1FtrevmhwausRENuppWcoujKuQYJ9ucDHeyM7w1OIvtGDdfZ3igJArY9KC2DaKEu4p/8Le+5nHSolt9Jq+OWB0cZoobr1xRZehT84O4VwDXfdf7Rq9DnAneVTrDlRuqVD36dULajRpT2Vp8nibryLQCiAB9hjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=muQgx57P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8T6UU015996
	for <linux-usb@vger.kernel.org>; Fri, 25 Apr 2025 09:17:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WXe0NlKxDZrPju6112EiKpqV
	yTfdsUulvcoDoYo4cFQ=; b=muQgx57P4ZWorYmED8WgvUdhFZUiUPW3sy+uF3p3
	OGxNlsoyze28sRkhibP53thoMwaQZQaQCERfHqLKYWPdBxy5/M7lXAHBmvChA3II
	mZMQuFQhIBWMsSDWRhs7lwAPUfy/9rwZtp7ImX1bLt+JQsZ9etmMoVsDHPuaJCdu
	7vczfLWkRXhRPc303ABefG7k0w8mj7TMxDhumG+JmQDkOtbZpHVZIVYczdNfe8J9
	xN6+cOkvpKOfHBv3v+Noo1QC8mKihj7XCpMu/rpEzERng9IqyBJFyqmEBHnPApYs
	PZ8ZvpRuFKZDjGFeQvwpKt7HeAhRPWvdSCC9IKTEmWXMng==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh08fh7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 25 Apr 2025 09:17:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c3c8f8ab79so297681785a.2
        for <linux-usb@vger.kernel.org>; Fri, 25 Apr 2025 02:17:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745572664; x=1746177464;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WXe0NlKxDZrPju6112EiKpqVyTfdsUulvcoDoYo4cFQ=;
        b=WOYnR7kK2753oISuJtLdzCqvDRYQBhv9OtO8rqnqmrhgz8QBrQJ0WDFyAkAB3iwcG4
         1n5vaSlyqLQmXLTp2EWpbNm51clkFYWibs3F2t3Kjpeuog2AbCqGHhWvTnKpk34NKYxm
         MOHs1T1ugugbJ/Fu3PMfnTZnAlICwPmvdPvcM596I+XsJxMke8crdnIJc9p/HEp4CZY3
         OCIdRuDze1c+yU4MhPI4VL6SDjJlvPjSrRTPBL5t15JckqLuHADutQOHjJ2y+SSR+V50
         brBzM2qNQNu+mKjF1BG1XHeVDY53/3FH92+vXk2tW7cjDZgFtOkeATewao97txdnwZPK
         FXlw==
X-Forwarded-Encrypted: i=1; AJvYcCUUubztFqZhLETqaEFHw8JRisfKfIXFdlpFLiOI9cDGaeCPXDIAs5PmX2dXte1ay+hXHDmoi0Md4ew=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtRKlmAIbAvlBD8u1h9t3ZELCfxcZ4cI2OPSK/mrmVF3GOiyvx
	lSIlijNc3BFgcsIBQ0vAN9aTt9Vsz/k4Wr3GMVluNTEKq1eNJRwPUDmDez/wqzKxR9paZeR642q
	aLWkxeBgoriCwnN7TbCtWTZgERuKcusxLC6uqNLYj5kPJyXf+InB7wSDqpuw=
X-Gm-Gg: ASbGncuhPpAgxSjUtRa8QjywwCo6gcYbezvdC8K/zdzPMkG9WjWgUkFta6NIZBWiotM
	5YZZT7JPg5PqMfjkZzW1A9hpGX9oDMyYmTgsXxy23NUHPhRRLzGRzQsiZ11NPrnNfSDf3NS+gDf
	WJ4N34fSw0sNthOWvA+VN7aj9aeJ2RK1GGz7FWYNWie3No2zfMNhwPjB4k3msKQQ97GbRzdT1pH
	7JImGC7FeZJnXQInRYcSHKwXw2GtxNctheFuiP9Zk5UCXu8KcWbtkVGQs/sjQ6zJQ8EZNxSeeNq
	fI7LTGCdV1g0HklAcJnop2ClSt+DXF7XefYh+f1d5MhBrUuKyMLfsZjBq1S7Q6a5AuCNI6+9e4o
	=
X-Received: by 2002:a05:620a:1b99:b0:7c5:4b91:6a41 with SMTP id af79cd13be357-7c9607880c8mr280226885a.42.1745572664418;
        Fri, 25 Apr 2025 02:17:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZA3Q0DX1qcrcU6Q5IKBtyc3e5N50tRXbXJz2+iHVhL5w7s0njAeQLwBISLkAKAlk5TRfUGA==
X-Received: by 2002:a05:620a:1b99:b0:7c5:4b91:6a41 with SMTP id af79cd13be357-7c9607880c8mr280223985a.42.1745572664115;
        Fri, 25 Apr 2025 02:17:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d1b96d45sm6437751fa.94.2025.04.25.02.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:17:43 -0700 (PDT)
Date: Fri, 25 Apr 2025 12:17:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: qcm6490-fairphone-fp5: Hook up
 DisplayPort over USB-C
Message-ID: <dfjrssqxny7wwcrhybbgx7fqvibvwxvkuba4sj7ufkadpfoqme@nwvcjyjrn4ze>
References: <20250425-fp5-pmic-glink-dp-v3-0-cc9c2aeb42fb@fairphone.com>
 <20250425-fp5-pmic-glink-dp-v3-4-cc9c2aeb42fb@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-fp5-pmic-glink-dp-v3-4-cc9c2aeb42fb@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA2NiBTYWx0ZWRfX+a8mypzu2EGW wqPkxqWEWhYWXnzZy5H8ufO2DZNh5JhyIIn9EeAuRcTbBT/ccPGkQkuqkxJrduqRTCa1jVo9DpE 1MDBo7nLlM4fGKngyacqTdh8O/D8I9RXv2lc4qwgKrY2QngISZStXjzobe5ygM6Epb1zs5GDoRn
 9egqBMg4lvq7rJ5tRBO7jBKSHB6l4mewvjoWTwmOqXXU2BQ46MAKejaLqeVe16IXsxTNS29X4Bn T8+4tjbK6XjmPFzBRM9QFDCRToEYwaBq10bIaUTT9u7RqLMkJMJsIBb6igIox6UD5jc2BXCHvTF ohhXHZH/QDISjT4TirU2QCe8KUW3R2KoI6Z1/Xz3Vc+dJMD8caGWF0fgv8IIePIJD897qaR/uiC
 8/dvrweExBnVq4F5qxnVq4fajFPxr55ip3NLhMlrIfDtr6GxNPwrOQEWbD9iP07+f9au0vwf
X-Proofpoint-GUID: u4gaEUraTEWS5sg9j2W91NC88HWOGeEz
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=680b5339 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=Df21-P5Y2jz7HsL4rSgA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: u4gaEUraTEWS5sg9j2W91NC88HWOGeEz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=432 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250066

On Fri, Apr 25, 2025 at 09:08:15AM +0200, Luca Weiss wrote:
> Extend the USB graph to connect the OCP96011 switch, the PTN36502
> redriver, the USB controllers and the MDSS, so that DisplayPort over
> USB-C is working.
> 
> Connect some parts of the graph directly in the SoC dtsi since those
> parts are wired up like this in the SoC directly.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 54 ++++++++++++++++++++--
>  arch/arm64/boot/dts/qcom/sc7280.dtsi               |  9 +++-
>  2 files changed, 57 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

