Return-Path: <linux-usb+bounces-32433-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 307D1D389B3
	for <lists+linux-usb@lfdr.de>; Sat, 17 Jan 2026 00:21:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD8F7306767D
	for <lists+linux-usb@lfdr.de>; Fri, 16 Jan 2026 23:21:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 504F2315769;
	Fri, 16 Jan 2026 23:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m710OcfS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DG9ADfLN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DCEB665
	for <linux-usb@vger.kernel.org>; Fri, 16 Jan 2026 23:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768605670; cv=none; b=g069j1JyCHBBE4lUTkQsfShk6OY5yzSfvzV1/r0fJ+KF/rl/HLbAfBqHulir3JVkLQnA5l1wDwZN+T5XzFV9DGW7gYdV82IECM03tHXaQYDTx64QeLhz9qJ6qtfHiKFjrvKu1pWBf/8r2PCic6e71adpSpSOhfPFvVdEQRY9jNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768605670; c=relaxed/simple;
	bh=iQQKTJXh4jVViiDh1uBxCyJh5+dwGFy8mlbi+GK47q4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=bl1Ne99ngqbmvRSTgrMdWEUKZRtUwQXvoovv1iON8XW+wZ1MyOyBFbB30O311nTlUPaLMVOvmGfClwh7ZvE7VDwDuuSHYjBf/Ow/jjmq+osiCI12Uu4gmYcxn7cqBLRuxhngv42ovqFDPHU6+0FZkE1pIJ04icY99RPi5NxJMto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m710OcfS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DG9ADfLN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GNEAU32134984
	for <linux-usb@vger.kernel.org>; Fri, 16 Jan 2026 23:21:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RT/RfM1KoDrJ7wIYu4iXct
	kP9u3nbJNWzJOBhFkshN4=; b=m710OcfSVBZz5EvSstbrvtLcCCdWD4/aOcn2WK
	I07Y59XrYAZUQuR+HQnB3gxvgCHDbpMY/mCAPc1ebfqqMJy0PKcai1VnlLy+vrx3
	NrOLdHMNJv2k6sPhjqIPL9+L9rgwJ6vwjtX5rM/4eP8lqmow7aOlYL25IweHVEwV
	tKAGIIM1kDIpoQuBxJu+mdIdcNg+R3DU4vjtz2wtwfIrpUOLoInvxoCF6X+6CO6A
	z/uB4EviuLq7rs04b23+m3VyFIV2t9JEPoIrAQylXfbuojFtlFZTD+LYHETj8PUQ
	gitFbYdYdIT2plNQ2DuEQWf6fprhuuRbMh3Wqn7oTcICJjGQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bqveh8bku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 16 Jan 2026 23:21:08 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-122008d48e5so4736445c88.1
        for <linux-usb@vger.kernel.org>; Fri, 16 Jan 2026 15:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768605668; x=1769210468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RT/RfM1KoDrJ7wIYu4iXctkP9u3nbJNWzJOBhFkshN4=;
        b=DG9ADfLNM+xqI2MU8GUZSuXrXJ2BbOYEle5Kff5lVcFjXInFxFzgOuSCtuSTWjyowc
         hJyaYKjOY5jvuRAeUp+HiPxwUrK+Rm3n6S4Rpxc1H/TePPqnOuHfQhzFN0wOORo91YZu
         H4yxIwY4zNYj2XA8CPqBNuZf2pIfali0TzykClTgg8w076RGJ64Z5/PkCzSWYO7vc+0y
         66AbgBbFEXfylwCCqMuYUcrBL/CafuHzu/1Dq93T7uMRAI8kFXnkm3vtJhLHuaVnmUkL
         g9/WygqVBM2mGz0mF9nYbtY7QDVULfMh16NFCfawIiN3UgymgiIEGSLvHUFVnsSdeBVd
         SrqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768605668; x=1769210468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RT/RfM1KoDrJ7wIYu4iXctkP9u3nbJNWzJOBhFkshN4=;
        b=Nn78O4SmvmSfxZPJH05umCqQidBiSFveMQNphP7OxDSyc2jFCjOLy6nyIN42TrnhS3
         Rb0AWTSGqIleK90kjHe7l4xsFBlHnwRY7VpGS1xthv4mgImUrBGZd6v+G6kGPbJcKZyL
         McAG+VWoVpoaj8TKTOjt4wE7vUsLph4JMRhfH+Mw7ndEnR7S+Da4sn40E38mKEo+FNpd
         AVyz8RDwZ3OS8xxofsmbi1fw5w2gTrbIwMXbHsOhD7UgDBURaNT0HEi6NaJdKKOjT6LP
         tawrgTBq8AKY6PlyIHNW029ifAfNbGwPrtrZGVEH1fPZjqr8VxiUIuMtbhtG2uaxBQ76
         x8SA==
X-Forwarded-Encrypted: i=1; AJvYcCX2c3XKQLgqjiMkAD69K1NZNtv7Vjqk4vEnoF4E4bkh38UchYhzkOtvyvdvnp0xrxl7OhkYwnSBBY0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxdYAxsaXA7ALoavUZtHmgBcii7g5iKcRVwF00FlRHlZ2zJPcM
	b+v8RIsa7CEx4DVh/JtW5ranfDkK2MlYuktWsa35dIKexg54MfXX0KbIaS+v9IjI/Sc+T/cifnH
	zQE58NlnrzqNnfigPrpsbyZzp73kyd+apqLn6mrHM5i+MLBSzJT0VT/k+8UhYQyo=
X-Gm-Gg: AY/fxX6OnCWRDE3LtBn9WbWtBCGxemur9XPtFGycGa1/SsAGhFz1ue0eqGuAZGcMxZZ
	UzpWx2w08tBZInY3xEfIbiK/UeBqWZB+dIpgU9f/lq9gXNLYze4wXfg36B2NDKzDN2UOFobg91H
	7UsTHklDXpyBPR9THSJsQY94arjodbunTRspQVKGreLz9aMQvo42Kz3+Z3/EQBQZSZmWf3rNk7U
	+F1+SihmlYFK0Py2WtQKni4C9G8eVwjV7NUXsDSbIZ1wyvZkSvldFiLI0yUYNY1mOLQHAJyXavK
	6JMGjpZEtRygGlwIZ17tBIuINvGV5dAo42b7A1aVw9kOjNbN/XN2tGhRWv8xpCXY6wdgtQih0ch
	hu+aodREJGavNtEH06TfEhkTKzwr7md/ol+3HDwOV7vfs12L13TQCb6aPK0GrXbU=
X-Received: by 2002:a05:7022:6084:b0:11e:528:4185 with SMTP id a92af1059eb24-1244a782eb1mr3946255c88.38.1768605667958;
        Fri, 16 Jan 2026 15:21:07 -0800 (PST)
X-Received: by 2002:a05:7022:6084:b0:11e:528:4185 with SMTP id a92af1059eb24-1244a782eb1mr3946241c88.38.1768605667432;
        Fri, 16 Jan 2026 15:21:07 -0800 (PST)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244af10e21sm4611267c88.16.2026.01.16.15.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 15:21:06 -0800 (PST)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/9] Improve Qualcomm EUD driver and platform support
Date: Fri, 16 Jan 2026 15:20:57 -0800
Message-Id: <20260116232106.2234978-1-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDE3NSBTYWx0ZWRfX2LjaO7DVxSWW
 BXlCdtYt1FUU1o7C5NG93aVwT+kExXq6Y1zE2LmcscNu29zmPa0Dq8RP2dNJQRdBBNexbf//fsP
 +d1+K/RhNakA3s9ftjVcUgZidkVEWKG+DTShQquwaydUmaXPrP/AnwLCxEjVlfHLmqV17c+j7y9
 Vv578o8fblSmY/VIRZQiyH+1AGygpVsBou0EGU/uk+amJOu1IR0OGw1nUIEzZMgz8GpxR1vtrrJ
 aTGdigsFv2Hj1ytMNu7NaBaR+Qp59+1vRlAQ75nXipKGegbZTtqtfAHDEh1IVNGID3oafwXq1Fg
 aF86T1dHpyUjmmB9eCjOhzo16vnNbuqEPamw0AAcT2xgrYDu8Nf9nP0XcckLytccrHto57XgZox
 g5cChLFF4W1utaZ5SmSICrnGxxtgmSMX43rSMvokMF4kwvTY9KVruwCX8UB12ehBjn4azCIan1I
 PMxTY9Yp44vINgrgsmg==
X-Proofpoint-ORIG-GUID: AlWSBYj3nQKd0J1t3h9cVrlX5GTl5ckb
X-Proofpoint-GUID: AlWSBYj3nQKd0J1t3h9cVrlX5GTl5ckb
X-Authority-Analysis: v=2.4 cv=ePgeTXp1 c=1 sm=1 tr=0 ts=696ac7e4 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=gxp_OhC1Z7o2wZrAEi8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=LnhvVPq8fVUA:10 a=vr4QvYf-bLy2KjpDp97w:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_08,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1011 phishscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601160175

The Embedded USB Debugger (EUD) is a High-Speed USB on-chip hub that
provides debug and trace capabilities on Qualcomm platforms. The current
EUD driver, however, lacks essential hardware resources such as PHY
references and support for multi-port configurations. This series
addresses those gaps and introduces the necessary device tree updates
to enable testing and validation of the enhanced functionality.

This work builds upon an earlier EUD driver submission:
https://lore.kernel.org/all/20240730222439.3469-1-quic_eserrao@quicinc.com/
and extends it with support for multi-port use cases and proper handling
of EUD operation across different USB roles.

The series has been validated on the Qualcomm Dragonwing Q6 platform
(RB3 Gen2 board), confirming successful OpenOCD connectivity to the EUD
interface. For detailed usage instructions, refer to Qualcomm’s Linux
kernel debugging guide:
https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-12/debugging_linux_kernel.html#debug-using-openocd

Elson Serrao (9):
  dt-bindings: soc: qcom: eud: Restructure to model multi-path hardware
  usb: misc: qcom_eud: add sysfs attribute for port selection
  usb: misc: qcom_eud: add per-path High-Speed PHY control
  usb: misc: qcom_eud: add per-path role switch support
  usb: misc: qcom_eud: improve enable_store API
  usb: misc: qcom_eud: add host mode coordination
  usb: misc: qcom_eud: fix virtual attach/detach event handling
  arm64: dts: qcom: kodiak: Align EUD node with binding
  arm64: dts: qcom: qcs6490-rb3gen2: Enable EUD debug functionality

 Documentation/ABI/testing/sysfs-driver-eud    |  16 +
 .../bindings/soc/qcom/qcom,eud.yaml           |  97 +++--
 arch/arm64/boot/dts/qcom/kodiak.dtsi          |  33 +-
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  |  20 +-
 drivers/usb/misc/qcom_eud.c                   | 365 +++++++++++++++++-
 5 files changed, 474 insertions(+), 57 deletions(-)

-- 
2.34.1


