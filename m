Return-Path: <linux-usb+bounces-36845-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDrHBk3K9WkhPAIAu9opvQ
	(envelope-from <linux-usb+bounces-36845-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 02 May 2026 11:56:29 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F7F4B19B7
	for <lists+linux-usb@lfdr.de>; Sat, 02 May 2026 11:56:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 05103300599B
	for <lists+linux-usb@lfdr.de>; Sat,  2 May 2026 09:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5135D312826;
	Sat,  2 May 2026 09:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="buot97HA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SeGRG9cz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E1E30E82D
	for <linux-usb@vger.kernel.org>; Sat,  2 May 2026 09:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777715786; cv=none; b=M/qu3/EpGhPILZL6KssQvCAJhStJRsj/UdbdNfhLHHwErcJQE2rzpSlLOSn30HujwkopC54WnxoHRHkrBxUHZ4XmnkZ5jdulQzl/fKInrz5Bc9p0N8HULDZGIVYPP+AWf6Y/6z3CYM0XILacECRwp1Gcl31yV+RZulR8KVXw/4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777715786; c=relaxed/simple;
	bh=Cx+joeBc+rdcVoqFpJms6AZ1GOMKvcbhmc/Ksf/0Zug=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XEmWW34M7dHzI3vLefd5+WBJ5vEO/OOJbXarEFqvlQQxTpStLEdvXy3nQdMx8D6G9/HxgY5HN0ulFttQPghmSmGAUdazVb9iyB4ASfW7hmeD1Jjq8BYX9bKxS4x83iIjH78xo7AMU3c8qbHlv5dbJbpT2HKeBAY71m1Uj52AmjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=buot97HA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SeGRG9cz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6427bBxF2516401
	for <linux-usb@vger.kernel.org>; Sat, 2 May 2026 09:56:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=17E1Cq1J3JMEZ4+HCKxcenEnYbEZ7i1+KzW
	P4uYC3j4=; b=buot97HAKC3hozGmR+Zs5eFM+zBC39ZbBPB+Aeq6GxNRIAZ/lsx
	GCj1Z2bE9/Z1AkE5W/aswlRKXEXNe31tGeRNlX9IxCa9l+ztn7km85zGIcoE0rWm
	AXnO/tR8Z4Z1UeQPrq4NNk5TFvbm2pkqruNeOkJLwktqYPonXPhpUgHB+cFnD7+V
	/3oFRXxIaHfTlQ2fiTezyHt/AQETRKtZ9zWZ/DBKfdKsQEjR+uFGRKs3nB3CSsap
	Br5fYloMip4PtSNZbwBbQpZxiUaQ65KbexN6qbs3IWhtkulHfGeNZDh+qJX3G29T
	/Wv7aY3IG1Jsd3cim5Z4oawon+Zh5+/StIg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw8uxgngy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 02 May 2026 09:56:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-364c0e269e5so2866775a91.2
        for <linux-usb@vger.kernel.org>; Sat, 02 May 2026 02:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777715783; x=1778320583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=17E1Cq1J3JMEZ4+HCKxcenEnYbEZ7i1+KzWP4uYC3j4=;
        b=SeGRG9czCa4Fm+yVrI1NgP0OP45kGpyjbJWkc6KyHCEr71YvtBYigNO0VJ0Qh+TcG7
         dl3QcFj/ctxQpmBRhah/7WHugrhaiuSPQpbdCRpU33x40ub4wV/mW6ybc60FepvOKENw
         cif5+x0gLXECW5HAphlgwBw6uzsf9qkZ+OvlH1EiYkXFyK9hIoP2638kbKxRfgyb8iR7
         wxrbocjbpIenoKEHDqHO+ae/KokqkAcS8c/6uqRL/YV1AInIA2meU0imvYofCveS0tTL
         mH7ZgWcZBHyKTtMyiMLkmDxU0pKs2sG37hQKeTids3UqMBXsikFieks5b01d4md5aCS3
         muyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777715783; x=1778320583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=17E1Cq1J3JMEZ4+HCKxcenEnYbEZ7i1+KzWP4uYC3j4=;
        b=UYrz6bTW2GuGx2amWXEejKvHC+ihOdCkwdMyD541WSrA9KAsN7NNvqm7UM5TxjAg+K
         r6H0YVIgt/du9ZkQYuTBOezHgoSdPaMqMeZb7mjXDEdzaVe/Iqk2HOCYs/4Z8IPfMNi1
         F1etCu3R017QhZEMHRCe8qVqjPcnfkLbhPwrugr+AbN9orU6V1LR8QxQuk5cDV/o8Uh6
         nrKEsBqHWpgp/bcnMh8dcHrPBMdmY0TzeFK3AD9y9uB0AxYeztonXSS0zH6XLtOz/F7L
         u1sbIbP4FjxJRNNnTftWV4YhFOHockATUI/rgSTr0e3a8PJWZxSGC6rYRWCy9H90yic0
         fsow==
X-Forwarded-Encrypted: i=1; AFNElJ/gx25O9kRH1yWIrqz/JCpyvAqryYtGbKYLX7Xij6+SQTAe6ejjsw+TYw2SAegmdFiHTIu96/S3fDI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCmrWMVnPlaNEf27Ol8XK2uRr14MTY462xlhDX5I0IATFiRT0i
	fW4Zfuk/b7wkARMijQhL4f6MXlFbPvceCQaBmw91gfILk27htLOTQxUeKROEuakp8Hy9I2VHe9c
	vo43WTZx7ECH/pSlX0Bb01Of23ZoZ7BkXPPAH56RbwuJx/wP1hm4MKQyc3Pi2pVY=
X-Gm-Gg: AeBDies2DTjtzNLzm9Y98e8n1EzXoEyw6SPU9qf84SOKw49tAH4I3d+tRn51H+8bf56
	VP+lfIY8Mfc8oHcR8g5GW+UqLDnMq7gJGvzT5+y+L+cPGz2q2r+wAv8uHRw/qBuw9/cs6t3f/dg
	RIkNNU8J7YrBE8/l4LC6dqEWlsuQ0Jde9B+iuhRgYFeV4LLughpllJz17+vhCesv+P7fnMC97GT
	ugJ7JzWtm2zGzhdFh+Jqr3BwmSndPIfcmWORZa8wOUzlyUcUApPRlbP28TO5dzdQocuzEypt8m0
	dMvIxOsyCOYaIlZwUh1fh0bXTsh7feNtWts3VZyV2CO8g4lQZMk/bHEU8l5mqAGDF9gZ3uqMSHa
	imK1q41u+l9p6p8v8qtQ6b6R7OZXI9gUubNx6r8KVjvKlAxulICHpT0d9U/KWO2m9CrR4YWJtxJ
	/T/vPslmXbzxNokcfj30ThmOAXvA==
X-Received: by 2002:a05:6300:218d:b0:398:4bf2:4285 with SMTP id adf61e73a8af0-3a7f1a955b8mr2520313637.16.1777715783382;
        Sat, 02 May 2026 02:56:23 -0700 (PDT)
X-Received: by 2002:a05:6300:218d:b0:398:4bf2:4285 with SMTP id adf61e73a8af0-3a7f1a955b8mr2520287637.16.1777715782870;
        Sat, 02 May 2026 02:56:22 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c801bccee15sm170506a12.9.2026.05.02.02.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 02:56:22 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH] usb: dwc3: qcom: Modify interrupt handling for EUSB2 Phy targets
Date: Sat,  2 May 2026 15:26:16 +0530
Message-Id: <20260502095616.666938-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: CkFhZN6fMNAKAPWWByEmLZ4Gz1ChMItE
X-Authority-Analysis: v=2.4 cv=QqxuG1yd c=1 sm=1 tr=0 ts=69f5ca48 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=wyrcdbDR-kVNaWTReRsA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: CkFhZN6fMNAKAPWWByEmLZ4Gz1ChMItE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAyMDA5OCBTYWx0ZWRfX3bMcKahGJVfC
 MR0GhhPLOOlZnwSLxykqxGSY1ElGyid1LOz+7mSLbhrZ4AnMdvGKxyXBwlWG70syZkOH7XHruwh
 no7jI9llsHucTQqUs3EjuEKvfkVmfRjD7KnQgOiVRMjH4B+9bGlhQo+gwYDY0KUs6wRYm46tYq2
 BvfYeC1vgx6KQp2lmCtqLbNfxFHdWaMdUImiRIhC4iI/e/qI6Exx1p7Jn8y6oHie++9JUHxUErZ
 IDNvWlWxHcb0t+UavstKxi7BQ3Tjhwg+CXte4gDsPhUEBnAA3FtxTCVTKjEk2m8z+ScJ+IfkMQ3
 BqnVLxc14C1XXDisMuNn83mDC9jGQ/CY5lhfIaXigHubFsjSAkQZi383znGjO+ywDc/A2FVioSn
 Uw4MJceU2dmI0k4h4uQwIes80syXH2OAa8lnv0zO02q1ZYDYTRli4gzpXf3/YQ24nBBl6XMDDsM
 gTAXtqj3i522eUMz/nQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-02_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605020098
X-Rspamd-Queue-Id: A4F7F4B19B7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36845-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]

Modify interrupt handling for EUSB2 Phy targets. Enable DP Interrupt
when an Low speed device is connnected and enable DM interrupt when
a High Speed/ Full Speed device is connected.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Tested remote wakeupon Glymur device by button press from a headset
connected to both Type-C and Type-A ports.

 drivers/usb/dwc3/dwc3-qcom.c | 63 ++++++++++++++++++++++++++++++------
 1 file changed, 54 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index f43f73ac36ff..5956821eab45 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -60,6 +60,10 @@ static const u32 pwr_evnt_irq_stat_reg[DWC3_QCOM_MAX_PORTS] = {
 	0x238,
 };
 
+struct dwc3_qcom_platform_data {
+	bool			uses_eusb2_phy;
+};
+
 struct dwc3_qcom_port {
 	int			qusb2_phy_irq;
 	int			dp_hs_phy_irq;
@@ -85,6 +89,7 @@ struct dwc3_qcom {
 	struct icc_path		*icc_path_apps;
 
 	enum usb_role		current_role;
+	bool			uses_eusb2_phy;
 };
 
 #define to_dwc3_qcom(d) container_of((d), struct dwc3_qcom, dwc)
@@ -272,15 +277,21 @@ static void dwc3_qcom_disable_wakeup_irq(int irq)
 	disable_irq_nosync(irq);
 }
 
-static void dwc3_qcom_disable_port_interrupts(struct dwc3_qcom_port *port)
+static void dwc3_qcom_disable_port_interrupts(struct dwc3_qcom *qcom, int i)
 {
+	struct dwc3_qcom_port *port = &qcom->ports[i];
+
 	dwc3_qcom_disable_wakeup_irq(port->qusb2_phy_irq);
 
 	if (port->usb2_speed == USB_SPEED_LOW) {
-		dwc3_qcom_disable_wakeup_irq(port->dm_hs_phy_irq);
+		dwc3_qcom_disable_wakeup_irq(qcom->uses_eusb2_phy ?
+					     port->dp_hs_phy_irq :
+					     port->dm_hs_phy_irq);
 	} else if ((port->usb2_speed == USB_SPEED_HIGH) ||
 			(port->usb2_speed == USB_SPEED_FULL)) {
-		dwc3_qcom_disable_wakeup_irq(port->dp_hs_phy_irq);
+		dwc3_qcom_disable_wakeup_irq(qcom->uses_eusb2_phy ?
+					     port->dm_hs_phy_irq :
+					     port->dp_hs_phy_irq);
 	} else {
 		dwc3_qcom_disable_wakeup_irq(port->dp_hs_phy_irq);
 		dwc3_qcom_disable_wakeup_irq(port->dm_hs_phy_irq);
@@ -289,8 +300,10 @@ static void dwc3_qcom_disable_port_interrupts(struct dwc3_qcom_port *port)
 	dwc3_qcom_disable_wakeup_irq(port->ss_phy_irq);
 }
 
-static void dwc3_qcom_enable_port_interrupts(struct dwc3_qcom_port *port)
+static void dwc3_qcom_enable_port_interrupts(struct dwc3_qcom *qcom, int i)
 {
+	struct dwc3_qcom_port *port = &qcom->ports[i];
+
 	dwc3_qcom_enable_wakeup_irq(port->qusb2_phy_irq, 0);
 
 	/*
@@ -303,11 +316,19 @@ static void dwc3_qcom_enable_port_interrupts(struct dwc3_qcom_port *port)
 	 */
 
 	if (port->usb2_speed == USB_SPEED_LOW) {
-		dwc3_qcom_enable_wakeup_irq(port->dm_hs_phy_irq,
+		dwc3_qcom_enable_wakeup_irq(qcom->uses_eusb2_phy ?
+					    port->dp_hs_phy_irq :
+					    port->dm_hs_phy_irq,
+					    qcom->uses_eusb2_phy ?
+					    IRQ_TYPE_EDGE_RISING :
 					    IRQ_TYPE_EDGE_FALLING);
 	} else if ((port->usb2_speed == USB_SPEED_HIGH) ||
 			(port->usb2_speed == USB_SPEED_FULL)) {
-		dwc3_qcom_enable_wakeup_irq(port->dp_hs_phy_irq,
+		dwc3_qcom_enable_wakeup_irq(qcom->uses_eusb2_phy ?
+					    port->dm_hs_phy_irq :
+					    port->dp_hs_phy_irq,
+					    qcom->uses_eusb2_phy ?
+					    IRQ_TYPE_EDGE_RISING :
 					    IRQ_TYPE_EDGE_FALLING);
 	} else {
 		dwc3_qcom_enable_wakeup_irq(port->dp_hs_phy_irq,
@@ -324,7 +345,7 @@ static void dwc3_qcom_disable_interrupts(struct dwc3_qcom *qcom)
 	int i;
 
 	for (i = 0; i < qcom->num_ports; i++)
-		dwc3_qcom_disable_port_interrupts(&qcom->ports[i]);
+		dwc3_qcom_disable_port_interrupts(qcom, i);
 }
 
 static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
@@ -332,7 +353,7 @@ static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
 	int i;
 
 	for (i = 0; i < qcom->num_ports; i++)
-		dwc3_qcom_enable_port_interrupts(&qcom->ports[i]);
+		dwc3_qcom_enable_port_interrupts(qcom, i);
 }
 
 static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
@@ -609,6 +630,7 @@ struct dwc3_glue_ops dwc3_qcom_glue_ops = {
 
 static int dwc3_qcom_probe(struct platform_device *pdev)
 {
+	const struct dwc3_qcom_platform_data *pdata;
 	struct dwc3_probe_data	probe_data = {};
 	struct device		*dev = &pdev->dev;
 	struct dwc3_qcom	*qcom;
@@ -624,6 +646,10 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 
 	qcom->dev = &pdev->dev;
 
+	pdata = device_get_match_data(dev);
+	if (pdata)
+		qcom->uses_eusb2_phy = pdata->uses_eusb2_phy;
+
 	qcom->resets = devm_reset_control_array_get_optional_exclusive(dev);
 	if (IS_ERR(qcom->resets)) {
 		return dev_err_probe(&pdev->dev, PTR_ERR(qcom->resets),
@@ -838,8 +864,27 @@ static const struct dev_pm_ops dwc3_qcom_dev_pm_ops = {
 	.prepare = pm_sleep_ptr(dwc3_qcom_prepare),
 };
 
+static const struct dwc3_qcom_platform_data dwc3_qcom_pdata = {
+	.uses_eusb2_phy = false,
+};
+
+static const struct dwc3_qcom_platform_data dwc3_qcom_glymur_pdata = {
+	.uses_eusb2_phy = true,
+};
+
 static const struct of_device_id dwc3_qcom_of_match[] = {
-	{ .compatible = "qcom,snps-dwc3" },
+	{
+		.compatible = "qcom,snps-dwc3",
+		.data = &dwc3_qcom_pdata,
+	},
+	{
+		.compatible = "qcom,glymur-dwc3",
+		.data = &dwc3_qcom_glymur_pdata,
+	},
+	{
+		.compatible = "qcom,glymur-dwc3-mp",
+		.data = &dwc3_qcom_glymur_pdata,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, dwc3_qcom_of_match);
-- 
2.34.1


