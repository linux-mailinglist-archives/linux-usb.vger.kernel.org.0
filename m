Return-Path: <linux-usb+bounces-34637-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EEsEKFgmsmnlIwAAu9opvQ
	(envelope-from <linux-usb+bounces-34637-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 03:35:04 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FC926C482
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 03:35:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2278D301615E
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 02:34:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFDE432AAAB;
	Thu, 12 Mar 2026 02:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bU9DG/0n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DFvuEXS6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F8737C926
	for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 02:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773282892; cv=none; b=ih28DwVT8+a+WxBngM2isJLQiN4Xb28QYa4HD7wS5erh4eAnhlwgOG2OrfqmbeHuE/IEqo2LXPBXG7yoFykqifwVD5EO4GFq8MewZ4nvJsaWr2dIK5ziQqpbsuLWDAo7JiT1N2vdsUp8uouugLPR0aR2yARpc92Vh/2vy8sVePw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773282892; c=relaxed/simple;
	bh=/nqZ+f2nVivSgfHE253neYkKdpWA3AR30w8tm2ouLLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lo8Np/In1h2N4QaxJz1y3p5PNtgNblUtVchWVsq8sJeVlaDPk2oCGTPnjF2qZiM2R36OxsAVncN757MlGkBMEsOGWI8zPxNMeRhSlDIxTCkphvGOLaEk5f2t+UPYHi5odlbyIpNdAZnIm3aKt6tKfV9LS9HB+MRO9wOVvR7/p/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bU9DG/0n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DFvuEXS6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BMP6G3588310
	for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 02:34:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iEWRLawKUMcKcgnXaUTfRx6G
	DeVA4xrQwkEkodh5kUE=; b=bU9DG/0nTc66IonE7idQ4MmHRQkftf2PntUcGNH0
	WVCTWF9nT163RZsGB3ONPocLRXedGPpSKEk9yGg7YfLGiDFJ2JV7NxJK5vDtg+yB
	ql+baT1dlxX45Z8JQbN9elr43UoQtzuUNDYvEQ6ZbXekZha7zz/EaPKbDU0LQlTq
	dlg+8KEyATszjHGXvnML4oPNDioD/UvpYCKOFLxoGIR2V2RdxcCC6Vn3rGYNKTyq
	CSIOnnz/J8gJeXp+0FrLw9rFKXNEbNTyrHZjeLVfFD0zTqdsI6VABJsTbR9/qmBC
	qUu7SZgQINJgaLTnVQ3W93uwnmfj0xBpOzBTO5My8PBz0Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh5q0m0d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 02:34:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd7fc27cf7so280503985a.1
        for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 19:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773282889; x=1773887689; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iEWRLawKUMcKcgnXaUTfRx6GDeVA4xrQwkEkodh5kUE=;
        b=DFvuEXS67t5MU/eOFubbpLoM396Db2me0bk5AqmVAuorb2nfQV/ICzrq/TlSlOD7JJ
         CNPhqgAa3xms/nLdmZ+kyG32XdgpKCy2Ud/gxjvQbj/OmiJ23DT55I3r2C+jdfVcr4Pm
         E2468X3xz8LgDAl5/4BqTzh0s123YGcFBgUjFXXEQGPsFh4JymtpOk+zO9EkIS7Mw3Po
         mxOS0ZrxuizX5tlC9eIXbyKszImEE4s+EeHT8+Yw22dJ2qT4MScQsYrXnbDSUK2n/O/F
         zd/RPsNz5cvGmbRp3EDJHckBdFG9VlpAIaXSKCuEOL1Hot3eFiYfoXl70j7pKDcSUvuG
         D+8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773282889; x=1773887689;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iEWRLawKUMcKcgnXaUTfRx6GDeVA4xrQwkEkodh5kUE=;
        b=mJhPHCPPxLmS0DwSP3lStiPUwhS8FE2fqkCo/xbmTXzWSg2QKzwcURvMOmfbEjWPrc
         rL9BRVk/06Rxs6eAId1ofhJ7JfxhFJrR8STljNjmfA9uNjYbjZS1edhJW6Y9SBV+wkJL
         BEYfwIirt2muDZeKx56u8pGEN2eJH/PXasKtrFbmTaG5fvg36cGdQ8iTyz6+Ph+p5nnd
         ywQTxa7n75qzlLeFd/jvLP0xDET2XE1+cNGHg1e7ZCK356HqOP9M2YZ8erbTkOcN31EJ
         T5UTKZ/sRDJZnTRZC/ODqFO/KsnLcbqM0nO3wZ8osTyaHVNNw8dym2+FMKheqw1bM9cV
         Ap0g==
X-Forwarded-Encrypted: i=1; AJvYcCXGiNs9mXELsOETJXKiWxU0rZxU1UqMluWni1QOGBoFltwO8LJoolSrGIBNFkSGCZw3UhB6notJnII=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw/yr2v3AfRk5JX+YiI2xnzHgrqbm8uhhSl9fCwzf8oARMA76X
	LMW+/J4UgpJj6kAvCc0pQBl2ElMV4LRkSrEQ9ILCKiSyziFjtJOiwqhEWlTCMfipnHaQOLDu6z8
	8BmeLwLl8T+u9dAyZWDxPc9SNshNwvjxPP0ON0XYaRturpm9tarD2jvSgtkSjnLQ=
X-Gm-Gg: ATEYQzx20zvnPK65Xeuu929KfhEIxGSnuIAXjIHu7tvU4diqiN7U1uzlLc+1h8vMJlr
	n3ftUnA/QA8V0Cyx3dhk4GxCMOGz+PHlRakih0zf1xBCDM2t7k0eJFrt3EIV8fzUHAZgB2WkmmT
	Jy+yOMG6AIDxNOHBUQPF7p47PEZvupS/RwwdccQ25cXiVCbCRAn+lRhixsVFnaRfRzwiBFFs82l
	98ZYUU8EWthhYFjslpIuhcaBOt4lkNjvU1KrZbsB9ebkB1gVpxJhIExv/3oFi7dh0IrnLt+f0+o
	16DP5VD3u+hV5y+9t3YEVrWw9Rf03bSHX2jviWeJrJGKD6x+9zk+ULbJd/fiLa1p5pPB0h4osUw
	qT59GW72JFGP4oBNsT46pP3or/qFyPmhUiHqvnH+LZEuYKP6zPKcvs32dUrqxMC40tilBI1XLoA
	LUAxZoiJO/uyVv90pxPJw7pNe3+kYpQGo+6DI=
X-Received: by 2002:a05:620a:2688:b0:8cd:8d79:6c63 with SMTP id af79cd13be357-8cda1ad7ad7mr618461085a.68.1773282889229;
        Wed, 11 Mar 2026 19:34:49 -0700 (PDT)
X-Received: by 2002:a05:620a:2688:b0:8cd:8d79:6c63 with SMTP id af79cd13be357-8cda1ad7ad7mr618458885a.68.1773282888804;
        Wed, 11 Mar 2026 19:34:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15602e2e1sm693900e87.24.2026.03.11.19.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 19:34:46 -0700 (PDT)
Date: Thu, 12 Mar 2026 04:34:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <AKoskovich@pm.me>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/2] dt-bindings: usb: qcom,pmic-typec: Document
 vbus-detect-gpios property
Message-ID: <m326m6tjiiatutb3s7jhr472grmlvkbg25cqf5gijusioaszxm@6bkxef6s3pyy>
References: <20260308-qcom-typec-shared-vbus-v1-0-7d574b91052a@pm.me>
 <20260308-qcom-typec-shared-vbus-v1-1-7d574b91052a@pm.me>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260308-qcom-typec-shared-vbus-v1-1-7d574b91052a@pm.me>
X-Proofpoint-ORIG-GUID: xwc1yjt-ZoT2UJ6KEai_nzvtXhgbjuJj
X-Authority-Analysis: v=2.4 cv=CIUnnBrD c=1 sm=1 tr=0 ts=69b2264a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=843x3jrLC61IQHLzAyoA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: xwc1yjt-ZoT2UJ6KEai_nzvtXhgbjuJj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDAxOCBTYWx0ZWRfX9KbdHrfzrk0w
 m62p6+wyyGRtIvneJdVFr/WL9fgvyUppqhb4klL9ozR5ygeD7RRQD+voP8p/zSuexfSmikpAnWF
 jVqhVItI0dBuCXBBR35AfnpealEzOby1nWlekTMq1bymCpEe7HSEwe74PAzGi0hffZV3lUkwCW8
 HKm5V4LzZCAYHsbRBm6J+jRfeqEzps2cElrgvhcAjnBYpC1lZMuFgu2dPgjD74boIhxDjpw0F6G
 WtUauml5QS+IC8RXiOuVYuYk4R1W/5UQz9UD5Xny6OmL3NIRrOy5qmGZfT/x42Mbd2Sw0GceGdU
 3IeY6AQOiOJ1sOY73qUfrqlCvkQCNkbiXfZ0ZPaEqo1KeDSZBZoKdDy7YndG6Q31QIOaz/T+V6K
 Y6BrbXGDsxb2PGsNsxhUQoe9dCG5D5PqRR4koTsrelz00b+UJpKghbRXddPdXfmCVxabU42EJSW
 WYAOUJSXA3WJTC5s3VQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120018
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34637-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E4FC926C482
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 08, 2026 at 11:20:27PM +0000, Alexander Koskovich wrote:
> Add the optional vbus-detect-gpios property for devices where the PMIC's
> built-in VBUS detection is unreliable.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> index 6d3fa2bc9cee..f45bf3e34c03 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> @@ -78,6 +78,12 @@ properties:
>        - const: msg-rx-discarded
>        - const: fr-swap
>  
> +  vbus-detect-gpios:
> +    maxItems: 1
> +    description:
> +      GPIO used to detect VBUS presence when the PMIC's built-in VBUS
> +      detection is unreliable.

Can we use vbus-gpios from the usb-connector instead?

> +
>    vdd-vbus-supply:
>      description: VBUS power supply.
>  
> 
> -- 
> 2.53.0
> 
> 

-- 
With best wishes
Dmitry

