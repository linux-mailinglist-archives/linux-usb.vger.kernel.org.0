Return-Path: <linux-usb+bounces-29048-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C290BBC64D4
	for <lists+linux-usb@lfdr.de>; Wed, 08 Oct 2025 20:32:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CA3414EE006
	for <lists+linux-usb@lfdr.de>; Wed,  8 Oct 2025 18:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43AB42C11E1;
	Wed,  8 Oct 2025 18:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eDuVItXB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BEB2C0F9A
	for <linux-usb@vger.kernel.org>; Wed,  8 Oct 2025 18:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759948327; cv=none; b=GsV5c52JU5II4uLMJRf3y38wBC26CPAhKH+ROA7qgYJKJ2jLFGtmx8Nz6Gc2ZUixkASZNye8+o6L91emOiO0Uf6rzGNzG76Oe/yNMWVM/YJdEPm75+mPC7Qj8cY6ZDX0NFVhxrn/R+P5lFvxaqJDDw+9qbXQTkLWAddoLxD1Jow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759948327; c=relaxed/simple;
	bh=25FN7DjXP5x3tJCg+gQhzwRMzdMByaBgob5iKkpDksI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GNUyKZJ50xl16XivOBQpui+DozA73UBNB7gGcp+tK83Io+WW648mLRHsAqiKKwLjNfVMyZ3Fk9edcCFHTnI2lZMM1iUuACphTmKalzoONed+y84/bUJdfbHETlQd86S7bFItUgGmAvmA7d+UodXE0WIZpoTcpDPNu6q589A8JCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eDuVItXB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5MXI003100
	for <linux-usb@vger.kernel.org>; Wed, 8 Oct 2025 18:32:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Uqwx5jDVnMd++8p09CsvgmiE
	n2SAfFQqSRGWKLGynvk=; b=eDuVItXBQkSAJMKmpD7Ml8AFWA63pV2T7OLovBMb
	yYlzNYq18nj9jRKbRrYZHPxXf4ptpan0PFLbgo3PGJu7vmMAsNUrJnwtDucYB63t
	Cl9sW1SOtkd80EZ2Dt6AZBHNYtz3vM3DCdX5Rhg0SzRxH1eEfaJ5KYZNZ5Tr7tbs
	xFKjORaGzWiJkBtIZuTgnNmfpGA903z8xxrviVBD86tTpzXHrCuvSeUCHqiEX8ov
	4TYvXxWyq23t3Kw8953QlMWb4oNPASQqiqyvzV9CdVHj3jVbpZJ3LKdePuf1rfT2
	dsP+aWagsR8xNLa2RIgz07Hv+eRwSyZRp5pvEZ4Rj3ZizQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4m08a7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 08 Oct 2025 18:32:05 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-54a7e0cbb98so173248e0c.3
        for <linux-usb@vger.kernel.org>; Wed, 08 Oct 2025 11:32:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759948324; x=1760553124;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uqwx5jDVnMd++8p09CsvgmiEn2SAfFQqSRGWKLGynvk=;
        b=hIQRbsSXDcFUkviTIMPmZcP5KLUv5BJOWHE38ZstkgEy0lnZtpQyAUDW53SAEhWWWi
         38UuawioE8UFHXK+zreI8s2PPFJEa8a92aAgz9/SM8DpU1Dck54uYvDKa9bfLD1keaEn
         dYAtdNfjMocxNROezGoIPTB2tj/sKbD9VhubEX/PKKryJFQYW4crJiqbxuvhtYiLlmd0
         rFhcZWu/wVtDaSPfe0Ll4AD8drQTDm+CwMB0ZiwbaL9HG5XKrqdKdXlW3EBUmyCzwyQo
         SgLZhDThmn1kI7Bk8pKEYfL9q/RZaE5JS01cLFfeZGYpMvkDJTecc0t0ZQXDufmlMP+O
         k7MQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4UsDxddnu2hPVgdrbHKMWD6i/JBb/TCqkQ86MTasYHRik+JHcPFod+fAsEsA4b/nBaDonvltu8Uw=@vger.kernel.org
X-Gm-Message-State: AOJu0YybKoA5twcqFqio/MI3VCTzAK9bN4h2CSHz0MzZ1injZjgv5BX8
	eEEcbDUZm9rhAZw+co1bYCZwMUo8q98YgB/jY+aEd8mUDd3YZe0efuRnc0KSTzS1ClwpQL15h8I
	i0j//59Az089RDNVIWkJ6h2ccI32o6DM5hnwQE2+u6JM4oo/12D7tVmZXOThlRrg=
X-Gm-Gg: ASbGncv+33QKMNWyFiE6JtQKgQevqsmzSXRz49br+4LinkB+HkxEIXTfIhaK5nFLNJj
	198zLd1BXtLLjiHXFGvPnAMpV+yQWwvroVqK9XTfYFR3HvooYFmqAXgltJmZGqw3mB3bCvQ8gND
	3SaacEGOHE6/yf/eXWC8MLcmkheZUPuJl9swbbiaM+4jdpCW7CIFlqVVqbR65LeGAygdAccudWp
	CGNSyfxoeN103qsZ4CXpCzouPvKFWkEqu3a/fa7sbjGLh+YSKCPzvsJ0qCIZbINzFSHvPW6lj2U
	EVYF58s1MhcX5mlC1BE589c5dWYWGC47hiA32s4MIYwBuhJzTmNYAT+U/zX9B81Uk3vWuNAmgi8
	kmVwokOp6paBb+CnbiNP76msQbUKVQmODhDZHWWM5FGCIGeEjYL929jYWYw==
X-Received: by 2002:a05:6122:c85:b0:54a:9316:f429 with SMTP id 71dfb90a1353d-554b8a7f865mr2116604e0c.3.1759948324124;
        Wed, 08 Oct 2025 11:32:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFeridrpdJSwKBLLKxqzplda/MdVxnX9sdNhyATyFOKBILM1gJTPYRMJOlDLg9eqNSXDqCRYA==
X-Received: by 2002:a05:6122:c85:b0:54a:9316:f429 with SMTP id 71dfb90a1353d-554b8a7f865mr2116589e0c.3.1759948323654;
        Wed, 08 Oct 2025 11:32:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-375f39fcafbsm22678541fa.26.2025.10.08.11.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 11:32:01 -0700 (PDT)
Date: Wed, 8 Oct 2025 21:31:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: ti,hd3ss3220: Add support for
 VBUS based on ID state
Message-ID: <odikli6rfdyid5oqavurtqytgnwgh5hpmka2jt5tprpdw7cd72@icpnjnkfowt7>
References: <20251008175750.1770454-1-krishna.kurapati@oss.qualcomm.com>
 <20251008175750.1770454-2-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251008175750.1770454-2-krishna.kurapati@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfXxZFjT4bSZrnz
 E+0LzMmS2Oj2W9MVzWSjCnSM3MK1Oa2vUy/IhjM9djxuBBYPBVzNb9ub5Qx9FagNV0ycnm2KGuW
 WErgNLHjq5FwAhAB4kJOyohy6AytHDgcqSftaJn2NjJW4qgUah/xg8xOHwBEt48bD4NkEUD72lx
 96FUPoJqXEpMfPOsMfu52U458v1mgwdX8vnL1s1B/mYyG+2/1lj3P/4rpXyE6X+Mnb5XsxkCxkO
 hxrmfE44CLHlPjBYFHE1PHSIX4v2/JN58IFgrh6J+P0heg5dSz1OcmoxJkIviEPSVRI6nafZ8dc
 qjmMer0ZcqYWzTeaJIIdgfRn51V98AW2e9TNusaD0/9U0e2OyragoUra38ztLfjKPBrzP5TU0Vn
 J+9t+OwfFNdDny2FpUONOla8AgasHw==
X-Authority-Analysis: v=2.4 cv=B6G0EetM c=1 sm=1 tr=0 ts=68e6ae25 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=smUmI0uzo1bZzf9w9C4A:9 a=CjuIK1q_8ugA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: RnmzdvQE6GzHe91PIvBHDzotmIPJR0kl
X-Proofpoint-ORIG-GUID: RnmzdvQE6GzHe91PIvBHDzotmIPJR0kl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Wed, Oct 08, 2025 at 11:27:49PM +0530, Krishna Kurapati wrote:
> Update the bindings to support reading ID state and VBUS, as per the
> HD3SS3220 data sheet. The ID pin is kept high if VBUS is not at VSafe0V and
> asserted low once VBUS is at VSafe0V, enforcing the Type-C requirement that
> VBUS must be at VSafe0V before re-enabling VBUS.
> 
> Add id-gpios property to describe the input gpio for USB ID pin and vbus-
> supply property to describe the regulator for USB VBUS.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/usb/ti,hd3ss3220.yaml       | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
> index bec1c8047bc0..c869eece39a7 100644
> --- a/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
> +++ b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
> @@ -25,6 +25,19 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> +  id-gpios:
> +    description:
> +      An input gpio for USB ID pin. Upon detecting a UFP device, HD3SS3220
> +      will keep ID pin high if VBUS is not at VSafe0V. Once VBUS is at VSafe0V,
> +      the HD3SS3220 will assert ID pin low. This is done to enforce Type-C
> +      requirement that VBUS must be at VSafe0V before re-enabling VBUS.
> +

Stray empty line?

> +    maxItems: 1
> +
> +  vbus-supply:
> +    description: A phandle to the regulator for USB VBUS if needed when host
> +      mode or dual role mode is supported.

Why are we adding the property here while we can use the vbus-supply of
the usb-c-connector?

> +
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>      description: OF graph bindings (specified in bindings/graph.txt) that model
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

