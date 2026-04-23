Return-Path: <linux-usb+bounces-36441-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOZ5Aebx6WkzpQIAu9opvQ
	(envelope-from <linux-usb+bounces-36441-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 12:18:14 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A29FE4507BF
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 12:18:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A9A33301B5AF
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 10:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F3EB3876BA;
	Thu, 23 Apr 2026 10:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bDKkpjOK"
X-Original-To: linux-usb@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011039.outbound.protection.outlook.com [52.101.70.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615FD386552;
	Thu, 23 Apr 2026 10:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776939462; cv=fail; b=o51W0hh4JXJIcYLkZ9Tov3fdNvC6uRu79RejM9Yd02ilZ386MTOJUe3rUn7QovFd1eap/9vnUIcOnzc7MGKgtcLFNLf3FWQaNFrPVF6PzSKnQ8LaQ4WU0mjdZhEaU3upPxGiYlj9oyTj9oOjMRll6PFeY26APxc+PRh+2d14rCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776939462; c=relaxed/simple;
	bh=nk+UL+bFCwwzt20ge0U80XZIC15oLvLYXB2MiKOrsgY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=J7lEHFvMd0/kbmqK2GlJYOAtxFyvc24Afmakt1P66Rsy7u8+wAIeXEe8fQ3Mbi6PwBJjoyiTAS68tKo0TuyXakPk84P11SD2b/vZ5Y0O6rhYc5lfKkO88Sp4QUF7/Uuy1S1JLm0r+mEI+WI2EK3D5b+xlA63+Pr56lbaWTVVnI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bDKkpjOK; arc=fail smtp.client-ip=52.101.70.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hd99P2UocC3u6VrxTI/B9kkM9qb6Tag3dLXIFWxSTKutAEwCs/y6buCkbzG5Cc/kJyRPdgfQ4NujFPYYF1oNAfQGe2r7DNDeeLS2unkWcx2tcYudGdkSXn9kg3imkzvZO2FMwP7c9zFG6xXZ0//WoZx5sWcevIn55GUjPmltGi2W/fIom+1w3+eb3VaAk9wqRwvoz/UX7croQsq8qNU8zQbYqZqjEUD9MjxjmkmLD1kZydJkONyxAS4SbO+GE96OPC7kyaBmFbV/Qd/0MYBSEdoMvH9YaT47RH4M9wc5jifwf2n4XutpsVhAhOdPgAl8XDqdwth8S/6/+84KfMI23w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pCj7c6n82PTBw/326tgPMOUA20GxH0GoQLa+2fn/Sj8=;
 b=OxKgHP+7lkKWx3Srtm8q6cVC6eApZhhvtMXySyicTrrHwZwOVPXJAFniJdpw2EAKO2N8Hmo/AencM+kdvhmxgSKbRnebdd7OeDEQRENsnHdJjCLd73fy/AL6TAAKeaA27D769niXC03yUPUqHPgT7yQKQtwU4rr/3e+IU1Lt+cvDrnkESDp44ugZdqVL+8QPLY47g+8GOdWfX39c5AHqGLyk7whYn8hG78N2aeolFz8lnKRs3cRlwaNW4iZ7pqun/TZ2u6CrX/o/b8KtR/3cErO51ZueoskvwyHDSlVI/GxqvOumgXx7GBU0H2CxC+EnQSUcbN6n/jY8M+ZaqCY4Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pCj7c6n82PTBw/326tgPMOUA20GxH0GoQLa+2fn/Sj8=;
 b=bDKkpjOKY27HWetRDpIuBsIB48XJ8nACKGVXarUqDBVwCYGwJeh2vNgkejsh8pPhNNpLuiKMzeUGcvuwEDSVve6ZN+kDA7Ifh4rTO0AS7S+O4eNfENS6NanluJ/SrRdkV1jS6JkF1U/EJy2XfQ1AVmmm8Px0RlTtCb9s3WC571pV1E6vnyvOA0BOd7yCR/rPYs8rxY15O8pnV7wotMeaHXh5dPgZBMgp4RPeDdD7bmR1cU0w0Y50yTpGJ7AU7Dsyef11g9cV/tQE7Qmarsx/Tnf9t++Yvyo/jABQOH0Jh9dReaMNMSMPt9A2vTKnwGFh/RRPtfS6ZtjE45hSyVoSzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI0PR04MB10855.eurprd04.prod.outlook.com (2603:10a6:800:25b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Thu, 23 Apr
 2026 10:17:38 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9846.021; Thu, 23 Apr 2026
 10:17:38 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org,
	jun.li@nxp.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH v2 2/3] usb: chipidea: udc: support dynamic gadget add/remove
Date: Thu, 23 Apr 2026 18:20:01 +0800
Message-Id: <20260423102002.2675414-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260423102002.2675414-1-xu.yang_2@nxp.com>
References: <20260423102002.2675414-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::16) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI0PR04MB10855:EE_
X-MS-Office365-Filtering-Correlation-Id: 15724588-d2aa-47d1-b8c7-08dea1218b68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|19092799006|1800799024|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	sVgW3HVCdwwG41Gh0ReGtJTclyEROOGXpkDC7FVo8TfZqhjDxNNWQcAyeOozBkaPP2nI1k8AjZ/FAKzHvuwuuUwc7YgpVwrV5Evl2DXqx1PVS1bY0c9BAviu8jCglrqgWLaW2nPQU/DeZ7NOQZqMEawsNC5BYjIVdCxjYgG/46wDv7QET+/upabaVGJ3269Z0HS8/p4V9WwfdP1GJ7nkn/NFkT6XAFqbyFWE7UwLTqy0VsaK/+OmP1ZCPjBwsPgt6OWYoWhh7SJ0n5o+F/NctsbPM1uCv2/PlMSQckHzxT572vqv7QhK/H/BT9/nLrBRCS7U1Ph9Jv4dAhfCPglIZPKMN9eJqGAKrKXq4c6LtI1hzbNqZ1HSBkMa9mlYOeTUzfCD2O4kgXSL/A3SCALMkES6imlU0ndAGaHhUpWX0+U8CHKSeGpGf8LJsTH6f5NiECQWI5xbMF/Yl7k80OFzKb11Vrls2EO7ELDu/A4bt99RTrnRaubHa5EnBLue4wSg2+bGcWPQQC1wUX+tB69rJ9VM4A6Hz8y6XTguflVZIY9iKIV6BpthlAfcQyB6lrrPBBAb4o8J+acEQ0aZAlDvWyBjo/jDmlVL5wZak/PjOwQI+mdyuhPFOdy9WAKfleXSauxIyIqnt47scJINOhvn1kww7R9AQebEDqmZzUFLywOm2FOCXFLYniyPtGivNm1yq1lndxHcou2EkHdGC83nr0ziOvvqKA6fDO3BZrSCi0QMltG3ZfsCyl97jnrMvHl9/Eb0ECDzw+1qTBBG9TJrqSMXGpTPIdmjS1JarbM/4no=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(19092799006)(1800799024)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?R/wxFk3vzafCNFZu0gl1u4LaxdLQ5uA3trPg1iw4Xae2YIxY7vtdZyIehmwA?=
 =?us-ascii?Q?Z7OupWcxccLS0On0Id4zQZHSO/O70YAd/nCgjIEEt4kb54APO4u4qzgeePe+?=
 =?us-ascii?Q?kpLD6dSA+/CmktGTRmqNfBpixcAF6BDIbPEQzG/Q827oLXwuIIz2n2NGQNco?=
 =?us-ascii?Q?L+aPFVAEBMTahegru9M6nYiTW2xt299m4FTgjGc9dcLMk7gBlW5Auv11RMJU?=
 =?us-ascii?Q?n2tybjEZyjVO0BsSuJm2pfa/FI6OSccELWjvzcGdMOXlWvZsU53rYoBqJ17D?=
 =?us-ascii?Q?WgoKyQaoXeskuIUpvKcGaNev55DLHe2epjLCvP0AASBRToGFaYIUQT/9ATjZ?=
 =?us-ascii?Q?m4xX11VcY3IfGlsxahMvOGy3C18rbf2R/d1VTf0YdGeTGE4qPvQkoz/VEw9p?=
 =?us-ascii?Q?jyztM5Dy1ORYxSqkGEIYBmGXHAdxLe1HOscX7e5PpTO6JmUHSHzYVc9jsDjj?=
 =?us-ascii?Q?TB6dIQAsfOAdoEW15EPCzlqiB8sMPorrOYQibI3zxv8A1pzKCoFuFPtfMopE?=
 =?us-ascii?Q?8ACjBMcHd/zTk0bq7uMG+Y6DCP8mHcfwVmFjDPAGxFx0W06lvawgH6+dceQD?=
 =?us-ascii?Q?pIiQm8ZBAmnqHjKA534xOPjz7D6rjOjGtD0ws6RLck0q5a6HBU8/7xBVGl3L?=
 =?us-ascii?Q?afjysANPsK80obIY4RzTZCLhfR4Hl5VRfl9vtEsqVNrtTmkcBBbBfh1ZXJ3b?=
 =?us-ascii?Q?dKZb9V8PCnOdE8ymNmroJ/uqSowtphTUPvhheBaNXxSqJ9NCtJm+t7CXaDJF?=
 =?us-ascii?Q?lBcWG/YazHMwfKz2S8WkWtV5z9iUbZWeEe5QYVmW0gqaoMbYf0knA6jywJAq?=
 =?us-ascii?Q?OEjKliYznZCBT7PakCr+WMMn/4p43iV+vQJR8NI8R9n3oKCJWPd4A0tl4Kra?=
 =?us-ascii?Q?GB71XUxqVENK7AtIWiRG17lEJDiysgy/7P9g/cZJ+8P0NCQLj8cJoAmVkLCy?=
 =?us-ascii?Q?OcfkokssAmDElr8yTIzdshChXrJrKt96IddKKm+L9z5mKyey/V9aMVh87Kot?=
 =?us-ascii?Q?/5jDC6iQvbfWts8GqiJofdf+E1gBHUhRglTdEC1xR81sA0qarij/+PZWFWRI?=
 =?us-ascii?Q?ZFsoBzLUnlpDJHs0GbnAIWOH+k6xfZZOc7qsIJAXTaQ4FzoQ5aCcauv5Y0Uu?=
 =?us-ascii?Q?WuUmImA50NXCWR/c4eX+FJjl6xkL3+T0DDTAgIYd72CrBOShqLyW4az9Dt7r?=
 =?us-ascii?Q?oeF71HIjjD5PBaWrUEs2U9frT51+6aG7GtdVcUGz/uEGiYPZ+axZi7f2jkvM?=
 =?us-ascii?Q?3iJ1VNdoJRO3a3GdAqajCAkjfDeP71vjUeKab6TfsI8N0CrjhlrYtfwD2tb9?=
 =?us-ascii?Q?49eQ7X78FEaC7LhMLtyMoBAX1E3HHSEk3UnGmwr4dxat1NzXHIBvzZR45biY?=
 =?us-ascii?Q?lV1mj18iIlb0VL+lw0b9kNWFuxx3vx2sVJ9FRLHN7MMhEbJwtVQ6l6igEYav?=
 =?us-ascii?Q?xsyAL1aaIorsG6S0NzU/deanqo9TfhbYq1lcIgJCZDatIDOb0ycOOX2QK/ZJ?=
 =?us-ascii?Q?Pu7c85n4c304ruxCjxyVDkERQ34Xp9L76wTY+axjRDxU+DzeYR+Wzj6a70/R?=
 =?us-ascii?Q?qT8u03jm2F8FUktniwcedX32QhZbbz8CZMqoe31uJeZX8237NpVjTMQVbJQ4?=
 =?us-ascii?Q?lIBkNCioTWmP/7GxmcZPP9M4qa8OkVnkpDqXKUvfKHA+7UlOwJygS6uvqDpD?=
 =?us-ascii?Q?nT4fOmWwhvgd+4jpoOt+r87N07G1CWsfbYsmFtUPJ0tBZbrAdoOFEI0IDhDv?=
 =?us-ascii?Q?TKu8OwUnXg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15724588-d2aa-47d1-b8c7-08dea1218b68
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 10:17:38.0564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4WoM2yp1KeCSkvfQyCh0EYuuAbVQHTaDk7iScB57MWhbl3VSdabCfG7mFNFkZFaH5JMzvRYRpg1vdHEXTiTOPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10855
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36441-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,nxp.com:email,nxp.com:dkim,nxp.com:mid]
X-Rspamd-Queue-Id: A29FE4507BF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

An asynchronous vbus_event_work() keep running when switch the role from
device to host. This affects EHCI host controller initialization.

USBCMD.RUNSTOP bit is set at ehci_run() and cleared by following
vbus_event_work() if bus_event_work() run after ehci_run().

The log below shows what happens:

[   87.819925] ci_hdrc ci_hdrc.0: EHCI Host Controller
[   87.819963] ci_hdrc ci_hdrc.0: new USB bus registered, assigned bus number 1
[   87.955634] ci_hdrc ci_hdrc.0: USB 2.0, controller refused to start: -110
[   87.955658] ci_hdrc ci_hdrc.0: startup error -110
[   87.955682] ci_hdrc ci_hdrc.0: USB bus 1 deregistered

The problem is that the chipidea UDC driver call usb_udc_vbus_handler() to
pull down data line but it don't wait for completion before host controller
starts running.

Now UDC core can properly delete usb gadget device and make sure that vbus
work is cancelled or completed after usb_del_gadget_udc() is returned. But
the udc.c only call usb_del_gadget_udc() in ci_hdrc_gadget_destroy(). To
avoid above issue, add/remove the gadget device dynamically during USB role
switching.

To support dynamic gadget add/remove, do below steps:
  - clear ci->gadget and ci->ci_hw_ep at initialization.
  - assign udc_[start|stop]() to rdrv->[start|stop] and properly merge the
    operations in udc_id_switch_for_[device|host]() to udc_[start|stop]()

Adjust the order ci_handle_vbus_change() and ci_role_start() to avoid NULL
pointer reference since ci_hdrc_gadget_init() doesn't add gadget anymore.

Acked-by: Peter Chen <peter.chen@kernel.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - add A-b tag
 - refine the commit message
---
 drivers/usb/chipidea/core.c | 11 +++----
 drivers/usb/chipidea/udc.c  | 65 +++++++++++++++++++------------------
 2 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 7cfabb04a4fb..95d9db159ce8 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -1191,19 +1191,16 @@ static int ci_hdrc_probe(struct platform_device *pdev)
 
 	ci->role = ci_get_role(ci);
 	if (!ci_otg_is_fsm_mode(ci)) {
-		/* only update vbus status for peripheral */
-		if (ci->role == CI_ROLE_GADGET) {
-			/* Pull down DP for possible charger detection */
-			hw_write(ci, OP_USBCMD, USBCMD_RS, 0);
-			ci_handle_vbus_change(ci);
-		}
-
 		ret = ci_role_start(ci, ci->role);
 		if (ret) {
 			dev_err(dev, "can't start %s role\n",
 						ci_role(ci)->name);
 			goto stop;
 		}
+
+		/* only update vbus status for peripheral */
+		if (ci->role == CI_ROLE_GADGET)
+			ci_handle_vbus_change(ci);
 	}
 
 	ret = devm_request_irq(dev, ci->irq, ci_irq_handler, IRQF_SHARED,
diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index d4277d6611ee..d52f89489893 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -2044,6 +2044,8 @@ static int init_eps(struct ci_hdrc *ci)
 {
 	int retval = 0, i, j;
 
+	memset(ci->ci_hw_ep, 0, sizeof(ci->ci_hw_ep));
+
 	for (i = 0; i < ci->hw_ep_max/2; i++)
 		for (j = RX; j <= TX; j++) {
 			int k = i + j * ci->hw_ep_max/2;
@@ -2289,6 +2291,8 @@ static int udc_start(struct ci_hdrc *ci)
 	struct usb_otg_caps *otg_caps = &ci->platdata->ci_otg_caps;
 	int retval = 0;
 
+	memset(&ci->gadget, 0, sizeof(ci->gadget));
+
 	ci->gadget.ops          = &usb_gadget_ops;
 	ci->gadget.speed        = USB_SPEED_UNKNOWN;
 	ci->gadget.max_speed    = USB_SPEED_HIGH;
@@ -2327,10 +2331,15 @@ static int udc_start(struct ci_hdrc *ci)
 
 	ci->gadget.ep0 = &ci->ep0in->ep;
 
+	if (ci->platdata->pins_device)
+		pinctrl_select_state(ci->platdata->pctl,
+				     ci->platdata->pins_device);
+
 	retval = usb_add_gadget_udc(dev, &ci->gadget);
 	if (retval)
 		goto destroy_eps;
 
+	ci_udc_enable_vbus_irq(ci, true);
 	return retval;
 
 destroy_eps:
@@ -2342,38 +2351,20 @@ static int udc_start(struct ci_hdrc *ci)
 	return retval;
 }
 
-/*
- * ci_hdrc_gadget_destroy: parent remove must call this to remove UDC
- *
- * No interrupts active, the IRQ has been released
+/**
+ * udc_stop: deinitialize gadget role
+ * @ci: chipidea controller
  */
-void ci_hdrc_gadget_destroy(struct ci_hdrc *ci)
+static void udc_stop(struct ci_hdrc *ci)
 {
-	if (!ci->roles[CI_ROLE_GADGET])
-		return;
-
+	ci_udc_enable_vbus_irq(ci, false);
 	usb_del_gadget_udc(&ci->gadget);
+	ci->vbus_active = 0;
 
 	destroy_eps(ci);
 
 	dma_pool_destroy(ci->td_pool);
 	dma_pool_destroy(ci->qh_pool);
-}
-
-static int udc_id_switch_for_device(struct ci_hdrc *ci)
-{
-	if (ci->platdata->pins_device)
-		pinctrl_select_state(ci->platdata->pctl,
-				     ci->platdata->pins_device);
-
-	ci_udc_enable_vbus_irq(ci, true);
-	return 0;
-}
-
-static void udc_id_switch_for_host(struct ci_hdrc *ci)
-{
-	ci_udc_enable_vbus_irq(ci, false);
-	ci->vbus_active = 0;
 
 	if (ci->platdata->pins_device && ci->platdata->pins_default)
 		pinctrl_select_state(ci->platdata->pctl,
@@ -2422,7 +2413,6 @@ static void udc_resume(struct ci_hdrc *ci, bool power_lost)
 int ci_hdrc_gadget_init(struct ci_hdrc *ci)
 {
 	struct ci_role_driver *rdrv;
-	int ret;
 
 	if (!hw_read(ci, CAP_DCCPARAMS, DCCPARAMS_DC))
 		return -ENXIO;
@@ -2431,8 +2421,8 @@ int ci_hdrc_gadget_init(struct ci_hdrc *ci)
 	if (!rdrv)
 		return -ENOMEM;
 
-	rdrv->start	= udc_id_switch_for_device;
-	rdrv->stop	= udc_id_switch_for_host;
+	rdrv->start	= udc_start;
+	rdrv->stop	= udc_stop;
 #ifdef CONFIG_PM_SLEEP
 	rdrv->suspend	= udc_suspend;
 	rdrv->resume	= udc_resume;
@@ -2440,9 +2430,22 @@ int ci_hdrc_gadget_init(struct ci_hdrc *ci)
 	rdrv->irq	= udc_irq;
 	rdrv->name	= "gadget";
 
-	ret = udc_start(ci);
-	if (!ret)
-		ci->roles[CI_ROLE_GADGET] = rdrv;
+	ci->roles[CI_ROLE_GADGET] = rdrv;
 
-	return ret;
+	/* Pull down DP for possible charger detection */
+	hw_write(ci, OP_USBCMD, USBCMD_RS, 0);
+	return 0;
+}
+
+/*
+ * ci_hdrc_gadget_destroy: parent remove must call this to remove UDC
+ *
+ * No interrupts active, the IRQ has been released
+ */
+void ci_hdrc_gadget_destroy(struct ci_hdrc *ci)
+{
+	struct device *dev = &ci->gadget.dev;
+
+	if (ci->roles[CI_ROLE_GADGET] && device_is_registered(dev))
+		udc_stop(ci);
 }
-- 
2.34.1


