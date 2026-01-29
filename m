Return-Path: <linux-usb+bounces-32891-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJJDIwuvemnv9AEAu9opvQ
	(envelope-from <linux-usb+bounces-32891-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 29 Jan 2026 01:51:23 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B8DAA64B
	for <lists+linux-usb@lfdr.de>; Thu, 29 Jan 2026 01:51:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F9E5300FEF6
	for <lists+linux-usb@lfdr.de>; Thu, 29 Jan 2026 00:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7003E2F49F8;
	Thu, 29 Jan 2026 00:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nhizYGFE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ev+WyEJO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C319F2EB5AF
	for <linux-usb@vger.kernel.org>; Thu, 29 Jan 2026 00:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769647871; cv=none; b=XQVXOpQHLQpghQqtdH/IfBb05vIHp0sf5jPrCaBebPqG/1pIwqgS9mNg/kaAomllCDMZeZQQUViR+5KZd42n68xfNTWkIGalNnxkv4GLHlok7zhm+bm29P9WKonlQOXmwjQtl4uGW19/JIlyWIJC4D/XNDC7DR3Td2uOXI42ICU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769647871; c=relaxed/simple;
	bh=XbGhdM5R6kglST7aIewJwl4vmHrrkLI83o4LjzUAOWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i/bDPEpBNngyUjsqWIGcsye36HtPV4P0GWBtf7AslPmwj3miWRQlAkcGwBxnnSazKs4gXuZ5dpX8PUg7kqAcey91+dftfE/cr1d3QEvAW8Yrge9lHUZinj1OiAXiBhm3s0QFJzPPof3l8M2gjjx/8y5bpYhe8GYVj5FDJw1STfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nhizYGFE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ev+WyEJO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SH4F7d1407636
	for <linux-usb@vger.kernel.org>; Thu, 29 Jan 2026 00:51:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=M+WZ5p12VkpfX832o5SO9e+P
	vKsqNe/lB/hAlOK3sLU=; b=nhizYGFEF52633CDuU4F8TIdryih2X4NqIejN8db
	TKdy7A8NYkqNhc+Xi5PQxc1HNdOln9lnwsCGcruzVQ0+aSBkhlp70Q5OFHICsuB4
	MTEcbA2Ra3cVw50EckPewbdt/0beA62X/XXBpPjoHYcBty5zEkOdMqgU2GCks9xi
	x3yi3EG0NG00xZwwV5KqabVpDNqT2c2ms6dpHPY6f4Fmfw03abvBoUOz4K3DefJJ
	6kerEiNnk1Uv53ysq09ZZa85w3UeD231qQbITqfeBLl5H3gzpsWzP+lS0DPizhVx
	31+suTnwCsbBugiFlLj9BWIFYdetlurQubsok5wkwseR0w==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byphgh7uk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 29 Jan 2026 00:51:07 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9483db35badso636883241.1
        for <linux-usb@vger.kernel.org>; Wed, 28 Jan 2026 16:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769647866; x=1770252666; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M+WZ5p12VkpfX832o5SO9e+PvKsqNe/lB/hAlOK3sLU=;
        b=ev+WyEJOZGfLx8/S8IfymMcaj/6GGK3Ip0qeQb2i0VkBUBvmb1HZNgWRBFRHmrNPD2
         qXIrT/WiDAUxfe39r6KLzVp4YExGJ/50l+fZ4mONFr58sJnoVXOcSkjU/qthc4y3/2O2
         g0jVHC8iFY7T/GkK1QE7rXYk12nF+zbaVFkwLfhHkM6IPNhODR/UCwfcr19c0AFQZWhx
         Hr5bZ1Wn8E50Q/PA++06LKRwrIYc9C2+9gxEJvhnLDFtQBzSjXg1Qv8HaPA7+KtbB1o0
         ZN6+kbsfB0vbdNAAvKpCKGf6MSaGbQYO0o8Yytru6P3UTaeDDV7XzYBK6MtwxA8XuEJN
         voFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769647866; x=1770252666;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M+WZ5p12VkpfX832o5SO9e+PvKsqNe/lB/hAlOK3sLU=;
        b=M2DV4zfMkt4VeOIWz/m6hdFDzaCZMosJfGuK/soc2+8/wkYAqpqsGkQi6JAYdHcb7+
         kp4sTQbqOMEI92C0xQZCIkpOGKZ5r0lr6djRpgYJIKIAjjiD4lUoxy99Zo/9r0+AugiZ
         HaSv95XQppk1aGP7oZri+ZeuV9O+VCT7Lq/vUolGmrdT5o3UF+r1Dwjoj6FhFZnC97rk
         i13gTK8IzN9cJ5DYUxoY4YWDevWa3ZmgWiTOGLohR3+r2dDrBV17AQXR5ydeB+t1nRrD
         fqhjx+GvS9G+YJHW8voEwlCDOLsjy8htmMkLGp7ZRyk9K+SqBcbl1So0+3cFT3Ikg0zZ
         fPCw==
X-Forwarded-Encrypted: i=1; AJvYcCX+e0HRoTnDlDgGNTZy/aUCb+v/SB7DDzthroYHDHwEUQewg0rmfjQWXl0uXCf6bBPT402ZqFtUU9U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyX3r1jqxOBrSQvqwZeVADedozuR6WG6JMt7LGXY9BifjjeRXb8
	Fn9liLIcorKjw30A2kOhWL9DzmeyoABAKc78HvGDrOPHWEwwkUUe+zboAq5lSOGKU5NKsGJ1IK2
	D7otpyDbjiWK5S5L/spfKAjvU2l0+cR8QSTYtmNEuz/hL/tpzMKMVBUr/VUjQLQY=
X-Gm-Gg: AZuq6aJUGifAHXI1lACNbV70e0hbdn1UrDAIgHZSiKgM5VkVr4WPoPVutJdOd+Q7gJM
	VgTeytOrgmTUyvOI09JMUniT3ECTlWUx78QMTZiRuFBaILLw998i0chZCR79EmFOz6TPlsPibSY
	aasgg7AX4IxY2K/5u4Jc+D97/lJH2YEkhyF4nJb+XfhMorjnyrOBlge/0Jb3svs91XbhH+oXss5
	vmLxE2Qn5pVgyinFcqF7lfjt9uH9IgeLp1aZdD38Bxfh/uAMe7Fe+XBNHzDZAJWYgYR1/dWgu37
	LOMBRAWA3vZJUYkzXeBXhTcTDKnnqKm5yRCVV/9LYCY1ouGVH+xbGJyB1i3/MIBqglN3EEww/WY
	veyQsnt+crx98VELKC+z6R6eWwKL796wm9gjGeruUbGScY3o7IIrZfU4UUiPNw1+TxhmdJagrWf
	mzd8U1saYz01WirQDsS5ebeLw=
X-Received: by 2002:a05:6102:32c3:b0:5db:cc69:739c with SMTP id ada2fe7eead31-5f723631147mr2251791137.17.1769647866482;
        Wed, 28 Jan 2026 16:51:06 -0800 (PST)
X-Received: by 2002:a05:6102:32c3:b0:5db:cc69:739c with SMTP id ada2fe7eead31-5f723631147mr2251767137.17.1769647866075;
        Wed, 28 Jan 2026 16:51:06 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074bbf55sm856387e87.90.2026.01.28.16.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 16:51:04 -0800 (PST)
Date: Thu, 29 Jan 2026 02:51:02 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-pci@vger.kernel.org
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: sm8650: Add sound DAI prefix
 for DP
Message-ID: <77qi3wlmjzdios6a6kqifsbsyusohcddz737fmdgmrgxcqlpsb@f2wkl7sw7nci>
References: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-0-c55ec1b5d8bf@linaro.org>
 <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-6-c55ec1b5d8bf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-6-c55ec1b5d8bf@linaro.org>
X-Proofpoint-ORIG-GUID: yRJOLDrFqvQqoXECNMxZrbJPDH_8Fz0u
X-Proofpoint-GUID: yRJOLDrFqvQqoXECNMxZrbJPDH_8Fz0u
X-Authority-Analysis: v=2.4 cv=J/inLQnS c=1 sm=1 tr=0 ts=697aaefb cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=YAN0IDdG5KZRBbBB4vcA:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10 a=TOPH6uDL9cOC6tEoww4z:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDAwNCBTYWx0ZWRfX4kK9PJBCfRUl
 87ZtmZdMevswFhhG9HEjZ8tUU5j5RLdFG4ozVAV7DYC/GSbg2JWsVBt1qSlM1ExPfjn57Sz7R+6
 sG7IT7B11mXCFlqdXeC0J4A5mRpILwr8aUDVS+ZPurA4HmY3I7FB4ZPDmmemDUuz9h3tW2mgu0A
 A4YGTMz640+YupKejJZs5NsYx6hHtdWuLzCzcCT4Pe/Uy+I3YnL9oKb/XUNWHVwvtyRdW2lWoRX
 HSWUN+FvF67edbE4JNvIIWeRsUC+VCBFPYDtLzgPnNvE6H4ldQUSukMrSdns4pmp+vy5OytWSJc
 Pzo5u8SvpnR8oau8QD70+qqMpKK5YNftUPtgfBl4STycfarLGv9l1fj0UWgboTDaSnZn5rc1+TX
 UBsNaf7MV8mkOsWlQflnROFuzemcwFimAJHh2OeUyWFe3sMsaVCpRkt/5smE+JxKEsQdbcI3yDM
 2WjDZoxLpCXBkuorGxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290004
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32891-lists,linux-usb=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linuxfoundation.org,glider.be,google.com,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,linaro.org:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E8B8DAA64B
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 10:57:33AM +0100, Neil Armstrong wrote:
> Sound DAI devices exposing same set of mixers, e.g. each DisplayPort
> controller, need to add dedicated prefix for these mixers to avoid
> conflicts and to allow ALSA to properly configure given instance.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

