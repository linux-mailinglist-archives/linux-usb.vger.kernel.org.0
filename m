Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9C684EF728
	for <lists+linux-usb@lfdr.de>; Fri,  1 Apr 2022 18:02:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344855AbiDAPyN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 1 Apr 2022 11:54:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349353AbiDAOzT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 1 Apr 2022 10:55:19 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D88B82DF7;
        Fri,  1 Apr 2022 07:43:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id D7E3DCE2588;
        Fri,  1 Apr 2022 14:38:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D427C36AE2;
        Fri,  1 Apr 2022 14:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648823900;
        bh=qAnlLL+6EJDVpUHAdBK0VU/02Zl+0/lVVmEYu85XYWY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HCXYAbWSvxZUlD+oulNdy2FenE0N0zAlw9neW5/K2Jf5eAMajctcnZonCap+KYsFj
         PZY6xEVZbGXfTz+P2F0PwVYruTENpzEIpOzedoQ5nkHrHRK9Xr+34XuXRpA9GxnLzE
         o5e0/c9QaLzbkhsU4WUi8qFPTn92+EMOMrgPnEC0ZTL3grZTwLLCGk2LGXNFZWSX/A
         Hgn1qg90N4etfu4mpyYN9mzHzIo+Nq6pDSCkeb5F99m/GHRSmVWhBYgBnjMGCuQ4p+
         o0dAt5aa93bYHipZKS9ViQKIxNK7OzRgNgrfK+2G4efWteHCQhum2L8Ucial4pqeG6
         3FZr1FT1CaAGw==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Pawel Laszczak <pawell@cadence.com>,
        kernel test robot <lkp@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 09/98] usb: cdnsp: fix cdnsp_decode_trb function to properly handle ret value
Date:   Fri,  1 Apr 2022 10:36:13 -0400
Message-Id: <20220401143742.1952163-9-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220401143742.1952163-1-sashal@kernel.org>
References: <20220401143742.1952163-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Pawel Laszczak <pawell@cadence.com>

[ Upstream commit 03db9289b5ab59437e42a111a34545a7cedb5190 ]

Variable ret in function cdnsp_decode_trb is initialized but not
used. To fix this compiler warning patch adds checking whether the
data buffer has not been overflowed.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Pawel Laszczak <pawell@cadence.com>
Link: https://lore.kernel.org/r/20220112053237.14309-1-pawell@gli-login.cadence.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/cdns3/cdnsp-debug.h | 305 ++++++++++++++++----------------
 1 file changed, 154 insertions(+), 151 deletions(-)

diff --git a/drivers/usb/cdns3/cdnsp-debug.h b/drivers/usb/cdns3/cdnsp-debug.h
index a8776df2d4e0..f0ca865cce2a 100644
--- a/drivers/usb/cdns3/cdnsp-debug.h
+++ b/drivers/usb/cdns3/cdnsp-debug.h
@@ -182,208 +182,211 @@ static inline const char *cdnsp_decode_trb(char *str, size_t size, u32 field0,
 	int ep_id = TRB_TO_EP_INDEX(field3) - 1;
 	int type = TRB_FIELD_TO_TYPE(field3);
 	unsigned int ep_num;
-	int ret = 0;
+	int ret;
 	u32 temp;
 
 	ep_num = DIV_ROUND_UP(ep_id, 2);
 
 	switch (type) {
 	case TRB_LINK:
-		ret += snprintf(str, size,
-				"LINK %08x%08x intr %ld type '%s' flags %c:%c:%c:%c",
-				field1, field0, GET_INTR_TARGET(field2),
-				cdnsp_trb_type_string(type),
-				field3 & TRB_IOC ? 'I' : 'i',
-				field3 & TRB_CHAIN ? 'C' : 'c',
-				field3 & TRB_TC ? 'T' : 't',
-				field3 & TRB_CYCLE ? 'C' : 'c');
+		ret = snprintf(str, size,
+			       "LINK %08x%08x intr %ld type '%s' flags %c:%c:%c:%c",
+			       field1, field0, GET_INTR_TARGET(field2),
+			       cdnsp_trb_type_string(type),
+			       field3 & TRB_IOC ? 'I' : 'i',
+			       field3 & TRB_CHAIN ? 'C' : 'c',
+			       field3 & TRB_TC ? 'T' : 't',
+			       field3 & TRB_CYCLE ? 'C' : 'c');
 		break;
 	case TRB_TRANSFER:
 	case TRB_COMPLETION:
 	case TRB_PORT_STATUS:
 	case TRB_HC_EVENT:
-		ret += snprintf(str, size,
-				"ep%d%s(%d) type '%s' TRB %08x%08x status '%s'"
-				" len %ld slot %ld flags %c:%c",
-				ep_num, ep_id % 2 ? "out" : "in",
-				TRB_TO_EP_INDEX(field3),
-				cdnsp_trb_type_string(type), field1, field0,
-				cdnsp_trb_comp_code_string(GET_COMP_CODE(field2)),
-				EVENT_TRB_LEN(field2), TRB_TO_SLOT_ID(field3),
-				field3 & EVENT_DATA ? 'E' : 'e',
-				field3 & TRB_CYCLE ? 'C' : 'c');
+		ret = snprintf(str, size,
+			       "ep%d%s(%d) type '%s' TRB %08x%08x status '%s'"
+			       " len %ld slot %ld flags %c:%c",
+			       ep_num, ep_id % 2 ? "out" : "in",
+			       TRB_TO_EP_INDEX(field3),
+			       cdnsp_trb_type_string(type), field1, field0,
+			       cdnsp_trb_comp_code_string(GET_COMP_CODE(field2)),
+			       EVENT_TRB_LEN(field2), TRB_TO_SLOT_ID(field3),
+			       field3 & EVENT_DATA ? 'E' : 'e',
+			       field3 & TRB_CYCLE ? 'C' : 'c');
 		break;
 	case TRB_MFINDEX_WRAP:
-		ret += snprintf(str, size, "%s: flags %c",
-				cdnsp_trb_type_string(type),
-				field3 & TRB_CYCLE ? 'C' : 'c');
+		ret = snprintf(str, size, "%s: flags %c",
+			       cdnsp_trb_type_string(type),
+			       field3 & TRB_CYCLE ? 'C' : 'c');
 		break;
 	case TRB_SETUP:
-		ret += snprintf(str, size,
-				"type '%s' bRequestType %02x bRequest %02x "
-				"wValue %02x%02x wIndex %02x%02x wLength %d "
-				"length %ld TD size %ld intr %ld Setup ID %ld "
-				"flags %c:%c:%c",
-				cdnsp_trb_type_string(type),
-				field0 & 0xff,
-				(field0 & 0xff00) >> 8,
-				(field0 & 0xff000000) >> 24,
-				(field0 & 0xff0000) >> 16,
-				(field1 & 0xff00) >> 8,
-				field1 & 0xff,
-				(field1 & 0xff000000) >> 16 |
-				(field1 & 0xff0000) >> 16,
-				TRB_LEN(field2), GET_TD_SIZE(field2),
-				GET_INTR_TARGET(field2),
-				TRB_SETUPID_TO_TYPE(field3),
-				field3 & TRB_IDT ? 'D' : 'd',
-				field3 & TRB_IOC ? 'I' : 'i',
-				field3 & TRB_CYCLE ? 'C' : 'c');
+		ret = snprintf(str, size,
+			       "type '%s' bRequestType %02x bRequest %02x "
+			       "wValue %02x%02x wIndex %02x%02x wLength %d "
+			       "length %ld TD size %ld intr %ld Setup ID %ld "
+			       "flags %c:%c:%c",
+			       cdnsp_trb_type_string(type),
+			       field0 & 0xff,
+			       (field0 & 0xff00) >> 8,
+			       (field0 & 0xff000000) >> 24,
+			       (field0 & 0xff0000) >> 16,
+			       (field1 & 0xff00) >> 8,
+			       field1 & 0xff,
+			       (field1 & 0xff000000) >> 16 |
+			       (field1 & 0xff0000) >> 16,
+			       TRB_LEN(field2), GET_TD_SIZE(field2),
+			       GET_INTR_TARGET(field2),
+			       TRB_SETUPID_TO_TYPE(field3),
+			       field3 & TRB_IDT ? 'D' : 'd',
+			       field3 & TRB_IOC ? 'I' : 'i',
+			       field3 & TRB_CYCLE ? 'C' : 'c');
 		break;
 	case TRB_DATA:
-		ret += snprintf(str, size,
-				"type '%s' Buffer %08x%08x length %ld TD size %ld "
-				"intr %ld flags %c:%c:%c:%c:%c:%c:%c",
-				cdnsp_trb_type_string(type),
-				field1, field0, TRB_LEN(field2),
-				GET_TD_SIZE(field2),
-				GET_INTR_TARGET(field2),
-				field3 & TRB_IDT ? 'D' : 'i',
-				field3 & TRB_IOC ? 'I' : 'i',
-				field3 & TRB_CHAIN ? 'C' : 'c',
-				field3 & TRB_NO_SNOOP ? 'S' : 's',
-				field3 & TRB_ISP ? 'I' : 'i',
-				field3 & TRB_ENT ? 'E' : 'e',
-				field3 & TRB_CYCLE ? 'C' : 'c');
+		ret = snprintf(str, size,
+			       "type '%s' Buffer %08x%08x length %ld TD size %ld "
+			       "intr %ld flags %c:%c:%c:%c:%c:%c:%c",
+			       cdnsp_trb_type_string(type),
+			       field1, field0, TRB_LEN(field2),
+			       GET_TD_SIZE(field2),
+			       GET_INTR_TARGET(field2),
+			       field3 & TRB_IDT ? 'D' : 'i',
+			       field3 & TRB_IOC ? 'I' : 'i',
+			       field3 & TRB_CHAIN ? 'C' : 'c',
+			       field3 & TRB_NO_SNOOP ? 'S' : 's',
+			       field3 & TRB_ISP ? 'I' : 'i',
+			       field3 & TRB_ENT ? 'E' : 'e',
+			       field3 & TRB_CYCLE ? 'C' : 'c');
 		break;
 	case TRB_STATUS:
-		ret += snprintf(str, size,
-				"Buffer %08x%08x length %ld TD size %ld intr"
-				"%ld type '%s' flags %c:%c:%c:%c",
-				field1, field0, TRB_LEN(field2),
-				GET_TD_SIZE(field2),
-				GET_INTR_TARGET(field2),
-				cdnsp_trb_type_string(type),
-				field3 & TRB_IOC ? 'I' : 'i',
-				field3 & TRB_CHAIN ? 'C' : 'c',
-				field3 & TRB_ENT ? 'E' : 'e',
-				field3 & TRB_CYCLE ? 'C' : 'c');
+		ret = snprintf(str, size,
+			       "Buffer %08x%08x length %ld TD size %ld intr"
+			       "%ld type '%s' flags %c:%c:%c:%c",
+			       field1, field0, TRB_LEN(field2),
+			       GET_TD_SIZE(field2),
+			       GET_INTR_TARGET(field2),
+			       cdnsp_trb_type_string(type),
+			       field3 & TRB_IOC ? 'I' : 'i',
+			       field3 & TRB_CHAIN ? 'C' : 'c',
+			       field3 & TRB_ENT ? 'E' : 'e',
+			       field3 & TRB_CYCLE ? 'C' : 'c');
 		break;
 	case TRB_NORMAL:
 	case TRB_ISOC:
 	case TRB_EVENT_DATA:
 	case TRB_TR_NOOP:
-		ret += snprintf(str, size,
-				"type '%s' Buffer %08x%08x length %ld "
-				"TD size %ld intr %ld "
-				"flags %c:%c:%c:%c:%c:%c:%c:%c:%c",
-				cdnsp_trb_type_string(type),
-				field1, field0, TRB_LEN(field2),
-				GET_TD_SIZE(field2),
-				GET_INTR_TARGET(field2),
-				field3 & TRB_BEI ? 'B' : 'b',
-				field3 & TRB_IDT ? 'T' : 't',
-				field3 & TRB_IOC ? 'I' : 'i',
-				field3 & TRB_CHAIN ? 'C' : 'c',
-				field3 & TRB_NO_SNOOP ? 'S' : 's',
-				field3 & TRB_ISP ? 'I' : 'i',
-				field3 & TRB_ENT ? 'E' : 'e',
-				field3 & TRB_CYCLE ? 'C' : 'c',
-				!(field3 & TRB_EVENT_INVALIDATE) ? 'V' : 'v');
+		ret = snprintf(str, size,
+			       "type '%s' Buffer %08x%08x length %ld "
+			       "TD size %ld intr %ld "
+			       "flags %c:%c:%c:%c:%c:%c:%c:%c:%c",
+			       cdnsp_trb_type_string(type),
+			       field1, field0, TRB_LEN(field2),
+			       GET_TD_SIZE(field2),
+			       GET_INTR_TARGET(field2),
+			       field3 & TRB_BEI ? 'B' : 'b',
+			       field3 & TRB_IDT ? 'T' : 't',
+			       field3 & TRB_IOC ? 'I' : 'i',
+			       field3 & TRB_CHAIN ? 'C' : 'c',
+			       field3 & TRB_NO_SNOOP ? 'S' : 's',
+			       field3 & TRB_ISP ? 'I' : 'i',
+			       field3 & TRB_ENT ? 'E' : 'e',
+			       field3 & TRB_CYCLE ? 'C' : 'c',
+			       !(field3 & TRB_EVENT_INVALIDATE) ? 'V' : 'v');
 		break;
 	case TRB_CMD_NOOP:
 	case TRB_ENABLE_SLOT:
-		ret += snprintf(str, size, "%s: flags %c",
-				cdnsp_trb_type_string(type),
-				field3 & TRB_CYCLE ? 'C' : 'c');
+		ret = snprintf(str, size, "%s: flags %c",
+			       cdnsp_trb_type_string(type),
+			       field3 & TRB_CYCLE ? 'C' : 'c');
 		break;
 	case TRB_DISABLE_SLOT:
-		ret += snprintf(str, size, "%s: slot %ld flags %c",
-				cdnsp_trb_type_string(type),
-				TRB_TO_SLOT_ID(field3),
-				field3 & TRB_CYCLE ? 'C' : 'c');
+		ret = snprintf(str, size, "%s: slot %ld flags %c",
+			       cdnsp_trb_type_string(type),
+			       TRB_TO_SLOT_ID(field3),
+			       field3 & TRB_CYCLE ? 'C' : 'c');
 		break;
 	case TRB_ADDR_DEV:
-		ret += snprintf(str, size,
-				"%s: ctx %08x%08x slot %ld flags %c:%c",
-				cdnsp_trb_type_string(type), field1, field0,
-				TRB_TO_SLOT_ID(field3),
-				field3 & TRB_BSR ? 'B' : 'b',
-				field3 & TRB_CYCLE ? 'C' : 'c');
+		ret = snprintf(str, size,
+			       "%s: ctx %08x%08x slot %ld flags %c:%c",
+			       cdnsp_trb_type_string(type), field1, field0,
+			       TRB_TO_SLOT_ID(field3),
+			       field3 & TRB_BSR ? 'B' : 'b',
+			       field3 & TRB_CYCLE ? 'C' : 'c');
 		break;
 	case TRB_CONFIG_EP:
-		ret += snprintf(str, size,
-				"%s: ctx %08x%08x slot %ld flags %c:%c",
-				cdnsp_trb_type_string(type), field1, field0,
-				TRB_TO_SLOT_ID(field3),
-				field3 & TRB_DC ? 'D' : 'd',
-				field3 & TRB_CYCLE ? 'C' : 'c');
+		ret = snprintf(str, size,
+			       "%s: ctx %08x%08x slot %ld flags %c:%c",
+			       cdnsp_trb_type_string(type), field1, field0,
+			       TRB_TO_SLOT_ID(field3),
+			       field3 & TRB_DC ? 'D' : 'd',
+			       field3 & TRB_CYCLE ? 'C' : 'c');
 		break;
 	case TRB_EVAL_CONTEXT:
-		ret += snprintf(str, size,
-				"%s: ctx %08x%08x slot %ld flags %c",
-				cdnsp_trb_type_string(type), field1, field0,
-				TRB_TO_SLOT_ID(field3),
-				field3 & TRB_CYCLE ? 'C' : 'c');
+		ret = snprintf(str, size,
+			       "%s: ctx %08x%08x slot %ld flags %c",
+			       cdnsp_trb_type_string(type), field1, field0,
+			       TRB_TO_SLOT_ID(field3),
+			       field3 & TRB_CYCLE ? 'C' : 'c');
 		break;
 	case TRB_RESET_EP:
 	case TRB_HALT_ENDPOINT:
 	case TRB_FLUSH_ENDPOINT:
-		ret += snprintf(str, size,
-				"%s: ep%d%s(%d) ctx %08x%08x slot %ld flags %c",
-				cdnsp_trb_type_string(type),
-				ep_num, ep_id % 2 ? "out" : "in",
-				TRB_TO_EP_INDEX(field3), field1, field0,
-				TRB_TO_SLOT_ID(field3),
-				field3 & TRB_CYCLE ? 'C' : 'c');
+		ret = snprintf(str, size,
+			       "%s: ep%d%s(%d) ctx %08x%08x slot %ld flags %c",
+			       cdnsp_trb_type_string(type),
+			       ep_num, ep_id % 2 ? "out" : "in",
+			       TRB_TO_EP_INDEX(field3), field1, field0,
+			       TRB_TO_SLOT_ID(field3),
+			       field3 & TRB_CYCLE ? 'C' : 'c');
 		break;
 	case TRB_STOP_RING:
-		ret += snprintf(str, size,
-				"%s: ep%d%s(%d) slot %ld sp %d flags %c",
-				cdnsp_trb_type_string(type),
-				ep_num, ep_id % 2 ? "out" : "in",
-				TRB_TO_EP_INDEX(field3),
-				TRB_TO_SLOT_ID(field3),
-				TRB_TO_SUSPEND_PORT(field3),
-				field3 & TRB_CYCLE ? 'C' : 'c');
+		ret = snprintf(str, size,
+			       "%s: ep%d%s(%d) slot %ld sp %d flags %c",
+			       cdnsp_trb_type_string(type),
+			       ep_num, ep_id % 2 ? "out" : "in",
+			       TRB_TO_EP_INDEX(field3),
+			       TRB_TO_SLOT_ID(field3),
+			       TRB_TO_SUSPEND_PORT(field3),
+			       field3 & TRB_CYCLE ? 'C' : 'c');
 		break;
 	case TRB_SET_DEQ:
-		ret += snprintf(str, size,
-				"%s: ep%d%s(%d) deq %08x%08x stream %ld slot %ld  flags %c",
-				cdnsp_trb_type_string(type),
-				ep_num, ep_id % 2 ? "out" : "in",
-				TRB_TO_EP_INDEX(field3), field1, field0,
-				TRB_TO_STREAM_ID(field2),
-				TRB_TO_SLOT_ID(field3),
-				field3 & TRB_CYCLE ? 'C' : 'c');
+		ret = snprintf(str, size,
+			       "%s: ep%d%s(%d) deq %08x%08x stream %ld slot %ld  flags %c",
+			       cdnsp_trb_type_string(type),
+			       ep_num, ep_id % 2 ? "out" : "in",
+			       TRB_TO_EP_INDEX(field3), field1, field0,
+			       TRB_TO_STREAM_ID(field2),
+			       TRB_TO_SLOT_ID(field3),
+			       field3 & TRB_CYCLE ? 'C' : 'c');
 		break;
 	case TRB_RESET_DEV:
-		ret += snprintf(str, size, "%s: slot %ld flags %c",
-				cdnsp_trb_type_string(type),
-				TRB_TO_SLOT_ID(field3),
-				field3 & TRB_CYCLE ? 'C' : 'c');
+		ret = snprintf(str, size, "%s: slot %ld flags %c",
+			       cdnsp_trb_type_string(type),
+			       TRB_TO_SLOT_ID(field3),
+			       field3 & TRB_CYCLE ? 'C' : 'c');
 		break;
 	case TRB_ENDPOINT_NRDY:
-		temp  = TRB_TO_HOST_STREAM(field2);
-
-		ret += snprintf(str, size,
-				"%s: ep%d%s(%d) H_SID %x%s%s D_SID %lx flags %c:%c",
-				cdnsp_trb_type_string(type),
-				ep_num, ep_id % 2 ? "out" : "in",
-				TRB_TO_EP_INDEX(field3), temp,
-				temp == STREAM_PRIME_ACK ? "(PRIME)" : "",
-				temp == STREAM_REJECTED ? "(REJECTED)" : "",
-				TRB_TO_DEV_STREAM(field0),
-				field3 & TRB_STAT ? 'S' : 's',
-				field3 & TRB_CYCLE ? 'C' : 'c');
+		temp = TRB_TO_HOST_STREAM(field2);
+
+		ret = snprintf(str, size,
+			       "%s: ep%d%s(%d) H_SID %x%s%s D_SID %lx flags %c:%c",
+			       cdnsp_trb_type_string(type),
+			       ep_num, ep_id % 2 ? "out" : "in",
+			       TRB_TO_EP_INDEX(field3), temp,
+			       temp == STREAM_PRIME_ACK ? "(PRIME)" : "",
+			       temp == STREAM_REJECTED ? "(REJECTED)" : "",
+			       TRB_TO_DEV_STREAM(field0),
+			       field3 & TRB_STAT ? 'S' : 's',
+			       field3 & TRB_CYCLE ? 'C' : 'c');
 		break;
 	default:
-		ret += snprintf(str, size,
-				"type '%s' -> raw %08x %08x %08x %08x",
-				cdnsp_trb_type_string(type),
-				field0, field1, field2, field3);
+		ret = snprintf(str, size,
+			       "type '%s' -> raw %08x %08x %08x %08x",
+			       cdnsp_trb_type_string(type),
+			       field0, field1, field2, field3);
 	}
 
+	if (ret >= size)
+		pr_info("CDNSP: buffer overflowed.\n");
+
 	return str;
 }
 
-- 
2.34.1

