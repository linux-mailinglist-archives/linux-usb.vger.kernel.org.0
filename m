Return-Path: <linux-usb+bounces-24304-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBDDAC3BC5
	for <lists+linux-usb@lfdr.de>; Mon, 26 May 2025 10:36:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E0E33A377E
	for <lists+linux-usb@lfdr.de>; Mon, 26 May 2025 08:36:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 834981DFDBB;
	Mon, 26 May 2025 08:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TYNAzWqF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12011DED4C
	for <linux-usb@vger.kernel.org>; Mon, 26 May 2025 08:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748248583; cv=none; b=qsXColUvHS7XbsTSIWY5+5sB8C12UHeDRpqMK7ua6MJnes9iivjrWr9nNTESfTGAabLXN83uE3CzVOaBBDysq1pMkwGRD7H31npTNm+gENGzLNk1VwQoESVKKO8pJSoFYc9MWFDk1kBUF4Ow1XT3LPhOaaFGFoQlXPwXUuhPGOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748248583; c=relaxed/simple;
	bh=ig8yGfuXTlheKDPzrYJSyRImZnbdM0WEfgOPP44WCxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QBwiANTWbRDjWBdLOLunA7q7/oG+NxPEqjlCNtgmC6X8hA5ejHEN+GjcUjjdrItkBXAcO3V3VVzVn+DTN1kWYo/GKO2z25yi89C/HliwVVl5ZhwYiMUsSew0WQ6dNvYPSyaKMpV84wfX+T3v63Oil2ZcVpzfD5M0clvvI5ez4pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TYNAzWqF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54Q0s1pm004039
	for <linux-usb@vger.kernel.org>; Mon, 26 May 2025 08:36:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fsJTi2rLjBcT2eg/nDlC+5C0
	Ps00BAskkMQxjnDjx0s=; b=TYNAzWqFvHzxhm9fOcwNfJsU205NjlgROYCaCYFg
	8sStda12YiS3bJ3eJsZiTVDwO+/0Kh7dvRGtrmn4I7pFdM0dPod6K5OHitzLXhnI
	SsDY184SRWyD7bizAZg7bBPLiPtdz58GrdTiwGv6PLKivuievHrt+b830NPQnnH8
	QR/6NEfzbyKO7fGVUWu7EzvQXAPubkWJS9h9iK46/Iht4Al+KNhqGrHHSw/+z4QO
	HLG7nLO2mA6mOJKGZahW6Zi3cjdzWRjlmCZlinTH5PwH9eTVbgVXosw5NleR5LIS
	jXOHCYcz0m93GFcWcpy05LOUyhdiocc8sgVCQw0vfUitKg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6vjkgrc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 26 May 2025 08:36:19 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f0e2d30ab4so36280036d6.1
        for <linux-usb@vger.kernel.org>; Mon, 26 May 2025 01:36:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748248578; x=1748853378;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fsJTi2rLjBcT2eg/nDlC+5C0Ps00BAskkMQxjnDjx0s=;
        b=cbtd2mnAQKLoHTIRnUMEfhCl7aV+i+k25Je4YObNrV5dOMLSwtPG0xJJnflDXdzvag
         k9IMVP/XJKKEZN4DtwaYvcESE5HMqJM//hnMWYds8DHU9PLwlyDwbTssih5olxNxegmZ
         13lNLoJEhiKaB5ofMb1+lk8skTWPF9w7zECPM3wAoqZVIlT4I9l0GF2bhc9aEWWPrQZF
         QlXKgOtI84VX6oFVkkezZ4gW0OJ5fiKg8A4Aj6CD49mYzFGC7LxDTsJsA5iXfXBgebJK
         OnM8Ja7WEve8OW1fQ5rlD1O70hgnX9iDLNKu4d18wEwxcpH7psswVxtrZ9dlIUNMnwYL
         Ax0w==
X-Forwarded-Encrypted: i=1; AJvYcCVztaByPc+Jm1sss9OvbBXBC8UwNWJ00WYZywSTmvqi2BHRxIOJ3qsjOLJMaEjxoiwK0srvLtzApUk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4uhI5Jt9DHF+0bpoux7+CwvZ6rjA5IXesfM9NL5NJbvO4oKuW
	DoyAfDAa8C6tKs21m40KwjO/4sgcJsE5lqw1MbeoVODYW+ZL50//sWmES06ZUgmUo1ufXhDJQKo
	IHK+FAi8zYBub591ZDUJ+u6Ms9+lk/Nq5nj+ccLDzkH8ABDGBMzA1KBF6xCdqxZQ=
X-Gm-Gg: ASbGncsgCeKYshnouR3hFo/LR4srXbyu/7rIq2YYlzHxgTGzaGje+gJN75RELHLqvNg
	FjM5bZsrPUx8N4ag09pR+IFtstaQ9kbXVDYOlZc69YQAgE6DNEFSmj9Tzgz57TsTQF2GTHFX5Cy
	vcNPB5GEXgGL1KRydauwK2667HPokkJb1UQVLaAg+wzWcrY+QsV0k1lCxUSiI67Zuq1SwaV/rX/
	xRavpBbj7UXkSxn8i6kRu58+W11FFQr3jiR9T/kOBb6t3j5LQeaQz/opLmIkIncfjoOjFb6yCkr
	jkEivLAnAjlO8UrEhYRbUlNdaQ25bdN/uTpAj54g0A6//jQV7nMBtGJPV1C01Gh4uvz1S4mA3RQ
	=
X-Received: by 2002:a05:6214:4115:b0:6e8:9dfa:d932 with SMTP id 6a1803df08f44-6fa9cff924emr124255836d6.15.1748248578349;
        Mon, 26 May 2025 01:36:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1qW3LJtbZrAui8aHC9A6IZ1BRb9kbSD2lOtIpI6gNj8xc7oFUG/Qx4hSZdB+Sy9YxMZqDpQ==
X-Received: by 2002:a05:6214:4115:b0:6e8:9dfa:d932 with SMTP id 6a1803df08f44-6fa9cff924emr124255526d6.15.1748248577899;
        Mon, 26 May 2025 01:36:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e702c9d8sm5055329e87.181.2025.05.26.01.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 01:36:16 -0700 (PDT)
Date: Mon, 26 May 2025 11:36:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: jens.glathe@oldschoolsolutions.biz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>,
        linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: Add Lenovo ThinkBook 16 G7 QOY
 device tree
Message-ID: <rvyfkow43atquc64p6slck6lpfsot67v47ngvfnuhxqo222h6k@kdvbsmf3fwsr>
References: <20250524-tb16-dt-v4-0-2c1e6018d3f0@oldschoolsolutions.biz>
 <20250524-tb16-dt-v4-5-2c1e6018d3f0@oldschoolsolutions.biz>
 <g7vlyqma6ow6tdsaqt2rfwvblxqwbqlwmoueio7i4vqvjy76kw@5bz4g33pq4t7>
 <CAMcHhXoYkQru_0n5siMGGkTcHu8yWRZWfT4ByiD8D0ieZHF+wQ@mail.gmail.com>
 <vwoixgdyjjzcjlv4muwrzv7wztnqyidtj7ghacgkjg6hgkkyl7@ji53bhiltaef>
 <CAMcHhXqDFuo+x99KOK0pQFj-FyTdQoZS_JvehNE2AC_JSoQ2gQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMcHhXqDFuo+x99KOK0pQFj-FyTdQoZS_JvehNE2AC_JSoQ2gQ@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=UOXdHDfy c=1 sm=1 tr=0 ts=68342803 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=gxl3bz0cAAAA:8 a=pGLkceISAAAA:8
 a=0TimfSER351lcrvkeT8A:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-ORIG-GUID: 8rC9mLf0DwBQcTvYK3SrmISbZC0uVqHk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI2MDA3MCBTYWx0ZWRfX7KLWJsib+NvY
 tGwUIh6/PLxDMrwgVoLH3oBzJ/C5VmRsXjP7sB+XTUhetKKqn8hRHnnRM7++p/ZU2jnUMOKtOCc
 2SIs1wfvFzjtERP/0PiwziYvUthLdWznUBYveeGyvV4euyr/E/QX4xAIGD9LCvdx4pTqqd6E7UU
 tB18AiMvuVjV+t9QQ6Pwjco47augmb8zJlLYAPTmBjN2wodC9Ri2vm+TLammrO9XjnQNDaSM2Ni
 FiII5QFogkJQK5N0oiKh53R3hUo7EG3B2Lr/XEplS5/IVbbedalmgDSBD6SuiX4sEAew9HIQRHB
 4Cqgy65DILGfV3ViSm72OC1NQWo8MXFdajSkv7nwg7/mPMDHX2B4jq78wdWqMeKNhgr7YaBGYD8
 5zW2RuSArxA1Ibvgk6i5zdYXX52PvRlujuFPWnrA2kMyex/rIidSHKcH5D91JJo+gnCou+oH
X-Proofpoint-GUID: 8rC9mLf0DwBQcTvYK3SrmISbZC0uVqHk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-26_04,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505260070

On Sun, May 25, 2025 at 09:43:36PM +0200, Aleksandrs Vinarskis wrote:
> On Sun, 25 May 2025 at 15:33, Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Sat, May 24, 2025 at 07:58:13PM +0200, Aleksandrs Vinarskis wrote:
> > > On Sat, 24 May 2025 at 17:33, Dmitry Baryshkov
> > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > >
> > > > On Sat, May 24, 2025 at 01:48:40PM +0200, Jens Glathe via B4 Relay wrote:
> > > > > From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> > > > >
> > > > > Device tree for the Lenovo Thinkbook 16 G7 QOY
> > > > >
> > > > > The Laptop is a Snapdragon X1 / X1 Plus (Purwa) based device [1].
> > > > >
> > > > > Supported features:
> > > > >
> > > > > - USB type-c and type-a ports
> > > > > - Keyboard
> > > > > - Touchpad (all that are described in the dsdt)
> > > > > - Touchscreen (described in the dsdt, no known SKUss)
> > > > > - Display including PWM backlight control
> > > > > - PCIe devices
> > > > > - nvme
> > > > > - SDHC card reader
> > > > > - ath12k WCN7850 Wifi and Bluetooth
> > > > > - ADSP and CDSP
> > > > > - GPIO keys (Lid switch)
> > > > > - Sound via internal speakers / DMIC / USB / headphone jack
> > > > > - DP Altmode with 2 lanes (as all of these still do)
> > > > > - Integrated fingerprint reader (FPC)
> > > > > - Integrated UVC camera
> > > > >
> > > > > Not supported yet:
> > > > >
> > > > > - HDMI port.
> > > > > - EC and some fn hotkeys.
> > > > >
> > > > > Limited support yet:
> > > > >
> > > > > - SDHC card reader is based on the on-chip sdhc_2 controller, but the driver from
> > > > > the Snapdragon Dev Kit is only a partial match. It can do normal slow sd cards,
> > > > > but not UHS-I (SD104) and UHS-II.
> > > > >
> > > > > - The GPU is not yet supported. Graphics is only software rendered.
> > > > >
> > > > > This work was done without any schematics or non-public knowledge of the device.
> > > > > So, it is based on the existing x1e device trees, dsdt analysis, using HWInfo
> > > > > ARM64, and pure guesswork. It has been confirmed, however, that the device really
> > > > > has 4 NXP PTN3222 eUSB2 repeaters, one of which doesn't have a reset GPIO (eusb5
> > > > > @43).
> > > > >
> > > > > Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> > > > > Co-developed by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> > > > > ---
> > > > >  arch/arm64/boot/dts/qcom/Makefile                  |    3 +
> > > > >  arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi       |    2 +-
> > > > >  .../boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts | 1655 ++++++++++++++++++++
> > > > >  3 files changed, 1659 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > > > > index 669b888b27a1daa93ac15f47e8b9a302bb0922c2..aff4fe3e81ec0d6f6d52e2aa0da327b7576632d8 100644
> > > > > --- a/arch/arm64/boot/dts/qcom/Makefile
> > > > > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > > > > @@ -327,3 +327,6 @@ x1e80100-qcp-el2-dtbs     := x1e80100-qcp.dtb x1-el2.dtbo
> > > > >  dtb-$(CONFIG_ARCH_QCOM)      += x1e80100-qcp.dtb x1e80100-qcp-el2.dtb
> > > > >  x1p42100-crd-el2-dtbs        := x1p42100-crd.dtb x1-el2.dtbo
> > > > >  dtb-$(CONFIG_ARCH_QCOM)      += x1p42100-crd.dtb x1p42100-crd-el2.dtb
> > > > > +x1p42100-lenovo-thinkbook-16-el2-dtbs        := x1p42100-lenovo-thinkbook-16.dtb x1-el2.dtbo
> > > > > +dtb-$(CONFIG_ARCH_QCOM)      += x1p42100-lenovo-thinkbook-16.dtb x1p42100-lenovo-thinkbook-16-el2.dtb
> > > > > +
> > > >
> > > > No need for an extra empty line.
> > > >
> > > > > diff --git a/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
> > > > > index c02fd4d15c9649c222caaafa5ed2c777a10fb4f5..551b392eca4ef3b6041e03ad1385fef11cec1690 100644
> > > > > --- a/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
> > > > > +++ b/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
> > > > > @@ -170,7 +170,7 @@ trip1 {
> > > > >                       };
> > > > >               };
> > > > >
> > > > > -             pm8010-thermal {
> > > > > +             pm8010_thermal: pm8010-thermal {
> > > > >                       polling-delay-passive = <100>;
> > > > >
> > > > >                       thermal-sensors = <&pm8010_temp_alarm>;
> > > > > diff --git a/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts b/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
> > > > > new file mode 100644
> > > > > index 0000000000000000000000000000000000000000..7089219ed08c1c4a60cc007f9d043a34a8071b4f
> > > > > --- /dev/null
> > > > > +++ b/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
> > > > > @@ -0,0 +1,1655 @@
> > > > > +// SPDX-License-Identifier: BSD-3-Clause
> > > > > +/*
> > > > > + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> > > > > + * Copyright (c) 2024, Linaro Limited
> > > > > + * Copyright (c) 2025, Jens Glathe
> > > > > + */
> > > > > +
> > > > > +/dts-v1/;
> > > > > +
> > > > > +#include <dt-bindings/gpio/gpio.h>
> > > > > +#include <dt-bindings/input/gpio-keys.h>
> > > > > +#include <dt-bindings/input/input.h>
> > > > > +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> > > > > +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> > > > > +
> > > > > +#include "x1p42100.dtsi"
> > > > > +#include "x1e80100-pmics.dtsi"
> > > > > +
> > > > > +/delete-node/ &pmc8380_6;
> > > > > +/delete-node/ &pmc8380_6_thermal;
> > > > > +/delete-node/ &pm8010;
> > > > > +/delete-node/ &pm8010_thermal;
> > > > > +
> > > > > +/ {
> > > > > +     model = "Lenovo ThinkBook 16 Gen 7 QOY";
> > > > > +     compatible = "lenovo,thinkbook-16", "qcom,x1p42100";
> > > > > +     chassis-type = "laptop";
> > > > > +
> > > > > +     aliases {
> > > > > +             serial0 = &uart21;
> > > > > +             serial1 = &uart14;
> > > > > +     };
> > > > > +
> > > > > +     wcd938x: audio-codec {
> > > > > +             compatible = "qcom,wcd9385-codec";
> > > > > +
> > > > > +             pinctrl-names = "default";
> > > > > +             pinctrl-0 = <&wcd_default>;
> > > > > +
> > > > > +             qcom,micbias1-microvolt = <1800000>;
> > > > > +             qcom,micbias2-microvolt = <1800000>;
> > > > > +             qcom,micbias3-microvolt = <1800000>;
> > > > > +             qcom,micbias4-microvolt = <1800000>;
> > > > > +             qcom,mbhc-buttons-vthreshold-microvolt = <75000 150000 237000 500000 500000 500000 500000 500000>;
> > > > > +             qcom,mbhc-headset-vthreshold-microvolt = <1700000>;
> > > > > +             qcom,mbhc-headphone-vthreshold-microvolt = <50000>;
> > > > > +             qcom,rx-device = <&wcd_rx>;
> > > > > +             qcom,tx-device = <&wcd_tx>;
> > > > > +
> > > > > +             reset-gpios = <&tlmm 191 GPIO_ACTIVE_LOW>;
> > > > > +
> > > > > +             vdd-buck-supply = <&vreg_l15b_1p8>;
> > > > > +             vdd-rxtx-supply = <&vreg_l15b_1p8>;
> > > > > +             vdd-io-supply = <&vreg_l15b_1p8>;
> > > > > +             vdd-mic-bias-supply = <&vreg_bob1>;
> > > > > +
> > > > > +             #sound-dai-cells = <1>;
> > > > > +     };
> > > > > +
> > > > > +     backlight: backlight {
> > > > > +             compatible = "pwm-backlight";
> > > > > +             pwms = <&pm8550_pwm 3 500000>;
> > > > > +
> > > > > +             power-supply = <&vreg_edp_bl>;
> > > > > +     };
> > > > > +
> > > > > +     camera {
> > > > > +             compatible = "usb5986,1198";
> > > > > +
> > > > > +             vdd-supply = <&vreg_cam_5p0>;
> > > > > +
> > > > > +             status = "okay";
> > > >
> > > > This is default, please drop.
> > > >
> > > > > +     };
> > > >
> > > > Camera isn't randomly wire to the board, it is on the USB bus. Please
> > > > follow DT bindings and put it accordingly, describing topology of the
> > > > bus.
> > > >
> > > > > +
> > > > > +     gpio-keys {
> > > > > +             compatible = "gpio-keys";
> > > > > +
> > > > > +             pinctrl-0 = <&hall_int_n_default>;
> > > > > +             pinctrl-names = "default";
> > > > > +
> > > > > +             switch-lid {
> > > > > +                     gpios = <&tlmm 92 GPIO_ACTIVE_LOW>;
> > > > > +                     linux,input-type = <EV_SW>;
> > > > > +                     linux,code = <SW_LID>;
> > > > > +                     wakeup-source;
> > > > > +                     wakeup-event-action = <EV_ACT_DEASSERTED>;
> > > > > +             };
> > > > > +     };
> > > > > +
> > > > > +     pmic-glink {
> > > > > +             compatible = "qcom,x1e80100-pmic-glink",
> > > > > +                             "qcom,sm8550-pmic-glink",
> > > > > +                             "qcom,pmic-glink";
> > > >
> > > > Align vertically on the double-quote
> > > >
> > > > > +             #address-cells = <1>;
> > > > > +             #size-cells = <0>;
> > > > > +             orientation-gpios = <&tlmm 121 GPIO_ACTIVE_HIGH>,
> > > > > +                             <&tlmm 123 GPIO_ACTIVE_HIGH>;
> > > >
> > > > And such lists should be aligned on the opening angle bracket.
> > > >
> > > > > +
> > > > > +             /* Display-adjacent port */
> > > > > +             connector@0 {
> > > > > +                     compatible = "usb-c-connector";
> > > > > +                     reg = <0>;
> > > > > +                     power-role = "dual";
> > > > > +                     data-role = "dual";
> > > >
> > > > Is it actually dual-role? What does UCSI report for it?
> > > >
> > > > > +
> > > > > +                     ports {
> > > > > +                             #address-cells = <1>;
> > > > > +                             #size-cells = <0>;
> > > > > +
> > > > > +                             port@0 {
> > > > > +                                     reg = <0>;
> > > > > +
> > > > > +                                     pmic_glink_ss0_hs_in: endpoint {
> > > > > +                                             remote-endpoint = <&usb_1_ss0_dwc3_hs>;
> > > > > +                                     };
> > > > > +                             };
> > > > > +
> > > > > +                             port@1 {
> > > > > +                                     reg = <1>;
> > > > > +
> > > > > +                                     pmic_glink_ss0_ss_in: endpoint {
> > > > > +                                             remote-endpoint = <&usb_1_ss0_qmpphy_out>;
> > > > > +                                     };
> > > > > +                             };
> > > > > +
> > > > > +                             port@2 {
> > > > > +                                     reg = <2>;
> > > > > +
> > > > > +                                     pmic_glink_ss0_sbu: endpoint {
> > > > > +                                             remote-endpoint = <&usb_1_ss0_sbu_mux>;
> > > > > +                                     };
> > > > > +                             };
> > > > > +                     };
> > > > > +             };
> > > > > +
> > > > > +             /* User-adjacent port */
> > > > > +             connector@1 {
> > > > > +                     compatible = "usb-c-connector";
> > > > > +                     reg = <1>;
> > > > > +                     power-role = "dual";
> > > > > +                     data-role = "dual";
> > > > > +
> > > > > +                     ports {
> > > > > +                             #address-cells = <1>;
> > > > > +                             #size-cells = <0>;
> > > > > +
> > > > > +                             port@0 {
> > > > > +                                     reg = <0>;
> > > > > +
> > > > > +                                     pmic_glink_ss1_hs_in: endpoint {
> > > > > +                                             remote-endpoint = <&usb_1_ss1_dwc3_hs>;
> > > > > +                                     };
> > > > > +                             };
> > > > > +
> > > > > +                             port@1 {
> > > > > +                                     reg = <1>;
> > > > > +
> > > > > +                                     pmic_glink_ss1_ss_in: endpoint {
> > > > > +                                             remote-endpoint = <&usb_1_ss1_qmpphy_out>;
> > > > > +                                     };
> > > > > +                             };
> > > > > +
> > > > > +                             port@2 {
> > > > > +                                     reg = <2>;
> > > > > +
> > > > > +                                     pmic_glink_ss1_sbu: endpoint {
> > > > > +                                             remote-endpoint = <&usb_1_ss1_sbu_mux>;
> > > > > +                                     };
> > > > > +                             };
> > > > > +                     };
> > > > > +             };
> > > > > +     };
> > > > > +
> > > > > +     reserved-memory {
> > > > > +             linux,cma {
> > > >
> > > > What for?
> > > >
> > > > > +                     compatible = "shared-dma-pool";
> > > > > +                     size = <0x0 0x8000000>;
> > > > > +                     reusable;
> > > > > +                     linux,cma-default;
> > > > > +             };
> > > > > +     };
> > > > > +
> > > >
> > > > [...]
> > > >
> > > > > +
> > > > > +&gpu {
> > > > > +     status = "okay";
> > > >
> > > > I think that you wrote that GPU isn't supported (yet).
> > >
> > > GPU is not supported on SoC level (x1p42100/purwa), not device
> > > specific. The idea I suggested to Jens was to mimic Asus Zenbook A14
> > > as per discussion abou purwa GPU and purwa firmware in general [1]: to
> > > already include correct filename and firmware path (since these are
> > > known) such that once SoC lands the GPU support laptops with that SoC
> > > will gain GPU support 'automatically'. As nothing consumes this
> > > property (on purwa) just yet, adding it already does not cause any
> > > harm.
> >
> >
> > Not quite. A14 specified the firmware name, but didn't enable the GPU.
> > This patch actually enables the GPU device. Which means, that we are
> > going to probe a driver on an unsupported device, using invalid GPU ids.
> >
> 
> A14 also enables the GPU, just in the .dsti, not in the purwa .dts.
> Though now looking at it, perhaps it's a bit misleading.

It should be enabled in the board.dts, not in the interim dtsi.

> Yes you are right, it does give GPU-related error in dmesg, which
> appear to be otherwise harmless. Perhaps because `x1p42100.dtsi`
> deletes the compatible of the GPU, hence no driver is probing it?
> 
> ```
> [    3.085697] msm_dpu ae01000.display-controller: no GPU device was found
> ```
> 
> Otherwise, if you still say GPU should be disabled regardless, shall I
> also disable it on A14's purwa variant?

Yes, please. Don't set okay status for the GPU until it gets enabled.

-- 
With best wishes
Dmitry

