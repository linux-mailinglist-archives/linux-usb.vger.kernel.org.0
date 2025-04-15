Return-Path: <linux-usb+bounces-23086-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 811FBA89F78
	for <lists+linux-usb@lfdr.de>; Tue, 15 Apr 2025 15:32:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A55D17AFDD
	for <lists+linux-usb@lfdr.de>; Tue, 15 Apr 2025 13:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B61E52AF0A;
	Tue, 15 Apr 2025 13:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jwj71ZpT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1820013AD05
	for <linux-usb@vger.kernel.org>; Tue, 15 Apr 2025 13:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744723932; cv=none; b=lJtnQpZUDKKJPsicFCuvn1f1nIC1NGf0kYjnRKaQ7n/IFGg1CE5fcPqC0x7gYxuGtmySXo48pu2XQL3ssa20KNw20ekLyCmeJEfOw9MHgxHF85otZs0wT4YAtBDt4zRB7A2Gvh9zrDicPZ3dPfMt+hXzKq0fr0VZs88oZcJfiY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744723932; c=relaxed/simple;
	bh=mNmWI5a/NGto+Hyvm/KHAbdndoEXS5kAJAkq1uPI+6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GPTL5AM07Cea/2iXN/iU1kWDhP2lRejv7+XMS2cUJwllt4cNJ7omD3Wjlo1W2X5QYmgTTM5jdKesBYwhRzmvnOc3qj4SJSylK9QWW1CDBWNnsgwS7o6gG0EwLPrGmpe7fX/XgSNeo0c+hpPm90UMe999J1SRke9QFRLNddG8Ynk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jwj71ZpT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tDeU019556
	for <linux-usb@vger.kernel.org>; Tue, 15 Apr 2025 13:32:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tMo2J3XOclwxj1TWtY/6AjNf
	tlM4bSlyekUBY7EeXPc=; b=Jwj71ZpTou+Ck1S5OZ9bi0o2aWsoNJXy0ZkkF6aZ
	1WDVeyWlVD8UdWJTH2DuG8Levmhi/eKldN40YTdzMCuVmxRJ8GTlxp7+WETTsp9b
	obGnwvYi9oQdJzqNa0v0i9k1KwQ9WRgq+UEIjcweRSkZ8bxThYGH6ZRHK95i6YNp
	Vi7Rk3Zyws5vsUV/V8FG9RZRSac2WckgQZtt3kMoeqYQSp5I8z21ocmPQIUeG8Zy
	GdxF+y6ChfdFYhmR4533SxhtOi6588oha5IleqdfwzJyJ/DAu2JvfLAco70usxXE
	ZVWbmSGiqkm/BnFsOm3FSlva8fsNuQK98ESZnhdSf1vN+g==
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhfd04fw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 15 Apr 2025 13:32:09 +0000 (GMT)
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d43d3338d7so69493775ab.0
        for <linux-usb@vger.kernel.org>; Tue, 15 Apr 2025 06:32:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744723928; x=1745328728;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tMo2J3XOclwxj1TWtY/6AjNftlM4bSlyekUBY7EeXPc=;
        b=LD7VQmOfKSER0jFC5/YRf21qtrhz6nYNZRuEv3JOsq7uVTyZuFsAMbaFQivZRQySC9
         9ImJW7/v+zdV7OXFV0CQHQKz7mMPLx12BgQugtSWvtpXi9aGWksuZjLrQnnHg2EKy8Ed
         SZxPvcGuQRpY1Znr9dZPydZNktzP/x9CERMWkSfroBAN202JT3GoxwGY4UURJZUlaU5L
         B12KNyLmXr49xEKkZhf6I0XN+FL/Ok0Nx97uUD35erjUWW7hC1KtUOQUCns+aMkORtX7
         SCuAS6+cMUht2i7pALY30dXjsHEuJEbLPbeGZ81yHHVKIFzu7E7KiD3s1QIYG71FTgjw
         Q3xA==
X-Forwarded-Encrypted: i=1; AJvYcCUHpHwulCxEJpp4kqDx22Fyx3JPVvrfb/wZbX4dqGVPNPcOg0qY2NFXrz/dm8M1LcF5C233S4EdaEs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2rw/EGwONYfWtnLlcyCGEbCnhS5LemUjjBKFWFOOVvM+Hh8K0
	jnXIWIkafS0QJqgtVy4AzAol85ducQtARfKmzEVOY8dM+1K5pZya3vZ1Xhwk2WIKOMsUfVnOsv/
	/vqOnr2dt4p9iy67DuqX5YqiGnzppUqZeXzvjyj+kdsdXM9X9PFMTHMOMITQ=
X-Gm-Gg: ASbGnctBjxENjGo4Mbrg2YYJf46d9foxjxdHHoh5ZvBs028x8R5bBcCzq8HwjT/5ZLJ
	AUD7HPkmsxc0ocp2oXSL73qsbzvRKHiYK9wzkaEUs8DHswbAuamuxF1V88TgD8cOjNt4xTc9a50
	nA0G5C+Pe5l4MUeiYC6CxD6CvnDgn7GJv9f4GCk483KlAdAjbodlu3so9QDUpB+1ynG1B/3BKmK
	3Q3HRe5Ie45O32AMgQgVKYWTIae1rWHFIFopocmJ99HXAm3CY9RV9cXfg1UtfDWG7oA2XA12JL+
	7n1t5VOqS7jRqgbiQ522hiNC+HfLGOgxqbWYKLULDMlhN2Q4bS4WYuPItvmrwkqtygI7oBflRNw
	=
X-Received: by 2002:a05:6e02:1888:b0:3d4:244b:db20 with SMTP id e9e14a558f8ab-3d7ec265c11mr152477625ab.16.1744723928177;
        Tue, 15 Apr 2025 06:32:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjkRXsde0tZnrtNCiF/pKp2trQ13hfjPIvmR3Bsadnu+TSqlnAIYji1ttuBV+mHEymtp0pnA==
X-Received: by 2002:a05:6e02:1888:b0:3d4:244b:db20 with SMTP id e9e14a558f8ab-3d7ec265c11mr152477395ab.16.1744723927899;
        Tue, 15 Apr 2025 06:32:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465d48adsm20959401fa.74.2025.04.15.06.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 06:32:06 -0700 (PDT)
Date: Tue, 15 Apr 2025 16:32:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Michael Grzeschik <mgr@pengutronix.de>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH] usb: typec: mux: fsa4480: add regulator support
Message-ID: <j2ennvznqeihlfejwjqpxd3q76ifqm6djurvokbw6hrpeph7e3@pw3m4eohamxm>
References: <20250404-ml-topic-typec-mux-fs4480-v1-1-475377ef22a3@pengutronix.de>
 <aiechdq62mjgta5p5g3s33okgnp56fe5ing2va7vaaf74nerug@nvrwrgnoyp7g>
 <Z_g-Hl-G9IwRZmqF@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_g-Hl-G9IwRZmqF@pengutronix.de>
X-Authority-Analysis: v=2.4 cv=CfUI5Krl c=1 sm=1 tr=0 ts=67fe5fd9 cx=c_pps a=vy3nvQW9C2dqy/lMnN3IYg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=D91KrFGzpyoBZT2t0akA:9 a=CjuIK1q_8ugA:10 a=mHQ74H5e8mo-RpSg_uaF:22
X-Proofpoint-GUID: v6FbLcZMOAap3102omnCfiySk6_QF5o8
X-Proofpoint-ORIG-GUID: v6FbLcZMOAap3102omnCfiySk6_QF5o8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_06,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=723 mlxscore=0 clxscore=1015
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150096

On Thu, Apr 10, 2025 at 11:54:38PM +0200, Michael Grzeschik wrote:
> On Tue, Apr 08, 2025 at 03:18:14PM +0300, Dmitry Baryshkov wrote:
> > On Fri, Apr 04, 2025 at 01:02:20AM +0200, Michael Grzeschik wrote:
> > > The fsa4480 vcc lane could be driven by some external regulator.
> > > This patch is adding support to enable the regulator before probing.
> > > 
> > > Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> > > ---
> > >  drivers/usb/typec/mux/fsa4480.c | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > > 
> > > diff --git a/drivers/usb/typec/mux/fsa4480.c b/drivers/usb/typec/mux/fsa4480.c
> > > index f71dba8bf07c9..c54e42c7e6a16 100644
> > > --- a/drivers/usb/typec/mux/fsa4480.c
> > > +++ b/drivers/usb/typec/mux/fsa4480.c
> > > @@ -12,6 +12,7 @@
> > >  #include <linux/regmap.h>
> > >  #include <linux/usb/typec_dp.h>
> > >  #include <linux/usb/typec_mux.h>
> > > +#include <linux/regulator/consumer.h>
> > > 
> > >  #define FSA4480_DEVICE_ID	0x00
> > >   #define FSA4480_DEVICE_ID_VENDOR_ID	GENMASK(7, 6)
> > > @@ -273,6 +274,10 @@ static int fsa4480_probe(struct i2c_client *client)
> > >  	if (IS_ERR(fsa->regmap))
> > >  		return dev_err_probe(dev, PTR_ERR(fsa->regmap), "failed to initialize regmap\n");
> > > 
> > > +	ret = devm_regulator_get_enable_optional(dev, "vcc");
> > 
> > Missing DT bindings update that describes this supply.
> 
> Looking into "Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml" it
> seems vcc-supply is alread documented. Is more needed?
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

