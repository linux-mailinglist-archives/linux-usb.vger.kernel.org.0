Return-Path: <linux-usb+bounces-29448-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BABBF037F
	for <lists+linux-usb@lfdr.de>; Mon, 20 Oct 2025 11:38:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67A6E40091E
	for <lists+linux-usb@lfdr.de>; Mon, 20 Oct 2025 09:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4060C2F6565;
	Mon, 20 Oct 2025 09:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IrSxl8FR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E712F260E
	for <linux-usb@vger.kernel.org>; Mon, 20 Oct 2025 09:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760953021; cv=none; b=NQS2H6ROLyK70nYu5FJ4tw3DqPH35PB8LHWU3AYwJv8vRATULJzVzOEXsoKlz9sQ9TgI23y9nIH0PSNyItkf1N4OtyPGNjjdx1U4LAGIGMkORVUfny2Cuvp3f8pn2oXtIQr8vRW/Dvmzw3V/Xfqj7EQJ9jUM7CP2/xaRlF+Q/Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760953021; c=relaxed/simple;
	bh=YZ15euOakiZvlVBPl9ruuc+yR3Sdm19aUAPmS9fXMQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M/GDkYSdUl+YGLM6B7cQeVNR2VoiVhew7rABPHji5MZK2QE8LpdqJUQ1GqRGUHUaAGWXGy/xzf1DWJqFUq/98cnUr6MP5mioROMJO3KiYCJGnfmSlkVdtSWgQALf63xcP4Ws2v1du3DYFBIMQzXaidIGqQyL7uEr551rydGpZuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IrSxl8FR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59JKrNa1028857
	for <linux-usb@vger.kernel.org>; Mon, 20 Oct 2025 09:36:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XYPaCZK9lFZQfJrY95apWWVB
	R1MeyMyX9uhR2ZkcXEU=; b=IrSxl8FRH6kKCdyRA043TGfqLpLDN4huo60O/Dnj
	pj04nAsif/GWB+J/5Da/R5xaMxGJsIbmC64Sw5ysoWnJbWakGqYRYOW6v9xWo1QC
	IQshtwoXPq4EvoJUf4ae0atoTQf20D3TkrHm345U3D+IphKz53M8E1U+SyWwQ9E4
	7g0rqiFe2CZ3rEl2ccn/jrq4B++22DuLiccbnvujvEi7Gixhdos9OibcfH6jw7Xy
	MAeDgLNGiZG7ciRvNeOhiomIuMlrCDOYXdoMggTGirqxloyiko5fPuDWwpX5xQOm
	Dcn8D6+ViSuoTOharcjhgM+zGVTvMAibSnI3kJLrd+KWxg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v39848fu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 20 Oct 2025 09:36:55 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8787a94467cso166428696d6.0
        for <linux-usb@vger.kernel.org>; Mon, 20 Oct 2025 02:36:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760953015; x=1761557815;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XYPaCZK9lFZQfJrY95apWWVBR1MeyMyX9uhR2ZkcXEU=;
        b=q8rMKYc3Th9iAob6+lrt3s+2EFVizdzoL8l9gphfWnapFn5rRrcai/z8n4Qu9iGivH
         EVqTI+b1Zg+/cLeYQcERc9zF2KMiPbIwRC8S0UPvauHKzDTxjUIT2DjmICMDmgLF/uWE
         Uvec02lwZ777aS5kk+38WZ6aCAB/iORmpU0y1JIFRPmrAvDjrboGQyGKDnKsL/+lmqoq
         XIwoRTAW0+XS3+gmtzhE0fhQyDmclfw0lBqJoPNd8/RDfj1YCjl9AUnVMavFmgzxKuxG
         Ybgl4caizeUx7OG7Nkq3G5lG1lVTqoIxeJofKlDRbzt9js8NskWo7mZcPVN9BpHOt4vv
         yXLg==
X-Forwarded-Encrypted: i=1; AJvYcCVUhzfoCY+vSKpit+yhwoeIjSXGBU+LmBY6OdY8ud3fx0Y8I2vQ9If+G1u1cftGJ9VUpIi38i0NqFA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz23ODDzWNM1CSZU2vAHRhxetXlXVb0LyTKezzt5komxFHlRB8P
	6q3ccGo30OzaT8rxSIVUhDqoxQoFnV3AbEBozw8aHMdhSoSSLOUvL0brnR8/RV9DVFh6TPX11ZE
	6x9BJBQwRqrFz1gsbq87IHDdLqQxBugjiUEoyPKAIJSzbd6RzQEoiJkCcRidBWJo=
X-Gm-Gg: ASbGncvb0xBuq/+euCmteirq2IT9UtEQJy+K3BUGLCsQc1tGBxtrrMYEm/0p1YxLgrO
	TiBDLuNtKgx3pdyrdgZ11dkiC/DJHjXUmNjyFsbSPd2eoAT9HiV3d+cSbWv720gEGLesqp9HO7t
	EPL0BTiplJ1eGmZI6n6OoVY8WOFENaqIE44UwX9xI3dyN+UMsPQAOLHSDAeCXNVs3HYoJ6XhwTD
	o8UX9NKnwt9MpMEcIYUmMZCEyEgkAOnVn7+X0uhM0sVNGAQnOm8pJM0QFpitGsTJRicC6NsylGK
	u7QUOpmlFE1n7Nn/51z8pqKDI0NknKd4e5b5ZYIEOaAuV+rPBU2hU4eZA6QZPxk5KaBr6VQRhxu
	jr7oNHAOeJ1H+hFmNdsxNi0eofpYiQ9NBrFGeVFX+BU8NoFoprMCYA5CZxgvNf5YEnjGhUZ0DXM
	i3yB9O8e2SoI0=
X-Received: by 2002:ac8:6909:0:b0:4e8:a0bd:c198 with SMTP id d75a77b69052e-4e8a1fd529bmr135724091cf.28.1760953014525;
        Mon, 20 Oct 2025 02:36:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEo8EW4nY48rPGkdRE2eIPwUX0Hj7L1IKDd+bQqSs9NGqsF11BVsarC6cEFEV3KWRpIJvSYUg==
X-Received: by 2002:ac8:6909:0:b0:4e8:a0bd:c198 with SMTP id d75a77b69052e-4e8a1fd529bmr135723771cf.28.1760953013983;
        Mon, 20 Oct 2025 02:36:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591def288c6sm2327452e87.111.2025.10.20.02.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 02:36:53 -0700 (PDT)
Date: Mon, 20 Oct 2025 12:36:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>,
        "Chen, Antony" <antony.chen@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Fedor Pchelkin <boddah8794@gmail.com>,
        Andrei Kuchynski <akuchynski@chromium.org>,
        Venkat Jayaraman <venkat.jayaraman@intel.com>,
        Myrrh Periwinkle <myrrhperiwinkle@qtmlabs.xyz>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: Detect and skip duplicate altmodes
 from buggy firmware
Message-ID: <66gkc32hdbzdxpnx3r56bfzt4znw6xj7m3j6363mus4nf47kf6@3f2hj5qwsb46>
References: <20251016055332.914106-1-acelan.kao@canonical.com>
 <aPX-ZxwaweJjtv3J@kuha.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPX-ZxwaweJjtv3J@kuha.fi.intel.com>
X-Authority-Analysis: v=2.4 cv=KcvfcAYD c=1 sm=1 tr=0 ts=68f602b7 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=DfNHnWVPAAAA:8
 a=boHE0e0CFg1F-sOyiqoA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=rjTVMONInIDnV1a_A2c_:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyNSBTYWx0ZWRfX7K/KeCv7RFkz
 wY7cBF6ZTOR3TOg/GBXZAZsTvHP5sAT/sa6XOmpfsrOGDEFUtf7Aq4udhfJM4FULjwMexN1y9Rt
 s74l223r7PXk6wqfcaxUu8TRtl1OswZ+A791VvTOCXeCORXo/nUnZtC8Bus918F7rkwYEm6+e1U
 ouYj/JahrBZ7FjLre12EvOQklCOB9Zl9Guh7OrMVycaXf2wqKGofogxOJiV4s1UpOKPhJKKqAyG
 PfNLhELxodvELhehNb2DWt7U+yBWyt+LfSm6UNsTt/lCM87zq3SVRGzAfTIwxSLSwedlEUCEJVG
 QPD+QtYm3a7lhs377ZZdjs25IeqGwvFNa5S1P+DFiwlJUutMqjTB58bDxWRSkotje6zkQvPATy2
 4UoCIO8jGcUHHg7P3+9vky8i9aPX+A==
X-Proofpoint-GUID: 3ICzn6I7mQHO98R3YfEN_xxE8pFWT8Sp
X-Proofpoint-ORIG-GUID: 3ICzn6I7mQHO98R3YfEN_xxE8pFWT8Sp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180025

On Mon, Oct 20, 2025 at 12:18:31PM +0300, Heikki Krogerus wrote:
> +Antony
> 
> On Thu, Oct 16, 2025 at 01:53:32PM +0800, Chia-Lin Kao (AceLan) wrote:
> > Some firmware implementations incorrectly return the same altmode
> > multiple times at different offsets when queried via UCSI_GET_ALTERNATE_MODES.
> > This causes sysfs duplicate filename errors and kernel call traces when
> > the driver attempts to register the same altmode twice:
> > 
> >   sysfs: cannot create duplicate filename '/devices/.../typec/port0/port0.0/partner'
> >   typec-thunderbolt port0-partner.1: failed to create symlinks
> >   typec-thunderbolt port0-partner.1: probe with driver typec-thunderbolt failed with error -17
> > 
> > Detect duplicate altmodes by comparing SVID and VDO before registration.
> > If a duplicate is detected, skip it and print a single clean warning
> > message instead of generating a kernel call trace:
> > 
> >   ucsi_acpi USBC000:00: con0: Firmware bug: duplicate partner altmode SVID 0x8087 at offset 1, ignoring. Please update your system firmware.
> > 
> > This makes the error handling more user-friendly while still alerting
> > users to the firmware bug.
> > 
> > The fix applies to all three recipient types: partner (SOP), port (CON),
> > and plug (SOP_P) altmodes.
> > 
> > Fixes: a79f16efcd00 ("usb: typec: ucsi: Add support for the partner USB Modes")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
> 
> Thank you for the patch. Before going forward with this, I would like
> to make sure that Dell is not using the GET_ALTERNATE_MODES command in
> some customised way deliberately, and that this really is a bug in the
> EC firmware.


Just to point out, we have had a similar issue with Lenovo Yoga c630,
see yoga_c630_ucsi_update_altmodes(), the EC was ignoring offset field.

> 
> After seeing the trace output when this happens, it looked to me as
> the first response to the GET_ALTERNATE_MODES fills the MID field in
> the response data structure with different SVIDs for some reason
> (maybe with all supported SVIDs)? If that's deliberate it means we
> should drop the first response, and start registering from the second
> one.
> 
> If I've understood correctly, we have people contacting Dell about
> this.
> 
> thanks,
> 
> -- 
> heikki

-- 
With best wishes
Dmitry

