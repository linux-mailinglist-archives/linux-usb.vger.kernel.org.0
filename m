Return-Path: <linux-usb+bounces-27691-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F815B47CBD
	for <lists+linux-usb@lfdr.de>; Sun,  7 Sep 2025 20:14:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D23EE17D7FC
	for <lists+linux-usb@lfdr.de>; Sun,  7 Sep 2025 18:14:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6016D299949;
	Sun,  7 Sep 2025 18:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GauMgnjW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0013594C
	for <linux-usb@vger.kernel.org>; Sun,  7 Sep 2025 18:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757268862; cv=none; b=j0+AAfZA18W6s86s4ocatSo1Ed6HHX/3asCsgU2c7jbsTt0d5HBQ5aZ9GcHjoD6c0BrLoJF8AtV+FUAdMbG2wr2mfg2QTk5eid+ShgBLcvaUcb7D7xoGWF+y+g/fMuCxC2SyzIjn6nlnZKo71mMoXjz6lt5Zot0YMlLLFcsscbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757268862; c=relaxed/simple;
	bh=11/dD3dDcCOc9MsrcPqs0qbvB/s/is+nEp2ZS7rQWfQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TsfF3A5QXS+Wq0jgMpNkWoDnU2UuH/aMKEKpqk+Ircd39Gs16MiGCHGEwbfBZX6iaW1UdvYF81FbGsrVYjq8B+zKqTmDrTDe257007aR4b5xUaG59+0hV9IcwqdOVSZWO2JUwm82v/n0voUqa8DK6oY/n9Hnf8j56nysJVbBqJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GauMgnjW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587HE5BH018823
	for <linux-usb@vger.kernel.org>; Sun, 7 Sep 2025 18:14:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=8UMw1xCRpkP/WZEjhmDx4M+05aTIY2seDc4
	onliaA1Q=; b=GauMgnjWWmWyWiEVqykL95sY8fp/QrekbaishAfietoABQa71rd
	Ye8/dvIx1shaN+x+qgEDoHu9asL2eRtcll0IdHK31RrsgolL83UxLDvyPMjQxb4N
	Agz9JBgeuPQI1UAezcND1jteut2FFLn0lw0CWTIwhZlBcw+MxW1cHd/UkQXGFcnn
	uj69uRGMRDg1uIfA1tfxOSKUrIHZCiAkPjJ4pHH3BPmhmebWt9FlJGiWIFym4BdF
	V71wJo0Z4Xz66PpU1js1UabAD41bx5haK6zDXVC+yYjjBU7gh2kUGl0xVuIvp+Fu
	6RwHjGWXE5z9ISc8BUo38aYzOa9hWu3CAJg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bws2gkc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sun, 07 Sep 2025 18:14:20 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-32d4e8fe166so2086945a91.2
        for <linux-usb@vger.kernel.org>; Sun, 07 Sep 2025 11:14:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757268859; x=1757873659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8UMw1xCRpkP/WZEjhmDx4M+05aTIY2seDc4onliaA1Q=;
        b=xT0ZL38AzJx1xO7YdmNMFUEqmUiZQXZlnasiYkfspA2wRtj5K8/sOKrpK6JWCvmSMI
         a3uFgidD0y0N5x6x9Drkgw/dmr6RB6a0jVY1/ttV59MkMpIcrvTeLGYOli3+8urGBDU3
         VFFt1SdYL/E6OL+OleGsbjXXNi1YgyIKNihc8p9oSPZYc9+7k6VOks9qzczp78ByWqsp
         f1DSZdSEfQWmYaMMKcAJx2Jj/YpWT/0Fv6TrKTjnBZrOxqBrv1wuCIKtX8qKSHDQaGT+
         13yrARk2l6aKGjbhFjhWHVDGgJRw/q7nsT0y4ovAU/GM5fXWW/FbPyBGxGdn5ECTU6Xt
         jalQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqIYsIew+v3aY4ByV9hLLp0+tygmuRLzAGxcUtLceMYt5Mc1YWLAEQYoPkG8aq+9KK8xXLfO/oDY0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRw4YyEMqtZ0ER/RGnGCAgu053NDPrYHyERCybSjEVUGTvhjI3
	WNhZdGXV35RtjXGOdVPD8EJq38KQT6F3fUtJ9hR2EJfdPPCVFZcL9aXTzSR9R4W+VKghxQbC+W1
	LRJM7BJGtV2lqZUanDTHD3s7Li9QxwGTB/o5mtmmS1vWgUI+Rj4wrubIruvSKE18=
X-Gm-Gg: ASbGncvngjdiDxCcDtszrj/X3KKYMp9l3323GtMBdNWC2PV28oQ68/ugL1n6hjI1A9l
	FZVll3KhuYkAQ4lp0j3ZSV4ckHCfBQ8qEeBmGLsN/DIqlTf8b+iU9V/AaZctC8GQumIUgIJAGm5
	Tmu5rl5PUqcD4q/4d+3WTYDmsK2ZZsvB59tocIVVnBQ+iIzdNwAdl74ZAlyaHyPQ0l/FUYYjFzi
	Is3Y/qxmt1dh1e0OB7suC1vwEDFrFPqvpRrZ/vOhOlO9KWbXCMgE7d+9sqFFQC8/qO5kjVf57rE
	ekEmtxPH5w2VVEZA2lfPtAac0WQIiTw7x2npic9koufC3mkaYw+xT0/uiDqsAkW4dlrXoU3/BVq
	H9Q==
X-Received: by 2002:a17:902:ebca:b0:24b:15b3:223d with SMTP id d9443c01a7336-2516e4afbb7mr77564485ad.16.1757268859241;
        Sun, 07 Sep 2025 11:14:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGG+UNmMjk66/DHR5BZpjwkre26K4bock2ih9UrjjrcOP8jRkmrHlvdcCEFIq8xuAbsJqi3xg==
X-Received: by 2002:a17:902:ebca:b0:24b:15b3:223d with SMTP id d9443c01a7336-2516e4afbb7mr77564175ad.16.1757268858705;
        Sun, 07 Sep 2025 11:14:18 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24cde5b6484sm84074765ad.19.2025.09.07.11.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 11:14:18 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v5 0/2] usb: dwc3: Modify role-switching QC drd usb controllers
Date: Sun,  7 Sep 2025 23:44:10 +0530
Message-Id: <20250907181412.2174616-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: u5rm4Qh2PNPSNjDydc_RCdyQ7WuA19vK
X-Proofpoint-GUID: u5rm4Qh2PNPSNjDydc_RCdyQ7WuA19vK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX22glPKq89Mtd
 giVlPyoICOaWhaAtBDIKgqgnsdD4PvktBx1suRIHJrQ4/aF+cPLTZTgds/+XzRCsWGvboQJoIXP
 PBJKXMbyqTYSf4H8CmxzhnoWLeu04bD3wiZJms7vYIUb9lltYDu+KGqw2/8+Xjqq9dEFW07r9ug
 tyqXYeXfvozbnCF4w+jG4MzCvZUbI/AruKFJybl8vEpAJ6t8BI5Oo52wuDXMgY49cwktuH+ylXl
 mvcKOzfzqg+/BAeTcPDBcF5oYJrNc0nywhoWx/einQX0vDx2hT3tAErtong/OUrdTTBDXyAYJNQ
 jIfT8OsYmd45TkrVk+BRbHrn+YDlv1IY11AtWSLtbR7/fxeg+KIjcvzMzkwAvqCf252sT9+r0w4
 TtOdadss
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68bdcb7c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=aun3V7K2MoTQ9LCyWAoA:9 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-07_07,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018

Currently on QC targets, the conndone/disconnect events in device mode are
generated by controller when software writes to QSCRATCH registers in qcom
glue layer rather than the vbus line being routed to dwc3 core IP for it
to recognize and generate these events. We need to set UTMI_OTG_VBUS_VALID
bit of QSCRATCH_HS_PHY_CTRL register to generate a connection done event
and clear it to generate a disconnect event during cable removal or mode
switch is done

When the disconnect is not generated upon cable removal, the "connected"
flag of dwc3 is left marked as "true" and it blocks suspend routines and
for that to happen upon cable removal, the cable disconnect notification
from usb_role_switch to DWC3 core driver needs to reach DWC3 Qualcomm glue
driver for it generate the event.

Currently, the way DWC3 core and Qualcomm glue driver is designed, there
is no mechanism through which the DWC3 core can notify the Qualcomm glue
layer of any role changes which it receives from usb_role_switch. To
register these glue callbacks at probe time, for enabling core to notify
glue layer, the legacy Qualcomm driver has no way to find out when the
child driver probe was successful since it does not check for the same
during of_platform_populate.

For flattened implementation of the glue driver, register callbacks for
core to invoke and notify glue layer of role switch notifications.

Set-Role and Run_stop notifier callbacks have been added to inform glue
of changes in role and any modifications UDC might be performing on the
controller. These callbacks allow us to modify qscratch accordingly and
generate disconnect/connect events to facilitate suspend entry and proper
enumeration.

The series only allows autosuspend to be used but still relies on user
enabling it from userspace (echo auto > a600000.usb/power/control).

Functionality checked:
1. Enumeration in device mode:
After creating symlinks to ffs.adb and writing to UDC node, ADB is up and
working in a stable way.

2. When none is written to UDC, device enters suspend.

3. When cable is removed, cable disconnect notification comes and when
qscratch registers are cleared properly, it is generating disconnect event

4. Device enters suspend upon removing cable (host and device mode).

This series has been tested on SM8450 QRD.
The previous version [1] had one extra patch to enable autosuspend for
host mode, but it is removed in this version. The two patches in this
version are independent of the third patch. Since the third patch has
review pending, sending the ACKed first two patches in v5 to get them
merged.

[1]: https://lore.kernel.org/all/20250812055542.1588528-1-krishna.kurapati@oss.qualcomm.com/

This series applies cleanly on top of usb-next and usb-testing branches.

Changes in v5:
Removed autosuspend functionality for host mode. Will send it separately.

Link to v4: https://lore.kernel.org/all/20250812055542.1588528-1-krishna.kurapati@oss.qualcomm.com/

Changes in v4:
Fixed function names in comments in core.h (Thinh).
Fixed nitpicks in dwc3-qcom mentioned by Konrad.

Link to v3:
https://lore.kernel.org/all/20250806095828.1582917-1-krishna.kurapati@oss.qualcomm.com/

Changes in v3:
Removal of extcon functionality has been moved out of this series.
Addressed coding style comments from Thinh.
Instead of adding notifier and enabling autosuspend for xhci, it has been
done in xhci-plat.c

Link to v2:
https://lore.kernel.org/all/20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com/

Changes in v2:
Rebased on top of usb-next.
Removed glue's extcon handling and made use of in-core handling.

Link to v1:
https://lore.kernel.org/all/20231017131851.8299-1-quic_kriskura@quicinc.com/

Krishna Kurapati (2):
  usb: dwc3: core: Introduce glue callbacks for flattened
    implementations
  usb: dwc3: qcom: Implement glue callbacks to facilitate runtime
    suspend

 drivers/usb/dwc3/core.c      |  1 +
 drivers/usb/dwc3/core.h      | 26 ++++++++++++
 drivers/usb/dwc3/drd.c       |  1 +
 drivers/usb/dwc3/dwc3-qcom.c | 78 +++++++++++++++++++++++++++++++-----
 drivers/usb/dwc3/gadget.c    |  1 +
 5 files changed, 97 insertions(+), 10 deletions(-)

-- 
2.34.1


