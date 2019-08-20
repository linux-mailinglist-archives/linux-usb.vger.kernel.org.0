Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86C0A95378
	for <lists+linux-usb@lfdr.de>; Tue, 20 Aug 2019 03:35:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728982AbfHTBfz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Aug 2019 21:35:55 -0400
Received: from smtprelay-out1.synopsys.com ([198.182.47.102]:50112 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728627AbfHTBfy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Aug 2019 21:35:54 -0400
Received: from mailhost.synopsys.com (dc8-mailhost2.synopsys.com [10.13.135.210])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D53A5C0134;
        Tue, 20 Aug 2019 01:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1566264953; bh=nP/C/1XlWZRgQzsMF6HxKTSTYMg2hn7UfB6YhKNB2xg=;
        h=Date:In-Reply-To:References:From:Subject:To:CC:From;
        b=JuKZ2//rvh5qDTygFPKiIOhgt962HW8nNF7tve5TI9yP1NGRQvr+OGBPwMBPLKyK6
         aggqiWEubljDbNCKAihcpceK+K21YtgHWDoEslt3/iUeXgWQ8o2T1wqJcn/02hfTwU
         VTCTaGDPJ/UCxlld7ZeXEHaJe3VcmWPaYWdz/Xs1zM6pN3OG8NED8cpzLR0FGPfcgp
         YN8KkXeHyLpdhSr4PdZa2egyHWAUg3jXxX0/O0WazybFNmc+Rbcw+rUt62qkY2q9/5
         NX6DrRfaX2CBBABOIKfrzvao3SawcwsLGyBgleoUk93WzV49cUv+QD9dDF3QZ6uXTX
         xHC7IcB+hHDvg==
Received: from us01wehtc1.internal.synopsys.com (us01wehtc1-vip.internal.synopsys.com [10.12.239.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 9E6BAA0068;
        Tue, 20 Aug 2019 01:35:53 +0000 (UTC)
Received: from US01WEHTC3.internal.synopsys.com (10.15.84.232) by
 us01wehtc1.internal.synopsys.com (10.12.239.231) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 19 Aug 2019 18:35:53 -0700
Received: from te-lab16 (10.13.184.19) by US01WEHTC3.internal.synopsys.com
 (10.15.84.231) with Microsoft SMTP Server (TLS) id 14.3.408.0; Mon, 19 Aug
 2019 18:35:47 -0700
Received: by te-lab16 (sSMTP sendmail emulation); Mon, 19 Aug 2019 18:35:47
 -0700
Date:   Mon, 19 Aug 2019 18:35:47 -0700
Message-ID: <58310eda9c265f7cffcc130ccea10c496ec303dd.1566263914.git.thinhn@synopsys.com>
In-Reply-To: <cover.1566263914.git.thinhn@synopsys.com>
References: <cover.1566263914.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 1/4] usb: gadget: Export recommended BESL values
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.13.184.19]
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Currently there's no option for the controller driver to report the
recommended Best Effort Service Latency (BESL) when operating with LPM
support. Add new fields in usb_dcd_config_params to export the
recommended baseline and deep BESL values for the function drivers to
set the proper BESL value in the BOS descriptor.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 include/linux/usb/gadget.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
index fb19141151d8..124462d65eac 100644
--- a/include/linux/usb/gadget.h
+++ b/include/linux/usb/gadget.h
@@ -291,6 +291,9 @@ struct usb_dcd_config_params {
 #define USB_DEFAULT_U1_DEV_EXIT_LAT	0x01	/* Less then 1 microsec */
 	__le16 bU2DevExitLat;	/* U2 Device exit Latency */
 #define USB_DEFAULT_U2_DEV_EXIT_LAT	0x1F4	/* Less then 500 microsec */
+	__u8 besl_baseline;	/* Recommended baseline BESL (0-15) */
+	__u8 besl_deep;		/* Recommended deep BESL (0-15) */
+#define USB_DEFAULT_BESL_UNSPECIFIED	0xFF	/* No recommended value */
 };
 
 
-- 
2.11.0

