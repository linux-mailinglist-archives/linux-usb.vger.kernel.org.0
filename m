Return-Path: <linux-usb+bounces-5443-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE1983A226
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jan 2024 07:39:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F5FB28845F
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jan 2024 06:39:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46641FBF2;
	Wed, 24 Jan 2024 06:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="rFcVbVGr"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2089.outbound.protection.outlook.com [40.107.20.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C52FBEC
	for <linux-usb@vger.kernel.org>; Wed, 24 Jan 2024 06:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706078385; cv=fail; b=nfE9s2drwmCJEa3QJpHRD5kZqO7w3s969inldnA7e0qdDKa2JcE2rSNBE17k3KLY+YEV0zw7KBoBNZHnuqIUZlOwJvX8UOR9+FHqOsw+lO/JPIXP0T+sy9MHRuNY3bcubsioOje4buljF4o3HKn6lgjm2YvZK5Basj2Uo653S5E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706078385; c=relaxed/simple;
	bh=q6ShXU/KVfxvWqCdHm8wYWS378KcX5GXiJulfeGt0kU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OERdSO9s6JhxZQs0xCOrc4aqfz3kIYXy4JEyhcO8k++4AyvSwn85pHNfaaaV2uy1vnWnw6EGAnPH5zpkN9CgsiluAvEpCyDMsGzgvv8fhrHyQ3sVDFXB7x9zc/MV9ln/lXqlZryiPAUlM4e4uASs9jRBiVXeQB6RfE+eDzUOJ9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=rFcVbVGr; arc=fail smtp.client-ip=40.107.20.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YNwLkwC52Gy1j8F+N9FM7RfiMmVyeBXsxG1tBL9HvKfWI1feKpbLqoU+vxOOiHt99gweHS4je7CFYf1EqU8bXGlrHk4iUOSWNz+v2cq/7dIrD8iGpC7njwPDD7TGRCDTRspTQuuRKcZSXSCOiI9MREyOKnzCTCrev74ZAEzKOR7/unhHUYf3aQ/uNfRVWbU29kLjdDOg7adBN5H7JCqwM5Un64npViNsujyKIVcGiXPm89/YkSrsr7BvwkSDJa00Rkm8k6H7LL8xlRVJq60nZP6NBubwEdGxf+J2IecoZKrNElSzRpXBkfVZp7SwmjMpp94SSpw8Mxmckq6NfY14Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5PBKqXM2S6pk11vumULJEnZzONdZH+ogiJ2NKL1NbVQ=;
 b=HKklmB8IuoXxZJFEzhDfvI+CGC+pmUTNgKxa3k3gx3cM4FPEkj8mKZ7JRGUoNb66KXBAbzJjOq72OeJIEerRQBoVGtSg46oDKtf9dRaN/SHeTnSfEoJKcHDRbvaqP81k1W/AfyodSRVQ3rK2TGLmIeGYQK2mlLDtRq/uB5IhbdPFap6jzFhOkbgbfdyVCrqDz/MA+YyRuBFoWaFRUO7Uv/u3Wq0YcS4DhJjoLnwM94A1OzN+DXnx12weU3/t3rlUhnlX3RlDKogAwMJ7d8GhwUzUR7HT/Ngffp2wVRWXEfrk+wph5tvbmM3uQywxK2bJfFknAj38I+bnp46Sehdtnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5PBKqXM2S6pk11vumULJEnZzONdZH+ogiJ2NKL1NbVQ=;
 b=rFcVbVGrae4D2druvh3aHeU59aLX+eHxV/onTTDf5OhA+tC/aDKRtQrfhD251ZL+86xFSC3TAj6QefZLBq/yxg11Xk/+8AkSBWv1jlADuTA9AZNYkmkkKAWBI9+Z7JY8wc60o2Id4gNNvqAQkJmkiWtjY0l54V9nOW103VyUBtQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS8PR04MB8134.eurprd04.prod.outlook.com (2603:10a6:20b:3f1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Wed, 24 Jan
 2024 06:39:40 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::d45f:4483:c11:68b0]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::d45f:4483:c11:68b0%6]) with mapi id 15.20.7202.035; Wed, 24 Jan 2024
 06:39:39 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: gregkh@linuxfoundation.org,
	benjamin.tissoires@redhat.com,
	hdegoede@redhat.com,
	ivan.orlov0322@gmail.com,
	heikki.krogerus@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	linux-imx@nxp.com,
	jun.li@nxp.com,
	stern@rowland.harvard.edu
Subject: [PATCH v2 2/2] usb: roles: don't get/set_role() when usb_role_switch is unregistered
Date: Wed, 24 Jan 2024 14:45:54 +0800
Message-Id: <20240124064554.1263339-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240124064554.1263339-1-xu.yang_2@nxp.com>
References: <20240124064554.1263339-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0041.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::18) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS8PR04MB8134:EE_
X-MS-Office365-Filtering-Correlation-Id: 265463b0-89ea-468d-b655-08dc1ca73c9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5FmTo838AL7voan2fT15u4mqVZMhUcLt1Ay6FafPAkM8LW7vTp6AaQapEiVl5wM5dYB6ZRHwVlS9VteUOfsMvbe9xnDLJ2rs4BnFR3kQ3bYCl1uRylF62E09wW4MFx2VsFnZxnFRaqKPxu3BuKydB3ibRlF6weNQi1vnFPE2/7jeMVwx268eTTRiXd3Z685vNXs+4aa5tHxdhRQ/hljOI9tYkTP6z66toa0zeKEg/3tFoxNSxPVQENMWTlFvI0rIhWGzE5FiDzs+arMkTqD7qIbB/7WHBMO7bJROrNdTk4F8QhEHF+3tHqArt8aduksaXqBuLiNiSLW9X9Bde0lXLlD1cy3KJdYdIVLE7R/vLhojGuUTZ6anUfzJEmPxIXfOA0sbmhHoPgHgLt9KD9YdnRDaz4UJhknHomxbO0FUVSX/ckMASZYjPQxVLnRRudOl2T6KsNfZmn9zV+qHn79WuDpnBBKrU2BeOUvSLyotHO+UYTcDHcKZB6Rzpam/70DEJ43N5okdRSSgVX1sWlTA9dx3ETrOmt4Z/j7SMLUFzT7CreXo/yC/n6fo9bL+fdlBIaf6P/VAtrL6BCllM6ePwI/TKSfVAPBJxI+uoXDSM2f4a7f/QIMkzhwjp2Y6TgP6
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(136003)(396003)(366004)(39860400002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(83380400001)(2616005)(6512007)(26005)(1076003)(38100700002)(8936002)(4326008)(2906002)(5660300002)(8676002)(66476007)(478600001)(6506007)(52116002)(6666004)(6486002)(66556008)(66946007)(316002)(41300700001)(38350700005)(36756003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gLnhU6myHG44xxRC1fmaLVDuXlGC+UCTWsrNIzOTrH1/tz1+JKioZSGclskj?=
 =?us-ascii?Q?9c+CZ2z1xBk1xfVkajtVCpX+dcWCRiNOHANHfTWgdu35OOUQDzoNtpKPzd4g?=
 =?us-ascii?Q?rwsvHMU8igBm3z/esxYNFzSIDkDTaOkhmKud7ppTwUZ5FxwFqqU82akxeU0f?=
 =?us-ascii?Q?IYV9v0AKHfag5Bcy3TDflMSdylW1gm/hIbVj+BmDf9VACBEZDfNEBsSxnL59?=
 =?us-ascii?Q?RMW1OyQgYl+Omn8fZt5+H9XzPHN9cLgZuGNi73ZTZwVMHf/WLbW8bjew9FdJ?=
 =?us-ascii?Q?KNiQW8isWHQqrZ3Ednx/Uh83Q9v30IITF9wWjBJSErBClcrm0MRt7ih4ppIA?=
 =?us-ascii?Q?96T6OJ1laXVduQ7w9/1bdPdv8CJHMfdpZwLeqorKyAObdqYrmqGyBRkPwXuV?=
 =?us-ascii?Q?WBkJ9yTW6Qe/H+nb1jqLqULVfcZ0htx7ePibvjVERaFPEi6G+oPkN1ZSmqEK?=
 =?us-ascii?Q?XD5+WixUinp9j1GTvUfv6l9FPHGKYhXZV138FcIN6Dif3Zpj8liADkG2Twga?=
 =?us-ascii?Q?mmec2VwhKdNdzF9xFpyHabWlPr1G2at20Fbw1RLmoA4asKEYummfiM4ms/0+?=
 =?us-ascii?Q?ChmpPhe4QPbmS71dINrZbJjp8NR/ly/O+DVla6Xw62t8nO4udOBVYbdO/7Ig?=
 =?us-ascii?Q?BqGu8ER3p0eD6aMSnHaLnX4JWaRCQtpFG0nzCeSJ8wBrHUGip1bfMt7Jxswn?=
 =?us-ascii?Q?xkgX8hOwrNM02nyQHP9HnuaN3Vzjdh+xtWUPSNjIlF6zmeziaCGDAgTvnfvN?=
 =?us-ascii?Q?saJFzJrtYZ5y1eXb/SWHkaPCgDzasueNiPPkpRRqPg6xEZOje2xtrCju69CD?=
 =?us-ascii?Q?gkbfHmg1aqtXlaw5DGpx1lkeWE1C9osNQMvA7Gle1jCLYgZnGN3usjHYuqyA?=
 =?us-ascii?Q?cTqTFjXb2qMItxzgWY70ePpMmgh/2UPPIuCueSyexcTr3hwpXd+BcT9uV7Ru?=
 =?us-ascii?Q?tmwUzv8/0t8yX+tC/MGdt3dJFif8h0DCLOc2DZNsj8L5Bsawf9xa/sNM6D1g?=
 =?us-ascii?Q?rhX7tzyu0byqFjT06p0aPW25ocUFm2LEMV/SLatRzpr25xRtSYVAdZmJ+Igz?=
 =?us-ascii?Q?MsM/MJNL7ahmvD+DBODf8P9UJDnnK12GBCBcOOfmrU34bJwa8LjTBgb4RCHM?=
 =?us-ascii?Q?yfudpEHeP9jEPTveAzqjWLC3pu764coY2yBh3vFcw4BcgT+iIkaAwDcE2uXh?=
 =?us-ascii?Q?5Dkv5l4BV+YykpnMRSMsnoXpHaBrupBIZ3fVXUqibWC7hTgeKxfsdit2gyqe?=
 =?us-ascii?Q?SnxfRHetof1k3GcS2zyWzC72m4wzu4yNn9g9ZDOHHFr3mTL5/08IBOoyKT5d?=
 =?us-ascii?Q?YLAKtnenAMZiZuGoxxbE/p1C9aKEgQUNcnQa4f3gjVjCjA1QKev7SQLZkX1b?=
 =?us-ascii?Q?77vCd+ioR0/KgJPpz5vuS/1/VdGL5HlZaA9SSPK4EIz1w6Fg7DK6WHbWtOUz?=
 =?us-ascii?Q?XfQeD+qlch87trpXPUxcBczBwiqDULPok+GK23jlnJ6cufDAlc5eB2uD//lJ?=
 =?us-ascii?Q?ltZekhURsOELLMchOXiKCqSaOD00DBNmycQbsN+mC7sbzzzj1LDuu8zJ+qyx?=
 =?us-ascii?Q?a6fAHiBC9832bM2L1+TYPQM4XyWxYDuYJrhjaWZ1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 265463b0-89ea-468d-b655-08dc1ca73c9a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2024 06:39:39.1383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ys89e3RjJ4S9k4OfGonuTkZjLulPWxavLc9MzhIXIoqHfLmEN68Ur6W7UYTQXzMbwPN8fECZrguIU/acq4w7LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8134

There is a possibility that usb_role_switch device is unregistered before
the user put usb_role_switch. In this case, the user may still want to
get/set_role() since the user can't sense the changes of usb_role_switch.

This will add a flag to show if usb_role_switch is already registered and
avoid unwanted behaviors.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - new patch during test patch 1
 - add registered flag
---
 drivers/usb/roles/class.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
index 2bad038fb9ad..70165dd86b5d 100644
--- a/drivers/usb/roles/class.c
+++ b/drivers/usb/roles/class.c
@@ -23,6 +23,7 @@ struct usb_role_switch {
 	struct mutex lock; /* device lock*/
 	struct module *module; /* the module this device depends on */
 	enum usb_role role;
+	bool registered;
 
 	/* From descriptor */
 	struct device *usb2_port;
@@ -49,6 +50,9 @@ int usb_role_switch_set_role(struct usb_role_switch *sw, enum usb_role role)
 	if (IS_ERR_OR_NULL(sw))
 		return 0;
 
+	if (!sw->registered)
+		return -EOPNOTSUPP;
+
 	mutex_lock(&sw->lock);
 
 	ret = sw->set(sw, role);
@@ -74,7 +78,7 @@ enum usb_role usb_role_switch_get_role(struct usb_role_switch *sw)
 {
 	enum usb_role role;
 
-	if (IS_ERR_OR_NULL(sw))
+	if (IS_ERR_OR_NULL(sw) || !sw->registered)
 		return USB_ROLE_NONE;
 
 	mutex_lock(&sw->lock);
@@ -357,6 +361,8 @@ usb_role_switch_register(struct device *parent,
 		return ERR_PTR(ret);
 	}
 
+	sw->registered = true;
+
 	/* TODO: Symlinks for the host port and the device controller. */
 
 	return sw;
@@ -371,8 +377,10 @@ EXPORT_SYMBOL_GPL(usb_role_switch_register);
  */
 void usb_role_switch_unregister(struct usb_role_switch *sw)
 {
-	if (!IS_ERR_OR_NULL(sw))
+	if (!IS_ERR_OR_NULL(sw)) {
+		sw->registered = false;
 		device_unregister(&sw->dev);
+	}
 }
 EXPORT_SYMBOL_GPL(usb_role_switch_unregister);
 
-- 
2.34.1


