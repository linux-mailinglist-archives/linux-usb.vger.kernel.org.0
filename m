Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B78B361B21
	for <lists+linux-usb@lfdr.de>; Fri, 16 Apr 2021 10:06:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240064AbhDPIGq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Apr 2021 04:06:46 -0400
Received: from rtits2.realtek.com ([211.75.126.72]:60537 "EHLO
        rtits2.realtek.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234291AbhDPIGk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 16 Apr 2021 04:06:40 -0400
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 13G867VI0023596, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36502.realtek.com.tw[172.21.6.25])
        by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 13G867VI0023596
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Fri, 16 Apr 2021 16:06:07 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXH36502.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 16 Apr 2021 16:06:06 +0800
Received: from fc32.localdomain (172.21.177.102) by RTEXMBS04.realtek.com.tw
 (172.21.6.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Fri, 16 Apr
 2021 16:06:04 +0800
From:   Hayes Wang <hayeswang@realtek.com>
To:     <kuba@kernel.org>, <davem@davemloft.net>
CC:     <netdev@vger.kernel.org>, <nic_swsd@realtek.com>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        Hayes Wang <hayeswang@realtek.com>
Subject: [PATCH net-next 5/6] r8152: support PHY firmware for RTL8156 series
Date:   Fri, 16 Apr 2021 16:04:36 +0800
Message-ID: <1394712342-15778-355-Taiwan-albertk@realtek.com>
X-Mailer: Microsoft Office Outlook 11
In-Reply-To: <1394712342-15778-350-Taiwan-albertk@realtek.com>
References: <1394712342-15778-350-Taiwan-albertk@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [172.21.177.102]
X-ClientProxiedBy: RTEXMBS01.realtek.com.tw (172.21.6.94) To
 RTEXMBS04.realtek.com.tw (172.21.6.97)
X-KSE-ServerInfo: RTEXMBS04.realtek.com.tw, 9
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: =?big5?B?Q2xlYW4sIGJhc2VzOiAyMDIxLzQvMTYgpFekyCAwNjowMDowMA==?=
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-AntiSpam-Outbound-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 04/16/2021 07:42:45
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 163158 [Apr 16 2021]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: hayeswang@realtek.com
X-KSE-AntiSpam-Info: LuaCore: 442 442 b985cb57763b61d2a20abb585d5d4cc10c315b09
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: realtek.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: {Track_Chinese_Simplified, headers_charset}
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 04/16/2021 07:45:00
X-KSE-ServerInfo: RTEXH36502.realtek.com.tw, 9
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: =?big5?B?Q2xlYW4sIGJhc2VzOiAyMDIxLzQvMTYgpFekyCAwNjozODowMA==?=
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-AntiSpam-Outbound-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 04/16/2021 07:46:47
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 163158 [Apr 16 2021]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: hayeswang@realtek.com
X-KSE-AntiSpam-Info: LuaCore: 442 442 b985cb57763b61d2a20abb585d5d4cc10c315b09
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: 127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;realtek.com:7.1.1
X-KSE-AntiSpam-Info: {Track_Chinese_Simplified, headers_charset}
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 04/16/2021 07:50:00
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Support new firmware type and method for RTL8156 series.

Signed-off-by: Hayes Wang <hayeswang@realtek.com>
---
 drivers/net/usb/r8152.c | 563 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 561 insertions(+), 2 deletions(-)

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index 72b8ef0ad5a1..34c1ee61af01 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -974,8 +974,60 @@ enum rtl8152_fw_flags {
 	FW_FLAGS_START,
 	FW_FLAGS_STOP,
 	FW_FLAGS_NC,
+	FW_FLAGS_NC1,
+	FW_FLAGS_NC2,
+	FW_FLAGS_UC2,
+	FW_FLAGS_UC,
+	FW_FLAGS_SPEED_UP,
+	FW_FLAGS_VER,
 };
 
+enum rtl8152_fw_fixup_cmd {
+	FW_FIXUP_AND = 0,
+	FW_FIXUP_OR,
+	FW_FIXUP_NOT,
+	FW_FIXUP_XOR,
+};
+
+struct fw_phy_set {
+	__le16 addr;
+	__le16 data;
+} __packed;
+
+struct fw_phy_speed_up {
+	struct fw_block blk_hdr;
+	__le16 fw_offset;
+	__le16 version;
+	__le16 fw_reg;
+	__le16 reserved;
+	char info[];
+} __packed;
+
+struct fw_phy_ver {
+	struct fw_block blk_hdr;
+	struct fw_phy_set ver;
+	__le32 reserved;
+} __packed;
+
+struct fw_phy_fixup {
+	struct fw_block blk_hdr;
+	struct fw_phy_set setting;
+	__le16 bit_cmd;
+	__le16 reserved;
+} __packed;
+
+struct fw_phy_union {
+	struct fw_block blk_hdr;
+	__le16 fw_offset;
+	__le16 fw_reg;
+	struct fw_phy_set pre_set[2];
+	struct fw_phy_set bp[8];
+	struct fw_phy_set bp_en;
+	u8 pre_num;
+	u8 bp_num;
+	char info[];
+} __packed;
+
 /**
  * struct fw_mac - a firmware block used by RTL_FW_PLA and RTL_FW_USB.
  *	The layout of the firmware block is:
@@ -1080,6 +1132,15 @@ enum rtl_fw_type {
 	RTL_FW_PHY_START,
 	RTL_FW_PHY_STOP,
 	RTL_FW_PHY_NC,
+	RTL_FW_PHY_FIXUP,
+	RTL_FW_PHY_UNION_NC,
+	RTL_FW_PHY_UNION_NC1,
+	RTL_FW_PHY_UNION_NC2,
+	RTL_FW_PHY_UNION_UC2,
+	RTL_FW_PHY_UNION_UC,
+	RTL_FW_PHY_UNION_MISC,
+	RTL_FW_PHY_SPEED_UP,
+	RTL_FW_PHY_VER,
 };
 
 enum rtl_version {
@@ -3999,6 +4060,162 @@ static int rtl_post_ram_code(struct r8152 *tp, u16 key_addr, bool wait)
 	return 0;
 }
 
+static bool rtl8152_is_fw_phy_speed_up_ok(struct r8152 *tp, struct fw_phy_speed_up *phy)
+{
+	u16 fw_offset;
+	u32 length;
+	bool rc = false;
+
+	switch (tp->version) {
+	case RTL_VER_01:
+	case RTL_VER_02:
+	case RTL_VER_03:
+	case RTL_VER_04:
+	case RTL_VER_05:
+	case RTL_VER_06:
+	case RTL_VER_07:
+	case RTL_VER_08:
+	case RTL_VER_09:
+	case RTL_VER_10:
+	case RTL_VER_11:
+	case RTL_VER_12:
+	case RTL_VER_14:
+		goto out;
+	case RTL_VER_13:
+	case RTL_VER_15:
+	default:
+		break;
+	}
+
+	fw_offset = __le16_to_cpu(phy->fw_offset);
+	length = __le32_to_cpu(phy->blk_hdr.length);
+	if (fw_offset < sizeof(*phy) || length <= fw_offset) {
+		dev_err(&tp->intf->dev, "invalid fw_offset\n");
+		goto out;
+	}
+
+	length -= fw_offset;
+	if (length & 3) {
+		dev_err(&tp->intf->dev, "invalid block length\n");
+		goto out;
+	}
+
+	if (__le16_to_cpu(phy->fw_reg) != 0x9A00) {
+		dev_err(&tp->intf->dev, "invalid register to load firmware\n");
+		goto out;
+	}
+
+	rc = true;
+out:
+	return rc;
+}
+
+static bool rtl8152_is_fw_phy_ver_ok(struct r8152 *tp, struct fw_phy_ver *ver)
+{
+	bool rc = false;
+
+	switch (tp->version) {
+	case RTL_VER_10:
+	case RTL_VER_11:
+	case RTL_VER_12:
+	case RTL_VER_13:
+	case RTL_VER_15:
+		break;
+	default:
+		goto out;
+	}
+
+	if (__le32_to_cpu(ver->blk_hdr.length) != sizeof(*ver)) {
+		dev_err(&tp->intf->dev, "invalid block length\n");
+		goto out;
+	}
+
+	if (__le16_to_cpu(ver->ver.addr) != SRAM_GPHY_FW_VER) {
+		dev_err(&tp->intf->dev, "invalid phy ver addr\n");
+		goto out;
+	}
+
+	rc = true;
+out:
+	return rc;
+}
+
+static bool rtl8152_is_fw_phy_fixup_ok(struct r8152 *tp, struct fw_phy_fixup *fix)
+{
+	bool rc = false;
+
+	switch (tp->version) {
+	case RTL_VER_10:
+	case RTL_VER_11:
+	case RTL_VER_12:
+	case RTL_VER_13:
+	case RTL_VER_15:
+		break;
+	default:
+		goto out;
+	}
+
+	if (__le32_to_cpu(fix->blk_hdr.length) != sizeof(*fix)) {
+		dev_err(&tp->intf->dev, "invalid block length\n");
+		goto out;
+	}
+
+	if (__le16_to_cpu(fix->setting.addr) != OCP_PHY_PATCH_CMD ||
+	    __le16_to_cpu(fix->setting.data) != BIT(7)) {
+		dev_err(&tp->intf->dev, "invalid phy fixup\n");
+		goto out;
+	}
+
+	rc = true;
+out:
+	return rc;
+}
+
+static bool rtl8152_is_fw_phy_union_ok(struct r8152 *tp, struct fw_phy_union *phy)
+{
+	u16 fw_offset;
+	u32 length;
+	bool rc = false;
+
+	switch (tp->version) {
+	case RTL_VER_10:
+	case RTL_VER_11:
+	case RTL_VER_12:
+	case RTL_VER_13:
+	case RTL_VER_15:
+		break;
+	default:
+		goto out;
+	}
+
+	fw_offset = __le16_to_cpu(phy->fw_offset);
+	length = __le32_to_cpu(phy->blk_hdr.length);
+	if (fw_offset < sizeof(*phy) || length <= fw_offset) {
+		dev_err(&tp->intf->dev, "invalid fw_offset\n");
+		goto out;
+	}
+
+	length -= fw_offset;
+	if (length & 1) {
+		dev_err(&tp->intf->dev, "invalid block length\n");
+		goto out;
+	}
+
+	if (phy->pre_num > 2) {
+		dev_err(&tp->intf->dev, "invalid pre_num %d\n", phy->pre_num);
+		goto out;
+	}
+
+	if (phy->bp_num > 8) {
+		dev_err(&tp->intf->dev, "invalid bp_num %d\n", phy->bp_num);
+		goto out;
+	}
+
+	rc = true;
+out:
+	return rc;
+}
+
 static bool rtl8152_is_fw_phy_nc_ok(struct r8152 *tp, struct fw_phy_nc *phy)
 {
 	u32 length;
@@ -4319,6 +4536,10 @@ static long rtl8152_check_firmware(struct r8152 *tp, struct rtl_fw *rtl_fw)
 		case RTL_FW_PHY_START:
 			if (test_bit(FW_FLAGS_START, &fw_flags) ||
 			    test_bit(FW_FLAGS_NC, &fw_flags) ||
+			    test_bit(FW_FLAGS_NC1, &fw_flags) ||
+			    test_bit(FW_FLAGS_NC2, &fw_flags) ||
+			    test_bit(FW_FLAGS_UC2, &fw_flags) ||
+			    test_bit(FW_FLAGS_UC, &fw_flags) ||
 			    test_bit(FW_FLAGS_STOP, &fw_flags)) {
 				dev_err(&tp->intf->dev,
 					"check PHY_START fail\n");
@@ -4367,7 +4588,153 @@ static long rtl8152_check_firmware(struct r8152 *tp, struct rtl_fw *rtl_fw)
 				goto fail;
 			}
 			__set_bit(FW_FLAGS_NC, &fw_flags);
+			break;
+		case RTL_FW_PHY_UNION_NC:
+			if (!test_bit(FW_FLAGS_START, &fw_flags) ||
+			    test_bit(FW_FLAGS_NC1, &fw_flags) ||
+			    test_bit(FW_FLAGS_NC2, &fw_flags) ||
+			    test_bit(FW_FLAGS_UC2, &fw_flags) ||
+			    test_bit(FW_FLAGS_UC, &fw_flags) ||
+			    test_bit(FW_FLAGS_STOP, &fw_flags)) {
+				dev_err(&tp->intf->dev, "PHY_UNION_NC out of order\n");
+				goto fail;
+			}
+
+			if (test_bit(FW_FLAGS_NC, &fw_flags)) {
+				dev_err(&tp->intf->dev, "multiple PHY_UNION_NC encountered\n");
+				goto fail;
+			}
+
+			if (!rtl8152_is_fw_phy_union_ok(tp, (struct fw_phy_union *)block)) {
+				dev_err(&tp->intf->dev, "check PHY_UNION_NC failed\n");
+				goto fail;
+			}
+			__set_bit(FW_FLAGS_NC, &fw_flags);
+			break;
+		case RTL_FW_PHY_UNION_NC1:
+			if (!test_bit(FW_FLAGS_START, &fw_flags) ||
+			    test_bit(FW_FLAGS_NC2, &fw_flags) ||
+			    test_bit(FW_FLAGS_UC2, &fw_flags) ||
+			    test_bit(FW_FLAGS_UC, &fw_flags) ||
+			    test_bit(FW_FLAGS_STOP, &fw_flags)) {
+				dev_err(&tp->intf->dev, "PHY_UNION_NC1 out of order\n");
+				goto fail;
+			}
+
+			if (test_bit(FW_FLAGS_NC1, &fw_flags)) {
+				dev_err(&tp->intf->dev, "multiple PHY NC1 encountered\n");
+				goto fail;
+			}
+
+			if (!rtl8152_is_fw_phy_union_ok(tp, (struct fw_phy_union *)block)) {
+				dev_err(&tp->intf->dev, "check PHY_UNION_NC1 failed\n");
+				goto fail;
+			}
+			__set_bit(FW_FLAGS_NC1, &fw_flags);
+			break;
+		case RTL_FW_PHY_UNION_NC2:
+			if (!test_bit(FW_FLAGS_START, &fw_flags) ||
+			    test_bit(FW_FLAGS_UC2, &fw_flags) ||
+			    test_bit(FW_FLAGS_UC, &fw_flags) ||
+			    test_bit(FW_FLAGS_STOP, &fw_flags)) {
+				dev_err(&tp->intf->dev, "PHY_UNION_NC2 out of order\n");
+				goto fail;
+			}
+
+			if (test_bit(FW_FLAGS_NC2, &fw_flags)) {
+				dev_err(&tp->intf->dev, "multiple PHY NC2 encountered\n");
+				goto fail;
+			}
+
+			if (!rtl8152_is_fw_phy_union_ok(tp, (struct fw_phy_union *)block)) {
+				dev_err(&tp->intf->dev, "check PHY_UNION_NC2 failed\n");
+				goto fail;
+			}
+			__set_bit(FW_FLAGS_NC2, &fw_flags);
+			break;
+		case RTL_FW_PHY_UNION_UC2:
+			if (!test_bit(FW_FLAGS_START, &fw_flags) ||
+			    test_bit(FW_FLAGS_UC, &fw_flags) ||
+			    test_bit(FW_FLAGS_STOP, &fw_flags)) {
+				dev_err(&tp->intf->dev, "PHY_UNION_UC2 out of order\n");
+				goto fail;
+			}
+
+			if (test_bit(FW_FLAGS_UC2, &fw_flags)) {
+				dev_err(&tp->intf->dev, "multiple PHY UC2 encountered\n");
+				goto fail;
+			}
+
+			if (!rtl8152_is_fw_phy_union_ok(tp, (struct fw_phy_union *)block)) {
+				dev_err(&tp->intf->dev, "check PHY_UNION_UC2 failed\n");
+				goto fail;
+			}
+			__set_bit(FW_FLAGS_UC2, &fw_flags);
+			break;
+		case RTL_FW_PHY_UNION_UC:
+			if (!test_bit(FW_FLAGS_START, &fw_flags) ||
+			    test_bit(FW_FLAGS_STOP, &fw_flags)) {
+				dev_err(&tp->intf->dev, "PHY_UNION_UC out of order\n");
+				goto fail;
+			}
+
+			if (test_bit(FW_FLAGS_UC, &fw_flags)) {
+				dev_err(&tp->intf->dev, "multiple PHY UC encountered\n");
+				goto fail;
+			}
+
+			if (!rtl8152_is_fw_phy_union_ok(tp, (struct fw_phy_union *)block)) {
+				dev_err(&tp->intf->dev, "check PHY_UNION_UC failed\n");
+				goto fail;
+			}
+			__set_bit(FW_FLAGS_UC, &fw_flags);
+			break;
+		case RTL_FW_PHY_UNION_MISC:
+			if (!rtl8152_is_fw_phy_union_ok(tp, (struct fw_phy_union *)block)) {
+				dev_err(&tp->intf->dev, "check RTL_FW_PHY_UNION_MISC failed\n");
+				goto fail;
+			}
+			break;
+		case RTL_FW_PHY_FIXUP:
+			if (!rtl8152_is_fw_phy_fixup_ok(tp, (struct fw_phy_fixup *)block)) {
+				dev_err(&tp->intf->dev, "check PHY fixup failed\n");
+				goto fail;
+			}
+			break;
+		case RTL_FW_PHY_SPEED_UP:
+			if (test_bit(FW_FLAGS_SPEED_UP, &fw_flags)) {
+				dev_err(&tp->intf->dev, "multiple PHY firmware encountered");
+				goto fail;
+			}
 
+			if (!rtl8152_is_fw_phy_speed_up_ok(tp, (struct fw_phy_speed_up *)block)) {
+				dev_err(&tp->intf->dev, "check PHY speed up failed\n");
+				goto fail;
+			}
+			__set_bit(FW_FLAGS_SPEED_UP, &fw_flags);
+			break;
+		case RTL_FW_PHY_VER:
+			if (test_bit(FW_FLAGS_START, &fw_flags) ||
+			    test_bit(FW_FLAGS_NC, &fw_flags) ||
+			    test_bit(FW_FLAGS_NC1, &fw_flags) ||
+			    test_bit(FW_FLAGS_NC2, &fw_flags) ||
+			    test_bit(FW_FLAGS_UC2, &fw_flags) ||
+			    test_bit(FW_FLAGS_UC, &fw_flags) ||
+			    test_bit(FW_FLAGS_STOP, &fw_flags)) {
+				dev_err(&tp->intf->dev, "Invalid order to set PHY version\n");
+				goto fail;
+			}
+
+			if (test_bit(FW_FLAGS_VER, &fw_flags)) {
+				dev_err(&tp->intf->dev, "multiple PHY version encountered");
+				goto fail;
+			}
+
+			if (!rtl8152_is_fw_phy_ver_ok(tp, (struct fw_phy_ver *)block)) {
+				dev_err(&tp->intf->dev, "check PHY version failed\n");
+				goto fail;
+			}
+			__set_bit(FW_FLAGS_VER, &fw_flags);
 			break;
 		default:
 			dev_warn(&tp->intf->dev, "Unknown type %u is found\n",
@@ -4390,6 +4757,143 @@ static long rtl8152_check_firmware(struct r8152 *tp, struct rtl_fw *rtl_fw)
 	return ret;
 }
 
+static void rtl_ram_code_speed_up(struct r8152 *tp, struct fw_phy_speed_up *phy, bool wait)
+{
+	u32 len;
+	u8 *data;
+
+	if (sram_read(tp, SRAM_GPHY_FW_VER) >= __le16_to_cpu(phy->version)) {
+		dev_dbg(&tp->intf->dev, "PHY firmware has been the newest\n");
+		return;
+	}
+
+	len = __le32_to_cpu(phy->blk_hdr.length);
+	len -= __le16_to_cpu(phy->fw_offset);
+	data = (u8 *)phy + __le16_to_cpu(phy->fw_offset);
+
+	if (rtl_phy_patch_request(tp, true, wait))
+		return;
+
+	while (len) {
+		u32 ocp_data, size;
+		int i;
+
+		if (len < 2048)
+			size = len;
+		else
+			size = 2048;
+
+		ocp_data = ocp_read_word(tp, MCU_TYPE_USB, USB_GPHY_CTRL);
+		ocp_data |= GPHY_PATCH_DONE | BACKUP_RESTRORE;
+		ocp_write_word(tp, MCU_TYPE_USB, USB_GPHY_CTRL, ocp_data);
+
+		generic_ocp_write(tp, __le16_to_cpu(phy->fw_reg), 0xff, size, data, MCU_TYPE_USB);
+
+		data += size;
+		len -= size;
+
+		ocp_data = ocp_read_word(tp, MCU_TYPE_PLA, PLA_POL_GPIO_CTRL);
+		ocp_data |= POL_GPHY_PATCH;
+		ocp_write_word(tp, MCU_TYPE_PLA, PLA_POL_GPIO_CTRL, ocp_data);
+
+		for (i = 0; i < 1000; i++) {
+			if (!(ocp_read_word(tp, MCU_TYPE_PLA, PLA_POL_GPIO_CTRL) & POL_GPHY_PATCH))
+				break;
+		}
+
+		if (i == 1000) {
+			dev_err(&tp->intf->dev, "ram code speedup mode timeout\n");
+			return;
+		}
+	}
+
+	ocp_write_word(tp, MCU_TYPE_PLA, PLA_OCP_GPHY_BASE, tp->ocp_base);
+	rtl_phy_patch_request(tp, false, wait);
+
+	if (sram_read(tp, SRAM_GPHY_FW_VER) == __le16_to_cpu(phy->version))
+		dev_dbg(&tp->intf->dev, "successfully applied %s\n", phy->info);
+	else
+		dev_err(&tp->intf->dev, "ram code speedup mode fail\n");
+}
+
+static int rtl8152_fw_phy_ver(struct r8152 *tp, struct fw_phy_ver *phy_ver)
+{
+	u16 ver_addr, ver;
+
+	ver_addr = __le16_to_cpu(phy_ver->ver.addr);
+	ver = __le16_to_cpu(phy_ver->ver.data);
+
+	if (sram_read(tp, ver_addr) >= ver) {
+		dev_dbg(&tp->intf->dev, "PHY firmware has been the newest\n");
+		return 0;
+	}
+
+	sram_write(tp, ver_addr, ver);
+
+	dev_dbg(&tp->intf->dev, "PHY firmware version %x\n", ver);
+
+	return ver;
+}
+
+static void rtl8152_fw_phy_fixup(struct r8152 *tp, struct fw_phy_fixup *fix)
+{
+	u16 addr, data;
+
+	addr = __le16_to_cpu(fix->setting.addr);
+	data = ocp_reg_read(tp, addr);
+
+	switch (__le16_to_cpu(fix->bit_cmd)) {
+	case FW_FIXUP_AND:
+		data &= __le16_to_cpu(fix->setting.data);
+		break;
+	case FW_FIXUP_OR:
+		data |= __le16_to_cpu(fix->setting.data);
+		break;
+	case FW_FIXUP_NOT:
+		data &= ~__le16_to_cpu(fix->setting.data);
+		break;
+	case FW_FIXUP_XOR:
+		data ^= __le16_to_cpu(fix->setting.data);
+		break;
+	default:
+		return;
+	}
+
+	ocp_reg_write(tp, addr, data);
+
+	dev_dbg(&tp->intf->dev, "applied ocp %x %x\n", addr, data);
+}
+
+static void rtl8152_fw_phy_union_apply(struct r8152 *tp, struct fw_phy_union *phy)
+{
+	__le16 *data;
+	u32 length;
+	int i, num;
+
+	num = phy->pre_num;
+	for (i = 0; i < num; i++)
+		sram_write(tp, __le16_to_cpu(phy->pre_set[i].addr),
+			   __le16_to_cpu(phy->pre_set[i].data));
+
+	length = __le32_to_cpu(phy->blk_hdr.length);
+	length -= __le16_to_cpu(phy->fw_offset);
+	num = length / 2;
+	data = (__le16 *)((u8 *)phy + __le16_to_cpu(phy->fw_offset));
+
+	ocp_reg_write(tp, OCP_SRAM_ADDR, __le16_to_cpu(phy->fw_reg));
+	for (i = 0; i < num; i++)
+		ocp_reg_write(tp, OCP_SRAM_DATA, __le16_to_cpu(data[i]));
+
+	num = phy->bp_num;
+	for (i = 0; i < num; i++)
+		sram_write(tp, __le16_to_cpu(phy->bp[i].addr), __le16_to_cpu(phy->bp[i].data));
+
+	if (phy->bp_num && phy->bp_en.addr)
+		sram_write(tp, __le16_to_cpu(phy->bp_en.addr), __le16_to_cpu(phy->bp_en.data));
+
+	dev_dbg(&tp->intf->dev, "successfully applied %s\n", phy->info);
+}
+
 static void rtl8152_fw_phy_nc_apply(struct r8152 *tp, struct fw_phy_nc *phy)
 {
 	u16 mode_reg, bp_index;
@@ -4443,6 +4947,12 @@ static void rtl8152_fw_mac_apply(struct r8152 *tp, struct fw_mac *mac)
 		return;
 	}
 
+	fw_ver_reg = __le16_to_cpu(mac->fw_ver_reg);
+	if (fw_ver_reg && ocp_read_byte(tp, MCU_TYPE_USB, fw_ver_reg) >= mac->fw_ver_data) {
+		dev_dbg(&tp->intf->dev, "%s firmware has been the newest\n", type ? "PLA" : "USB");
+		return;
+	}
+
 	rtl_clear_bp(tp, type);
 
 	/* Enable backup/restore of MACDBG. This is required after clearing PLA
@@ -4478,7 +4988,6 @@ static void rtl8152_fw_mac_apply(struct r8152 *tp, struct fw_mac *mac)
 		ocp_write_word(tp, type, bp_en_addr,
 			       __le16_to_cpu(mac->bp_en_value));
 
-	fw_ver_reg = __le16_to_cpu(mac->fw_ver_reg);
 	if (fw_ver_reg)
 		ocp_write_byte(tp, MCU_TYPE_USB, fw_ver_reg,
 			       mac->fw_ver_data);
@@ -4493,7 +5002,7 @@ static void rtl8152_apply_firmware(struct r8152 *tp, bool power_cut)
 	struct fw_header *fw_hdr;
 	struct fw_phy_patch_key *key;
 	u16 key_addr = 0;
-	int i;
+	int i, patch_phy = 1;
 
 	if (IS_ERR_OR_NULL(rtl_fw->fw))
 		return;
@@ -4515,17 +5024,40 @@ static void rtl8152_apply_firmware(struct r8152 *tp, bool power_cut)
 			rtl8152_fw_mac_apply(tp, (struct fw_mac *)block);
 			break;
 		case RTL_FW_PHY_START:
+			if (!patch_phy)
+				break;
 			key = (struct fw_phy_patch_key *)block;
 			key_addr = __le16_to_cpu(key->key_reg);
 			rtl_pre_ram_code(tp, key_addr, __le16_to_cpu(key->key_data), !power_cut);
 			break;
 		case RTL_FW_PHY_STOP:
+			if (!patch_phy)
+				break;
 			WARN_ON(!key_addr);
 			rtl_post_ram_code(tp, key_addr, !power_cut);
 			break;
 		case RTL_FW_PHY_NC:
 			rtl8152_fw_phy_nc_apply(tp, (struct fw_phy_nc *)block);
 			break;
+		case RTL_FW_PHY_VER:
+			patch_phy = rtl8152_fw_phy_ver(tp, (struct fw_phy_ver *)block);
+			break;
+		case RTL_FW_PHY_UNION_NC:
+		case RTL_FW_PHY_UNION_NC1:
+		case RTL_FW_PHY_UNION_NC2:
+		case RTL_FW_PHY_UNION_UC2:
+		case RTL_FW_PHY_UNION_UC:
+		case RTL_FW_PHY_UNION_MISC:
+			if (patch_phy)
+				rtl8152_fw_phy_union_apply(tp, (struct fw_phy_union *)block);
+			break;
+		case RTL_FW_PHY_FIXUP:
+			if (patch_phy)
+				rtl8152_fw_phy_fixup(tp, (struct fw_phy_fixup *)block);
+			break;
+		case RTL_FW_PHY_SPEED_UP:
+			rtl_ram_code_speed_up(tp, (struct fw_phy_speed_up *)block, !power_cut);
+			break;
 		default:
 			break;
 		}
@@ -5033,6 +5565,21 @@ static int r8153c_post_firmware_1(struct r8152 *tp)
 	return 0;
 }
 
+static int r8156a_post_firmware_1(struct r8152 *tp)
+{
+	u32 ocp_data;
+
+	ocp_data = ocp_read_word(tp, MCU_TYPE_USB, USB_FW_FIX_EN1);
+	ocp_data |= FW_IP_RESET_EN;
+	ocp_write_word(tp, MCU_TYPE_USB, USB_FW_FIX_EN1, ocp_data);
+
+	/* Modify U3PHY parameter for compatibility issue */
+	ocp_write_dword(tp, MCU_TYPE_USB, USB_UPHY3_MDCMDIO, 0x4026840e);
+	ocp_write_dword(tp, MCU_TYPE_USB, USB_UPHY3_MDCMDIO, 0x4001acc9);
+
+	return 0;
+}
+
 static void r8153_aldps_en(struct r8152 *tp, bool enable)
 {
 	u16 data;
@@ -8650,12 +9197,16 @@ static int rtl_ops_init(struct r8152 *tp)
 #define FIRMWARE_8153A_4	"rtl_nic/rtl8153a-4.fw"
 #define FIRMWARE_8153B_2	"rtl_nic/rtl8153b-2.fw"
 #define FIRMWARE_8153C_1	"rtl_nic/rtl8153c-1.fw"
+#define FIRMWARE_8156A_2	"rtl_nic/rtl8156a-2.fw"
+#define FIRMWARE_8156B_2	"rtl_nic/rtl8156b-2.fw"
 
 MODULE_FIRMWARE(FIRMWARE_8153A_2);
 MODULE_FIRMWARE(FIRMWARE_8153A_3);
 MODULE_FIRMWARE(FIRMWARE_8153A_4);
 MODULE_FIRMWARE(FIRMWARE_8153B_2);
 MODULE_FIRMWARE(FIRMWARE_8153C_1);
+MODULE_FIRMWARE(FIRMWARE_8156A_2);
+MODULE_FIRMWARE(FIRMWARE_8156B_2);
 
 static int rtl_fw_init(struct r8152 *tp)
 {
@@ -8681,6 +9232,14 @@ static int rtl_fw_init(struct r8152 *tp)
 		rtl_fw->pre_fw		= r8153b_pre_firmware_1;
 		rtl_fw->post_fw		= r8153b_post_firmware_1;
 		break;
+	case RTL_VER_11:
+		rtl_fw->fw_name		= FIRMWARE_8156A_2;
+		rtl_fw->post_fw		= r8156a_post_firmware_1;
+		break;
+	case RTL_VER_13:
+	case RTL_VER_15:
+		rtl_fw->fw_name		= FIRMWARE_8156B_2;
+		break;
 	case RTL_VER_14:
 		rtl_fw->fw_name		= FIRMWARE_8153C_1;
 		rtl_fw->pre_fw		= r8153b_pre_firmware_1;
-- 
2.26.3

