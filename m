Return-Path: <linux-usb+bounces-24299-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EB5AC36A8
	for <lists+linux-usb@lfdr.de>; Sun, 25 May 2025 21:44:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4E171893F9B
	for <lists+linux-usb@lfdr.de>; Sun, 25 May 2025 19:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BF422609D4;
	Sun, 25 May 2025 19:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XDlws+ay"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8212A29;
	Sun, 25 May 2025 19:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748202232; cv=none; b=LTt5rfJBc3kSMHBHBLwBOFNyfoX2JixfUlL4dJMyhtcJPokKkDVEYSv/rMHzLZ4Z7mYRPLRhCIj2mIHr4upqohRmPrQWaM4uYVTj5rpa8e6PcTNq9FrN1EGeyiTZgZqwHOQJ920G/ssmO7qBg121Ry6KEMbYJpdUft3xCyVtG70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748202232; c=relaxed/simple;
	bh=kALFmZAOcEdKV7NH3Hg0uzepNmF9Qj3kOskUwpvBMAY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HDrWqU+FZmDbHGOc/AIRMgSYAFxqiAZQPBP9sXQV/UBFycLwnpgXnhlUYqQzJuiaU2+oQRFsnfNc169Xl1zDA5GwnIOpFOtKdEuk3K1P9DOJINnc/LQ5i3CWSZpcxYSHKmDG727jaE3wsNf+8lvj7jjpdbupt4vEACXDFZd6OpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XDlws+ay; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a36748920cso1673468f8f.2;
        Sun, 25 May 2025 12:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748202228; x=1748807028; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=88qsrhlyktyQjtClNmk24chYTTwZKFSByLFBhnAi48k=;
        b=XDlws+ayWtm8UsMmGYDWvn4POy2Tn8NFGZTI8AibLQPIx9HuKpnDEfFe6uNTaNDJTy
         THO/Ce4Y9mHWHpVLR4JkLetwKZwRoiU9VGkn24txTlaHtXF4R2Qk55OHud2xJcTXMZxu
         he1mvFDBIbSstK8KXnwSr/ZwpSWU56uqE4ZRHNkzCgQqafoByUEEjnGgNY9r9AXowZc0
         4/EpmGvH41K+uGFuTGrhLpIqipVZJmiKHuSjdVxcvTKL9+CMWFLxNsUEWQyOHGMB1a6k
         PvDkFem0KMQw7CRGDESGB5lST7ZJGDWeV9+mz2dYgJLZ9bvMAFhmlLa5s7Npzr/TkqDX
         RnQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748202228; x=1748807028;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=88qsrhlyktyQjtClNmk24chYTTwZKFSByLFBhnAi48k=;
        b=R5OzC1o19K+/lV5JT+8jLUsm9rtT7l79Y9hzcDweqKmhcE0IIy2BspeEDlvwG15WMw
         xcw5xPXqm0az1rXXAYBdTrHvBa3qagolT3Y11TZiAszXfmkKBrs7o+F0IbgXEuut/14h
         MwH08nUmxQGfm0j9jv9ZrHOHqSXeJSbRe/e6uj8jehqylzB2aVhK0J2ASbavWpM0k+/q
         M4VwgRBWG1Q/n8FsK7sSdGK5eJ+aEU4NmB8ePdYvicetAfU85ZYIDGzUh1woiYpVa4Pb
         K+LLoM8I00G9FAxqgAhQwbtF5t84XDVYU2zypnxQynG/AP/620Ma8/WNgTqrcb/iaHhg
         QH0A==
X-Forwarded-Encrypted: i=1; AJvYcCUA2jlY0b/fdXmMLFKP4OttfYCuQt/FWcwlIZS2VMRb+VYzxObiZ3u0ceqhZ6iVxJem5nGPwWS5kSo4s5//@vger.kernel.org, AJvYcCV3cq5k7loVM9AS++yDjEDHy2y6oHPwsdGytpB4HTBlp+kB3Vio3bQMbet4kXC273CU22petcFFB79q@vger.kernel.org, AJvYcCVPRbhRV6ZZ7FR+ZI7kNGJpe9/ZNaRDXHpbK5E+yiMMsTbJzl7OhEWHLqzuA0nt8tOgOWlXmd/KlgdX@vger.kernel.org, AJvYcCWpMCCaeBOt5f4DDydcOqM6RSXp32at6hpqPkxyEXRhF6cbep0rXMsJYFNy1yTPfv01Z9hvx1r6x34JTNjOUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjWX2YGhW8Qo+wpse9VY1OXy+47jWKpEfzixdE3qPCFwiNc6Zd
	Bvv2Pztl55VeQWYm408Pi1vitVoPqD6IVzQe91Pi207BgBSFc3taIRUpGa0S5Kzd25mv3EjruVD
	hZlGaZ/N6F6qwF4jJyEQJQma7NAELeA==
X-Gm-Gg: ASbGncukwLBT5plOp2krNts/9yiEGq5dymCgqxxPZG1m1/YpRs+tOX1WK/9+UB5UAl8
	1NhnehdV5Xa0msHCK9wnyXRnfZIwQ7xI9LA4agEjw/UJmBhcqq2bzkV5sKrtEWvYFL5mXEXCiCF
	y2kQ7BgIKn4ndAFT85yqcN//NN12B2QadzGF36U6L+7Qw=
X-Google-Smtp-Source: AGHT+IFYH64+G/WgGBJUcy1Uow1OzLEcXe+1afwTJqAVj6Yn78C5vXN8nGC1PJYIHVP2a0hJap0PeqLu2y5C0XKjlaE=
X-Received: by 2002:a05:6000:178d:b0:3a0:b8b0:43ff with SMTP id
 ffacd0b85a97d-3a4cb448fb9mr5461119f8f.14.1748202227836; Sun, 25 May 2025
 12:43:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250524-tb16-dt-v4-0-2c1e6018d3f0@oldschoolsolutions.biz>
 <20250524-tb16-dt-v4-5-2c1e6018d3f0@oldschoolsolutions.biz>
 <g7vlyqma6ow6tdsaqt2rfwvblxqwbqlwmoueio7i4vqvjy76kw@5bz4g33pq4t7>
 <CAMcHhXoYkQru_0n5siMGGkTcHu8yWRZWfT4ByiD8D0ieZHF+wQ@mail.gmail.com> <vwoixgdyjjzcjlv4muwrzv7wztnqyidtj7ghacgkjg6hgkkyl7@ji53bhiltaef>
In-Reply-To: <vwoixgdyjjzcjlv4muwrzv7wztnqyidtj7ghacgkjg6hgkkyl7@ji53bhiltaef>
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Date: Sun, 25 May 2025 21:43:36 +0200
X-Gm-Features: AX0GCFtIrEdQcMw-yUrjcvSdT47PSo_i9ZsP-0fOJmL5nZhM5IZoJxzKs6sG-xE
Message-ID: <CAMcHhXqDFuo+x99KOK0pQFj-FyTdQoZS_JvehNE2AC_JSoQ2gQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: Add Lenovo ThinkBook 16 G7 QOY
 device tree
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: jens.glathe@oldschoolsolutions.biz, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Kaehlcke <mka@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Douglas Anderson <dianders@chromium.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
	linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 25 May 2025 at 15:33, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sat, May 24, 2025 at 07:58:13PM +0200, Aleksandrs Vinarskis wrote:
> > On Sat, 24 May 2025 at 17:33, Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > On Sat, May 24, 2025 at 01:48:40PM +0200, Jens Glathe via B4 Relay wrote:
> > > > From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> > > >
> > > > Device tree for the Lenovo Thinkbook 16 G7 QOY
> > > >
> > > > The Laptop is a Snapdragon X1 / X1 Plus (Purwa) based device [1].
> > > >
> > > > Supported features:
> > > >
> > > > - USB type-c and type-a ports
> > > > - Keyboard
> > > > - Touchpad (all that are described in the dsdt)
> > > > - Touchscreen (described in the dsdt, no known SKUss)
> > > > - Display including PWM backlight control
> > > > - PCIe devices
> > > > - nvme
> > > > - SDHC card reader
> > > > - ath12k WCN7850 Wifi and Bluetooth
> > > > - ADSP and CDSP
> > > > - GPIO keys (Lid switch)
> > > > - Sound via internal speakers / DMIC / USB / headphone jack
> > > > - DP Altmode with 2 lanes (as all of these still do)
> > > > - Integrated fingerprint reader (FPC)
> > > > - Integrated UVC camera
> > > >
> > > > Not supported yet:
> > > >
> > > > - HDMI port.
> > > > - EC and some fn hotkeys.
> > > >
> > > > Limited support yet:
> > > >
> > > > - SDHC card reader is based on the on-chip sdhc_2 controller, but the driver from
> > > > the Snapdragon Dev Kit is only a partial match. It can do normal slow sd cards,
> > > > but not UHS-I (SD104) and UHS-II.
> > > >
> > > > - The GPU is not yet supported. Graphics is only software rendered.
> > > >
> > > > This work was done without any schematics or non-public knowledge of the device.
> > > > So, it is based on the existing x1e device trees, dsdt analysis, using HWInfo
> > > > ARM64, and pure guesswork. It has been confirmed, however, that the device really
> > > > has 4 NXP PTN3222 eUSB2 repeaters, one of which doesn't have a reset GPIO (eusb5
> > > > @43).
> > > >
> > > > Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> > > > Co-developed by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> > > > ---
> > > >  arch/arm64/boot/dts/qcom/Makefile                  |    3 +
> > > >  arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi       |    2 +-
> > > >  .../boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts | 1655 ++++++++++++++++++++
> > > >  3 files changed, 1659 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > > > index 669b888b27a1daa93ac15f47e8b9a302bb0922c2..aff4fe3e81ec0d6f6d52e2aa0da327b7576632d8 100644
> > > > --- a/arch/arm64/boot/dts/qcom/Makefile
> > > > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > > > @@ -327,3 +327,6 @@ x1e80100-qcp-el2-dtbs     := x1e80100-qcp.dtb x1-el2.dtbo
> > > >  dtb-$(CONFIG_ARCH_QCOM)      += x1e80100-qcp.dtb x1e80100-qcp-el2.dtb
> > > >  x1p42100-crd-el2-dtbs        := x1p42100-crd.dtb x1-el2.dtbo
> > > >  dtb-$(CONFIG_ARCH_QCOM)      += x1p42100-crd.dtb x1p42100-crd-el2.dtb
> > > > +x1p42100-lenovo-thinkbook-16-el2-dtbs        := x1p42100-lenovo-thinkbook-16.dtb x1-el2.dtbo
> > > > +dtb-$(CONFIG_ARCH_QCOM)      += x1p42100-lenovo-thinkbook-16.dtb x1p42100-lenovo-thinkbook-16-el2.dtb
> > > > +
> > >
> > > No need for an extra empty line.
> > >
> > > > diff --git a/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
> > > > index c02fd4d15c9649c222caaafa5ed2c777a10fb4f5..551b392eca4ef3b6041e03ad1385fef11cec1690 100644
> > > > --- a/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
> > > > +++ b/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
> > > > @@ -170,7 +170,7 @@ trip1 {
> > > >                       };
> > > >               };
> > > >
> > > > -             pm8010-thermal {
> > > > +             pm8010_thermal: pm8010-thermal {
> > > >                       polling-delay-passive = <100>;
> > > >
> > > >                       thermal-sensors = <&pm8010_temp_alarm>;
> > > > diff --git a/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts b/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
> > > > new file mode 100644
> > > > index 0000000000000000000000000000000000000000..7089219ed08c1c4a60cc007f9d043a34a8071b4f
> > > > --- /dev/null
> > > > +++ b/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
> > > > @@ -0,0 +1,1655 @@
> > > > +// SPDX-License-Identifier: BSD-3-Clause
> > > > +/*
> > > > + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> > > > + * Copyright (c) 2024, Linaro Limited
> > > > + * Copyright (c) 2025, Jens Glathe
> > > > + */
> > > > +
> > > > +/dts-v1/;
> > > > +
> > > > +#include <dt-bindings/gpio/gpio.h>
> > > > +#include <dt-bindings/input/gpio-keys.h>
> > > > +#include <dt-bindings/input/input.h>
> > > > +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> > > > +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> > > > +
> > > > +#include "x1p42100.dtsi"
> > > > +#include "x1e80100-pmics.dtsi"
> > > > +
> > > > +/delete-node/ &pmc8380_6;
> > > > +/delete-node/ &pmc8380_6_thermal;
> > > > +/delete-node/ &pm8010;
> > > > +/delete-node/ &pm8010_thermal;
> > > > +
> > > > +/ {
> > > > +     model = "Lenovo ThinkBook 16 Gen 7 QOY";
> > > > +     compatible = "lenovo,thinkbook-16", "qcom,x1p42100";
> > > > +     chassis-type = "laptop";
> > > > +
> > > > +     aliases {
> > > > +             serial0 = &uart21;
> > > > +             serial1 = &uart14;
> > > > +     };
> > > > +
> > > > +     wcd938x: audio-codec {
> > > > +             compatible = "qcom,wcd9385-codec";
> > > > +
> > > > +             pinctrl-names = "default";
> > > > +             pinctrl-0 = <&wcd_default>;
> > > > +
> > > > +             qcom,micbias1-microvolt = <1800000>;
> > > > +             qcom,micbias2-microvolt = <1800000>;
> > > > +             qcom,micbias3-microvolt = <1800000>;
> > > > +             qcom,micbias4-microvolt = <1800000>;
> > > > +             qcom,mbhc-buttons-vthreshold-microvolt = <75000 150000 237000 500000 500000 500000 500000 500000>;
> > > > +             qcom,mbhc-headset-vthreshold-microvolt = <1700000>;
> > > > +             qcom,mbhc-headphone-vthreshold-microvolt = <50000>;
> > > > +             qcom,rx-device = <&wcd_rx>;
> > > > +             qcom,tx-device = <&wcd_tx>;
> > > > +
> > > > +             reset-gpios = <&tlmm 191 GPIO_ACTIVE_LOW>;
> > > > +
> > > > +             vdd-buck-supply = <&vreg_l15b_1p8>;
> > > > +             vdd-rxtx-supply = <&vreg_l15b_1p8>;
> > > > +             vdd-io-supply = <&vreg_l15b_1p8>;
> > > > +             vdd-mic-bias-supply = <&vreg_bob1>;
> > > > +
> > > > +             #sound-dai-cells = <1>;
> > > > +     };
> > > > +
> > > > +     backlight: backlight {
> > > > +             compatible = "pwm-backlight";
> > > > +             pwms = <&pm8550_pwm 3 500000>;
> > > > +
> > > > +             power-supply = <&vreg_edp_bl>;
> > > > +     };
> > > > +
> > > > +     camera {
> > > > +             compatible = "usb5986,1198";
> > > > +
> > > > +             vdd-supply = <&vreg_cam_5p0>;
> > > > +
> > > > +             status = "okay";
> > >
> > > This is default, please drop.
> > >
> > > > +     };
> > >
> > > Camera isn't randomly wire to the board, it is on the USB bus. Please
> > > follow DT bindings and put it accordingly, describing topology of the
> > > bus.
> > >
> > > > +
> > > > +     gpio-keys {
> > > > +             compatible = "gpio-keys";
> > > > +
> > > > +             pinctrl-0 = <&hall_int_n_default>;
> > > > +             pinctrl-names = "default";
> > > > +
> > > > +             switch-lid {
> > > > +                     gpios = <&tlmm 92 GPIO_ACTIVE_LOW>;
> > > > +                     linux,input-type = <EV_SW>;
> > > > +                     linux,code = <SW_LID>;
> > > > +                     wakeup-source;
> > > > +                     wakeup-event-action = <EV_ACT_DEASSERTED>;
> > > > +             };
> > > > +     };
> > > > +
> > > > +     pmic-glink {
> > > > +             compatible = "qcom,x1e80100-pmic-glink",
> > > > +                             "qcom,sm8550-pmic-glink",
> > > > +                             "qcom,pmic-glink";
> > >
> > > Align vertically on the double-quote
> > >
> > > > +             #address-cells = <1>;
> > > > +             #size-cells = <0>;
> > > > +             orientation-gpios = <&tlmm 121 GPIO_ACTIVE_HIGH>,
> > > > +                             <&tlmm 123 GPIO_ACTIVE_HIGH>;
> > >
> > > And such lists should be aligned on the opening angle bracket.
> > >
> > > > +
> > > > +             /* Display-adjacent port */
> > > > +             connector@0 {
> > > > +                     compatible = "usb-c-connector";
> > > > +                     reg = <0>;
> > > > +                     power-role = "dual";
> > > > +                     data-role = "dual";
> > >
> > > Is it actually dual-role? What does UCSI report for it?
> > >
> > > > +
> > > > +                     ports {
> > > > +                             #address-cells = <1>;
> > > > +                             #size-cells = <0>;
> > > > +
> > > > +                             port@0 {
> > > > +                                     reg = <0>;
> > > > +
> > > > +                                     pmic_glink_ss0_hs_in: endpoint {
> > > > +                                             remote-endpoint = <&usb_1_ss0_dwc3_hs>;
> > > > +                                     };
> > > > +                             };
> > > > +
> > > > +                             port@1 {
> > > > +                                     reg = <1>;
> > > > +
> > > > +                                     pmic_glink_ss0_ss_in: endpoint {
> > > > +                                             remote-endpoint = <&usb_1_ss0_qmpphy_out>;
> > > > +                                     };
> > > > +                             };
> > > > +
> > > > +                             port@2 {
> > > > +                                     reg = <2>;
> > > > +
> > > > +                                     pmic_glink_ss0_sbu: endpoint {
> > > > +                                             remote-endpoint = <&usb_1_ss0_sbu_mux>;
> > > > +                                     };
> > > > +                             };
> > > > +                     };
> > > > +             };
> > > > +
> > > > +             /* User-adjacent port */
> > > > +             connector@1 {
> > > > +                     compatible = "usb-c-connector";
> > > > +                     reg = <1>;
> > > > +                     power-role = "dual";
> > > > +                     data-role = "dual";
> > > > +
> > > > +                     ports {
> > > > +                             #address-cells = <1>;
> > > > +                             #size-cells = <0>;
> > > > +
> > > > +                             port@0 {
> > > > +                                     reg = <0>;
> > > > +
> > > > +                                     pmic_glink_ss1_hs_in: endpoint {
> > > > +                                             remote-endpoint = <&usb_1_ss1_dwc3_hs>;
> > > > +                                     };
> > > > +                             };
> > > > +
> > > > +                             port@1 {
> > > > +                                     reg = <1>;
> > > > +
> > > > +                                     pmic_glink_ss1_ss_in: endpoint {
> > > > +                                             remote-endpoint = <&usb_1_ss1_qmpphy_out>;
> > > > +                                     };
> > > > +                             };
> > > > +
> > > > +                             port@2 {
> > > > +                                     reg = <2>;
> > > > +
> > > > +                                     pmic_glink_ss1_sbu: endpoint {
> > > > +                                             remote-endpoint = <&usb_1_ss1_sbu_mux>;
> > > > +                                     };
> > > > +                             };
> > > > +                     };
> > > > +             };
> > > > +     };
> > > > +
> > > > +     reserved-memory {
> > > > +             linux,cma {
> > >
> > > What for?
> > >
> > > > +                     compatible = "shared-dma-pool";
> > > > +                     size = <0x0 0x8000000>;
> > > > +                     reusable;
> > > > +                     linux,cma-default;
> > > > +             };
> > > > +     };
> > > > +
> > >
> > > [...]
> > >
> > > > +
> > > > +&gpu {
> > > > +     status = "okay";
> > >
> > > I think that you wrote that GPU isn't supported (yet).
> >
> > GPU is not supported on SoC level (x1p42100/purwa), not device
> > specific. The idea I suggested to Jens was to mimic Asus Zenbook A14
> > as per discussion abou purwa GPU and purwa firmware in general [1]: to
> > already include correct filename and firmware path (since these are
> > known) such that once SoC lands the GPU support laptops with that SoC
> > will gain GPU support 'automatically'. As nothing consumes this
> > property (on purwa) just yet, adding it already does not cause any
> > harm.
>
>
> Not quite. A14 specified the firmware name, but didn't enable the GPU.
> This patch actually enables the GPU device. Which means, that we are
> going to probe a driver on an unsupported device, using invalid GPU ids.
>

A14 also enables the GPU, just in the .dsti, not in the purwa .dts.
Though now looking at it, perhaps it's a bit misleading.
Yes you are right, it does give GPU-related error in dmesg, which
appear to be otherwise harmless. Perhaps because `x1p42100.dtsi`
deletes the compatible of the GPU, hence no driver is probing it?

```
[    3.085697] msm_dpu ae01000.display-controller: no GPU device was found
```

Otherwise, if you still say GPU should be disabled regardless, shall I
also disable it on A14's purwa variant?

Alex


> >
> > Jens, as per the same discussion [1] the path is wrong here,
> > s/x1e80100/x1p42100/ for all purwa-specifc firmware. Unless the
> > decision about firmware paths was re-evaluated in Linaro/Qcom?
> >
> > >
> > > > +
> > > > +     zap-shader {
>
> Please use &gpu_zap_shader {} instead.
>
> > > > +             firmware-name = "qcom/x1e80100/LENOVO/21NH/qcdxkmsucpurwa.mbn";
> > > > +     };
> > > > +};
> > > > +
> > > Dmitry
>
> --
> With best wishes
> Dmitry

