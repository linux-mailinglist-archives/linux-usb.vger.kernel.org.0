Return-Path: <linux-usb+bounces-26529-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6083B1C3E9
	for <lists+linux-usb@lfdr.de>; Wed,  6 Aug 2025 11:58:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7619C18C0CEE
	for <lists+linux-usb@lfdr.de>; Wed,  6 Aug 2025 09:59:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4736728A410;
	Wed,  6 Aug 2025 09:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CvccFYj8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578CE21CC4E
	for <linux-usb@vger.kernel.org>; Wed,  6 Aug 2025 09:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754474321; cv=none; b=F9eWpx91n73PdhXnFsWmPnHUFvNSYspyJ37L9OcPCdwiluwgNT6OSZPbYmcPa4Y/oN8EZEsPNQjKnmC40Z7mG8jSiFEE034dFX6LQdUn6L96gc+mR1x8S1yPAT9q0AT0R2ShplaS9aN2FPYIdMG5Mb4HOD7xq4PaSWLlSfKdC6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754474321; c=relaxed/simple;
	bh=5MlaPY5JqsVfBvRmIGu781N70UBVX55YyNAVfYDOhI0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=h1yrGyR4eyFbJzT8GpEUuHqDKZOHH6k/JL/CqNbvKbwd1WbT23juEyzesQbXTu4MgIzI7sqcI3G8GyOBSLToJ2a/PUCB+XaRNxxO2Pl0wHgVqtoogiVTw842rXDVFe8iyMotYDioxaRvMv5fC2VqrK7Dls9BU5oYMrO2A0N3uhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CvccFYj8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5769ekQh032241
	for <linux-usb@vger.kernel.org>; Wed, 6 Aug 2025 09:58:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=mlyhGJrF296leOPuzvZ4VKCmY7SZH+3Eg9W
	zVsRykuw=; b=CvccFYj8nN19TLmiPdwEeqqJSyp3ucqOio4a2j80fePnrb1DU2I
	T0Cr2ABG13HASpqWwVRSPiXrFWAhIcfGlbBozIiodmMUgOY9cd/U0mjYZjP+MJna
	fHzyh+KHcle7g6bG5beiDK+DtWNCdtrxVyPKdIHjTgobCGjjFgwk9LUerNuR3vBo
	6e7Gp2Kj3tf/kLYvuvwpZrhX1jTPGyexF95t8RhA/hgiZwSiiXPTJYMJdWa8R0dR
	pPiQybVb5oZUrDTO1GH3o1CWIjnu7LNI8Owmx8XsgFD5Y8GdOXS62BD3iP8C+n7K
	WDbIDbNvQoZpZjKIQ+Y84iq7i+UIf7cKBfA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw2tc4q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 06 Aug 2025 09:58:39 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-76c0039e0f6so3391939b3a.2
        for <linux-usb@vger.kernel.org>; Wed, 06 Aug 2025 02:58:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754474318; x=1755079118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mlyhGJrF296leOPuzvZ4VKCmY7SZH+3Eg9WzVsRykuw=;
        b=N3iYDxJ6rPr9s5rsRa9afn3wY6LD6XWutqtyb40yHspf85BT5M6SNA70Ue6MUpIMpo
         Qmbc+Up8j/fCy4bPdmuVX7zkTpSAkhTuT+n3YAHej8UCslb3hdBEEt/JtQbS6Gz9AN3t
         XAUBLFVUjX+yu7fndCkDNE4FpaWPsPVOHL+ODkAuw4nDD3c7fHbOkKMfLG8OxInmEH7a
         UJGwRAdJFtmgX2Ua5AArKZvzv8d7r44H1BTarZHGaiG4I+psPNW8h9RkiL2csxTZkLWk
         VNI7sZwUFcjlCOpl9XYscBqRXDdYM2aSRm5fy/a3JrQxzxoOR2H65Ptc8yUerxNgRrMY
         M9YQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlG4MKxH7XIXlzXcX6W/9Evpi3c7JCIwMNRZrcymDv8DVlsa6VGjSKJpu5zSQ+n2I2xCrRt635LHA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo7XhRSLBkde7RzkWeTiN7Q2IxKrhKzRvHid3SZo0tp7W0xV2i
	kvWS+3XMEOSweEtnhrap75d0qhEbttXZepUg3a929vH5M0I2nFH+aP+QJ90Z60AzJir62cZPGi5
	TFV5daJohYjMzmhcf+h0UkjauvgVgPhZLx2ZuuVi/KfBeLaVpcNeAk16CjLaJjhQ=
X-Gm-Gg: ASbGnctzl7gSeuQMGrEBwlH2YZ4DZMuzJmA9+S+wnK0KZPOgLS0QVitJR5CTUHmm8wh
	G4XgqBTO94rAiNAZuvXR2oXHIbw6PHxxliccx2LLTlm3vLTPX/D6iVvkrbVbWsZXYT7rDA9K4+3
	DBF1NRnmO2tv7eY5wZApSVA6bTzFXO0+eUOpClB3mmWhaWyDbDsPDFgk8JvBlWv8JFgtXPp9bcf
	0P0kZoDCiBXQaeZFpxpI/AYqJ93eimbsuRivUYOG0HJ14PX2ISF0Up19tIaDAk5dQ9meL20i5OP
	lxY7oh8N0wBDXSlasDZ0OxKX9uJ47u+jXV1Xc61tEzgK0tTAkGpMyeQDUA1I7tYsuucY6bedPIl
	r8A==
X-Received: by 2002:a05:6a20:3946:b0:23d:54bd:92e6 with SMTP id adf61e73a8af0-24031407438mr4100069637.29.1754474317824;
        Wed, 06 Aug 2025 02:58:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEo8WUOevOV47Ap+Hsn78w2zaNclD09lWJ9LmarRGiBAcTJtDBqyBfYCadWJS0noTJ+lEKAnw==
X-Received: by 2002:a05:6a20:3946:b0:23d:54bd:92e6 with SMTP id adf61e73a8af0-24031407438mr4100031637.29.1754474317411;
        Wed, 06 Aug 2025 02:58:37 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422b7bb0c0sm12908799a12.20.2025.08.06.02.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 02:58:37 -0700 (PDT)
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
Subject: [PATCH v3 0/3] usb: dwc3: Modify role-switching QC drd usb controllers
Date: Wed,  6 Aug 2025 15:28:25 +0530
Message-Id: <20250806095828.1582917-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Vbz3PEp9 c=1 sm=1 tr=0 ts=6893274f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=8q3CujG2C9GLMZ2tu0UA:9 a=OpyuDcXvxspvyRM73sMx:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: GzA632LFnW2hUCiXNQdXj-E8b3swkJwc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOCBTYWx0ZWRfX/GqKtDWl0pDN
 a5H9AYHNrDMgIyUCTIUEaJ/RJtE+4r2WJ56gxj9H8dxwgRs2JQ45GHZ5gvyxTuXHiGcmlU5kCaj
 XYrCbqsbmWn1i+iSU1MRW2W+jRvMXzwTlWD6xcZjUl17KbFkGfUMtkHV//xyqpsoNkh6PPwcR9k
 YtkjLwN0KV/DeK/vcoqCcM98+uddDSZ0dEyjujmwmKp8D0zOMk1ongz9uvdda8q4pTJreZnHCbA
 Y7lrhBiFapMf+YkTxUmvRL41J/0Sw9EN0Ah0szOjxxuhWxPcXs2ze0c2NMSIoIZJnq+4Tb49/YB
 ZZrfhni6mzivr6RJ3PaWJIwQ2WhIPENC8u0VBtTJlmj2GiKEArwKYRnGarMAbTicSA2NvLmIV9n
 KADTvTOq
X-Proofpoint-GUID: GzA632LFnW2hUCiXNQdXj-E8b3swkJwc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_02,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060008

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
This series depends on removal of extcon functionality first [1].

[1]: https://lore.kernel.org/all/20250729092708.3628187-1-krishna.kurapati@oss.qualcomm.com/

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
 drivers/usb/dwc3/dwc3-qcom.c | 80 +++++++++++++++++++++++++++++++-----
 drivers/usb/dwc3/gadget.c    |  1 +
 drivers/usb/host/xhci-plat.c |  1 +
 6 files changed, 100 insertions(+), 10 deletions(-)

-- 
2.34.1


