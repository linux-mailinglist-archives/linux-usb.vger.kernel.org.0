Return-Path: <linux-usb+bounces-34032-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EGWOzPHqGlaxAAAu9opvQ
	(envelope-from <linux-usb+bounces-34032-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 00:58:44 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 404932094A3
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 00:58:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 320D730419F8
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2026 23:57:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2AD039A070;
	Wed,  4 Mar 2026 23:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M3gyhoDK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gR1vjbCK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F08A386C0C
	for <linux-usb@vger.kernel.org>; Wed,  4 Mar 2026 23:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772668621; cv=none; b=Mc/PILiUN8r2gc0Vpvmmz1VeV5c4szCkh3I70C2niEusHgRfqyeBGKorwAZClNIaNGPWNEbpjXCEcVMH7hjsF5wzXfrSB0U5MotvWy4gRFluQvFZRnU4VHxsHErkNgF0FOs0smRuP//0Bk9Stveae1qMKkNoAyHjsTTCL5BsZW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772668621; c=relaxed/simple;
	bh=Q0RmGTaWyrNXkoqSRC4NOGoeVMXVms2krIlt4cMtsHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sa3Uu2Zh7fT0LXRnDumKOALfyHi7e5lV3E3yNNMmTSN3yAtEtZC52YxYsmlwNviLEqBAnoFYHKtUUnPyaBvDkIFTRZa4x7/UV7VspkhDQU2De+3B1VO4lN15r5d4+PHgC97Ius2wIzxn9tBSB7z4Wcsqp3YF9t/EUpVR92IRpLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M3gyhoDK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gR1vjbCK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624LDZjo1421862
	for <linux-usb@vger.kernel.org>; Wed, 4 Mar 2026 23:56:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=La/zyW1kZlkdjuba28Y6cKUE
	jgLjT1PdHqsncSoONxI=; b=M3gyhoDKsD95tRqPBt6AVRtUJ8xAewA9091Llh/v
	3N7WGAoRQBPzVIJQ+qMMIDlNc/bfennDxIAH2TEssBH789bj2CFI/9WHiWumbLtX
	Ql5cWWDkmHK/HrduZFYdFIBCxQbuZCUwt9VpsjOneOKdaQDvPYtLjUV+u71lyXmG
	dmxjU+qXynuSopTYtoQMCaamDnBl8AhwF8OiwiX39d0m+NMjaFXCFWCfbfdsFV2h
	o+l1R38GMJrzXlm7o2GPUvHPn1156OUgdepeJ2YZzwgJPRbOnHzpNxoiQgsN2xDS
	DJcDnZ8howbsvkbWgknRmV8ZQ+d0VG8z+7CPjjKVm1P8FQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpe8u3a9v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 04 Mar 2026 23:56:59 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-899f6e5b909so242413076d6.1
        for <linux-usb@vger.kernel.org>; Wed, 04 Mar 2026 15:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772668618; x=1773273418; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=La/zyW1kZlkdjuba28Y6cKUEjgLjT1PdHqsncSoONxI=;
        b=gR1vjbCKyyJ3o6dh/LzYtaTxAoe5c/LIKUCblHAON8BYJvNITHkv8oFo/DbiCRUIAO
         Q33H5pvJQ+hJNSyk+JOjoxonBKp56j/eStzc/dlR4xsCa0GWNOgznsm3tOdIopw1Hf98
         jjrnjeVnwm8drXGmiiD5Mkq05MjXvfm1Qnz7GbN9NVyLa9c7OHa9JLKTppRFHXd6eUBD
         BQrdctaQEDOu6udxmmKZcxQx46ouzDeA+QLx6D24K7tad9YN1b0WbcJFEOu2+Koi+bS7
         WTgpDbqdDklDlpFeHqq6sgAIrQ1uahog1mPwNTb6PJFKLBjNLMzIMCOHCGtSSJGCpPEe
         OGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772668618; x=1773273418;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=La/zyW1kZlkdjuba28Y6cKUEjgLjT1PdHqsncSoONxI=;
        b=alar7Zp6iGcjPLtnqyB0jjO8556CtTHGFcduR/qabo2FHRgiri0KW9FFJwdBXlqIeQ
         Jgm85YB1ptHQGLyFej+NUdy6mnMDuWCNwfcL0lMnpzYr3u5T3fO+fhAwyE3gVDUdmdI2
         OcEAEAg2bRTVaKFgOcbZibij5VlYdq4T0Eb0NsyWxUW4n9SHrusjjbuV896fu7e8XaMS
         gXfBdm2vNHPa34DE2sZNOJkld6BoHs9fvDoR7JdunSDYwyJeV8jb8TRv4JV6DjnXaF1L
         U7T2MHt+j+eOu9FGBACToAC0Juqt6fsnWzjc/MfOxf5Y4Uls22Uc9VUQn/rvWZ6tC3fI
         QkTA==
X-Forwarded-Encrypted: i=1; AJvYcCXVQ/S6KKcRt1SZCQQiIemV28KMVzx/6vCM3uFYhxdt+l1YYYnCQnyseU7qJ/G3KtPBygeTDMJfdbA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yym+BeKZmy196Ojej+odh5IITdofWjYQZI6dvJvx2gzQKRjqRXH
	U/r8MdKGTfLbACtkueDscTUOEgf2mYjOehhZ2Ay+4P0nBEEGT0lb1b9fmcMJeqReXnbLYsPDnpn
	yjvTxNvfmiI8RlwR/xgrZ7UBDX8c7JcF1azYIJml5s6csx3t5X1qertMGJG+htxU=
X-Gm-Gg: ATEYQzzFtsNf9Kfbvk1KkbF1by45KWNdLxbajLU+lbXsCBkBsXmkGvLIlyllv7EvInQ
	QtmNAYzRe7ULhJ3ir2VyWMwdwgI++GojWiL2yLj+Ci9CZSNUAsmZA9N3VVo1y9emG41CVK4egUk
	25j5d6d1FDCe32mxYliKSlXB5o17yEb7itNPurZPhKsdqxNcRqcErmTZyVR+zmSt3wl/52+lyZW
	OXYJO6DGpTIR7+Gky4thYRzlioaHFrTPypUZyQH/cfFey3KqAT4NbAVg4BX7qCgDgei7pSgx3AI
	C51n2eRc4OOddpZAYpBShoTScmK3d0H0AmHC9anf8XHia+PP/FIEGRG0R6sZWL8A/y39zWuv38X
	rbjL3o+1sJ+WH5OvCo8+EBG0Ud96RWOwjgiBjgXdyxSBVPVgWK1+zJwvR+FMo2rKYNJdB+SP1j6
	Zmm86oXVs9TjM0rOPGa+ULbNxJGTpHWIOMJ98=
X-Received: by 2002:a05:620a:44c2:b0:8c6:770c:40d8 with SMTP id af79cd13be357-8cd5af775e5mr481319585a.40.1772668618485;
        Wed, 04 Mar 2026 15:56:58 -0800 (PST)
X-Received: by 2002:a05:620a:44c2:b0:8c6:770c:40d8 with SMTP id af79cd13be357-8cd5af775e5mr481314985a.40.1772668617932;
        Wed, 04 Mar 2026 15:56:57 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a123573df2sm1571493e87.65.2026.03.04.15.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 15:56:56 -0800 (PST)
Date: Thu, 5 Mar 2026 01:56:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, netdev@vger.kernel.org,
        spacemit@lists.linux.dev, UNGLinuxDriver@microchip.com
Subject: Re: [PATCH phy-next 21/22] phy: remove temporary provider
 compatibility from consumer header
Message-ID: <o3yvtltydr5hvve2htwgqbp4bfopgu74ft4gnyelmges3hmiaa@wy3brdd5dnek>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-22-vladimir.oltean@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304175735.2660419-22-vladimir.oltean@nxp.com>
X-Proofpoint-ORIG-GUID: a2Zc3qP0wNz6_QkguEy8an-ZFi3Lbj1X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE5OCBTYWx0ZWRfX1HjNu+M9QiKZ
 7o7AFY87JTW6YOa6ssinQa/4XKNFrxpy+szt+YFWNcNTXiSdi5Hj6RMPJAciS5mbo+zeHJ3pVUc
 rNDu4VCOOY6lBcJWAhWGGcwvEff3dAvpUPr4zlZeeJkqDQDE9rCzRxGK4gdFes4dL6t91GF5A4e
 m0BtU74exC+F32TT2LlnpEEtkPbbIz8QEGH84X6MM/eKcdrypClKzeLmjO3ihzNny/3nvCVuYyX
 NdSP0kmhIa4rcaKdbL0MaGKD6vrggyIjjBpO0c5LqqVNLmvV1J7Y+oB+thSZis1w/M7+0YprX3v
 P9quwAbI1KnAn0HvITUlRxiizj98BicwU7GjtUPBD9uQZqCltfGcFYJdjVtUCPpSSXslVvLJSwZ
 goukthRG36ahXgWza4TQrMuObeFDGT4AZkDEkPiEpI4iexbBjodWlokClyzUgTg1jkGIF1WL62H
 EOw6njqolZgMMqv8UtA==
X-Authority-Analysis: v=2.4 cv=FpAIPmrq c=1 sm=1 tr=0 ts=69a8c6cb cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=8AirrxEcAAAA:8
 a=EUspDBNiAAAA:8 a=Ji6k5uvf-STsHdHMmocA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: a2Zc3qP0wNz6_QkguEy8an-ZFi3Lbj1X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_09,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040198
X-Rspamd-Queue-Id: 404932094A3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34032-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,nxp.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 07:57:34PM +0200, Vladimir Oltean wrote:
> Now that all consumers have been updated to no longer dereference fields
> inside struct phy, we can hide its definition altogether from public view.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
>  include/linux/phy/phy.h | 2 --
>  1 file changed, 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

