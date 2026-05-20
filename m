Return-Path: <linux-usb+bounces-37762-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGwhNoCHDWpdygUAu9opvQ
	(envelope-from <linux-usb+bounces-37762-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 12:05:52 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA5A58B52B
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 12:05:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6700C304D73D
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 10:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B7A63D2FFC;
	Wed, 20 May 2026 10:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UbvoVKIx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LywJeMGb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F613D1AA0
	for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 10:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779271287; cv=none; b=C+UlSA8zouFAMx0kbxpoUoOxcO+pWlcFYOSeCeE31Ud2iCVrv1ftmZGGC2vAPzfaNz4hAUcNHOw4+ff5f9sipd3XP0qs6/kqhENmd91Zc2YTquC1CduXUXKeY431LA/XtKwWQaYi8FbP4no1RrSmzYx4cf4uFC1fjR7FQxDLsA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779271287; c=relaxed/simple;
	bh=vmfiAM6t9g85B4wTeavLutgdJmjQ8DwXDbuj4/5wtWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HTvt720eXQgbZRBfvTwQ3OOlof0SGyK9UsT26MIi9B1C3UxfPTYc+H/jqKbh5NM5fHz7lSZxNGfxgnhCysrAJW3y29C+jWsrXu6iH6gggpwqMxxeRLlfm7kZAEbRdPnRLpP6dlwC0cCqdJ8EZEoa3KgdpqmPgXqJE/lHFybp/UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UbvoVKIx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LywJeMGb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K9nYRq446942
	for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 10:01:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=B3C1pz46TF7EHcIOJMpu/WwJ
	O4LBgll2RsOEX4nsprA=; b=UbvoVKIxzTzwbQCPxC7gsotpNPgW75B7myi+nsFT
	JaE0nCg2U4nFoRG2y4AVv+315MIpPUTUX/dUvqylKhCK0KkKXxdWtX2qpFZl6Dpm
	ynCqSjxrfD5s/Wi0M+PqhH+43EtjrTDq3MLbnr/BSXv+uOWtdSWHhFhEJEiubdf4
	pjaNfAjHImRIiTJqJ3AMlqHqlhEQmn7IHxu+RY9AHHSSE8DPhj89fjtxlRB5O2BS
	1zAnYoJCimoOlt4STa3oulrBqxIZyxjAQLULq7i2Z93ylCWqyF/lKm9udGUSbqtk
	8WGjRyh2pi5BiXn9k/NUmqj5h5BTVrZ6iw0qQVtaX3Aryg==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9anrg1e8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 10:01:24 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e3d4117a3bso6578016a34.2
        for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 03:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779271284; x=1779876084; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B3C1pz46TF7EHcIOJMpu/WwJO4LBgll2RsOEX4nsprA=;
        b=LywJeMGb0ZR3GD6rhwhSSVyreBEOSTVOGenh8hV13z9fI/GP+gEklQYHt3DiB/8u4o
         WsCj6SsDeea2B37kNk43UAhO+lMryLvKGsuMNVaIExdKpi00Dsb8PnRa5SAS+vBxwrxx
         zw4UVMxYDghHLx7G4bo1HwYA6BZvZcGD278C89dfgWXeMDO4DuHG/i1jEiNdxvK4AIAk
         Qs2uTjNKi/DS8C4UMTims22ypVvgqjlgylpgrnt3Ly6s8mW/oxjr+LmyR9p/VltK4/ld
         25m1VSOFVx0CRIuyXNziAYmv8Y5E0BqU53pIDNtUlzCnBbe9hFdUmT+g/xDYxzjSPeyX
         37OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779271284; x=1779876084;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B3C1pz46TF7EHcIOJMpu/WwJO4LBgll2RsOEX4nsprA=;
        b=RdvdXHhEqVaea2gTdO/Dsc+VG45+hy2csgCjGRj1exGZm4ItYp1YG2fEN8OJBWOxom
         nwy5TsRhxryAXJJfzR5F7+X6bkRi53POdiJ5cwIH8L0AyaNAgN+rbO3PxH7ANDRr1/EU
         aMjbgUgmKwalCn85TY30A9QPlGLJbPd9/8scxDdMa3LEQAG7xLeUQGvgTVYRziVtUXhJ
         QTlZ3zGcVXYzqQSntOR9fB//FeC3Fa2p7t/4dncBrGAz7jgYDCsT4FYe0+SkYmu/H+xf
         OL8R/rT8bp+P+Ltd7Qn8g0TKbawNRkb9QKb7/Qpb3aN/4W8C/srUxrf5lQ+CBL+HjdF2
         PgTQ==
X-Forwarded-Encrypted: i=1; AFNElJ/dg3WENowjjfFG2yz/L0qXjaPQpzsuayqffV1h+G7bhdikZawQKUj0VsiU1OpEcz++swShQg8cRKE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbPIv4mMpja7siebZ08lo3CkapcH79ZLQLAjpJgEmedqyMkdqh
	7vmXUUdhjGqjYgyYpDcTYyHClmScucX7F1rD6W6z5uA5mFTphk8t2BEWyp0sOV/2QzgvJozjy5u
	ahlNJGM3ag0oGeVFUj1J2u37eTQ1IorF+WMYKOLXlQxocz30fH5R7/cvJ62PvHkY=
X-Gm-Gg: Acq92OHwhYcE0WnZ+7AFFWihInJl3vgk5cq+7E34k+Wd94up3vZlihknCj9AbatVPKw
	EDwJW2tjA5Ig+Fu1Sxs559KfNhgAqYv41/yQ26PJvciGzGrmowMSoxGckMzc2PU7nRPCuHJF2mq
	Baki6co1t1MNrRqWXWwGO6ipNFESKmZlWc2znX7zkSRoKjebV2KbC+vFuRuVPPbj0p08kBJOoKL
	P8/6W9m1sdnRt0L66RQgIEZ6tMFFtdiFTghU1qhzOdTEFYWd34wiK9Q8bRLF6FuB0VS87nYx+V+
	/unPefhIsfRcGMHWU9U83MdkcgW03ye1W936wXxoOn71T1WD4q4H6L1k8Iby4sKzuiZIv76ZelY
	UMAUZdxV0UFKl66Alagngl2VRPUY0vxbkzaTeA977wBCXLPPZwszaoP+/a2CijBPln7F9WwoE1Y
	mC8w8abjBZ3rpfzfvx8pawqDUj5gDopZX0Cl4=
X-Received: by 2002:a05:6830:610d:b0:7e3:d7d6:a4b7 with SMTP id 46e09a7af769-7e4ea0319a0mr16222967a34.3.1779271284017;
        Wed, 20 May 2026 03:01:24 -0700 (PDT)
X-Received: by 2002:a05:6830:610d:b0:7e3:d7d6:a4b7 with SMTP id 46e09a7af769-7e4ea0319a0mr16222938a34.3.1779271283621;
        Wed, 20 May 2026 03:01:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a7a0sm4778570e87.24.2026.05.20.03.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 03:01:22 -0700 (PDT)
Date: Wed, 20 May 2026 13:01:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akash Kumar <akash.kumar@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: usb: typec: Add Cypress CYPD6129 UCSI
 controller compatible
Message-ID: <w7xunralidmy3lntzlmr7zfkhdifbp2y6lf4z56ssliyih7nae@gx32fjexuzkl>
References: <20260520093902.2064730-1-akash.kumar@oss.qualcomm.com>
 <20260520093902.2064730-2-akash.kumar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520093902.2064730-2-akash.kumar@oss.qualcomm.com>
X-Proofpoint-GUID: 4MOq70zR24phfbQn6bFGk3DBFU4PR9D2
X-Proofpoint-ORIG-GUID: 4MOq70zR24phfbQn6bFGk3DBFU4PR9D2
X-Authority-Analysis: v=2.4 cv=UuJT8ewB c=1 sm=1 tr=0 ts=6a0d8674 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=81s-UeQjukf3pHKFtO8A:9 a=CjuIK1q_8ugA:10 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA5NiBTYWx0ZWRfX+N9kYc47gLAE
 XWtiXl2fHOgAKDUe/NdvsfMcErWwx/0NZLJR3DRbsds8s1ye2nj6zyxeZC7ro4rISO+GTqUABEr
 HUJOvL5TYOABI18J5pKnM/G+d2vSR048+xZW4werZU9kRvlSHRRaxG/fwGTyIm4jPRP5EiMj5Kb
 KXRqZDFErzrwFjsqY0C+KjVJaaVElheHz5bMCtKUDPzsLgyiSQ/xZistTUtWPUgpzfwI+CciRpe
 nsgd2GGiwGAefCHmhSgiEpC8F1c0TBzdyuYburEERL+c3DoghfFk4KVLKQkOqwLXIN8ZINa7LgS
 07soQXGWaPpE2PXff186AGZW7pv+/0nrxB+HBhjgiBiLpffnvpKS0PwqHTgT9rXFk5PVSAFdPNR
 Ii9hEsrQGG26jNo1qO0B5XClD/ETyPLup8aUJLmS9AaRLLcBqmauUhSVw0W0w4FIneeHqK8SrnO
 +mqCgJi5+nUf9GPjuNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200096
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37762-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,0.0.0.8:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,0.0.0.0:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 3DA5A58B52B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 03:07:32PM +0530, Akash Kumar wrote:
> Document the "cypress,cypd6129" compatible string for the Cypress/Infineon
> EZ-PD CCGx UCSI controller.
> 
> The CYPD6129 is compatible with the existing CCGx binding, so allow it as a
> valid compatible and permit the existing "cypress,cypd4226" fallback where
> appropriate.
> 
> Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
> ---
>  .../bindings/usb/cypress,cypd4226.yaml        | 73 ++++++++++++++-----
>  1 file changed, 55 insertions(+), 18 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
> index 0620d82508c1..90769c43ac95 100644
> --- a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
> +++ b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
> @@ -15,7 +15,13 @@ description:
>  
>  properties:
>    compatible:
> -    const: cypress,cypd4226
> +    oneOf:
> +      - enum:
> +          - cypress,cypd6129
> +          - cypress,cypd4226
> +      - items:
> +          - const: cypress,cypd6129
> +          - const: cypress,cypd4226
>  
>    '#address-cells':
>      const: 1
> @@ -63,10 +69,42 @@ examples:
>    - |
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>      i2c {
> -      #address-cells = <1>;
> -      #size-cells = <0>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        #interrupt-cells = <2>;
> +
> +        typec@8 {
> +            compatible = "cypress,cypd6129";

What does this example bring here?

> +            reg = <0x08>;
> +            interrupt-parent = <&node>;
> +            interrupts = <GPIO IRQ_TYPE_LEVEL_LOW>;
> +            firmware-name = "ccg_primary.cyacd2";
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            connector@0 {
> +                compatible = "usb-c-connector";
> +                reg = <0>;
> +                label = "USB-C";
> +                data-role = "dual";
> +
> +                ports {
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
>  
> -      typec@8 {
> +                    port@0 {
> +                        reg = <0>;
> +                        endpoint {
> +                            remote-endpoint = <&usb_role_switch0>;
> +                        };
> +                    };
> +                };
> +            };
> +        };
> +    };
> +
> +  - |
> +    typec@8 {

Ugh, definitely not. The default here is #size-cells = <1>, which is not
suitable for I2C devices.

>          compatible = "cypress,cypd4226";
>          reg = <0x08>;
>          interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
> @@ -74,20 +112,19 @@ examples:
>          #address-cells = <1>;
>          #size-cells = <0>;
>          connector@0 {
> -          compatible = "usb-c-connector";

Don't mix cleanups (whitespace changes) and sensible changes.

> -          reg = <0>;
> -          label = "USB-C";
> -          data-role = "dual";
> -          ports {
> -            #address-cells = <1>;
> -            #size-cells = <0>;
> -            port@0 {
> -              reg = <0>;
> -              endpoint {
> -                remote-endpoint = <&usb_role_switch0>;
> -              };
> +            compatible = "usb-c-connector";
> +            reg = <0>;
> +            label = "USB-C";
> +            data-role = "dual";
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                port@0 {
> +                    reg = <0>;
> +                    endpoint {
> +                        remote-endpoint = <&usb_role_switch0>;
> +                    };
> +                };
>              };
> -          };
>          };
> -      };
>      };
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

