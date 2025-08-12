Return-Path: <linux-usb+bounces-26736-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD97B21DB3
	for <lists+linux-usb@lfdr.de>; Tue, 12 Aug 2025 07:57:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92458189D3F8
	for <lists+linux-usb@lfdr.de>; Tue, 12 Aug 2025 05:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEA572D46B3;
	Tue, 12 Aug 2025 05:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZB6D01sr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E441A9F9A
	for <linux-usb@vger.kernel.org>; Tue, 12 Aug 2025 05:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754978153; cv=none; b=TZimogZho/fmfspgz+OFduFS9fH9kCbhBGf/lDHwD7E7Ty80Ap4bXuhdotuE+U7lSHAMkPrGNumpJfG0YGWGLynzzH75vueIk0Dvll+HHeg6qNf3gwkNhD6sK/Zl1qmkIF3skwnaZ+6PJkXuAJ0+lMpc1C4AzsseLDKVj0ikySo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754978153; c=relaxed/simple;
	bh=Yheg6I/35trUnbBJ7j7xz3R2vgSRMnN5w+YUila8Cio=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kNBzdqRaWytg1lcJBH7V1oPkKGhroLy9VHwx9vYZgNwyXrnpypTrm+JfPLofjrr3vjDFz27+FhN+eUqxgyesw0gvtyohN9b14UUjUgEIfBALsscT37NMgQ30Y/SQUwqVMMOBOn+FTSW9V9GPPt2Nr+CpFaNIWi9dF9vltVKyJ84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZB6D01sr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C5WoQ3029132
	for <linux-usb@vger.kernel.org>; Tue, 12 Aug 2025 05:55:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=X8/t48amNz5Y5I/LII5CBlUVRP7E7iiuvo0
	c7s+eEcY=; b=ZB6D01srLVAiYNQdFPxS5AKmdaB3rb0ndb2HlbcJBKIEnDoOYdC
	sXfaVu6jG0vbu0q9/nAR43NFAR8+aF8Gqv3Zt3mWykn98NAgYoZNMWNTvNhXrnBG
	belTArDI5JxESrKVmmrOJNNwdcMIH7fxzW+IkhEJpSJKlblcfqsLBKMZebPUrN7D
	hnhKUAsEaj9siwcja1Qm5ECOcNAc3cw2u8uq79ml+5V1fjv81jYQFU/Y+vuDV62i
	BZP6HkroBjwsKlft1o7kkDBZmxxD8zeH/SfWoXullnxqtSZ13wES2PBXdLy2F1Qw
	Ef1wirHyGRU2eLJTGr95M4Sw0LGsZzQUEYQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9sq4w8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 12 Aug 2025 05:55:50 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2425364e0b2so59322415ad.1
        for <linux-usb@vger.kernel.org>; Mon, 11 Aug 2025 22:55:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754978150; x=1755582950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X8/t48amNz5Y5I/LII5CBlUVRP7E7iiuvo0c7s+eEcY=;
        b=ehlVZErxu6U81008MCjmszEtpt/txNZGtkOmKgjTdjqtYfYpWoj/pH7mhgG3LlkI89
         kDSahKwNg88xphMxW53ep91rRR50oQh1y72iBke3uozdhAGoR3+KRQMkWH39bPVvqM0/
         8uvPcn6DpnTCQPAL/Ex1UEKzKQOfqkOc46CiJpP5ap+K2EdiJnT77bVMYw64ieug9swd
         IYja/ZcbU14byUcscrIMm3uBekIA9gVnQ2vheEr1COvyEAZ+hRkcDiyFbl5PQruRqGQz
         5gB+5Ho+a+MqqY05ho0CCW3aeeWK/oRaUk2x/gPpgH6oMwAkKhmMTD9wz6U62OOdfLnr
         JIlg==
X-Forwarded-Encrypted: i=1; AJvYcCUx/2rU/3GbbJsNRJPZtJjfvvvKfFZsau4CIEgjMHfEcm+RPazs/sxOfdm0ZjdLrD7pujiNToc7ZC4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxV3mqC3aPhv1zFnEsgITdjvyBiCbm3dcte7Cghu8zZgIvSlZ1x
	YzML7+El138IOWdXl8gdzrxmGhbllWBYFV90aL/5jUCJry9rHaegfXq/O2EVuolM8eGY/kE5nXL
	MxznpGTYI0f6vtZSEwLvDR+zy3PhLsy+nEZHVSwuPrel39y1l4j2A+XbC5zgrfHU=
X-Gm-Gg: ASbGncsRpf9hsWUnwJ5ixD2R0PFXj6eMtZO/G/shDkGTBby37XD49G0adJu5Nd8HKoa
	cf309+rlVPJXFMvJ40pCMIua2gciGSa8ZRmLW6frG0gklADPhDqS6rQoBfG6x2ggBNil5Do6yid
	Jiu8oKt/h6aBHKjtZXbSD/fxbJz77JlE/qe5M/daLEgJ3h1kMSQA6MNGjHSLovHyvJVfZK8LwOa
	hOT+UL8WyPGWsZbaCOmIcPoJq6YapKZs8iIatcF9kx7lySVaKPmtxb18vwQxCfMSuNtIDS/mnDj
	wNuvJ5sjKqsFywc7RUinkx9D0HFMe2iaigFtZTPDnXQnWQ7qgjM1TarShZEWyWP6ofbmDqz6DCA
	qkw==
X-Received: by 2002:a17:903:2a8b:b0:240:6fc0:342c with SMTP id d9443c01a7336-242fc29a26emr32028545ad.11.1754978149335;
        Mon, 11 Aug 2025 22:55:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlUsjaJb8koPD5Sg2TIon9Iy4UMzUrz2urZj0cwHINo1bgRLZQnc8zXMRb0Mzkr00lh7hzWw==
X-Received: by 2002:a17:903:2a8b:b0:240:6fc0:342c with SMTP id d9443c01a7336-242fc29a26emr32028265ad.11.1754978148847;
        Mon, 11 Aug 2025 22:55:48 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1f0e585sm288585985ad.40.2025.08.11.22.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 22:55:48 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v4 0/3] usb: dwc3: Modify role-switching QC drd usb controllers
Date: Tue, 12 Aug 2025 11:25:39 +0530
Message-Id: <20250812055542.1588528-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=689ad766 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=aun3V7K2MoTQ9LCyWAoA:9 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: nplrAD17NHDw01y3MXcNLjjZ7nQRQQ6F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfX4YGxO1fEdeOD
 mV5XGeTFgbYm9ARygjKT16kIdGNpuNIwW+2FAxZp+1ymOa1fubCwgclFKxdZUwXaV7VmKy1IXhS
 SEcTXwJfxsQaepFBVaSKy3RZRUKmFAchFC3q5YBhuznxm2J7gZpyzFmelTmbFXjeSYwyDvLecim
 n1di6dsJ4jBGlVNXRWo9pbbidJK7l+sAXmcCGV8Qn213iyAXYgxQLuq6jR3P19ao4SJ5PAhxCtX
 9dzl11AdHlqAt7LgyhPqU/4Tn+y3RcK9m0pP7B6JBnvozY5vrtsAyYgTig2vw/gVNFKC6vsrSxK
 asnWeIhSqP+gECTObdZxAK47jUXRYC8QctsXLV2F5C9itYiJgmev3KB8aDQgknVxSLd9cxxdfuu
 wkP4iQuH
X-Proofpoint-GUID: nplrAD17NHDw01y3MXcNLjjZ7nQRQQ6F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015

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

Tests done:
1. Enumeration in device mode:
After creating symlinks to ffs.adb and writing to UDC node, ADB is up and
working in a stable way.

2. When none is written to UDC, device enters suspend.

3. When cable is removed, cable disconnect notification comes and when
qscratch registers are cleared properly, it is generating disconnect event

4. Device enters suspend upon removing cable (host and device mode).

5. In host mode, when autosuspend is enabled from userspace for controller,
xhci, roothubs and connected peripheral, the controller
enters runtime suspend.

6. Upon removing cable in host mode, setmode brings back usb to device
mode (which is default setting), it enters suspend as cable is still
disconnected.

7. When in host mode, if we enter runtime suspend with wakeup enabled,
clicking on buttons of headset are resuming the controller.

This series has been tested on SM8450 QRD.
This series depends on removal of extcon functionality [1].

[1]: https://lore.kernel.org/all/20250729092708.3628187-1-krishna.kurapati@oss.qualcomm.com/

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


Krishna Kurapati (3):
  usb: dwc3: core: Introduce glue callbacks for flattened
    implementations
  usb: dwc3: qcom: Implement glue callbacks to facilitate runtime
    suspend
  usb: xhci: plat: Facilitate using autosuspend for xhci plat devices

 drivers/usb/dwc3/core.c      |  1 +
 drivers/usb/dwc3/core.h      | 26 ++++++++++++
 drivers/usb/dwc3/drd.c       |  1 +
 drivers/usb/dwc3/dwc3-qcom.c | 78 +++++++++++++++++++++++++++++++-----
 drivers/usb/dwc3/gadget.c    |  1 +
 drivers/usb/host/xhci-plat.c |  1 +
 6 files changed, 98 insertions(+), 10 deletions(-)

-- 
2.34.1


