Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91FC2D86AC
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2019 05:34:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403886AbfJPDec (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Oct 2019 23:34:32 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:42937 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403885AbfJPDd6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Oct 2019 23:33:58 -0400
Received: by mail-pl1-f193.google.com with SMTP id e5so10561947pls.9
        for <linux-usb@vger.kernel.org>; Tue, 15 Oct 2019 20:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=9P5p/4dcNs8ql4OyOSsDmP/Eo0cfZOKgwuYqI45wfJg=;
        b=S8QPNSs9adnyu7KEv9w2knTdoCT6Ms5rsg3c0ffAASNps2kXgSHXVyQ2mcSTBv21pX
         HpiPueBop6ANtnLDdDM219VIxyxIDzV1XIyQLdIlsn6H7kpXN08T4H2t6Rv5Y8ZDk7Qk
         aWEu4HWD6MZj/ZsgBOepxlViw6srTSWs4q/Myt8R5fJJeqDVHBoUhKafpkTSWkUOAqkv
         VRvYg/3dGEpUstTHwXoxRrGl5n+Oy7pbRQfziY29IchEfUJjKeaQY8viJhlbdeIqprsl
         Kpr+296Mg3oNMAwBKtzRlp2kndkIL+mCifQBnCMWIPjvIFMe0I1ZgkomiHsoALoX5zfh
         Unuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=9P5p/4dcNs8ql4OyOSsDmP/Eo0cfZOKgwuYqI45wfJg=;
        b=kkvT7A5lh/4gAhijSFJqo3oe1VPtOVYz+kOXK0fsNOGjmmrF8gToNYc+jx8oKGc/M8
         gWKHbzKzbtapSUhhFMHB1e7fyTunwM1vWssgZVdMcPLBCBSi0ZcUHeNtn+ENEU2MoOBN
         spUR4dkP4vXsbdAg+ASzTasNvI9QG4SOahYciKgqRZLGSlGNcw83EYEQD6AhYhM3As2Z
         rreUOquvO5bHCp+d1Jg88ems1qdC4e7uVUs/81UDu/fPn4Et+CJyAwcw6Q/+cbd0hQ5o
         05YjoU13LohhVNmWRo/zWrKiNubxvbIekrlBJUUm65glw2sXIGTtIChJAImaVdHTyap3
         Kwhw==
X-Gm-Message-State: APjAAAX3h6wnKhaB3UGeCQhqg6SM+90B+Dwc6pjWcQaXxy+HCkCmWKTG
        JaxOwV0XbijcDauxCTIY+bTg8w==
X-Google-Smtp-Source: APXvYqzppbYL+EYic/A6NgNFl9sC0kKMhtR0UaCTPvDBIK3mJX+2b+D+VGulj/UhBdNR+k2Qm9/DSA==
X-Received: by 2002:a17:902:322:: with SMTP id 31mr36939961pld.162.1571196837356;
        Tue, 15 Oct 2019 20:33:57 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id l23sm748356pjy.12.2019.10.15.20.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 20:33:56 -0700 (PDT)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        ShuFan Lee <shufan_lee@richtek.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Yu Chen <chenyu56@huawei.com>, Felipe Balbi <balbi@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jun Li <lijun.kernel@gmail.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Jack Pham <jackp@codeaurora.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [RFC][PATCH v3 09/11] usb: dwc3: Add host-mode as default support
Date:   Wed, 16 Oct 2019 03:33:38 +0000
Message-Id: <20191016033340.1288-10-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191016033340.1288-1-john.stultz@linaro.org>
References: <20191016033340.1288-1-john.stultz@linaro.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Support configuring the default role the controller assumes as
host mode when the usb role is USB_ROLE_NONE

This patch was split out from a larger patch originally by
Yu Chen <chenyu56@huawei.com>

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
CC: ShuFan Lee <shufan_lee@richtek.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Yu Chen <chenyu56@huawei.com>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jun Li <lijun.kernel@gmail.com>
Cc: Valentin Schneider <valentin.schneider@arm.com>
Cc: Jack Pham <jackp@codeaurora.org>
Cc: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
v3: Split this patch out from addition of usb-role-switch
    handling
---
 drivers/usb/dwc3/core.h |  3 +++
 drivers/usb/dwc3/drd.c  | 20 ++++++++++++++++----
 2 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 6f19e9891767..3c879c9ab1aa 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -953,6 +953,8 @@ struct dwc3_scratchpad_array {
  *		- USBPHY_INTERFACE_MODE_UTMI
  *		- USBPHY_INTERFACE_MODE_UTMIW
  * @role_sw: usb_role_switch handle
+ * @role_switch_default_mode: default operation mode of controller while
+ *			usb role is USB_ROLE_NONE.
  * @usb2_phy: pointer to USB2 PHY
  * @usb3_phy: pointer to USB3 PHY
  * @usb2_generic_phy: pointer to USB2 PHY
@@ -1087,6 +1089,7 @@ struct dwc3 {
 	struct notifier_block	edev_nb;
 	enum usb_phy_interface	hsphy_mode;
 	struct usb_role_switch	*role_sw;
+	enum usb_dr_mode	role_switch_default_mode;
 
 	u32			fladj;
 	u32			irq_gadget;
diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
index 61d4fd8aead4..0e3466fe5ac4 100644
--- a/drivers/usb/dwc3/drd.c
+++ b/drivers/usb/dwc3/drd.c
@@ -489,7 +489,10 @@ static int dwc3_usb_role_switch_set(struct device *dev, enum usb_role role)
 		mode = DWC3_GCTL_PRTCAP_DEVICE;
 		break;
 	default:
-		mode = DWC3_GCTL_PRTCAP_DEVICE;
+		if (dwc->role_switch_default_mode == USB_DR_MODE_HOST)
+			mode = DWC3_GCTL_PRTCAP_HOST;
+		else
+			mode = DWC3_GCTL_PRTCAP_DEVICE;
 		break;
 	}
 
@@ -515,7 +518,10 @@ static enum usb_role dwc3_usb_role_switch_get(struct device *dev)
 		role = dwc->current_otg_role;
 		break;
 	default:
-		role = USB_ROLE_DEVICE;
+		if (dwc->role_switch_default_mode == USB_DR_MODE_HOST)
+			role = USB_ROLE_HOST;
+		else
+			role = USB_ROLE_DEVICE;
 		break;
 	}
 	spin_unlock_irqrestore(&dwc->lock, flags);
@@ -534,8 +540,14 @@ int dwc3_drd_init(struct dwc3 *dwc)
 		struct usb_role_switch_desc dwc3_role_switch = {NULL};
 		u32 mode;
 
-		mode = DWC3_GCTL_PRTCAP_DEVICE;
-
+		if (device_property_read_bool(dwc->dev,
+					      "role-switch-default-host")) {
+			dwc->role_switch_default_mode = USB_DR_MODE_HOST;
+			mode = DWC3_GCTL_PRTCAP_HOST;
+		} else {
+			dwc->role_switch_default_mode = USB_DR_MODE_PERIPHERAL;
+			mode = DWC3_GCTL_PRTCAP_DEVICE;
+		}
 		dwc3_role_switch.fwnode = dev_fwnode(dwc->dev);
 		dwc3_role_switch.set = dwc3_usb_role_switch_set;
 		dwc3_role_switch.get = dwc3_usb_role_switch_get;
-- 
2.17.1

