Return-Path: <linux-usb+bounces-4603-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 248A381F775
	for <lists+linux-usb@lfdr.de>; Thu, 28 Dec 2023 12:02:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 78EEDB2139B
	for <lists+linux-usb@lfdr.de>; Thu, 28 Dec 2023 11:02:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBE126FCB;
	Thu, 28 Dec 2023 11:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="spxTlxJf"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2073.outbound.protection.outlook.com [40.107.104.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D436FBF
	for <linux-usb@vger.kernel.org>; Thu, 28 Dec 2023 11:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lp841mdAjewG2GE9BZF0gUGgu2m/KtO1FLgznAKhQtflBIiyje2J0MRbkn7hxKO4KSjeLQWaAJ1ngeR5Pv1XnfuImMLp+bnqYKxOsBLKX5qElYDc1xFvqI/ur8uyu2e7fJgCnRojXmrU5of/nXXNQ2Q/iK1GQOPTX8TNfpA2SvibzPfrl5efu2VZ2kwH48lrGhoVrJxChNL0+EFImtMDZBgu86hhXLt2hIegfJz1hUAOeZmx+VpH6IDXtE7KMTxaafWbffxGVznS9XTy41BN2yFIYa42jrpcmo7WZldu009vCoF89LA3ypna9cRbf4DiQoT3dalrJmF4mV1QrECZVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tkMs+VDs/6/LRZ0t+My94tiBmizNyg/sryes2yBC+FM=;
 b=Ft5Oqlw8gAB+Dk6O4O7Se1m/ge6L90op8Qb9FQh65ioMPbUMjcimNAGKzKmJeevqTxteXxhu9sZBAJrMqVH5UIJToXe/e+Pb0eULdeLNaGSyJ4tzFzrIp/MUHmAaWOxiua5a0y4aDESeRi/Va7Ektkn/2Uw+xxF1mbA0KhQ9kLOUO854cZa8GbIKsiYarbf8I1ooph82RiKN6EVAoBPa/J0Kbz/s++N5OsPkJzWq0QvzoQNPKgt+jV6ryNsy6BeJ0Qe5AyM6pTLfwoT0alRr+WdbnoWh4rZ1IT9+ssFjSKMLZtKy/CY/M/xRo4lI3yKrnIkE11Qv7bXlkNpDXC01+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tkMs+VDs/6/LRZ0t+My94tiBmizNyg/sryes2yBC+FM=;
 b=spxTlxJf8ibczbNhlOab5jX/kty0U7cljAkAlsBY87rGXgGI+m1LdZYd+OIMGNu9CkFldOpIyjfHVmSY6oR0vczryxj4qc8zZWP7WQJQtYmQuThJfQViPI0rY1BJFvrE5LoN5jhG3koweybufnAXiJHuBVpSYhfs7l24y0oL+dw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB5146.eurprd04.prod.outlook.com (2603:10a6:10:23::16)
 by VI1PR04MB6815.eurprd04.prod.outlook.com (2603:10a6:803:130::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.19; Thu, 28 Dec
 2023 11:02:00 +0000
Received: from DB7PR04MB5146.eurprd04.prod.outlook.com
 ([fe80::709e:6876:7df0:fc30]) by DB7PR04MB5146.eurprd04.prod.outlook.com
 ([fe80::709e:6876:7df0:fc30%7]) with mapi id 15.20.7113.027; Thu, 28 Dec 2023
 11:01:59 +0000
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
Subject: [PATCH v3 3/3] usb: phy: mxs: remove CONFIG_USB_OTG condition for mxs_phy_is_otg_host()
Date: Thu, 28 Dec 2023 19:07:53 +0800
Message-Id: <20231228110753.1755756-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231228110753.1755756-1-xu.yang_2@nxp.com>
References: <20231228110753.1755756-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0008.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::20)
 To DB7PR04MB5146.eurprd04.prod.outlook.com (2603:10a6:10:23::16)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB5146:EE_|VI1PR04MB6815:EE_
X-MS-Office365-Filtering-Correlation-Id: 3330e93d-9461-4427-5725-08dc079469f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uwcRtUDlMU8d+Vl4sNbCICRRRUU7W+buHkel69c5NjfNo1UV8d6MbPI2LE/rUDjIKUJm7I1l8mTPhnmxHoo0o8EmqpUbEJYyY8OLibM/j0NLyv78JGpvvz1m+nFMtK9XmvaijObJCUpqN2KAAZMrc+US9s2gr7gFDrMW/BtouIIt5lehEcX8E+eSkaC0r6uIfztHWeuZqNyM9bFZt7G8FpNSilj5PjXr46q8xdm4B+q17ASd6yZ8TKI3GPezg/63lB5L//O/yG6dJuA6jwCPoBQTIZVwShBL9MKinSf3TK/2OLO0nr+dK2QEEsp1hmN7UhvWPKBMUu9YdY1WgwHMvxA+dvJwMT4amd+Kpz4QRLC1XukUeTrPnv2ZdK+yAhL9nOGVnaToG9UhWM3J5CCeUnZ5Guhl9hWYfL6s75B78Gqx05ZjfywE79OrGxww+zN5b1ETeuCYWwq6uPjJLXbO4w/QXTlBNATMMDRz8sd036YlpK1AalrdMChLH2wp51U5wNwCrT1N/8E6Ncrz22o51v01wyddnKLnWnzCYmlX8YLzQUZveX3IqvxwQd2VGr/9e+QywQ7HfBs7uf9kzJKBnK/pchTyszZUDLw88KUO/FKhQKeXS7QzzvACWezXY9wl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5146.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(39860400002)(396003)(376002)(136003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(26005)(1076003)(83380400001)(38100700002)(316002)(66476007)(8676002)(6916009)(8936002)(66556008)(66946007)(4326008)(5660300002)(2906002)(6506007)(6512007)(2616005)(41300700001)(6486002)(6666004)(52116002)(478600001)(38350700005)(86362001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?f63x6LOZMbk0dB/VN5IhO2jgxbG30D4x97H+u5wksxHGw3X3Sajn4rhcsibC?=
 =?us-ascii?Q?MrijIghAh9TKOO2mjFX9KN1BHu4l2h2uonveigJQ3Pwj8Mp7jURza7s4+bxy?=
 =?us-ascii?Q?WBU8+61mPYXIEs8g2UTa4M2YsA+stjnk9toKLso56p6yBmR1WEn+N0TjVpfT?=
 =?us-ascii?Q?pqkJr+uS2fHTQtSIzcWO8aczGrdQ98VYkVrN3Ui3jdvis8VTxLhf6bndjxtR?=
 =?us-ascii?Q?1esRZljUsU1HdO7zmBCsxduTSHihs3TqowAXhrAKs9mOWBEcezjnaJ+ctHkn?=
 =?us-ascii?Q?rs5DCKH++/AzddPWPL6N4M583Z7XvQRT/1nGEdceBCaCAA8aPqgUw9aDhh3t?=
 =?us-ascii?Q?0F/6rJ2SnF5qYG5PNyuCjLOnIAnhwV/dm8PrAa6RBbTKzErKJD0MkwdAuEzM?=
 =?us-ascii?Q?vT8/h3H+YOrCj35ZU/MxwNEEbNA0hY2VYlSph1a3WywtqYjiQx3k2LZkeZmE?=
 =?us-ascii?Q?EnxJFJFb9kX1cwqvIXudACs2523dGF2HcCl9G+KXGdeE41OhZL5RT38mylkj?=
 =?us-ascii?Q?VEEX1Py0YaDz/On+QDya94blkV1DIrgo5Ufeq2jFAqbAt9JuL41zOcvJSlmz?=
 =?us-ascii?Q?jrSfPMHNccNI9rEMpH8P34EnChqX3qRMVrTMhZ4mxjQRC6eQBKQvttAj5Npy?=
 =?us-ascii?Q?mLFQTFkTt0svchidmSBsXS3R5vbo5CEaEWvUNhqv++48xLiBzA8PAxVO79sb?=
 =?us-ascii?Q?hlqkH4IqmDS27ExITEGGRHAdZfTJ7XEO6j1uxq1aDunNE8T5JjiTtMJV2Ypj?=
 =?us-ascii?Q?M3EBc1W2LhjyFFphvVg8O7xZN2EcI3S6mwP1zQ1jNy1DY8mmOS0V8nlA0StL?=
 =?us-ascii?Q?j7hSVIAzN2mUvTN5rl51emZThWquOUAlg2+iovRVz6b/xJCLMmzlDDHY/29x?=
 =?us-ascii?Q?kaBfToUJvvLQlPAUSea+u2/TLwB2QY9SHHHbGIAHS/SxQnCr15D+yqdPXVfk?=
 =?us-ascii?Q?34Kkc2PzzeAJwVP4wWRKY6mHK+1RqvB8CCX78iQ1ykuahH5LSF9mAcbqtCm/?=
 =?us-ascii?Q?zdqRLmHSzIQqvchyS7OvgY0P9TenX5Uf2OOqs6ll33k2mFkO6JaaoU6Dpg+6?=
 =?us-ascii?Q?xU01T5z6u+XIZLaY2WmHmpoykLK5O6Mv+1Jg9PNWQOypbrsvajXWFhvtYnnA?=
 =?us-ascii?Q?uCE/nE3v6kKB3jgPrFKw3EVZvMQtHJitLxyaalKklE4554ind44lt15A/yAJ?=
 =?us-ascii?Q?3po3/Ef1M9uKSgpNrvsaM/bPp2unymrF13AVjtBh62WLFQi1qpD7/wIvVvTG?=
 =?us-ascii?Q?bPs0BNfNyFG25LRs/GxbimtnQ3n+GHqax/csr4mDCbWagW8DhzP8iEdJvxPF?=
 =?us-ascii?Q?jjMsy6T74aRvrHQJRLrdhHOebiQJK5/9+GTzDjEZHoOoMruYFJiWL3TNxcy/?=
 =?us-ascii?Q?WPUT+A4yyvCTGOPdxenvjG7pR2lI16M3tgZTUGf2FcA1swCFdM5LJxVpSYME?=
 =?us-ascii?Q?TfOdYWUUq/Ibq2OEENdjFz3tT0RRmYVT5nbQ6TOMVpGyLR0M4LzL73TDEOFg?=
 =?us-ascii?Q?5JCJfZT8daV+moD5IzMHDpf4PywIAG/PwAWeS3VypOg2C/DZ9BqbV0MFfbk3?=
 =?us-ascii?Q?zyTnNkpAZghKIWj4C4KxW4aFEsJUxLirQXhZ4SFX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3330e93d-9461-4427-5725-08dc079469f1
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5146.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2023 11:01:59.6922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z3hbLX6Kh8O4DzDDCW5exVXF5cgXFjgtHpYEM/RiC5Jze3mUD35AxtbbyNWpO/VFf1eKG9dFIC8zYt3rV+wICg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6815

When CONFIG_USB_OTG is not set, mxs_phy_is_otg_host() will always return
false. This behaviour is wrong. Since phy.last_event will always be set
for either host or device mode. Therefore, CONFIG_USB_OTG condition
can be removed.

Fixes: 5eda42aebb76 ("usb: phy: mxs: fix getting wrong state with mxs_phy_is_otg_host()")
cc: <stable@vger.kernel.org>
Acked-by: Peter Chen <peter.chen@kernel.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - add fix tag and stable maillist
Changes in v3:
 - no changes
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


