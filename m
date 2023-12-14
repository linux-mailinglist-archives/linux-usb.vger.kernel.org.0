Return-Path: <linux-usb+bounces-4155-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 67498812E71
	for <lists+linux-usb@lfdr.de>; Thu, 14 Dec 2023 12:20:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77C601C21510
	for <lists+linux-usb@lfdr.de>; Thu, 14 Dec 2023 11:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC33F3FB3A;
	Thu, 14 Dec 2023 11:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="E8QR/6B3"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2076.outbound.protection.outlook.com [40.107.22.76])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 445DEB7
	for <linux-usb@vger.kernel.org>; Thu, 14 Dec 2023 03:20:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xchlj/DwQhh9Ds8EO2AEeoRVT4Kw1/atkIBm0QxUmZXqpOCctL4hIj+zZQAd4VMvuHCn3tV+9nx1hPqNIuHS/Btlu44vdD2b/iJECaAnP2RK18WGD83+5n2URGllX054C8dGiDAQzRu6y9OlVJaxnJcoMO/PoWTnOI0VxaoXbS6IjAw8eFfYtB9o+ZReKMR7HNi3kctyknipBCkIOMD79TM4/o6M80d5A433DzvuY77Mrm6kK3XclXqs1nnlNeQ8Cx33Vilg0MPCXahbp3FD1grkdA0r9+p4xcnKA6Ug3UtIVUIDmFBFsXEsfP3KKNAbiwQh6J2zmQms2FlDML6Izw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TWkHzCiiS0OsKUPa4dvy9YEUn5YLD2ZWt12jHafIw8Q=;
 b=ihz7D0NAlcnMWSj7sj6ruoU5RlgL3b/qTzldLc4AzFboZ7CFjeb1WzSQcMI2ueoLDnGN9XMjIJ1fDl+Lb/H3vtMM+GXcWdTV4U5A938EWxg0xOzJ96UeNYdwsG03zUL6NjSxqVoVt+/XyJS/9szH14nZUsMhkvbrHDkgZHsYXXG/aBMlGnRWZ5Y0RIiPzUgp+IkCSfblHbUBmJ768zN7InTEoaH0s6N6xc4rFfMkBLvScyA1uEyqbFuFI6QXOTIG6NDK1Kyq03crMpay4SCoDu6dNBw5msk5iAbSll6hfBe2+O6aZQpr8fE9NARJYb9D+kGCX4VsvjciI43+GefWPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TWkHzCiiS0OsKUPa4dvy9YEUn5YLD2ZWt12jHafIw8Q=;
 b=E8QR/6B38CXMWHa6JL8jIwJaC8uq9E/cj7lpKNUWgpoarZvbtrBK05naSTCOWd62LKVPtiMIwSRVNU6Jhv03snH+1jpvW3UsAu+brepW9SLPEHWLCXNRPcS1IIIwhQEymZwz2hlL9AKYStVD5F736/J+Lo9E65jIFTdAPsPRODs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5152.eurprd04.prod.outlook.com (2603:10a6:803:5b::13)
 by AS8PR04MB7880.eurprd04.prod.outlook.com (2603:10a6:20b:2a5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Thu, 14 Dec
 2023 11:20:43 +0000
Received: from VI1PR04MB5152.eurprd04.prod.outlook.com
 ([fe80::577e:f2c6:9d67:f89f]) by VI1PR04MB5152.eurprd04.prod.outlook.com
 ([fe80::577e:f2c6:9d67:f89f%7]) with mapi id 15.20.7068.033; Thu, 14 Dec 2023
 11:20:43 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: peter.chen@kernel.org
Cc: gregkh@linuxfoundation.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	luca.ceresoli@bootlin.com,
	jun.li@nxp.com,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/3] usb: phy: mxs: remove CONFIG_USB_OTG condition for mxs_phy_is_otg_host()
Date: Thu, 14 Dec 2023 19:26:22 +0800
Message-Id: <20231214112622.2412321-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231214112622.2412321-1-xu.yang_2@nxp.com>
References: <20231214112622.2412321-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::20) To AM6PR04MB5144.eurprd04.prod.outlook.com
 (2603:10a6:20b:a::32)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5152:EE_|AS8PR04MB7880:EE_
X-MS-Office365-Filtering-Correlation-Id: c5e28156-4484-4a3e-3b96-08dbfc96b5c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	a+axQlnb5sBKp87xGJxg9SRa6dCuheuyBuUHwDY5EYZrMBcxRCrLA8K12mBD8lyiF7gl8ZZb76ZuOH32M6VHjtAm9XAxqiyHPlhHU+QP+b+zebsboRJrMmdIpfkn8WY8GUwp+Zu/K9qou+EoWhdTIssF/GjwhCpX6IUltgd9QwL0jH7lUbpMkMCcWYY2RBkG37ZOiYrQdL4OomPuzbXkrjbTRY1he3MayNND8wOWJSttIC7jcJblmHHfn0TS/RX4CcaNLZaxX8rX7fSaaUDrzcT4RQHWhqFVM7oerA+uXZGkPvJuEBYU1n/x537KaLsjJNFq22yol+I/wZAk/zBDdxZUwL8qEoAkWcd7IhWR10dos6vFH/4V/hhlfPIe+7eW/rPdZiA60d0KPMAu5YgdngLo4yXeOMHnbS9+pw+0poASzBPAtrU1zBEzm4h7YKi0MapkokeVjGeJCw+xerUZHBxqGw/RVoM3Jbhdu0EHkd531oNBNFn1oCZeud/H12vggcEPXaxgsg0N36ORM2xUwTqr6g+Zw7L0dgmAyULEZbHJJiUt7UWGM75mA9lcXB5I4/UNqg8Z9YyRnkogn+mKsq8grdJOtqNWhgxYDsRBIxfvhXo+1uePtYh5V+aKSsCe
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5152.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(366004)(396003)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(26005)(66946007)(6916009)(66476007)(66556008)(86362001)(38350700005)(36756003)(6666004)(83380400001)(6506007)(2616005)(6512007)(1076003)(52116002)(316002)(4744005)(2906002)(478600001)(6486002)(5660300002)(8676002)(4326008)(38100700002)(41300700001)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UAVKstgqHRoAi5q2FKKbUBB+K1JBdsp8GhJPwQCqyaZ0t9YTK0Y9V0IHbOwj?=
 =?us-ascii?Q?Uoq7jvszJH19qPiIEbpfu/kJO6IgdS6HSEmhi5bW77O0f95wLG9DePq+rq0z?=
 =?us-ascii?Q?vL94wJpkj+LPEPdfZXLt55sgtluCmQ775FFksiDK+FGXY+fkv+v+ekoJSYMl?=
 =?us-ascii?Q?HrF/XUZSmO+hS4Z25QpqqfQkNiJ8tiS1ULQ89s1+8Ux1IS6MdjC85bpO41zc?=
 =?us-ascii?Q?aVYLZxfYRE1ryr17myHI8GpF4lh960ez9oRxLWF2LJ5oDWojaAE/bKWvNuMb?=
 =?us-ascii?Q?S7yruPcnfu5xvFH1r0BpIsvT8fvv+MKROHqPvk9SA1mOtzzGe+eKrtxPoXtw?=
 =?us-ascii?Q?waZNWdedAO43wlNIfyqbog/uYQc5bk11AWcHWj5GRy0OMpeUtoiMwjhjg71l?=
 =?us-ascii?Q?rV5QwDvRJYGL5IYB/jOqzQi+mlD4ieOk6iPOBrZrc5akXtZCVFzHIyY+awJn?=
 =?us-ascii?Q?s5Q5+GKeCYlevhh8tg/eFutKv6LR/cVn+rFO7oi29sbPjkIwurS3sUlcmKa0?=
 =?us-ascii?Q?C+V3SkEKc9p9xi4R06X0nnI0pg0mnJ6GXxdSCC3RGorBZLRU5xuo6iNG9yRd?=
 =?us-ascii?Q?Yy0CTNZf9X++wVXkMTSn39JAgSv+xmdbI7jQk/I5jcJVnnoJYI6hJz8pofEZ?=
 =?us-ascii?Q?/nnUiEckw4qIKnpL9EESfguhnfNOBD8qzWYQOxEsVqgq5Sz8Pe2UU1EK7y85?=
 =?us-ascii?Q?EmQpydTFVSCW2ZzJp7n74zNODC41t2mTlmhKU0J9AbWmZxJQ0qUoK4mh6vI7?=
 =?us-ascii?Q?s2uXe60vTdbmdzPfhBs0qfxwmIc0qvkWto78psR5PUPil4V0L8x9JQBFNbup?=
 =?us-ascii?Q?H9cs2Lo7K6+tJsfC5VD8C4d2dJSo006a9jJJ+l2kv4Lx6KWaBfvdoG9zJ3vP?=
 =?us-ascii?Q?fYP0gEH3gZCAouw8/bWF6zru9vsllgRgezMWDAaoqqE5Q2harj/71aPzoieK?=
 =?us-ascii?Q?0Jo4IoXE3COjFTDryYi/xa77BBvsrgk9aXRZPLlL6UeJTN70ic2u9niTh7iB?=
 =?us-ascii?Q?fi3XXvUj6jQRNR+Kgc0r8BUnOxxUFPcCj/BFXxQ72zm9GdaFFLIxUZUZ3px1?=
 =?us-ascii?Q?SPUbqQDZw56SL885qrklhv8me/uf/TI43tDAJ6rW2JU1duBmxEFSwqKIqa4S?=
 =?us-ascii?Q?3uX8grBnlL+GUtQDz3I80P1geYUJ7OnCQinnyPV9QXmW6TTvWAOLkzmqsmGp?=
 =?us-ascii?Q?/aawd4n/IhhLtOIGtk79Oudi+8wgO4ONUlu/SOaJYGvSePUW8CHw8gyxRnzS?=
 =?us-ascii?Q?UbUl/7lMKTuoqHJyCel539ywuFjR3qR0tMea2dGp6iLn8WqWxuW56SQxET3T?=
 =?us-ascii?Q?4bjHoXePwlEP8E0zQkmOL7cCY/4c8z+KH4j3ONtLWAZfzsxSrbBprTEpGpN+?=
 =?us-ascii?Q?V79PsWeU/mE9LHqK4dbGA3kON6w+ceiE3czAFbDhKhWCrwHAcdIkF5YVveE0?=
 =?us-ascii?Q?QB1xY64ps7ECPd+fsVqy/djybVyijqXhn4hX1ueeZhDyagg4bRjjttZAgkiE?=
 =?us-ascii?Q?Ga4kEETezd+mY0vZAPmtj71jFYoxrSkZ+F4jqylmnYkWgA02xvLEF1WKTE4i?=
 =?us-ascii?Q?eRBYeGxhNZ+5W8daac3q0ZlPomniqGtrjAgu45bg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5e28156-4484-4a3e-3b96-08dbfc96b5c8
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5144.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 11:20:43.3425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SIiE6QfGuam30pNfh+RknQ4uA3NBAdzUy3XD6Oj/BVUrdKSbZ3gcNVXBjyU09pgOpPo0gpTzPO55N9Wy0ATFBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7880

When CONFIG_USB_OTG is not set, mxs_phy_is_otg_host() will always return
false. This behaviour is wrong. Since phy.last_event will always be set
for either host or device mode. Therefore, CONFIG_USB_OTG condition
can be removed.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/phy/phy-mxs-usb.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
index acd46b72899e..920a32cd094d 100644
--- a/drivers/usb/phy/phy-mxs-usb.c
+++ b/drivers/usb/phy/phy-mxs-usb.c
@@ -388,8 +388,7 @@ static void __mxs_phy_disconnect_line(struct mxs_phy *mxs_phy, bool disconnect)
 
 static bool mxs_phy_is_otg_host(struct mxs_phy *mxs_phy)
 {
-	return IS_ENABLED(CONFIG_USB_OTG) &&
-		mxs_phy->phy.last_event == USB_EVENT_ID;
+	return mxs_phy->phy.last_event == USB_EVENT_ID;
 }
 
 static void mxs_phy_disconnect_line(struct mxs_phy *mxs_phy, bool on)
-- 
2.34.1


