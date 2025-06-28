Return-Path: <linux-usb+bounces-25207-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DD7AEC3DE
	for <lists+linux-usb@lfdr.de>; Sat, 28 Jun 2025 03:43:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A47603BE403
	for <lists+linux-usb@lfdr.de>; Sat, 28 Jun 2025 01:43:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 261781C8630;
	Sat, 28 Jun 2025 01:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S4cplTkH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20580262BE
	for <linux-usb@vger.kernel.org>; Sat, 28 Jun 2025 01:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751075020; cv=none; b=iKDSSrhAAYfU7T9kUONi4ojbh3VM/AlFCBMjbsVsxZA2MS+FHcC2gwybuBF5nsOIew39L1NoI1JARuEYMno9Fn/lG8ql16EmwlmG4ZXd/DGPAn6R+MLNs693q4yMEEj7j2UJ2ufUlsGsW4G7/IHUZrRHKXhhJ37346IBOaDm7Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751075020; c=relaxed/simple;
	bh=WvElDR/b2PzkgnXWHqMj9OrR7hW3VFW5DZDDEN4Av1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=faj024GZLq4mpeoYrAppyZqaZnswnWct392zSF4Uctn0fuaePU8MDO1boFRbOTltjcmaFc/fbQVQs0wup79WefL716CvDph6Ij08VUlYRGaCfx6fMPx/RqwP/JRNXxFlTCsO+Hf3twAGW60Vaw4OUsxySOOsK6jVAJeYIXBFeZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S4cplTkH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55S0DGBl004785
	for <linux-usb@vger.kernel.org>; Sat, 28 Jun 2025 01:43:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=I7wg8teEORDngH2TfkXV85eR
	j/DOf1HMnocNxYGSSR4=; b=S4cplTkHYokQ5L2+Ape767xZh51Z/D9BwzojVyQ/
	bXovGWkzv6RYfsUNHrDtPpl1en4iyyK85QrFe8VNUmpUKpDtQZ+Kazfo1E0d0PUJ
	tJZANTMdixRa+gYyhKAOiY5xThTrHBZnvLOklrhxVTxbr0l7/qT0F3FgkfbDU2Ti
	oNf1dvZ6eaurKKxyHZg8MpIoKhkl6DzfdHsDozXHTKO6TFOeIhlAaeGTKbsV3giA
	AGtnrYXEotTHWbC/RH2fI9fz3hSpyBgkT+x6WDOS1GP+Ul5wx0BZXTikqEcxcs/7
	RvwA/NimHtX5Glm6tCQrIcqxD8juaXogt+VDseKfPi4pgA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqxren-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 28 Jun 2025 01:43:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d38fe2eff2so417556485a.2
        for <linux-usb@vger.kernel.org>; Fri, 27 Jun 2025 18:43:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751075017; x=1751679817;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I7wg8teEORDngH2TfkXV85eRj/DOf1HMnocNxYGSSR4=;
        b=R1Jdm+15sKaELU/q4Sokmqwza4OWOabRQ5yM63Ekgq2m1MMo3Dhzbr2TmMa9U+RXDQ
         LWZHiM254V11wj8NRZnRq6refouXgVltD6rKxlkGm6md7dIb2flt9HHjhZnbQfSZcY44
         SYQ2wsrvja0SE+ZO2ozP5vowDZw9VPbCUij2UQZnM5LQX+O1FXz/TROqZ3b61WuSfZQs
         Sj+DvjFIvJCfKTuZwVHla5L734l4cSf+jcmPQbmBPbfS633qP8s0nS3Ardss33fGI7A8
         AnViR5BVhBq66HW7pvbYeoQgdm5TT+Yg0n3palu39dJqo4ziEkO/7b9zfS5mgNZ8tPyy
         PM7A==
X-Gm-Message-State: AOJu0YxGoQE4+0OgXeny0uAYbXRB0s2SXy7CJrVwNwt5hJve/HYr79WI
	Wejl6RkPn/CiNhGMj6zKRTYy7lU22bhwhsDzuU64MDaBAsY8RBe+2M8Yv1LwFHEa6z4p+SEhErE
	/a02GvumJLiEXzljrayTc4y1Hxo69zMejY6RF1Uk9gQXO8neuZqEkkBa33IVdJRMBT+uwpvVM99
	QQ
X-Gm-Gg: ASbGncvLmNBI2cNzMXY73KJNdeXi1mq/2ERlj08KFZPKGR3ZGWfu9OACRLzIsbHacpc
	GC+rVoQlMMYzwqncjv3B3d41PwBZX8IGCv/m2Yt1kWyy3nSrLhevqOhwiw8QRUVKPf5EKdaTECU
	zuVRyAQxlWc2eHB37x7oMQVHgKYDmFsMglmcO0vC110ll9rmev7GzD7ODivh6bxFWLvUuAm51qE
	kKWQqfPab3U3lL++3B4B/0ci7J4/2hTPB79tG3tV8y64Yq79TOiz78azOFLBdB8x226WpnnuJeU
	19Eg4tVLu9V+D672MmXkULDgqlzQM7WMYFEtjz6jr0WANvASLlaQQNog0SYGt6jdvLHLLnR9V8d
	lZWjzkP/o5rVsQg0oCes/JVtWD5mdYUuf/8o=
X-Received: by 2002:a05:620a:8396:b0:7d3:8d1e:9703 with SMTP id af79cd13be357-7d44399091emr741591585a.33.1751075016708;
        Fri, 27 Jun 2025 18:43:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFw137a7Ms1B43FTXIVnoL6CSoEe4ZQ8VxAhP2UN7hSxYLug9gcSBoUIxcaLl0CpW7NWJ6Bpw==
X-Received: by 2002:a05:620a:8396:b0:7d3:8d1e:9703 with SMTP id af79cd13be357-7d44399091emr741590685a.33.1751075016300;
        Fri, 27 Jun 2025 18:43:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2b955dsm636739e87.119.2025.06.27.18.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 18:43:35 -0700 (PDT)
Date: Sat, 28 Jun 2025 04:43:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pooja Katiyar <pooja.katiyar@intel.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        heikki.krogerus@linux.intel.com
Subject: Re: [PATCH v2 3/3] usb: typec: ucsi: Add support for SET_PDOS command
Message-ID: <tiakxspacridasrgpenkihlawgxwawkgiqux2eejmjm2mddkyb@pc6y76n3qaf5>
References: <cover.1751042810.git.pooja.katiyar@intel.com>
 <097b5b2c8ea413f05ce24c80c8f6790dce207bb8.1751042810.git.pooja.katiyar@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <097b5b2c8ea413f05ce24c80c8f6790dce207bb8.1751042810.git.pooja.katiyar@intel.com>
X-Proofpoint-ORIG-GUID: g4Ic8jAuZr7IKYSlafFukc13-MGlE34R
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685f48c9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=EqvC8NlV4ryAvZxvT34A:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: g4Ic8jAuZr7IKYSlafFukc13-MGlE34R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDAxMSBTYWx0ZWRfX8uqNdXVnRNX/
 HysXqS5xy0As0ngXowmUhSiAvBF3XUtpaVcf1voKZgJiV14QTaPPKgoofieBzsOPWbS8BCVMdd2
 RVlHe7g+kjOVJ+n/Lk13gw4XpNcHrHvv9A5ykUAIs/AUrytRwpNhBiYbJHHkAniL67WZ5xsd3In
 mpjyLyAl9s88JMY8eQu5ibsZnev4BxAwmA8pOGq3CEAuHqTlL12dxdldhiZ1tpGaSHqjvtTvKF/
 MasF1xHciEo/bhE6pcwPHRBJwxFz+oM1AVq3RXqRHKsBthXUcKxzztD083WgIlU77bZns4g/rUs
 TzgTgZKPaKBMFA8BjoBxmQU1CRc6Z9BppJyvj4/9sHWSGRJ3iXIwcvVIrJtbQx2egoyiaGLY3lf
 1NIsMW+FzOSYnpPMCRNs4KbL8cqDR1QgXRhj56vQgDUT4HZsXfpPOUkFF2JIaWcOMmCfH7w5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=870 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506280011

On Fri, Jun 27, 2025 at 11:10:12AM -0700, Pooja Katiyar wrote:
> Add support for UCSI SET_PDOS command as per UCSI specification v2.1 and
> above to debugfs.
> 
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Pooja Katiyar <pooja.katiyar@intel.com>
> ---
> Changelog v2:
> - Send message_out data as part of ucsi_send_command.
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

