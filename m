Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D804E171B69
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2020 15:02:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733065AbgB0OCI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Feb 2020 09:02:08 -0500
Received: from mga04.intel.com ([192.55.52.120]:59515 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733057AbgB0OCH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 27 Feb 2020 09:02:07 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 27 Feb 2020 06:02:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,492,1574150400"; 
   d="diff'?scan'208";a="350690315"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 27 Feb 2020 06:02:04 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 27 Feb 2020 16:02:04 +0200
Date:   Thu, 27 Feb 2020 16:02:04 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Ajay Gupta <ajaykuee@gmail.com>
Cc:     linux-usb@vger.kernel.org, Ajay Gupta <ajayg@nvidia.com>
Subject: Re: [PATCH] usb: typec: ucsi_ccg: workaround for NVIDIA test device
Message-ID: <20200227140204.GD10532@kuha.fi.intel.com>
References: <20200218231520.12208-1-ajayg@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="K8nIJk4ghYZn606h"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200218231520.12208-1-ajayg@nvidia.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--K8nIJk4ghYZn606h
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Ajay,

On Tue, Feb 18, 2020 at 03:15:20PM -0800, Ajay Gupta wrote:
> From: Ajay Gupta <ajayg@nvidia.com>
> 
> NVIDIA VirtualLink (svid 0x955) has two altmode, vdo=0x1 for
> VirtualLink DP mode and vdo=0x3 for NVIDIA test mode. NVIDIA
> test device FTB (Function Test Board) reports altmode list with
> vdo=0x3 first and then vdo=0x1. The list is:
>  SVID   VDO
> 0xff01  0xc05
> 0x28de  0x8085
> 0x955   0x3
> 0x955   0x1
> 
> Current logic to assign mode value is based on order
> in altmode list. This causes a mismatch of CON and SOP altmodes
> since NVIDIA GPU connector has order of vdo=0x1 first and then
> vdo=0x3. Fixing this by changing the order of vdo values
> reported by NVIDIA test device. the new list will be:
> 
>  SVID   VDO
> 0xff01  0xc05
> 0x28de  0x8085
> 0x955   0x1085
> 0x955   0x3
> 
> Also NVIDIA VirtualLink (svid 0x955) uses pin E for display mode.
> NVIDIA test device reports vdo of 0x1 so make sure vdo values
> always have pin E assignement.
> 
> Signed-off-by: Ajay Gupta <ajayg@nvidia.com>
> ---
>  drivers/usb/typec/ucsi/ucsi.h     |  2 ++
>  drivers/usb/typec/ucsi/ucsi_ccg.c | 27 +++++++++++++++++++++++++++
>  2 files changed, 29 insertions(+)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
> index a89112b69cd5..8e831108f481 100644
> --- a/drivers/usb/typec/ucsi/ucsi.h
> +++ b/drivers/usb/typec/ucsi/ucsi.h
> @@ -119,12 +119,14 @@ void ucsi_connector_change(struct ucsi *ucsi, u8 num);
>  #define UCSI_SET_PDR_ACCEPT_ROLE_SWAPS		BIT(25)
>  
>  /* GET_ALTERNATE_MODES command bits */
> +#define UCSI_ALTMODE_RECIPIENT(_r_)		(((_r_) >> 16) & 0x7)
>  #define UCSI_GET_ALTMODE_RECIPIENT(_r_)		((u64)(_r_) << 16)
>  #define   UCSI_RECIPIENT_CON			0
>  #define   UCSI_RECIPIENT_SOP			1
>  #define   UCSI_RECIPIENT_SOP_P			2
>  #define   UCSI_RECIPIENT_SOP_PP			3
>  #define UCSI_GET_ALTMODE_CONNECTOR_NUMBER(_r_)	((u64)(_r_) << 24)
> +#define UCSI_ALTMODE_OFFSET(_r_)		(((_r_) >> 32) & 0xff)
>  #define UCSI_GET_ALTMODE_OFFSET(_r_)		((u64)(_r_) << 32)
>  #define UCSI_GET_ALTMODE_NUM_ALTMODES(_r_)	((u64)(_r_) << 40)
>  
> diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
> index 2658cda5da11..b421b0045448 100644
> --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
> +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
> @@ -125,6 +125,10 @@ struct version_format {
>  #define CCG_FW_BUILD_NVIDIA	(('n' << 8) | 'v')
>  #define CCG_OLD_FW_VERSION	(CCG_VERSION(0x31) | CCG_VERSION_PATCH(10))
>  
> +/* Altmode offset for NVIDIA Function Test Board (FTB) */
> +#define USB_TYPEC_NVIDIA_FTB_DP_OFFSET	(2)
> +#define USB_TYPEC_NVIDIA_FTB_DBG_OFFSET	(3)
> +
>  struct version_info {
>  	struct version_format base;
>  	struct version_format app;
> @@ -489,6 +493,29 @@ static int ucsi_ccg_read(struct ucsi *ucsi, unsigned int offset,
>  		return ret;
>  
>  	if (offset == UCSI_MESSAGE_IN) {
> +		if (UCSI_COMMAND(uc->last_cmd_sent) ==
> +		    UCSI_GET_ALTERNATE_MODES &&
> +		    UCSI_ALTMODE_RECIPIENT(uc->last_cmd_sent) ==
> +		    UCSI_RECIPIENT_SOP) {
> +			struct ucsi_altmode *alt = (struct ucsi_altmode *)val;
> +
> +			if (alt[0].svid == USB_TYPEC_NVIDIA_VLINK_SID &&
> +			    UCSI_ALTMODE_OFFSET(uc->last_cmd_sent) ==
> +			    USB_TYPEC_NVIDIA_FTB_DP_OFFSET &&
> +			    alt[0].mid == USB_TYPEC_NVIDIA_VLINK_DBG_VDO) {
> +				alt[0].mid = USB_TYPEC_NVIDIA_VLINK_DP_VDO |
> +						DP_CAP_DP_SIGNALING |
> +						DP_CAP_USB |
> +						DP_CONF_SET_PIN_ASSIGN(BIT
> +							(DP_PIN_ASSIGN_E));
> +			}
> +			if (alt[0].svid == USB_TYPEC_NVIDIA_VLINK_SID &&
> +			    UCSI_ALTMODE_OFFSET(uc->last_cmd_sent) ==
> +			    USB_TYPEC_NVIDIA_FTB_DBG_OFFSET &&
> +			    alt[0].mid == USB_TYPEC_NVIDIA_VLINK_DP_VDO) {
> +				alt[0].mid = USB_TYPEC_NVIDIA_VLINK_DBG_VDO;
> +			}
> +		}
>  		if (UCSI_COMMAND(uc->last_cmd_sent) == UCSI_GET_CURRENT_CAM &&
>  		    uc->has_multiple_dp) {
>  			ucsi_ccg_update_get_current_cam_cmd(uc, (u8 *)val);

This did not compile:

drivers/usb/typec/ucsi/ucsi_ccg.c: In function ‘ucsi_ccg_read’:
drivers/usb/typec/ucsi/ucsi_ccg.c:505:22: error: ‘USB_TYPEC_NVIDIA_VLINK_DBG_VDO’ undeclared (first use in this function); did you mean ‘USB_TYPEC_NVIDIA_VLINK_SID’?
  505 |        alt[0].mid == USB_TYPEC_NVIDIA_VLINK_DBG_VDO) {
      |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                      USB_TYPEC_NVIDIA_VLINK_SID
drivers/usb/typec/ucsi/ucsi_ccg.c:505:22: note: each undeclared identifier is reported only once for each function it appears in
drivers/usb/typec/ucsi/ucsi_ccg.c:506:18: error: ‘USB_TYPEC_NVIDIA_VLINK_DP_VDO’ undeclared (first use in this function); did you mean ‘USB_TYPEC_NVIDIA_VLINK_SID’?
  506 |     alt[0].mid = USB_TYPEC_NVIDIA_VLINK_DP_VDO |
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                  USB_TYPEC_NVIDIA_VLINK_SID


All those nested conditions make the code a bit difficult to read for
me. You could handle the NVIDIA alt mode in its own function. I'm
attaching a diff that you should be able to apply on top of your patch
that should make the code a bit easier to read.

thanks,

-- 
heikki

--K8nIJk4ghYZn606h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="ucsi_ccg_nvidia_altmode.diff"

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index d2bc5681fe8e..4c8c799181b9 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -126,8 +126,8 @@ struct version_format {
 #define CCG_OLD_FW_VERSION	(CCG_VERSION(0x31) | CCG_VERSION_PATCH(10))
 
 /* Altmode offset for NVIDIA Function Test Board (FTB) */
-#define USB_TYPEC_NVIDIA_FTB_DP_OFFSET	(2)
-#define USB_TYPEC_NVIDIA_FTB_DBG_OFFSET	(3)
+#define NVIDIA_FTB_DP_OFFSET	(2)
+#define NVIDIA_FTB_DBG_OFFSET	(3)
 
 struct version_info {
 	struct version_format base;
@@ -481,49 +481,55 @@ static void ucsi_ccg_update_set_new_cam_cmd(struct ucsi_ccg *uc,
 	*cmd |= UCSI_SET_NEW_CAM_SET_AM(cam);
 }
 
+/*
+ * FIXME: A short explanation what this function does.
+ */
+static int ucsi_ccg_nvidia_altmode(struct ucsi_ccg *uc,
+				   struct ucsi_altmode *alt)
+{
+	if (UCSI_ALTMODE_OFFSET(uc->last_cmd_sent) == NVIDIA_FTB_DP_OFFSET &&
+	    alt[0].mid == NVIDIA_VLINK_DBG_VDO)
+		alt[0].mid = USB_TYPEC_NVIDIA_VLINK_DP_VDO |
+		             DP_CAP_DP_SIGNALING | DP_CAP_USB |
+			     DP_CONF_SET_PIN_ASSIGN(BIT(DP_PIN_ASSIGN_E));
+
+	if (UCSI_ALTMODE_OFFSET(uc->last_cmd_sent) == NVIDIA_FTB_DBG_OFFSET &&
+	    alt[0].mid == USB_TYPEC_NVIDIA_VLINK_DP_VDO)
+		alt[0].mid = NVIDIA_VLINK_DBG_VDO;
+
+	return 0;
+}
+
 static int ucsi_ccg_read(struct ucsi *ucsi, unsigned int offset,
 			 void *val, size_t val_len)
 {
 	struct ucsi_ccg *uc = ucsi_get_drvdata(ucsi);
-	int ret;
 	u16 reg = CCGX_RAB_UCSI_DATA_BLOCK(offset);
+	struct ucsi_altmode *alt;
+	int ret;
 
 	ret = ccg_read(uc, reg, val, val_len);
 	if (ret)
 		return ret;
 
-	if (offset == UCSI_MESSAGE_IN) {
-		if (UCSI_COMMAND(uc->last_cmd_sent) ==
-		    UCSI_GET_ALTERNATE_MODES &&
-		    UCSI_ALTMODE_RECIPIENT(uc->last_cmd_sent) ==
-		    UCSI_RECIPIENT_SOP) {
-			struct ucsi_altmode *alt = (struct ucsi_altmode *)val;
-
-			if (alt[0].svid == USB_TYPEC_NVIDIA_VLINK_SID &&
-			    UCSI_ALTMODE_OFFSET(uc->last_cmd_sent) ==
-			    USB_TYPEC_NVIDIA_FTB_DP_OFFSET &&
-			    alt[0].mid == USB_TYPEC_NVIDIA_VLINK_DBG_VDO) {
-				alt[0].mid = USB_TYPEC_NVIDIA_VLINK_DP_VDO |
-						DP_CAP_DP_SIGNALING |
-						DP_CAP_USB |
-						DP_CONF_SET_PIN_ASSIGN(BIT
-							(DP_PIN_ASSIGN_E));
-			}
-			if (alt[0].svid == USB_TYPEC_NVIDIA_VLINK_SID &&
-			    UCSI_ALTMODE_OFFSET(uc->last_cmd_sent) ==
-			    USB_TYPEC_NVIDIA_FTB_DBG_OFFSET &&
-			    alt[0].mid == USB_TYPEC_NVIDIA_VLINK_DP_VDO) {
-				alt[0].mid = USB_TYPEC_NVIDIA_VLINK_DBG_VDO;
-			}
-		}
-		if (UCSI_COMMAND(uc->last_cmd_sent) == UCSI_GET_CURRENT_CAM &&
-		    uc->has_multiple_dp) {
+	if (offset != UCSI_MESSAGE_IN)
+		return 0;
+
+	switch (UCSI_COMMAND(uc->last_cmd_sent)) {
+	case UCSI_GET_CURRENT_CAM:
+		if (uc->has_multiple_dp)
 			ucsi_ccg_update_get_current_cam_cmd(uc, (u8 *)val);
-		}
-		uc->last_cmd_sent = 0;
+		break;
+	case UCSI_GET_ALTERNATE_MODES:
+		alt = val;
+		if (alt[0].svid == USB_TYPEC_NVIDIA_VLINK_SID)
+			return ucsi_ccg_nvidia_altmode(uc, alt);
+		break;
+	default:
+		break;
 	}
 
-	return ret;
+	return 0;
 }
 
 static int ucsi_ccg_async_write(struct ucsi *ucsi, unsigned int offset,

--K8nIJk4ghYZn606h--
