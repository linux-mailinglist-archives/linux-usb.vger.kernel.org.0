Return-Path: <linux-usb+bounces-32878-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PHVIHPxeWnT1AEAu9opvQ
	(envelope-from <linux-usb+bounces-32878-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 12:22:27 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C5BA0408
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 12:22:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 30A63303AB6B
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 11:21:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83E9C2D9EDC;
	Wed, 28 Jan 2026 11:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OVGNQAqE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Aq4cUeae"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7578433DEF7
	for <linux-usb@vger.kernel.org>; Wed, 28 Jan 2026 11:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769599264; cv=none; b=DcGRM+PDFAlycAbNBFMVvSt/5mSnS55ZhLa62CNYN5jgh7NcTqv0go7iOYoLkrvSDDhWz8ql/hz1Oc705ePYTqDeGYfrZmOlQ85WkTleB+rTjrcFA9oxRYSZAFsYzdTcT4kxAXaGhrBhs1fP2Bw8OI8RVNEGYNIxxP5mFmiZXvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769599264; c=relaxed/simple;
	bh=0qnHLqAs5qKXRZ3SwSRRXmZ/pwA2WYkJLsmOPNdmiTw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oFBOqCU/NFGJEiafosENSV3315qbXZBn/JXvCaMm4yuhv69+K10NZ8ubNtq7n8t3Uepffdaqw461KZ2mp0L+yKqjxy8JPQZMa4XRIyyvN8sH0vdbx1JDqQMxflOVZ0XHUT3wP2JScIpJXtXfyCCRnBJZSlQ6FW9/SiURlddEWno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OVGNQAqE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Aq4cUeae; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S92YLh4008517
	for <linux-usb@vger.kernel.org>; Wed, 28 Jan 2026 11:21:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1g2tc08NYFOW9PyN0Q/fD1WgNK60ygQO4ur4eDmhFgk=; b=OVGNQAqEyJXdmDbO
	aX2gznPXCvBCwLJ4xK/OpqjbaCvvSwc1KeNGm/O01eQWMAlYDlKB9OJALSBfeL4r
	9xtn/GECQXB+R9N2zUluP7CwdvXl62t0TYrydk8Hucqk6htd6HktYD+XRIITjTmf
	xccgtRCt1vWAPxHQkm/RVAaCaOGUwwEkvgnSIZbMorPoTOgOqO/j2RaWBHGw62jG
	ri/Oo1v52yjuh8kj/HMK+NQZHy4gT5GrifNZGVKnknxs0OLYqWrawc5RDHl+cGPM
	nl6sOXory+jz3KDsHJ3c03uUOeRdbMJJRHuBarobuF6wiaYcpcbjbtNPwVEfOL+Y
	BlD9Zw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by1jx387j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 28 Jan 2026 11:21:01 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88a262380deso18756046d6.1
        for <linux-usb@vger.kernel.org>; Wed, 28 Jan 2026 03:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769599260; x=1770204060; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1g2tc08NYFOW9PyN0Q/fD1WgNK60ygQO4ur4eDmhFgk=;
        b=Aq4cUeae++b1Iay+KshBkvCrWBb6r06qWjifMQ8xTQm0VKSQiSKbvsBMEkEsNKy7ps
         yFS/yAI2BszpaLS/nSxmCx3R4JW8i9nBRZjj9/NYr8se+ywtVRYKSZ7M+pVwzHR/A2vF
         oIu6hmxc1vWiZH9FENZk1Wm0JjdsGURxgGfujy1YUywCbWgmBtIIlpk4JGaeuSMFy+Bb
         85w+VpzcwyeoZgOslntvwGwQdLbSPZZtT0WlTql1BktXdySBaZKHYwz3mvCTqseCZnrr
         Mts5it9I23Hl5vzSAkTQ8DQYw642Ch/7arpWsG2jq4oCf/fBj3KGBh7Q0h5JuhsphRCD
         l6lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769599260; x=1770204060;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1g2tc08NYFOW9PyN0Q/fD1WgNK60ygQO4ur4eDmhFgk=;
        b=NBfQq4M42c/wZXbETefwDNbKI40/XXEtnRR7kTh+zWZl4h5F4Lt/Wtmx90jrglryoQ
         UKT4Lt31103rGmP/XbH9J6U4kqAakP0EBdo2nZMzfSHViwR6yFmgPvrnMd7cbyN9k+uK
         VZs1dGIoZsURwHBcoDQ3sjnijhK83f7HGmeXmcaLazKUssbJNtjba3imHyLu/Xj9D1/J
         HeGkGG2njwqIySNJXvoPkIgSHMaytkiqTYxIGaiTyaf3Yzj6HQinT4jAxKvE3jBui2JB
         LMeScw0igHz7N8xRC+KIVkpR9zdDp+83OAWfxndB96WLSDvRt5FZFeQwzZIjgly1IUUR
         bI8g==
X-Forwarded-Encrypted: i=1; AJvYcCW+oUo9c9MP/3uwO3Uuoo1cA0SBdT/T3MZGACBNleobv04aorHNzQbb9Av2ZrJt6Vqxh2cDquBEoQs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKeTipVsjjnmRWDoDiYFf84wd/k0ZVRcjdzz6EbnpkrMLCEN1p
	8eFv918LnNOR+dlbLm06gWqPksM3bCnWvDLSjEvmmOcWMCf6b5J83UW7fldc3wQAJJKeNXq9FuQ
	di08tssYg+aiUZp/VapwnFSexOzTLrU2DYNETxDUJ9/fxu4DB3IOn0C046Hc4TF8=
X-Gm-Gg: AZuq6aI1V7OD3ig788WzfLCqwiUQhtpKTSm1QF6RF20tgz6SwmP6d7Z1abH1w94eHoT
	2Y1b5XofI4nTptKMZb1IKHqkJMwK3uAAINqRAH0EJC3cJQ9LInZ2sctRb2vUUPJ9uptfQIeil60
	3628sYXBK3teMcgzg/3D+Awrb4SERAr5w2lXF5g9T21cRoVtntgTlClyoEfeliXDKRk6TOBDQsK
	k53o1pmu/QXIxnWOPoR/rQI+/JpuHt4RtyoSHaY+9aYozEH0EBGj48cydRws9w9j2MV8HJ/bWMF
	Nli55pbxuYHPVmI8/dL8i8Gp1ELXlEVl9+LrT/VBVm+9YHk/08AWR8bMMC9N67YTnOBYCcSoP4H
	jR1/uI3qy/lFyKRyDyNrXKq37oYjSFMFCJC6+Pjppq5Y381PjR3LPxqCU5loc9BYNkME=
X-Received: by 2002:a05:6214:5c92:b0:795:c55c:87de with SMTP id 6a1803df08f44-894d786e265mr9868176d6.5.1769599260709;
        Wed, 28 Jan 2026 03:21:00 -0800 (PST)
X-Received: by 2002:a05:6214:5c92:b0:795:c55c:87de with SMTP id 6a1803df08f44-894d786e265mr9867946d6.5.1769599260101;
        Wed, 28 Jan 2026 03:21:00 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b44527eesm1422612a12.9.2026.01.28.03.20.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 03:20:59 -0800 (PST)
Message-ID: <56b686d8-d526-4e11-9b5b-b98e4f1f72d0@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 12:20:55 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: sm8650: Add sound DAI prefix for
 DP
To: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org
References: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-0-c55ec1b5d8bf@linaro.org>
 <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-6-c55ec1b5d8bf@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-6-c55ec1b5d8bf@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sZ8jBAqtKpPx6dbsdMXvjBVe6pRS7wfX
X-Authority-Analysis: v=2.4 cv=duPWylg4 c=1 sm=1 tr=0 ts=6979f11d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=UpTyAFhicMDBmGaZp7IA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA5MiBTYWx0ZWRfX6sUUz4NG4tgc
 KRAVAM2SSxq3xHNzdvYIG65irL0CcEXWahQeBhF/muRPpMN7+VwdWPo5vq0+73BDODijKg4MNxp
 dCH8PtHrVVEPxWpeEBDbY9V9hy2rv3TGb0W8BTDDkDExHFIuCiDVNTzDXA7UGoOew1Obsum7XTk
 f4uy7/QMPdyI6xchUEiBn6WpvFT10alrJjBWIJRxTPKMyB0XYtfhfyiMY3B82uVnrD8iTXRyE74
 1SgsPlD0E9VZiQJbwi1XdHpPwslUa/y+MQ+bIjjNxP7mPMvjKbQoHZgXA/YQ7MmS1PuNgmdFW1F
 J7YrI/8GCtPlovENyZzmO6fUXpTK9HDJWkyS30E+Kl6WeAmB2PTp6/Cww5E7oR+O3CP/n3QnTny
 UPbnTXBjZUi9OQWPTY1k1ckjnldIDOx+9JTVcqWiXI3DSYpPpLwzACx1uKCdcWCTDrHnh5Jrkkr
 C4IsuvtQVMsP72iAwsQ==
X-Proofpoint-GUID: sZ8jBAqtKpPx6dbsdMXvjBVe6pRS7wfX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280092
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32878-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linuxfoundation.org,glider.be,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E0C5BA0408
X-Rspamd-Action: no action

On 1/27/26 10:57 AM, Neil Armstrong wrote:
> Sound DAI devices exposing same set of mixers, e.g. each DisplayPort
> controller, need to add dedicated prefix for these mixers to avoid
> conflicts and to allow ALSA to properly configure given instance.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

