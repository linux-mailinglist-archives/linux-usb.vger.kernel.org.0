Return-Path: <linux-usb+bounces-29793-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEE7C1578C
	for <lists+linux-usb@lfdr.de>; Tue, 28 Oct 2025 16:33:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BE5F424C11
	for <lists+linux-usb@lfdr.de>; Tue, 28 Oct 2025 15:30:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E08632E15A;
	Tue, 28 Oct 2025 15:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hhbZFqaO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C7133769A
	for <linux-usb@vger.kernel.org>; Tue, 28 Oct 2025 15:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761665417; cv=none; b=b3YvNJuUQEN+ZnSXSNIP2mhy+UTmwsv5EKIK46jrpP2d5UR7s16rN0iAdH03TvIMvOPZe4Oc520899tEEobltTmCmr9cwJn3/367FEljbAJM1fM2QG1XR5BbfnIk6zHZlMEwDTE8s4/6fyP1TTHFbVO2iCYCqeQ44zlEZPBi2/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761665417; c=relaxed/simple;
	bh=GYKf1Zkv3JxGImNaWPJcp2l4cntA4Qaaj3JKVyCraHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PWt0QFSGyo62kUkmOrXdpKPQ4qAXShOg8KziU8rlt6bRyOwL8qPDmHtNRuepVHzcakSOHOXS1P2vsknqduwONlQtMzcfZb/TkBpsbngB8BnYSRWOVETe4grrer9npw+67D+C81QFY+odxisMyS16lvHzn4iNIn4SC6fg9dawm6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hhbZFqaO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SEngW51973089
	for <linux-usb@vger.kernel.org>; Tue, 28 Oct 2025 15:30:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ziHqZ26Nre+FSZRTP4tBX/uS
	+PYMS+5i5oLrGECrPLM=; b=hhbZFqaOmXteW2bd4JXD5RuBAzvCex85WcsoAscz
	irviZx5zBy9QjeMtoSlW03/l8K+0Qj9oJee8Q1Q9CU2SzWZxCvHm+B469muBlRmP
	dr9IFYh9E2hUuQGkiM/KdVHIwTNaTw2YTtYYJ0/42XtTHWTQRi3rUFvMoCUCP6fv
	k9JqtjdtbAn/TU7INUaAR/PqVcx80TpJXPFigxWnUjmKAcUG4yAICytOdx88hqGz
	Gq25BVPyrl5jDklVoVJXPWaVa+W5zwqssdr8risfXEnQW8nMROXhuvD15R45osMo
	NES+EPHG5LWKjEcrx0UQFUkSXUCGrXjyrtRWdKT9W6ibUw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2smusdp5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 28 Oct 2025 15:30:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4eceefa36d0so96069901cf.1
        for <linux-usb@vger.kernel.org>; Tue, 28 Oct 2025 08:30:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761665413; x=1762270213;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ziHqZ26Nre+FSZRTP4tBX/uS+PYMS+5i5oLrGECrPLM=;
        b=lb3wzp01jDvA+eOKtBt+FMacwN2YP78dRhvhs9DoeUhc5OS10AdgO2fGIjL9mLKxgR
         QyNvdBnCxTqsP9mACvLr6wxkLE4wt5Y5aiqtzehUir+jGaeiQrafnR5Znk/L/oPKZJ+4
         e7eHlkhD4No9lF0VD2xTshfvb81yMRhPwhZY5WL9fzglX/h+Qv7pdIzga846FxqpQkWE
         ZUMVr47fcHBz4YB3ZO94HDrESyseeayr9stkJN8rGCHYA7WWUKHwXUAkHIa5DPI7BjAK
         qe3BJ7LWkDzrjfd0aL2LCnk6+qaZwXtXvL6wlr7WshUdpbxVdg3kyZ4sL+W71ah4MfSg
         evMg==
X-Forwarded-Encrypted: i=1; AJvYcCXdPRdGDEKSjozw57XbOFcV2Lh0LUn4SzNSu4NVBu42t89v/D1kCM0QaeqdfLys5kiT3EHHAwuYfKA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzC75SuVHAkAdygml7MQ5WEX6aaXvXWdQ2D2krPs85DFUDZzVmv
	ikNaZ5llX3VYByP4Hj1sH8I1gHUEEJyJb5ceZhHRoUeHWu2WiVMAQhP1Ul8BIVz2iXWqP31zHsq
	eJCg7Ntti4M/KZk3xc+u2MB6xpc2iYVb1diPgWRU2JXBUggY21i+ytDn9C9b6R8g=
X-Gm-Gg: ASbGncspUwp5IX2IzamNhWitvbHmyD7GywjdTymbwjy31ilFXVenRpQYORYC3vGj/Jx
	PZQ60wWPRzSA31W5OBCj52fNM0gS49hQnpJ++FF71FzTHa934c+2qL40j3T3uSikDppFACPFZW2
	lL3thaK80t3bJkmbQ5SRMqpY02kn+NeJeBzs4U7tlIpvUJS/u/1SaZe09qrdtwQCaMaIHyOcGjK
	KAYyORsLQzti+bmLru4p/RKiEzab0Tw5xR0OpoP1GQKZ8kUtzKZCqWeWXXL3AqqSVCZDdnmtu2s
	nalKQtXhJLQTROw75meeyoeJkJjlm0xYT6U/g6pkM4csV+soTmE8Zs8MHQj9TsEtRyvO3qMa+jN
	6mfTYQReJfzTQ3v3tU7yP1++87P1NMR0Klg9WQ0O8p7thxFz/euhFJ8QT97/al1S8K5qtaHCINl
	PGWdm/zyjPsyTt
X-Received: by 2002:a05:622a:11c5:b0:4ec:fa87:4652 with SMTP id d75a77b69052e-4ed13170110mr13343241cf.60.1761665412683;
        Tue, 28 Oct 2025 08:30:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGg7P7iCAoIlm72fWxC4E6hnb4vx9CUyOoG5mm3iPgoXzkpB/+xZKhybNgY3uywIyNmJeQepw==
X-Received: by 2002:a05:622a:11c5:b0:4ec:fa87:4652 with SMTP id d75a77b69052e-4ed13170110mr13341941cf.60.1761665411805;
        Tue, 28 Oct 2025 08:30:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f41cbbsm3174644e87.2.2025.10.28.08.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 08:30:11 -0700 (PDT)
Date: Tue, 28 Oct 2025 17:30:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: Skip setting orientation for UCSI
 version 2.0 and above
Message-ID: <mjgwv3soxgdcybkoo6xglxfpusswmjoyit4z3qpbnyhatj73od@ywmnx6vyupsi>
References: <20251028-ucsi-glink-skip-orientation-for-ucsi-v2-v1-1-93e936ac59b4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028-ucsi-glink-skip-orientation-for-ucsi-v2-v1-1-93e936ac59b4@linaro.org>
X-Proofpoint-ORIG-GUID: QC9CeJwo4L2A5iy3h4UuB8thvyQlQ6B7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDEzMCBTYWx0ZWRfX3hYkBwMvFXJN
 Q0wE5xCuFnVBPL4s/mRXJMK36AMTf4XSGeer8tZxI6Qhvsbjpbs96w4rrohSpPNDu9D5nVn38Nz
 WwNpvLKNziy4A/SCCpRJhA5Eb6MtAOWUUjRu5ZeX3ZDwFktEL8jqeL9VDHm4QcZrr0+A+PkmeAW
 Uf7GfmBNjF/vHFNr4As25IwVt8+jh/1ChhOWb0NHYlJLKUqAFNoRN3OeLBYL3Ci8ONbx3QeLAsZ
 SB/AWxV7xtalMijSQnm7nWI5hQlWf7+tXHX8eWosLA/A3nkPBMsgFmLt8FLCv6zGiHmRU+jixTm
 HFF8VobBhGNRs45BkEDod8FKqMy43JfcSddYvleob06jjNVjIeKyxc23I2w5a4UxNUCu1hAGkt1
 ShY65RmjTXzFVZUlgcZEGU9fI9lSTw==
X-Authority-Analysis: v=2.4 cv=IcCKmGqa c=1 sm=1 tr=0 ts=6900e185 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8
 a=KoMzjsMEiVGJI_OJEYAA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: QC9CeJwo4L2A5iy3h4UuB8thvyQlQ6B7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280130

On Tue, Oct 28, 2025 at 04:39:19PM +0200, Abel Vesa wrote:
> In case of UCSI version 2.0 and above, if the orientation is set from
> glink as well, it will trigger the consumers along the graph (PHYs,
> repeaters and so on) to reconfigure a second time. This might break
> the consumer drivers which aren't currently implemented to drop the
> second request of setting the same orientation.

Might or breaks? What happens if the driver doesn't ignore the request?

> 
> So lets leave the orientation setting to the UCSI generic implementation
> for all platform that implement UCSI spec 2.0 and above.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/usb/typec/ucsi/ucsi_glink.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 

-- 
With best wishes
Dmitry

