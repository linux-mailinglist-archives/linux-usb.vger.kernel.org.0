Return-Path: <linux-usb+bounces-29126-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 303F3BCE1A7
	for <lists+linux-usb@lfdr.de>; Fri, 10 Oct 2025 19:38:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 81D9534BDB1
	for <lists+linux-usb@lfdr.de>; Fri, 10 Oct 2025 17:38:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10E822222AF;
	Fri, 10 Oct 2025 17:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eCXD/oji"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A00B21D3F6
	for <linux-usb@vger.kernel.org>; Fri, 10 Oct 2025 17:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760117908; cv=none; b=G3qJ9XGUUBc4f+g9LEbGFgiQSpQsP0WaIUY61cqYTQU3bBriamQkRYlYdhyY05aelHzBqRsQNX6p8Isw/+wmCKA8KnB/ihTWCNALCse2p+AIIuEBH9GjTMzmiqyGUbNu3XBFv3OK+RZJ8OpLzd8NYtQkVv/tWfFzHJHlinqrATU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760117908; c=relaxed/simple;
	bh=WlMRssIh5zYebG/2qOucIDbKqlW9Tme8xzWY4T8SErc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QbFOROBDET6noRBR9PwK4VVPQOBOMZDokonZ/07s/QSOnAMI4wrtfv4byd7gYOQqv4Tj1X7QY766N6givGKHyWXrVWAbrFEHmxDQansb8lRYk4Cqul1JTOD6GuUQVVibUyyC9IoiLha4WN3RrIAbPDyo0sN10BVv5ZckZWhThuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eCXD/oji; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59AFh3Eg018535
	for <linux-usb@vger.kernel.org>; Fri, 10 Oct 2025 17:38:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bHopJWpMCYVDcAtBNZFS+e4d
	nBu6DmW8XDXrseCiOq8=; b=eCXD/ojiHGrMPEvKSChJR8lmJv2FWtHjBM6MQNwa
	C8h3O14kpQsEABo+IeaxcNbtq8M5irtYvws2H0DbxLfHPQTS+VZZOgxAaRQ3JFZe
	364CygO2+85Lo16LjbyZfWS7PjMyJpJCNogy6hK5BfNFIbuluuzlDbKBypTB13V4
	tAiehVEyHJ9AaC7Ab2r0CjOZfBNB+oxf5ttrF60zcD+xrg/aDZe9x51nduUZsx3N
	xDTCcYefXddrY2ZJo3G135m010sMLYTVrarWhriy2h5hpEG3NK26aO5a0R5Ys0Rp
	rOf8z6w2IUZqSEziGpm8VaeTKB03VFggFaegY8XKrnjUYA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4m799y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 10 Oct 2025 17:38:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-872d2ad9572so914946985a.3
        for <linux-usb@vger.kernel.org>; Fri, 10 Oct 2025 10:38:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760117905; x=1760722705;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bHopJWpMCYVDcAtBNZFS+e4dnBu6DmW8XDXrseCiOq8=;
        b=P7URknBZoSUpp15Y07pXL8LgluW6xk3AUzr4OF9KOrXM74BAsoPPF71QTMBgiK26ah
         VKMXDz2BPl3milkQdViLXaZa2tIW2io2blzjh7SmsA0MNwQKBJnLSpuN1Phqh/gVOSwd
         OOQtJEwA3+5dQkeeMPh4WF58zbKBMs19aIl0HrI5nEU8prb4NCUGdVNcPRy1gUILmRgb
         EgPgZFFR/NJ7cZvvnS6Fh3lrCyeTN7JNTDiVxURlpgZQFFZanXE0hM6Z4VvBRwIyu68E
         z609pgk+CNJo1Vdd9XRz7oTBlqJmjH1q/7dLH2SyV+vzEQ4a+r0+8C9AE06bs1ThnTFv
         kKhA==
X-Forwarded-Encrypted: i=1; AJvYcCUcEHngn6RdWVU6YFywUgncn+BCOBcGSWSPvBy/ig3zSYW7unYnQC3rmZ9d4TkHumOaM1Pe22vCwds=@vger.kernel.org
X-Gm-Message-State: AOJu0YxduFVInEVS4sVbS9lVH3uunhGjrjkbQO1bSGXXLu+KpczjdOpK
	rUI6IpTrqBa3CqawHhgocgAuqUtcjSq0g5e6vA+LNnjoxT2alXK31EN8leucjSJwYOi3CUSHfiw
	zr48W4Tv6ajfkiGPb3dCopVLAhQcdloX9xyqMZNQoq6rlHjKoPquiqExgDQuQnbHvKKiIpZo=
X-Gm-Gg: ASbGnctAQMtY6noIojYUYl5CDlxzXzvtzqUXiN20pUE1NysleYhGIBxSzTzkc/DGvee
	BXdVAJRj70cuGaH31ra7Kz/lSSbSZFa4w0uVVxjWML+YEgWZNM37qDVeL9DsAquJCxKUEOc8+1z
	cV3ZSK71m86uP5nZ/ayjwF6qRRD/JINyJIuV44SMxz579UZc/JZokvYUWpPjmH9fKtLo7AgoOpt
	97/yb5pJRG79z48WLAm3dgymI6gi6bWRkDm/riDPfJZA6uG8vLKzNxoj0wZufgHHmorlSqILpzR
	pSIXR+A9To9JMXGqOvj/l57hZeTOw1zUX+Yr4+8CBU/oZL+4eOcVL1DLUYGZCvJJRZPoyiWF1m0
	VFV8IJ8SHoPO4l3d3+bkxsT74Xdona62rm4oHq9ewrqBRZ8fYrefw
X-Received: by 2002:a05:622a:550b:b0:4d8:67fb:417c with SMTP id d75a77b69052e-4e6eacc6653mr200002901cf.16.1760117904795;
        Fri, 10 Oct 2025 10:38:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKChfLnLv6uMZuWTNjeEXangYm9IkXBq61vh5oNYRc8TIuCkU2/pQdzdpKhqDcWyE0R351rA==
X-Received: by 2002:a05:622a:550b:b0:4d8:67fb:417c with SMTP id d75a77b69052e-4e6eacc6653mr200002151cf.16.1760117904234;
        Fri, 10 Oct 2025 10:38:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762ea3aae3sm7638331fa.45.2025.10.10.10.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 10:38:23 -0700 (PDT)
Date: Fri, 10 Oct 2025 20:38:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jameson Thies <jthies@google.com>
Cc: akuchynski@chromium.org, abhishekpandit@chromium.org, krzk+dt@kernel.org,
        robh@kernel.org, bleung@chromium.org, heikki.krogerus@linux.intel.com,
        ukaszb@chromium.org, tzungbi@kernel.org, devicetree@vger.kernel.org,
        chrome-platform@lists.linux.dev, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] mfd: cros_ec: Don't add cros_ec_ucsi if it is
 defined in OF or ACPI
Message-ID: <zcs3utvlaac336ezw2y7mzbbjsqocbls3e4nx5sc4tufiig475@cekebowcrpmz>
References: <20251009010312.2203812-1-jthies@google.com>
 <20251009010312.2203812-4-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009010312.2203812-4-jthies@google.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX9tMtAmuhzI1V
 9GJU8e4PrhljDgERfm9MypR4NkyNYEDWy/8DNciWK1Tj768DZWmsvmN3Jp+O3tviZ4jZLIAGPzW
 Wb5qZZcvXJFvtDKGjJDsZxU6Bg0gBuck0hZMuRhx2fGVhoFynPoXq6eToZE4Btf2dCUFtdKMVFx
 Q9U8sZBWhmnlscOLkaQ6Fpdplakw2zWaEZcEWWUiaoCY7s1AUMVZsrwjuQ98wZXcc4zYk706Lc9
 cNsrB22kNmSuCnaOfxKVghwxsIoHUWTkdI45gYsPTXIoOugfcU8gOq4jSPcofXVeiHglZYn3iOJ
 hCM2amBcsy903ZXzT32zbPYZI8ib2eEnWfU9Xe4ntfN2EXdflOl86wJC8sEKY7R84Z7icm5vVyz
 CmmtGTqmNgWiMSaEwWSQekRwb03UAw==
X-Authority-Analysis: v=2.4 cv=B6G0EetM c=1 sm=1 tr=0 ts=68e94492 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=1XWaLZrsAAAA:8 a=aqZUw6bxmdrI7EJOglwA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: Q5zEev67IXjhT5VazAMXPJOH6B78geHY
X-Proofpoint-ORIG-GUID: Q5zEev67IXjhT5VazAMXPJOH6B78geHY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Thu, Oct 09, 2025 at 01:03:08AM +0000, Jameson Thies wrote:
> On devices with a UCSI PPM in the EC, check for cros_ec_ucsi to be
> defined in the OF device tree or an ACPI node. If it is defined by
> either OF or ACPI, it does not need to be added as a subdevice of
> cros_ec_dev.

It still can be a subdevice of the EC, if it has a correct DT node.

> 
> Signed-off-by: Jameson Thies <jthies@google.com>
> ---
>  drivers/mfd/cros_ec_dev.c | 23 ++++++++++++++++++-----
>  1 file changed, 18 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
> index dc80a272726b..1928c2ea2b8f 100644
> --- a/drivers/mfd/cros_ec_dev.c
> +++ b/drivers/mfd/cros_ec_dev.c
> @@ -5,6 +5,7 @@
>   * Copyright (C) 2014 Google, Inc.
>   */
>  
> +#include <linux/acpi.h>
>  #include <linux/dmi.h>
>  #include <linux/kconfig.h>
>  #include <linux/mfd/core.h>
> @@ -131,11 +132,6 @@ static const struct cros_feature_to_cells cros_subdevices[] = {
>  		.mfd_cells	= cros_ec_rtc_cells,
>  		.num_cells	= ARRAY_SIZE(cros_ec_rtc_cells),
>  	},
> -	{
> -		.id		= EC_FEATURE_UCSI_PPM,
> -		.mfd_cells	= cros_ec_ucsi_cells,
> -		.num_cells	= ARRAY_SIZE(cros_ec_ucsi_cells),
> -	},
>  	{
>  		.id		= EC_FEATURE_HANG_DETECT,
>  		.mfd_cells	= cros_ec_wdt_cells,
> @@ -264,6 +260,23 @@ static int ec_device_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> +	/*
> +	 * FW nodes can load cros_ec_ucsi, but early PDC devices did not define
> +	 * the required nodes. On PDC systems without FW nodes for cros_ec_ucsi,
> +	 * the driver should be added as an mfd subdevice.
> +	 */
> +	if (cros_ec_check_features(ec, EC_FEATURE_USB_PD) &&
> +	    cros_ec_check_features(ec, EC_FEATURE_UCSI_PPM) &&
> +	    !acpi_dev_found("GOOG0021") &&
> +	    !of_find_compatible_node(NULL, NULL, "google,cros-ec-ucsi")) {
> +		retval = mfd_add_hotplug_devices(ec->dev,
> +						 cros_ec_ucsi_cells,
> +						 ARRAY_SIZE(cros_ec_ucsi_cells));
> +
> +		if (retval)
> +			dev_warn(ec->dev, "failed to add cros_ec_ucsi: %d\n", retval);
> +	}
> +
>  	/*
>  	 * UCSI provides power supply information so we don't need to separately
>  	 * load the cros_usbpd_charger driver.
> -- 
> 2.51.0.710.ga91ca5db03-goog
> 

-- 
With best wishes
Dmitry

