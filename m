Return-Path: <linux-usb+bounces-28824-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A724ABAE63D
	for <lists+linux-usb@lfdr.de>; Tue, 30 Sep 2025 21:02:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 431F54A1366
	for <lists+linux-usb@lfdr.de>; Tue, 30 Sep 2025 19:02:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 189E6285049;
	Tue, 30 Sep 2025 19:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="prJio/p1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255BE26A0D5
	for <linux-usb@vger.kernel.org>; Tue, 30 Sep 2025 19:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759258957; cv=none; b=Cv3FAw6lbfs8q3hIV1QY82AIAN+YMK7NpNvMu9hjSiHwHBjo8l4uaSiv+SaBzZKIn/obxD25y3+HpzCJ0TOTEj1C70r8HzRk5UNuyNS2rsoEQxoH9Of16cQx08h/KAVm7ek2U6EOTmvIMy/OWzWEJ5ZNLf5fKt4b7zch+ZgsWcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759258957; c=relaxed/simple;
	bh=XaKjIs21h7X96FaSfZ/LjO9yTxhBXM+kXjoDRs+GPjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rJh085ahTfxibsI2Wb1kXQ+7Q1jnsBxemXvdEIYjJFc+M7uvo5Meed6olbleYZCDZAbEA41VZf0y7XHSBGZo9Qhs4lXpzPGbMKn/YUjWxDCpB73bTGKIH2V0y7yO8go85lDHwe2L6/UlPDDmy7K7cpdsjiV+12Q+4OOYrRBstcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=prJio/p1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UCDoIJ012468
	for <linux-usb@vger.kernel.org>; Tue, 30 Sep 2025 19:02:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GXlbr7M+4a1GxvAP+G3ZXjJw
	cK9AWRREeeh4emtmxmk=; b=prJio/p1Pa9iQoymrsQUzUwSwVlmy62rZ0boPOeG
	5Co5oHJaznpcAf7BJjir0I0ubdKav7gNDPOI3BNhzvNVU2u1G1uhd2a06abQovcb
	/saq/MhHYC92LvUIaaB4jaXLPQPJtLSaK0t5ErQB6rSk7JyAd3xDQkowIG2rxbUF
	957QygvR48Eomfe6HOQ5Stw7QNm7S+HdvSFGVn+tlzJkmY1II40Vvdyi9BTLN/oG
	i04nl4mMg1WS4TFSJNoHVcmPcipJi5BoYPhGwlfe+D8b8gnSbpNU1REPcDVYQYl4
	JGYK0P8WVNCLk9noVXZFSBzhqetljnENIu2G8LDgl2w9cQ==
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8a62663-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 30 Sep 2025 19:02:34 +0000 (GMT)
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-42765c940c0so53956305ab.3
        for <linux-usb@vger.kernel.org>; Tue, 30 Sep 2025 12:02:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759258954; x=1759863754;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GXlbr7M+4a1GxvAP+G3ZXjJwcK9AWRREeeh4emtmxmk=;
        b=wpns2nNyjcTuHDZBgjIbh1nkLS/55p8F6TSmmYq0Z1lduvDKA6vYiaFNOX6u2vmrzC
         79S7yyQnFdDCxWpnNfT1dt4xR22r2RgQitoLjOGhTGTQdM8WtJiuoickWcIG4YJdC7bx
         +PyUCQSwhHVlLCAOxVDjOs0CbJQ/LiFeUVIWCjLc8OjT0FxhbKYHEy+Qjt0xUmEYDbAH
         yNYgDE3gSFTzWNSBgWwQtBNtxSGYN56V9Q4+GXS6IEf8l+RgTrCV2ytVdeTqOHlNdbiz
         t0Ji5AR9WJUym2WXU9qfQXVlZJGckn1wJr4N22jahuVaxxnJxRr2MjB2BkbgrRJVWpU1
         Pq2A==
X-Forwarded-Encrypted: i=1; AJvYcCX2WDECTEbfpibl+rV/N4IOWnG06ctXxr0OvEBgmvtNor8UoryJeRO/g1mJWtTKAJTsTYOxM2+hIGw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUt1xNQOR985K0+8vjMv0ZhRk75PMYxMQvnPliHYOwF16aokFA
	y6ZMeV7/YOGJlVufH7//2P7Gh77nuzExXbRM17Q1KQWgDfUqCD0sI4+tP2Nd6txHHVOty0418kr
	ZsI8QV3GiifXg4Ohpx4kRYgv9hw3DmNdgxXrOB85LtWfHAo0DLEb+aTGDoH4PoOk=
X-Gm-Gg: ASbGnct8P88XKI/iK+PBhYJf8ujUUYhUXfIFsO/ssv0FaTfL9unjO1PJo25OV8Luq+G
	1eJaCq0zSuDHeMoObpkBFEeGEJ39xbwRxfaxbuvXT1Vr3jPNTIcP7b1/s1ng5nxC0DpTLFJddZe
	OHjZ//G0pFhS0Kvtmi0Zy/PcXDRhrst2hm9LyLJs2NgUKfzLzd9fG6d32/bCpufR3EZq4iU2a+3
	yQ6Q9k+Lnsy2EjR5s1rX8/LocrtgDqjJD/dcYk75OKU63lQtW2+fpacGD4+KGi5MkciWXCf8bXz
	xes0/bE3meniKsFpCI55X1a+y/d53dDJx2pEKyvVg5/RYb7OtySJAS0l40uqdcfh0ArJss9qAwa
	kJbiJepx8RnDDntZqiptUKDZ+9NY0V7/5wssT4/EcGlC5Yw6Gidq91OK2iw==
X-Received: by 2002:a05:6e02:230a:b0:3f2:a771:9fb3 with SMTP id e9e14a558f8ab-42d8162461dmr18055195ab.27.1759258953234;
        Tue, 30 Sep 2025 12:02:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJV3txOav9sQu2ukayU7ugj9yuYkFavKZlUgXjEWPN2HKtbR36iIvOChi6ogqZ1DDolHbXtg==
X-Received: by 2002:a05:6e02:230a:b0:3f2:a771:9fb3 with SMTP id e9e14a558f8ab-42d8162461dmr18054575ab.27.1759258952745;
        Tue, 30 Sep 2025 12:02:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-36fb7fe6b29sm35412471fa.63.2025.09.30.12.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 12:02:30 -0700 (PDT)
Date: Tue, 30 Sep 2025 22:02:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Romain Gantois <romain.gantois@bootlin.com>, Li Jun <jun.li@nxp.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: usb: switch: split out ports definition
Message-ID: <hio5xdgjb6oxejrnk3hy7ylro75p2ebqa6oczyuwuxk3xsbp5l@aewbvmuk3ldk>
References: <20250930-topic-sm8x50-fix-qmp-usb43dp-usb-switch-v1-1-060568de9538@linaro.org>
 <vwlshz5li23xlthn5delxwxdsdci5nc22iey3xih4qf5uhbory@clskdsy64xpx>
 <426679ae-03c4-47d5-895d-7c927b2c3b07@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <426679ae-03c4-47d5-895d-7c927b2c3b07@linaro.org>
X-Authority-Analysis: v=2.4 cv=RZKdyltv c=1 sm=1 tr=0 ts=68dc294a cx=c_pps
 a=vy3nvQW9C2dqy/lMnN3IYg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=jIQbB08qyBSz40biqjoA:9 a=CjuIK1q_8ugA:10
 a=mHQ74H5e8mo-RpSg_uaF:22
X-Proofpoint-GUID: PRHM8wKv9y1FqcW2Auq0B0JXm-Q6BszJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMyBTYWx0ZWRfXzx5iSimlcoO5
 DOWuiTTZy84tFIJJTx3qZ1XmMOg8KNq/LB3lG6mOlE2bCfCB4bGiIMOwLk8CyJlS3ArMJ1pv+Bl
 1BAjgH5E4zjVEIRThrvozudeRMVuZ6+lbD94/i0PuPIxyPqFIrEPhqU3GdMKz+Rq8M+HayNvuDv
 M0IYl3O34aCGFHGDOhtv2yV1dFQORR74N+hERmL45kW6jegCJXryv960GRoxajTCRYUZSdcQwcF
 O2DJnoFFYCbwdIOxgr7j1a41KBFxwTzeF62hyNFM4uXvpkw9So6oIOwHqjUXMEDa8OGa9lXL2AH
 /bufbZlIPhhk9RygQWcL5Co5SO1iN9b+R1yFHDanprMp47Ja4eSUY2iHepuITdLjSlr2gWtGtt7
 mH/ojusqXR6VM+fPzMoJaqoI+AcyAw==
X-Proofpoint-ORIG-GUID: PRHM8wKv9y1FqcW2Auq0B0JXm-Q6BszJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270033

On Tue, Sep 30, 2025 at 08:48:13PM +0200, Neil Armstrong wrote:
> On 9/30/25 20:43, Dmitry Baryshkov wrote:
> > On Tue, Sep 30, 2025 at 07:17:21PM +0200, Neil Armstrong wrote:
> > > The ports definition currently defined in the usb-switch.yaml
> > > fits standards devices which are either recipient of altmode
> > > muxing and orientation switching events or an element of the
> > > USB Super Speed data lanes.
> > > 
> > > This doesn't necessarely fit combo PHYs like the Qualcomm
> > > USB3/DP Combo which has a different ports representation.
> > > 
> > > Move the ports definition to a separate usb-switch-ports.yaml
> > > and reference it next to the usb-switch.yaml, except for
> > > the Qualcomm USB3/DP Combo PHY bindings.
> > 
> > Isn't it easier to make QMP PHY use $ref for port nodes instead of allOf
> > and keep ports definitions inside the usb-switch schema?
> 
> Rob asked to not do that... see https://lore.kernel.org/all/20250905175533.GA1000951-robh@kernel.org/

I'll respond there.


-- 
With best wishes
Dmitry

