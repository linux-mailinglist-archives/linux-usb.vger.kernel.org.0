Return-Path: <linux-usb+bounces-29506-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB3CBFA529
	for <lists+linux-usb@lfdr.de>; Wed, 22 Oct 2025 08:50:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 57B014F0D4D
	for <lists+linux-usb@lfdr.de>; Wed, 22 Oct 2025 06:50:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 739E42F28F5;
	Wed, 22 Oct 2025 06:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D1ELDRyR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DBA2F2603
	for <linux-usb@vger.kernel.org>; Wed, 22 Oct 2025 06:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761115835; cv=none; b=u2EptaibdJSUNJPWMiiCh3eOQG02CQtB6d2RMg8oeJENy7PbzqN61S3eO/Nvvu395L/SucsfiiLG9ILlwXWj6RGMM7NBXFFzLA05edi83BrWuDaJ1+hHzNgpoAH5t8jq5e9jZx3QAj1PyP1wbQN1wz6k9+n0NFp++Ke6xfNRUx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761115835; c=relaxed/simple;
	bh=dHwbnnIKcEmXux6j+twsIaUTpCe2SsqCuU8ezT71GME=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tdd5TICg7M1N5ZkClpHFxbJfwYUsE70XSkpjYD7sdoXRXUn0D1WyaOfL3JSCLLOwElCyTXgWgE/iXFD1owtvZMySMzdQjz/w3ixdbKUXsRbfCmBJXYdyqIDMto8SpvIbvJGJpka6txEm1K2NF255Zjv8H5Swn42n1O0IJYV/NVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D1ELDRyR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M1u73g024737
	for <linux-usb@vger.kernel.org>; Wed, 22 Oct 2025 06:50:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TpWvVvMsWw/TXnHm2inwaH
	jVIdOxicoQL0Vl8v2SQis=; b=D1ELDRyRMGAJ+JBQZ9Dul0hWmoNjtIQDeIfDF2
	re9bY6S5FiISlRsmn06lP8QgEIsehNrtA6rMHac/DZIYF6sm5x2qtXqDNyzCHoEQ
	mBHRwDD+CJsHSFJji/FM0il+1bfxsW3lrI5LeHYuBxQqXetLrgIl5rd/6FxFr5IQ
	IZKR4v+cBm7PSY7Pa8t7bVVfgf5Dh7I0AJKzIQZuKjhbwVeupeuF0t8aq3yStqHz
	pQRacyPjdATe30qkdxweswV85vZOKeJziBFhdfTHzU/8zEX6sCFU+pNUXnniZKRX
	uaj93mkrExt744BA9Yli7QbYHzYXLCfZkQ0U8TOX1fy2n9Yw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49wsws5xy0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 22 Oct 2025 06:50:32 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-336b646768eso7345674a91.1
        for <linux-usb@vger.kernel.org>; Tue, 21 Oct 2025 23:50:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761115831; x=1761720631;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TpWvVvMsWw/TXnHm2inwaHjVIdOxicoQL0Vl8v2SQis=;
        b=RxtItyRT+dTQdlhH2gVmM/CCv35KVxF6s8ZA3JTHNLs1bMdW1KbA/jGYSQ7bKr8Jkj
         3PMd54I0ooWGC/LRckEG7TzASHFDF/aRDM1djwTSgBgh6KouDP69Y5mPwpekgIfN24J5
         4dBzu9I6gChIlV4VhE9v3NeN0uG5eVKMhxOLFfC4HuDP0sKHQJ56byFKUwdb88f2KiWR
         /KwXgqY95t8aPFpB04b8EX/kg1XPC4hDRNEkBFUK5rU8/a8BgyzLyAjTs+7Nr62Zx6i9
         y6QkkSCb7fAeHfOPK1uACDp67LIkTEInviomfNTw2l/fKqYGgX/8obwd/g72rTAeFaiU
         WgAg==
X-Forwarded-Encrypted: i=1; AJvYcCWaHfJtgQk7gO7hNLX05iFgJ/2xKlk49Boc2OWHq6x46AfVl4CQfXtyqZReC31r7ruqgzM4yBM/Rkk=@vger.kernel.org
X-Gm-Message-State: AOJu0YycdGa2AmbIlCvMvwvgKtzLPNgc8aW9wRErYHNDdNHmcRfDjLlq
	Fu0A/zboWU867+nwZs450DP72Ru1etAMYLZIJwGtU8hjUoQ2XtJWtuK4Wb5RO0SiAg/IIQwhq/P
	AEJ2WGAw7chL+eJxliS4ZzQ5HaAp5QHhbYOqBICNFwRIulYcxOAk/9SxPluRhdzY=
X-Gm-Gg: ASbGncsX99OrAqfOZVW5xnvBr2g1s9j329tmvSGu4iBlpktdRJEF0CBD2l88v/m7vk0
	056YJDjfRQcsEu1u8EE9VBtUxqWx6vIh4jNd5kToYQ/cxKn9pJrDV019/2VpvlwffQiyCucrFFd
	PPrQWyNeHbXNl4dwDM5wIH3y6B4sh/LHNYCZ/cdCtHv4xiRaAjSvtl3S5VYVg5Z9sx25sYZRNwX
	2nE3rTWm7BqtqcFy8t5t5zHid/fcdeKjbaGph25QaHK0lvRndIYgA2VqBYZlsh3y+CmlG6F+SKP
	uxTKVcHwXcQE0u9cEU2S9yk/oTyvxXgoCBmo1svuqDylowmbTUjasK4LsadAIodNLVargNzSZ4d
	NQRFg578JewwW6bjUfsp2wEmVx75xLD50BCGFhO/Ui22upAG1PQ==
X-Received: by 2002:a17:90b:2e46:b0:335:2823:3683 with SMTP id 98e67ed59e1d1-33bcf953e72mr26873449a91.9.1761115830921;
        Tue, 21 Oct 2025 23:50:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCqxMzgEngcnVzPVoHm05YTCFCOmPRtrDaj8ggmV4o9Pc8i12sCZU1TJJyWgcLhxekgKAJrQ==
X-Received: by 2002:a17:90b:2e46:b0:335:2823:3683 with SMTP id 98e67ed59e1d1-33bcf953e72mr26873421a91.9.1761115830493;
        Tue, 21 Oct 2025 23:50:30 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e223e334fsm1560285a91.8.2025.10.21.23.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 23:50:30 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH v2 0/4] phy: qcom: Introduce USB support for Kaanapali
Date: Tue, 21 Oct 2025 23:50:26 -0700
Message-Id: <20251021-knp-usb-v2-0-a2809fffcfab@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALJ++GgC/z2NQQ6CMBBFr0Jm7ZC2AQRX3sOwaMsgjdJiR4iGc
 HcLCzeTvOT9NyswRUcMl2yFSItjF3wCdcrADtrfCV2XGJRQpRRK4sNPOLPBWpKuO9NVZ1lBsqd
 IvfscpVub2GgmNFF7O+z7tFW7Njh+h/g9/i1yl4+0aFTxTy8SBRa16ZveWFsW1TUw569ZP20Yx
 zwdaLdt+wFOEruVvAAAAA==
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761115829; l=1391;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=dHwbnnIKcEmXux6j+twsIaUTpCe2SsqCuU8ezT71GME=;
 b=vgQFFSJm7L85vv9QLTjpskzDXbpxwOizvvDKDTXMdfoGpMol/v2rFFBR5Syqv6LNYy6aDq/Il
 N/8Z6XJJM35B8fghBeh8iC7CqzkQhwKOPPD8seG72VPfwW3GQ+d5We/
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDE0OCBTYWx0ZWRfX0Lv9FyDQnAfO
 bdLNOJjUJZK7DhTWGhgclbrs/IL+ptcDSUno5brFJPDr7rLLJ20UriyBl5SllHCXy6L8cYIhOpd
 Lk61/KuzhYlxDqLuD6BZap199ibCUOB0nPqyB4Q2k6s6zXRDCWjsrSCnA1xwXPl0XQNOX6Q+IBt
 8OTbLf6EW9bkcg3lU1JNi05nCSYoX+/f0dJATOeQRHj1ao7Plgi7gMUxqL/9DTPDjNm83v/hPVU
 xJXyYGjfZczhSZKmbRtxVTZqHalASOo1Rj3eg6JUzcXL9gmx7SuskiwC34Jc9rbqgdDL0iBP7xP
 IAJz2jL4lUIb3ZaWnKUjux7E/gI//s+eO40IgDLgv+/xZ1oxYzBhxKUJiuTpN21AXSBNUg0MDjk
 8rVbyYegVwI6YtNkMtqAs9XpdxX9eg==
X-Proofpoint-GUID: td-TgFDqem8yzbYvi8xvAE0EbQOu8QbS
X-Proofpoint-ORIG-GUID: td-TgFDqem8yzbYvi8xvAE0EbQOu8QbS
X-Authority-Analysis: v=2.4 cv=a+E9NESF c=1 sm=1 tr=0 ts=68f87eb8 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=751tZ-0Qz6C-U5i-0qsA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510200148

Add support for the PHYs and controllers used for USB on Kaanapali SoCs.

The usb function depends on:
https://lore.kernel.org/all/20250920032158.242725-1-wesley.cheng@oss.qualcomm.com/T/#mb2e1260cf266638a56c04bc793f5fe9ed1b3b79d - reviewed
patch 4 was picked from:
https://lore.kernel.org/linux-usb/20250527-sm8750_usb_master-v6-10-d58de3b41d34@oss.qualcomm.com/ - reviewed

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Changes in v2:
- fix author name typo
- Link to v1: https://lore.kernel.org/r/20250924-knp-usb-v1-0-48bf9fbcc546@oss.qualcomm.com

---
Melody Olvera (1):
      arm64: defconfig: Add M31 eUSB2 PHY config

Ronak Raheja (3):
      dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Kaanapali QMP PHY
      dt-bindings: phy: qcom,m31-eusb2-phy: Document M31 eUSB2 PHY for Kaanapali
      dt-bindings: usb: qcom,snps-dwc3: Add Kaanapali compatible

 .../bindings/phy/qcom,m31-eusb2-phy.yaml           |  6 ++-
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         | 54 ++++++++++++----------
 .../devicetree/bindings/usb/qcom,snps-dwc3.yaml    |  3 ++
 arch/arm64/configs/defconfig                       |  1 +
 4 files changed, 39 insertions(+), 25 deletions(-)
---
base-commit: aaa9c3550b60d6259d6ea8b1175ade8d1242444e
change-id: 20251021-knp-usb-81ea8dbd6716

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


