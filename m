Return-Path: <linux-usb+bounces-18605-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6433D9F5C15
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 02:08:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3992D7A2B5E
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 01:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9039C5473C;
	Wed, 18 Dec 2024 01:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ULn1z9mR";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="eltfBVx+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0009535964;
	Wed, 18 Dec 2024 01:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734484097; cv=none; b=QIcjbVAeVi8h3RE6I3WiY/jalvgcODLdrmj41DKBUEixC5FKB00I6xqiVdoft7xWNSLBwTj6kmXaFbSk+OREplRIqc+FcPzb0gHghpZi4CQ115B616CP2/Ot2+QPrSqn3kH+l1FvctopnZat7Nlm2rmDRIddhdtVMwcDDLfxsSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734484097; c=relaxed/simple;
	bh=3OXls4aX1XtriZFtqaZE692rJocWiHxEVkyrKopQNMo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=q0edU97MgkSlojRH57bOQjImKUIsB+yUti639KDWQyK5/YR9P3aG/qTUlyGcOLLZ40KGSRIIQfik0MnTzO343UJh7WYlBk/hqFV5US5Q3MSivGRjzjPwTWS3/RNjPghph0pbaIGZGkTQa1Pm1rMWSV+sxYjfKaAz8//1t3QOwNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ULn1z9mR; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=eltfBVx+; arc=none smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHIJpcr005630;
	Tue, 17 Dec 2024 17:07:50 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	pfptdkimsnps; bh=aVgL/rPj9SQyfPihaVEBAbg2V+XvfIG1aZxzPK2Wpb8=; b=
	ULn1z9mRXYLckD482INgKaeOuA3p67MVlgDs+YTgHAKRgbcX5pVK3a7M89VXDHDp
	9Kzqx43jV3NdBT/upXvlLtjWKmUDm91j3MTMd8rOBPx7YHh0po2dStgD+Qhuk1kr
	vw+9s4RVhYTt6G50NiSJSGgyg7ckj8Q0Ho79T92CwJOvAXKAZw2KYw4Xu03NfQ18
	NJPKXyiU2IC9A0EJLLexbH3omwlg2Pkh4QDp9oah+7890RQcNvKWx7z5TDobCLFe
	P/cvuqF36vtxgCMqIrpWXwkH8nv8TfTIhZJdoj1HzbnU/cU1sG84iEkWNA1SjhcQ
	tKWzGAb834xZxg3ScwwsOw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 43kefyhk80-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 17:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1734484069; bh=3OXls4aX1XtriZFtqaZE692rJocWiHxEVkyrKopQNMo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eltfBVx+h4TtPCMk3Yz2tFGI3IQsmF6i8OA8eV5laraBRIkdExciVlYGL6fnh5oc2
	 /fWN5eL0VTf5hHlJzCNFVC7dATKuwjmkpJTTIxoUYeaFGHvJd1fPWivl5sPHfDdg4Y
	 31jV9yXVlEZP9WISD3fql3rOH9/Ey2G2e3T6rn5ZA14ZsW8futHOA6KOME34k3rddR
	 rqEZIiXMyDqd9fVUAfR3HlxPDGFmLp3GT2X4kHlOoONShCcG13Y/53Ra3EQPHro3SZ
	 hTGahxfWS0bUS+wdJVePPS1UELbUH4SVWQ0KOqDhuwwA+qFwQyZ0Z0aEp4PajCxrF6
	 j1CkPOR8HrD7w==
Received: from mailhost.synopsys.com (eudc-mailhost2.synopsys.com [10.213.161.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 287DF40147;
	Wed, 18 Dec 2024 01:07:49 +0000 (UTC)
Received: from stormcs515.internal.synopsys.com (stormcs515.eudc.maas.synopsys.com [10.212.40.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mailhost.synopsys.com (Postfix) with ESMTPSA id D7A3AC0A9B;
	Wed, 18 Dec 2024 01:07:47 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: "Miao.Zhu" <Miao.Zhu@synopsys.com>
To: gregkh@linuxfoundation.org, robh@kernel.org, xu.yang_2@nxp.com,
        andre.draszik@linaro.org, dan.carpenter@linaro.org,
        emanuele.ghidoli@toradex.com, heikki.krogerus@linux.intel.com,
        m.felsch@pengutronix.de, rdbabiera@google.com,
        u.kleine-koenig@baylibre.com, conor+dt@kernel.org, jun.li@nxp.com
Cc: "Miao.Zhu" <Miao.Zhu@synopsys.com>, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Jianheng.Zhang@synopsys.com, James.Li1@synopsys.com,
        Martin.McKenny@synopsys.com
Subject: [PATCH v2 1/2] usb: typec: tcpm: tcpci: Make the driver be compatible with the TCPCI spec [Rev 2.0 Ver 1.0, October 2017]
Date: Wed, 18 Dec 2024 02:07:17 +0100
Message-Id: <20241218010718.224530-2-miao@synopsys.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20241218010718.224530-1-miao@synopsys.com>
References: <20241202054314.k6dt7uhnv2kavea4@hippo>
 <20241218010718.224530-1-miao@synopsys.com>
X-Proofpoint-GUID: zlUd3cELd7YRsqHvN0DaON7ZLx0rHylp
X-Authority-Analysis: v=2.4 cv=IqPkcK/g c=1 sm=1 tr=0 ts=67622066 cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=N6atwU2pGFX-QpmD:21 a=RZcAm9yDv7YA:10 a=qPHU084jO2kA:10 a=jIQo8A4GAAAA:8 a=eGn6WNas5V0CIjkcNdIA:9
 a=Lf5xNeLK5dgiOs8hzIjU:22
X-Proofpoint-ORIG-GUID: zlUd3cELd7YRsqHvN0DaON7ZLx0rHylp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 mlxscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0
 mlxlogscore=999 malwarescore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412180005
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

The tcpci driver doesn't fully follow the TCPCI spec even if
it mentions this spec in its comments.
- Add two flags into tcpci_data:
	RX_BUF_BYTE_x_hidden
	conn_present_capable
- Following flags in tcpci_data are read from device tree in tcpci_probe.
	TX_BUF_BYTE_x_hidden
	RX_BUF_BYTE_x_hidden
	auto_discharge_disconnect
	vbus_vsafe0v
The change makes the driver be compatible with the TCPCI spec and
won't impact existing HW.

Signed-off-by: Miao Zhu <miao@synopsys.com>
---
V1 -> V2: Cleaned up typo and addressed review comments
---
 drivers/usb/typec/tcpm/tcpci.c | 115 ++++++++++++++++++++++++++++++++++-------
 include/linux/usb/tcpci.h      |  11 ++++
 2 files changed, 106 insertions(+), 20 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index ed32583..7c831c0 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -453,19 +453,26 @@ static int tcpci_set_roles(struct tcpc_dev *tcpc, bool attached,
 			   enum typec_role role, enum typec_data_role data)
 {
 	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
-	unsigned int reg;
+	unsigned int reg = 0;
 	int ret;
 
-	reg = FIELD_PREP(TCPC_MSG_HDR_INFO_REV, PD_REV20);
-	if (role == TYPEC_SOURCE)
-		reg |= TCPC_MSG_HDR_INFO_PWR_ROLE;
-	if (data == TYPEC_HOST)
-		reg |= TCPC_MSG_HDR_INFO_DATA_ROLE;
+	if (attached) {
+		reg = FIELD_PREP(TCPC_MSG_HDR_INFO_REV, PD_REV20);
+		if (role == TYPEC_SOURCE)
+			reg |= TCPC_MSG_HDR_INFO_PWR_ROLE;
+		if (data == TYPEC_HOST)
+			reg |= TCPC_MSG_HDR_INFO_DATA_ROLE;
+	}
 	ret = regmap_write(tcpci->regmap, TCPC_MSG_HDR_INFO, reg);
 	if (ret < 0)
 		return ret;
 
-	return 0;
+	if (tcpci->data->conn_present_capable)
+		return regmap_update_bits(tcpci->regmap, TCPC_CONFIG_STD_OUTPUT,
+					TCPC_CONFIG_STD_OUTPUT_CON_PRES,
+					attached ? TCPC_CONFIG_STD_OUTPUT_CON_PRES : 0);
+	else
+		return 0;
 }
 
 static int tcpci_set_pd_rx(struct tcpc_dev *tcpc, bool enable)
@@ -741,33 +748,86 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
 		struct pd_message msg;
 		unsigned int cnt, payload_cnt;
 		u16 header;
+		unsigned int frame_type;
+		enum tcpm_transmit_type rx_type;
 
 		regmap_read(tcpci->regmap, TCPC_RX_BYTE_CNT, &cnt);
 		/*
 		 * 'cnt' corresponds to READABLE_BYTE_COUNT in section 4.4.14
 		 * of the TCPCI spec [Rev 2.0 Ver 1.0 October 2017] and is
 		 * defined in table 4-36 as one greater than the number of
-		 * bytes received. And that number includes the header. So:
+		 * bytes received. And that number includes the header.
+		 * In Section 4.4.14 of the TCPCI spec [Rev 2.0 Ver 1.0 October, 2017],
+		 * the RECEIVE_BUFFER comprises of three sets of registers:
+		 * READABLE_BYTE_COUNT, RX_BUF_FRAME_TYPE and RX_BUF_BYTE_x.
+		 * These registers can only be accessed by reading at a common
+		 * register address 0x30h.
 		 */
-		if (cnt > 3)
-			payload_cnt = cnt - (1 + sizeof(msg.header));
-		else
-			payload_cnt = 0;
+		if (tcpci->data->RX_BUF_BYTE_x_hidden) {
+			u8 buf[TCPC_RECEIVE_BUFFER_MAX_LEN] = {0,};
+			u8 pos = 0;
+
+			/* Read the count and frame type in RECEIVE_BUFFER */
+			regmap_raw_read(tcpci->regmap, TCPC_RX_BYTE_CNT, buf, 2);
+			/* READABLE_BYTE_COUNT */
+			cnt = buf[0];
+			/* RX_BUF_FRAME_TYPE */
+			frame_type = buf[1];
+
+			/* Read the content of the USB PD message in RECEIVE_BUFFER */
+			regmap_raw_read(tcpci->regmap, TCPC_RX_BYTE_CNT, buf, cnt + 1);
+
+			pos += 2;
+			memcpy(&msg.header, &buf[pos], sizeof(msg.header));
+
+			if (cnt > 3) {
+				pos += sizeof(msg.header);
+				payload_cnt = cnt - (1 + sizeof(msg.header));
+				if (WARN_ON(payload_cnt > sizeof(msg.payload)))
+					payload_cnt = sizeof(msg.payload);
+				memcpy(&msg.payload, &buf[pos], payload_cnt);
+			}
+		} else {
+			regmap_read(tcpci->regmap, TCPC_RX_BYTE_CNT, &cnt);
+			/*
+			 * 'cnt' corresponds to READABLE_BYTE_COUNT in section 4.4.14
+			 * of the TCPCI spec [Rev 2.0 Ver 1.0 October 2017] and is
+			 * defined in table 4-36 as one greater than the number of
+			 * bytes received. And that number includes the header. So:
+			 */
+			if (cnt > 3)
+				payload_cnt = cnt - (1 + sizeof(msg.header));
+			else
+				payload_cnt = 0;
 
-		tcpci_read16(tcpci, TCPC_RX_HDR, &header);
-		msg.header = cpu_to_le16(header);
+			regmap_read(tcpci->regmap, TCPC_RX_BUF_FRAME_TYPE, &frame_type);
 
-		if (WARN_ON(payload_cnt > sizeof(msg.payload)))
-			payload_cnt = sizeof(msg.payload);
+			tcpci_read16(tcpci, TCPC_RX_HDR, &header);
+			msg.header = cpu_to_le16(header);
 
-		if (payload_cnt > 0)
-			regmap_raw_read(tcpci->regmap, TCPC_RX_DATA,
-					&msg.payload, payload_cnt);
+			if (WARN_ON(payload_cnt > sizeof(msg.payload)))
+				payload_cnt = sizeof(msg.payload);
+
+			if (payload_cnt > 0)
+				regmap_raw_read(tcpci->regmap, TCPC_RX_DATA,
+							&msg.payload, payload_cnt);
+		}
 
 		/* Read complete, clear RX status alert bit */
 		tcpci_write16(tcpci, TCPC_ALERT, TCPC_ALERT_RX_STATUS);
 
-		tcpm_pd_receive(tcpci->port, &msg, TCPC_TX_SOP);
+		switch (frame_type) {
+		case TCPC_RX_BUF_FRAME_TYPE_SOP1:
+			rx_type = TCPC_TX_SOP_PRIME;
+			break;
+		case TCPC_RX_BUF_FRAME_TYPE_SOP:
+			rx_type = TCPC_TX_SOP;
+			break;
+		default:
+			rx_type = TCPC_TX_SOP;
+			break;
+		}
+		tcpm_pd_receive(tcpci->port, &msg, rx_type);
 	}
 
 	if (tcpci->data->vbus_vsafe0v && (status & TCPC_ALERT_EXTENDED_STATUS)) {
@@ -916,6 +976,21 @@ static int tcpci_probe(struct i2c_client *client)
 	if (err < 0)
 		return err;
 
+	chip->data.TX_BUF_BYTE_x_hidden =
+		device_property_read_bool(&client->dev, "TX_BUF_BYTE_x_hidden");
+	chip->data.RX_BUF_BYTE_x_hidden =
+		device_property_read_bool(&client->dev, "RX_BUF_BYTE_x_hidden");
+	chip->data.auto_discharge_disconnect =
+		device_property_read_bool(&client->dev, "auto_discharge_disconnect");
+	chip->data.vbus_vsafe0v = device_property_read_bool(&client->dev, "vbus_vsafe0v");
+
+	err = tcpci_check_std_output_cap(chip->data.regmap,
+					 TCPC_STD_OUTPUT_CAP_CONN_PRESENT);
+	if (err < 0)
+		return err;
+
+	chip->data.conn_present_capable = err;
+
 	err = tcpci_check_std_output_cap(chip->data.regmap,
 					 TCPC_STD_OUTPUT_CAP_ORIENTATION);
 	if (err < 0)
diff --git a/include/linux/usb/tcpci.h b/include/linux/usb/tcpci.h
index f7f5cfb..b649803 100644
--- a/include/linux/usb/tcpci.h
+++ b/include/linux/usb/tcpci.h
@@ -50,6 +50,7 @@
 #define TCPC_CONFIG_STD_OUTPUT_ORIENTATION_MASK		BIT(0)
 #define TCPC_CONFIG_STD_OUTPUT_ORIENTATION_NORMAL	0
 #define TCPC_CONFIG_STD_OUTPUT_ORIENTATION_FLIPPED	1
+#define TCPC_CONFIG_STD_OUTPUT_CON_PRES		BIT(1)
 
 #define TCPC_TCPC_CTRL			0x19
 #define TCPC_TCPC_CTRL_ORIENTATION	BIT(0)
@@ -126,6 +127,7 @@
 #define TCPC_STD_INPUT_CAP		0x28
 #define TCPC_STD_OUTPUT_CAP		0x29
 #define TCPC_STD_OUTPUT_CAP_ORIENTATION	BIT(0)
+#define TCPC_STD_OUTPUT_CAP_CONN_PRESENT	BIT(1)
 
 #define TCPC_MSG_HDR_INFO		0x2e
 #define TCPC_MSG_HDR_INFO_DATA_ROLE	BIT(3)
@@ -167,6 +169,7 @@
 
 /* I2C_WRITE_BYTE_COUNT + 1 when TX_BUF_BYTE_x is only accessible I2C_WRITE_BYTE_COUNT */
 #define TCPC_TRANSMIT_BUFFER_MAX_LEN		31
+#define TCPC_RECEIVE_BUFFER_MAX_LEN		32
 
 #define tcpc_presenting_rd(reg, cc) \
 	(!(TCPC_ROLE_CTRL_DRP & (reg)) && \
@@ -177,6 +180,9 @@ struct tcpci;
 /*
  * @TX_BUF_BYTE_x_hidden:
  *		optional; Set when TX_BUF_BYTE_x can only be accessed through I2C_WRITE_BYTE_COUNT.
+ * @RX_BUF_BYTE_x_hidden:
+ *		Optional; Set when READABLE_BYTE_COUNT, RX_BUF_FRAME_TYPE and RX_BUF_BYTE_x
+ *		can only be accessed through READABLE_BYTE_COUNT.
  * @frs_sourcing_vbus:
  *		Optional; Callback to perform chip specific operations when FRS
  *		is sourcing vbus.
@@ -204,6 +210,9 @@ struct tcpci;
  *		swap following Discover Identity on SOP' occurs.
  *		Return true when the TCPM is allowed to request a Vconn swap
  *		after Discovery Identity on SOP.
+ * @conn_present_capable:
+ *		Optional; Enable setting the connection present
+ *		CONFIG_STANDARD_OUTPUT (0x18) bit1.
  * @set_orientation:
  *		Optional; Enable setting the connector orientation
  *		CONFIG_STANDARD_OUTPUT (0x18) bit0.
@@ -211,9 +220,11 @@ struct tcpci;
 struct tcpci_data {
 	struct regmap *regmap;
 	unsigned char TX_BUF_BYTE_x_hidden:1;
+	unsigned char RX_BUF_BYTE_x_hidden:1;
 	unsigned char auto_discharge_disconnect:1;
 	unsigned char vbus_vsafe0v:1;
 	unsigned char cable_comm_capable:1;
+	unsigned char conn_present_capable:1;
 	unsigned char set_orientation:1;
 
 	int (*init)(struct tcpci *tcpci, struct tcpci_data *data);
-- 
2.9.3


