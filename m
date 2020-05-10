Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E5AC1CCD57
	for <lists+linux-usb@lfdr.de>; Sun, 10 May 2020 21:47:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729282AbgEJTrV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 10 May 2020 15:47:21 -0400
Received: from mail-eopbgr100129.outbound.protection.outlook.com ([40.107.10.129]:8384
        "EHLO GBR01-LO2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728756AbgEJTrU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 10 May 2020 15:47:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hAnovRMxKaoZ39HPFDq1CgESOirJcm+0ESaV34DOQ2iI3ji30Dn4r/gF7RMDHA7sf0BBw9NfLWjbGaUWHxaybgbS5BfRNWVuDa5F8qX93DHbOXEyL1DXEcNPERlYboLbCaYDRM1atL9fyiZn1TScfMdayipFuX+f+SpqJrQ31qjor+Pqx3d6S/nO2y0ed5IewqYbu8DMc+BzsfB88PMggqoPymCcF3aNOelBwTAWV0YPrDxLId15Z3JaF3D347sSQpXK/b5J0M/cM9hzoL+E8YCIhTaJkYnu2lqYzkvWD89MBbE/zl8oeNrtObNCMRBsnhrb5KAXWsoCrlq8LrdrHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f22Ihmg00Fpd5lCHSRRP+8jOnT6qa703QfQa7GCmd9g=;
 b=ezOyDrDp2UJAKH8PMV0Q2VlwH30cAbnj2v+qutOlv2WVAnyimfqtKsmpzib3/MW39BwbiG6I+LVx0wfRSypHJpGNCbj9J1xL/HmxBXUwtjFcniTp7Lu8bY3Te0pbUeEOPQL+UP/c3B9xmQveTE8cz5S5QB81bP+nNZ2Xbt0v8d/bLSmJ9Kd9Z/OLnw4mIm+1BOUrmDHmAuCmrGWmNYd1bU/5btwNlJcJtYZuKAh/zhbBntXxx8OQz3czzZFvTUTw/3aUfzsv4iyONkdQ5wnZd1n0YRyAFTnQt3t5RQhUfadulnInjZD/lY73RFhit8trgEIs8fpp1+5QZXgYxZO2+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mdpsys.co.uk; dmarc=pass action=none header.from=mdpsys.co.uk;
 dkim=pass header.d=mdpsys.co.uk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mdpsys.onmicrosoft.com; s=selector1-mdpsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f22Ihmg00Fpd5lCHSRRP+8jOnT6qa703QfQa7GCmd9g=;
 b=h7QDMuOLV+GXEgr9pflfSsQGQxVQAKdSGBpfsRArlvAjlpmE8im/7My/FRSYqwK/IaWkditp2NUjb2ni2Twh952pm/UIakPuxXOJtKIUJyf3a0U97XqYv2SDUJAulq9p85KnxGF7FfCaK7PQmefCrRaPepb/qle/LgkJd9RwU/s=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=mdpsys.co.uk;
Received: from LO3P123MB2763.GBRP123.PROD.OUTLOOK.COM (10.141.154.207) by
 LO3P123MB2970.GBRP123.PROD.OUTLOOK.COM (20.180.135.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.27; Sun, 10 May 2020 19:47:17 +0000
Received: from LO3P123MB2763.GBRP123.PROD.OUTLOOK.COM
 ([fe80::7c7e:4c0b:54f5:aadd]) by LO3P123MB2763.GBRP123.PROD.OUTLOOK.COM
 ([fe80::7c7e:4c0b:54f5:aadd%5]) with mapi id 15.20.2979.033; Sun, 10 May 2020
 19:47:17 +0000
From:   Marc Payne <marc.payne@mdpsys.co.uk>
To:     linux-usb@vger.kernel.org
Cc:     davem@davemloft.net, oliver@neukum.org,
        Marc Payne <marc.payne@mdpsys.co.uk>
Subject: [PATCH] r8152: support additional Microsoft Surface Ethernet Adapter variant
Date:   Sun, 10 May 2020 20:46:04 +0100
Message-Id: <20200510194604.313388-1-marc.payne@mdpsys.co.uk>
X-Mailer: git-send-email 2.26.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0342.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::18) To LO3P123MB2763.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:b8::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nuc-arch.mdpnet.uk (217.42.57.57) by LO2P265CA0342.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:d::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28 via Frontend Transport; Sun, 10 May 2020 19:47:17 +0000
X-Mailer: git-send-email 2.26.2
X-Originating-IP: [217.42.57.57]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 59108e8d-ce11-4c8c-a2f2-08d7f51af207
X-MS-TrafficTypeDiagnostic: LO3P123MB2970:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <LO3P123MB297048D9C729805B774132A8B8A00@LO3P123MB2970.GBRP123.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 039975700A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t5yiFmV8aN4W4DCmrqjyELbJRjsOE7sIWmaXG5nuHBz5I0139jYrb/7K6J8ZzQzDQFKTl5cBzExgir88Wquugw0u04p3ndu3qVGXNmZRl+qhOp7xW5nSOPfBDtVY7g3ZWni9WKBX3OznGBIRLPw5nrUiZomMQv1qahA2mu/SEseqqRQ2vgqYj1Qzr5zDsvtONKeS0PszzXok1tZwQWri5Bxja9GHIyt/DwnHEr21YV8aKt8M1HSquS6ycxHrn9GIt9xHk6LXiMPAQ/cswelphdEXM87ZqP+DZJdBhEmyNM60amnUGjfJD31FiC0SGTVssCulD9oaS6TOfVF7EIJeKRAtvv8H+cpv7KDKnXvQcXM6lDB+ImvUhfq/Tv/28f4S/R9c19fhjKNuUlMGehZwKPNj7YgvymRnueJk0ngZgU52nzIID8Bp84zPe14d8PDdZe+tkdFMq/nwrRCwjXvEgHNN8YYqGvisxIGCoNc2VLHRivmqpteyx+xMwb3jl4QwtZYHEeAUE2r5pMbE7SAJoqXwHRE77pwJaNu9YvoO8fUd4nr/9AGRLQd5SJKoMBHk
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO3P123MB2763.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFTY:;SFS:(396003)(346002)(366004)(39830400003)(136003)(376002)(47530400004)(33430700001)(16526019)(5660300002)(6506007)(52116002)(33440700001)(6486002)(6512007)(44832011)(52230400001)(36756003)(66946007)(66556008)(66476007)(1076003)(2616005)(956004)(45080400002)(508600001)(107886003)(4326008)(26005)(6916009)(186003)(6666004)(2906002)(8936002)(316002)(86362001)(8676002)(58736002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: e0dA7ublZtG0SmRWas4CB/jPj2oJ3eg2q8yzSQpQgo2uiIMnxHiDF9ocEy4q7u9gE5Y3+FdZiAnMiKpw7REOFI4av9tBYwwOypif8mjHGpnfQvK6faJBM/mG5MLmiP73pKuV1QU1fXIxY/NUGf+kfvX18Z2YvrXycTBpKuSsyBMElb6Xs2yZlOgyspSh4W7UtHmHEjTBhGrylsXBolyaqYkbHxLWZxUYq7gM+2par9DHG1vZTrLbANP3RxiOkzLqiXpSMnz7wpBfzdX1LTd0uoOvMCyH4uIp+WzvYWj2HwDg1MQcjKJZtvFIP/y72Mu0G2FDE0ALnwkBGuZ3O/DaBF6Akx2AuFBtZIu3zDTcnE7Cd1EAfaUjUxHp9I622hNtp8NwQ6jqJx7vly3kjGwmF/CFVpLxvNgztQfE8GsSC26bdAGsmG28yoGK4/Z+e+2TvMgsSJwB7zyYtr+A3ow+z2ML8U5mD2Lorksyd1V5uWs=
X-OriginatorOrg: mdpsys.co.uk
X-MS-Exchange-CrossTenant-Network-Message-Id: 59108e8d-ce11-4c8c-a2f2-08d7f51af207
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2020 19:47:17.6254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 07eb37f3-62d1-4b5c-a7c4-ed2a24dbebc2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PAMYCsnsNu+w4zEscBmZ8OEYCBU/GXPJZUL+IS4/3RLBi74Y/h/euWeo3JJ1zcAcqbK2STYK25fhZLWkqYt06A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P123MB2970
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Device id 0927 is the RTL8153B-based component of the 'Surface USB-C to
Ethernet and USB Adapter' and may be used as a component of other devices
in future. Tested and working with the r8152 driver.

Update the cdc_ether blacklist due to the RTL8153 'network jam on suspend'
issue which this device will cause (personally confirmed).

Signed-off-by: Marc Payne <marc.payne@mdpsys.co.uk>
---
 drivers/net/usb/cdc_ether.c | 11 +++++++++--
 drivers/net/usb/r8152.c     |  1 +
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/net/usb/cdc_ether.c b/drivers/net/usb/cdc_ether.c
index 0cdb2ce47645..a657943c9f01 100644
--- a/drivers/net/usb/cdc_ether.c
+++ b/drivers/net/usb/cdc_ether.c
@@ -815,14 +815,21 @@ static const struct usb_device_id	products[] = {
 	.driver_info = 0,
 },
 
-/* Microsoft Surface 3 dock (based on Realtek RTL8153) */
+/* Microsoft Surface Ethernet Adapter (based on Realtek RTL8153) */
 {
 	USB_DEVICE_AND_INTERFACE_INFO(MICROSOFT_VENDOR_ID, 0x07c6, USB_CLASS_COMM,
 			USB_CDC_SUBCLASS_ETHERNET, USB_CDC_PROTO_NONE),
 	.driver_info = 0,
 },
 
-	/* TP-LINK UE300 USB 3.0 Ethernet Adapters (based on Realtek RTL8153) */
+/* Microsoft Surface Ethernet Adapter (based on Realtek RTL8153B) */
+{
+	USB_DEVICE_AND_INTERFACE_INFO(MICROSOFT_VENDOR_ID, 0x0927, USB_CLASS_COMM,
+			USB_CDC_SUBCLASS_ETHERNET, USB_CDC_PROTO_NONE),
+	.driver_info = 0,
+},
+
+/* TP-LINK UE300 USB 3.0 Ethernet Adapters (based on Realtek RTL8153) */
 {
 	USB_DEVICE_AND_INTERFACE_INFO(TPLINK_VENDOR_ID, 0x0601, USB_CLASS_COMM,
 			USB_CDC_SUBCLASS_ETHERNET, USB_CDC_PROTO_NONE),
diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index 8f8d9883d363..c8c873a613b6 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -6880,6 +6880,7 @@ static const struct usb_device_id rtl8152_table[] = {
 	{REALTEK_USB_DEVICE(VENDOR_ID_REALTEK, 0x8153)},
 	{REALTEK_USB_DEVICE(VENDOR_ID_MICROSOFT, 0x07ab)},
 	{REALTEK_USB_DEVICE(VENDOR_ID_MICROSOFT, 0x07c6)},
+	{REALTEK_USB_DEVICE(VENDOR_ID_MICROSOFT, 0x0927)},
 	{REALTEK_USB_DEVICE(VENDOR_ID_SAMSUNG, 0xa101)},
 	{REALTEK_USB_DEVICE(VENDOR_ID_LENOVO,  0x304f)},
 	{REALTEK_USB_DEVICE(VENDOR_ID_LENOVO,  0x3062)},
-- 
2.26.2

