Return-Path: <linux-usb+bounces-24753-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9039EAD9CC7
	for <lists+linux-usb@lfdr.de>; Sat, 14 Jun 2025 14:54:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BE583BA03C
	for <lists+linux-usb@lfdr.de>; Sat, 14 Jun 2025 12:54:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 402A42C1786;
	Sat, 14 Jun 2025 12:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MwPFJBTh"
X-Original-To: linux-usb@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011062.outbound.protection.outlook.com [40.107.130.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39E42C3269
	for <linux-usb@vger.kernel.org>; Sat, 14 Jun 2025 12:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749905684; cv=fail; b=pbX/0BPcTypT7GacEsb72tJQrT42RE80AJe66x+wMfuKcQM8ZjPK9QWniTXA1SI4o3CXqubdlBlzM/uqdoydoYLEOOefZDDa0sDA6rgbOmcRqgnVb1NLGavlbzaJdScicgVbtAhMXWxACSAL8jw27DpS/HO/HXR95EiMAfCQaYE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749905684; c=relaxed/simple;
	bh=IaJCx+C1hoW+uNpLo27sOeuDPW2oyrQ8Y3EcKi41Sak=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JTGWtcvjFf/MrR7B4QdqMHA7OzloaOPVTN0X+BWabIChM3leuyeoDfHFmJRow0EyQxjrgLKLtGFT39rMM6K0BMdU1nAu91L490wdm0RtTkE5VjfxTiokpvtMAxlzEeib9BEnd3g+lLmBE9WPmd5hfpp/Sx0Jhu/g8YFte9pa8Tk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MwPFJBTh; arc=fail smtp.client-ip=40.107.130.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SPyEDiH7PTud78O3gHwm6+7wv/4GsOmm1pBkhvcwvaXuY6lizGyzc5xTQ5qIAfPVNviSHSOmHuU9XGVoNs5bor5sLJo1i4cKuCtwUNXnq57igshcMFLgG7i/wfH7iArQIXfrPVqjRooubZEp053UkDqYGaLoPFjx1rpC9u3GujdlhFZyce5F1sAQJVoYh7hsboX8HuAHpVdDsHztJW9ZeylgGm+ILCIQLFvrvEfxtlyt70WpijzsXxhnWMLb1EROk67v0ReeTRTtVa2DU7ZyKSe6MFwN7O9vamw3SKIRk0DQHzz2Vyu28AMiLJ/T9EQ9YTP3+bBb+lYkqF9NAlCQ5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e6V8NSi9e0u6yAl4REaHsMMg5FYKoLaEz+0hhohNVQQ=;
 b=ZQvf1JAfzYET3gjL0qR9iOvLyWkSAHjS7/ZCBMOWIR26Ilr2GPErDqgJnplFwrop2J+iiuYNSOmvw8DubJ2CzZC8F48Z6s7P5n/tr24eP+F1YxuoKdb8AhBI47AHylNfHUdwspO8vpoAgx1EYVfj2Ln8QNZ6Zz6j3CsTIpf1IUnUHf07h9/YKBCtTjDfT+WxILBtpyuOTD5E0gX1TYuGHjsKsl4J2L9ukpJNdhLOZvw8JjL9ZJI3stLGNxlfUQhxqv4B+GTaobqsHP5ZrxC+MOPILB++NSG3M0u3TvwlDq7vhzgv/80YJmGrP3NL7EtbP/3uo5p3I9mrpsJS/J2uGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e6V8NSi9e0u6yAl4REaHsMMg5FYKoLaEz+0hhohNVQQ=;
 b=MwPFJBThv/UoCBDx+Tj8hb+RrrOM9U593thf9uIQXD1cZyhm5nkbZvOJc1zQSiQxXPLodfM/WdfUgy17Ulc5DBx+NrJX7PinTJXWR31HwghHOQp0ImBfmznHbpY+3kkfShJCcS2HR+TKrq7acjZMrFdjAJ6mWS7ntRXwlmUQ2jOgqLj0isdtb6Ax5wSBTMRiODLek6Z7KbMWXZkXZGOxkSgj+4euRWsfFXnhkCXxkNktVooRER0q216Ukop3r0qeybDEJGZZRjrvid12J8sDjx8XkGS6GLXOEsp5QIEXbYf7lZt7w40/+xQ1UmR6FTtM5GWc1jLH6eUxf86wieHvMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DU4PR04MB10958.eurprd04.prod.outlook.com (2603:10a6:10:581::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Sat, 14 Jun
 2025 12:54:41 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8835.026; Sat, 14 Jun 2025
 12:54:41 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.d,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: jun.li@nxp.com,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/3] usb: chipidea: imx: implement workaround for ERR051725
Date: Sat, 14 Jun 2025 20:56:45 +0800
Message-Id: <20250614125645.207732-4-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250614125645.207732-1-xu.yang_2@nxp.com>
References: <20250614125645.207732-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0007.apcprd04.prod.outlook.com
 (2603:1096:4:197::19) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DU4PR04MB10958:EE_
X-MS-Office365-Filtering-Correlation-Id: 268fdd24-c96d-458d-3048-08ddab42a0bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1g/ew35wpSOqbqOmOZ2IR01I9KIBlOaFso83VQ3yCUy2GrqTqwdUeR8D7GAC?=
 =?us-ascii?Q?rwdViclWDk/ORAjRkaMwuadDU+tDO1qNKVDmXI7hBKJ8CVxLVQK8oXiBd+H4?=
 =?us-ascii?Q?18266nXSWZyv8xzDk1VUBrEpXKdRhbVUzJciJEmCjWVGRzKwMglB8yCSRT1y?=
 =?us-ascii?Q?NZUyfZmcxo9sJ2ZjT7+VHKF9Ajwed6g35Y94U84Tqb/nqkfGBeZjDRJYnnI5?=
 =?us-ascii?Q?EJrx9FfxGL7bEUJwwpxzvi+eR/xLq8afOPi2WLakc1AhrOIsFY2sso9Ueu7B?=
 =?us-ascii?Q?yXDbPqByP5jHwDR616uQWvGeGU5YCVa9xB5+hRYjOZ1Sf9LWkEVJyGeEZKCF?=
 =?us-ascii?Q?XLjLAUkmudTUanKfLkwHzXF7/8apygVu4MV02oHA9/9jsGzN6ARVLa7ledu2?=
 =?us-ascii?Q?XyISPQ6HBkXoQqk32v7OBz81I3HRMJ2zyVdEeWUUpTgG0Ag2/JhA+D9+qtbB?=
 =?us-ascii?Q?5MLqJFs8CyYiNZO4Hsx2mlxtwEd8/G8ZEG35rId6N10knfi6X4XPEKQa07Vq?=
 =?us-ascii?Q?/TeEuUST90Vum/lWOc7SmDfxNKPx0kTH+oKZ5OHpaA7FA0RQIEgvq05HInHF?=
 =?us-ascii?Q?fNTSbCOzhC9zbwCQUauir7LYfM6PjLQacYZ6GITlfqlGUQZQF1We8cAqR8+N?=
 =?us-ascii?Q?Me1G2fYY4vHGsfi3lUiDq5U6yLUlOw0kt1+OXSH6rwpF9F5J1+GT2OYzV/Ad?=
 =?us-ascii?Q?6Y4DUYvLP8TkaGRnhGmJRu/Xj20V44bczFmZN/53wOkH9SHCRVihBRIhUHq7?=
 =?us-ascii?Q?c8BeHPgBBC9R2oj9sq5FqfMtwC16p0WmyQYobqRD/hKIq4otoEJKcdjZPNyE?=
 =?us-ascii?Q?tlvl5msIOJ4RC3w21Jt4BCxtM5wm5HlM8Jk2UggOqS+Ctd1I8R3HwB2M/rgw?=
 =?us-ascii?Q?poP/PPyWc94Vt9mFpJ7JUNQDRjKbFgrZn5mjIJF/ylmC4YOLJ25DXYvJaE3S?=
 =?us-ascii?Q?kbf58GPxBS0xUp5PP+5UqiB7+Za9lKc6K3m8hrs4DcpXhRxuF/QEg32gQfYd?=
 =?us-ascii?Q?Ymg9IK0R/BKQd2JoFBwQ7bxa+aSDBf2T8OK5T6Ic9fODbSjLHeJvQWHjpsQE?=
 =?us-ascii?Q?ZKGokKvPbEE5gKTlUXqUlY6ds+sDZdQYrzzCmv2w31r6B+qkwrY0kvPfCG4Y?=
 =?us-ascii?Q?1MocAma2kbKKOHEeL2IgWuW4NeZwKv9bwYXHJERqCsQQlmsQXY7/PlR3dFY5?=
 =?us-ascii?Q?BHGnuYY3ku41WpHgxYOW0gvvXVErd5ur8eOTKoIv7G3Re3cHPi7jaSvSW5e7?=
 =?us-ascii?Q?2Tr0LBv+e2oCzn4imht7XuroP/inje8G150IT3jwJ9NfC9gazWYdkFLZF5BJ?=
 =?us-ascii?Q?rBRj5VJOlugLC92iZcErVIS1+7gJZNQv2NtlJnLWgvUOz3Peq/NKLkAIEo5u?=
 =?us-ascii?Q?FyflMu0BjCVc/7T/bKLXVow9urWFiNgnxkdC8g0h2wm/3BV9MbbYQ0ryCJDX?=
 =?us-ascii?Q?0cZLSNBk++y1qbLSC0JKTaDa+bMORM6N1ShCXv8xTA5ZKPVjUPE3wA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5Y7m25aZyP8RsSp2T4MNopqCrp9S/CBmF6w7d/QjS96jRGFHK+YZQFdOIBKo?=
 =?us-ascii?Q?daBU1FaONijBBTSpSwq24rh2BaL4awEu7FicWCfEH3YF3LwfaMcLx+oknCdZ?=
 =?us-ascii?Q?AOc7Y7eZ98raNzYJfTkIO8WMYtqhVM4jdjxgcJeUev+x4ZzB3Khj7l2vHiz7?=
 =?us-ascii?Q?bOnUpT7PaJFMcSTvhURogawZPT7Hqy59OgXH8qNNGt2h8gPfly/kJ0H08cHF?=
 =?us-ascii?Q?nKgLBG1MLnjMJb5MIfKir6+yYR9etdWm4ExAEyFMxrtpJFn5UnNNRep/Tgfn?=
 =?us-ascii?Q?/+yyaN5GkTXuHvaMacT9WLb+LzO//nJ9kFLFTuLktD6FjogPPO+E6XevRXlY?=
 =?us-ascii?Q?uTsY2jLDx23Mp/fuunBZLm2ig9jp99ARos44Q/HKZ1x6+99pFR/6fFzlK0tm?=
 =?us-ascii?Q?w8H0ZsH43wQ9y8JuH4nPClwh/IRVU9sTKEiTPYm/8qO63qmukIWfKWu/DBTk?=
 =?us-ascii?Q?Sy1OvnE/L2JDOW4uZnuA+2Qh6tVRUyTxL4eZMLhRnQ2+AO5NL6nwlUh6rrvW?=
 =?us-ascii?Q?hzLixWGX3BFYwKk3c85rNiMeMH9RWob8cUeD8obCmLnA/TGAUoN79fNNQQsw?=
 =?us-ascii?Q?aIXEEsCexedLnCFyi4fFiF4Ae3/EqaETG0sdzPzMN5ABsw1KRs7t+A254d3W?=
 =?us-ascii?Q?Cu3lXouDPCb0AMvID48zoMJJXLPA00RsKu/ruB9Ksf/uxu85o6gmv3IiDaOx?=
 =?us-ascii?Q?jKKQfALWlGe6A/+ZH7YNkaHXMron1oLCbvNQqSLtpwpPJc/S44jnqkLm59QT?=
 =?us-ascii?Q?djJqhB7bqYps+yfrZ3tHd29rROzaDkqjYRmX2Xaq/cEsfw2Kw4KDj6dHeCQC?=
 =?us-ascii?Q?e7NX/Uf05dsC0dVugxzLiV6mLGCc1JARPN2IcQdGQ5hoS7l7uzaY+T4ILzwM?=
 =?us-ascii?Q?sst81v4HDkUdj+rpW8BQwJFCh063NzUgUiLcdYAzZbhhZfnuQkmn01hOKFPB?=
 =?us-ascii?Q?G9/3jsEJyb+MJ/jYJvU4BNDcrMoJRaUeDlx++3EjReVxnVLeI3ijBZis6gkP?=
 =?us-ascii?Q?/H2u92X1kZJG+slIiispVv4CbmDDI5NsF8UAEU86IzSEyG7bsjWD8TDaV2jH?=
 =?us-ascii?Q?6GS4GseN4xJZxc5aD23/uGXyJglz2ZakWvcu42iq93ZzlAwbpUA5hX7+24Tg?=
 =?us-ascii?Q?B/bNPPFpqUENOcJBiCEcISvikr5mWp92QS6Cj9RaHIcQsFCMutR8VRkda1Rm?=
 =?us-ascii?Q?wBFXob8S5DP2DZBT7MkztHd4ameAwhH7iVVh4F0NG5HJr9CZxAy/pTKWlvuK?=
 =?us-ascii?Q?OwtrXKVYdvlPDz4Qck4ZFo6OjDi43KXHzOu5SAqzoEKF1wjuWpQXGBSbasQS?=
 =?us-ascii?Q?GkFZfCHaFjBwwDeHnj6PnTbZCtZeRbqYCDX92MlgOtoGyE8PyIE1W0sHs5Dc?=
 =?us-ascii?Q?iuyTDH49gNGjqNYaCrZYnBmiiMTzDXHcl32u3UwM9ysfwkP4styO1j5Kl7xX?=
 =?us-ascii?Q?vvPT/9DEjP2RgXI5kSez4t/mWWI6jseVZj2618EhnvDc+lyjoNQR1O9h18eZ?=
 =?us-ascii?Q?xf0Yn/G2DM/X2SCF6nFKbjxwT6uAT8c2LUPfg/EzaF2lWXpOpegoqUonrEVE?=
 =?us-ascii?Q?vfRRtiaMIt6YV0nKf18sflHdruSlVvUkc4XDILo2?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 268fdd24-c96d-458d-3048-08ddab42a0bd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2025 12:54:41.6196
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7aDU7AEhKkEH03pBKrmKpHmigdW7ZWW9T0VfvPNWqmRRWaAxvFJmHp+QotyFPPdb/DJPJoBhfLUNzHc0y/XCpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10958

ERR051725:
USB: With the USB controller configured as device mode, Clearing the RS
bit of USBCMD register fails to cause USB device to be detached

Description
1. USB controller working as high speed device mode with USB gadget
   function enabled
2. Cable plugged into USB host
3. Use case is software-controlled detach from USB device side

The expected result is device side terminations removed, increase in USB
signal amplitude, USB host detect device is detached. But the issue is
that the clear RS bit of USBCMD register cannot cause device detach event.

Workaround
- Use the below steps to detach from the host:
    write USBCMD.RS = 0b
    write CTRL2[7:6] = 01b
    write CTRL2[8] = 1b
- As CTRL2[8] is set at detach case, so attach the steps should add clear
  CTRL2[8]:
    write USBCMD.RS = 1b
    write CTRL2[8] = 0b

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/chipidea/ci_hdrc_imx.c |  5 +++++
 drivers/usb/chipidea/usbmisc_imx.c | 21 +++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 780f4d151345..79e466e17788 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -331,6 +331,11 @@ static int ci_hdrc_imx_notify_event(struct ci_hdrc *ci, unsigned int event)
 		if (ci->usb_phy)
 			schedule_work(&ci->usb_phy->chg_work);
 		break;
+	case CI_HDRC_CONTROLLER_PULLUP_EVENT:
+		if (ci->role == CI_ROLE_GADGET)
+			imx_usbmisc_pullup(data->usbmisc_data,
+					   ci->gadget.connected);
+		break;
 	default:
 		break;
 	}
diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index 9db67d6d0ec4..415d3ba2e9ad 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -998,6 +998,25 @@ static int usbmisc_imx7ulp_init(struct imx_usbmisc_data *data)
 	return 0;
 }
 
+static void usbmisc_imx7d_pullup(struct imx_usbmisc_data *data, bool on)
+{
+	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
+	unsigned long flags;
+	u32 val;
+
+	spin_lock_irqsave(&usbmisc->lock, flags);
+	val = readl(usbmisc->base + MX7D_USBNC_USB_CTRL2);
+	if (!on) {
+		val &= ~MX7D_USBNC_USB_CTRL2_OPMODE_OVERRIDE_MASK;
+		val |= MX7D_USBNC_USB_CTRL2_OPMODE(1);
+		val |= MX7D_USBNC_USB_CTRL2_OPMODE_OVERRIDE_EN;
+	} else {
+		val &= ~MX7D_USBNC_USB_CTRL2_OPMODE_OVERRIDE_EN;
+	}
+	writel(val, usbmisc->base + MX7D_USBNC_USB_CTRL2);
+	spin_unlock_irqrestore(&usbmisc->lock, flags);
+}
+
 static int usbmisc_imx7d_power_lost_check(struct imx_usbmisc_data *data)
 {
 	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
@@ -1115,6 +1134,7 @@ static const struct usbmisc_ops imx7d_usbmisc_ops = {
 	.set_wakeup = usbmisc_imx7d_set_wakeup,
 	.charger_detection = imx7d_charger_detection,
 	.power_lost_check = usbmisc_imx7d_power_lost_check,
+	.pullup = usbmisc_imx7d_pullup,
 	.vbus_comparator_on = usbmisc_imx7d_vbus_comparator_on,
 };
 
@@ -1131,6 +1151,7 @@ static const struct usbmisc_ops imx95_usbmisc_ops = {
 	.set_wakeup = usbmisc_imx95_set_wakeup,
 	.charger_detection = imx7d_charger_detection,
 	.power_lost_check = usbmisc_imx7d_power_lost_check,
+	.pullup = usbmisc_imx7d_pullup,
 	.vbus_comparator_on = usbmisc_imx7d_vbus_comparator_on,
 };
 
-- 
2.34.1


