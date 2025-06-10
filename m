Return-Path: <linux-usb+bounces-24638-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F6DAD3183
	for <lists+linux-usb@lfdr.de>; Tue, 10 Jun 2025 11:16:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 00F2F7A9704
	for <lists+linux-usb@lfdr.de>; Tue, 10 Jun 2025 09:14:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F8AB28C004;
	Tue, 10 Jun 2025 09:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ps98xiqz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E04528B4F4
	for <linux-usb@vger.kernel.org>; Tue, 10 Jun 2025 09:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749546850; cv=none; b=ly2sxO2hhTJaPLqpmpn9xOKm0NGrPiXZfzYiJ+MwUpnft93q3ulm4+2NCrWB9XcrR8wuM6eTdKDwFzGvQ1o8NU//x8+w+K8K7/DWrwcD0Sf7tJZcmnVwtOSumItf7cJG4tZwLZoYS+ZGSqnxsZ4KyMq06d0NduKVLhMapC2Vcww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749546850; c=relaxed/simple;
	bh=qjl+BYDY6gqONCG2e6oCdswdZQgu3xt+TuVVxWOEvy8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cqDo3jBplnets0AE35fDFMr7Ntau/Q5y+Y0eQI0t8QKQES4nxsVpBW91wQvrGy5Zd9ciDFXDirL55HNY7JbtSogdlQQ9u15mhYEuRAYnERkLPjM6/WiYnL35JCPWFIMxlZBfeOqouctXYF0dAaUUVdN6zkJwlAw88vqMxjMSqKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ps98xiqz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A99fiU016123
	for <linux-usb@vger.kernel.org>; Tue, 10 Jun 2025 09:14:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=zVRDOyB5Ai4LipPm1xDU5BTQ38yaVzybSDw
	R5qGwP5k=; b=Ps98xiqzeK876EtM8Y5oCTnE1TDQv2X0/+ZEteuUCrTWhbZT3lj
	m5Vn0Xt7RqCz4QBOmScq38PIq33/1KFbLPXmFlaE1hvCWEFaMuoLszFtLaCsz7Tg
	qL1O0Agfjz21/eSZydOfOHdUWt1sVVRd6FwwlK6EicMiqxIVUzfTTssrgjDAQQN/
	Bgh/okwq5CeJQ+/7LwMSoIC3cGAIhwPivKq/tjlbFNiHGOlyOiHHSL8FpZjiwEfs
	uYbw0j2zxe1AclzlSfj254BOoedtDJn7/mZSNClWvDO8FAHNhLguXhRWkRiZ8naH
	Lpd0JoJDt4x2RJWPiX7tPXz1zQ1kzmOZPog==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4762tg26tv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 10 Jun 2025 09:14:06 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-31215090074so7286678a91.0
        for <linux-usb@vger.kernel.org>; Tue, 10 Jun 2025 02:14:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749546845; x=1750151645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zVRDOyB5Ai4LipPm1xDU5BTQ38yaVzybSDwR5qGwP5k=;
        b=omqilQCBu1XlOnhA3QJW+y9K3JVltXpVUSb2y4hCI9H1F3XIKKn++zdshhmoTIukFx
         6aOkoQU316VzopVfneYRFHi3/KiiB1G10zYO0la88YwIn7Aw3XT8NZFcjwj2eZboSpat
         X3iwIaML7BPBKc14yiaj63saMV9yX5TFaKOdUy5WFDWVSUDYo5sm/jGw7Quo10xSaEd9
         00RXIaDMPCoDZAy6DUNZgoU/660cKC55VqycITypH9DDDOMO0gXOekdiazwvUl2tIF2h
         lmHURi9zvIrP7UDPO5uKD+NsiehXxZvEXlDuT0Y4iUFILBIcflSU5YtWNqyAdKx6aRrg
         OUqA==
X-Forwarded-Encrypted: i=1; AJvYcCV5DYWOsn3JOXyWqz1E4K5R7fUQdnr1gqfZaqhhyuqh8i1idcy5cWzIWVV/iL+zogdKgjzWuJpwoIk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyatyRmYmWdYQjL6Gex1br2hyvh4LbEfqt0s0TggwpFboKthwMJ
	v7KqiaeokNHGDMHRvnMS0qZ5+3GOxc04q64NmcB3rbgBbUDFtgg70d1c2ZpIZkYUv3YXGh7HWdN
	tM0X/t0p1Xmy1sDdUahS0ZKQjf78EDGyvYXfduloBYkzfdN1iz6euOL6T9L9J7GI=
X-Gm-Gg: ASbGncuHhHK+j5Jj31DLnxkr03kKGif3EqWND9EnzKVaDarUeCnZJzL9AA6Y0AuGGZU
	0Xi9Nco6laKMvERJ3JC1AIokk5qsTC19OB4TjXSu0wa1FT1Bg+Yr/aTh3NniqnIakswE9WO0a7/
	YLdROh9twPBeY9a/RQSmlEfYpui4LZl7MR8uiA2m7zAzLbWfMZolYmmK1M9pYIgSwRrnFdnTZrX
	VYmM/xBZj/CaCLi21HdKDabd+j6hCg1lPEQUtJ0TyclY68bDO0vAz7Xg5XgkXYh78RSnIjaIvIi
	VXWv7YokfPCVoWGrEYzmQD2PkppJjT0Bg7PoGMv6QQHD75sebm8QtrzgQRNW
X-Received: by 2002:a17:90b:540f:b0:312:e731:5a66 with SMTP id 98e67ed59e1d1-313472d087amr22039082a91.3.1749546844720;
        Tue, 10 Jun 2025 02:14:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPKE5ddYGSWWPaXAav9AjL6ipYIcKD3xVvTVVDcFAX1zelPwmcZkWoBf/P1DKT4eS5Q+LQJg==
X-Received: by 2002:a17:90b:540f:b0:312:e731:5a66 with SMTP id 98e67ed59e1d1-313472d087amr22039051a91.3.1749546844299;
        Tue, 10 Jun 2025 02:14:04 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31349fc3e72sm6913550a91.31.2025.06.10.02.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 02:14:04 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v2 0/4] usb: dwc3: Modify role-switching QC drd usb controllers
Date: Tue, 10 Jun 2025 14:43:53 +0530
Message-Id: <20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OqZPyz/t c=1 sm=1 tr=0 ts=6847f75e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=2JYEZmQa42-x6bohhNwA:9
 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA3MCBTYWx0ZWRfX9CRSEax80JIn
 8sNcDHjBgBVw8QQPcyFi8N60x42DPGbdELofiAiL8GTRXo480b7vnFvOhN7M4ojHAJ8bIvI9KMq
 VVa0rVo19mPLAlK9UsRvujlAdDtO9BWqN/hWXAhFWLIOobtDQO5nTUhaSlD2vOW0ysOQ5M4Ki13
 UVxcjz6bCt5Di2NCOfM6dijIkFtvEbilZ0HrPaDHfzq85fB/k8i/iDXqnUdIVz53ZV4VylO/LRg
 J1xsOZRmUFXm4vRjR7BONLqU9aLfeUSIV/FT9NYd3wTqHb25BbMR+7puIBPOP9DJTM9Juu1EiUu
 NyNl7VfGTKOydqG/rom04aJjqMIUevHyrxzBfcGbiF2pqv3rysydk+RTlfu9ysHBD5JdZXmRBLR
 vJP74fM5rLMcdHhZnRaO2e8xmCE8MnSnmJ41GZWw5vX8veXAWpNtjOVmiy8NAII2Mj1bK+cI
X-Proofpoint-ORIG-GUID: TOUf7EmqrkqS7ayIL0NIzeiU8nRTUEtF
X-Proofpoint-GUID: TOUf7EmqrkqS7ayIL0NIzeiU8nRTUEtF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_03,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100070

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

While at it, remove glue's extcon handling. Let the DTs being flattened use
role-switch/typec frameworks instead of extcon. DTs using "linux,extcon-usb-
gpio" can use "usb-conn-gpio" if they are having USB-B connectors. If they
are using Type-c like in case of msm8996-xiaomi-common.dtsi which gets
extcon informtation from TI based typec control chip, while flattening the
DT, role switch mechanism needs to be used instead of extcon.

This series has been tested on SM8450 QRD.
There will be a separate patch sent for flattening usb dt node.

changes in v2:
Rebased on top of usb-next.
Removed glue's extcon handling and made use of in-core handling.

Link to v1:
https://lore.kernel.org/all/20231017131851.8299-1-quic_kriskura@quicinc.com/

Krishna Kurapati (4):
  usb: dwc3: core: Introduce glue callbacks for flattened
    implementations
  usb: dwc3: qcom: Implement glue callbacks to facilitate runtime
    suspend
  usb: dwc3: qcom: Facilitate autosuspend during host mode
  usb: dwc3: qcom: Remove extcon functionality from glue

 drivers/usb/dwc3/core.c      |   1 +
 drivers/usb/dwc3/core.h      |  26 +++++
 drivers/usb/dwc3/drd.c       |   1 +
 drivers/usb/dwc3/dwc3-qcom.c | 219 +++++++++++++++++++----------------
 drivers/usb/dwc3/gadget.c    |   1 +
 5 files changed, 150 insertions(+), 98 deletions(-)

-- 
2.34.1


