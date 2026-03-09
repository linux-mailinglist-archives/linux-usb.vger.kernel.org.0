Return-Path: <linux-usb+bounces-34371-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMkdCW1Ar2mYSwIAu9opvQ
	(envelope-from <linux-usb+bounces-34371-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 22:49:33 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77546241DE8
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 22:49:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D113130BEF34
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2026 21:48:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6684C25D1E9;
	Mon,  9 Mar 2026 21:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gVGb67FU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AcWh6Jpf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C043034F241
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 21:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773092925; cv=none; b=ez1fhkX4q1Ld2IaMQl+Ghkk+SIPCDYy3SeKQMVTx1+CBZlRR1RshWuNBjBdO+cUgpL7Ubv0PL/JNi5K1+otkZ+YRAH20iaSg4CugbJ7gEV1wMycsBHZJglWY1iacNzC/TF7d2l4OW4Afx4y+9MytqLia2apoZB0q9yMZsYqSyc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773092925; c=relaxed/simple;
	bh=WUbxpw2C7sf0vuQmDFHy4rJAIta0rmYvvu4klnKlet8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GnZaYje2UmCoNWBDBoZoniITf3H0UlgRun6bCkn+sNEDYN+s9l1r/ymteIzyUAdqXcPLjufzBqTSfih7HJE5mnRGhbT7hvHtylHr8kREzsfVZAWdI02fNRM+N6t/ZdZxAayoo0v039cASnY9cKDrO+eBqCl7UpRGdqDLDvzyTdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gVGb67FU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AcWh6Jpf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629JFvZ82872816
	for <linux-usb@vger.kernel.org>; Mon, 9 Mar 2026 21:48:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2RuAxDQcvEoypV3BxinnmTJC
	gen5zAR0iCHU145RLJg=; b=gVGb67FUlUTJAmlYZDkZuepRmTaG5JAU8iU3h5vh
	gCdlL28/d95L7yvAtYPai2nMI0FDDZRpi8tjJXyeZ+AR7IGt58VC9U8UT0g/KY5N
	ZzhLRB25Fxsfj4OK96i5MAvHkPswvklFqWwlfkWvs6N8N5XiU2njLKOc+XhVG1g5
	arJkMyb4HJJVp81esZCD6jf+el4Ev+T/badaw4LQ9SXqCPrxP3iAUTX97/IUy9sk
	GpUsXtpRNiv25hOFYFD/5j1pGHA5HPaFVrfeH3GjP3aX3ivMVgZ9HxSvnpNhfUEl
	+wn43JsFj3oFewBJjKIr79sfdYZhlGgOSUTJchPbf5EGwQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct477gdut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 09 Mar 2026 21:48:42 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-899f6e5b909so538060396d6.1
        for <linux-usb@vger.kernel.org>; Mon, 09 Mar 2026 14:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773092922; x=1773697722; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2RuAxDQcvEoypV3BxinnmTJCgen5zAR0iCHU145RLJg=;
        b=AcWh6Jpf0EjnBKROpkpFPLocIc6ECWvbZf0CJtMM9Sq/Fwrknw+cBZzGylbTdv+w2Q
         HTPR4HV3MQwXhCI1dN2XxRu+diLnwM6/DhJEW1VXoOCjAYB2eRzWNIY6NQoxPtLt3y3a
         Goe+Q7zulmabzpqkxTJcldR7tBppsJTl/jv8W5aZNf/1YyOdv0Tnp/NMPMPHxHGdHgbj
         ExBGUbLFKF4Ofa6AOK+dzWxwJyMeecn7byDWFbMFtQNFtvR58e5aUESiDgMGlTSSdmMu
         gZOzbPCtjEUH3MLrcypmKXIq7X1T4CNOhwLF5Z2xAnbHceUw8rCjEMkU1g7+71XETlfn
         cS+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773092922; x=1773697722;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2RuAxDQcvEoypV3BxinnmTJCgen5zAR0iCHU145RLJg=;
        b=UYp/q/2gUsEIpo1qdmsmOk4dxpAQD8IoRF05XaNKCthVzkKR9uGwpH7eda37INBKw3
         HGH7PG11YnVd6O/XpzFmBymBF3osjBXsEN00ymptZwcgz5E7OShsDrViLZ9hDHLSJNRd
         62clakPmkHyg6BJRmFP/iFUQpZDtvqPn3Rd2XB8jMy6rnYaA05syut2DV6uiF1bzOtll
         Bd2cItyhRyNh1Zf3hPVsVzS+pYbqVYqvTSo4o+51T473vSjFtxJkhG0gEuMs2Pn+mGKW
         Humiz5wXSmiu+V4iqIUVsGc2ppnWgQBAuvh5qS7BJenHHQYr0N4dKxmLkQYNLNCFMrDY
         HoKg==
X-Forwarded-Encrypted: i=1; AJvYcCV7CEK943iG1vlAU/W7Fe1/LA1IWxFip910Yb2SQEXVzkKf4raJx+X02CCefBJAN+3W0W4I6Ixg1Rs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQtKsvdePP5sa/q+vGQeNs0X3u9NLaiZzzgXqFG+IUWyCjKfkJ
	uKll5PTi9Jdv1IBinLWT6vk8yFXLR4ya/Dl7zWJQ6nELGJ6Tu2wugwipblZEka6818+H8KEkVty
	9PiSQX8J+lwZthNfpkSnGjuU6iIe4Y5KJ+3XXvj+X6Q6UR3z9d93QIjkB1sdERM4=
X-Gm-Gg: ATEYQzxHwqxQ5xTnZt2vK/lliZhavRCmXwTL9AXdDTCvvHaPr+EHl2bK9CovFfYj4gD
	SLOWyDXWAKL04dU6t4eQxxzJCwQYujMa/LYFpCHYhli+i8/Yghi5VRJnyQvL+KgXcU4gIVG3aVd
	PitkyN9aLotZ9J32NOO5owa5BNW6Q59kpKIZdKIDofC6bBo5rG81etPLBYepaUBFZ1WLudsMa8w
	l4zhMioAP0ZbXFM05DG0QfXymbb7iFF7iIwaKFczvhhdzWqR1iJycM1GpZEu198dMG1QxfrNR9q
	1IXPyWmyBFpvqQt3IBzyUW4RImx5vGQZpIkoIZOM1+XP9g9tI/hXI1OQy9gZar3lpkR9Yl+bnAS
	VIm9o1xrP60OmzRxJWAYAp0FW9o8cBY0kXWnN70bibBDVbS2Ha/7a0s9Qo9q9K90IRacgT6q1JQ
	1XeYd5tw0badmZr2Rxywdm2xBnVsm7yKTY5tk=
X-Received: by 2002:a05:620a:1925:b0:8cd:9322:7c55 with SMTP id af79cd13be357-8cd9322830bmr210725985a.17.1773092922035;
        Mon, 09 Mar 2026 14:48:42 -0700 (PDT)
X-Received: by 2002:a05:620a:1925:b0:8cd:9322:7c55 with SMTP id af79cd13be357-8cd9322830bmr210723185a.17.1773092921516;
        Mon, 09 Mar 2026 14:48:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d01cf1asm2382397e87.9.2026.03.09.14.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 14:48:39 -0700 (PDT)
Date: Mon, 9 Mar 2026 23:48:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: glymur-crd: Enable USB support
Message-ID: <fzs4fp7arvm6kvy5gj2oxqlntu7u2uwjo4ojy45isnbjpesp2e@3jxlydcyqd6k>
References: <20260309-dts-qcom-glymur-add-usb-support-v4-0-6bdc41f58d18@oss.qualcomm.com>
 <20260309-dts-qcom-glymur-add-usb-support-v4-3-6bdc41f58d18@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-dts-qcom-glymur-add-usb-support-v4-3-6bdc41f58d18@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE5NCBTYWx0ZWRfX200kyXZYMg1u
 uBTPlOrJzKYUZWZf4GHI4MVj8RLijNN2BCHTFecAO/uok36OQ8zaHPwcEnAEzYEh5vzmDHL3Zty
 WzE0AYE8NExQNWtvLKSrtSAjiQw6/6JLuRxQw4GpAfxyVf4PuL26L+mTlQ8USUV/IXCK9jL2/Z2
 80WZMNfSED3lYGkJQvgMtV0TV3SIu5ELK6AyDaLEfuNK3Qt8F0N1p44DfGZsvOAa/+cd9Uc3z3x
 zMn88/6dvHtAQIE1Q3MA2dyiBeJeMLiSYIwodpCZjQt1saPutQwh3rT2BytmE9OW+v/2lS2SrZO
 C4s/f33rbeCfGTbCPgi9jAnpaOZnBPHLOG7bgIuS5geqQkJ5IiHr3JPd+O/jJZ7eTv9MvS61aES
 p10ZPrlvK2VBC8r0vPJDB+fYwKvbArjx87Npm21XIcyF62bW2byy4TGMjz40Ar+urJ2BavpdhNx
 ywD7NzekPIWNccAPtrA==
X-Proofpoint-GUID: wcRahWo4RSdm5J7_pCczoY6nkcgjrbfr
X-Authority-Analysis: v=2.4 cv=KLxXzVFo c=1 sm=1 tr=0 ts=69af403a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=jjo7NJrCQO57_7Q7sOwA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: wcRahWo4RSdm5J7_pCczoY6nkcgjrbfr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090194
X-Rspamd-Queue-Id: 77546241DE8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34371-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 12:56:53PM +0200, Abel Vesa wrote:
> From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> 
> The Qualcomm Glymur Compute Reference Device comes with 2 Type-C ports,
> one USB Type-A, and a fingerprint reader connected over USB. Each of these
> 2 Type-C ports are connected to one of the USB combo PHYs and one of the
> M31 eUSB2 PHYs. The Type-A is connected to the USB Multi-port controller
> via one of the M31 eUSB2 PHYs and one USB3 UNI PHY. The fingerprint reader
> is connected to the USB_2 controller. All M31 eUSB2 PHYs have associated
> eUSB2 to USB 2.0 repeaters, which are either part of SMB2370 PMICs or
> dedicated NXP PTN3222.
> 
> So enable all needed controllers, PHYs and repeaters, while describing
> their supplies. Also describe the PMIC glink graph for Type-C connectors.
> 
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> Co-developed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 214 ++++++++++++++++++++++++++++++++
>  1 file changed, 214 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

