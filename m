Return-Path: <linux-usb+bounces-33905-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NOMH2m8pmlDTQAAu9opvQ
	(envelope-from <linux-usb+bounces-33905-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 03 Mar 2026 11:48:09 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EE81ECE9E
	for <lists+linux-usb@lfdr.de>; Tue, 03 Mar 2026 11:48:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B9F9C3096A54
	for <lists+linux-usb@lfdr.de>; Tue,  3 Mar 2026 10:43:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D78339EF32;
	Tue,  3 Mar 2026 10:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YtJtOGVf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ewt9EGXu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7531539E6CB
	for <linux-usb@vger.kernel.org>; Tue,  3 Mar 2026 10:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772534634; cv=none; b=FMG7n690ITyT9gCX5t1Q+likRmCl0o7LNevdu/3kc6Ikdk1f4M0UeJNV9kztyuBxzJ6H4SZk2FFUacBp6eJR+zWQM520GWvoONNHa5ImTI0cU4g4fVvaLY+rqvjYh7eJfx7H4B0wgcT0s+nquKsBGHjK1tDCJxtV67oi32btuGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772534634; c=relaxed/simple;
	bh=siapKVSE/S3vs4PHnP9yQG3Bkp9vHFc0BHCat//8mAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EXcd39IIPf3gTOfzxaA+hOUYu6V0Zro9Ur+VubQIH6JMhYLojN4zJyz7LcWf+meLk71I+kIDzOF4A5e312xOITWIY2qCeWc1UcqfutLHjrvur725oCjg2Jn37uODjL5nOGcdUzpAfqz8o6JGmJgmGqKsUFgWbySolv2mBawvhUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YtJtOGVf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ewt9EGXu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239moCo2307603
	for <linux-usb@vger.kernel.org>; Tue, 3 Mar 2026 10:43:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5pfyuRWSZFKBUiCvDoDVhH2vGDOGKztJzoBqTTWi+JA=; b=YtJtOGVf9NOoHI3W
	68StTHpt1KJ7+GakFnnal65V/g91MVJ/aCgCVqM+EkhrvF/q3jVNd8Hy1AUCQC2M
	hGPRFxCQfQYVkBU3i+dOC63f9HNYBRTltipzF5KAvJ+B5Uc9bIQHMeE/TuGB8Xms
	nZ7E1RfKBdUzRZPA6ZwOmX2uGekHf/IfxwGDZFfI9UqAeUp1M/XNyBAUEeDBoOC0
	eM4dgbge7DlFk3L9NWCuaG4sAecyoNub5/c57g0CLTb42bRlNcgdv4/b1qssOmyI
	+97/+DQ2MmJgoPmyJA2zs8aITBcliAQ/6w41y/65eJrAJr8pm33xCvqYWuXm9BVn
	jYqxjQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnvtu89sm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 03 Mar 2026 10:43:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cbdd1bf8b0so130561785a.1
        for <linux-usb@vger.kernel.org>; Tue, 03 Mar 2026 02:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772534628; x=1773139428; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5pfyuRWSZFKBUiCvDoDVhH2vGDOGKztJzoBqTTWi+JA=;
        b=ewt9EGXuGQ6gU7pCo4bLPj4HjfLSi7nrNlvlE9bFM2QGZvKrs3KAqYWA3F6HAo46N5
         Vc0VdOw6W9gAWxc2UkfSrA81K3VaoyvuDiRXnRD24y1JKI6rrkXYXJgWS+WQGsoIdIQq
         0T3ABx5ZJng9CRRzjLwz/c6oI9hebpcwXG1s3+2IDQReueWAu3fan6dgcJaXloA9V/Yz
         j6e8nifyye6f5MWn2mhLMXtCBooT9PP0unsHKDPM90pFXiWBJyzZo7bCqmjKD8WlOaIi
         jONuETzB/WChgK4/0WqLQRVaMOooabLlGZLewVw7tgt8Dh053uox+eaB8HJozHkE7Yqy
         bSfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772534628; x=1773139428;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5pfyuRWSZFKBUiCvDoDVhH2vGDOGKztJzoBqTTWi+JA=;
        b=Z/w2vdLVyacTxMXrksTTs8IKYmA8JGeGSD5i07v4TTF3SzRnkeippW3mnvVAVnE+0Q
         /P35Oo+xRjfHKIwArCfBRGvz9xRLVxtArCPZTWFeVE9g1yZDIv2MvigG1me5hE2R5LCw
         cFUmEBWphwrv8F0aTBKyjJDrWOJ1wFs4k8BBdMIYd4+fMhR3L0I2aX8O+1boG8AqrjPT
         K6/kViEM3egKKHAndQUNNrSEuiwnZzJVrE+7gBHNavAaxzX760J92OHQx/aaesSaicSs
         d4VbkmTg7KWFv3uEZcKzQVbxF6YZU47oz05TysuG/2LQo7FLElXX2mLwfqmGaYgM8qgG
         hgEw==
X-Forwarded-Encrypted: i=1; AJvYcCW7PY2vKXXH7TWZtatoVOinRQ3TuKZ6o3Vw+aeW1oQTPCG5yE5Qb7rkjGr6okfbenuUVIT2rPdmclE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvcNm4dOHYZDs1xv32UKHLNzzUZoARWPhKats2KaBsEIjE4QPH
	SMuXsU4C5x6gHiMtwv+Nefj7MLT+a3gzvXgULwzDeeoFjjsgf0e6xarFQAPYQ+0Iu2WyN/Ts5ej
	BHAynYFz7uQV9WBzo+vKKg/sgoiUGVG5A3LJcryx8FuHJ2QTzm5ZhF+9uGnQbsUE=
X-Gm-Gg: ATEYQzzhsYS44pdFaJgUUywr2JJDfMgy9+jdI6PihuKtgpJFDdSmMU2BoIQJfxNLdbk
	baBqC3gNaCilSqv/7r+8aF+/4s9T4MA3a2pFva8vkIPqpeID2uluCjdwJNWHzlEyX9rPnAvq8xz
	WRcz1eceJT7FMnZmE/rG7A31uwbHAHb+wJT74bNQ68c8WC3XF6OgHeOI3YU2Dyx3b2Wypsy6SOo
	xvavT3e/N1FctUB9cYjS7CtSfrhr714gnKjM0Au/hp7ML27TDNb5lNk7RliREF7DwCQzij1BbYo
	f7gmQp4PB3VyPWVZwimO9ah+6rhORCibIL5qOemlDv+IKwdpEkbdNDIzcCic3wVFvh7nn7IPN6y
	DiGozRI3kAnKI+jvY2rB9o8z13eMZSFyrn6iN6XGkuXrRQv8u6/4HQFdG3Izo+kG6U3xmy0YYPh
	5Zk/4=
X-Received: by 2002:a05:620a:7014:b0:8c6:e2a7:ad1c with SMTP id af79cd13be357-8cbc8ef4245mr1455757185a.5.1772534628579;
        Tue, 03 Mar 2026 02:43:48 -0800 (PST)
X-Received: by 2002:a05:620a:7014:b0:8c6:e2a7:ad1c with SMTP id af79cd13be357-8cbc8ef4245mr1455756185a.5.1772534628089;
        Tue, 03 Mar 2026 02:43:48 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fac07b7c2sm4121165a12.31.2026.03.03.02.43.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 02:43:47 -0800 (PST)
Message-ID: <9c4ac0a3-544f-4dd8-b3ee-26a40a817e85@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 11:43:44 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v3 2/3] arm64: dts: qcom: glymur: Add USB related
 nodes
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
References: <20260302-dts-qcom-glymur-add-usb-support-v3-0-883eb2691a0d@oss.qualcomm.com>
 <20260302-dts-qcom-glymur-add-usb-support-v3-2-883eb2691a0d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260302-dts-qcom-glymur-add-usb-support-v3-2-883eb2691a0d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cA4rCA4H3jhXJ3Lq8l9am8splZuG9ibN
X-Proofpoint-ORIG-GUID: cA4rCA4H3jhXJ3Lq8l9am8splZuG9ibN
X-Authority-Analysis: v=2.4 cv=A75h/qWG c=1 sm=1 tr=0 ts=69a6bb65 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=o_jz2lA9kCOULBL2u_AA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA4MSBTYWx0ZWRfX3Wp2Z2Q1mQSQ
 nkshTBckTHpcWhZ02Yc3v+to0NcCxn5DuuC/1RKNWyp4OSv3FnJ9n7Cz1AjM6NkycF9wECOVmzX
 V/Vh0DCpXOC4uRwPBcUih6F6Lh+OrKRCq1ce0aJmdAFTISr2HAziVFfl2q2vHDvXkBSzt1c1hzm
 ISSj2HMUWxTA9ybRgNHi+/Y4t/epILzizjUg1snDqrTaNDHiWga3Bt+4VDYb8aR7SCl9AL7IQap
 PYOa1gh+YV67zPaYCvxJfZ6yirGjK9WuRYSv8+RVsmb3szPmP8kfJvBQP7JNU5/KBjkOHGQzx72
 tCSeZrnfl82fAmB48jVR4X4k8nxAM04m80+yuPKXgBK9K8azbtgZUIejYZl2pxW75xO9/lMJQK5
 eULeAypAPQE0sMsOmdD+kVXWuglDRE2zPZTnzsXEhQe/v5c4H5udRQaRB4gxlQsy3tZ89g8tCkt
 Nj7fXMR0dcSoWWavFRA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030081
X-Rspamd-Queue-Id: D4EE81ECE9E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33905-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/2/26 6:09 PM, Abel Vesa wrote:
> From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> 
> The Glymur USB system contains 3 USB type C ports, 1 USB multiport
> controller and a USB 2.0 only controller. This encompasses 5 SS USB QMP
> PHYs (3 combo and 2 uni) and 6 M31 eUSB2 PHYs. All controllers are SNPS
> DWC3 based, so describe them as flattened DWC3 QCOM nodes.
> 
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> Co-developed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

