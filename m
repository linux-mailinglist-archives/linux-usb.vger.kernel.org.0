Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECC3CCE159
	for <lists+linux-usb@lfdr.de>; Mon,  7 Oct 2019 14:16:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727589AbfJGMQS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Oct 2019 08:16:18 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:34748 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727467AbfJGMQS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Oct 2019 08:16:18 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x97CG9Mx022896;
        Mon, 7 Oct 2019 07:16:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570450569;
        bh=yY9aXbrPimAArqbMwwFPF64und8lolvhQapdUItwne4=;
        h=From:To:CC:Subject:Date;
        b=hgS4VWbKc8KGFY7ZeqrU3SR21Fe5v23vIwAlDh7sV2hPj7gUZxBdHAT5Bo+hqzBWJ
         y72e1GCzzomHRFIK9JPanDZ6iNvVtDHKLUHSA/Or7/gdTR7kb6CGuNESWGBQwcoPo8
         44YMFQfuNr2fo/i2lj0ARuek0ppbrvH6tDpZni94=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x97CG9fv050561
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 7 Oct 2019 07:16:09 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 7 Oct
 2019 07:16:06 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 7 Oct 2019 07:16:06 -0500
Received: from lta0400828a.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x97CG6fK070909;
        Mon, 7 Oct 2019 07:16:06 -0500
From:   Roger Quadros <rogerq@ti.com>
To:     <felipe.balbi@linux.intel.com>, <gregkh@linuxfoundation.org>,
        <pawell@cadence.com>
CC:     <peter.chen@nxp.com>, <nsekhar@ti.com>, <kurahul@cadence.com>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Roger Quadros <rogerq@ti.com>
Subject: [PATCH 0/2] usb: cdns3: fixes for 5.4-rc
Date:   Mon, 7 Oct 2019 15:15:59 +0300
Message-ID: <20191007121601.25996-1-rogerq@ti.com>
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

Roger Quadros (2):
  usb: cdns3: fix cdns3_core_init_role()
  usb: cdns3: gadget: Fix full-speed mode

 drivers/usb/cdns3/core.c   | 20 +++++++++++++++++++-
 drivers/usb/cdns3/gadget.c |  1 +
 2 files changed, 20 insertions(+), 1 deletion(-)

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

