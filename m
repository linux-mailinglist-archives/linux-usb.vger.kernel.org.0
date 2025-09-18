Return-Path: <linux-usb+bounces-28171-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CADEB80098
	for <lists+linux-usb@lfdr.de>; Wed, 17 Sep 2025 16:35:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A374C167E3C
	for <lists+linux-usb@lfdr.de>; Tue, 16 Sep 2025 22:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D395429B8C7;
	Tue, 16 Sep 2025 22:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oQXJ8Yj3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E53631BC86
	for <linux-usb@vger.kernel.org>; Tue, 16 Sep 2025 22:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758062906; cv=none; b=VhUV8mfnEWHmHN5LlC9b9AbD5BmA6K/FxLtfbDkcBYZ3OcXMxPQWqvtnIV0N3miqQIz4l8ujYYieHjHFGMuHxykaHNhTMrD6XQ7NYfRL5qvkoBkJETs2pFyAm9xQhSgUF62AOe5s9b70YXhMGbiDIf9CjJUPq6k3PshvHwwW3sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758062906; c=relaxed/simple;
	bh=2DFMm6LIh3PH3uODuHvlYd6xCZm/nyxzIpl1xb3Rlc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nGRXwhX9xVeaMRjHaX6n2sUyy+Z4rT7bp7AJ/QD34IpwfadukjTxpsTk1D7WldxT6eHYQ56n2Q1pvDRKtlSU2PzbOhOvB7IEJRf7kWuDYfcp1e1F8zui/BHmcYx2psOwNQO1+N2/e/xmwlk9XcGk6LcdNzCVzG5xDAbW+MXk5jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oQXJ8Yj3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GLaXXt021932
	for <linux-usb@vger.kernel.org>; Tue, 16 Sep 2025 22:48:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6lqy88FzgcpTp3nfJKIO0ixM
	kbRL1bHvuglEZ1P3X1g=; b=oQXJ8Yj3+sfKiF4C96MYOcOWnQsURIEOvgINIDrJ
	3W9dWs/p5dfXyUNf0NgVXZx4bp4RbaIRyFFgYGiYadRQKmc/wTSBQrV7UVq+7UEt
	Zm76MHFR6nrE9pNTSPDADfZtdCDOSq8tnCHkfHwZeM/e5Z0K1cmYdMe0QkxQa8EX
	rpgf56ZNXvYjkUkC6XWAWR/ZFQP5lGtSAOQ4QSKFo7hKe1HiLmvjGyywa3Fr4ko2
	JJNKzTI0Yx5bCVBAuauIHxHDhTSH3k7440SL/L2V8ae5vHnWM4R6CwRhwcx4saEq
	GXMMvKIxg6LB8dPWRBEeRqS8+YrfyPZ5vhG7unQgfwBUuw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy0r5gk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 16 Sep 2025 22:48:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-81ea2cb6f13so1211305685a.0
        for <linux-usb@vger.kernel.org>; Tue, 16 Sep 2025 15:48:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758062902; x=1758667702;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6lqy88FzgcpTp3nfJKIO0ixMkbRL1bHvuglEZ1P3X1g=;
        b=D6nY+W+DmifirRl8J6CnQ14nbiizXMl7rM8eJ9Z5PmgCMaRxPYGJ2Mr7Us5wLUyc3t
         IsPNpFe7FPe57ssO5XQCgZkmaNCaL+nudawIX3BkodY0dGCnImZOlmB1SD/YWnu5GWhn
         XaLPQHPkkJU2SA/ujAymzas/2y3j0Dny4Vv1CVPtBjTZ0greTJ0hFVz4d5PzBzACrnsq
         6qS+8cEre0KrFb5bojG175Od5QZCje/H+/xoETcqpfpXxu7F50/jRtwbsydqvB8ckkbu
         d8L2PNfcK9gVjD8Qwk69uV0l49pQGiZBLPSt2E02KlAptqdTCgcuqZd6r6qeztE8975J
         HWNg==
X-Forwarded-Encrypted: i=1; AJvYcCX+/KEqAYWj5Q3tFSFrzUp/+oKoXrHwNPduRKQ24tvbofpr0CQ0EnWbc+s42ZcyiVgPZum1Eo7/U5E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx80xoMVsFd/Zi8Xmp81M0Eh5fr+XGwk01ajjC02pCW9RTCQVg4
	JZeGvVBe/MhQ3jA3paVtzaog9p3MSJWa9rjDTnEqb63/MYJhrzbpluKV3glVArUEvzncYL8cpFR
	joVnJFUzj3dgwzlKbUWOxevWXcVMoA9k38qZuidfFJAaF1xzRNoQfxLQsiVmc0qU=
X-Gm-Gg: ASbGncv96GO8dk4MqQzE+574IjmbeonA00/w+HhTZBda/dywDFgjD021EJy0rGNVr0W
	nKfccHitcnuOi30RdsFeOXqBFdBcMy38Dz4Xc7lCg2PHwgDvfFNMm9U8vO8e9c7aBuIoFs3Xoff
	X6hW6fuY6eYwyWUAoaiV1gkoeBSZnIdc1VcmZv8dKetqacfz6/1aCIFAf3EQz2WUk/adir6hwyd
	tmlnGCHNgvfvxpPF88OGw2rH0tCg/Qk2j4KlERbu1EIeZlAZYXKDU3XRsMAr+yFtY6j47Gaqy29
	r5Z35E9lMrCAYUk7AR/TSPWqxUlAI51mkO941MkSSZl5afYg2AIqgOlmdH0anmJKOQ0jM7Nrnkc
	uJcQSsM7XyvTUqIh1Fn00on3AEZhcs7ABqyzBzbHRT9WlcEdJ32DY
X-Received: by 2002:a05:622a:2505:b0:4b7:b193:56c0 with SMTP id d75a77b69052e-4ba66e0c77fmr2182631cf.21.1758062902163;
        Tue, 16 Sep 2025 15:48:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHiAGFbpHt/NioJ7e/FEexyytK2hopKKGV8FKMvLAQUpoguf3uiH8FC1V5uYGk4pK4dTKzi9Q==
X-Received: by 2002:a05:622a:2505:b0:4b7:b193:56c0 with SMTP id d75a77b69052e-4ba66e0c77fmr2182311cf.21.1758062901616;
        Tue, 16 Sep 2025 15:48:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e5c3b6193sm4670677e87.31.2025.09.16.15.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 15:48:20 -0700 (PDT)
Date: Wed, 17 Sep 2025 01:48:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mayank Rana <mayank.rana@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFC] dt-bindings: thunderbolt: Add Qualcomm USB4 Host
 Router
Message-ID: <fqxcvu5o7urw6fxbzshp3kv7mlte4iujgxjab3qs2yo5mv2o6h@umutqskjoxvg>
References: <20250916-topic-qcom_usb4_bindings-v1-1-943ecb2c0fa7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916-topic-qcom_usb4_bindings-v1-1-943ecb2c0fa7@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: B1IokqTg0zOsPQla-lxTkk_lA9Mc4tk8
X-Authority-Analysis: v=2.4 cv=btZMBFai c=1 sm=1 tr=0 ts=68c9e937 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=bXFFeEhO61wJ5UbjiUcA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: B1IokqTg0zOsPQla-lxTkk_lA9Mc4tk8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXw5nGx+4zEoCd
 jMhgq0QD2WY4SSdAYzDSPiGxA1mkJ28mV5RavpF9z0hKRuHofQY1FLs1uFtU43/XRPctrXo1iQE
 G6r+3hJSGJ/hWoFOniwe+Yi2SIUCP+uKTUWMikGyD3Lwuy+dRIiSn8c/CgUme8c3xO4iCWixdBq
 qHgOZKz4Ci9TangLnqyF+ZqTuG9UxXOUeb5nIJVz/EUbFDqCsVMVukzOvcO4wniXj/ClydtqXsx
 OKPIbr1L1Aexw/ROLtkUmd04rx7MRCUWFx0iYL/1fwa6FFMFEWj7k502bU8cu2Nj94p8eaKhkqL
 +9K7OhGa6bbFBfOfyZhptq0amyKvAIFGA3tRx8c0BKJ43kNmNXMmmRoc53r/JEl3ZBMSCeGaawI
 pjnjnhQ8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-16_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 spamscore=0 adultscore=0 phishscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202

On Tue, Sep 16, 2025 at 10:06:01PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Several Qualcomm platforms feature an in-house Host Router IP block,
> which enables USB4 and Thunderbolt 3 functionality. It implements the
> common NHI interface, allowing for easier integration with existing
> Thunderbolt driver implementations.
> 
> The Host Router features a microcontroller (with loadable firmware),
> which takes care of detecting and acting upon plug events, initiating
> high-speed link establishment or performing HW power management
> operations.
> 
> Each instance is connected to a single USB3.x host, a PCIe RC and a
> DisplayPort controller through a fitting Protocol Adapter, allowing
> for the tunneling of the respective protocols between the USB4/TBT3
> device and the on-SoC controller.

I'd really like to see a full example, how the overall picture looks
like? The bindings describe a single port with a single endpoint. Where
is it supposed to be connected to?

Could you please provide an example of the overall system (including USB
controller, DP controller, USB-C connector, etc.). I think one of the
systems had muxes on the SBU lines, how are they supposed to be defined?

Also, do we need to define the thunderbolt AltMode inside
usb-connector.yaml?

> 
> Describe the block, as present on the X1E family of SoCs, where it
> implements the USB4v1 standard.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Hello!
> 
> This is our stab at USB4/Thunderbolt dt-bindings.
> 
> This submission, as stated in the commit message, describes our USB4
> Host Router block, which is roughly the same class of hardware that you
> can find on add-in PCIe cards aimed at x86 machines.
> 
> This specific patch is NOT supposed to be merged, since the bindings
> may still ever so slightly change, as we continue work on the driver
> (i.e. it's still possible that we omitted some resource).
> 
> It is however published early to create grounds for a discussion.
> This is the first bring-up of USB4/TBT3 on a DT platform, so this
> binding is likely going to influence all subsequent submissions. I've
> added various DT and TBT folks to the recipient list to make everyone
> aware of any decisions we settle on.
> 
> Comments very welcome!
> 
> P.S.
> The driver part (which has quite some dependencies) is not yet 100%
> ready to share and will be published at a later date.
> ---
>  .../bindings/thunderbolt/qcom,usb4-hr.yaml         | 263 +++++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 264 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/thunderbolt/qcom,usb4-hr.yaml b/Documentation/devicetree/bindings/thunderbolt/qcom,usb4-hr.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..1cf3d083c6129a492010a4b98fea0e8dec9746cf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/thunderbolt/qcom,usb4-hr.yaml
> @@ -0,0 +1,263 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/thunderbolt/qcom,usb4-hr.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm USB4 Host Router
> +
> +maintainers:
> +  - Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> +
> +description:
> +  The Qualcomm USB4 Host Router IP block implements the NHI standard
> +  as described in the USB4 specification.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - qcom,x1e80100-usb4-hr # USB4v1
> +      - const: qcom,usb4-hr
> +
> +  reg:
> +    maxItems: 17
> +
> +  reg-names:
> +    items:
> +      - const: router
> +      - const: router_config
> +      - const: tmu_config
> +      - const: port_group
> +      - const: sideband
> +      - const: uc_ram
> +      - const: uc_per
> +      - const: uc_mbox
> +      - const: nhi
> +      - const: cfg
> +      - const: debug
> +      - const: usbap_config
> +      - const: pcieap_config
> +      - const: dpap0_aux
> +      - const: dpap0_config
> +      - const: dpap1_aux
> +      - const: dpap1_config
> +
> +  interrupts:
> +    items:
> +      - description: Combined event interrupt for all three rings
> +      - description: OOB Firmware interrupt
> +
> +  interrupt-names:
> +    items:
> +      - const: ring
> +      - const: fw
> +
> +  clocks:
> +    maxItems: 10
> +
> +  clock-names:
> +    items:
> +      - const: sys
> +      - const: tmu
> +      - const: ahb
> +      - const: axi
> +      - const: master
> +      - const: phy_rx0
> +      - const: phy_rx1
> +      - const: sb
> +      - const: dp0
> +      - const: dp1
> +
> +  resets:
> +    maxItems: 13
> +
> +  reset-names:
> +    items:
> +      - const: core
> +      - const: phy_nocsr
> +      - const: sys
> +      - const: rx0
> +      - const: rx1
> +      - const: usb_pipe
> +      - const: pcie_pipe
> +      - const: tmu
> +      - const: sideband_iface
> +      - const: hia_master
> +      - const: ahb
> +      - const: dp0
> +      - const: dp1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  required-opps:
> +    maxItems: 1
> +
> +  phys:
> +    maxItems: 1
> +
> +  phy-names:
> +    const: usb4
> +
> +  iommus:
> +    maxItems: 1
> +
> +  interconnects:
> +    maxItems: 2
> +
> +  interconnect-names:
> +    items:
> +      - const: usb4-ddr
> +      - const: apps-usb4
> +
> +  mode-switch: true
> +
> +  wakeup-source: true
> +
> +allOf:
> +  - $ref: /schemas/usb/usb-switch.yaml#

I don't think this should be including usb-switch.yaml (pretty much like
QMP PHY isn't a usb-switch).

> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - interrupt-names
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - power-domains
> +  - phys
> +  - phy-names
> +  - iommus
> +  - interconnects
> +  - interconnect-names
> +  - mode-switch
> +  - port
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        usb4_router0: usb4-host-router@15600000 {
> +            compatible = "qcom,x1e80100-usb4-hr",
> +                         "qcom,usb4-hr";
> +            reg = <0x0 0x15600000 0x0 0x8000>,
> +                  <0x0 0x15608000 0x0 0x70>,
> +                  <0x0 0x15608070 0x0 0x500>,
> +                  <0x0 0x1560d000 0x0 0x1000>,
> +                  <0x0 0x15612000 0x0 0x1000>,
> +                  <0x0 0x15613000 0x0 0xe000>,
> +                  <0x0 0x15621000 0x0 0x2000>,
> +                  <0x0 0x15623000 0x0 0x2000>,
> +                  <0x0 0x1563f000 0x0 0x40000>,
> +                  <0x0 0x1567f000 0x0 0x1000>,
> +                  <0x0 0x15680000 0x0 0x1000>,
> +                  <0x0 0x15681000 0x0 0x1000>,
> +                  <0x0 0x15682000 0x0 0x1000>,
> +                  <0x0 0x15683000 0x0 0x1000>,
> +                  <0x0 0x15685000 0x0 0x1000>,
> +                  <0x0 0x15686000 0x0 0x1000>,
> +                  <0x0 0x15688000 0x0 0x1000>;
> +            reg-names = "router",
> +                        "router_config",
> +                        "tmu_config",
> +                        "port_group",
> +                        "sideband",
> +                        "uc_ram",
> +                        "uc_per",
> +                        "uc_mbox",
> +                        "nhi",
> +                        "cfg",
> +                        "debug",
> +                        "usbap_config",
> +                        "pcieap_config",
> +                        "dpap0_aux",
> +                        "dpap0_config",
> +                        "dpap1_aux",
> +                        "dpap1_config";
> +
> +            interrupts = <GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 579 IRQ_TYPE_LEVEL_HIGH>;
> +            interrupt-names = "ring",
> +                              "fw";
> +
> +            clocks = <&gcc_usb4_0_sys_clk>,
> +                     <&gcc_usb4_0_tmu_clk>,
> +                     <&gcc_usb4_0_cfg_ahb_clk>,
> +                     <&gcc_aggre_usb4_0_axi_clk>,
> +                     <&gcc_usb4_0_master_clk>,
> +                     <&gcc_usb4_0_phy_rx0_clk>,
> +                     <&gcc_usb4_0_phy_rx1_clk>,
> +                     <&gcc_usb4_0_sb_if_clk>,
> +                     <&gcc_usb4_0_dp0_clk>,
> +                     <&gcc_usb4_0_dp1_clk>;
> +            clock-names = "sys",
> +                          "tmu",
> +                          "ahb",
> +                          "axi",
> +                          "master",
> +                          "phy_rx0",
> +                          "phy_rx1",
> +                          "sb",
> +                          "dp0",
> +                          "dp1";
> +
> +            resets = <&gcc_usb4_0_bcr>,
> +                     <&gcc_usb4phy_phy_prim_bcr>,
> +                     <&gcc_usb4_0_misc_usb4_sys_bcr>,
> +                     <&gcc_usb4_0_misc_rx_clk_0_bcr>,
> +                     <&gcc_usb4_0_misc_rx_clk_1_bcr>,
> +                     <&gcc_usb4_0_misc_usb_pipe_bcr>,
> +                     <&gcc_usb4_0_misc_pcie_pipe_bcr>,
> +                     <&gcc_usb4_0_misc_tmu_bcr>,
> +                     <&gcc_usb4_0_misc_sb_if_bcr>,
> +                     <&gcc_usb4_0_misc_hia_mstr_bcr>,
> +                     <&gcc_usb4_0_misc_ahb_bcr>,
> +                     <&gcc_usb4_0_misc_dp0_max_pclk_bcr>,
> +                     <&gcc_usb4_0_misc_dp1_max_pclk_bcr>;
> +            reset-names = "core",
> +                          "phy_nocsr",
> +                          "sys",
> +                          "rx0",
> +                          "rx1",
> +                          "usb_pipe",
> +                          "pcie_pipe",
> +                          "tmu",
> +                          "sideband_iface",
> +                          "hia_master",
> +                          "ahb",
> +                          "dp0",
> +                          "dp1";
> +
> +            power-domains = <&gcc GCC_USB4_0_GDSC>;
> +
> +            phys = <&usb4_phy>;
> +            phy-names = "usb4";
> +
> +            iommus = <&apps_smmu 0x1440 0x0>;
> +
> +            interconnects = <&icc0 &icc1>,
> +                            <&icc2 &icc3>;
> +            interconnect-names = "usb4-ddr",
> +                                 "apps-usb4";
> +
> +            mode-switch;
> +
> +            port {
> +                usb4_0_mode_in: endpoint {
> +                };
> +            };
> +        };
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9da37c8dee69de9421d4f70906b4e623a442d171..b607f0a66f953fb1ea72e3405820288850004dfe 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25428,6 +25428,7 @@ L:	linux-usb@vger.kernel.org
>  S:	Maintained
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git
>  F:	Documentation/admin-guide/thunderbolt.rst
> +F:	Documentation/devicetree/bindings/thunderbolt/
>  F:	drivers/thunderbolt/
>  F:	include/linux/thunderbolt.h
>  
> 
> ---
> base-commit: 05af764719214d6568adb55c8749dec295228da8
> change-id: 20250916-topic-qcom_usb4_bindings-3e83e2209e1e
> 
> Best regards,
> -- 
> Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry

