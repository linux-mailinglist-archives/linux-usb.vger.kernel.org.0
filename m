Return-Path: <linux-usb+bounces-32355-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B39EDD21742
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 22:52:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 96B68300C365
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 21:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03ECB3A7F7C;
	Wed, 14 Jan 2026 21:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mK4jdVbj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gEfiUFcR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F07395D97
	for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 21:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768427530; cv=none; b=nWex3IpTxLj2ZEDh7n9u+3MSN5qp1wxpCIs4BL6ld9r0yvUkZ9p5UsLq4tuevOCpwhE7crAKw4BNADudAZUSMYBqWV4lDZ3Q2/NmYzNTX64LSSCTwgq6xqXd9WSJkkM1iN1lLV7n7xIAyho2wCh4MwjWQEYl/NqVuvnfXW+Xnns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768427530; c=relaxed/simple;
	bh=81fhX7f5PdSvnq13MndLfu9aSTxfFkW72ebZAQs4C1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DRN/wktsoO4p2tOytjUHSnOs/QvYO2dT/+BujRADhU+3nEF3tDDz+Bcykq5FnODMbELD+je0LNNQYjSWhZKFsXm7Ptj/1CiLNOfEzD712J2mgc3SNq3MZljidVKg4KRS37d6wp6XVpST6w6aSqo/JRlTdAYtVsvxei7YYKpbY74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mK4jdVbj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gEfiUFcR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EGjfUf2552673
	for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 21:51:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dtMMomDKoiaa/sSanq0+vo+Y
	fvjfXACcyNDdQCs1B7o=; b=mK4jdVbjr+jfkUTszZ9do7VfazDgk63inmACvPLI
	H91gLx/KctZ6kvLFBd/4DiSFPP1gZRgRTFFc8a4j8TlZywAsxIQQL7ZMrAUku/Nt
	yXDy41pnNW64wQAfAQt9vr+uthpa1CgWCAAiAk1BepSLqVDHPdj1aFvNPzgJbG5l
	8qmctFpucvxwlY/Ly+KP5R6HsnQ1T45TILSfpyRFmPt9brcyqCcclV9aylps5lBA
	BxpiPUaZfInVpDKtW/33oM84t3+P7t2orfiyiWrEcQumBg3q/1a/4Z7QPUNyydfa
	Khz3w8T8DsTRYfe02UjlIDi6VMnxQ0t03efOWcbYma+//A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp8d32eq6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 21:51:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c52fd47227so57024885a.2
        for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 13:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768427498; x=1769032298; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dtMMomDKoiaa/sSanq0+vo+YfvjfXACcyNDdQCs1B7o=;
        b=gEfiUFcRZsq4tbc0gMqKy5x02KpFN1+ECfqYriYhOGK5ztfyHB9Kg8kBoaGy/hE2Vn
         P0kOnMOrV7MdMAfV3lyh/jqZS0cz2+g98UJdJVGAxgQ07uxFOcn8Q/Wfq3wPDHAqyoSu
         Ia0QYsoYhg1XlE5UO43n5JQIPnlPgTTJjeklQAXdaxj/IyspAG5+wnCpyfCXU/wYTR9v
         qJe8meFjhGWZ2cZ8QYzR+YC5Pb+Cx9nhV12IkzfPNfllsBq5JeDyEGVBFw5z+73mSwkI
         1m7yyDRneSxZwC6JSUYHhqzt3i2EjRJRu+YkKEGPhm3l1Kuds2o2eZ17UWJMQrF1VGB+
         3rpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768427498; x=1769032298;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dtMMomDKoiaa/sSanq0+vo+YfvjfXACcyNDdQCs1B7o=;
        b=qNNQuwoHMh/tMaFeIX0PwMfQqs5mYP5/fDPTNG8gtfelUDVhWEU9DafscHRq4Ft3Qv
         7c22l2GWZ2Y/k4obJiS+9IvAU/QbcCMkFi9FcCYOv3FHP7dXPsc+Ec9ytDhGf/uBFLwc
         4ru9zibWUWy3jlxG47x8dSdVFqDeMwLpX7SCKYTcAdyKJpwqKpprC1l9/D1AIqOYVt7j
         42LdIlICetFArZRvCnZ2wDUuFQ42qV5npxTXAoMYhDk/z7fDeXzOgMnp+1GVlLGGuwIn
         IebISOqd58iTtWPgM7KQRKaYkc3ajjeMdcDtrUJw50z063mn/FAMyCLxZmOAi6MqaOe3
         uknA==
X-Forwarded-Encrypted: i=1; AJvYcCW5lcpnVaiBoi5peYq5m/XCB6qHtPabUsHJH3X2rKziuEyVPlz6JTCvj51DeDz5/DWVTCVRUkEw6O0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJeimKBSsaZC83MY84DwXZSeMuNorbQqvK1EmFrc9kzG/CfmY2
	GOT4G1747uXepbKSFoND7AKnhtvxMBZBW8yZJO/f0dwKjnaH+6h/Hr5SrWegZ2H6tGcDiYinpNr
	f+5ZAS9da1P3TWuqWDfYOMHLEYuOZmqSv+F724z1tjAYfBqXwW1tHIsLy4NBSjbSR0H+PEjE=
X-Gm-Gg: AY/fxX7BzUlhDimVa7mqCDnlM0Xhig6hD9XbFrw+lhoQd6YAr7etgvCMb5Eo5pgg5fU
	Se1HBwnMVTvmem6YiPxpcD1+028YJHscdXC2WIeLsFQaLJuqVD51/HF8zzdtTzYu7qf32E3spTs
	dNON7NgBXFpSfS0LS10xQkfElGs0BFc5DY4oQfDybZF6r4k2BHS5gM0svQK4wpV9HnnB9K6er0t
	KBDBze0mrlDcjyF3iOTQBEzAUR36MGDkF0N6uTOQcRFdsqGRy6P1yKyLHyb9s5m/LQvwpDkyBfl
	TAGI8V7JMAl49CIygplXZOkmREC00G/Q58X+NjRdHC7flL0WjJOcbtFGiy3YrjLhnpmaCaSyO6R
	kI+WQtQZA4azFHxPOqKURYU3PneGhd4iLjP7tJu9RzQJCNY+D7rusApgJRzLxa1JnwUaQzX+UE9
	W1a7OJ91xzevBD4pxU7hqylfI=
X-Received: by 2002:a05:620a:25cb:b0:8b1:adfd:f850 with SMTP id af79cd13be357-8c52fb05340mr600525485a.18.1768427498221;
        Wed, 14 Jan 2026 13:51:38 -0800 (PST)
X-Received: by 2002:a05:620a:25cb:b0:8b1:adfd:f850 with SMTP id af79cd13be357-8c52fb05340mr600522185a.18.1768427497734;
        Wed, 14 Jan 2026 13:51:37 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59ba1045ba7sm1054373e87.75.2026.01.14.13.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 13:51:36 -0800 (PST)
Date: Wed, 14 Jan 2026 23:51:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        abel.vesa@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v4 3/4] usb: typec: ucsi: ucsi_glink: Add support for
 X1E80100 compatible string
Message-ID: <gygibrsme3ojwcwp2yq7hclflc3vur65x6cxaru32lgquzlilf@q7bivtqbas5u>
References: <20260114211759.2740309-1-anjelique.melendez@oss.qualcomm.com>
 <20260114211759.2740309-4-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114211759.2740309-4-anjelique.melendez@oss.qualcomm.com>
X-Proofpoint-GUID: tDsXcj61xlK-KLPFGzNZF8jqeg8bxVpG
X-Authority-Analysis: v=2.4 cv=fbWgCkQF c=1 sm=1 tr=0 ts=69680feb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=BSYFvgBecL4qUoC9sTIA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: tDsXcj61xlK-KLPFGzNZF8jqeg8bxVpG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDE3OSBTYWx0ZWRfX0wV2HnKfRmra
 yLmHd7Zp/IJ/PEffwrdVFCvyzY4bTee9dHZb9+j2CS2sCfea7YjTER+jB5+el4mbtdYs8qmJJ10
 pRP45G559BivZCkSiOVQihVjXg4KuG0816I91kfsYPj7OePPQrauoh74dUCQcebD0amwIaOA6w0
 i7Kc4jZOq4xyIwe7ZyPqt8GEyWJh2QaYh0hfJOqKCf+z26jr4FvUFbLIf5du/8KNL3rCR5QR3o7
 /0QhRPLC2TtkWrQNtka7XFluyHyh9OwM4cGneRN0r90IeKFYMuNkvnPG8QW0JLUIPIuO2S5U3Et
 J4rnVLZTI/vB2O+E32fkjxZQw7DV7sPy0fPxsgbKux8kTozkGPkNEOlWEQjuZMw6iinKlI3L4Lh
 4YdGcpb8x10DtTf0ofSJhhKk/7RomTHkTk6mk94VN6568MOoph+J1Chefa6OrrqB7UXpEL6MOgF
 qSXj11ellYhdwE7rFvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_06,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140179

On Wed, Jan 14, 2026 at 01:17:58PM -0800, Anjelique Melendez wrote:
> Add support for the X1E80100 compatible string which needs UCSI_DELAY_DEVICE_PDOS quirk.
> 
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> ---
>  drivers/usb/typec/ucsi/ucsi_glink.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

