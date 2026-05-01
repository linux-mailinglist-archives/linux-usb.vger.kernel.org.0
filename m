Return-Path: <linux-usb+bounces-36822-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHaLD7Hd9Gn0FQIAu9opvQ
	(envelope-from <linux-usb+bounces-36822-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 01 May 2026 19:06:57 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2807C4AE4E5
	for <lists+linux-usb@lfdr.de>; Fri, 01 May 2026 19:06:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B66DB300679E
	for <lists+linux-usb@lfdr.de>; Fri,  1 May 2026 17:06:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB2B341B36F;
	Fri,  1 May 2026 17:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oJ5WCHOM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KhTR9lsP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5813CCFB6
	for <linux-usb@vger.kernel.org>; Fri,  1 May 2026 17:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777655202; cv=none; b=lWwPYhKlyMxj2VNypx6tnMAzf5x2uHTLPGz9or3IEPS8hY/gQ2tQ0K5JhyH0AHXXIHHAbCqnC48i+SumJDpf7csE9BGIDWqS8DcFlk7ySmvLKCt4SAJqZyQ96E9wBLafk2NtmWi2sXyTw/s5JSINcKJds++7eCA5cmO8Oxu623o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777655202; c=relaxed/simple;
	bh=um2Fwsw6rvf7kRd8oo8QyYOwgm+AurrV4ZG+qMUluyc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Dq18yK25NivMr/eM81Y2dTgmr7DLb7UH1Z2JhjBBa4h20s3vIgkBrw1GO7IxgMOjliCMwLtS0yAKsUe0eityzDu+gHdL4ew0YDoB8YKWUEdDv1pZ4Gp1xDF4EDhg/ylLYFOg6d5OPL/v4LRrSN4Ed6X5sYGwvB8rXW9eBSyY54I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oJ5WCHOM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KhTR9lsP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 641GLsvq2661759
	for <linux-usb@vger.kernel.org>; Fri, 1 May 2026 17:06:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=X6aSb18fufpWwdWm48PtfA
	AcEMvP6VgTU96OpcmHLrQ=; b=oJ5WCHOM29Rmtf+aB74L+wEu99OdEW+HicbFOH
	9/7waJ029DZW93x7C8X0AMcYMYoPZkc+/nhjZhPdcxIF8eTZdQtzs3+ulK20NHI6
	6SMhs5+OfG0bH7WzijtKDNnXX0zZ/uVXISuZGqgYCBq0saiQAMqHMgx8Ta0xBhBP
	uYA+n2ijugisdvQPH1pFh9vrDEJadhs+WwojyhK4pmy5ZV2Z/s29O/XwIGk+Sq4N
	sf8NeH50AMl9edGPSFRNd50gLql1rY/3yeMjnxaDK+2Fcj78IEo6WQBpdJnFZt+A
	IaSJrohr7dZ6dN4/7ABClZPnQxCWi8o2fZYl7uWcZ/JYCggQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dvhbtj97w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 01 May 2026 17:06:38 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2ee5b73c5f2so1420942eec.0
        for <linux-usb@vger.kernel.org>; Fri, 01 May 2026 10:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777655197; x=1778259997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X6aSb18fufpWwdWm48PtfAAcEMvP6VgTU96OpcmHLrQ=;
        b=KhTR9lsPNNcZ9UvzqgPff9RspypPHWDyQ7JzllV887Kw/6Op54M20odp0czlSRjwa4
         +ZsejCC8HW7MuhZaTBLfj7vmwmor5N/DNEhSR4t/lok2R5PFPkptm8MUCeFx/PUHsgc8
         60Sjf58fGAN54EA3i8xPkzBlhp2/mozTXG6aXApNnA2D6wnqRWCbsVshW0BwbI1P8/US
         HD6uaH5aL6wno98X0cthHDJ0jilVBoagw9G6MJscDkIAAeH8gKfv0dAblPZimruaBe2E
         ftbFKfj8MzK5jt6tFD7LqC0OXKCFtkV6GzZaSOOZXUwo5JKXokf/7/2oNQpg+f7lxJFd
         C5mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777655197; x=1778259997;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X6aSb18fufpWwdWm48PtfAAcEMvP6VgTU96OpcmHLrQ=;
        b=ZQttQarODS76oO4lxevoOxp5AhJWa95zDPjGPkQasR3GXUSk3oheWX1zxkwZVaCRU7
         VTCSUHqLaY2oIpgRbOVqwXJv/9S5Jp0Ipa9h7aaLcPV6O+ZBjIkWQdx/a49MOxYNA+RH
         W4iYT1jxtIS9WPfEbis3DnSDmYHXLf3KYAGGULS4SrLYbkOOJ5C3Egxt3aeV6B2eH06X
         E+706R1AWmVQt4PprK3ErKfaMjFP73HOlwksDOJx0LmxE1JH48FO15joK3FFVoLjnKmf
         7QNOIHR6uieXbSrjvWsLmMOh1Eza5axJslTIvpmcyMC0I/kmPQe5ixakjTBLL+hN3Kqt
         bmRw==
X-Forwarded-Encrypted: i=1; AFNElJ8uN2MptHj23bwN7TZUzvzbP/icft+WV4VstMuY/2pY2qS1ISrnGMeR0silXic1TiZuOVK4WFSsp6I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyriFmVAzQx1xixKFELZrXrCy+V9fbGRB8VBoWCzanDzg27QCVS
	KxBj9nBFknOmWkplXGEebyjDq5pVa+YcDiGVmyx66iyBrcyj/gtrJjQcShXZa5iQ4EwDOW832YZ
	i4oJ9Lg8Q2DJxeYKif51me7Cq7AQnb5r1X+Fgp0NaAjH+dW4ndkcKYCDWIzrI7OA=
X-Gm-Gg: AeBDietJETDGGB7taR+HYcbzlm3qz9zfT+ytLUNpHiOY6I/JwJjzjLbZHQ74FEDX8YG
	lEAOiPSxBp4RJC2U1MI/ylMJkWsToxbgDMSeeJb/d9+VvVVp9p8ahlym2Fd5p1SMjxyBbR82DRV
	E4/S7ITDHThqNek2WEiNrZiVQL/mzFmPM7HhyhbOES8tIolDyc8Dnnp8G3db6u2TzYQk/HquQmj
	QZbs6UJeA4sNA1OAdLuTQHAWt8AFBZ3dH4R2hngKEGsWLM/XRoV50fAA4fiSv8hQ2+Rx8wBXrLw
	6TQnTBRpqbcQdrWkbvCk44sml+NBnjUu2lso0SSw+jupO5wB5w/2qvdUAYcmtkSgG0JAbHKN9sx
	ijMaJiuY45Q0VgG/eM0dV8NtlgTV1JD3T0huZApNO6im9OyknP2UkkkM1wlbbCmcWIA9hka6NKX
	DyWhj1gE7Q0Q==
X-Received: by 2002:a05:7301:d8f:b0:2ed:e15:c926 with SMTP id 5a478bee46e88-2efbb96db14mr84752eec.34.1777655197411;
        Fri, 01 May 2026 10:06:37 -0700 (PDT)
X-Received: by 2002:a05:7301:d8f:b0:2ed:e15:c926 with SMTP id 5a478bee46e88-2efbb96db14mr84721eec.34.1777655196683;
        Fri, 01 May 2026 10:06:36 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3537d300sm6655978eec.0.2026.05.01.10.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 10:06:36 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/9] Improve Qualcomm EUD driver and platform support
Date: Fri,  1 May 2026 10:06:26 -0700
Message-Id: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cP7QdFeN c=1 sm=1 tr=0 ts=69f4dd9e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=Yfec-YhPFyhUVWsMdDIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: lE3_eUXw16t1dhcF1CE9NGcl175N3Fvx
X-Proofpoint-GUID: lE3_eUXw16t1dhcF1CE9NGcl175N3Fvx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAxMDE2OCBTYWx0ZWRfXwHkqmphbenGk
 EscgIaNFDt3ObW5WK1KLmqITmMVkcfxnCxuIjsh21h210B59DvEMNh9EGIo6sjytKFHEsD4aqb+
 2FXB17XOS4t4jbKiqBhYqpOBykL6Xy2SKnCUIpWesG7Xrj4PjOI307zGNHKqYAscD4zR9Qew8H6
 /0wvKtQjI4rh3ZiCt9rEZ5uST5KXBE8EKl6ADBJJcqtgyX5qDlvbxBbx2iczJ5i/u92OvK28dHu
 pT7OiFw/iQTnptWqYafPxczRJoiC8Dhy7dUHuBAT25yEsEKP5K9XIwNTCJNLNZnvfQ7xcLU5wsD
 bFFeU9K8vN0jvfpPI8KiUi5yKfbsia+sOmVpwOWe8unexQgdf8VyHRAUx8rmzfKtBoZuTUaDWjh
 x94VMK32oxcP+7QxPt2RG5B/G5tCxpNPvW6TSJIgiT2YJIKu3PIQrZblYOhfvH9RIv5xb2qWSiS
 HcaCbqAMRWZ8i5EwPQw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-01_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 bulkscore=0 malwarescore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605010168
X-Rspamd-Queue-Id: 2807C4AE4E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-36822-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.2:email,0.0.0.3:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:url,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elson.serrao@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Note: This v4 revision introduces a design change compared to v3.
Based on discussion and feedback, the binding adopts a child-node-based
model while preserving the legacy top-level 'ports' property. The
child-node approach is required because EUD needs a separate OF graph
per UTMI path to accurately describe per-path role switching.

Link to the discussion leading to this decision:
https://lore.kernel.org/all/20260324172916.804229-1-elson.serrao@oss.qualcomm.com/

---

The Embedded USB Debugger (EUD) is a High-Speed USB on-chip hub that
provides debug and trace capabilities on Qualcomm platforms. The current
EUD driver, however, lacks essential hardware resources such as PHY
references and support for multi-port configurations. This series
addresses those gaps and introduces the necessary device tree updates
to enable testing and validation of the enhanced functionality.

Below is a high-level block diagram showing the EUD and its connections.


			              EUD Block
 	                   +------------------------------+  
			   |                              |
[Conn-0]-->[USB2PHY-0]---->|-------- Path 0 --------------|-->[USBCtrl-0]
			   |                              |  
[Conn-1]-->[USB2PHY-1]---->|-------- Path 1 --------------|-->[USBCtrl-1]
			   |                              |
			   |      +------------------+    |
			   |      |  EUD Debug Hub   |    |
			   |      +------------------+    |
			   +------------------------------+

This work builds upon an earlier EUD driver submission:
https://lore.kernel.org/all/20240730222439.3469-1-quic_eserrao@quicinc.com/
and extends it with support for multi-port use cases and proper handling
of EUD operation across different USB roles.

The series has been validated on the Qualcomm Dragonwing Q6 platform
(RB3 Gen2 board), confirming successful OpenOCD connectivity to the EUD
interface. For detailed usage instructions, refer to Qualcomm’s Linux
kernel debugging guide:
https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-12/debugging_linux_kernel.html#debug-using-openocd

---
Changes in v4:
- [Patch 0001] Restructure the flattened ports representation to a child-node
  based model.
  - Preserve the top-level 'ports' property and add per-path child nodes,
    so that each role-switch path is described using its own OF graph.
    (Dmitry).
  - Link to the discussion leading to this design decision:
    https://lore.kernel.org/all/20260324172916.804229-1-elson.serrao@oss.qualcomm.com/
- [Patch 0002] Use explicit port names when selecting the active EUD
  port (Greg)
- [Patch 0003] Use a scoped iterator when looping over child nodes and
  drop redundant EUD path validation checks (Konrad). Preserve support
  for the legacy top-level ports description.
- [Patch 0004] Register role switch per path and forward the role switch
  notifications to the USB controller.
- [Patch 0006]  Add host mode co-ordination based on the role changes as
  per the new design and drop the custom API that was used to get role
  notifications.
- [Patch 0008] Described the UTMI path as a child node with role switch
  capability.
- Link to v3: https://lore.kernel.org/all/20260309203337.803986-1-elson.serrao@oss.qualcomm.com/

Changes in RFC v3:
- Replaced the per-path (eud-path@N) model with a flattened ports
  representation based on the feedback.
- Added port@2 and port@3 to support dual-port configurations.
- Removed the EUD-local 'phys' and 'usb-role-switch' properties since PHY
  and role-switch information is obtained from walking the OF graph.
- Updated PHY discovery logic by fetching the PHY from the controller
  node/fwnode, and exported a new API for the controller to report role
  changes. The dwc3-qcom driver now uses this API to notify EUD on role
  transitions.
- Updated the DTS structure by moving the EUD-to-controller port mapping
  into the base SoC DTSI, enabling EUD by default, and adjusting all board
  DTS files accordingly, including adding the usb-role-switch provider
  link on connector nodes.
- Link to v2: https://lore.kernel.org/all/20260126233830.2193816-1-elson.serrao@oss.qualcomm.com/

Changes in v2:
- Improved commit message of patch 0001 and 0003 with historical context
  on why EUD worked without PHY references on single-path systems.
  Expanded the usb-role-switch property description in the bindings file.
- Link to v1: https://lore.kernel.org/all/20260116232106.2234978-1-elson.serrao@oss.qualcomm.com/
---

Elson Serrao (9):
  dt-bindings: soc: qcom: eud: Add per-path child nodes for UTMI routing
  usb: misc: qcom_eud: add sysfs attribute for port selection
  usb: misc: qcom_eud: add per-path High-Speed PHY control
  usb: misc: qcom_eud: add per-path role switch support
  usb: misc: qcom_eud: improve enable_store API
  usb: misc: qcom_eud: add host mode coordination
  usb: misc: qcom_eud: fix virtual attach/detach event handling
  arm64: dts: qcom: kodiak: Describe EUD UTMI path using child node
  arm64: dts: qcom: Map USB connector to EUD on Kodiak boards

 Documentation/ABI/testing/sysfs-driver-eud    |  16 +
 .../bindings/soc/qcom/qcom,eud.yaml           |  55 ++-
 arch/arm64/boot/dts/qcom/kodiak.dtsi          |  35 +-
 .../boot/dts/qcom/qcm6490-fairphone-fp5.dts   |  10 +-
 .../dts/qcom/qcm6490-particle-tachyon.dts     |  10 +-
 .../boot/dts/qcom/qcm6490-shift-otter.dts     |  10 +-
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  |  10 +-
 .../dts/qcom/qcs6490-thundercomm-rubikpi3.dts |  10 +-
 .../boot/dts/qcom/sm7325-nothing-spacewar.dts |  10 +-
 drivers/usb/misc/qcom_eud.c                   | 346 ++++++++++++++++--
 10 files changed, 446 insertions(+), 66 deletions(-)

-- 
2.34.1


