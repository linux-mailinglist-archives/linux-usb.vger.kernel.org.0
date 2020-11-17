Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE9A12B5979
	for <lists+linux-usb@lfdr.de>; Tue, 17 Nov 2020 06:49:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726460AbgKQFtJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Nov 2020 00:49:09 -0500
Received: from mail-eopbgr700059.outbound.protection.outlook.com ([40.107.70.59]:51425
        "EHLO NAM04-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725355AbgKQFtJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 17 Nov 2020 00:49:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=az0j9kmBQrz/MujXg3SQIE9fDWpSUNQGRXdGOu/2lBq6+1n5XPN/yDmh+dC63OFmDe8Nl+Ww076m+CIfduOVw34yJrUSlU6Wh96LuWLUNGm0NRfn5WY5v7fvlgSL0VjBDmR5XyN1KS1ZmgUrwi/AmcDEvKz0AT834P3HFt5QPpN4eOWRUpoUWHLTwpv84t3P6T4MaoBfDy4Vo9cByaB4pS0u5N0A6j5mb/dioL7d/Wgb6rpX3hOHOVsA6FCv6Q9bV9wvMWtgb1f8arqwmB9qeXkpNRUC2OusEW2U8CMQADTiD5lhF01ySumjs1AEE7UI17rGlSulpxqnQaAuQXEH3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ft9mEukCyPMZ6G0cdeHkh//pBIMKWBVee3hNhUgHQo8=;
 b=gyXg/KyWN8O31xopapPnaQ2k5PML0yqQUQV0eH6N1lQNb5sGG6U+0bAUvIvHaOlQf+WE8JypjtTqKIdaZ+QEKsNETmGzNImCTOhFh2APChjY/9WWxtdvVyvK0MwO8qGkowDAPpy0w7tlGalEYrD9d15FJVTOJx4TvGA9/XBS0hWIANkMDkJ80NRZ8fbXiL+s4h5zDMIegZBNzJ/CqGzp5A2X+/X+8gYtEHXJmFFxAFvCNwqHtJnaEmUH+unzTK3wVZLoBoXwFnVmSjora8F3lJRU4POnlTn1XxeqrU7ItlxxDoiCW7DeJE1yqmWwHyMdECchcCdo4ZcoidpGz8Np7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ft9mEukCyPMZ6G0cdeHkh//pBIMKWBVee3hNhUgHQo8=;
 b=dcRJv6urNx/ffHamryA72O8JfEIihTM5b+cDymmUUBu1FN/lLjplBjECNbQbXqSB0RV4Ycgjswzn25TmtslvUdYGLC7MwHpT9+D1RB+hbOXK8Wi4QpdeTbuLR6RIX1kr66tQzodH8OOxW6eupxqiXsIJIcfHBKNcEl4HqjB6onw=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=windriver.com;
Received: from BYAPR11MB2632.namprd11.prod.outlook.com (2603:10b6:a02:c4::17)
 by BYAPR11MB2632.namprd11.prod.outlook.com (2603:10b6:a02:c4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Tue, 17 Nov
 2020 05:49:05 +0000
Received: from BYAPR11MB2632.namprd11.prod.outlook.com
 ([fe80::dc7e:c582:20a1:5bc7]) by BYAPR11MB2632.namprd11.prod.outlook.com
 ([fe80::dc7e:c582:20a1:5bc7%6]) with mapi id 15.20.3564.028; Tue, 17 Nov 2020
 05:49:05 +0000
From:   qiang.zhang@windriver.com
To:     jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     stern@rowland.harvard.edu, linux-usb@vger.kernel.org
Subject: [PATCH] HID: usbhid: fix memleak for ctrl or out raw_report
Date:   Tue, 17 Nov 2020 13:48:51 +0800
Message-Id: <20201117054851.557-1-qiang.zhang@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR03CA0013.apcprd03.prod.outlook.com
 (2603:1096:203:c8::18) To BYAPR11MB2632.namprd11.prod.outlook.com
 (2603:10b6:a02:c4::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-qzhang2-d1.wrs.com (60.247.85.82) by HKAPR03CA0013.apcprd03.prod.outlook.com (2603:1096:203:c8::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.15 via Frontend Transport; Tue, 17 Nov 2020 05:49:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c69ff58b-de2f-4890-fb6c-08d88abc7e04
X-MS-TrafficTypeDiagnostic: BYAPR11MB2632:
X-Microsoft-Antispam-PRVS: <BYAPR11MB2632473BFE850207C2CE9C4BFFE20@BYAPR11MB2632.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TSuqJ1EqKIiHyrQ8DWxTfnEiQGzhbvHti++ymjNlXXjnMdevB819jV/XmtiiJbl+8vaXZkVWGjarBI7oJjEYJh+HVIp1B+uVOCNPp9luSme+qW0Jz5AB713mfa9ThNLFLWjXOoPRZHVJ2SC20yAtn4iqkh8RCMmbIatJep3Z6Lfgd06oD0BCci1TpUtld5PJWNvV165B5FiD+g2CHSRTR8Z0Sb4y1ydrgRmxn009EyWsFYBW9XKlOnaTdGkcQ/8RvsqmhyCwJIyPUHWBN2fWym4tRdeojPMFn32n3zt88BGa1sEU8i5GE8mgJwNVED9FNLlPJQYBBpUIOf6DY1aF6g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2632.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(366004)(396003)(346002)(376002)(186003)(66946007)(66476007)(66556008)(6512007)(8936002)(2906002)(6666004)(5660300002)(8676002)(9686003)(26005)(52116002)(86362001)(478600001)(6486002)(16526019)(316002)(4326008)(36756003)(2616005)(1076003)(956004)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: ecbTclNcddqFu3BF4t6sQn0K2rV++sz6wMIL76kf6uxfL0VGZmUaT+8fTf1C2F9PayyXKdgy//fOIm0ZKXLaz7ezvp9E6FenQ10H32rt3wgE0jFhDjXjNdlcXqstC1ur5WElkuGQOSUtWqkewggz1/ek2GXrQ2yoNm/iZrOei14JIhslEnbgPXnEO72dd6c64o46XDZL0mkYQQ59LFE1sB9yRE9w1nJ6FC4FtEUYPEpIF+O2MoNZ9BXn/SVnQ+glX1r6aUS57+ODLYJTgcfAVYVWpW53BLz9g/fgYVIL5RXkT+xZ8QsnBdoX/826wDM0bc/AJpiWnTuvLVWIZW3ymORRMWbXgUUmO972CUWkznYdOxky4okvZu2J6WdtIryfhezgfMtqrA7S7zajbrUVrs0SdadObXjUiHMzTjtZF+jxcuLlMmHduHlveTNaYJnIP0JxM2gW0HXD92ZI6aN8KCkSY2HYNH4mikLOOzwVbM4eXOfpcKCtB96IVu1SxzeMpBWe5pK7T6fGw1odI6oPsxrVI9rgantlpnq/p8Kfzb9aNu5b9gtJ5x69X7PH+0JEnx67CLUfGzun45A/SEH4gw4W/6IJCkqv506JbOo6dzX5vt8Maq5CHAJQ4YsED0jpwZFa1V0SDLAv2rEqRAyFrQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c69ff58b-de2f-4890-fb6c-08d88abc7e04
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2020 05:49:05.1642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GHMo4s5QfRYPQfRS4MPZuE4MoVnBOhWqwb53TV/Qkdq4vcZ4CbIWqjpXUaUBjLN/kYX1a1Ua+gFM6jn5kkhhh56fvNqqGgVSPu30+bHRPcY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2632
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Zqiang <qiang.zhang@windriver.com>

When the usb device disconnect, usbhid_stop function be called,
if ctrl or out's raw_report exists, need to be free.

Signed-off-by: Zqiang <qiang.zhang@windriver.com>
---
 drivers/hid/usbhid/hid-core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
index 17a29ee0ac6c..f8a49f8d4015 100644
--- a/drivers/hid/usbhid/hid-core.c
+++ b/drivers/hid/usbhid/hid-core.c
@@ -1209,6 +1209,7 @@ static int usbhid_start(struct hid_device *hid)
 static void usbhid_stop(struct hid_device *hid)
 {
 	struct usbhid_device *usbhid = hid->driver_data;
+	int index;
 
 	if (WARN_ON(!usbhid))
 		return;
@@ -1232,6 +1233,13 @@ static void usbhid_stop(struct hid_device *hid)
 
 	hid->claimed = 0;
 
+	for (index = 0; index < HID_CONTROL_FIFO_SIZE; index++) {
+		if (usbhid->ctrl[index].raw_report)
+			kfree(usbhid->ctrl[index].raw_report);
+		if (usbhid->out[index].raw_report)
+			kfree(usbhid->out[index].raw_report);
+	}
+
 	usb_free_urb(usbhid->urbin);
 	usb_free_urb(usbhid->urbctrl);
 	usb_free_urb(usbhid->urbout);
-- 
2.17.1

