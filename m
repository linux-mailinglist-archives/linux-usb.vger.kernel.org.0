Return-Path: <linux-usb+bounces-37801-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GISmJtPWDWrW3wUAu9opvQ
	(envelope-from <linux-usb+bounces-37801-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 17:44:19 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A4F59122A
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 17:44:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2ECF33166C4F
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 15:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8CA73FBB4D;
	Wed, 20 May 2026 15:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ABLGKSIO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bL/IEetL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC953EF647
	for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 15:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779289261; cv=none; b=hAVJGTYrV6CYtGHqGGF39fPY9+vhbzyAlyDV8YArxyntmqnSBVzqkJ0cuLqOtF1LeE23U9p+osWfVeXjQ2iR7PPCTDFXgRlPUTPy0xRR22P0bg0XMvpGZRdqzshf03XPZqk6WmuC0d8oj6xmv85xRKRRK1s0/KKudWCmoDP6rEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779289261; c=relaxed/simple;
	bh=aNbycyeVQwWYgZDB8FQamAj2BcWvwEi9XM8FsrbOPLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lR6FHWpbHM/Vr0kID95JzqG3w+s65HldSDWzU546mV3w5BczgAT3foOH1Y3N44BpQNBF/91Hp1z3XPlzBlRhkYl4o6shjplbEYRxbtPnCVTWTekiPZL2Xc7tV0d9wy/yArXqqqqV0z8RIL+rJmP+63NA6XQg4rs5xBSqYxIBviQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ABLGKSIO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bL/IEetL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KBZYfK3085003
	for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 15:00:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hPMPfV+jKeq4uiwFwz14y19nQWZZMUfkCMfocNcW+AU=; b=ABLGKSIOt3Awpp/C
	5ZWvF6iwOAygNmdFQmXFukdPtes2guRmKs1MnwQ/AQFPh9yx07KVHraQKnYLUVKv
	ZQNTvmNptsKzErI1YzDqE2dOMvvGrULAShj0jifF5Uv4ZgvfXw8D3V1WGYgx5dSm
	U0d5pH5UDoG4JK3Q8DasGUYXmimmPAywxgKG5Vg3poAn8u5jqWVDbFhqOPhj/HKD
	CjjXgoVdyWRg94fFC/ZGjh6BfGIWE0F7yU/CLGeP2fjQDF4qib2/UbdDAfXIfSyj
	fxMv+r+jV2TP1/RceK/AuLuO1KuDigNveBYVkOsqr3whThwpdfPRErcDyixBpNhr
	mXNMqw==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9c7f0rwc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 15:00:50 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-47bcb08890aso9877097b6e.0
        for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 08:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779289250; x=1779894050; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hPMPfV+jKeq4uiwFwz14y19nQWZZMUfkCMfocNcW+AU=;
        b=bL/IEetLK8zhflnFZ9Ch1MqXmosAPohiABo0SlJP3lj5DNFZVpk5d9n8GNYX13sh8+
         EQACm6Dp4UurVjR8OrB7Rt9x+HxEGqIgakC6v1Bgnu6SAXvhtcrRst7evfBIcqJ9hxQl
         DKVp+Ybb/3AE8QzxquYqFSKZJ/cIqFn4QREXZ6Na+lhMNwXHvp5QnRFgTg554+x0ACjl
         Lxc7rsN7MsyGUW4hmld2MMCSNewZw0ohsWZCbAwgXYtq+2k1NotfCdYQsNDj2SXn57jy
         Tn2j8fk94Ykh5RA3LqPfisxTcPpRjyU6bzfMTyeDfJXnwJZB0y8szBWpJzXTVJd+LNII
         1WIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779289250; x=1779894050;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hPMPfV+jKeq4uiwFwz14y19nQWZZMUfkCMfocNcW+AU=;
        b=PcCJyyGhbnXyvCD+uW3dXiu4wgjxqOaWwjmy61S8A/Wf+GZ7Q836cLqAM2rtExxy3z
         zoI03koGwnQMGxtnMasVySqgvR5lpttTcmJ8Pq3UcRuXeZ3MlhWfUFc+ZgOK4SjL1sHW
         vzhA3GaJSIHYZKHcyptUy1Cc5ExFg/18W3Y7sTSpW+WkjXTmd5Iy1bCFIYYsilQkd7k2
         fMiSzcS70mq+njpi72/G206NkQxt8hIS/Uaf63/LkWAXiKRNKYwYp433yrJG6HZrzGZB
         Lw5kaPy1MYnDwVNKkxrRYMJtq1xDCiJtSiRYkXh5dCrOs6RX+JTS35h1fyep+xIG1N+0
         7ueQ==
X-Forwarded-Encrypted: i=1; AFNElJ+3+nlYqPtSAyRiOOnaf5jJsQEkqTk97kvVfRP3OMYgu+KZ47ECRMhXZoRLqAkcxj/d0sYkFM+oZ5g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyZZ5f56pIV0h6D1sB6SihOKGZPcaQu3QNeMAXSBB7Mh4/ceXh
	tzLDj4CP1qucI1XqUSyh3uDCWZRbu4mcusaLYKybnxEkV5n61YlB6MovC2+YJirz/CIkllJtbUw
	ymgMFg8BZGntcS5T9bkFbvdbyKLT/oU+15ZSmirmxdQqQEaYnTcb5FriYaqW40Uc=
X-Gm-Gg: Acq92OGZPDjRVB4XnsH9jJDB8rLKbypP7LA8CVy+pSVLDGL0JCQlRJoi9oAwkUsxAhu
	y+UnGm/VTfJ3CFs8HV+HeWB0aKxQCfypIpLVzManqRBA/3BCWonUhFgcJxLX/j7a7a6zZvv7ndd
	FDLWQ9RxzVky9304ueveVsj6VQnEnpiYf/9WmzJPfsNdEKkh6Ak8dY7cMOmdgpjYrkM0zuvaBag
	no95SoUjIRq9H/NpcKNTmKThBGn0OGptZVKxHuWQj2wllReQLZDy6AgXoKiJyn88g+guVQ1ggBs
	yLPZ1eRdoxoXTXkSGDnqJXZHUcU5w8AlflLCn91NmHJklODRspueUnUYmRd5uIjTOiWrSBRUXOl
	UwwKJas43yQiWrZD49GLysSxWhe7wdbbljs05VSgt4XI3bZak3jzitbhiR/WP/1qywi6Jm9mSKx
	XdwXe01DCe+xolwBJuBGtYi5raARlUgKBaGnQ=
X-Received: by 2002:a05:6808:124e:b0:47b:d914:48c3 with SMTP id 5614622812f47-482e55c73fdmr15061059b6e.10.1779289249647;
        Wed, 20 May 2026 08:00:49 -0700 (PDT)
X-Received: by 2002:a05:6808:124e:b0:47b:d914:48c3 with SMTP id 5614622812f47-482e55c73fdmr15061024b6e.10.1779289249148;
        Wed, 20 May 2026 08:00:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39588791302sm29267721fa.32.2026.05.20.08.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 08:00:47 -0700 (PDT)
Date: Wed, 20 May 2026 18:00:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: =?utf-8?B?0JzQsNC60YHQuNC8INCk0YPRgNC80LDQvQ==?= <taygoth@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>
Subject: Re: [PATCH 0/6] usb: typec: add Qualcomm PMI8998 USB Type-C
 role-switch support
Message-ID: <s4zaqmrpqdsrbygydvvr2dv6dxqx2y5ntgl4xmzp3s6s3iceax@wcebv6a6fvnu>
References: <cover.1779127507.git.taygoth@gmail.com>
 <918adf8c-14d0-4d9b-93d8-d34592aa04a9@linaro.org>
 <CAFPzRonyVt9Kd+Sc0ooNz8By6b-Zr_jHr0sBXv-M25dQ0w9Cjg@mail.gmail.com>
 <ee9061ea-8f70-4b54-af87-420179da9c06@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ee9061ea-8f70-4b54-af87-420179da9c06@linaro.org>
X-Authority-Analysis: v=2.4 cv=c/ibhx9l c=1 sm=1 tr=0 ts=6a0dcca2 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=LqtK9fWK-9dyvnwHZvUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-GUID: rebz3DdON51yvewUFW561UAeUCj0Fgy7
X-Proofpoint-ORIG-GUID: rebz3DdON51yvewUFW561UAeUCj0Fgy7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE0NiBTYWx0ZWRfX/slo0i3tu8o+
 ATLZISwdKCXzF3QLnIcLwhB9+KjKZwxtsXUuTvgRAcdGGhOJupUI4rcpktlSbAcEbr47ZKzG1RV
 RuzDl7SgRuHRTUQPeWKhucv+M7zAC8ejStxxLIdau7dAMzunv6Acq0/Rgjq0vZ7YjyqmEgVZRUW
 zS9PDG0PVm/vjcaWulnDpil7+yddIaCOKxub09ZdN4fewuUGzwdKNxCW+ZpjNBWFLtb6VT75Zlt
 7bo/jHOclSgctFT0v98rSgIjKyuErh6Q106wkfCHslsToNU4pllpHLQ1CJUhrFi2C8YSGmHs0yS
 DYxGJMMYWjkMFCVqEbMVO4+FQ6KdUcAga5wKYys4hGTAgbGiUj74C9wvXurOvyzoSHCE8kBeU4j
 mCj/yPMPTWRaLmNM7EKuTZNHbtGmGK9/C2od+dWM9wXiB6nlke14x8jfwCHiZk41Fu/5C1iJc9s
 Mq6KNY/cuzVakz1XgYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200146
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
	TAGGED_FROM(0.00)[bounces-37801-lists,linux-usb=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,kernel.org,quicinc.com,linuxfoundation.org,linux.intel.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A8A4F59122A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 12:43:13AM +0100, Bryan O'Donoghue wrote:
> On 19/05/2026 00:37, Максим Фурман wrote:
> > Three shapes for adding a second port handler to the existing driver:
> >    (a) extracted ops -- pmic_typec_port_ops with chip-specific get_cc /
> >        get_vbus / set_mode / set_vconn / start_toggling, refactor PM8150B
> >        code into the ops, add parallel PMI8998 implementation
> >    (b) parallel port file -- keep PM8150B code untouched, add a sibling
> >        source file with the same tcpc_dev callback surface

2c, my preference would be this option.

> >    (c) per-chip register table + per-chip decode helpers in the same file
> > 
> > Bryan, do you have a preference? I'd rather match your taste than guess,
> > since you'll be maintaining the merged result.
> 
> Taste - loaded with honey, chilli and salt please chef and add the whole
> clove of garlic....
> 
> My feeling is sibling file but please use your own taste/discretion.
> 
> ---
> bod

-- 
With best wishes
Dmitry

