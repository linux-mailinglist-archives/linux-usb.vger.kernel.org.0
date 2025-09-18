Return-Path: <linux-usb+bounces-27351-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C22E3B39CC6
	for <lists+linux-usb@lfdr.de>; Thu, 28 Aug 2025 14:18:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E4ED1C82F4F
	for <lists+linux-usb@lfdr.de>; Thu, 28 Aug 2025 12:18:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 517BE3101C7;
	Thu, 28 Aug 2025 12:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="joJzk8fP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AE730DECC
	for <linux-usb@vger.kernel.org>; Thu, 28 Aug 2025 12:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756383346; cv=none; b=qfyxc7MflcUOXZZcKH8PgJ428tf5hqHRO6o8QowBezK7sz1CDl+2nH/le+49HD6aBUek79n6Emnce69TFpp5mlHroGfGL14LploAdrqvML6VC1GYbG0VrEICtrlf95AqmuW88DwVkcKxXhms21G3mzYA4hW0X3x1deqYQGtW2XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756383346; c=relaxed/simple;
	bh=2xhCRHRTLxjuQLGzNqN8SkuqvNwon6nBw35IuX6DRFU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VXgRew71zLYWWP5aSrqzcWMKCsTgH4TeWmS9zBmVdzFS/FtuVs3XxgFI5B5xg5JTyCEc0oS4+mZzLz15xAczlIQT3PgWAiTqCZ5dpkc6HwFEKBBTWgsRZAoDKa9/9w3NnAKuf9o9cPn/kWZGemGym+RG3r5Ja3Gge3Y3rLdNOAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=joJzk8fP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57S60nMi008186
	for <linux-usb@vger.kernel.org>; Thu, 28 Aug 2025 12:15:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sOlqLjJ4+85L5pngv20TDeHigXp7nWgjBGPjqExbJGw=; b=joJzk8fPNrb07kV1
	dPOO5dApt8wVm5oGGKgWCtdV1DFmHk6YUQr/vY+qBY/dA8Yp4hWvEQoBbrOyffgC
	BGUsq0HIo3yO1faSCFveHXeFtNtrfvVejrq9dSn+Dkmb3XT1d5HU0z/f8zK+OAHl
	ahjtbhYx5A4Xg6LJwcZOM8UpLCihss2TAa6A8jBAhImd87Gh8js3+Wlzs2uiBWK6
	ptDkBEyTayINCtjYnqoXXdfgiZNvmjbEPj8Z3fWZJuNy6HVOS/kjpXptsxpCL6hI
	/KDPt004yUYkMVNXtjmtXJwa9NZRbA3EPFR40LhwZrTpoC04a9IvCRhmsoGfEAWz
	rf4YAQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48sh8ape55-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 28 Aug 2025 12:15:43 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3276575ae5eso1047289a91.1
        for <linux-usb@vger.kernel.org>; Thu, 28 Aug 2025 05:15:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756383342; x=1756988142;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sOlqLjJ4+85L5pngv20TDeHigXp7nWgjBGPjqExbJGw=;
        b=DhdsN7u55NtWS/CRz4Ce67Lx6j1wl6U6oK1H90AjEitl/dPp1PfQ5G967Uy031iAnD
         Y2LWHyRnGO7DqOcBtop0Tgoski5fDP7u12bqdwf9/Rl0/OfWnekgI88cNjongpMPI9dz
         n2yjc44qzdEi57YcbvznGs9WdF95boSA4PyxVatUy3yKnz44hSJDNDLmKgyhdEYZ7GL+
         8wKpuEYKjCV0vNje6e9bOpygkvA8FNk9PyEYe1i+oSdfeGEKScP1fu7jb8Jq973uLQ9f
         7t/cUO8cF4BqSqPR0bj+HRgNmt35o7Aty0IQ4tHhZUVK2rEdcPwr/vvz0d0QTQssDix7
         Bxaw==
X-Forwarded-Encrypted: i=1; AJvYcCWwRFVYEm7FDs16CnpOak09pXr/R2MftaqCCfPluKkckqlMaQZy6aGHLROSd7E4yTJPN8n0xvZnTgw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRiGyWaH6+suGzkMMyfeSIuT+TTMS0bAOUbOzIZSrENvjNlYTh
	IYMQdqOSQ5IQjBGH9PHh6uQMSnY6E0W4z+lawKJr0qvXEy10GKtboIwINa7A3n2WMLFSekL4IPu
	L7flc9CuG9V8yjMvE5kLKAF979ct59BQhQIvRZvYleFUlWc+K2/oEIGkrZWMU5Rbt/ZmAivJtH8
	wFyxl7YALj6qS37XQsbRE/JCDVIycfi3PnI+Diug==
X-Gm-Gg: ASbGnctwXjA+nhnmaB0Apu1OSyTMZlZlNGsQcc2XrIERnHdF0x60wbXpTBVEBU9JTSY
	Wn+B4Hm1zOwiSvsdNDVjFJz53dB+gv56jM48DlygEufT/NR850u4K64Q0JyMEGNRtD41a0SRiTe
	vWDJnfyFoVRf2tSFmJ1pkKao0=
X-Received: by 2002:a17:90b:3bcd:b0:31e:ec02:2297 with SMTP id 98e67ed59e1d1-3251744bd07mr31170096a91.19.1756383342303;
        Thu, 28 Aug 2025 05:15:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSsXkSAZdNMuiuXSHYHnTqO7N+RkBf5W6xlTEjzKw50BVu/0ezesPtrdfj3US2rSF06Spip/rafkI1bV+Bz8o=
X-Received: by 2002:a17:90b:3bcd:b0:31e:ec02:2297 with SMTP id
 98e67ed59e1d1-3251744bd07mr31170041a91.19.1756383341777; Thu, 28 Aug 2025
 05:15:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812055542.1588528-1-krishna.kurapati@oss.qualcomm.com>
 <20250812055542.1588528-4-krishna.kurapati@oss.qualcomm.com> <d121952e-4662-4651-9398-3a5446a2281c@oss.qualcomm.com>
In-Reply-To: <d121952e-4662-4651-9398-3a5446a2281c@oss.qualcomm.com>
From: Udipto Goswami <udipto.goswami@oss.qualcomm.com>
Date: Thu, 28 Aug 2025 17:45:29 +0530
X-Gm-Features: Ac12FXxpoBpQzfudUCruaW0Kd4qcz4c4oR-SINclPGIyBv5ZH2lkiXCY60AdRnw
Message-ID: <CAMTwNXBM2m6sazPZVng3V-DDJP2T0aVBgh8C5d4K7Yq_O_A2Jg@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] usb: xhci: plat: Facilitate using autosuspend for
 xhci plat devices
To: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Mathias Nyman <mathias.nyman@intel.com>, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=cLDgskeN c=1 sm=1 tr=0 ts=68b0486f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=EUspDBNiAAAA:8 a=VUFb5atXsKZqicoco_gA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDE1MyBTYWx0ZWRfX6nlZnAq/CyIt
 iQsYXTk95o/rrLbJaC/cfYiWjuHti3JUPzu+MSzAaadOyB/07n5mpIiyrXHrluTv2n5E417Iu9B
 5Dr6ZknlRGh5B9ujYhKrs+VBDKpZN/P0HkCz2nxBTJKS6rqgPhgyPemOedH4xRkizgwwtsu3vZw
 VstZPGDEhKmhOhYKsSBJqFAj9Mtb28+X1Rua9CTQMRaQnig04fA8rG1TGcB0vxeCHdTQmr95sXb
 nKQvu/P/d4mP5bmjSWjvTQV9VFqj9C/FhEWUdFSxOZSTsrDIe2Yl4HFmDn5BJ5rs6RUcqZy69XM
 3JCt12pGY17s4/H9OamARGbyc/i/jetOa7j/+nUQaehDP5g6C+2zjRTblvuxxHYJwWigxAf18Ct
 fg2x9W83
X-Proofpoint-GUID: -ic_6-9-nZwE9n2tkG7YDLaE4UGedsjL
X-Proofpoint-ORIG-GUID: -ic_6-9-nZwE9n2tkG7YDLaE4UGedsjL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508260153

On Mon, Aug 25, 2025 at 11:10=E2=80=AFAM Krishna Kurapati PSSNV
<krishna.kurapati@oss.qualcomm.com> wrote:
>
>
>
> On 8/12/2025 11:25 AM, Krishna Kurapati wrote:
> > Allow autosuspend to be used by xhci plat device. For Qualcomm SoCs,
> > when in host mode, it is intended that the controller goes to suspend
> > state to save power and wait for interrupts from connected peripheral
> > to wake it up. This is particularly used in cases where a HID or Audio
> > device is connected. In such scenarios, the usb controller can enter
> > auto suspend and resume action after getting interrupts from the
> > connected device.
> >
> > Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> > ---
> >   drivers/usb/host/xhci-plat.c | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.=
c
> > index 5eb51797de32..dd57ffedcaa2 100644
> > --- a/drivers/usb/host/xhci-plat.c
> > +++ b/drivers/usb/host/xhci-plat.c
> > @@ -171,6 +171,7 @@ int xhci_plat_probe(struct platform_device *pdev, s=
truct device *sysdev, const s
> >               return ret;
> >
> >       pm_runtime_set_active(&pdev->dev);
> > +     pm_runtime_use_autosuspend(&pdev->dev);
> >       pm_runtime_enable(&pdev->dev);
> >       pm_runtime_get_noresume(&pdev->dev);
> >
>
> Hi Mathias,
>
>   Can you help provide your review on this patch.
>
Hi Krishna,

I think the email added for Mathias isn't correct.
Adding the correct one.

Thanks,
-Udipto

