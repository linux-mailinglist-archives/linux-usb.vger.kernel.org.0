Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 529C617E0E8
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2020 14:15:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726557AbgCINPG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Mar 2020 09:15:06 -0400
Received: from mail-pf1-f178.google.com ([209.85.210.178]:36139 "EHLO
        mail-pf1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726368AbgCINPG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Mar 2020 09:15:06 -0400
Received: by mail-pf1-f178.google.com with SMTP id i13so4812861pfe.3
        for <linux-usb@vger.kernel.org>; Mon, 09 Mar 2020 06:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=GrzlbwXNyLmQT2+BJ6YUho44LVk/sDhLl1bSCSNbutA=;
        b=YigT+/rwZL+JEzV/+2KRCvLIUp9H8yvR0hc4/gya2Z3Yytv/Ben4A10KNX0ZtKmP2V
         V5a/qXDpGoEj8vj/dQj9iWmzwuVgiTNG3TFIVip88jw8rgycFMxrb2Y7cOGMT75As2UO
         RZR6ETaQwlZdDIO+6fu4/8ig2cPohg2NN8VMxfCCnlkoh9su3jVTZsdk09zW/ouWwEjN
         a0Ke75c1SrPzyiO+HFxqXq1+SkzVo/kcbMoEEqTr/hSCBPJem+znKgnG9xQF94poLl1Q
         Up9W1WTEpDYm4Q6FJ5nyNUo8GZEVTb/0fIykfnEvDzBvZMgMIsUW3cXmrZtpAZOZ7ZMb
         IkGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=GrzlbwXNyLmQT2+BJ6YUho44LVk/sDhLl1bSCSNbutA=;
        b=nGg6pN25DZAekGx/KPERC3amOxxiV27F707C9Ir3jWL4gcxxTCPCwsxLJWdNMtTAid
         gmNzvXO2Cuc7do37jSgYh4u/z57l+AgoW+KjqB0BtcM34hJtUj1+tlAJnas24TgPJu5J
         mbNP7kgRjMBwYWohclLVJVHZeRjW0dUkfr2DwRFK98si/u3pmRoP9mRz3zkVlbv2JFfc
         0mil6NkKCXPuO7Wak8d7HmAIpRqpZ1zCpThYBsZJxzy2GMk9cGICUVFXXzP2UU9eESMU
         qbbbvnqquK1t7sZ84ToV0tEIHcU8cchgnNHs4WQCfOzRLorWQYGxyMlhfcl03N6Hk7bm
         yImQ==
X-Gm-Message-State: ANhLgQ0kQfNGeXh2/H/rRRTWUkhzkMliuorsMu0KPX8qfwG5cPMLIYX7
        P1FK8plkvzL8r+SxavaD+webStokR+A=
X-Google-Smtp-Source: ADFU+vtUHQZsKSzGjyaQsKACydIpK3WmIuzuK3Wg0DQDZANiVDwUAaPBwhzImAvX4u/u56QPGuFedw==
X-Received: by 2002:a62:8342:: with SMTP id h63mr1232644pfe.24.1583759704145;
        Mon, 09 Mar 2020 06:15:04 -0700 (PDT)
Received: from payal-desktop ([157.33.162.233])
        by smtp.gmail.com with ESMTPSA id k3sm2533337pfp.142.2020.03.09.06.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2020 06:15:03 -0700 (PDT)
From:   Payal Kshirsagar <payalskshirsagar1234@gmail.com>
To:     manishc@marvell.com, GR-Linux-NIC-Dev@marvell.com,
        gregkh@linuxfoundation.org, outreachy-kernel@googlegroups.com
Cc:     Payal Kshirsagar <payalskshirsagar1234@gmail.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH 1/3] [Outreachy kernel] staging: qlge: remove spaces before tabs and align code
Date:   Mon,  9 Mar 2020 18:43:54 +0530
Message-Id: <2d4e3233c8d978700f4e8f442a82cf5f468649e4.1583759118.git.payalskshirsagar1234@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1583759118.git.payalskshirsagar1234@gmail.com>
References: <cover.1583759118.git.payalskshirsagar1234@gmail.com>
In-Reply-To: <cover.1583759118.git.payalskshirsagar1234@gmail.com>
References: <cover.1583759118.git.payalskshirsagar1234@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Remove white spaces before tabs and align code properly for readability.

Signed-off-by: Payal Kshirsagar <payalskshirsagar1234@gmail.com>
---
 drivers/staging/qlge/qlge.h | 60 ++++++++++++++++++-------------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/staging/qlge/qlge.h b/drivers/staging/qlge/qlge.h
index 4bc5d5fce9bf..66641edff6b5 100644
--- a/drivers/staging/qlge/qlge.h
+++ b/drivers/staging/qlge/qlge.h
@@ -16,8 +16,8 @@
 /*
  * General definitions...
  */
-#define DRV_NAME  	"qlge"
-#define DRV_STRING 	"QLogic 10 Gigabit PCI-E Ethernet Driver "
+#define DRV_NAME	"qlge"
+#define DRV_STRING	"QLogic 10 Gigabit PCI-E Ethernet Driver "
 #define DRV_VERSION	"1.00.00.35"
 
 #define WQ_ADDR_ALIGN	0x3	/* 4 byte alignment */
@@ -1077,11 +1077,11 @@ struct tx_buf_desc {
  * IOCB Definitions...
  */
 
-#define OPCODE_OB_MAC_IOCB 			0x01
+#define OPCODE_OB_MAC_IOCB		0x01
 #define OPCODE_OB_MAC_TSO_IOCB		0x02
-#define OPCODE_IB_MAC_IOCB			0x20
-#define OPCODE_IB_MPI_IOCB			0x21
-#define OPCODE_IB_AE_IOCB			0x3f
+#define OPCODE_IB_MAC_IOCB		0x20
+#define OPCODE_IB_MPI_IOCB		0x21
+#define OPCODE_IB_AE_IOCB		0x3f
 
 struct ob_mac_iocb_req {
 	u8 opcode;
@@ -1173,15 +1173,15 @@ struct ib_mac_iocb_rsp {
 	u8 flags1;
 #define IB_MAC_IOCB_RSP_OI	0x01	/* Override intr delay */
 #define IB_MAC_IOCB_RSP_I	0x02	/* Disable Intr Generation */
-#define IB_MAC_CSUM_ERR_MASK 0x1c	/* A mask to use for csum errs */
+#define IB_MAC_CSUM_ERR_MASK	0x1c	/* A mask to use for csum errs */
 #define IB_MAC_IOCB_RSP_TE	0x04	/* Checksum error */
 #define IB_MAC_IOCB_RSP_NU	0x08	/* No checksum rcvd */
 #define IB_MAC_IOCB_RSP_IE	0x10	/* IPv4 checksum error */
 #define IB_MAC_IOCB_RSP_M_MASK	0x60	/* Multicast info */
 #define IB_MAC_IOCB_RSP_M_NONE	0x00	/* Not mcast frame */
 #define IB_MAC_IOCB_RSP_M_HASH	0x20	/* HASH mcast frame */
-#define IB_MAC_IOCB_RSP_M_REG 	0x40	/* Registered mcast frame */
-#define IB_MAC_IOCB_RSP_M_PROM 	0x60	/* Promiscuous mcast frame */
+#define IB_MAC_IOCB_RSP_M_REG	0x40	/* Registered mcast frame */
+#define IB_MAC_IOCB_RSP_M_PROM	0x60	/* Promiscuous mcast frame */
 #define IB_MAC_IOCB_RSP_B	0x80	/* Broadcast frame */
 	u8 flags2;
 #define IB_MAC_IOCB_RSP_P	0x01	/* Promiscuous frame */
@@ -1198,16 +1198,16 @@ struct ib_mac_iocb_rsp {
 #define IB_MAC_IOCB_RSP_FO	0x80	/* Failover port */
 	u8 flags3;
 #define IB_MAC_IOCB_RSP_RSS_MASK	0x07	/* RSS mask */
-#define IB_MAC_IOCB_RSP_M_NONE	0x00	/* No RSS match */
-#define IB_MAC_IOCB_RSP_M_IPV4	0x04	/* IPv4 RSS match */
-#define IB_MAC_IOCB_RSP_M_IPV6	0x02	/* IPv6 RSS match */
-#define IB_MAC_IOCB_RSP_M_TCP_V4 	0x05	/* TCP with IPv4 */
-#define IB_MAC_IOCB_RSP_M_TCP_V6 	0x03	/* TCP with IPv6 */
-#define IB_MAC_IOCB_RSP_V4	0x08	/* IPV4 */
-#define IB_MAC_IOCB_RSP_V6	0x10	/* IPV6 */
-#define IB_MAC_IOCB_RSP_IH	0x20	/* Split after IP header */
-#define IB_MAC_IOCB_RSP_DS	0x40	/* data is in small buffer */
-#define IB_MAC_IOCB_RSP_DL	0x80	/* data is in large buffer */
+#define IB_MAC_IOCB_RSP_M_NONE		0x00	/* No RSS match */
+#define IB_MAC_IOCB_RSP_M_IPV4		0x04	/* IPv4 RSS match */
+#define IB_MAC_IOCB_RSP_M_IPV6		0x02	/* IPv6 RSS match */
+#define IB_MAC_IOCB_RSP_M_TCP_V4	0x05	/* TCP with IPv4 */
+#define IB_MAC_IOCB_RSP_M_TCP_V6	0x03	/* TCP with IPv6 */
+#define IB_MAC_IOCB_RSP_V4		0x08	/* IPV4 */
+#define IB_MAC_IOCB_RSP_V6		0x10	/* IPV6 */
+#define IB_MAC_IOCB_RSP_IH		0x20	/* Split after IP header */
+#define IB_MAC_IOCB_RSP_DS		0x40	/* data is in small buffer */
+#define IB_MAC_IOCB_RSP_DL		0x80	/* data is in large buffer */
 	__le32 data_len;	/* */
 	__le64 data_addr;	/* */
 	__le32 rss;		/* */
@@ -1233,17 +1233,17 @@ struct ib_ae_iocb_rsp {
 #define IB_AE_IOCB_RSP_OI		0x01
 #define IB_AE_IOCB_RSP_I		0x02
 	u8 event;
-#define LINK_UP_EVENT              0x00
-#define LINK_DOWN_EVENT            0x01
-#define CAM_LOOKUP_ERR_EVENT       0x06
-#define SOFT_ECC_ERROR_EVENT       0x07
-#define MGMT_ERR_EVENT             0x08
-#define TEN_GIG_MAC_EVENT          0x09
-#define GPI0_H2L_EVENT       	0x10
-#define GPI0_L2H_EVENT       	0x20
-#define GPI1_H2L_EVENT       	0x11
-#define GPI1_L2H_EVENT       	0x21
-#define PCI_ERR_ANON_BUF_RD        0x40
+#define LINK_UP_EVENT			0x00
+#define LINK_DOWN_EVENT			0x01
+#define CAM_LOOKUP_ERR_EVENT		0x06
+#define SOFT_ECC_ERROR_EVENT		0x07
+#define MGMT_ERR_EVENT			0x08
+#define TEN_GIG_MAC_EVENT		0x09
+#define GPI0_H2L_EVENT			0x10
+#define GPI0_L2H_EVENT			0x20
+#define GPI1_H2L_EVENT			0x11
+#define GPI1_L2H_EVENT			0x21
+#define PCI_ERR_ANON_BUF_RD		0x40
 	u8 q_id;
 	__le32 reserved[15];
 } __packed;
-- 
2.17.1

