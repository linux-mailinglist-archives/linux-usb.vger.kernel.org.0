Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF4E3210A96
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jul 2020 13:56:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730419AbgGAL4X (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Jul 2020 07:56:23 -0400
Received: from mga07.intel.com ([134.134.136.100]:8600 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730374AbgGAL4X (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 1 Jul 2020 07:56:23 -0400
IronPort-SDR: 9ylQ8NdVfgzPOurkK5OiM5S0EeWQZM0Ir0X6hDRmSUaMX47H5Ls6tY1BMrp9Zbtmr+JKG5w408
 iGbpFf777MDA==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="211607997"
X-IronPort-AV: E=Sophos;i="5.75,300,1589266800"; 
   d="scan'208";a="211607997"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2020 04:56:23 -0700
IronPort-SDR: zbLY/2+T+blpg0yGhLIecwSTQQxLSJWGZTbKu/VILO73iIyNyFjQCYDtiElVUxTg7WP63mFEKr
 p+p106PkVqzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,300,1589266800"; 
   d="scan'208";a="386988134"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 01 Jul 2020 04:56:21 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Prashant Malani <pmalani@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        "Mani, Rajmohan" <rajmohan.mani@intel.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH 1/4] usb: typec: Combine the definitions for Accessory and USB modes
Date:   Wed,  1 Jul 2020 14:56:15 +0300
Message-Id: <20200701115618.22482-2-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200701115618.22482-1-heikki.krogerus@linux.intel.com>
References: <20200701115618.22482-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There is no need to describe them sparately.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 include/linux/usb/typec_altmode.h | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/include/linux/usb/typec_altmode.h b/include/linux/usb/typec_altmode.h
index d834e236c6df6..a4b65eaa0f623 100644
--- a/include/linux/usb/typec_altmode.h
+++ b/include/linux/usb/typec_altmode.h
@@ -95,13 +95,7 @@ enum {
  *
  * Port drivers can use TYPEC_MODE_AUDIO and TYPEC_MODE_DEBUG as the mode
  * value for typec_set_mode() when accessory modes are supported.
- */
-enum {
-	TYPEC_MODE_AUDIO = TYPEC_STATE_MODAL,	/* Audio Accessory */
-	TYPEC_MODE_DEBUG,			/* Debug Accessory */
-};
-
-/*
+ *
  * USB4 also requires that the pins on the connector are repurposed, just like
  * Alternate Modes. USB4 mode is however not entered with the Enter Mode Command
  * like the Alternate Modes are, but instead with a special Enter_USB Message.
@@ -112,9 +106,11 @@ enum {
  * state values, just like the Accessory Modes.
  */
 enum {
-	TYPEC_MODE_USB2 = TYPEC_MODE_DEBUG,	/* USB 2.0 mode */
+	TYPEC_MODE_USB2 = TYPEC_STATE_MODAL,	/* USB 2.0 mode */
 	TYPEC_MODE_USB3,			/* USB 3.2 mode */
-	TYPEC_MODE_USB4				/* USB4 mode */
+	TYPEC_MODE_USB4,			/* USB4 mode */
+	TYPEC_MODE_AUDIO,			/* Audio Accessory */
+	TYPEC_MODE_DEBUG,			/* Debug Accessory */
 };
 
 #define TYPEC_MODAL_STATE(_state_)	((_state_) + TYPEC_STATE_MODAL)
-- 
2.27.0

