Return-Path: <linux-usb+bounces-37680-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iE+UOXo+DGqPbAUAu9opvQ
	(envelope-from <linux-usb+bounces-37680-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 12:42:02 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3F457CA42
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 12:42:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 80F20316C5D9
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 10:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DCB333F5BE;
	Tue, 19 May 2026 10:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H3hkma2x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xurs1aAp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36AA323393E
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 10:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779186648; cv=none; b=OVFbW8wzT8XRFilpLBV8J3fzecKcf8hgKMedJsxnRO84PpuYWrgB0Bb3Pown53Jw/kq4aAbqXlAUTPcAW3Wn/j36/14a5a/Ci2TXQ7AEEgQMZnNHo4rBNPVz6PSCFP6VWG0zfKTNuEf8ApUBK3Dxk81Svw9eCUqSaMJHaPg+FXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779186648; c=relaxed/simple;
	bh=DrHYf7tqRQlk8+UMJlzpuLDOe7qhskYNuKQLTOdIGBY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=G0BUQgwdecUwT8pGgMdoExqbyPCxB1yPtGUINp02fdUoHiZPs2OO5+y2yolGu3f7Zx4vry28MqmOf1dzPe/FMEB3PN9TGsSHAKTGoQeCoIGrF6GLk91ZT7ikxb6017qtNHmvKsm6FJWetQFLSW+vl+T3eq4q1Q49vtuinyR0jao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H3hkma2x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xurs1aAp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J60TmR2437964
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 10:30:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mNNb3VR0RTAlc7kc9jSJqHqxgcj5jehGaItIcUWnHNk=; b=H3hkma2xRjIZtP16
	Csj0mBKxkVcPv6DtcNTKqaocgLwHueHcZ96igOx89nPEZTLo0fJ9INS1V7Mh79NV
	7AznsPqHleu7XeWJ8Y/4/g/hChEJ+LzyGOh1awoLzGuoTd1mm1um8VeVdKE/N5/S
	TNmcGp+HDNqGIstPoRY/aytFmoISjPIdhL6OtXHD2Pl68kYsmbthYWkanjP+G5WQ
	XX3YowAoooZcD+B2uFDBLf+uh35EUhmBCDSg3/JP7OrKujAMbBZmxeuOiR+XNspR
	o2zLdjY9Pn8Rf0iJCStGLm2OtM+pelnu06oBkVpSvVh9nvBIDvT2W6PnhVgz8Yos
	tSWmpw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e834v4j12-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 10:30:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e5c781193so8651571cf.0
        for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 03:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779186645; x=1779791445; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mNNb3VR0RTAlc7kc9jSJqHqxgcj5jehGaItIcUWnHNk=;
        b=Xurs1aAp295XWToBaHA2/tCFXYbQ1laT8Ar7hUOnOFfKY9yP0zf1tgJ62LRtHritRK
         7akXy3+2vn6rRASWeKE93HUaSPVoIdbolIH+d1wqHVce5V4NRMWG/HX47rnMNiFaWeR2
         VnDJi/NK6nWheOsJeA/UyfQqeNfaOm3FpftXXVq077vnkV7g5E/SL5k52pYs5BHJs2ia
         IXSifVDL9u0UVfBEODlP+cJvEU8WrvQnDGSstxvuGci8i20/CVq5av26Z+FsQmadTsrJ
         QIpZ7UpcM7gQYpVX8VCkWH2acqvTRsVRjXEFSxa6vsS1mSUvXEy887LcpQzuRt5jmnex
         tEXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779186645; x=1779791445;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mNNb3VR0RTAlc7kc9jSJqHqxgcj5jehGaItIcUWnHNk=;
        b=nzNWiRzWLo+hppDKYuPO4X8NYHkVOl87vMtXZA39cVSuni6veVvrVtdvmxELJWWHqS
         EUPL5YxOgTfr/xz7xAMkugaS8lrDdvXKbZ/9Pz97fJeWbjz+YtWuemSVS8UVvUTohWOF
         +9QkdhMZm7SRC/eft7g7spjYLibO90AWn51g4b6HzHlI+X/h6bwde2bAS+B1ZecJGM+i
         +57ku3Cdm210YLuNYMa7eLpkRYJ0sLMmGBYS+N+cQu2k+cBbnk/VoRE6R8lP38qfgy3L
         wGV7wnDrEkZkUX47ztKEbxuAYI3zX5k8C/xhAsv4MypUNoMRJexDGN09D21i/wzFuzgw
         RN1A==
X-Forwarded-Encrypted: i=1; AFNElJ9OyDb9rLyDXHwiI3SO2fzoONwwTkRAz+0Vz0OMzRrpPO37DApSUJ7NvZUy+juPPMoa0uVmhm/wWOo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsgUNIDQM7bVwgEb7ZvhEuYlAXAhMhofwE0UThQMV1R8F6ouG0
	AMmZG8XyAWsAyEN269WitbNWdeHe6rGqJ8cn8e8J+6x4shHbJ5111PxESvhMuJ9wpmHPa16v5tC
	e2MSqXcwlfZdT8XMtGxMp4tUVwDgh8fR0NoOBA3eWtUKLG/Vyz3W6MYvARoDbEMs=
X-Gm-Gg: Acq92OF+Tvl88qe+EYXDnh2iL2qFUm8ThPd7y8+0mEW2uEKalN4eecOB3ZcH1bMjhKi
	4xuhEjGnNw1t0VpLKZiN2Rx3wZePurGVae0ppa0W3e98ZlGS1FeXEhc4iMGwUjn2Bm8V8cEOtaM
	Yjqwp891o3qzYE54a/TGDo9s7FVHFmyQ+ssCq6xzLmpEOHGBpNef7fpYrzSUJZX0ksZ91DSXaw1
	4nqr9OysK1UUh+Fo6n+UrRAajU3buxW1AESe8sWr9k1iinIAVCrW6W46VSGcjPy83KP7KMPvncU
	OKlFr842sUoNa8zql6S9YUINfvGKf8qPf7z5vmhF7qjUz6oX0ul5SM0ZPq1+GO/LmG6kckSWnjQ
	SPmUjISgpfXEJTvAeQrqGI5vKD5zGNz/TQmG1bnAZ+r0NOhrfgJzjIOAzafc5d3wSNh4EdHppmx
	XHFGA=
X-Received: by 2002:ac8:7dc4:0:b0:510:144a:636 with SMTP id d75a77b69052e-5165a22eb4emr174859211cf.8.1779186645638;
        Tue, 19 May 2026 03:30:45 -0700 (PDT)
X-Received: by 2002:ac8:7dc4:0:b0:510:144a:636 with SMTP id d75a77b69052e-5165a22eb4emr174858921cf.8.1779186645103;
        Tue, 19 May 2026 03:30:45 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c24178sm692805766b.15.2026.05.19.03.30.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 03:30:44 -0700 (PDT)
Message-ID: <6773be1f-d48a-433d-927d-f2a90e56e82b@oss.qualcomm.com>
Date: Tue, 19 May 2026 12:30:41 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: usb: qcom,pmic-typec: Drop redundant
 port
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260519100014.282058-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260519100014.282058-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=F9ZnsKhN c=1 sm=1 tr=0 ts=6a0c3bd6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=nMIgit4TKir8xPiZD48A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: A7J-kLEu15IzU4BnZU_h2AsBACwZmfes
X-Proofpoint-GUID: A7J-kLEu15IzU4BnZU_h2AsBACwZmfes
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEwMyBTYWx0ZWRfX48vy6Zwalgrx
 nQ2d5baLvSeg5QC+sP2BCp3r48sIC93uBr9qdY/MSMnKC6tcT1vd1SeVvvgCiYgxqgEe7pzNZXR
 RAVF3Vrdpg9L+DrwQQXiSwzNIsC5gMebqHCg2+u7Ex+jX5mdDsei8aRNpwa6m0A7si8hQGevK+J
 /IHjFB9F4m9u6HVdDsmrfg1x11uYqA31d20xDIdnPOyiw2kTiPzWyP1eSjJvIaHtBVxh0psxI+y
 UC8fdgiKAi++kLJ7VPLZdnxzGwYHHFTR1/Ja8DJrBMeGZt2+o41zT1khli57bXaQAYLRxNKOuEQ
 TyzwXukMCsg1l4/1ybNk2z+NmDxj1lb6/Wrd8rCFI+z+eXvrSfamT4XMRTRT0q+77rnJjqPeJjE
 m6lf9xcctOEOBItSIRgfMP6qsAcpyRMEEPIqRH8TArtafBaLud+QZxfppbyu+jf/sJBTBaVIF7z
 IuqD2ijr370wjjZf4Ag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190103
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37680-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4C3F457CA42
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/19/26 12:00 PM, Krzysztof Kozlowski wrote:
> The binding defines both "port" and "connector" properties, where the
> "port" is claimed to be for "data-role switching messages".  There is no
> such dedicated data port for this device and role switching is part of
> connector ports - the port going to the USB controller.
> 
> The driver does not use the "port" property and there is no upstream DTS
> which would have it.  It looks like it's left-over of early versions of
> this patchset and is completely redundant now, so let's drop it.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

