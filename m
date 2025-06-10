Return-Path: <linux-usb+bounces-24653-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 64405AD3484
	for <lists+linux-usb@lfdr.de>; Tue, 10 Jun 2025 13:04:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D02453A90DC
	for <lists+linux-usb@lfdr.de>; Tue, 10 Jun 2025 11:04:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D0AD28DF32;
	Tue, 10 Jun 2025 11:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FJbkucFY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7219528DF0E
	for <linux-usb@vger.kernel.org>; Tue, 10 Jun 2025 11:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749553481; cv=none; b=m0u9oG8fK3H7s2QoR1P0qr8Y3Hcdvr/mKoRUwiOCvX8g67uvI0kVZHMorf5jy4j9e8Pn5nnPQCnnGkk7qglO03d9rdoYlYZz8RrewYykaUj23x4utk64EXpvDaEpe3MSKBTpcek68yVy4JbfQI/JBjzxk/LoWg7sIPRENVsQUMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749553481; c=relaxed/simple;
	bh=R4o6PaWI+O76kDy/WY5h4PlkOJeZ0j1tGHOz0ZXU3GQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B8+hp6Jt6qJ2VXpel+qpNtjs1mXydCWqbfdT3T0FVQNizz6PfKi2GDuJRhKciNCbRCojwVSF5mbO9TPa4jxvAdSWmqgdsX71grbl5nO4fhgx3WDhTMDe0VgasPmtnBtVoYXRlyGpWVp9FxaKhvDtSKxxVgJp3O5RESa633gLZho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FJbkucFY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AACrr5010122
	for <linux-usb@vger.kernel.org>; Tue, 10 Jun 2025 11:04:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5mAyVc9QUeLGtDw6CMaYtUCL
	bSHuku+8kjioemkNmUI=; b=FJbkucFYcpOgGBiGt4gc3E6ot2ICduQQLof5EeJW
	p2BZtGGOYkAzV3AUEdJ5JGCFMSI2C4r/MyFidizKeNZ5z7mkKuCBKQetfhMf8tys
	yuVm0sYzosYVlLFj6ecFa1wWcOwkrxwEc/VxDQJ763sRNat+3eMot2RL/+6LiFjZ
	iJXJIidtIR04egYO0V0NLjoDo0Mg7opMOUSnU1bmQS3YW58BGov9TKpvK8gySlZm
	eNK2/1iN4hn21BJuzP7sCC4tNEXBsM/aX3Dxc6XC/WnZzK5KjQBFuhD/HvyumyM9
	ffyd6HYTVC1y6ww00KcoIwlkbA9jMdknI6UJXFpYSqGsxA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 476jrh8566-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 10 Jun 2025 11:04:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5e2872e57so955130385a.0
        for <linux-usb@vger.kernel.org>; Tue, 10 Jun 2025 04:04:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749553476; x=1750158276;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5mAyVc9QUeLGtDw6CMaYtUCLbSHuku+8kjioemkNmUI=;
        b=uw8WJ186IMVjgKc3QMHteVhkBNiK8APXpeb/JfFQl/R8NmMeCjhJ556FeN6guPyX78
         gg7bX5ZHZr3KVivbsTG/3PDq0k3BmZHHXMMvSIvjQdNsy0Yko7jPwlqfZwuF5yV7WClR
         /uYHLaOmSiHjWGUDddR5dtxhTm+MgyyRe9saMcqiTVi838doQvglbiGD0PWD+6+zI5Px
         +fKd5P/+vRWA4lIMvDvw8WrsXU8ocnB1DQ854UPPmyYDHI3IVxxy/ssp3LroWp+901zb
         Fq9UCRc456lURb5YKcHgRi0Tl9zH5MLJ6+q8M1/ntiCy4JGYgm5RpND9nDMQTFheAri/
         pqIw==
X-Forwarded-Encrypted: i=1; AJvYcCXKIMVm2sCnGyuZCFnBMtM/mJ5ModvixCTRfO+jM0Fw6I8kgqT/gVUZrsoAULPWWeD8MKQ4WdpbL7g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAIR53tKH59R/7yCy6LCB9PyPBli3uJrFPIoPBuy/f9y5de22o
	qPFBF8HCTcepvdES1lKGMUiKSHgpo9Tv5rDRDi+FVBytoJTGQsIWOq8Tu9rqeekJgJQ1NqIAzmJ
	7orJ6Govj5ciBHhm2X86Ddwv/uvmc/StvK3GoTSyR9YTDcLQ5Vbud5YrclTmseIs=
X-Gm-Gg: ASbGnct59CP/MlD2HoV7nvbyjf2xr0OWFyrp+k+FP9K/9Fe62VL+mlIgh1AUQ7W7uqb
	1iYjNXZyBb+CQ0r3P8oyYZvw+/CQMV2oFopBsCr09eUzkNo/1LRUglX6g74EnTkw6Pamc7nAeGM
	DFdSkmFvYdihmcHLOcBjuHA+s0551D93rGDgiGmSP0v5MYLOeYAPm7xal9MYN6sLQ/Vy+EmhWP0
	OXCIABaL6xLyBuWLCoptX7ALcPMCZ/KI+R9NsVdIw72AWWd8dIouPuFto0Scgc6TbbSd21iX4iz
	peBe39/FDODKJQPMKWx5NEOsUpoFZjqm93+gkiPxb0eJZwfNGhe0qxXMm45DVWN5VjCs1zI0FNI
	Pmz8OEE9jzYYwewBwqgaSkSGuhmzES55bIaw=
X-Received: by 2002:a05:620a:44c9:b0:7d2:18a1:ce0 with SMTP id af79cd13be357-7d2299328d3mr2409957185a.49.1749553476165;
        Tue, 10 Jun 2025 04:04:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMCJOmjxkc64yeC9lOHbHk+tMFV29byxI2Q11e24WObV3yLCk99cMVxMnJZ4uc2QdyTNnPRQ==
X-Received: by 2002:a05:620a:44c9:b0:7d2:18a1:ce0 with SMTP id af79cd13be357-7d2299328d3mr2409951085a.49.1749553475694;
        Tue, 10 Jun 2025 04:04:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5536772ad7fsm1499251e87.192.2025.06.10.04.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 04:04:34 -0700 (PDT)
Date: Tue, 10 Jun 2025 14:04:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] usb: dwc3: qcom: Remove extcon functionality from
 glue
Message-ID: <20250610110431.zaug6ocvb56vztnk@umbar.lan>
References: <20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com>
 <20250610091357.2983085-5-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610091357.2983085-5-krishna.kurapati@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=EovSrTcA c=1 sm=1 tr=0 ts=68481145 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=gYDs5GclryXmtiFo2a0A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: PdLgCAgTVHaGX6hoSIfg6NUCg9TbNpdI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA4NiBTYWx0ZWRfX6jcF1h14W8Zq
 8jwBmeBfOdwhNachfreYkypDQnWfXsOdCWekkabr++y7AplbiSs+thiHrWP9sgZyAKp4mYoJWht
 X8DeX32QPpDUmOTYhudz2+GCDOR46DX23ZuKNti312Wo/LFM10SUc4Y1X03ZO0kQrIOQ7CPiqgY
 pv2Axz9gzWUFUklmUzGLwIzJgp+weKSSV+ykR20C8MSFsC8TQLnmLH0vN40hfFmQGn0M5SmmOkf
 y6bv8v/wQ7pcaor9CbTcLWWsSuRb3qE11eBGSvAWFodEfZ5nKgJswPX7QX8KdcOFyCqWbah7Kmr
 6lA23zlNFGhn1uSB2YFLVbVLQZ+Dz2bn/EhhHSCst4aSpzv38tisn/UdzBwPdODvSwUcdhoVYJp
 4m3Avu+X0pX8XUg5qQiVpG9AGobIJb9nz8+0VHQdUbdgIspfcrF6jNrttuOew5BNnzzkkKek
X-Proofpoint-GUID: PdLgCAgTVHaGX6hoSIfg6NUCg9TbNpdI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=722
 mlxscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100086

On Tue, Jun 10, 2025 at 02:43:57PM +0530, Krishna Kurapati wrote:
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
>  drivers/usb/dwc3/dwc3-qcom.c | 91 ------------------------------------
>  1 file changed, 91 deletions(-)

I'd say, this should be the patch 1 in the series.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


