Return-Path: <linux-usb+bounces-33273-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iApnOM4djGmNhAAAu9opvQ
	(envelope-from <linux-usb+bounces-33273-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Feb 2026 07:12:30 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 60660121911
	for <lists+linux-usb@lfdr.de>; Wed, 11 Feb 2026 07:12:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6703D303EFAC
	for <lists+linux-usb@lfdr.de>; Wed, 11 Feb 2026 06:12:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 744CF34EEE6;
	Wed, 11 Feb 2026 06:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B6vinRvG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FJIxDVDW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A9D33B961
	for <linux-usb@vger.kernel.org>; Wed, 11 Feb 2026 06:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770790347; cv=none; b=FxPIK3+q/9syRf33HT2WOn4xuXVjPOwxcCgM9qBVwe29NpjM52kJfCv5SMQreT64SVhkdVMzfbKLQ5YvgbpK4BdKVoxDMDMVkA0DgiHoJ0tvkvDPmwtiO+nYydlTSUxzpBTWgP7QlLnJfkkGBOgQDDJrPO5LPDsHXY8DpAYlxOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770790347; c=relaxed/simple;
	bh=BGN2rhjhQfVk2QgMoMDwuUsHKAkkfQjTbSXUetjedKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cw6XnLivFcx/NGDAFmwWMfuDpYaEYPVc/ss5LhH4jjYsaXckhqNYZraIZHVAt3PxRq2GZ7MyoVHh65CQbWI0I0yoGcWofzb392XjbfKtWNd84EAD+mJUIEn5TAvyF/05m9s3gBF6EK3PdoBRgi08FB1jS/6Xj4k0Wynt2cQNFTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B6vinRvG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FJIxDVDW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61B5Q0FS2640968
	for <linux-usb@vger.kernel.org>; Wed, 11 Feb 2026 06:12:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=j9khDJwC26k6b6vyvHB5IsQv
	yavqAsh5XUOPgKVhYWc=; b=B6vinRvGnC3BYq0BQO9TY0/3mqqtzKoWe4js/hS4
	OnTDuX96dd1X68PYUuQKLVEqWbOQatppcrg3Fva5F0Jlac9uYIIJR5gdXekD6qxN
	N/Ssns0oXdtnpPSXpL/nt8gPu7sPA5BzkgXjDeT13+9Ost7rQJy3o4vHZGujYBSR
	GTXjcC6Ozr8WRJZfcARtCqJnyh9IjpNmGAmOzsN9UOumfhwXV2kzJlyu2AX7NvQu
	w2fzCmxEewq2r0GEJOkxyUBwftXO/wWzHsQv7quwe6Yi8/CsmUXXMvNuLHngj+e1
	0KdHbSPO4pXfxTaeySKDBZEN2lnpfgRdhohnDq4cnLjJ3w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8bgnhm12-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 11 Feb 2026 06:12:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70a62ca32so564825985a.2
        for <linux-usb@vger.kernel.org>; Tue, 10 Feb 2026 22:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770790343; x=1771395143; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j9khDJwC26k6b6vyvHB5IsQvyavqAsh5XUOPgKVhYWc=;
        b=FJIxDVDWkNEHY1B8Z2MZjs7dqaiQQYPnb/SkRXJJQGzauvs4wtBHdFkVPgIhrTDUBz
         wa8P8u5G1hiYlLaRZdBWQ/aTC2QDxX3yUySzWZq9c5oOLJzkv2cfZx8J8dwAHDEn1wPK
         Tee+MuUAoqm9I6OhoFqkMdpBxKa3865VdMggUXnRrYDwgONHswuXKVQvBm3uTKY/opuk
         x1SMCr5brhtkvAzZYyRDlFjKstnzdkNim4Kms7s+WHheHYUP3Hw3mhhsrARVepwR3qWl
         mkpLLyBcKHIFJQRpA7sNsgISSOACgvaon3F+BRFnNQpqEZZyktn3E7pd7r8l4gdGbSct
         mRPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770790343; x=1771395143;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j9khDJwC26k6b6vyvHB5IsQvyavqAsh5XUOPgKVhYWc=;
        b=nAuWLy2Oz5otu5LpmLUkZAP96GHa0CBb+WC/a94n+iUI8UyGOiNpJeC/kshydVT5C1
         oeFwsDO9GskGSBvGITzeBSXOAXqKO7+i/V07LZKA/6Sy2W4qg6mhYegN+eBcyrdEmmW1
         4NpbNsCujgesP9zi1xX32BATftzfil4x7aYEK1E7aV/EO/IWIxzNUjhFnEJasVZda+KF
         QfdVd3cUqwRl3jkwzbWxNaYFG7KyhFPcABrMGBkS09qZD+jtbqLc531YAL/1UIfbxF92
         HnlAnO+cb+p8XUmmhkLRRroq0zvVP4hi1D1MumjrGrzRAB241t5jem0PURNCftlm2e6l
         6Vow==
X-Forwarded-Encrypted: i=1; AJvYcCU5r/W1HJo5mj6Oss6q1yALckrnNF8ybmGiJak9YI//D5xBtc8RHc6rmXz+iHO8bOgt3UQVsz3Dpwk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwN5+Q/Z4LJs5L+zndRCWjOwnLuaufwAqNFX2k/WW7Olrqpt6fy
	NwmgUCMJvAo0q9osAMh8ZvtBMdTuU+iUrq3lujUukhRv255ibfXNtE0Kky4jsi9p5d6dYvdYVLI
	iCRUc1JC6opbx/uzE8Rxu8CRZl5+CFX5ZVAa8g1IGENzUXlPLmXei3QLBCknDe9Q=
X-Gm-Gg: AZuq6aJFyM9FFd+I3SShnXyd/MiJvEnhb5VhCYE5W34lLzqDhSR84cQ10p9Q6dW1dPG
	2BZUczt6Qo23Cl1an/ikTpJyfQMyv4yYR2+Leg6vf/AKLfnmf9gzgpeSGbnYYWDSlzf4ki3z5NF
	NEFW5CTcQ80h34Wvb1bFemaXENicB+Oj7MYl0neEPKx6c43l/iMI3/2uDB2ccFnASm+5t47HsIx
	hNIo6ru24Cc6grJQMWxtWPNkKgkqk0SyNpo2mr9p76uXDyPZIaf1vYvhYzcKTa1pHralSBsjh01
	j0DOpvP5WL2QVHk4bpyYqB2MndPmg1uiAtcUF9ZuscMCjwWU87rmqHYmRQnKf4ysvMpzVBcvyVx
	OdKEIeUv3iB4JezWNJHbVHMwsWD54sQdied10vC8f7uY/f9IdYZvGAXp1WTRUkrcJ2pBVbzGJ51
	EDpw/8nQ7wIMRKsVJLLMqZ8npKcyDSiGBsgDg=
X-Received: by 2002:a05:620a:1789:b0:8ca:2baa:6658 with SMTP id af79cd13be357-8caf238e3bemr2165205885a.70.1770790343604;
        Tue, 10 Feb 2026 22:12:23 -0800 (PST)
X-Received: by 2002:a05:620a:1789:b0:8ca:2baa:6658 with SMTP id af79cd13be357-8caf238e3bemr2165203885a.70.1770790343112;
        Tue, 10 Feb 2026 22:12:23 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-387068e5df8sm1333581fa.29.2026.02.10.22.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 22:12:21 -0800 (PST)
Date: Wed, 11 Feb 2026 08:12:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akash Kumar <akash.kumar@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: qcs6490-rb3gen2: Enable USB2
 controller Micro-USB OTG
Message-ID: <2zztcabuf4hkixj445m3iiqdsmg7jju62e3fgupb6kaqirx5lq@2mhs5hcn3p7p>
References: <20260211052146.3760500-1-akash.kumar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211052146.3760500-1-akash.kumar@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDA0OCBTYWx0ZWRfX5jiisJ/fIxPw
 CcqADMTtrIUmiNzEGcyyz0R5IC8mm0nZHKkLr2e4gZbKxSLkHJ8h/wOLWCFdCq7kXvgWXL6p9BP
 kPDEHJI355b4qF3q5ZRH+L8AfMX0ksbM+PguhEkpaLJOyKe6V1ZbDp3L3upRpJ7+Z0/Rviy6RPH
 VbL/C7uy1PYZNYSI4wua8pJwBvsFiUxC4xeJ1U1rXDz09QtNoMnYJugF/rBrmD6KVkvMkKeDQMv
 ul9xB/AH2enTNFFynWhZ+3kwQqppzSoEHIe4yefOxUV5hpx+DUn++unSIBDXoErjqG4fPeIyFaz
 c0US03x90gMegMKfoviipxu4agZ9u2ulmYpmW0TUD8jo7TR+Y2FO1b6EpzjJhj5EX9MKAGy85h2
 vBDqO47fRZ15Ai2g/MLrY94NQOoE0fmtYkCG7ASQtPZmWFs9hU/U41gOH9xDovsATGaJt0nS7X/
 EI72QDKKEScu2JsZ4nQ==
X-Authority-Analysis: v=2.4 cv=TKVIilla c=1 sm=1 tr=0 ts=698c1dc8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KgnbEzuii_36Y5xDassA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: E1KYRrbuzwWSGJM9QBQyv5xUJfKFqhM3
X-Proofpoint-GUID: E1KYRrbuzwWSGJM9QBQyv5xUJfKFqhM3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 adultscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602110048
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33273-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 60660121911
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 10:48:18AM +0530, Akash Kumar wrote:
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
> v2: Fixed minor comments on v1: https://lore.kernel.org/all/ad294a50-027f-4caa-a9b4-e145f709b50a@oss.qualcomm.com/
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 64 ++++++++++++++++++++
>  1 file changed, 64 insertions(+)
> 
> +
> +		port@0 {
> +			reg = <0>;
> +			usb2_controller_ep: endpoint {

Nit: empty line between reg and endpoint. I'm sorry, I didn't notice it
beforehand.

With that fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> +				remote-endpoint = <&usb2_connector_ep>;
> +			};
> +		};
> +	};
> +};
> +

-- 
With best wishes
Dmitry

