Return-Path: <linux-usb+bounces-37642-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLIrC9CMC2p1IwUAu9opvQ
	(envelope-from <linux-usb+bounces-37642-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 00:04:00 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BE94157437F
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 00:03:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0BC8E301B3CE
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 22:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FA36257827;
	Mon, 18 May 2026 22:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cLIN78ED";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KpFv7OUy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E3B39DBEF
	for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 22:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779141833; cv=none; b=gAkJzbzuTUcWcOnsZqj2PAi0PqRnAzUHIvqoXGRRoXP4O1iPEoA53wV9WpbPKN5oEqBkRE7iV5h0Yszuqp0ZCqW6I6tNMd6PhVhJyR7Lr57cGN0njeETziDoFCcPz/jIksKx0ptW9mk8RsT45X8GP+SVHReJMJ+vksVzbK/Z47k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779141833; c=relaxed/simple;
	bh=pRUyYmmgY+SMR9KdaJVku27H+nF27hTsbqOt+3i5IxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VpZDn9xUt5Fp8319OMvQRgAaQu8TKegILzsov6rI9AEl+jr+YwsGN++u6yQ+XJciAmJTE1CqD/f5cxHmL+qq6EsrZ9waPCFfPjOHuYvQTVlBdO3RKY7fE1so6tQlVd02TKFtJ9RAb1suY9u9RbwJBH50ADS+4ggMIVroU8gLMXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cLIN78ED; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KpFv7OUy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IIJMP42482474
	for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 22:03:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WE/ZmXbZ2mfp389Bj3cAnUFxz1Swq6CCIkSQGONfjZE=; b=cLIN78EDFFiNAjev
	u2f9Q3NT1U18ZtdPQHtVAvR0CUQaEqqJ7I8GG/ok/NDd/z2XYst5Hq95Azi8j4iw
	I6H/Si8LHc9J6BQWd6YIh4aJfCmsUiZW170SEAtI/G1OIqbWPkuM4pGDOXGq8UXa
	puavL74s/a5jSyQwetFqDDrpqUMyJCGYdBjjTUV0Ekds5L0k9npwiWVm9qamOHBD
	d08Vl81jP+Hiw3/aQmM6mMk51V84IjSLaBGrsbUzoDa+cBHXwiMTjfRLL/3NY5zF
	5Qoug7NPigTcG7PDiZih6e01PEP2yEaRYhsZrBmGDJNG1amDGt9RWy0dsDHFDaug
	R9Fhhw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e81rvjaby-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 22:03:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-514d2b22e7fso3668891cf.0
        for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 15:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779141831; x=1779746631; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WE/ZmXbZ2mfp389Bj3cAnUFxz1Swq6CCIkSQGONfjZE=;
        b=KpFv7OUyMff3hiuH3GqMI1hJhLdI2n6jeeJj3g7XoPdMDvla2xBUoo/3M4mS9m0Rlg
         IxiVqiUOT4Py7BPVJBhMrniYBboE/Osg9aC2qjrdzINu8y5rXJWwwWYvpvXlY2dgCK7Z
         K4aDryK9XKXW0OPzNdFdlFsPKRXY3wY2k3+EtXiR5epIZqYIGfDFszqvTrio0SEmOCRW
         vbxlJrn8HRzQS4t5gBbxa1HgQ/rCYArxdHzLDLU4Bb5KXUIJaLzKGWT0DAqQ+8ryiHX5
         d6oEKI7Gua62acQwqllhT8svnGR+EDM6a95LsTvC4qzdBM5pybf2ZNn0ndx1JSkahAmU
         U+9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779141831; x=1779746631;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WE/ZmXbZ2mfp389Bj3cAnUFxz1Swq6CCIkSQGONfjZE=;
        b=O1A7Cvk5jBKcgHAKNoi01OPY6xLZshO5EvRm8ukTIyKEhPiiqqPPDmE1AFYtlSR5M9
         ofp7lH6F8w+q09I0vQYncZay9J97/rfSNF9s+LbfI0Gnwnn9a2fm6vx2w48vrikNURGu
         jNaFq0mYl26K92JpRcpcKII+R7wheVVl+m+/Co6FfrY9HVWImp8ESAPM6Uil9Ez8kvcH
         qnKMKZtmctDZEHZ7IeiQkEWzyEhCiZRLLfJzb+r44IO8+5rDS8hTXtSaCybMPGavtvWb
         yPb/i6NNoDmYHWQhWCLy5zvX7ZaVFfOWQciAYIBavN7P8yiybNo13yfmqa1DxsM/Yklh
         tSJg==
X-Forwarded-Encrypted: i=1; AFNElJ/whE6+WPt7efXuXrIInyPH3H6pKUuQw4bk8l2+HEqSuXev9Odoy/P/aaOKZ7M4nP5BgUrTzePnu3E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/XC8Daihkfg6xiemP/VV9QIyP/27q13Jdg0NSlF5vRGsQX6+O
	293lCAw4ZC7YhkCLLMDruPPlxl4Ygi3jUzpzkrmsuOaYLhpiiMivZnIueODaYSpyqzIk2ElS/RE
	XSMtEJOTsHp0+33y8/f4huRPBiB6LQHmKeDp8TuA3CiasNCDhwZNnvokPEEvKZrw=
X-Gm-Gg: Acq92OHSxWMM9M98KT2KHXAzs0XI0E7QybGFpVH1kEymGdXrjwBlLjhhZ0gzCX7461M
	1D2ACPs6oinqw6dnj7hXVfDAoLu41AClvF696rJuDBHX7/Spa1PHxgOK5V6pv7Geil93ZwRJQfS
	ig/STwZraAhHvB3V/7XF9Z/JT+zV80uss/jMLlebHhIOo3SbzwXId321x0x4Iw0ctNwaztWgeuu
	AH1clh0/bsYlRS6AQPfJnRe+Fn21wPUjxnTpLKUeX+HSkqNRNdbhpj0coFLQVIYrvFmQmeODVo9
	ho1t5FgVqkIVq7OeKxfjT1ACnlNPWjgmW/YZIqvHyHRqrlFONdudmSwlvmcsKNhIr/D+2cRA+wi
	9up3q0G68U128qGnkdZCYASqaqbHds6PmNy07zd8f4iDlI39SwSFiVyQz5Wu/aQ2WkFPhRZ0dzt
	OMrqrF4DWoC1wYBRj16kwgv+hAw10A+sbopT4=
X-Received: by 2002:a05:622a:1444:b0:50d:8e6b:96ac with SMTP id d75a77b69052e-5165a31a533mr227093181cf.58.1779141830377;
        Mon, 18 May 2026 15:03:50 -0700 (PDT)
X-Received: by 2002:a05:622a:1444:b0:50d:8e6b:96ac with SMTP id d75a77b69052e-5165a31a533mr227092541cf.58.1779141829745;
        Mon, 18 May 2026 15:03:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a619sm3598182e87.27.2026.05.18.15.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 15:03:48 -0700 (PDT)
Date: Tue, 19 May 2026 01:03:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: taygoth <taygoth@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
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
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Casey Connolly <casey.connolly@linaro.org>
Subject: Re: [PATCH 2/6] dt-bindings: usb: add Qualcomm PMI8998 Type-C
 controller
Message-ID: <3cdjn22kjsjlhfd7mt34uldmkxdquxexydefkfd5hpm2cfdusi@dqhhsl2ux4sv>
References: <cover.1779127507.git.taygoth@gmail.com>
 <5f4271701066943ead54f82003ab282c4b39f3da.1779127507.git.taygoth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5f4271701066943ead54f82003ab282c4b39f3da.1779127507.git.taygoth@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDIxOSBTYWx0ZWRfX/WZ9BUQs8dUJ
 30y2f/t7CIDwKuZpcOFodIQxle4/1WEWBiyCy/kSVbQGuRIhu/tdRpfhYzB74/DslTMCrSX2HjE
 hEE+HWw4qRkgHgmjTUNUTKILLQ/AKTDHHF55SlnC4YAuewTQIuHZbdF6rlsMMWkwQAJu+vNKQZH
 02/GLuRxmAz38COvP+ysFsdLAbSK2FC+wGnWJwX3xzONzfeXI1VOt9J1GB/i1uYE6pZa8rWJjMF
 0fo4uQezHlSS8+IZP7BQFgC0Iseq2y5Mh+hsZPwQLg2K7p/905EcpC3Qy6P4+zFHB2XCK7LaYRY
 YCh3gx467qRW1NmGhRR+XWC9fyykZKf4wGK7eYEZ5bhmVqH0wtuKMl4YGqLrNXhdkogaa7QCAhH
 okMvHn+xE+kpFVcU3MtXhSt9AxaIPScCJgHzkbQrkrpVhzEK+ae9Yix/R7QwdhGuboLTHeDZbLT
 gSrEvbr/QECtJKD38og==
X-Proofpoint-GUID: gIGspO-m7uLDfUJxXC1cN6WeMkQoeQUh
X-Proofpoint-ORIG-GUID: gIGspO-m7uLDfUJxXC1cN6WeMkQoeQUh
X-Authority-Analysis: v=2.4 cv=Lf0MLDfi c=1 sm=1 tr=0 ts=6a0b8cc7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=gEfo2CItAAAA:8
 a=pGLkceISAAAA:8 a=fpthWuqRuR8fFdR_s3QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180219
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37642-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,oss.qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,0.0.0.0:email,0.0.5.20:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,quicinc.com,linuxfoundation.org,linux.intel.com,linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BE94157437F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 01:22:47AM +0500, taygoth wrote:
> The PMI8998 PMIC integrates a USB Type-C detection block in its SMB2
> charger USBIN region at offset 0x1300. The block performs CC sensing,
> debounce and Rp/Rd resolution in hardware and reports role changes
> through a single consolidated "type-c-change" interrupt.
> 
> This is architecturally distinct from the qcom,pmic-typec binding
> (PM8150B / PMI632 family) which exposes a granular 8-16 IRQ topology
> fanned out per Type-C event for a software TCPM state machine. PMI8998
> has neither the per-event IRQs nor a register layout compatible with
> the TCPM code path, so this binding describes a separate hardware-
> managed role-switch controller.
> 
> Signed-off-by: taygoth <taygoth@gmail.com>
> ---
>  .../bindings/usb/qcom,pmi8998-typec.yaml      | 97 +++++++++++++++++++
>  1 file changed, 97 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/qcom,pmi8998-typec.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,pmi8998-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmi8998-typec.yaml
> new file mode 100644
> index 000000000000..f2814f5ce3de
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/qcom,pmi8998-typec.yaml
> @@ -0,0 +1,97 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/qcom,pmi8998-typec.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm PMI8998 USB Type-C role-switch controller
> +
> +maintainers:
> +  - Maxim Furman <taygoth@gmail.com>
> +
> +description:
> +  The PMI8998 PMIC integrates a USB Type-C detection block inside its SMB2
> +  charger USBIN region at offset 0x1300. CC sensing, debounce and Rp/Rd
> +  resolution are performed in hardware, and the negotiated role is reported
> +  through a single consolidated "type-c-change" interrupt.
> +
> +  This block is distinct from the TCPM-based qcom,pmic-typec controllers
> +  (PM8150B, PMI632, etc.) — PMI8998 lacks the granular per-event interrupt
> +  topology those parts expose and the driver therefore translates the
> +  hardware-decided role directly into a usb_role_switch_set_role() call
> +  rather than running a software TCPM state machine. Power Delivery is not
> +  supported by this binding.
> +
> +properties:
> +  compatible:
> +    const: qcom,pmi8998-typec
> +
> +  reg:
> +    maxItems: 1
> +    description: Type-C SPMI register base offset (typically 0x1300).
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-names:
> +    items:
> +      - const: type-c-change
> +
> +  vdd-vbus-supply:
> +    description:
> +      VBUS source regulator enabled when the controller transitions to
> +      USB host mode so bus-powered downstream peripherals can be powered.

We probably need to fix this for PM8150B too... This should be
connector's vbus-supply instead. I'll send a patch for the existing
devices.

> +
> +  connector:
> +    type: object
> +    $ref: /schemas/connector/usb-connector.yaml#
> +    unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - connector
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    pmic {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        typec@1300 {
> +            compatible = "qcom,pmi8998-typec";
> +            reg = <0x1300>;
> +
> +            interrupts = <0x2 0x13 0x7 IRQ_TYPE_EDGE_BOTH>;
> +            interrupt-names = "type-c-change";
> +
> +            vdd-vbus-supply = <&pmi8998_vbus>;
> +
> +            connector {
> +                compatible = "usb-c-connector";
> +                label = "USB-C";
> +                power-role = "dual";
> +                data-role = "dual";
> +                try-power-role = "sink";
> +
> +                ports {
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +
> +                    port@0 {
> +                        reg = <0>;
> +                        pmi8998_hs_in: endpoint {
> +                            remote-endpoint = <&usb_1_dwc3_hs>;
> +                        };
> +                    };
> +                };
> +            };
> +        };
> +    };
> +...
> -- 
> 2.47.3
> 

-- 
With best wishes
Dmitry

