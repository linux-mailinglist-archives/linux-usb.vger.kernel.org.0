Return-Path: <linux-usb+bounces-36097-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id HTdNFoN912nMOwgAu9opvQ
	(envelope-from <linux-usb+bounces-36097-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 09 Apr 2026 12:20:51 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB833C91C2
	for <lists+linux-usb@lfdr.de>; Thu, 09 Apr 2026 12:20:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4B381301A743
	for <lists+linux-usb@lfdr.de>; Thu,  9 Apr 2026 10:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2309D3BED44;
	Thu,  9 Apr 2026 10:12:55 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2105.outbound.protection.partner.outlook.cn [139.219.17.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4793BED17;
	Thu,  9 Apr 2026 10:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775729574; cv=fail; b=dWuUVAl2SrJEfEaDZnIm+sQ86M81ASEb4SdO8tdNqReWu4nR3IMdyfItLIUDWqVf/g0FHo401nbg6/pzMIzuCXmDorctU0MOgEZBo9X05HzADrStSj6k77XOD1M2P8mgHO9It8WKkddEQG1HKYOyWUiY5k+zsaJL+lhE8TsOMws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775729574; c=relaxed/simple;
	bh=kVCYJOgc+XVVUF7xbylGKcd1D9b374AiKb1gW+FxGfw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tBm+0LtQmocdNCTUkaPN8KHR5vFOgXBCvGTgJpvk4D1cspGk6jcXIVX9aY7Z4YXW0mOkMMdBBMsF1w7uJ6gJ6PuKvPelQPvFcwvBXWlFnLD3xwHFG/DmV1ZQVAmVqw57VbpwRZhOtJ12YnU8UTodPFgN2tMD3QidAvhpvEJ/H4Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gNpqIekTTksebEjaZcQ5nt+GcDN4YnU+Q/+rnY7TADFfTGahY2UOJ5gaK6HY0M8aUj8Oc6ozytGpVyuKCCBUywODi6Ihxn8lQa2HPfusZacm/aHlLbJkXDCjrGiJJQQCmIAZ8CDZcVuSqPogq6yXMrAoSXVZZuSDhmlbCGVjr6uJxnWbtCpgkfF7mwHIKxWoC1AuRK2KpBEL3ATcj9rT7sIYAwZ1i9DXmW9iZZ0oAl/vmf3K80W0TTDH+Jhf8ANsR1SrB9P/5sMoYyHSrEo4DB+3Wg+i7Z8MG9Gy58PfpeL0hT/9JcIrAAAOuFAXd15lk+VlxG3rsgqtnyRzVP3ptQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gUjE5dj4V4B+/3+MuGdhNNbE577BdplovoqQHfaRWw8=;
 b=XKB/JtN8JGH/GhKWZJJZSwtaBYqiWG7p1/nGqLi1bPwVEiK9xNs6pFMVxByjitxixd3sMroFy5dGf0SWvuazs3Zo9xfCC7Yu/hEUFXg0Sr+Pz/ZrpxQIHV449T1y1gRj05o103uKfYjATrOXNfHkXgY5HwgqtHLHtGNSWN4DhTpv/iuSXG3MGSoX3rufcqWBzixHk78AuvcIb+pMwXoYtlppIHA5OGuO8fRdG3sXKn4IQN08eMLgRiYUgT4yrhXHmV48Oj1Dx4BOpT775/egOBobAikkXWP6zmdWlnepDUSRJJpI3nQr5kyrg4MCHqGd3owm9fUzxXO9rM/hYjtyAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15) by SHXPR01MB0752.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:26::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.24; Thu, 9 Apr
 2026 10:12:36 +0000
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 ([fe80::9b99:12dc:a115:b90f]) by
 SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn ([fe80::9b99:12dc:a115:b90f%6])
 with mapi id 15.20.9723.018; Thu, 9 Apr 2026 10:12:36 +0000
From: Minda Chen <minda.chen@starfivetech.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Minda Chen <minda.chen@starfivetech.com>
Subject: [PATCH v1 2/2] usb: dwc3: starfive: Add JHB100 USB 2.0 DRD controller
Date: Thu,  9 Apr 2026 18:12:27 +0800
Message-Id: <20260409101227.39417-3-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260409101227.39417-1-minda.chen@starfivetech.com>
References: <20260409101227.39417-1-minda.chen@starfivetech.com>
Content-Type: text/plain
X-ClientProxiedBy: SH0PR01CA0014.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:5::26) To SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SHXPR01MB0863:EE_|SHXPR01MB0752:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bc75371-24e4-45f6-cfb2-08de962085e7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	GtD1A060TZxgT216q/4PiPWM5ysraJH7XWkroT6LL9zB0xgPznDroNfICnHkz+Cf6Deq1DbSlD+1Jj82tjrYOmEOFHAFoeHukNfISQX3hbbuheDE6D2KTee9UTK1vyqBv7Us1KYhhOBRjJuLoMB3XFpeyskZ3L/8JnhC57bI9o6UpW3mtSvYALTd6sQ10hzRbFe/UEtaEeUSb43rkftf4mCEbbxIbk/VybFfhz4gbxPL//I84rGFA/YpACjMnofHk8etg9ycYdfKda/NSrK5qt37xE67Uu/vHBfV70idV+aEiuEuhoh7iEzzvKpF55KeJwEvVzY7SjL/qLuO20M0YCcwyhwciznkvEktujFCAwHadrdlWsmp8TFrm2qxuMiGPsS0grkkuNeIkITlzc0bImIpKqAZZBa29aRrZsFxbfzfjFdu06SkCviKjtTjdDYvLmC8stiZBoElurAKc/kTMQfkxWE87puQaQQIGqBc38wQEn8fTs4W41sPwLHIAYqb2TJrdaBGo2Ah8bpilE1by4Y/b+36glYr8gl/G5axw+8MBUYGrZ83m7hPDLhgWAtUbjgjuJ1e7PRFp2syhrgSjA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NqWQgaunBCzgiYrcdOPWe7qox1QRiyrh+qRKMnZ/XIQ7fVJHInkJA7YMaEgW?=
 =?us-ascii?Q?vFu2Vc1MBVb435WKXG2zFTCEbgcX5Q2NnnhjwPDXaxDUqn8MPv/FqgwXPS0k?=
 =?us-ascii?Q?LnomxBAtQf2CpbMksQS+mMmJH0bRd9AER5O+vZOvqyoaFqVZHT7DkH2tHwlY?=
 =?us-ascii?Q?ochAeZe/SBES3zZX0hkV/jROAfLiRNN4rIX+mZBj68213ZboKhyxojaIWetm?=
 =?us-ascii?Q?kdDtsizPcMJ94cdSL6WRaySEa0vMjH7qiSW9pOb+XcjnSi285/55tQlSNPu2?=
 =?us-ascii?Q?nrfZa5tvkeayoSgXCrGkNOG6t8cKdkYfFExOr8F4owUVVl7UT8HRZQ1cuk9O?=
 =?us-ascii?Q?vEXUswAPlSt1eHuXWOr3Hl3F5ySJsWZw5XJTkM9UpINyQtSGtyES4WOQ+BQi?=
 =?us-ascii?Q?xZ5yhXCd8F9aPEjcWw6fr8ZKdKgocZoQ7MRIp08APbbr089EeBc9jEzd7kl3?=
 =?us-ascii?Q?dGimwan7kog/uPRMhH//4i7PZirI/qlbaBp11CWEC+6LaKgkhBHWCtGb/hi1?=
 =?us-ascii?Q?RsIw8q7UrmbAXMGa9k0QU0aVXPlYaQ1ZsadWfFfrFH/ShxpCXgNli7JmP960?=
 =?us-ascii?Q?b8EQYJb6gg5AmgjOiZ+l0ZHHZRx2o+sfFL5w8A+5Q62fTZgGXsSQIhzuuuTB?=
 =?us-ascii?Q?0HeSt4GBwJNfeERmpLTSx8Bh9PjZEbYTpNTQetms7rD09iH8z0auiCqEjwO3?=
 =?us-ascii?Q?HvkFm5/1CrVm+nDvlqQDBZWiK6dZ1Y+ZbtQIF/qGGx1Oad+3XXuKF+Xyn3eR?=
 =?us-ascii?Q?Rw8WndThI//LMIlKu0DywEKdULRmha/+kKUPpnWeclkv0iBOP35cT4JrogtA?=
 =?us-ascii?Q?jw7TvbVJ+K/4TdzkOVmh1Fo0WSUCMqyoEsBoDvkGWq65lCD5LhNNby9rThkY?=
 =?us-ascii?Q?iel9eC5Dul541yAPG/QxLoOyF75kPrRy1VAr2IQ7XAt3aSMaHqS4nmd+oUXr?=
 =?us-ascii?Q?U5mBVbzIygJAa4EGkmCIacUFfU7L6298Gg79aKOgHFOqFvyxJ/uLBuQa2et5?=
 =?us-ascii?Q?ogmyxc2ujj7yjTe6nC0tGmXvUH0tfKNUPuNZVqdQmIEVkwUN/+ONev+96GDF?=
 =?us-ascii?Q?iB82XS5Ans23rHIizOVOgfzgxtXHmICtYfUhw2GFw7IAB9axIq2iDpRxIlGA?=
 =?us-ascii?Q?hhpZq+rWpeyeGEGJUs6681x8Z4whei0gPZKq42ZdW7ZZtHBhDiJCv1OfxwEE?=
 =?us-ascii?Q?5rLc3aEQTHoQ8Ci/YKksPj4X3rD7VuczhyS5MRMvtYRcDLovjrPs//Zef9/H?=
 =?us-ascii?Q?vxyWoFNRdFp1o7YEA/dG0NXw9oV48Z0UqxnFwXYVqqMW+uEgC8uShyiKj+qr?=
 =?us-ascii?Q?RhMI7qfgdQu6Ou4XBAmONG2ED3OnfANJUhWKJrl0dDTueV2KNx7JktwvaZe0?=
 =?us-ascii?Q?lJkLxAGtKLYfM6K1rWDmd+MnFyOmsByQ3Tf3pRIW40oTf4mLRd3tqb4hqHC2?=
 =?us-ascii?Q?ObKv35XT+BtHLtkDDJGuD+DJspCQwp9I1+pyKNYsJJmkIASkQtII9LmFh8Gq?=
 =?us-ascii?Q?GtfoQi25hARnMcDkxc6nm9drT0PR8pnNa3Eo2iKmBzT5XrUi0s+OX6twbcaU?=
 =?us-ascii?Q?N3qK+TuXGXnK68FQaJAcxywLOsK0iogy+ZmG9EHcmWRjTGwDQ3XZR2erV2BM?=
 =?us-ascii?Q?J3/vyHWwo06BicOp8N2qlkBvEuY62vUPfgJqPS0belnMzFcwrBtwV7hz5HJ4?=
 =?us-ascii?Q?pxutp9J9PmYVbEFOD0Wz/q8cSzAz6j9WEWYGVPkNvg7ws9OOIi3/x0r/1LxN?=
 =?us-ascii?Q?VQKOm+C/yiKOhzUGBa/Xd23x8/Jbe7o=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bc75371-24e4-45f6-cfb2-08de962085e7
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 10:12:36.3907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vOXvK/9JAZoGFLPsd3qtkiDf3kx7Z+avm5AlyMxGjiZFyfXYhjZMiP6Bsm0xL4caPJnJevC1OIkS7HcLuiU9wLgVI2+N6Q/N5CubXEiHxUk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0752
X-Spamd-Result: default: False [5.04 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-36097-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[minda.chen@starfivetech.com,linux-usb@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,body];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.116];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,starfivetech.com:email,starfivetech.com:mid]
X-Rspamd-Queue-Id: 3BB833C91C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

JHB100 contains 2 dwc3 USB controllers and PHYs and working
as USB 2.0 speed. It can working in generic platform and
setting default properties.

Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
---
 drivers/usb/dwc3/dwc3-generic-plat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
index e846844e0023..4f2a9c531f0b 100644
--- a/drivers/usb/dwc3/dwc3-generic-plat.c
+++ b/drivers/usb/dwc3/dwc3-generic-plat.c
@@ -89,7 +89,6 @@ static int dwc3_generic_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "missing memory resource\n");
 		return -ENODEV;
 	}
-
 	dwc3g->resets = devm_reset_control_array_get_optional_exclusive(dev);
 	if (IS_ERR(dwc3g->resets))
 		return dev_err_probe(dev, PTR_ERR(dwc3g->resets), "failed to get resets\n");
@@ -214,6 +213,7 @@ static const struct of_device_id dwc3_generic_of_match[] = {
 	{ .compatible = "spacemit,k1-dwc3", },
 	{ .compatible = "fsl,ls1028a-dwc3", &fsl_ls1028_dwc3},
 	{ .compatible = "eswin,eic7700-dwc3", &eic7700_dwc3},
+	{ .compatible = "starfive,jhb100-dwc3", },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dwc3_generic_of_match);
-- 
2.17.1


