Return-Path: <linux-usb+bounces-25846-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEE1B06536
	for <lists+linux-usb@lfdr.de>; Tue, 15 Jul 2025 19:35:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 31F2016810D
	for <lists+linux-usb@lfdr.de>; Tue, 15 Jul 2025 17:35:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5196228689C;
	Tue, 15 Jul 2025 17:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HtSSWESm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25EBF26B76D
	for <linux-usb@vger.kernel.org>; Tue, 15 Jul 2025 17:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752600907; cv=none; b=sGLKp93yMpOGRYAqdn0MFCFIU7ssorXP/NIF4XEE5r0A6Vh6JDDyPD6AblF0k5TyW+Urhdrn2LnIRQVbqxPU29ukemjqYqELvvjeCcwCPt5Ag3fHf1vjrfQfUV0uQsKLJ2yPyqm5LaUwMDFBVix/Tk4mtnEiCGj5fcSEXncE7bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752600907; c=relaxed/simple;
	bh=2J8c2z5EXWGctgukrb93oHp2+Zfj54zLjUjpoTWXKbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BHcmHFitCDBGwnr8JCohkW4wC0FypnO6WV61h1308dKv+L6Z6dWtuIrb6853ntPeHfHVliXahGXjGhIeIg+iz13xS1EHcjOYq4iCdZC4FuxjV//BFQeLeyepRtqH5Em+fVcXeQtsnM8PyuP15UULV6qF2JLKD/UWVCRX4f27A4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HtSSWESm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FGDHla025919
	for <linux-usb@vger.kernel.org>; Tue, 15 Jul 2025 17:35:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YwHMduJFVZ0XMQsQOdCu9rTr
	BXiDOqf57dZo0ADVf/k=; b=HtSSWESmR1v8aUvbmxFz2n7lv4gFQQKPmoVqHA/B
	INn32DeLsRf5fkKXgD8Ae2eet3yealk6LUaWq0zXbhU68ttL3LRbOUs2zi9WrE9/
	BE6OcAqfBGfnVef7n4cOSUHHj8x2RwS9kz5mM6ktfYrTIHh/QVm1Mz/N5DqHsmRS
	sW5YkTnZxb8Yb1s5jWyY3BVwMJyOGf6hol4Iip/9FYjYcHI0ha8mdGWinyNdxX8T
	Z9TgsfLgWSmJepkif1i/zHKYX4mJBXsmwO3vXAdTXdS/2RMAfgCUwIULweluiAQC
	INvCL10uUOkWDMrPXwAe72ATx4/BA56yOJVCCORFzx3V7A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wfca2d6k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 15 Jul 2025 17:35:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e237c2f4ddso423414885a.0
        for <linux-usb@vger.kernel.org>; Tue, 15 Jul 2025 10:35:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752600903; x=1753205703;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YwHMduJFVZ0XMQsQOdCu9rTrBXiDOqf57dZo0ADVf/k=;
        b=H1yohrTPjfqDrPbdDdw3nIcYgDN7jBRIQEpaXqXynJx9e8CLMMykiNhNzNMq5o4BUg
         Q2FdJF4+ouzzN/OGF7eGaNekhpkZeCYryTflYAxMOiXCBo4CqwrKy5E3FEbsVHsfuCs8
         Bh4Gpvtr2GSDLYAanT3/vQ/aPYUSKK9A2RtGaje08KmUgxsLwr2bIBpWznlXZpnp86O4
         ObG/tahwBlahwTtroTmtv2GJExWpM/w8DATP7+48iRSqJoPznjB4R9nHYpJJWbHX8AfS
         tgba8ID5rFlJDTHT8e4jtwHW0/xBysXIwwJ0jcivZy7Mv45khuPeuNq3IZrk7OJSUUzu
         5gbw==
X-Forwarded-Encrypted: i=1; AJvYcCUuZrUwo03uJN45Z5CQr4bMOkpf5ZogKCMW6jlCg7JQg9WtsNCbcZj3/aEcxOzoDOCQ57mpRMFdMow=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfUmld1D1nzjER3o0JwEnL/2Jy2veNj0veG6mNx2xliETzQDBO
	AcUGgELLxJYbpvyITYDlxH8YsMpA2hstJkK+hKHG9Zv0VvtSggL5D4yqIs6td1LCbMHHQMdbPcu
	RzRAeKcZuBCI2GiystmSE6wSvNhjQyaiCou0J8n2bh/z2MKMji9f1Iy7VMNuo+hE=
X-Gm-Gg: ASbGncvujDFeJ8YYmqoXlHet+sdgViVh7QszYSHD07ZPgaw43lFI79WWBue8LVzxEv5
	hBfzymVKeobeMpSmtR0Clwr10V2aQNGF1+lmC4J2uruBMiqSR0ajcWw+qgqZVWOiu1KA2viTbov
	X7CSSo02UsMAxnkOrDUQR115CXpYswacQ8KN/TZ0MNvfJqkL9bAMi+gPokQITKnvr8K1IcAj5/d
	cVm39JHFu9yIe17IAcwbHxW8k674qC3tPSR/TLCivuSJtQDtzf3buksNlfmzMGB2I8CJ61V3JVh
	5iCEt1PPytbe/L0x9AiE1j8NsXfgyNTAmjXznERDfbUTmdO93ZWCMoTtobuFgeb0OJsulczRQaT
	ZYbnm4YdNNldyq5Xqg/fngIubrL/DF+ho9RXdUv1f/LXoyMXb3GZD
X-Received: by 2002:a05:620a:4513:b0:7e3:33af:c45a with SMTP id af79cd13be357-7e333afc5a9mr1078301285a.49.1752600902901;
        Tue, 15 Jul 2025 10:35:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgkC/RAmmlrlOop2nd4cM+Qb/s+gLrKuUEGXd0Hyq1/Zw3CSYcbKVNpSB1ZGZ2gTFs/qFsWQ==
X-Received: by 2002:a05:620a:4513:b0:7e3:33af:c45a with SMTP id af79cd13be357-7e333afc5a9mr1078294185a.49.1752600902369;
        Tue, 15 Jul 2025 10:35:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32fab8ed429sm19601101fa.85.2025.07.15.10.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 10:35:00 -0700 (PDT)
Date: Tue, 15 Jul 2025 20:34:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org
Subject: Re: [PATCH v3 4/4] phy: qcom: phy-qcom-snps-eusb2: Update init
 sequence per HPG 1.0.2
Message-ID: <n3khphjtqwcfhzxbdici255in2cbceujp3jlrtkrqsd77jtftm@ggpa6eek2xna>
References: <20250715-sm7635-eusb-phy-v3-0-6c3224085eb6@fairphone.com>
 <20250715-sm7635-eusb-phy-v3-4-6c3224085eb6@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715-sm7635-eusb-phy-v3-4-6c3224085eb6@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDE2MCBTYWx0ZWRfX/d4r0QBbLIjJ
 wP32bp4A98858+eJ6JR2qDqasZdPc14b8DO8+R2iRMDj7ikJwK7XXDIdwiBjPscbe1Qkf6D5su9
 VwtH0JFwTxwhYvt12YEReeo+OYXXswbS1JZWkPY51oKlicAtOYqCTl7uEJG/tGPZ1RzH1qUI+N6
 z+EwgzhmJdleyp5d3WiVcQRVbIUD7KxorwhMpElGQVMoxeIXR3/ofb7HXco3UpAnGuVWd/ciViS
 lf8mqvgpkuIywQwbnzZMFnhGQhlvbe+khqMJK39yOpXSoczTl3tqAOiBUNlVNf8wjfOoPp1xpC0
 E6vR986D8Kq3qFwkTnlh0M6y1qIn2AOaH33iOK5sPSGfsomDgllVvKThV7pL7pvRGWGtN4ITry0
 1l32qk2yfz9as/vJwR+sXnmv6eNmVYfzyJdBRsb3rJhxgALwGbkpON1wWIMOo4EuL8qMCiiy
X-Proofpoint-GUID: 3B3TLsijAUtTzf6XDDDU60zTr5wNFeGH
X-Authority-Analysis: v=2.4 cv=SeX3duRu c=1 sm=1 tr=0 ts=68769147 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8
 a=xixfk-lNQEsWtM5knIAA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: 3B3TLsijAUtTzf6XDDDU60zTr5wNFeGH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_04,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=843 impostorscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150160

On Tue, Jul 15, 2025 at 09:29:37AM +0200, Luca Weiss wrote:
> The eUSB2 HPG version 1.0.2 asks to clear bits [7:1] on all targets.
> Implement that change in the driver to follow.
> 
> See also https://lore.kernel.org/linux-arm-msm/7d073433-f254-4d75-a68b-d184f900294a@oss.qualcomm.com/
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/phy/phy-snps-eusb2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

