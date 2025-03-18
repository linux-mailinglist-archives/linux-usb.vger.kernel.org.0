Return-Path: <linux-usb+bounces-21857-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A727EA67C97
	for <lists+linux-usb@lfdr.de>; Tue, 18 Mar 2025 20:05:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1066420F54
	for <lists+linux-usb@lfdr.de>; Tue, 18 Mar 2025 19:05:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6EB12139A4;
	Tue, 18 Mar 2025 19:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hux90460"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CAD1CAA8E
	for <linux-usb@vger.kernel.org>; Tue, 18 Mar 2025 19:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742324718; cv=none; b=WhdZW+mNumTgq2NxvBVNA+fpebU07JxUzyqfEMWTz5lSsUp/UcCgIG82ZfOeQTIQacDWRsOzA2K0/flyMpWKY29tTRWt/BCybSPC2lAc4V5FA3nk3rBs+2wdXTfhztP0xJ6bGZucXXji6qz+DZ+hUcqZYCtH+oX40EDjfCysrWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742324718; c=relaxed/simple;
	bh=39ko3FHgK43gR5x5+uuTD00YhId32iFfsMqRNw2Ajzs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mFTYzpv974QNwSI4PmaMqtLjHXW70n7Ir2K0Uip66EIvrncC47TIUl94YN/Q/q/1S6uixYAWM3TNhuM2QzlV2vNXyiZ/KPgrIfYGyHyWT/ioZ5ZhEDdYZ721kJDC3cqEr6iz4PkF6s2S3rTe5GWjGd5u5jdED4/TuME/jSvHUYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hux90460; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IHCZSa003894
	for <linux-usb@vger.kernel.org>; Tue, 18 Mar 2025 19:05:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/tiaFq11cKI50dbFhs7Frd
	fEknq2p1U8wbLG28nhelg=; b=hux90460WF2jJ6YxAuyhRPl5SZZuTi03XLJxq7
	qi1PxszNa+1O1C93zQqkrb7tZtix9IIkzkUepcPbSULFMz3AO0ZEJzEjDHeOCmA9
	/IZVXoBtgo2/RSud82bQ4PS6cn3Hkx5HMuffPqumRTyF1C4ohTPA1511yjisaAhe
	ueYo3Fjni3Alizu3XnoySP1Pd8+YQk6/R1mXql6rhGjEVA0eJY+IXlr3QrRpQim3
	YGGC+rw68bpdhNuJ27A+j75UVuHVhVCmLchssrN8yjVoWimGYBeqQeVjL1XGsQEh
	U3SYMyZEMnFxXd+rgkwCTkSskcyuJ0vcG5KSg3E+/lxI4g4A==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45fd1dg954-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 18 Mar 2025 19:05:11 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-5fe9286b93fso1518086eaf.3
        for <linux-usb@vger.kernel.org>; Tue, 18 Mar 2025 12:05:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742324710; x=1742929510;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/tiaFq11cKI50dbFhs7FrdfEknq2p1U8wbLG28nhelg=;
        b=Nkp3fXN1PX/7PWUbQQEpY8Ju6T3NuMGx3iiLhvumvChqf7dUi4yNmq1fgdepihjgoi
         kp1aaXP+RNE2FYyzFEkluApR+nUXmqCc1K6jHMQlo7wHwuHP8p7uf544T5QnMYmIGsiF
         2x1F4N39aEupS2ONkuNmMPqXOy6X1cCbCZJVVlKJAyQ8xKZi/eTQMLqyrhMxqEHuDtHE
         ttoETU/a7NX6GKkO2lo6okRGhumlsNx4aJ6k1ULtUaasM8ubIIc0eN/tUFIgPMS281CO
         +Hvc8ijRZvu/2tH/h9Ku2BH7ncYjwhlKf1U2Ikg8nArIssiXkmaNvqj28I7zaOYYLt8d
         M54g==
X-Forwarded-Encrypted: i=1; AJvYcCVgd/vLcM0MCN315DE67VEI5lemLNfVAvdmA+FBFy+lkZ/xB48zfJ8pEMVPaLl3TOHKWlUB2WFHUKU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsg4xS3wO214ET3omW5MU/iQYR5odkjAqsh6XcUyT/TSYpF1A9
	q/Mck78jw7ksFN5eG8Tcl0eBgVn7k1PTvFVoTTa8SfFDdCKfu/YZjzNDBx2FIENK+qeHNJ1uQI2
	Uw8bWdgspUqrQ6ZaO/GjlRQmdwpqn7h3CgY4OE0KN3P8xwulBln747UFDSoY=
X-Gm-Gg: ASbGnctk8VhBHYWGFD92lY4X0dCN9hDUu/b+82SOkhNq+enYDUhRqX4LR9fLYqlDLaJ
	kDh1j8XOsjXlC015jEWAqVY13jwvtz63jVPTvG94GM6DYJj/OCqm0IQ+NP51a4dwEkL55ljg+sE
	ORohVw/YDUEwD0KKkAn2PHp8wSy3TFPr77eUr0OmLee1Dx3fsUcgZMa2wRHQz0yUjIORjPoLsxb
	w1CJbrEGOU/aC7rIG1z+8ZXIsz21bMDIGtqycOQPFJRyjs/Qa8LJRwDKlaEU4YoBrAFa5skAXAO
	cnCM4AxJhxyRXLyGIvBRMpT5o57maUmtMDjOLQ3kf0anigRz+wuz6r86sl0KRGNZfMzgoxeFmi9
	Kxi67Wp6bzifzxKU=
X-Received: by 2002:a05:6808:4443:b0:3f9:4f55:a002 with SMTP id 5614622812f47-3feac2a31f8mr144553b6e.12.1742324710064;
        Tue, 18 Mar 2025 12:05:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBeTnqcsngZ8qOyAPY0xLnV4j0KNTcW2cjrNpBB3y01HgwUx2Z+p2qto1cwhI+bvEfVQhgPQ==
X-Received: by 2002:a05:6808:4443:b0:3f9:4f55:a002 with SMTP id 5614622812f47-3feac2a31f8mr144527b6e.12.1742324709595;
        Tue, 18 Mar 2025 12:05:09 -0700 (PDT)
Received: from [192.168.86.65] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3fcd403b065sm2264273b6e.4.2025.03.18.12.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 12:05:09 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: [PATCH v5 0/7] usb: dwc3: qcom: Flatten dwc3 structure
Date: Tue, 18 Mar 2025 14:05:00 -0500
Message-Id: <20250318-dwc3-refactor-v5-0-90ea6e5b3ba4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANzD2WcC/22Py2rDMBBFfyVoXQXNSI7srPIfpQu9XAscOZFit
 SX43zsOhIDJ8l7mnMvcWQk5hsKOuzvLocYSp0Sh+dgxN5j0HXj0lBkKlCDgwP2PkzyH3rjblHk
 nIUgrWtPajhFjTQncZpPcQFSax5HKC53H38fI5xflIRZi/x6bFdd21SvRAmz0FbngHfRSC38A4
 /F0naOLye3ddGarq8on3wgAueUl8R40otCN77U9TaXsr7MZiT+/JOolQdz+WBVJlIImaAAIqns
 jWZblH/CvPB1LAQAA
X-Change-ID: 20231016-dwc3-refactor-931e3b08a8b9
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Saravana Kannan <saravanak@google.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.li@nxp.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank Li <Frank.Li@nxp.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5851;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=39ko3FHgK43gR5x5+uuTD00YhId32iFfsMqRNw2Ajzs=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBn2cPeIn2YeWKN5s+wMP7MDrAngcmEx8hWa5SMa
 NCXfVPTBWGJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZ9nD3hUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcV3TQ/+OMX5HNu+X6YAo2Xhlf9bw9OoHr5dmwM1EoHZLpd
 EAGxpip38tHMaqSFuX7J52v4zWilZJGD9561kOBxNFivDHgYMlKBbfaVpteHQuCjqUwr1NG7TIm
 /A8rAo1uiMOwsm7GheSKmOVozObHIzmno1aK0XGGX4VhCwV+5KyMwoCLcuc3T7E7+T6m4v7mZjx
 AxJMKY/TTUrD0U7nWDQgIjn0KZzxLaalUZvFcrxHxNDUZqJzpNQgPc3pjgHrgyNov/3o+GqYjT5
 FX8VbYYO/86wWzlhPjEoagS5QC95/pPgPfdKFbGU5v5uU+R37/xVfynliq09WA6kjVDpgJAF+1C
 XGHh5NBz6glG9O/BXWRSoxV9513HjGTFY5Ozbuh3bKQ2xE4M4XH4wyYXX0A1+XS/78RvGakWAqs
 aHFDGXtHb+JhcZSAK0WsQnf9DeaUH1vRjYwrxeJ2LmPv7eryzG85NWy5/QNjQ1XuIbzbAxoNYUv
 maOt/NgyS1eb6/rpuoZgYsoa2jo6vhucjdneAaGlobBlB3QyGXQAp+4ewTpHdwfC1rJL/K70/0m
 BaGOKf7EXmVA4rqFgwmsf7XBCUtcRew0iZJwigcxYfKkjZpi9QyywE9lEuIg5D2A/yJ/coSr6gY
 7p+xvs6JiZb4TRwALvyBpaz9IIMhnIZdv2wKCDnEOhGM=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-ORIG-GUID: KqJHQSgFRtXnGM5kyW6lls5lv_TNJL9A
X-Proofpoint-GUID: KqJHQSgFRtXnGM5kyW6lls5lv_TNJL9A
X-Authority-Analysis: v=2.4 cv=T52MT+KQ c=1 sm=1 tr=0 ts=67d9c3e7 cx=c_pps a=V4L7fE8DliODT/OoDI2WOg==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=PRPaYdtWR3OSq7m5HH0A:9
 a=QEXdDO2ut3YA:10 a=WZGXeFmKUf7gPmL3hEjn:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_08,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 mlxscore=0 clxscore=1015
 mlxlogscore=999 lowpriorityscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180137

The USB IP-block found in most Qualcomm platforms is modelled in the
Linux kernel as 3 different independent device drivers, but as shown by
the already existing layering violations in the Qualcomm glue driver
they can not be operated independently.

With the current implementation, the glue driver registers the core and
has no way to know when this is done. As a result, e.g. the suspend
callbacks needs to guard against NULL pointer dereferences when trying
to peek into the struct dwc3 found in the drvdata of the child.

Missing from the upstream Qualcomm USB support is proper handling of
role switching, in which the glue needs to be notified upon DRD mode
changes. Several attempts has been made through the years to register
callbacks etc, but they always fall short when it comes to handling of
the core's probe deferral on resources etc.

Furhtermore, the DeviceTree binding is a direct representation of the
Linux driver model, and doesn't necessarily describe "the USB IP-block".

This series therefor attempts to flatten the driver split, and operate
the glue and core out of the same platform_device instance. And in order
to do this, the DeviceTree representation of the IP block is flattened.

Departing from previous versions' attempts at runtime-convert the
Devicetree representation is swapped out and instead a snapshot of the
current dwc3-qcom driver is proposed to be carried for a limited time.

A patch to convert a single platform - sc8280xp - is included in the
series. The broader conversion will be submitted in a follow up series.

---
Changes in v5:
- Moved the snapshot commit first, to get a clean copy
- Add missing kernel-doc in glue.h
- Used a local "struct device" variable in PM functions to reduce the
  patch size
- Replaced initialization with default values with zero-initalizing the
  dwc3_probe_data in dwc3_probe()
- Add TODO about extcon, as a role-switch callback needs to be
  implemented
- Corrected &usb_2 mmio region length
- Changes the timeline expressed in the commit message to suggest the
  legacy driver to be dropped after next LTS
- Integrated qcom,dwc3.yaml changes since v4
- Link to v4: https://lore.kernel.org/r/20250226-dwc3-refactor-v4-0-4415e7111e49@oss.qualcomm.com

Changes in v4:
- dwc3_{init,uninit}() renamed to dwc3_core_probe() and dwc3_core_remove()
- dwc3_{suspend, resume, complete}() changed to dwc3_pm_*()
- Arguments to dwc3_core_probe() are wrapped in a struct to better
  handle the expected growing list of parameters.
- Add the lost call to dwc3_core_remove() from the Qualcomm glue driver
- Removed now unused cleanup.h, of_address.h, and of_irq.h includes from
  dwc3-qcom.c
- Link to v3: https://lore.kernel.org/r/20250113-dwc3-refactor-v3-0-d1722075df7b@oss.qualcomm.com

Changes in v3:
- Replaced the handcoded migration logic of compatible, reg, interrupts,
  phys with overlays.
- Move the migration logic (and overlays) to a new drivers/of/overlays
  directory and apply this at postcore, so that it takes effect prior to
  the relevant platform_devices are created
- struct dwc3 is embedded in the glue context, rather than having a
  separate object allocated
- The hack of using of_address_to_resource() to avoid platform_resource
  being stale is removed (thanks to applying migration at postcore)
- Link to v2: https://lore.kernel.org/r/20240811-dwc3-refactor-v2-0-91f370d61ad2@quicinc.com

Changes in v2:
- Rewrite after ACPI removal, multiport support and interrupt fixes
- Completely changed strategy for DeviceTree binding, as previous idea
  of using snps,dwc3 as a generic fallback required unreasonable changes
  to that binding.
- Abandoned idea of supporting both flattened and unflattened device
  model in the one driver. As Johan pointed out, it will leave the race
  condition holes and will make the code harder to understand.
  Furthermore, the role switching logic that we intend to introduce
  following this would have depended on the user updating their
  DeviceTree blobs.
- Per above, introduced the dynamic DeviceTree rewrite
- Link to v1: https://lore.kernel.org/all/20231016-dwc3-refactor-v1-0-ab4a84165470@quicinc.com/

---
Bjorn Andersson (7):
      usb: dwc3: qcom: Snapshot driver for backwards compatibilty
      dt-bindings: usb: Introduce qcom,snps-dwc3
      usb: dwc3: core: Expose core driver as library
      usb: dwc3: core: Don't touch resets and clocks
      usb: dwc3: qcom: Don't rely on drvdata during probe
      usb: dwc3: qcom: Transition to flattened model
      arm64: dts: qcom: sc8280x: Flatten the USB nodes

 .../devicetree/bindings/usb/qcom,dwc3.yaml         |  13 +-
 .../devicetree/bindings/usb/qcom,snps-dwc3.yaml    | 620 ++++++++++++++
 arch/arm64/boot/dts/qcom/sa8295p-adp.dts           |  12 +-
 arch/arm64/boot/dts/qcom/sa8540p-ride.dts          |   5 +-
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          |  12 +-
 .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts      |  10 +-
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |  11 +-
 .../boot/dts/qcom/sc8280xp-microsoft-arcata.dts    |  10 +-
 .../boot/dts/qcom/sc8280xp-microsoft-blackrock.dts |  18 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 157 ++--
 drivers/usb/dwc3/Makefile                          |   1 +
 drivers/usb/dwc3/core.c                            | 160 ++--
 drivers/usb/dwc3/dwc3-qcom-legacy.c                | 935 +++++++++++++++++++++
 drivers/usb/dwc3/dwc3-qcom.c                       | 157 ++--
 drivers/usb/dwc3/glue.h                            |  35 +
 15 files changed, 1885 insertions(+), 271 deletions(-)
---
base-commit: c4d4884b67802c41fd67399747165d65c770621a
change-id: 20231016-dwc3-refactor-931e3b08a8b9

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>


