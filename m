Return-Path: <linux-usb+bounces-33277-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QA7tFPBTjGnrlAAAu9opvQ
	(envelope-from <linux-usb+bounces-33277-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Feb 2026 11:03:28 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C91091231E3
	for <lists+linux-usb@lfdr.de>; Wed, 11 Feb 2026 11:03:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 61718303B4CB
	for <lists+linux-usb@lfdr.de>; Wed, 11 Feb 2026 10:02:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E211366819;
	Wed, 11 Feb 2026 10:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LcpWnrAS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AWtM6CXj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D960A26F47D
	for <linux-usb@vger.kernel.org>; Wed, 11 Feb 2026 10:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770804132; cv=none; b=Tg9RviE1My3zzrl6AA85Pk3BdF62CVyoxnp9GAYioVbMivJvXsuaNDtnmBHs/H1aXTfori4ICKajAQ1c2X6aZ6FkVGdQIIDkQJuvEnmtsV6xLRDMaPfzTxfgxfcUZTkfYaA+bhqmMIZXFOVPye49D/YQ34ap2S74MesUzBL73F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770804132; c=relaxed/simple;
	bh=T72wuyPj1r6O5cCFPZ3QgK3AagwmM6jBQS7cfFgmDqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z8w3Qr4fGgC+Mc3659b0TgdL9wFtPsmJbldf0ZViMZvhY1ombk5JzmUgFcMt+qVxTgN9CY4Oo4YVC3GoA5L+CPkEyfXGIPh6mBMoOd9nnkrj3pvto+7KhQra8d/psgBN+v3h41oBrEgH3j/glxR3cywAxiJTl8k4ex3MIdsa9qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LcpWnrAS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AWtM6CXj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61B9Hiam4177320
	for <linux-usb@vger.kernel.org>; Wed, 11 Feb 2026 10:02:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nchpKVdYOXJD7jz73jWfX5Pi
	9SWnLk3tj6catvmsON0=; b=LcpWnrASbCMrGAblunNtuo0nExW4QrsPV1wvIXVQ
	YzPai8UCNNwRzT6MZuvxjLjvh2O0uOquduFrqyo1dey4rrjcUMKFLgl9ZxHfU0cv
	/DTOniWyuv7OQ/ZBqxH4Zz/R7y3O73Qp+TkitV6azeFQOLLssNibQRJ6PSkfgZlt
	xaQ7MF5mL0IEl1vhFsTNVENfc6yI8GAYWf/vci+ys2p2acUADB2oZv25aQMhqxPi
	zTRX9tMeId5yIn7n7C87+iJ/XbX/RtKYPSSIv/xIokJucGPe6w/rMq3XYs+zDYrx
	X6jBcSFoslQhAT1AqR/h2nVOCgdj6kondxSlsyh5JLlvGw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c879mk9hu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 11 Feb 2026 10:02:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c5e166fb75so2002610885a.0
        for <linux-usb@vger.kernel.org>; Wed, 11 Feb 2026 02:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770804130; x=1771408930; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nchpKVdYOXJD7jz73jWfX5Pi9SWnLk3tj6catvmsON0=;
        b=AWtM6CXjNHq1lgKpdM+OZ5T/XB+MqLzRV0HLgj8utJ0W6+W7mIROrY9pKT6rB4IHwQ
         0sExMyIVIP0T0uo4MVDZEJpQ5xs/kbDvus3Y50JhSaVfMpot1wv+Qrdm9IerIm+uH+gw
         2/JYdXJ7JJLsmWqxA1tv9m7gY4tsv7JNTIlVd5J2D5VuzBDC10HH0eMBnDUQyCCKM0eg
         y305Rw95eo8Guvi3gLm798ZHY1C641j2mlvie6bNj4OMorCsT9OL43d3SuF1DW/PZIUC
         Glaw2hQ5YLkpkIhO4C4po15GVlc3be9Kkzhlx1sJ4DJGzPYwjSy0Qptwh1ug7HtTPPE0
         BO9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770804130; x=1771408930;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nchpKVdYOXJD7jz73jWfX5Pi9SWnLk3tj6catvmsON0=;
        b=PSzEn+47F0PZNfKoznTWhzW30563BwNBhXgiyhYwo1OajgDEZgh/JPJj0FCvPszGT3
         hORddYcAYaVkiIIjNZb+Viu8RYTmsXDnT2sczOaaRqVUr6ySuDHi1diulgUdeCDArRJx
         f8N6JZllcmb7FepBGBj45/mwl1F/xb0XNbIufq6Z5S4vyiDc+6yLchkt2GBVNDPP+dtN
         zk4hpp6mlYAJ21tEcFeSKb8oSqK/+jF2DqS9uJp+9l5sWqaEKAdhXHDWA0ja19AqHuu4
         V2QXtFzztP5nRKkLfDzMwFpf6ZttmLFu2ckaA4yup4pTkJbvgwC1PnDWd9NdqEEcHOEo
         kkTg==
X-Forwarded-Encrypted: i=1; AJvYcCUzvVZ+8dlfmHe3c/4MlkPVCKnJaJVj4PTBv4D+YUIEPztM40pjm5aWK3TrqesOPvmKkM8kEzxRdyc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMdQZWStHbNNAXydseW9kQP2sBH76SQMJ/PAgfxJmyS6sbyv8L
	j0dK1xyyBE7D7oQMWEaZkGJcxGEVExSthbYxWhHF7Mb6AA3ngv2xX1uv/YYfJhlJgvP6G5OKBbd
	Oh+mbhxPXr8OTk2ZGhYp6TtHsWkmPn7EfKOnv5TeDj0YYV5+kMUAVp/270c+/Rlw=
X-Gm-Gg: AZuq6aLlcpEvNI9SlcCfS8CCdjs9AJw011WeLA6fhp68jBdvp3oTw4EKWxu3O891m2N
	bsSyUdT0YABIVkLUePlLGMrP9teLXIHuNlLO9A4qb7Lopmr0T5jvMZUOxa2+7WDNJoo+Uhyymcy
	QvbOnxQ9m5nOgAeCmB1rz2xwEWCwnKPQ8Rh0DR//byrevWowdmlqEI8HLwQXC2RFDsZMhENyuX4
	z/KmUVpS4AxhZ7C6fgzPUVMFcyFY4C9B/sb/90hgQzXeTds2IKXSaAYZM45+XcQBQpMqEZi/66G
	DaZaI5dBYvwA4I1IGvrDRzAsP2/FFXQ80FfBdAgCfPAu4/RrpmvORC6E0jUt27Zl3+mEwQpjYQH
	wxHpu7QHD+UVLJ44Nf8HPyJ1zOXHRBD87ovA0yFQKBc7SF9E10UNZs7UUCtJw2p7tL+HMLSyCYR
	nRKey+cth3hGRJcTzMktgLGjPZ0fd8BXRL/KY=
X-Received: by 2002:a05:620a:1915:b0:8c9:f996:81fc with SMTP id af79cd13be357-8cb2acffb42mr110724985a.83.1770804130084;
        Wed, 11 Feb 2026 02:02:10 -0800 (PST)
X-Received: by 2002:a05:620a:1915:b0:8c9:f996:81fc with SMTP id af79cd13be357-8cb2acffb42mr110722885a.83.1770804129592;
        Wed, 11 Feb 2026 02:02:09 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f56fe99sm242554e87.36.2026.02.11.02.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 02:02:08 -0800 (PST)
Date: Wed, 11 Feb 2026 12:02:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akash Kumar <akash.kumar@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: qcs6490-rb3gen2: Enable USB2
 controller Micro-USB OTG
Message-ID: <c3on5e56hqipudpt7uyam2cples3rhadpz324zeg7nebczsglt@bxuy5jzrxjc7>
References: <20260211062923.3794476-1-akash.kumar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211062923.3794476-1-akash.kumar@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=UKjQ3Sfy c=1 sm=1 tr=0 ts=698c53a3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=A-Cq-KxRW6d33O8yOTwA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDA4MiBTYWx0ZWRfX+XZOp38nLhGr
 VjprbpthXWwD6C47j/3COHCZYXOUXxYQscRKWOya8TpONF1WyZt9XVMO5IlAU5XNKj/22LfdPvk
 HycpC6LGJ1iFlFGUpZxwEA9KeiQ+3E+hTAqITaUqjo+jRWZ8cZT2Kv+UlKGAtCfPQsxQfcnwKw7
 QEsWsk086Fd0KlfzLlhfvYjSQPFJhVAe4Jsj7AOd1crtW4a70JmmMWdP4DahE7+ic+7w37d2vQX
 9BGvcAn434+WaxhD74n9QWN8YqPdvwkqoNDkugY05OvuRz3rcfnLWBanABVX9Qlhr2qsizWkq/A
 mR76wdjJMAlW9btoaR6IsW/Q3Bc9DZbWpMFvQuXZpy0I8ne977n49vh4EFvNnN3sNAVqyMDhd13
 FEcyFa+BMoVc96PJZk86byFM96ik/YkpC+fwIliEBLjJeuOTgs+l1xb505QG2EzFGcU6lwF0ff3
 4ygYmW5AUrk9mtZNTFg==
X-Proofpoint-ORIG-GUID: bZYH4cHCe1W7tdj4xZ694EvBYlrusjqm
X-Proofpoint-GUID: bZYH4cHCe1W7tdj4xZ694EvBYlrusjqm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602110082
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33277-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C91091231E3
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 11:55:51AM +0530, Akash Kumar wrote:
> Enable the secondary USB controller (USB2) and its High-Speed PHY to
> support OTG functionality via a Micro-USB connector.
> 
> Define a dedicated 'usb2-connector' node using the 'gpio-usb-b-connector'
> compatible to handle ID and VBUS detection. Link this connector to the
> DWC3 controller via OF graph ports to satisfy schema requirements and
> enable role switching.
> 
> Specific hardware configuration:
> - ID pin: TLMM 61
> - VBUS detection: PM7325 GPIO 9
> - VBUS supply: Fixed regulator controlled by TLMM 63
> - Configure &usb_2 in OTG mode with role switching enabled.
> - Define a gpio-usb-b-connector node for Micro-USB support, mapping the
>   ID pin to TLMM 61 and VBUS detection to PM7325 GPIO 9.
> - Add the 'vdd_micro_usb_vbus' fixed regulator (controlled by TLMM 63) to
>   supply VBUS to the connector.
> - Add the 'usb2_id_detect' pinctrl state to configure GPIO 61 for ID
>   detection.
> - Enable &usb_2_hsphy and populate necessary voltage supplies (VDDA PLL,
>   VDDA 1.8V, VDDA 3.3V).
> 
> Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
> ---
> v3: Added empty line between reg and endpoint.
>     v2: https://lore.kernel.org/all/2zztcabuf4hkixj445m3iiqdsmg7jju62e3fgupb6kaqirx5lq@2mhs5hcn3p7p/

And sadly ignored the tag.

Let me repeat it:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> ---
> v2: Fixed minor comments on v1: https://lore.kernel.org/all/ad294a50-027f-4caa-a9b4-e145f709b50a@oss.qualcomm.com/
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 66 ++++++++++++++++++++
>  1 file changed, 66 insertions(+)
> 

-- 
With best wishes
Dmitry

