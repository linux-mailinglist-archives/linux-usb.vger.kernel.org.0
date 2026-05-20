Return-Path: <linux-usb+bounces-37763-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNvpBIWIDWpdygUAu9opvQ
	(envelope-from <linux-usb+bounces-37763-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 12:10:13 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D6758B683
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 12:10:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 062ED304857A
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 10:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEFEC3D4118;
	Wed, 20 May 2026 10:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fjz0zf3Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ax3S1otw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10FB3BD64D
	for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 10:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779271550; cv=none; b=Tl0WjKQLoOxtlBGTejJy9IEQrNTX1X6DGVQU9gXtBV1iYGCHgxj20Qb3lTHdlpYOy6OuVOcf+Hrx1i0vBNiO8IdKIn0X2LosOGeeOO8QCZanaY8o8/QDogb9oM2c+8j0gP1qTRR4LnkkgkIjg2Ev/FNd4tpfnBfqEnzoUgR3dPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779271550; c=relaxed/simple;
	bh=VMTZENOrCLYp0Bz1nixlYFju9N7YUldpyjOQTvu8ayQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ogyBuB8ejnVWWAvCRjfMmcx9lKJNu/k61ZcAt8hK7MR0fRCI5DQKkQauCRnnWc4Jgpsim+BIbGVffzeU3HbuRbSECWFqU7EkWluzokAhZAEoDoeDulo/QKllYtGIraDzkmEWb4R+aIYI5oFQyJOOhycmDgbZpK9dWFy/kKqzAJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fjz0zf3Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ax3S1otw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K7qkOp2064625
	for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 10:05:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yOZnM2TLEozp0nupSz30z7yN
	x5I2A+9YCb12BxX6BEw=; b=fjz0zf3Z6YhftuKuZZ39Ik3yiYncWSB0F50FMKXI
	M4d8TxBB19B/Tw47D6Kb3digeHLxA3FIGphnahoagJfExSt4rMZfMxwX5teUwFZB
	bhBgwx/UtyiTXIuqb3CMM2Wi7kJjJr9FHrMy3k8Mq+duE8yvn9EGhhxlaU5Qslxi
	jiESd6STht4p0lFEsURR9YnNjRuP16yqWY6KepShXAiHgqdAWOFbmWx9qEchmRO5
	pbtoVC1gjExkwG+8s45hsDB8yaQdAdywYjXUOqTy/yjDyT2ggwWwYCgP+Cg2TYim
	RLPpGVdPT/PkIXBZuMW+kyNdjlgAPbvSefmuMnpfysQGCw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3t44dm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 10:05:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-516879bf1a7so122281561cf.1
        for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 03:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779271546; x=1779876346; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yOZnM2TLEozp0nupSz30z7yNx5I2A+9YCb12BxX6BEw=;
        b=Ax3S1otwyyxwfB0U2IS5lzPzRqjWLEzB9HpN7CnWGMSfXZGkz+s1amFAFqGuu/TXw2
         11mTl4BHRLZVk5P32eiTiLim/zeso6O9SE0yPywlM/qScVzSTm91exF/pC+QFuX0YTbc
         RgFB1zy/PlpPQIlzgF2Nl3NjmTF3KiJa61YvcTBTOq+G3zyelIdWgxO+iLrbwqquy4+H
         nfHN29esibYxcXHrBHV4GQsNA1Mk2iN43bslFXUllCF+G/fY5mjI1FShfNsg1qCYzXqi
         Ev6Stv7DtovMHaZcVtynR6tZBhPvjBdoNIYBbBxkofgNGFzLoxFxaTqs/x0DXXWSbvIo
         1+Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779271546; x=1779876346;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yOZnM2TLEozp0nupSz30z7yNx5I2A+9YCb12BxX6BEw=;
        b=CJGvAKXcmBxJCRCtXrAL/TXp7P3Z8CDt9nBM6Q4V8C0da7zKAN7tMAcq1IkG1xUOo7
         Q2pdCirSQ9OjOSMAYZRhipaMQN3vZ43SMFhmwdg0R07HNVCfJkVF/OEELc33EzHyD77B
         V2T+Q5sHGIghG4+uvkXEstbe+shJdvZfDpIzEnxnWz1w/8msk2TrYdTzzqGLCwHvEezZ
         TwPMN7W2g7ugLCQO2GPtJhjJb4z/oLiQjt2sG7TUllgFxqmKwxWE5p21EinGipPHTbjr
         dDw1CIaw9A/4R7uz4cs+I7XjqHO2KByiIynGNGDbyqIolC1YJIYAJvyLbzFvtzV0akoM
         L2Gw==
X-Forwarded-Encrypted: i=1; AFNElJ/XexuYiaXD+ckLJmFYLjkqxrmCvjMihD7IjCWSwaWfXJ6O+vnMk9H/uLzdzB2YGrTp4baOCQ3nCrs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfkNwvicCwPK9z1CVfmX7s5zk7v3W+To92xAiPh+4rxDsClvLz
	321R3UhN6qfUi5XhlraKL+NFYH1nigbbkthvOJkQKSOwTZ4Yt1An8KxDbLkU82EdoI3nLdwS5Rv
	Goh1JIfidSVeoDDoBb+aq++tGxITIgeXdkwrPRLvxwnAvIzZQ+dvyTXXqLHUtizE=
X-Gm-Gg: Acq92OGNAhQHJMXRrWGsWAPjdd/aLLi+6V9hRIGUkHfHB72jYcWF49XQiCEFwtc20y9
	tXjQH3pmsPa8O9ePSGyE4YQ/JiSEyWKKjtGj6goWTVZ1qGUeAKDwWiKq3mYjTd2MiXtNCotK34B
	n/HSJXhW0WQPUtAy4ONxX+ip5G0OGO+FFMJOpEvJr1EXZdWM54pE5R+1cbSmu2Ia96KY5cSz6pj
	yco8dOD7w1r2sedAK1wD0ZihBpOMApiWAuoJmgTQb0vSgmziM0afZCa4UNvKgZ711yd6odo0RrV
	BaQFvaZCsFrwSvzf95xWG3o+UMvSPvgVec1z9OgkqKOXo0VqVrjIhyu0r4UbvDkIUoQ4qEeIZqe
	box2ELUDbcnOtPts0YySnnRDZCfwdCsA+ZPP0hlqxdqma179EAiiblFocxjXyk+EAeMUvuow3KG
	qn15swMhJKoxXWxaFtNqWZBhJuD61t2FOcxMU=
X-Received: by 2002:a05:622a:15d4:b0:50f:f030:920d with SMTP id d75a77b69052e-516418bb45cmr325601371cf.30.1779271546134;
        Wed, 20 May 2026 03:05:46 -0700 (PDT)
X-Received: by 2002:a05:622a:15d4:b0:50f:f030:920d with SMTP id d75a77b69052e-516418bb45cmr325600911cf.30.1779271545658;
        Wed, 20 May 2026 03:05:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395882822ccsm27253581fa.8.2026.05.20.03.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 03:05:44 -0700 (PDT)
Date: Wed, 20 May 2026 13:05:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akash Kumar <akash.kumar@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: monaco-monza-som: Enable USB0 DRD
 mode
Message-ID: <4flawqagu67adw4j2tyntn5xdfvqs5qswsdrwwangqpmp5scmr@wzebs4slgea6>
References: <20260520093902.2064730-1-akash.kumar@oss.qualcomm.com>
 <20260520093902.2064730-3-akash.kumar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520093902.2064730-3-akash.kumar@oss.qualcomm.com>
X-Proofpoint-GUID: t05hP-KYQ3jwsLmCn_ET_GI9CP7Qt66H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA5NiBTYWx0ZWRfX1exNC3fF0dEv
 8/U2vaHyVoeY1YgmN4PXDbctWgJ2lbbCz/j0+bD44mFrBeZe5xmHr8QyaX7zEL3TsfB+63gMgcl
 UOlb1gatB7B+56fbnkxtTorc37Z3JwV9CJVha8fh1/mNnG9LhdyUnA9FRaUKV1rtrqGa3Egj3YB
 /kK+ccKO4g1gKT9MeJG6IxwwFMTHdfupuTKgXu5KnJAxHsHqcbjURIBeeH+dmscSDKqnQkzA+vm
 OEPDtVGhI7WIylwQH83QZhLzKp+N10qKUJ465TycvfLIgmF5Kxs+emJXNV5zK5SfLTcMjAfea8A
 FUPBF5HpF8BNg4RjEjRL2HZRFhBI8jjDFqXeThr6noF9URiYffGRNYbT1OILxBvhpy0jGqn3ExX
 4yfIyCfhZhdLD4St26XhywQMHsmr/4StQvHQHbx8z6Q/mA8HVwf3mzTk+Ha3FPE+oRttC4tpu3k
 U/TiqOhFE4whUHjRrzg==
X-Proofpoint-ORIG-GUID: t05hP-KYQ3jwsLmCn_ET_GI9CP7Qt66H
X-Authority-Analysis: v=2.4 cv=C4LZDwP+ c=1 sm=1 tr=0 ts=6a0d877a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=028NdSF9W1XUqDdDnWcA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200096
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
	TAGGED_FROM(0.00)[bounces-37763-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,0.0.0.8:email,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 72D6758B683
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 03:07:33PM +0530, Akash Kumar wrote:
> Enable USB0 dual-role mode on monza SOM using the Cypress CYPD6129 UCSI
> controller.
> 
> Switch the controller node to I2C12, configure the required pinctrl and
> interrupt settings, and wire the USB2/USB3 endpoints for the USB-C
> connector.
> 
> Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
> ---
>  .../arm64/boot/dts/qcom/monaco-monza-som.dtsi | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi b/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
> index 9b5ed55939b8..8e3af6018dfc 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
> @@ -194,6 +194,52 @@ &iris {
>  	status = "okay";
>  };
>  
> +&i2c12 {

Wrong place.

> +	pinctrl-0 = <&qup_i2c12_data_clk>, <&usb0_intr_state>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	typec@8 {
> +		compatible = "cypress,cypd6129";
> +		reg = <0x08>;
> +		interrupt-parent = <&tlmm>;

Is interrupt-parent required?

> +		interrupts = < 3 IRQ_TYPE_LEVEL_LOW>;

Extra whitespace

> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		status = "okay";
> +

-- 
With best wishes
Dmitry

