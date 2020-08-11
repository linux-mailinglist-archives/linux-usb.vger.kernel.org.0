Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1B8B2414C1
	for <lists+linux-usb@lfdr.de>; Tue, 11 Aug 2020 04:01:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728133AbgHKCBb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Aug 2020 22:01:31 -0400
Received: from mail-am6eur05on2066.outbound.protection.outlook.com ([40.107.22.66]:26904
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728088AbgHKCBb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 10 Aug 2020 22:01:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AbGV6XA2osAVFaqnx8ONM73ovZMgaxWmjeRrbShmQflLwf5ofrFfprdolo7qXqNn7aCoxuXVZCo7xZMahroocIqL+5L3yvHWSTv+/3mvA6dsRZaugEzDRw88P02CM2VVP71e/gaqYEGr+5TGnkHI87Nf2Q4awStlfvNJEdS9tZwyc+zgvtWSGGT3JbVBdQLEVTas9LFJuBh+bBO/0opT+CyhI8VDsX//+0v4ACEgSkIIw4ZayxawsapXPibWGJ7dI0LuMUr2h/YLE+UrBa8v4WSIFM3OwsKBntUfw6uHBH5AFf4hXuXlPvVTWYxIJ29klxUV4uZJGrgIoXXbNkC0Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XsnodHHjfNPBRIU+BlBdiRA8p8D15qBZiO22hZpu6WM=;
 b=TZsg45K96eJQCsfK2BLQBI3Euo0abhey5WL3JZF69xdBYZ8J2FI5IRSJ3pttGBH9PKdD4TXqHdciLPNhwqYQgpdBCoRJwnPP/mbE55/FdX91TYthu7PYeYoCkBqjuAf55HObsA9eEbwTk3buPI6uqEG1Kix3xsBKJJTQuG47zofP1361dmSDxHP89jM1KTyZZu/hIJWZE0i/mbU0tf2EAz0NBpAwCdST/VHSMVE3q8WBAfp8B6WiD6HNB8vbiF3uMXsAunkV3meaR9GUQgylFJFx/YyUanFGy9QUNPIHMtsxMemm2z2jtheo33i6reN08BzfAqVCDjtgoR2NHS1fBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XsnodHHjfNPBRIU+BlBdiRA8p8D15qBZiO22hZpu6WM=;
 b=lA7CHuY8NdKc1Qa6h5qxzK/aCZhkpoLmkthjOlmpK0GeoGHl/LBI042aY2JdhSYVQbMCdP0sNu8l8sdvkC0viN52P4zXe7L/XvteVacR6yP3fc656QB6keyWaPpaSYs07gqI1CeABGqsq+ll/laQSwJvdvOhyUvRCvBn4KbOcPY=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB5494.eurprd04.prod.outlook.com (2603:10a6:20b:9f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.16; Tue, 11 Aug
 2020 02:01:28 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf%5]) with mapi id 15.20.3261.025; Tue, 11 Aug 2020
 02:01:28 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 2/2] usb: gadget: core: do not try to disconnect gadget if it is not connected
Date:   Tue, 11 Aug 2020 10:00:26 +0800
Message-Id: <20200811020026.25157-2-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200811020026.25157-1-peter.chen@nxp.com>
References: <20200811020026.25157-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0123.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::27) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR01CA0123.apcprd01.prod.exchangelabs.com (2603:1096:4:40::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend Transport; Tue, 11 Aug 2020 02:01:25 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f3de6864-3052-4383-fecb-08d83d9a7560
X-MS-TrafficTypeDiagnostic: AM6PR04MB5494:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB5494EECAA34E486A72155D208B450@AM6PR04MB5494.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SwBlK3vAMCB9IInABuqK7ms4vD9eZidQroO+gDS77MJsu91SwSnbuBuXYETx3qGiTC7vobzXh1O2raFbn6SK7Diu0lv6C9jdULquIIG3mjZPrHQOexhARN2QNICUgT8onGfcKasgTPLKPaK1VDkkMOL3huzfieSbhkQ5U+88/HQo1h9fdt62hXHiulGCxGmP1YG/0aLvPM1dPvlqjXpHEvvQ2uddju1MAslP/i7aldXD88gCKsBKrzX1QLZgt4lg9IIclmoRXOmTkazyo5AXCu33FMXUrvCMYARcxbD3afYSC9q7k/InMXTgJp5iWZ3H+AGk5kFNC1gf6d98yB9fQA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(39860400002)(366004)(376002)(346002)(136003)(6512007)(86362001)(6506007)(26005)(52116002)(16526019)(6486002)(83380400001)(6916009)(8676002)(2906002)(36756003)(8936002)(316002)(66556008)(44832011)(478600001)(186003)(5660300002)(66946007)(2616005)(956004)(1076003)(4326008)(4744005)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: vL24hecTA32GTk8aOOIJPTBAtNoVDJUXpPHqjvNBY+O9vwMiMQgimTieAnH/q3qaBvILtB0mQXBpBWRFy4EQNc0UAiNqAw1/WqI9TDBRM7zBB5isJMdYJi65prrxCOqAvZbozJ0BXIzfK/6bTXIoXegMDKrXAUs6L/wvYY9ZBVztcA/F6Z+szmRMaG3OkSQ0d1DM1V1nx4NZwzGfwILMoL/+8a0CXfFDd9yVM6cgM4lYtxoKNLv1MrkkNUX+WQxlzxbxH8lNgHL1A8d27EGbTLBzuzwBKSqsIByTj8nlpMgnqaBg/k3+KLqYTnJN988lxo2xCd+pY8vZ41Kuq+Yndhv50YxFmv3XA4d6JW1ih65UMasm5qK48pYZBv8hebyFSnLimyfbu7IcJNhCrZVCa6YYw/HpsliCsDDh7yvWKL+db3PZZS/qxfmSd3EuxSkzxpHmv+pdqv7i9GhRDnHpXhjnkJpZ/Jw8gIuqKv4LxUmfFjJn9bvRvDRLSi+wC1II/Um+cC1eU89wXU6Xdb5Y0/BB1awR4gQseHZAPX/8nLlwcNBpO6ujdT9Bm6dw+XmlQ0nbJ9HqYi4hfCwGYvDjsoIV1geh+i9JPhtA8hrjHfhGkemf5stCXA+GaAo5OzcDJcBkUQduKPQU471/SQAP4g==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3de6864-3052-4383-fecb-08d83d9a7560
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2020 02:01:27.9391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CqQwlQEpc0K2n7ne5go+NY+XEpFTuQpWqi01XrWqzNQcDl10TlxQ83zUfEGuV5MfH1LtZ3a3uRR0+LfEpmVC3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5494
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Current UDC core connects gadget during the loading gadget flow
(udc_bind_to_driver->usb_udc_connect_control), but for
platforms which do not connect gadget if the VBUS is not there,
they call usb_gadget_disconnect, but the gadget is not connected
at this time, notify disconnecton for the gadget driver is meaningless
at this situation.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/gadget/udc/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index 0df73ac28c93..466cb76ca0ac 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -714,6 +714,9 @@ int usb_gadget_disconnect(struct usb_gadget *gadget)
 		goto out;
 	}
 
+	if (!gadget->connected)
+		goto out;
+
 	if (gadget->deactivated) {
 		/*
 		 * If gadget is deactivated we only save new state.
-- 
2.17.1

