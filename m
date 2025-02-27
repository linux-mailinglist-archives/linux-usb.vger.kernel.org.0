Return-Path: <linux-usb+bounces-21110-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 369F7A46FE0
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 01:11:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D75316B5AD
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 00:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A64942F30;
	Thu, 27 Feb 2025 00:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dPpz4nOM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B29DA48
	for <linux-usb@vger.kernel.org>; Thu, 27 Feb 2025 00:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740615109; cv=none; b=RHPNruoP8cA8MYm2xZrF9j35mc1eOldIoY5s7I4jE+FuCCA2feb9+n5j7yAizPJjQ9nzgxSMikW85Jb7kNu3plWLtxMNbY6JYHOiNlLGfQvd96EO0180O63vy8My6kfKIp6VOk6vqyY2vv9NS2RbOhmlfpLJ6TWPeHzuLgWWv6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740615109; c=relaxed/simple;
	bh=WvIl5h/0BRa73anK513Nn1t2vX/kn/YhvN0+5bCJAsE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Cd6yrwhOLpGKFt641NYOW6AtQI5yFzrtUGuFF9mtSdU3mVbHHSj77jUodCOzkGdICASw1bqDdBE5afZDunj4K1ZuuFo3sn+knnKZON4dxfISH4N9pFMJcW0fm9p8+S71L9Uc1o4+dglPTuPVzCSqA3dUwqgX+pxXqUUVG2WyNJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dPpz4nOM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51QM4dvc005768
	for <linux-usb@vger.kernel.org>; Thu, 27 Feb 2025 00:11:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gj3eEm3VE/jlOHw1fdSEu0
	vZyx5UQJfkqpgiLmSv8Kk=; b=dPpz4nOM5FEWtbFGu+xgiKMlkiiISXb/HQKuOz
	GQL9AcP5AKEbSyL2Hbj9QtNJFKO/4ZJ2x0LtSbzCUGpls22t+og0mYqG49JfKaeA
	Wuv4cAXk8Lenl8onHnYfW9Ib2EJFLytXj5nVGC588P3elx2KRw1RfCy+iMkyA6BN
	AiuwMK8iJ/E8wZllSgeQ74MNNWpAL5AEkAkPtWD3iDJ6XfjrLmAIUUZ2zPujtJP/
	5+eRuDVB5seqQXKdQMO5Zp3l1iBck8jRHDJslpnUPGaznZNUSsw0iW0U+LTq5x9v
	tqiFeVk3Kx9ZmV8nSHrQMPch4HMeOMFOB/ou5CxesEksultQ==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 452be6g7v6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 27 Feb 2025 00:11:46 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3f3ffa97b2eso449834b6e.2
        for <linux-usb@vger.kernel.org>; Wed, 26 Feb 2025 16:11:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740615105; x=1741219905;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gj3eEm3VE/jlOHw1fdSEu0vZyx5UQJfkqpgiLmSv8Kk=;
        b=DWp4PDcgCv8mSFMKG7OrWsdLfaacfqIpT2a4hHMOJOCwwiJsvd1IHaEY3MFJPw8fMc
         sdkqJXfoSuZteg8uu3nS4arQn3F9MuB6+o2rXP8I6I131p8NBJdbSpGBeOTM3uQaRk0k
         nm9rp4Q9XDdIhRhANw3RwuM1iYGHlHh4f1uUHDsg7AfB5nbHUXATGsRzhaNq9EMPQLKN
         hbXHFR+65AGyIPdto9X+6DuNc6j4Sj8WndTMnFmCSUxzGbc61vMGFb+c0+aoAZI1TgGQ
         y47EZCyQqBcjg0BNTPfO57JxBbVPRPa7eOO2xJrb5WCF74kLm2so2e86rntgWFf+GVzq
         cY1A==
X-Forwarded-Encrypted: i=1; AJvYcCW280HKgHFNvHVMqcv+VhoAySChg7+gqww16OG1WyZnidKJDgKveRFf1Umh4w2efBu81T1RjE7jEZQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9YQ43iSg4/fJoR6DSd4fFFOaRlxwFzpYI9+ugBA5YrXYjTLKM
	J/+e+D6QiCtXzdLixMkVfhntI47bslgAvqMMd09UH37Wfk5KA8/WrZdVGRcNSRv+PfJz6QUIu5a
	4D/8g4KZrmQg/aC3dz+WVpzBDGNxfPJsY13fNLrCANGVcrGXdRuKkZ85vaJE=
X-Gm-Gg: ASbGnctbbfMGKTAdA1TL+YVTDrAuiRvDWUSd7c3pC1u0yPNBFb86IQsmzfxiFi1Q7mO
	/0QVmq0t286AGKpcoj8uFk864Ot+i8IJ1pX/YCfl/BmDjJtjhXNan3sMM8tpD8akSHnd48UexC1
	kH0+U0iPSc+TWvPBqXESdeLFIcvtI3YQ3w1ENg8YA+vHWJhiAv+5xWMfukg54XiDOmc0teBLrvd
	gK34afHbfzcCWCYGVaabs+6ecFUD8kirlQWiNNxjyNhsrqhZy0DNkHhSuPEl5SBTosIW1rd5uxl
	bJ77V1k9U2KBRzcox2MioG1TVY7M4Celbug1lsC4Xdsy7CQiHKPEm5+HHVwoc36Ol5GM+QNYJYi
	9kGNygMNoXqrL0F0=
X-Received: by 2002:a05:6808:10c7:b0:3f3:ffde:7729 with SMTP id 5614622812f47-3f4246c129dmr17850699b6e.11.1740615105314;
        Wed, 26 Feb 2025 16:11:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGPzdHFzk7Ps+ek1I+3w4vAZdEWNpfDCC6+s97X0ymzXZbvt4V/9VH2gYB3eZfrAySS4Ee3fQ==
X-Received: by 2002:a05:6808:10c7:b0:3f3:ffde:7729 with SMTP id 5614622812f47-3f4246c129dmr17850689b6e.11.1740615104970;
        Wed, 26 Feb 2025 16:11:44 -0800 (PST)
Received: from [192.168.86.65] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f5507c40c6sm33988b6e.45.2025.02.26.16.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 16:11:44 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: [PATCH v4 0/7] usb: dwc3: qcom: Flatten dwc3 structure
Date: Wed, 26 Feb 2025 16:17:47 -0800
Message-Id: <20250226-dwc3-refactor-v4-0-4415e7111e49@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACuvv2cC/12Nyw6CMBREf4V0bUlvy9MV/2Fc9IU0wSKtoIbw7
 14wbljOZM6ZhUQbnI3knCwk2NlFN3gM2SkhupP+ZqkzmAlnXACDgpqXFjTYVurnEGgtwArFKlm
 pmiCjZLRUBel1h5Sf+h7LB87dez+5XDF3LiL72T9nvrWbPmMVwEE/c8poDa0omSlAGt6Mk9PO6
 1QPd7K5ZvHncwYgjrxA3kDJOStz05aqGWJMx0n2yN9/knVdvz1lQlIGAQAA
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
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5168;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=WvIl5h/0BRa73anK513Nn1t2vX/kn/YhvN0+5bCJAsE=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBnv683WVjHTwfWnAV8kgo287nV9YCXuMhovGrdD
 HmyI9HVuayJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZ7+vNxUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcUqfhAAzqy2JfjA1uK0UoKHtcNPBoV6tCpAfkso6go2qm4
 uqVQQXAlRz7YULfEB0QgiUgDnc7aBdsOIEWb5VRxoQHXZIGQAbfyuJ0BQj8fK5QDjKc70W2RU3G
 CLigAS52NkYgzzNO+HN+5+ilnS6ikuH5O34aLQAEI7MmVcU4ZIW1sxfHiRHLK4JV0igaf2Yv6Oo
 HHh649Hbf5EvBsUoRM/dLdohcYwEBtEck4rtdcusHrymxf3yFHph4EvGmTGj/n4LGxEMHIYQfEy
 lmRfZi9Ec0QrXa8c2HAyf0eKdVtF86gbS/AHC34B8j1uhU+3+ItKRe3OERWZyxGUIbk81T19BaB
 gWq5P/rmzMlSLxLyCgfLdJSC2bkIt1po9tXGMxdZMoOyNp+eOwfB8/eEBYY29DKwp1CLC3J37E0
 4xKEtIXgioNujT3vc8taX1M76HvkhFaV8+QAEQU1Ojrclryre6iCNX997pbf8ensKMPGrsdi2Tf
 HooBE5IWR2C6QqlAC1pnMbZf6FbotZHce3VTSqXbspBq3ht/eunejHQzMDLd2anxJF8lszMdrtz
 pUS8sGHsH4gz/N0KtU0r+TyvkeqHRvzSbX80mIca3E3JFbvhp3phEvmzm5YkJZr+uTFV698k0ss
 aR3crbez80HvylPtz0y0zXvw5RjgRA0pQQyp+vg7me9Q=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-GUID: GMzJugNdbZ2IQETJwOgTIvg8If3v8IJG
X-Proofpoint-ORIG-GUID: GMzJugNdbZ2IQETJwOgTIvg8If3v8IJG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_07,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 impostorscore=0 mlxlogscore=999 phishscore=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502270000

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
      dt-bindings: usb: Introduce qcom,snps-dwc3
      usb: dwc3: core: Expose core driver as library
      usb: dwc3: core: Don't touch resets and clocks
      usb: dwc3: qcom: Don't rely on drvdata during probe
      usb: dwc3: qcom: Snapshot driver for backwards compatibilty
      usb: dwc3: qcom: Transition to flattened model
      arm64: dts: qcom: sc8280x: Flatten the USB nodes

 .../devicetree/bindings/usb/qcom,dwc3.yaml         |  13 +-
 .../devicetree/bindings/usb/qcom,snps-dwc3.yaml    | 619 ++++++++++++++
 arch/arm64/boot/dts/qcom/sa8295p-adp.dts           |  12 +-
 arch/arm64/boot/dts/qcom/sa8540p-ride.dts          |   5 +-
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          |  12 +-
 .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts      |  10 +-
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |  11 +-
 .../boot/dts/qcom/sc8280xp-microsoft-arcata.dts    |  10 +-
 .../boot/dts/qcom/sc8280xp-microsoft-blackrock.dts |  18 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 157 ++--
 drivers/usb/dwc3/Makefile                          |   1 +
 drivers/usb/dwc3/core.c                            | 174 ++--
 drivers/usb/dwc3/dwc3-qcom-legacy.c                | 934 +++++++++++++++++++++
 drivers/usb/dwc3/dwc3-qcom.c                       | 152 ++--
 drivers/usb/dwc3/glue.h                            |  33 +
 15 files changed, 1881 insertions(+), 280 deletions(-)
---
base-commit: c1136f35c7d1ce2517e875884644a44da6121c35
change-id: 20231016-dwc3-refactor-931e3b08a8b9

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>


