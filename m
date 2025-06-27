Return-Path: <linux-usb+bounces-25203-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 617B4AEC2B2
	for <lists+linux-usb@lfdr.de>; Sat, 28 Jun 2025 00:40:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 87FF97B3A43
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 22:39:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AAC028F53F;
	Fri, 27 Jun 2025 22:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I+A2m45v"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6939B215779
	for <linux-usb@vger.kernel.org>; Fri, 27 Jun 2025 22:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751064042; cv=none; b=E97HihqegS6EFfcL0tE2rvXXZwohhJEAZiR0UMlbYvyLbifGhXLF7r9jGSWXok7jfhQDJjaJvqGWyx39LTR7edjdhKQP99EP+kYlMySfbXhBceLy8pq0XmU6dD8Ti2wBummAJlW6s6Urv7oMT/iksrIKrCne2JN50nnBFxb7oEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751064042; c=relaxed/simple;
	bh=lbJ1OmwnJlc3oWxyOG8IrF+RShAKURvTbImRFOmwr8Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dtSTEL949k5OHuV7zO20ubckskp0Bvqk58RzagGLx41WInh0r4F2QKsWAy5SmoBBc5dvMnULFfZcUjjYq7Y7bFljsMLePo16fnexX02DtT7IhcgI3xHDK4YxQGh0Z2BrnfXIouO+B4Hh4hBaEzbq3AIpQFOLMIFMv1Lovnhk4ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I+A2m45v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCAvTh027458
	for <linux-usb@vger.kernel.org>; Fri, 27 Jun 2025 22:40:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ynhDr8TO1DRYwEkTDktMvb+gpG5cUe7NiyrnFd95L08=; b=I+A2m45vluNYGCkR
	ye/T8DVzqtBjG2+d1beyBNAc+2rF86ymhOjzyoNnd+DxiKdhum+eOR1wAaqfMD0L
	4dyoYU2M7Jd4g4+YuHJnJT18eZBn+xLTOHo+a8w0EhdLORsLeov6yRsR1ieYm+57
	9IUMQP5kJrNS/3b4R2EeUz8WND2i832YWWOqHiGa4/fgj7MG9v5gq5hjF9inXXFb
	QG8Ez0FiFTw24OkQTLinKrmHnxmicYmSikGsKvmwDSe6SGa/fulXyea1wEj+8wtU
	zo6wtzNv5rvaJEGms7CxYx4WjZgmSEnj5fsJzrqow0XPP1rF68FY9JkBD+LJL54i
	giU3hw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec26jje2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 27 Jun 2025 22:40:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d0a9d20c2eso49845285a.0
        for <linux-usb@vger.kernel.org>; Fri, 27 Jun 2025 15:40:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751064039; x=1751668839;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ynhDr8TO1DRYwEkTDktMvb+gpG5cUe7NiyrnFd95L08=;
        b=pOfgB1Dmzr+8HQT8HMza3/Av4S6gTRk+B/egr7j98Eh9Sw/MpSpGL305VObmlmZeG7
         YzlyU3qIq8VsK+H+6QMrWux/Xm8RG6TQtYNkSaRGezOSWPBI+kXToxF13nNp9+xqlJCd
         Uxeyy0rhZI6CHRDS78BNrioRHS/zXkByPffkujie6q78XJA/55jwYDm/3qv2YyvRNBJ1
         PpQrCBmpmmrf6/xwL9a7tYMmIPL1xB3HpqpwSPdrpLblFznA8T7GUvxaV77Jp5f4xZ1R
         dve0GMwQh1a2ucTaOnEe06lWYB9zgDCM2DkffjPLkpMYWSqMj8hcK6ApS42KegkSdu7D
         INFw==
X-Gm-Message-State: AOJu0YxdGZnELM3FllbdpjbE0NparVdHzAUrsXR8x8O4QNS0f+6kuptl
	pRNbJg1kXcoBPIvM+YUnodRESWWiSsy4XqZ5IbQNX1pA8dFACX0e97UG0tbfEG0Bfrsb1wyRKTL
	uqyVpq2GYyjtUcPf7NlVb44nBAs9BfBL6Yid7MQejk/5+uQDMBfbwBC9myGQ/+YA=
X-Gm-Gg: ASbGncuVcsp360Sck+J5qmniQTdW3XIIfZZls49w5SnzkeQhp5MEmMAZdyih8N+tIzr
	TV7hTWt5tIg9KE3XFo+OsAH98Rf0YE2wjpv0y0EIURUWfNoLaGY8n06kILvro3tFo+tD+rN1OY+
	9Ze5U/R/DOO/Kw+ThOEBul3yZneR/oLgvICIWc601gIyQixy0CS06y/z8mQxqau8Hit8vIS5PZu
	sxaIFVqYaK25m6R8OmG9tJTS093Jh0gIqRnB6csIdL5ytP/Pe5Vcvm/Zdo6XRkuISc8T506Qt+l
	SaJkH745c8GwOeApU5V5X1JxMkjAOQ6FYI6vwFwvKg/t28f2QpH9SgE3IWkLNY0UTAHSPNBorcY
	RSAQ=
X-Received: by 2002:ac8:584b:0:b0:4a7:79e1:cd54 with SMTP id d75a77b69052e-4a807399500mr5954011cf.6.1751064039045;
        Fri, 27 Jun 2025 15:40:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEc4+GNciTP/O9gtfh3RqHNMrG8oCqVbHIK2eGyIz6Jm8S3BUPnJK/v3oHFghVCD5OesMEqLw==
X-Received: by 2002:ac8:584b:0:b0:4a7:79e1:cd54 with SMTP id d75a77b69052e-4a807399500mr5953911cf.6.1751064038563;
        Fri, 27 Jun 2025 15:40:38 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c01636sm201208566b.105.2025.06.27.15.40.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 15:40:37 -0700 (PDT)
Message-ID: <b03ce446-3932-4588-8392-eb5eae69388a@oss.qualcomm.com>
Date: Sat, 28 Jun 2025 00:40:36 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT PATCH v3 1/1] usb: hub: Fix flushing of delayed work used
 for post resume purposes
To: Mathias Nyman <mathias.nyman@linux.intel.com>, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, stern@rowland.harvard.edu, oneukum@suse.com,
        broonie@kernel.org, stable@kernel.org
References: <20250627164348.3982628-1-mathias.nyman@linux.intel.com>
 <20250627164348.3982628-2-mathias.nyman@linux.intel.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250627164348.3982628-2-mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDE4NCBTYWx0ZWRfX3ZmI8FnVTGOp
 CF5+yWAD5Bs6VJsxdEjsVFNmGRFXXpBJRPN0pRgDcQ+H9ZDblEDj5L2b+L6dChtsIMGQcyfT4p0
 wXH29bnuJzQtGeBrYGSNYlfmqUVnK292kdrvW1ullc1pW1kMMBN41skUdlIzvL9wG3IVgZpHX0k
 yZWnlfkVvDb6wz7pNHtZk7Zn0cS+xaVi4kcPiSHz/XMWcxGDoznpwiGZvUkrr5xY1KIdEnfPcnG
 nGB9vVxhHPUjSDVXOw5YtQZHDbqTC++kMBSme0HX6eRTQO6TZou+D681c6NkfnFQE0+MRPw0Ep1
 OkKdzcFRUAYAlgrcDOeJj7hrPepDwl9OAHvYdZ+8ntu6FsuiPsAhbBmbss+Ygh8fcCdU7i0Szbb
 9sl1rsKGAWHT/V5g19kLBvFT0470t1lGgVbaxWzxrmxvQanKwou7dfSHJMzVQod3tUF0K5Gw
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685f1de8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=qNABUOcEAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=KvpN82ljDES4kvwgT-AA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Ytm653ucTKQjCvbzLygB:22
X-Proofpoint-GUID: CniV3bEvZzPyvmEi2MslUxKy48iDDYmv
X-Proofpoint-ORIG-GUID: CniV3bEvZzPyvmEi2MslUxKy48iDDYmv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270184

On 6/27/25 6:43 PM, Mathias Nyman wrote:
> Delayed work that prevents USB3 hubs from runtime-suspending too early
> needed to be flushed in hub_quiesce() to resolve issues detected on
> QC SC8280XP CRD board during suspend resume testing.
> 
> This flushing did however trigger new issues on Raspberry Pi 3B+, which
> doesn't have USB3 ports, and doesn't queue any post resume delayed work.
> 
> The flushed 'hub->init_work' item is used for several purposes, and
> is originally initialized with a 'NULL' work function. The work function
> is also changed on the fly, which may contribute to the issue.
> 
> Solve this by creating a dedicated delayed work item for post resume work,
> and flush that delayed work in hub_quiesce()
> 
> Cc: stable@kernel.org
> Fixes: a49e1e2e785f ("usb: hub: Fix flushing and scheduling of delayed work that tunes runtime pm")
> Reported-by: Mark Brown <broonie@kernel.org>
> Closes: https://lore.kernel.org/linux-usb/aF5rNp1l0LWITnEB@finisterre.sirena.org.uk
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> ---

Still no issues, thanks for working on this!

Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> # SC8280XP CRD

Konrad


