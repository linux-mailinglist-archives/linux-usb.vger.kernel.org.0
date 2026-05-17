Return-Path: <linux-usb+bounces-37560-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNENAoYgCmrkwwQAu9opvQ
	(envelope-from <linux-usb+bounces-37560-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 17 May 2026 22:09:42 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A312D563B38
	for <lists+linux-usb@lfdr.de>; Sun, 17 May 2026 22:09:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B47B301E3E3
	for <lists+linux-usb@lfdr.de>; Sun, 17 May 2026 20:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49E6230DEA3;
	Sun, 17 May 2026 20:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f6id0z7K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QzL5hEqg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944942F532F
	for <linux-usb@vger.kernel.org>; Sun, 17 May 2026 20:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779048557; cv=none; b=FSwiNWlv1zT3+VDYfmIvSequrAGA3k0QdW7LH2Of+0cCCod6TSESahC1jJa1PvHtuuBj0uY8Ea+CUbDeezQE6VdtPaMjeNVet7QfcGcW7dHHh0mW50bD/T+Zs+guI8C6iIY/1+4+8RpH/FFdciuTu0+WYwCU2vXjjQnawD+1sXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779048557; c=relaxed/simple;
	bh=i9gGQrBw8v0uvLDFMNri/IPMVmw/afxZ89giSkJ3hUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A4vqmJITeTkN8mqb3KLoKkt1DmgjV3oaD2oxckLM2A2ao+WEx5tWWkX5vJsppq9TKHXA09iVsyCb22K/IChWZ5hNS48Rx5dwU3dPJNYleHF/5KOvOi5+KWbrfk+xe/wwZZrDmTKoWHAhMoOz7TveqOpiPOVmK++TmdMqBuRzLVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f6id0z7K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QzL5hEqg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H4bkcu3732307
	for <linux-usb@vger.kernel.org>; Sun, 17 May 2026 20:09:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hu1EtnfuPuyZsalbXIEwU6Sg
	KVDqPybT0/jZrzd+yqo=; b=f6id0z7KZGH3WkQPvazB7wd+5zTpVArx8O1+9WXk
	sWySwj2F4MqGnH2ul3ouDVMqqh6gNoxCs/pwXNC5OOFvOTFyjWaLoMeGJPCQN9DD
	ceoQOX0tviM6RnhNZJdZO9ZsxI1DDTA6rsPcTuUN/8qVjJXbY63gDTsWjh+xqzQC
	4yEetI+yr026lerXb314VaMHpShyDmdzX1JltSedfjTnIXXkPb5+uEh3Jmjklrj3
	5s+cGQenGba+Zhrmse0IZ4vvL5ROvZyA12xQ0sOtnbJUNjzHvJhQLbfCitSSraqi
	1LOXm7S2RZB2gYQEToxa6VenKDlGM1tu3x2wCRkZt4C6bQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6hbcbf5t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sun, 17 May 2026 20:09:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50e136aff17so40568411cf.3
        for <linux-usb@vger.kernel.org>; Sun, 17 May 2026 13:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779048555; x=1779653355; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hu1EtnfuPuyZsalbXIEwU6SgKVDqPybT0/jZrzd+yqo=;
        b=QzL5hEqgFZTm0ti0lTKnsU2GaRNCe/x9W5Mn3FAitpw5co9GWpRPBMFIKy+G6SpiK/
         QI5DibGKrR4cJT1KE7LixoymjlbnbqYtDqnXeU/BE+Nhf5cbP9B7tX7qPO2BXcNyAJMM
         Ie7rV02RuLkdsql2d7M4/dWnMcrZB2IKzXk6vV8Oseldvf5woxJOyLuu9xIfjEfvUtxc
         fInX+heJGRpRweBPjeZLe7YaylThpM6ngdI3Epo3yQx4xwgTJ5LZmTb9fpvpZ0nop0oY
         byr7POqQRYexD0ilwmIyQPPCOtOGhjOfgfBnCWvOA2LS3bp2x3SVhxTgtmoqfIw27WGf
         ZrNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779048555; x=1779653355;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hu1EtnfuPuyZsalbXIEwU6SgKVDqPybT0/jZrzd+yqo=;
        b=fQQdOYo3zrJaimkji1OzYCjhxJ/wnJjJdTmnWIy1xvKhOu+EvwsABc+yJTeengX73Q
         pA3bzS8mKPp/4pZ++jMxJN2Y0lAzOCK/5TSHoqB9EMw0OipuzLmga8W+eOnZ/tEx7M7T
         o/HBHnt3PsCaQQrGHQtLI1nssCAQ9N/fVE9EPfpTOzPisCILoh8geoXExBhl1v81WZje
         LSknxOwcPtfSwOrtJrq5oTngQORJLIexNqez6nLKLiZdWK47CKJHs5IcEtTaGS0tCskm
         sIGnmzHvccBIk/yaD3OlgIeIM8EECtMlIVPOmVxbMYZqGoGVZ5ieoLrNOBKPsncIpUzw
         XMxw==
X-Forwarded-Encrypted: i=1; AFNElJ9ceVN0CzoQqIiec5IhVm+rIjCbE+CUF1S6Y7OVw3+vI2W0Cwxtw2OnzMhgImftP3yMH0glCEpGd/E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEz6N4X2qg9M30c4G6+aWYqRcUFF4J4oi5535573Ki7dYpVR8b
	teicr5mjn23hgOGzsmPK/ppW5JDuTX9r6tLcyuRSbOle5XDlKUyFnDi38ISanBZX5L43bew9I2w
	9dktpDZpVSqBGRvkvZPqXXNkk1nA7XwniPySe+pKiiMHADi0etPGkZpigLPQy0tQ=
X-Gm-Gg: Acq92OFKgmMaJ3u3WCXDAtHLYKY8fo8p8SwJ/ggsPvaWE5JNzw6UGU5Caq9QsUwVlFi
	q0qYPKrDAD9v6/kkya0VxzQ0roBPVwtxznz1hcUqQLwM9lMmQC6R6esQ61xdRjPFczH1sR7GFzT
	V0tBa0/jh9ehkhvpp7jPykudHEW4RDvlPtkxzAyTtk6WDNMIvfuRyswh026KFtqPU42Wqfqta31
	UTWdhThJ9pcuL+Tjaj+T1BCM021t0OgJNH6hUDX0Dlc6krmFVgyfBhvubR+8unUO6uIhtEan7wL
	kwT2OJ/v2bevfqatNAgZ3LJ8cWF9wguXuIqE39KBKk00Ye7TWCQzruJ1Vy5DSafsAqdX4P9hjMc
	6FBRGmxOnYSPlHLz/oEXVuXZj4NZ0Tu7PbR/a1fyNC2ob53MPXXDh+jItzrfAJQQb6LQ6516+VK
	jT9EjBB/UTh3SunoA5isa0DanFpJYYLPu21+I=
X-Received: by 2002:a05:622a:4a:b0:510:12d0:3d80 with SMTP id d75a77b69052e-51659fd7d56mr193596731cf.12.1779048554754;
        Sun, 17 May 2026 13:09:14 -0700 (PDT)
X-Received: by 2002:a05:622a:4a:b0:510:12d0:3d80 with SMTP id d75a77b69052e-51659fd7d56mr193596391cf.12.1779048554324;
        Sun, 17 May 2026 13:09:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164ccd7dsm2895550e87.67.2026.05.17.13.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 13:09:12 -0700 (PDT)
Date: Sun, 17 May 2026 23:09:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: phy: qcom,qusb2: Document ipq5210
 compatible
Message-ID: <uoi2732geiiyocjkftdyf23hmbgsm4r5aroudoc24ja4xios5e@fwpmhz3p6rnu>
References: <20260515-usb2phy-v1-0-5f8338d466bf@oss.qualcomm.com>
 <20260515-usb2phy-v1-1-5f8338d466bf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515-usb2phy-v1-1-5f8338d466bf@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=cuSrVV4i c=1 sm=1 tr=0 ts=6a0a206b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=11pfgTztydWGfUAPEyoA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDIxNyBTYWx0ZWRfX+Gk3dnrCvpdS
 BvOiveB3dtMocMBlznxsa/9s0Q+XYrhgZRz8VHbUJY65VfdukDalhdQkGATWCPv1SWOuk2YkHUS
 +GPJwljXMqE9JDiF7si4O/2Cwa/HEb3i9PrSYpZSFzjYN8lBNbaDqt6Tu9obE2sKj2X0rfjbY8N
 hSIa9MxfPhWghhMu2+Ck/ZBPjyh2Mx96nAUeIh/8GtalHmuRtM8DJA2rkBslxYP+3O72Pn8qp84
 EG7+JAPU3pb6CtTaUCNGEzmgtGI7GOJGzD3cG0x9Uv+oVBPq90brqXV9vrK3ctm696jpgtt0k9D
 BJpxTj/V1SYjjDw2T/oABm/T3AOv/BP4BG7NBBai7o/h1zy4jWraDklh2ma3wRaNuJWKTjk1eLt
 QImIRr0fw3XEyOYmlLPG7xyirybL579xHHP8pAdxYGh5arElkoIqQUzVl+TQT4uGm9m8i4Xilmj
 gwt68KIJLFXG/Otja9A==
X-Proofpoint-GUID: -68MIS3VsLLhdlU4kyDOMuCVYjxWjgiQ
X-Proofpoint-ORIG-GUID: -68MIS3VsLLhdlU4kyDOMuCVYjxWjgiQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_05,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605170217
X-Rspamd-Queue-Id: A312D563B38
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37560-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 04:17:42PM +0530, Varadarajan Narayanan wrote:
> Document the compatible string used for the qusb2 phy in ipq5210.

Tell us something that isn't a part of the patch. Why do we need a
separate compatible for IPQ5210? Is it compatible with any other
platform?

> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> index 39851ba9de43..509cadd31adf 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> @@ -18,6 +18,7 @@ properties:
>      oneOf:
>        - items:
>            - enum:
> +              - qcom,ipq5210-qusb2-phy
>                - qcom,ipq5424-qusb2-phy
>                - qcom,ipq6018-qusb2-phy
>                - qcom,ipq8074-qusb2-phy
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

