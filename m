Return-Path: <linux-usb+bounces-25971-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0966EB0AF1A
	for <lists+linux-usb@lfdr.de>; Sat, 19 Jul 2025 11:35:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 800423A8726
	for <lists+linux-usb@lfdr.de>; Sat, 19 Jul 2025 09:35:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18C0E21884A;
	Sat, 19 Jul 2025 09:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aYNd9kCJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C6821770A
	for <linux-usb@vger.kernel.org>; Sat, 19 Jul 2025 09:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752917736; cv=none; b=Ea3b8I60RvY6WWYqBtVM5JK9QEIN4dhSr0RBNI09u1su+d6pmN4AkgR8M0EPas8v0CgWy0BePH/pSrKKcROjawMAWPmXekSZMlSr+TkYk6V7RNl6efK5x9VpWFzx/adTVwi7+oG1AEYCXL/IxFb19qdgRti+s9RXUXbiK3U+X1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752917736; c=relaxed/simple;
	bh=hoSWN+5jhLJI9d8DpMrlNxb5YX+YAZkHose3puHowik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u1Kvp8eoFEzzXgKF4DlIaHRi6Lkzm6cwZ7TGSr+NPPbsO3+tQppPJH27KueyaC64c8YbseZaAb6tSHhKHvOvFdktigzkwt/yjLgPGadUTTtQEX/OlXgtyJt6etm/gNjgZU3sE9SdeH+7Q7e4P+YkNaAFW318FND51eSt6HHy/vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aYNd9kCJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56J4LEjr027034
	for <linux-usb@vger.kernel.org>; Sat, 19 Jul 2025 09:35:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wSbh+xGKxOsPi/4J27pwmx2I
	Cc9rg1Dj97VeqIVuWg8=; b=aYNd9kCJBpJD8plQqeqjz/IuZ6xQz243UkfZsZl2
	xfMrkrgp61/ad0lwFhnxvzBZfBwaJwIXkXf+e4secVC/5Zb66PlHfH2bQ/AkEQ+S
	UEJ/TE/6lu9GEH+F7mTu33dlaEhdBI/Yb4E672HHDkvbeePuQWNPnt5Ugt8xLvpW
	2NOJV3h/UJxDWgd4VAhTCZnyDQVyPnZtJ518PNR2jrsKVTXIl0E2AXtcYmM4tdVC
	mFYYA1Km/E9LwiHwpq3c/Kv9KhFnaLRe8lpUSbJevx37qrINemTr/FNDDjGvOUuO
	6ZFE3SL0a8tE+FSiXq7eCzkMG4OfC1IjMDr/8usJHWdQ+A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048rre3k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 19 Jul 2025 09:35:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e350915d2aso643079585a.1
        for <linux-usb@vger.kernel.org>; Sat, 19 Jul 2025 02:35:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752917733; x=1753522533;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wSbh+xGKxOsPi/4J27pwmx2ICc9rg1Dj97VeqIVuWg8=;
        b=AEempOwxXfAUj/fr/ozvLNF8Eneo7enrGdTxhd+CS6R0kKU5Gvf7QkXVibNgvRpp6p
         BJ1FTvfHnbLktBKU1KTUQCAb2NHOZR5tojMis1VUfunXJV3CSzHBnOIFzl6he2hB8pNp
         GUg3350OJE0jJQhfc3063Uw2dcfSNYJt0Wix8ai5vV/JpU8VUfSaAUe3vG1L0/TLDEyH
         1Qq13AlCNLdkPC7ppTJkdhTn9JzjgXpDTyk/wlxbtRKL2BQqu3QjsJP5kZKl6hpUOCVA
         R/R9WpRjEgsJLvfKyqnahNXEPuK1XGRaF9M9Dg8FpMpcPyNubGs6wfO0K0gdKh0q4Wrm
         wCwA==
X-Forwarded-Encrypted: i=1; AJvYcCVLXdqVoI4RHZvR6tVsfhYWG7n9q1B6ewKDAJTeS/2FOACEQx8jFPE2/acdBJbzLIGFIjHPZ7WEtSg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9+XKTPoTjfc5iP4tc3t7MYWjYs6+Hu6eliJG6O87QDuWPmNgX
	ZxTEU7MlpsrkzAX2B9Yn9l6Vxj36m72xltTl3hQVapF0xWFlKBjsRUm3IMGQSBqNXclmJ3cMHZ6
	wAiRlnRWpvnes7WhCDaM1zwWuFPK3g5IyVpSSNSm8hqdvH4xRzkAlh+YPnO9mvb8=
X-Gm-Gg: ASbGnctX7Xw8/LdeAV74Nz27ZoQjalH4k32/kfejP1BFBE+KkHpVCUHSEmHbkrem3cV
	OYOWaiCZbUrjkc74V6hu158y5bBjX5ZHhQ1UejSXYWa7GN/tbgHokbUAxh8WF7d0ZaCBnW7AlIP
	Gf4Dm47NW0XayRo9xCayKKO6mjFAjawnui/T2ZbxFfVMeMRzbRdafZF0zplocmaLrfjwaDz0iYo
	TAPYOxC6EVGvIWsLVmR3o0iDpJYg/C/9sFnKcR41P0cHyunOfumgqZFQSqeOYlZybxXG4q6Dq1b
	D/gG/XzNi8cBulPqA0dZYsdY9IAoPUv9Gba7Nsqcq0cfngenWup3ZwWl+0grebNSJmJofINIfSU
	2oXBtH1BRyVwed0qQxzr7He5bA8T/7yezM8pJ4h8fxidbAC1Td9ia
X-Received: by 2002:a05:620a:2699:b0:7d4:28d9:efbe with SMTP id af79cd13be357-7e356ae17fcmr791788785a.32.1752917733029;
        Sat, 19 Jul 2025 02:35:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGM5wbUvtWyq03MOIlSlrD0IZhIz8P5EDs5+tTPDfigb89vA+4wYsZvArhwqxS6KlWMIpuEvg==
X-Received: by 2002:a05:620a:2699:b0:7d4:28d9:efbe with SMTP id af79cd13be357-7e356ae17fcmr791785185a.32.1752917732539;
        Sat, 19 Jul 2025 02:35:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a31aba0f7sm648128e87.83.2025.07.19.02.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jul 2025 02:35:30 -0700 (PDT)
Date: Sat, 19 Jul 2025 12:35:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] usb: dwc3: qcom: Don't leave BCR asserted
Message-ID: <iyvjr6fx3ec327mcbtemxdke32wzm6xy2zuwbdimy7ticsuvmq@rlbqiwdwi4x2>
References: <20250709132900.3408752-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709132900.3408752-1-krishna.kurapati@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE5MDA5NCBTYWx0ZWRfXxlwGsjXpUHLv
 jb+aHXoND8P4DlwgN0hZhtpzxFLCneIv6FHk/oaRH1VHsfLBCKAS7PgpX+9pENgayDxVW6gD1Xp
 Bx7xyawSLRuHBrl/vNW/zqbTgVt9mSp4iCR9kUKWUAMrC6DY2cmNICqzeU1bgn4qeddS9oy7qrR
 UHLVmPCb2kohgp5R3p984i5Lf/xRFXNAmRFmRPlNUNWQcSld9nVkjaX+ng8zykEFBD/jzbdI6uy
 XVR/4VIwe9rBhf/YWjtDdGF3A51pj2tFPB82SthHG1OdG1sab3gN2Tln6mJpWAG54ik3v+kMJN6
 V4d1ejJ3O7/8Eoc5oC9GtFLfBTnOKP6OKuMiL6HrGUp7F+q0efrFcea50NFSYwcZ758+lkei+y3
 m7o09kw1nK1Ufbhu1NvWqmxLQAcuPpBWl6CiNbeaObtj6c4wcCPiycGB53s2zbKe5FXZWn1+
X-Proofpoint-ORIG-GUID: oLhVd5-27eh271wqznkQ63E8rQGJouwv
X-Proofpoint-GUID: oLhVd5-27eh271wqznkQ63E8rQGJouwv
X-Authority-Analysis: v=2.4 cv=OPUn3TaB c=1 sm=1 tr=0 ts=687b66e6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jIQo8A4GAAAA:8
 a=eOX_9S80fVGYM9ega84A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 mlxlogscore=533 lowpriorityscore=0 suspectscore=0
 spamscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507190094

On Wed, Jul 09, 2025 at 06:59:00PM +0530, Krishna Kurapati wrote:
> Leaving the USB BCR asserted prevents the associated GDSC to turn on. This
> blocks any subsequent attempts of probing the device, e.g. after a probe
> deferral, with the following showing in the log:
> 
> [    1.332226] usb30_prim_gdsc status stuck at 'off'
> 
> Leave the BCR deasserted when exiting the driver to avoid this issue.
> 
> Cc: stable@vger.kernel.org
> Fixes: a4333c3a6ba9 ("usb: dwc3: Add Qualcomm DWC3 glue driver")
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
> Changes in v2:
> Added Fixes tag and CC'd stable.
> 
> Link to v1:
> https://lore.kernel.org/all/20250604060019.2174029-1-krishna.kurapati@oss.qualcomm.com/
> 
>  drivers/usb/dwc3/dwc3-qcom.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

