Return-Path: <linux-usb+bounces-25161-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A937AEB585
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 12:54:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4FBA565DDF
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 10:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C81829B8DB;
	Fri, 27 Jun 2025 10:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="l8WlggJn"
X-Original-To: linux-usb@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013044.outbound.protection.outlook.com [40.107.162.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453E229B8D8
	for <linux-usb@vger.kernel.org>; Fri, 27 Jun 2025 10:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751021669; cv=fail; b=qDH5mAap2HTbx2SFHZSncHWc9eMZ0XZS8cOqn7BxdV4jXUmJ1M0bqcGy2G/cmd5Up9O9Y/PgWcFXcdiSClnWCbMHrzROavJqQd74x05K1Oi+w5MuGZ9Xiqkyc+yYpAOVCKAgyE+B5bVZx4lxk704XCFKDTInfARST6BhGhXZrNo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751021669; c=relaxed/simple;
	bh=5zo7DJMWVEn7KYJ7ztv/g/Ogw6Kw/7N0lR7uwJO/5Tg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=QTnWDFS5SSd7Ox99qV98is9nBeTJcEp1s3vMwA6PcItk4uOFLwpv2TndPZ2PdZt3Cscuv+/MOEGMWNKrdSoUlDuZehdskue9VwBGw4jb6FCDHld404KVyrChW2D3uv7qFfsiAcCoVQISv89s/z9aFF+N66WfH651Xo4rjIMWgnU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=l8WlggJn; arc=fail smtp.client-ip=40.107.162.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h6C7vxbj4Gc12DeK3qQV7SXe01VestEPK7wMhL8ZozpKc1MV3s1jIasT50bhf9JzWydXwMdAHJ187OTRaA0YmAJUNIKcVdU42FHzJbzn81iNoJFH401Y3M4OcWklXifnSwkkHbaz+ko3Us0dSG8sW2nOwMY1kPyygFDp2oyDJA8ZGb98dQLvo0zph8nuc8b3HkBc52ILozi/AlCg0uFDTTZDPSwVvw9d0uobdE0Hgo/H90ov41Y4keH0sH9IsRfBuVEchJCPHnWmnL38HFZ2quFJzOzmqR40mcyTH4oOuncWpo6vZRRCtRPG2tE5KiWVajYxcB1AR9idGm0NKEBN/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RnfjVh4rgIr2yyxGiEuUqRJjucGf4AFXzlPy/M3GzLs=;
 b=g0rvuVzPtDWWbYyXZau+RXb70ue9VfKgI3ZTFb2p8EhRFdjOdi3sGTb0Yu6FXIU5HfNdixkoyQb9OAKk6wA91nRTmhbHFxtK6nt0GUP9M1bXIgNHAWz0muXQrfNNnV6yoR0ZxHIhNesAhrlbz8w8T4kVb8efMbXGuxtr2m2Fi3WVR3cmz8R54XbYLYBK/tvVAg6SNjorMcHRtg94ikLjUKisE+iZU7pSh9htqSSy/DeejczBK7YObUbennPzl2Au0FTPGvvCKpDI7tJyWuW1SMizN6402nao6j+xBk54PRk6L3gThALLBy6eexbkx/zvqQtIW0zFKEIAoew3NTN+VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RnfjVh4rgIr2yyxGiEuUqRJjucGf4AFXzlPy/M3GzLs=;
 b=l8WlggJn7QKGod6/4RgHAMVM09qQ7mA2a68cFBSwO0CXt9KFaC2TeSMwNrGkjgXXhm7Br7bwDDdxvS/SJsszepzW9mjklCjosx5dl1NkpQQsSAPZqFzzOhb1qR3+7LyHQNiUmmvI1wNg8R0LwDdPdolFpyPstTqLNPO8BJiA8lZ5tYfKXXFCzZT6Uxn00OSwg1mwQ4ucKyksChimDd/ZUAc+1sPjx/FJ3Abe2AXCDIqQXxGuEKCEceLmjxArr49JG6vFxtg150T+2i6eY7LqHpGJM923i6nMqaRa1OM2JRedM8EtjZbDf5vFWrFJUKMh0lnqHhaqFBbVLvKeFLKssw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by AS8PR04MB8150.eurprd04.prod.outlook.com (2603:10a6:20b:3f0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Fri, 27 Jun
 2025 10:54:23 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%6]) with mapi id 15.20.8857.026; Fri, 27 Jun 2025
 10:54:23 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: gregkh@linuxfoundation.org,
	stern@rowland.harvard.edu,
	viro@zeniv.linux.org.uk
Cc: linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH] usb: mon_text: find valid buffer offset for iso transfer
Date: Fri, 27 Jun 2025 18:56:51 +0800
Message-Id: <20250627105651.3653231-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA1PR01CA0170.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::20) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|AS8PR04MB8150:EE_
X-MS-Office365-Filtering-Correlation-Id: dde017a8-d8c4-4928-d55d-08ddb568fa0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Zp6Ih6jjSlYk5miXGEGFaF4zPIx9TWc5mk3EF0wQjK+aud7hWOQHHAKcQWdo?=
 =?us-ascii?Q?8pMIKuO7D54sCo0hfwknW0DIEy5I6c87YxEHap5Pq9fyeeqh9HCq5HTTgRIM?=
 =?us-ascii?Q?cgI731ssSbp/VTC6LpwlSfL3fi8r7N3garW4bLNeHmse+VvMSuSZNKC2rlFN?=
 =?us-ascii?Q?qEWvroTV7SzustnQj+xUQ44mTUxfXm/kvzN7nHZ5MpbYQdRW3IdlBQ8LLpgU?=
 =?us-ascii?Q?8DxZ2R5ht/QAtBOe54qShj+6aWyLG4L0GO2xNg72t0C7CxUOapR7v05nzHuU?=
 =?us-ascii?Q?U+iL5Dh7h4MEhSlZQ2wn8J2XnyHtnC70typGT9GfGF7ktHWvU4ogILm9UT1e?=
 =?us-ascii?Q?AhBa00LFE9AIIL45BOydrVAtCOwBoS9Bmi4ijt3YmTncNx2r0wbKpd8YUmSq?=
 =?us-ascii?Q?IxP8cAU6qgDf891ldK/Puax7lY1vDqJAProrwr3ADhoIZN5X1QQ5hmoaYTqT?=
 =?us-ascii?Q?1mMDqALSKGzznkbEupMCZ1jKr7NH6GivzmUQcNOKjIxBKnfj0UmsRoAriz/K?=
 =?us-ascii?Q?vY1yWmgEnRLUrcF7jCVR9uJABMHziHqUv17Tf34eIBvYzqYmSO5+OOPd5EdP?=
 =?us-ascii?Q?Al/gJWMT9rMOwud/BXKBqHzBOfqAUO/NqJXpCHUT59Ep9/WwWulXbM/slo+D?=
 =?us-ascii?Q?aEeRUGXDb4CiWEJ/UojKCDgg1fMsqN/XFJ5MbkDBK39TONprxlj5si3Q8MCq?=
 =?us-ascii?Q?NiGs8CDRmVSUDljX3yK0a2YXOEeppjBftGhBIsOt3em/d+waOmR7s3TE438d?=
 =?us-ascii?Q?qQUXr47ukWZaVrgoQWXotwnrYnC/fntrV736ufpMyyO7NXkES+mew8YkxDnx?=
 =?us-ascii?Q?1o86exWBcglvi2JXmTBU4PxAyQi3RTZ9xpmN3JsQJdc+NSn5ovdvQbHuYbqi?=
 =?us-ascii?Q?/XRTqXY4QAfoZj9J2ZlSpX20ZqTWTOaiT9nI74ew5yF2eFE1IqvFHarszoaO?=
 =?us-ascii?Q?WXOjcy9vS1VEDRJa9t4Yuv7QdYW0y6M0wSdtSOdvXLTfpIUJKB0a2pKVypz7?=
 =?us-ascii?Q?e3GFCimoZRgWJMxln8/rJgTp0mTD6SyFSCkRFUYRq0HXa2bG/W05RkuMZ1I1?=
 =?us-ascii?Q?QWm340o/toKnliltjzGnJ5j0ytMhQIuRTspaKHCn7Jf36mex2D3zAX3fda/a?=
 =?us-ascii?Q?SvkdYR8juapCCn4PKT4PVIfxsroSupkbUf8o1x68qWHqvrYhw3pk0566X91F?=
 =?us-ascii?Q?jJYCTjZK2otI0ISmZrjQU/r+mvDwXi7FXO54xBUMk+yHfnQTJVib9QGGpaES?=
 =?us-ascii?Q?FU1bXfZfJV2E1JebeKR9/ZadvSLft1aOAtON+oLI7M3SvGz46TbNQplra05j?=
 =?us-ascii?Q?ssozXlUxJZlENA2ikxmWcgJqNbyQLoXmiqMM3052JCx1iliZ9GoOJO8jliBg?=
 =?us-ascii?Q?OssADICUrgwUUuQbyCAQhAQ9yFDPmS5+afWmpppWZAwn4Yz39GGTvReoRWCm?=
 =?us-ascii?Q?OH3YmPP+DjIxcW0lbfdVzRWhjye1oO04hHq1heXpMCKd6S+GtuxntQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zNwfkRHCO2MClOJUEoZPsWo6uurQFFJXOQEFoijwphFDyXd3Wjwfxq5sLFav?=
 =?us-ascii?Q?YvbAEzJRQvUyO3e4mDd9AH0trW8OmXrcVD5lMjnUOKzPvRcrFImY0qB/JLZ+?=
 =?us-ascii?Q?Iak4/GYsPM9Ml4kROGFD7iabTFFbTtQ9zmUZ2/mhZm0tZkBBD9AyE3PeRwhI?=
 =?us-ascii?Q?GSpmvDlMOPeSD6LERXLqDH+XK4LeQ01wEDRG66hTlH7LtfOqLHTm6Nkephwi?=
 =?us-ascii?Q?vX3vgHpPnqEjTteK1FPV9zAbpTyuT55sTejWELEedC2JBOWwEA3Qg1NR+se9?=
 =?us-ascii?Q?bj9XmDv+YljsxzeNVqEvLRSVP/+ySLr4aQM3dwonu/VGIBQgNIS//Te+gsHM?=
 =?us-ascii?Q?WlDA3CIM36UMHRrUJ/1BA3C4l3rBZlHt7F39ayjftt96N3mT8umGhpOHxUUI?=
 =?us-ascii?Q?Gn2VGkwlE/VdY15zq9ILbaMYJzGPsVzqUoAqH4FAP2ei2Q5d3gUfQhm+qr3b?=
 =?us-ascii?Q?7rW2fXGpfptCf/cDA+ybQqF+UiWS41ErxXTjQcdlhI5mecBfYihY0dkNv+es?=
 =?us-ascii?Q?gcQUg8dUTyN5Ur5qbR1IQkvPETW/iNXbSOrVRoGQG1yZFfSJp3pHUZJQPDFO?=
 =?us-ascii?Q?SpRTcr4OsIoGp4+rtk4rxmSYuQORjJJW223kKNULrLbDdoVKTYMRu3mmYgz4?=
 =?us-ascii?Q?v1AW28znGnWwr/RvVS0lYRigu6N0b2fWJvNBELaO0+mko6nAm+RF1YzEWrbt?=
 =?us-ascii?Q?QhoxQa1fB+kyqQ88U/sNA/Hg918GqLA2VRK7BJf+Yj9aT0f6xeeWEWFVyaMi?=
 =?us-ascii?Q?5k0N+L6XmASPoYtjF+zTo5kgS9nsGcWc7DGUsa8NAWye9inQ5IJuGNVsrcVh?=
 =?us-ascii?Q?4Z864XCHQQgLoEV14UDxgRKzVG+TA6/SnLz3cv/jY/+Ipw8ZuSViWGfyX2yw?=
 =?us-ascii?Q?JaiWhQbIWnHLnT73xL0ImIcjOikMaZ4S8g687by44pfZB4p8R+M97CxtH1Tr?=
 =?us-ascii?Q?/8joFIB0MdQX6g9OicWfktK5jRJSWouG0sX0KnRf7POZhZjsWZCpGJnZpOej?=
 =?us-ascii?Q?XNZk9R4/nBpPol7/l0CoX7yJYra7ZyFvryh3QjIJIJsL2ZuFhIFqlf4r93lR?=
 =?us-ascii?Q?zsNwDH+Im7932rSI7I3r3VSKgYBXkyoUxI0+h7ZjjwEaYZJ/apQROCwMHo1n?=
 =?us-ascii?Q?8ao0F/s/OLV+pujRoM8ybVSOlMEdGUAE2pT3lGCAU/y2uOalZ1h++SC/2ABR?=
 =?us-ascii?Q?ibN8cWiAs75MfFFcj1cb3Npz77GFU7wkJq5dEWIv1BMOr7bh4eaNQagDPAId?=
 =?us-ascii?Q?jXxKx0gKtnvhKbJ26u6ykLTV5PHd2n1QfXd8ESGzbUNc7d59PoFJ4O4jy7u+?=
 =?us-ascii?Q?owSTXXtkTFkTV+E4NJTeFNWgLoZt9+uD71IadKgNpsg8lt6jEUZds/q8IZBr?=
 =?us-ascii?Q?v1RGfJDCsw7V2cOyqRqjs4juEQnZgXkl0GO8F6QUmFGWG/dXGGojgHuIDKka?=
 =?us-ascii?Q?JccSv4sRTpicjTABnR8BpAp05/co7rqJk9ztugNgAX/cntYd3h2UOYsp5Vcq?=
 =?us-ascii?Q?9y28T1w1OBIbbhPdRTbtfY3Dk74dda0cjm20pouxTwsMv8snM9RwEen4Yh2F?=
 =?us-ascii?Q?14Z8da4tsB5pl3xYc4WHFjwUJwxJRAOHDF2sggRR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dde017a8-d8c4-4928-d55d-08ddb568fa0a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 10:54:23.5346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6B3gKKcovNnjNw+4fCC0Nu27kBEUJFFTC4HBvyeKg1uP0gwnsgjh7EhDGkUmAZy8GfXE71QzSlUqP53YJQxL6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8150

The valid data doesn't always begin at the buffer head in case
iso_frame_desc is larger than 1. Otherwise, the output info will be
meaningless.

This will find the valid iso transfer frame and return correct start
address offset of buffer.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/mon/mon_text.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/mon/mon_text.c b/drivers/usb/mon/mon_text.c
index 68b9b2b41189..4929c7f5abd0 100644
--- a/drivers/usb/mon/mon_text.c
+++ b/drivers/usb/mon/mon_text.c
@@ -145,6 +145,8 @@ static inline char mon_text_get_setup(struct mon_event_text *ep,
 static inline char mon_text_get_data(struct mon_event_text *ep, struct urb *urb,
     int len, char ev_type, struct mon_bus *mbus)
 {
+	struct usb_iso_packet_descriptor *isoc_desc;
+	int i, offset = 0;
 	void *src;
 
 	if (len <= 0)
@@ -160,8 +162,16 @@ static inline char mon_text_get_data(struct mon_event_text *ep, struct urb *urb,
 			return '>';
 	}
 
+	if (usb_pipeisoc(urb->pipe)) {
+		isoc_desc = urb->iso_frame_desc;
+		for (i = 0; i < urb->number_of_packets &&
+		     !isoc_desc[i].actual_length; i++)
+			continue;
+		offset = isoc_desc[i].offset;
+	}
+
 	if (urb->num_sgs == 0) {
-		src = urb->transfer_buffer;
+		src = urb->transfer_buffer + offset;
 		if (src == NULL)
 			return 'Z';	/* '0' would be not as pretty. */
 	} else {
-- 
2.34.1


