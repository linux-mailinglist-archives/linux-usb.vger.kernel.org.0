Return-Path: <linux-usb+bounces-23053-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CD7A8911E
	for <lists+linux-usb@lfdr.de>; Tue, 15 Apr 2025 03:22:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05C0D189A3BC
	for <lists+linux-usb@lfdr.de>; Tue, 15 Apr 2025 01:22:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B42D4202995;
	Tue, 15 Apr 2025 01:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="piXVusq+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725401FDA69
	for <linux-usb@vger.kernel.org>; Tue, 15 Apr 2025 01:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744680121; cv=none; b=iM/iLv4g3W7tjN/0sUdqLrp3cG82zCCT+PAKj5F6b6JivD6kkpvdgh2Zgu+VOjENKfdj3z2H0pT9Jr7oe8/y0WnIGcaWxp/QIQYcMZkraYG8vofMMEeKvDB/LaX6FXgPyGV28NDE/w8etyd7sN1zQWXPJ6CQy6G6XE1HBh27oSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744680121; c=relaxed/simple;
	bh=+pKd1wd9mvGbFUMaXhNv2GkBpFVdeSguJVT0UbYSWek=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VNtR40pDgvSPkQg/CVqgRsmOBM8gOfPPGxrZk3XbYXi4T1Qfgp8bILZaocoLWNGfJo2huMvEGnwRBRqW1KIiXkn5a8bhh/phYriIsQL0ApPGftQs3ObsQ/OQL+EEMaKFmVp7IM8gpiCjxINBHeLzSchFO8Ot951ij1yQrdgD/EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=piXVusq+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F15MYR022242
	for <linux-usb@vger.kernel.org>; Tue, 15 Apr 2025 01:21:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fi+kxeSEE/xHRxUguI+W19
	1irKpNVL4SIziCpXrYRYw=; b=piXVusq++UbVuqPVsnB25VVZk5tDZ/qOc7Wz7h
	xAgsI3tLJR1iYAMzGXEbhoFOpDTFeXXJRIaJHaVbRVJ1TSoBBUppYD3ZY1fmC5te
	MzEpKuAaTUj+3e3+5QH7/UwkGX1TTMtyrRelU54wpGJhNLR3ncn3BURs9S4YOLxE
	GQfYi51hWyCxO32Xt0cuTyLSELw9K+2FmVY3jqdmt0BTpQwlfnLr/ZJQzNGEPpIt
	z9wdEHNHwU4e4M5ETE5Cu0UJLEju5+VzE/xfD3YR8mh0wLl758sTmdBQKSiuzquT
	rCW3iSEptBTIxMME0CiBQJJFMzQ/eHH27Mlt0aFMlN38eOkA==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf4veb50-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 15 Apr 2025 01:21:58 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-2c238fbc14fso5439602fac.1
        for <linux-usb@vger.kernel.org>; Mon, 14 Apr 2025 18:21:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744680117; x=1745284917;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fi+kxeSEE/xHRxUguI+W191irKpNVL4SIziCpXrYRYw=;
        b=dY+0Ow38c1x+Vnolov+syWGTbVFEyIz1iSHcWffQHh6efi4i2KbGP904gTan8Q++kn
         BmAJF4R/xo7n/oAhniMUdtIMuI9WiRT2LPLMhhkuyXfrGjK4hf4z5OAo2NDq75K3TKjl
         2DjHCrLeuMaHN0/d8LLQueR2JHRato1q8SjAVlYmWwOeICmbaYMkwLjNiXbOD5G7C/0N
         fmOCZx+ELQtAscye5se8cB6C12oRP1G19JvsJJtRcy3y04xfLqBHvCt2dG4gf1gT2aP6
         t6sopwqqOIaDZffETOkdiToKrbtTnC+4LVFjOchB1GAdPiSwQcVfQ71FZyE2Oq/Qrwe8
         PupQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRrAOvMReSKsBhJTOPUpcYIEggQY3GuAVbTizg9kACZzqYZ3MNreJ0xs6OtNHquCzq2BeQ7URzPGM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqR46xmQGgz+OvZmD0hp4feM5w6OCjjuRPuTGjGtBmGrCQbSsN
	ny3T/XdszTjMr2kO2mvaHvygSt4yoL6HmjVbPI/fBUBEe+grYBD69C45cqynei3Q4rCaei4TiVQ
	u7FBXkCT4to23/IKk4ifo1v3JPi2Y6kUU0vX+AfZvJnMdCEL4NdCTWe9+3f8=
X-Gm-Gg: ASbGncv/l/lSMcBcM9PA/Fz2CxYL3akn4OzJJuDusUgrGpPbQ6dnh3xTUeRZlaANIpN
	HuBrPE3yotqqcHn+OyZKErXd2FkseDDKOjecSUPUovDvPBWqBLvzmJ7rYBvMAq0nudUF/e0F8pu
	F6DuhL5pMz9oMw2LUuODV7Y4bsrHWVU08LspM2MzcmHJ08XmIEfWLZJ3ZYGrLYvefRT02JXUHX/
	1Pw5OvBaQpPdeO31ClNRi8wXXrX1DVIH89SZf51p55jvNXiTdi/BNb1jEktwDvpUjtWdckSf4rq
	V/919GdkmC317N18F7ywdZKvrpdhf3trqU8Z4oMbZAGIDbbJEePFmwz8K0nXiH35bY/Vo5wRf2c
	FOB1ED5pVyq8=
X-Received: by 2002:a05:6870:6f14:b0:2c2:cd87:7521 with SMTP id 586e51a60fabf-2d0d5c585c3mr9102365fac.4.1744680117108;
        Mon, 14 Apr 2025 18:21:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE757j9dJHMp66IhBlr+KUh7uCS/kjJ8daHvGMydKbndb8Sh7ZAQ57GmiTT0CDLWHse8/MVYA==
X-Received: by 2002:a05:6870:6f14:b0:2c2:cd87:7521 with SMTP id 586e51a60fabf-2d0d5c585c3mr9102347fac.4.1744680116733;
        Mon, 14 Apr 2025 18:21:56 -0700 (PDT)
Received: from [192.168.86.65] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d0968e090esm2652538fac.6.2025.04.14.18.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 18:21:56 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: [PATCH v7 0/6] usb: dwc3: qcom: Flatten dwc3 structure
Date: Mon, 14 Apr 2025 20:21:49 -0500
Message-Id: <20250414-dwc3-refactor-v7-0-f015b358722d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK20/WcC/3XPS2rDMBCA4asEraug0ehhd5V7hCz0GNcCx06s2
 m0JvnvlQDGYZjmD/k/Mg2UaE2X2fniwkeaU09CXwb4dWGhd/0E8xTIzKSSCAMPjV0A+UuPC5zD
 yGoHQi8pVvmal8S4T96PrQ1uqfuq6sryV5+n7+cn5UuY25dL+PP+c5bpdeSUqgB0/Sy54DQ1aE
 Q24KE/3KYXUh2MYrmy1ZvzrtQDAfY+lj2ClFFbHxvrTkPPxPrmu9NcNURsi5f7GWRVEKdBkAYB
 U/QLRG4JQ7RG9XiLIGdIevVMvELMhCsQeMes5QUTwiAZQ/4Msy/ILCQoedNUBAAA=
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
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6128;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=+pKd1wd9mvGbFUMaXhNv2GkBpFVdeSguJVT0UbYSWek=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBn/bSyM1pA6Ut/HVJKGUwNJ9nBLjQCIsE0tpDwD
 i367EIR+daJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZ/20shUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcUwRRAAxRYB9zEHxEOH1/ECz2z1qhfP+8KI+EABQAeIa6L
 /5X1N8TkdkLKbMgBuuAXpRrOZkb19joQSVAHQfO78413al4c4f+xGIKhMIu/nh3KWqyrbQApmki
 ye92n6vIzLA5wivM80P9oaLINRaJGRojVExd+yzhqI92TeYxGG/0YZsyBdvOpTkpYLRQFj//4Te
 7e+CZ6Tj4Abu14uAcysyAeFkowoFOLqKx1zUMK7RrUH4cThtVuIuE7IZM9n59YcYbwwGzP5dDnm
 OG4zmFAyHXKl04BB/dan1xy1iys75eqAeK75ASLkuP+ETWVc9ImKhElsmuGA4qa5OJK3mEYYFKO
 05c+DvVIFwyUJeC/UjsSueCIy7AnYe2MN5AjkjwJuTskbfi0+GvbkvLwW2M0ndVc0Ngtz1zkEF/
 372aMV069ffP61YCC5gMhd7XssuzST5S6Bh41NV7ReMv+6SRWLOY5lceXTnRnoqO/tNjTPkawYB
 EWm75uHX6rw/wdq9CVb1rfnaOn5ZP8xR967MA+KR5/HuXb1N0rk5Y3OOnWO76ZdtvLULeXBWWof
 LoyDHHPBorPf3t0+BBB2bw8Ol6v67oChtfYjU2F2Kf+cOIaS2WEXeGb2LT8W7BQgpnlZ6RbaLn0
 6G/SHrBikGFlDYlvz6+WA0Ynxy0yP3GiRlUvLHyQn4L4=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-ORIG-GUID: B174jvYwmRt23WBhgdBx2wF0sKfk6ewB
X-Authority-Analysis: v=2.4 cv=IZ6HWXqa c=1 sm=1 tr=0 ts=67fdb4b6 cx=c_pps a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=RNNl8Y2_yDh1yS-_eIMA:9
 a=QEXdDO2ut3YA:10 a=vh23qwtRXIYOdz9xvnmn:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: B174jvYwmRt23WBhgdBx2wF0sKfk6ewB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150005

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

A patch to convert a single platform - sc8280xp - was included in the
series. This, and others, will be submitted in a separate series as soon
as its introduction won't break bisection.

---
Changes in v7:
- Rebased on usb-next, wrapped dwc3_prepare() alongside other exported
  core functions
- Link to v6: https://lore.kernel.org/r/20250410-dwc3-refactor-v6-0-dc0d1b336135@oss.qualcomm.com

Changes in v6:
- Change legacy driver's name, to avoid collision if both are loaded
- Drop duplicate pm_runtime_{allow,disable}() from dwc3_qcom_remove()
- Drop DeviceTree example patch, as this should be picked up separately
- Replace __maybe_unused for PM and PM_SLEEP functions in dwc3-qcom.c
  with guards, to match the exported functions from the core
- Add missing pm_runtime idle wrapper from dwc3-qcom
- Add missing "dma-coherent" to the qcom,snps-dwc3 binding
- Link to v5: https://lore.kernel.org/r/20250318-dwc3-refactor-v5-0-90ea6e5b3ba4@oss.qualcomm.com

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
Bjorn Andersson (6):
      usb: dwc3: qcom: Snapshot driver for backwards compatibilty
      dt-bindings: usb: Introduce qcom,snps-dwc3
      usb: dwc3: core: Expose core driver as library
      usb: dwc3: core: Don't touch resets and clocks
      usb: dwc3: qcom: Don't rely on drvdata during probe
      usb: dwc3: qcom: Transition to flattened model

 .../devicetree/bindings/usb/qcom,dwc3.yaml         |  13 +-
 .../devicetree/bindings/usb/qcom,snps-dwc3.yaml    | 622 ++++++++++++++
 drivers/usb/dwc3/Makefile                          |   1 +
 drivers/usb/dwc3/core.c                            | 173 ++--
 drivers/usb/dwc3/dwc3-qcom-legacy.c                | 935 +++++++++++++++++++++
 drivers/usb/dwc3/dwc3-qcom.c                       | 191 +++--
 drivers/usb/dwc3/glue.h                            |  36 +
 7 files changed, 1828 insertions(+), 143 deletions(-)
---
base-commit: b425262c07a6a643ebeed91046e161e20b944164
change-id: 20231016-dwc3-refactor-931e3b08a8b9

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>


