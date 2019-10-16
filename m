Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA1B4D8D40
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2019 12:05:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729857AbfJPKFJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Oct 2019 06:05:09 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:40696 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728081AbfJPKFI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Oct 2019 06:05:08 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9GA4wB5076543;
        Wed, 16 Oct 2019 05:04:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571220298;
        bh=TOtq7/uBhvMQEaiIM1zV+jIeZbkMvT9UMyYNJVM2XaQ=;
        h=From:To:CC:Subject:Date;
        b=UtzTLlujpWjxMQy2t9WHQlhA8ClUuiH4S/XNLq1Nzbg7szAxEIGIL43NhDAGVLClF
         JCEnImfVZ/Vi2lN1wRXAm5xcr6SAiZi5WAaqGN+yZmrdhtz0K/z1lLQIOJO1inzYWm
         ey5rP+y1WLG2FH0ZVALsoafya0pt9Dr/5Pda66yw=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9GA4wDB095648;
        Wed, 16 Oct 2019 05:04:58 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 16
 Oct 2019 05:04:50 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 16 Oct 2019 05:04:50 -0500
Received: from lta0400828a.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9GA4sKB001596;
        Wed, 16 Oct 2019 05:04:55 -0500
From:   Roger Quadros <rogerq@ti.com>
To:     <felipe.balbi@linux.intel.com>, <gregkh@linuxfoundation.org>
CC:     <pawell@cadence.com>, <peter.chen@nxp.com>, <nsekhar@ti.com>,
        <kurahul@cadence.com>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Roger Quadros <rogerq@ti.com>
Subject: [PATCH v2 0/2] usb: cdns3: fixes for 5.4-rc
Date:   Wed, 16 Oct 2019 13:04:50 +0300
Message-ID: <20191016100452.32613-1-rogerq@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

Here are 2 fixes we found while testing the cdns3 driver
on our platform.

The first one fixes a corner case where super-speed in host mode 
doesn't work if device was plugged before the cdns3 driver probes.

The second one fixes the case when gadget driver is
limited to full-speed.

cheers,
-roger

Changelog:
v2
- treat USB_DR_MODE_UNKNOWN as error case

Roger Quadros (2):
  usb: cdns3: fix cdns3_core_init_role()
  usb: cdns3: gadget: Fix full-speed mode

 drivers/usb/cdns3/core.c   | 22 +++++++++++++++++++++-
 drivers/usb/cdns3/gadget.c |  1 +
 2 files changed, 22 insertions(+), 1 deletion(-)

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

