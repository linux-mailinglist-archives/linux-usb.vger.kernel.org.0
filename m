Return-Path: <linux-usb+bounces-24413-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1640DACA968
	for <lists+linux-usb@lfdr.de>; Mon,  2 Jun 2025 08:17:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DEF1189E16D
	for <lists+linux-usb@lfdr.de>; Mon,  2 Jun 2025 06:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7291C1993BD;
	Mon,  2 Jun 2025 06:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="euq5XaOu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0DA7A920
	for <linux-usb@vger.kernel.org>; Mon,  2 Jun 2025 06:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748845068; cv=none; b=RzmjBI/aUGHVJHU5s8Q+SNuUOFUwYk7cOs2Zah1PKY4rTXKv5mwKuUm7rTwon0jXDk4rc5mrGcJTfQnZ7MObF2TasaaQxUw4o94ilJlWh0J3/2YkSeCe8+dy80/5nAlsz3RAh5D0E9XqJKQOOaxxRayjjgZ9S1e6ll3ih9gApSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748845068; c=relaxed/simple;
	bh=CPZaR4EI368+qAI3lHWNS2wXQVdHRdGqRCZIxygqlUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GpY4JqoqR/6kdkW9HVmBflpKoNH3+2ITDN1Fm2zCON/QmXb7Xk0NmNRG+imt9ghU1bNUuYF817vIfs4scQ1Wi1ohMbBhHcKdJA8rQdo9cxXxbt4SfWB5FJ3iXICOKjrcaU3dsdeKvWKwSvKNMTc6/HAWw52yOrSNxAueo0z65Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=euq5XaOu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 551LGu0I031620
	for <linux-usb@vger.kernel.org>; Mon, 2 Jun 2025 06:17:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uWhhuDrzJ7payPyIOKXiW673
	AvOva7B7U3C0U9pnehA=; b=euq5XaOuYWh86iSwhgsrlsNO+OuI8kL5F+GKjV3n
	mXv+Pn8XGh5G014Z0gKEkLqTpNe4rdYWblFrUl4ZPYsaOxnJU9pfIVqQ+8+0oFIw
	E9SkRUU8abO9Nn2ECJ9/26keA7WuhrUFBV9WANWBqg7V9Tef+kot032a3D+/GHHQ
	pXG314+MxTJUAXlYOoFQcW6Bu3Zq34ecomILrMZrVMMYW7mkXJSpnq4nU1aiUVpk
	D0/OnHMbwCtJhJyJgNx90kxhh9xzDHYSUCtTJaOPk54wovX7oWoBEFnZIZmOHGGU
	YZF3pMYZM0RL4uGchiaxBuZc/HKQM4w5i3vBeDKmYT6XLg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46ytp5ugj7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 02 Jun 2025 06:17:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5cd0f8961so848033785a.1
        for <linux-usb@vger.kernel.org>; Sun, 01 Jun 2025 23:17:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748845065; x=1749449865;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWhhuDrzJ7payPyIOKXiW673AvOva7B7U3C0U9pnehA=;
        b=puLb+S2HaiqC5J4qYAxhUHsznRBJgpIBCvfvtBxh/IOT2i4mvvROIZAw6xN53vLg5B
         vQXo4AIP69SjJB36YoLSNSZyvLb5iFG+R6H1pFY5FRHegEd7JrXdISZhQAUVr/HAQj9/
         F/fd2hYBHYZSDW2HVTIx3xfXxIZK2fFwXMRlfxtqsh81vF1Mwjdgovr6BJgpzwDxtNrX
         /oA8LuTeZpi2hxQpoIoVjG8eeH0dWfYUfUYjAgfbPSlBL4wn3D7k1gvHRvvYr4cHW6AM
         mGCWgvybVFnIjx6rWf+Let/IU/YbdirRx1pOdFA8h6uvYP19WJNL62THIOiDqajHofJR
         8cRw==
X-Forwarded-Encrypted: i=1; AJvYcCWfMf47QguBYAebTf3Akbna1n8mGhabSqhYKWKIJFTWlylH7zboBGRt+paYd1eSD5uvcOHNO0rE57U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ7oYOb1NP7g4YZ9Fb+ehrfprYHaaUKy+qVwBZ7UiI9ab83c8E
	o3WKQKoRSmbKrRqwQwrKQp8QE17zM4Kqj64115qKIjYzssNB050r5VECeFpOx4Wvs0dhkB2zMAd
	1zAnFhXGvmB9n7uMZ1BYzqSUUU/rKNNqm91SxH9hs50jg4vsVzbBl4fv4PO2fPkA=
X-Gm-Gg: ASbGncufOVtwZ1qspchYGehaWVLNtJyZ45bKEI3qLsaovr7JKZck9Hf6p2cCZ2kqJOx
	/eMkKDoVZzj/3MNMhu/Ab6ec7OpwgohTkyA8d5tw/4c+lJRXEOYNlcIwOmnQbf2A/tfAj4PgJAi
	0TInHhN7WVaWiwWUOny1nwGTbau+kivkqitm7viwf0u3GVCG7gGqYss5kTBXQ1YYdE2Y6D5a8gG
	ie5HjpPDgGoEWcDpvotW7k5nx1cYMvAXIO+7YUEnS8boSQcvZiEFvagjB5TxCIA3hksHNVbIDRH
	qg1GcUe/HQtMJz3XrikrtvdCZpYlRiTv1JVHrCRfHl1C3l0Q6VsvsHzbMURTmmrveHUzJ7W7iEg
	=
X-Received: by 2002:a05:620a:1914:b0:7c9:6707:b466 with SMTP id af79cd13be357-7d0eac3ef5emr994661085a.11.1748845064655;
        Sun, 01 Jun 2025 23:17:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCTsG7gNV2L9uzFU78EGu/HBkU6UsfPpuVFGPKTZpetTg4RTTOeadhiy1mD9FC/+Ns4ZATsQ==
X-Received: by 2002:a05:620a:1914:b0:7c9:6707:b466 with SMTP id af79cd13be357-7d0eac3ef5emr994658285a.11.1748845064325;
        Sun, 01 Jun 2025 23:17:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533791cde4sm1476155e87.192.2025.06.01.23.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 23:17:42 -0700 (PDT)
Date: Mon, 2 Jun 2025 09:17:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: fenglin.wu@oss.qualcomm.com
Cc: Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 3/8] power: supply: qcom_battmgr: Add resistance power
 supply property
Message-ID: <4jnxp3pnr4aqy6jaqxnh7ki3uhf7q3552jxs3ixd6imtqlmrei@snohn5bjyt5w>
References: <20250530-qcom_battmgr_update-v2-0-9e377193a656@oss.qualcomm.com>
 <20250530-qcom_battmgr_update-v2-3-9e377193a656@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530-qcom_battmgr_update-v2-3-9e377193a656@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: NnAh11pO-7av__x471llXOG6vhLjfNR-
X-Authority-Analysis: v=2.4 cv=FPwbx/os c=1 sm=1 tr=0 ts=683d4209 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=zDes-GqUf9req-RX5QcA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: NnAh11pO-7av__x471llXOG6vhLjfNR-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAyMDA1MiBTYWx0ZWRfX4Gw2SwZXVSa+
 Inf+qyWbI4BoMeMpJJcb9qxUZl9t50sEbLSHzBbIVHVBbrihr+urBp/RNF8O0EBCewDF7SPi7Mh
 gDDmVa/NtPgs4AzXLPuEaJT6WxYq2EBRpmnTg2n2udbPxHSdeQTO0ryl8CiOCoQpOVAg7t6hsn5
 h/mnGp8/0tY4SDkZeFdvZErcBja6UJ2rZVmeg7M5yl/H4CiQR5wH/jFYlJgyjyB4robA1wTeiK6
 hCwTab82d3IdHTn2RHP2UhFagNLP9x5dZoA0SyHkn4eGDZS5seRtxcaYVr1ltovkepu68M1i6ZB
 JGNKPXmL3SMUKOmIgl+AxH5DKxapfrBc0YfN1t2q21X+3Q2wkEMgCUcXGjY0EcZ911ayTat8CuS
 O4ux1LR5MAEqamq0DBDBIAS/V7FFpw/AM9yEr8p9fpEXJZU2T0Qbl/PKTTx7xvcpNJZpEnKU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_02,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=820 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2506020052

On Fri, May 30, 2025 at 03:35:08PM +0800, Fenglin Wu via B4 Relay wrote:
> From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> 
> Add power supply property to get battery resistance from the battery
> management firmware.
> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
>  drivers/power/supply/qcom_battmgr.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

