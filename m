Return-Path: <linux-usb+bounces-32404-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6730BD28489
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jan 2026 21:02:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8830B304A950
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jan 2026 20:01:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D4AE31AA90;
	Thu, 15 Jan 2026 20:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JypMXQ9j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RCuj0oFQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67592D0298
	for <linux-usb@vger.kernel.org>; Thu, 15 Jan 2026 20:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768507272; cv=none; b=HayIL/PoJhQTho/wE5CaoNHieYLMZnBoHuFIKJbPmeYRp7z2HVSd96XR/OHDEseslCmA3/YXcoPZ1Vz36PvV0pw0wy7Q6OPzB1emUlO/dBqpX7269z3HOgAk7AMWNDzGr7Fpt60A8mZaASov+QAGD8PfJrCYyqnl1tZq7IrV9M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768507272; c=relaxed/simple;
	bh=j0KnlLmPZJDeueg2HCP4gbfs2ZYlp2t1cI9AaOl+sZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U++uOgnlHeOpLq3xnRDmoe2neMwCUWyLNLOVIoJExjL3K76O+2+yFapNMAmUGxNRcCNi08Y93kzOEHZmce6onIL3bvzG+6RFm8OWqNjuY4NgfAu5dxHKwQaqP9u4cW5kJ54tVStsIRZkrxT7sg+GwOXOp4HLPHOsm7fLuUZePPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JypMXQ9j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RCuj0oFQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFYLot3113542
	for <linux-usb@vger.kernel.org>; Thu, 15 Jan 2026 20:01:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iGNAsi5NvW0w/zxaBS54l6pl
	2j/zbg/8m5WCIafia3k=; b=JypMXQ9jTJoVYUdRYGHMy+BjL3K45duCN7NzJ7xU
	SOD/WvqsLTAMnrrRXv7V1wJA4PKXjbZ8jvlJHpbqMKDZqYlIxKdJboN/Hu6ZPxpT
	vfuEUnoeBDxH+0cjKNGZMlfKjLRKcNx+Ea5VqizyoY5lTeMYX98KeZO6xZ82waTw
	WC5MmYWHDzKk+DUi5V7UZtBjMjalfPRdqA8Vod2SZY8toJssZOdbV7x5iQMEougu
	4NC9G5UMrkZVEYGuQfvrsgm30Y2xPbaeXbE7HG/cA5qBGzD9JQbrj/Fs88AxGN2f
	0L8mmK8xqdFmjGajj6QBBgniyaMprBpp9+tSb/uIMqzIbA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq2pm0v7s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 15 Jan 2026 20:01:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6a5bc8c43so116170785a.2
        for <linux-usb@vger.kernel.org>; Thu, 15 Jan 2026 12:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768507269; x=1769112069; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iGNAsi5NvW0w/zxaBS54l6pl2j/zbg/8m5WCIafia3k=;
        b=RCuj0oFQKIAQXadvN2uPsJ0BUFDqFDLGO7vvlpqBgoCPjmtPCVPXwTREnJJhyd6bLa
         9g8yWKZ9uwdNKav033YD7qh8HjsyXwTqqPP1wWnZt9hbGOBZnLtRNHUM4ABnWEKdyZ2u
         9qeJDaht9sLKjvwqO1FTJTQ5QosBnzGYUXizmPD8hvs7S80UHbW1BgBCKsw6Va1fxeiv
         Cpk+1trzOGe2zS5V24tbVsfq5jWhRiIB5i2LAln4pHfy0LkwLAOCK+DXmTm3AqujNoTW
         Hi4U3Nc9/Drwcvw9kmnTJ3B9AdHcT/p2wovcMfrjbNmB0+R3UjKSbYH2PmvpwXnG+gb1
         KUxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768507269; x=1769112069;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iGNAsi5NvW0w/zxaBS54l6pl2j/zbg/8m5WCIafia3k=;
        b=mbsLyXG0EUD7FCHy1/jGeYjy6zY4KDhRU2l4qLCbDB+plkPMQ3IvYHeGUa/LzSrloj
         zg2rLdxOs/8J4QDY8EMW/n7wTwZkXk0csOIEpOGQdxhpzoIugl9YZ7Iwln2iNhZuHlLp
         s89jOqKj+Wvd0ClEFe4glKEdv1g2MPD1mmRdBQgm7y0u50yPCPoUlPTw5dOOr5Wgh0lh
         8QCBWtfa7cZ5cSkiRSVY8dFIc2UUY/vDGJBssxyGnaJoFPwaxIjLP8unPxld2SGdoOeQ
         2adBcfGwwuUCGEr70PKFGUiTk0s1vx5XFWIiraEKQ0eClpm8FuBqlxRlWyQEfg7PCi3D
         COBw==
X-Forwarded-Encrypted: i=1; AJvYcCU01+U2k4p0zxkozV9pOWUvkDMTB5W1tP75rTY61atpXqW8HsU0bNlJhBGiMzBwl8IsZKKuoG5n4rU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9qHU/B7HzDsG3GVwhdLqOx55lGCq9CoBdEyAab97kJK8qrKpd
	8e5yAZeTcKAzGDzfl8Am9eWtUFCzrnHIcCFiTrSyUMnAj3VI/+ZGLmRj6TYxT7W/fW8sIZPL59i
	rgDDD2u/QxIvCaZ4Mrv9HjI/CqmdlrQrxBQP3Kxc+iNbNt+nnlyRfJTRNhAV650o=
X-Gm-Gg: AY/fxX6wcqEFhUsaxRPpkPx2dOnqW2pRmin0t49eLaKCvnmdyJcpFrCtbM9sq4xaFbD
	QWXcsIbL/7jB+EQtxygOq6bcEKvNTwazYsQb0Y7Vvuods4uQT408zMhxdOSJ+zTsFG4EhvRi+BP
	PaIwf7A2cPC98Rwr5xfS+WqQXFYfUqsgxGg/pnDhqdYOPVG7+C7t/gMwyd2g+EqYUf9Ctauu8Bj
	hmnc03IMBa/x8hWnfElxhrQqiItTW2BmkoEjxKMxrcHZv230Yu7hdA7KG3KZ3wFsDs2tqASG5aQ
	gKZKboAGBh9DGlExbeuV2ErC2jN0HBqHnptxStHi2x99cOHpQNveKrdbKgnui+MJhb6YacIAXYR
	fgABSop4SSF39wrbqrMKNh6fz4vwvxfkJzQnfy/XXSyrBTxtKN+dCpWsW9v4TDVFVpCmuj+DbHa
	A8uXycAjx3HtDNWr4Z8trBByY=
X-Received: by 2002:a05:620a:4729:b0:8b2:e346:de72 with SMTP id af79cd13be357-8c6a676ddc6mr102116085a.57.1768507259292;
        Thu, 15 Jan 2026 12:00:59 -0800 (PST)
X-Received: by 2002:a05:620a:4729:b0:8b2:e346:de72 with SMTP id af79cd13be357-8c6a676ddc6mr102101485a.57.1768507258106;
        Thu, 15 Jan 2026 12:00:58 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf39779dsm115148e87.55.2026.01.15.12.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 12:00:57 -0800 (PST)
Date: Thu, 15 Jan 2026 22:00:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        abel.vesa@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v4 4/4] soc: qcom: pmic_glink: Add charger PDR service
 path and service name to client data
Message-ID: <s6xfgmrv7axotpozgq43qxsflr7muzg4snff5coadkqbvfcofq@ktbqljjlue4l>
References: <20260114211759.2740309-1-anjelique.melendez@oss.qualcomm.com>
 <20260114211759.2740309-5-anjelique.melendez@oss.qualcomm.com>
 <20260115-refreshing-panther-from-mars-fb2f2e@quoll>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115-refreshing-panther-from-mars-fb2f2e@quoll>
X-Proofpoint-GUID: SsYHb9QlMS4ODjU1w1TXwREKNdcihtLG
X-Authority-Analysis: v=2.4 cv=TNlIilla c=1 sm=1 tr=0 ts=69694785 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Qpx8sCsO31C_0ahKLUYA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: SsYHb9QlMS4ODjU1w1TXwREKNdcihtLG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE1NiBTYWx0ZWRfXzfy25FYwqe5G
 LTGZQO2ddoTgv9hq3F6/E7Src69aNfz9HBjzcngRXVG/R456JHnmn/Zx4zYrzC+k/U8lJ38q8GZ
 YlRs3vtkUoI90eD0HWSq054X4sUjFUtXZbSGVjeqcpr/f4JICa+lvLzBqi+Byxq+tcRw8+f3vLZ
 wLNTuBgG1gA+Qb3ErzlQlJ+TWBlNQkzmLb4QkriTrt/+xtkplG4snLrPJdK9zqWnQK24nIdyZ+u
 aoO1UpOAp7U6oIMWschAWpFA2sKnlsFo8i1s1zlS6HWd9CC8SFoB0OTdsbHfzrihJ5oN8uXWZbH
 fN/kaBkoQFAAwhTVHpv0DiSfbsQspa9FEE8eo2pLhAxFDogUS7+YJye5zbKHEMe4o9UK4txFszU
 6XC7KRGOQnz/+oLDO26k3ujzgNiA10qX8Me7S7v+Z0xDxI2Z7yJMfwC1/T2+Xoc0OpexW2ffqeO
 rqlHUcXyN5o2WIwZcSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150156

On Thu, Jan 15, 2026 at 10:19:20AM +0100, Krzysztof Kozlowski wrote:
> On Wed, Jan 14, 2026 at 01:17:59PM -0800, Anjelique Melendez wrote:
> > Currently, the charger PD service path and service name are hard coded
> > however these paths are not guaranteed to be the same between SOCs. For
> > example, on Kaanapali and Glymur, Charger FW runs on SOCCP(another subsystem)
> 
> None of your commits are properly wrapped. Please use standard IDE/SW
> editing tools which solve all such nits. You really should not have
> received such review.
> 
> > which does not have any specific charger PDs defined.
> > 
> > Define charger PDR service path and service name as client data so that
> > each PMIC generation can properly define these paths.
> > 
> > While at it, add qcom,kaanapali-pmic-glink and qcom,glymur-pmic-glink
> > compatible strings.
> 
> This is confusing. You either do the changes because something is not
> correct OR you do them because they are part of Kaanapali/Glymur. Fixing
> a bug AND adding new support are two separate commits.
> 
> Find the real rationale wahy you are doing this.
> 
> > 
> > Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> > ---
> >  drivers/soc/qcom/pmic_glink.c | 66 ++++++++++++++++++++++-------------
> >  1 file changed, 42 insertions(+), 24 deletions(-)
> 
> >  static const struct of_device_id pmic_glink_of_match[] = {
> > -	{ .compatible = "qcom,pmic-glink", .data = &pmic_glink_sm8450_client_mask },
> > +	{ .compatible = "qcom,glymur-pmic-glink", .data = &pmic_glink_soccp_data },
> > +	{ .compatible = "qcom,kaanapali-pmic-glink", .data = &pmic_glink_soccp_data },
> 
> So these two are compatible? This should be somewhere clarified.

I think a lot of questions (both from the patch authors and patch
reviewers) come from the fact that the actual data is spread between
several drivers (this one, UCSI, charger). I'll take a look at pushing
all the data here and then necessary bits down to aux drivers.

> 
> > +	{ .compatible = "qcom,pmic-glink", .data = &pmic_glink_adsp_data },
> >  	{}
> >  };
> >  MODULE_DEVICE_TABLE(of, pmic_glink_of_match);
> > -- 
> > 2.34.1
> > 

-- 
With best wishes
Dmitry

