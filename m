Return-Path: <linux-usb+bounces-36133-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAScCu/i2GnHjAgAu9opvQ
	(envelope-from <linux-usb+bounces-36133-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 10 Apr 2026 13:45:51 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B67FB3D653B
	for <lists+linux-usb@lfdr.de>; Fri, 10 Apr 2026 13:45:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1B07B3028585
	for <lists+linux-usb@lfdr.de>; Fri, 10 Apr 2026 11:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A75A13A9635;
	Fri, 10 Apr 2026 11:40:07 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2119.outbound.protection.partner.outlook.cn [139.219.146.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1103BAD96;
	Fri, 10 Apr 2026 11:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775821207; cv=fail; b=VIzDfReFEs39i5K/fpXtG0n+jR1+N6n7v8LYcR69nvZt/ZiA2laCmop0kCgPMV2o+2JtTQ9GeF08P8EsXwF5MQ23NbZ59Y6G9kvYr+UUnpziUFih4t295OnIqpfAFBE/2Xh6gkYPL2F2LaI86XgoIEFgoMZTMZ2SzlWyQjOD7wI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775821207; c=relaxed/simple;
	bh=D2pN2XJRCwJZxwOLbAvIr1Jsg50VKv6Recs36FU7MsU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=i0OTKN5AZ7f4+sSBmbIpUyy7hXFUt9S7JRJUKnxy4azJLtdGyGxZN2djKc8PaPXfJwzwT1RI7MaDHSP9JIB+p7gJn9gjlWVSTquwZp1doUQ9Nh4sKTmIGBzfROWwd/fxahRAn/hGLPQwVoxs7K/BEXVUMG4/hzIx0Gi25t8h/hg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mbLibbXgm3o4VRgTzlmxLZjD2wiR/G0K/vb0sbXoK+KhE/1vwTL2I3rqG52E8apU68cw0tU8He0Kc201DLm499QMCMwXDc8xJSX90+qRjerpMr2sSw2QwvWC2tv8e+UlU9ygAbyYmlambmzhhRgQBItZxgVIb+rQjFzOGO0Z2rbmZTepqAXsT/xRiZVH6qEu8DgijI/R7dbygf/pUEbSzywaiYK+XpkTqKhQHuxqwnBLtOnGUqOfJZq7MzisjKadQdMXY/5GaaO2fbn9YsKgzjZ6c4fDCRGSlPPnyl5yfhpYtowNsMFDkZvZpsjnRaDJ3EWG94/+VpmkXY2bGr49Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AD/U+dl17avYLlk5rvMzMaElAyxgcPBgbslTn04Pdbk=;
 b=niSaiZq9xCby9AtxJXtQF/xW6HHb7O4w8ZuBrScJS4302jerXY5VN1YtciFqdNlufi+KgzPT0Cx3wOu16xSKb+K8CXV/DqqOYDCwiq6JsAro5f+g1oA5VoYR2M4CrlNqToQ3FIVqgX0vFkQhbaO2isE5tXM2iQUmA2vT88fFkhK8wWo0r7/i8P4d2qIypfU0tlkgDtydq/hzCs5yoPPqJQ0UMCS+2BQg8xAvAHHfCTnwQ8VeEMiJRnK7YI2ToEDhjDWbOQ+J4kUF4qYOoc/D6w5NidvQTnrpnEiCoRmYQswpYWH+s83JH3NGA3tgO293/i2QNxgnmeHyH/4DLwQdGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15) by SHXPR01MB0749.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:27::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Fri, 10 Apr
 2026 11:25:09 +0000
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 ([fe80::9b99:12dc:a115:b90f]) by
 SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn ([fe80::9b99:12dc:a115:b90f%6])
 with mapi id 15.20.9723.018; Fri, 10 Apr 2026 11:25:09 +0000
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
Subject: [PATCH v2 2/2] usb: dwc3: starfive: Add JHB100 USB 2.0 DRD controller
Date: Fri, 10 Apr 2026 19:25:00 +0800
Message-Id: <20260410112500.90432-3-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260410112500.90432-1-minda.chen@starfivetech.com>
References: <20260410112500.90432-1-minda.chen@starfivetech.com>
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0006.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510::8) To SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SHXPR01MB0863:EE_|SHXPR01MB0749:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c77c5ac-2095-4e4c-4112-08de96f3d31b
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 vMKrcMucnd9YcmgM7TaIBBYAHnGh30tisMG0wWT4CkukVAIIdlmCN5DZzKFLwmdSua+V/MOOQUbqX4lXjIZisgKz/3XCsFWSsKebIcK+jx7jpV8aZjc/s/h3SUXVHAhEVL7+GP3Jng9luo43K7jzudJe5fKfco+7BxgGcx/jBZdVo9XkpEVry2v+651262rNdllBHzm6aIsxTyYMeW1c1BNyc4dbvpge3P4cBMuiWEuA22FEiJwMPX/1r0qbTYTSfVfguywX5TUUhFAaNZ9fwkaaRhyvThQq9NH07SiSL5zbdUfKV17X5V//uS3ixHYsS4wwwdG0/MfVUURylx/Wu8VoOD4PpCkGjU5qLzOER+fAnUf0NscqHlGGq85yABO/rwyLPi78S92g4KxLHUK19BfbjoZjJcw0Y2nHbUT7lpxD+vdhJMTfMnJ+kT0OYIdctFSgTNZW6KzKZLtHYgBtFMsEdE7PAaLGiqCkN2QFKuAAknevsHfXrIIgcRGp0exVDRAUo8EeWMIYmkrOBvoBb/mvnvXocNXxnFnI9R4EroQTAxmfgxn230Eh6v1jwwHWeHqAizMe7+4xnmIP2RaBRdE3HZgCycqon3IFgC1w1v4=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?x/6Owv6gC10IHGzL/sOSEZMZqtUlAXWmTjKVtewIhpaip7/qOkM85YhfRCWV?=
 =?us-ascii?Q?vadKTR0UzP1QHsgjlcSPjdLwtUNiHWAn0S5iI7wDjm8ueK1cKaHU4+tIfXi2?=
 =?us-ascii?Q?p6dsNfR0nDTishYOS5P1Eg0/x9JDgo3fxvp3ffmRoQTfa+f7Lb4G21VEYyNd?=
 =?us-ascii?Q?hbviTs8iia1F4siJnhdDjaDtYGxH7Xtza0ZqvXENgIaBOmh+IHxsTNLXOvnx?=
 =?us-ascii?Q?dioSaXxW7lHCDoW01sRA/xH2lOSwQbcBKW/P29ByvzDcBQ9MZbHaK/ykaOy4?=
 =?us-ascii?Q?Ou2nPVeYMsXnZ0SHx5Rw6FJfVxIcxiVZgQc0/Q0o7w7CmsrMpKbu26bB93Le?=
 =?us-ascii?Q?657fi9OV/bS2DeSVb5fFMty97zIu29k0Jw7G6l0WtnV3sJt8bwTFb9wajSmZ?=
 =?us-ascii?Q?OfcyguVRvBxEf2AZ7FcMPI3jw1T1SHkLeYYMbabXUOGvF6NKdgSzu/Y9pSgC?=
 =?us-ascii?Q?MH249yD1sVWBivqJJiPOg3zRG1DAKBDqpvdxWDzlYiF5ZCTPPrOSJ6Xf+LMq?=
 =?us-ascii?Q?Z6Gp88XT9psdlzn81HB8fr9rmGoONEQUABXJoJa6QBSbnQGli+Va33nZ5TSj?=
 =?us-ascii?Q?uGrI6rfpknrhHRDkFL/iAPgTbIPlrg24rJXu+3rvjVmscAmPNh6kYdwXJ47x?=
 =?us-ascii?Q?tVz8dZKA3m9a5DWVd8pyQcTV5S3Z3Scy7EdN2AFigiPhkjYXnf3/ytQ7fyfE?=
 =?us-ascii?Q?VhUp61hLLi0If9q6XYPhqzDRCKxJSmi2O5rEWCy5JN49eUnoEr4uRpU+Y01W?=
 =?us-ascii?Q?zHHKkkQSc73ViEVAJL6cBNpK5usNBqH8DHuSChAJoU2HMfdTjhaopatGiRos?=
 =?us-ascii?Q?52a3YBDRl+pubLDXEceba/tGG47oMJ6g4r8FPuQAok9VZ/5lmVtdLSUvHOIC?=
 =?us-ascii?Q?XtaNwf6larpl7IrelhuaDy4/IBVyvZJW1x2weLpg5w1NMhZQ7OaDPsHg48Ja?=
 =?us-ascii?Q?snstkRaKncUVgpmVyAiXsSKgex9b6iilu0WzwHkURJU2koBhV4mBhYBiddK4?=
 =?us-ascii?Q?80ROURIE9ciT24j7BnV0kN3z+smsHhG6dq+VdD6aQfdEGwCRUF/+le5Z0uhf?=
 =?us-ascii?Q?cL85jDQ7T+tWNI0Ql9ni2kdRAQDlTWBk8TtyHOa8pfU3XocrWP+vjN9fj+UV?=
 =?us-ascii?Q?b7ft1LDp+YkT7ud6i/68avP22eOViYAzzhTaxDgvvL6KSyyJ7FWwfMadDKn6?=
 =?us-ascii?Q?HVTbwUFjfKxYVYChPx2r6Ff9/mT+hgebtNqictW26yWpw+OjOfHnKKFz+OzF?=
 =?us-ascii?Q?vOtYTlf2NMsbuNeouEsrGJn46ZDm6z2GDDRJJUZLOKlgOOzO+mrQ4YE6VH7a?=
 =?us-ascii?Q?WESVji+6uSLf6KpxwW/cj42D/3AGI4sJck6FtROf5vfFdj+hGJku3TrkX7rm?=
 =?us-ascii?Q?zEo19J4iyvC1k0NWhDTZ4BZqqDVbyld2RZN41M+VVO8/goUlMN66cC7HwlBa?=
 =?us-ascii?Q?IafrziooL+5UVmF3/f4Or/2NrY5Yp9UpPWyh57M7Ma8FwKyVk+HQpZowIgtj?=
 =?us-ascii?Q?2q/tISb56Uqqtu0MJgtOUW//niwJRUiZpG03MGKwnDa4PZnAyd6P1iaMSr9f?=
 =?us-ascii?Q?Lf8JRxC8eTd0lX+eMcLGxEfgjCKfnZ6FLBTbAQ3G3+RHRvU+lLsd0Q9rmIVl?=
 =?us-ascii?Q?kxkwCjZcIe4ReYHyPeysWFjGTIv93JYve0rGMylxF6PDRgEki5hh6a6au1hx?=
 =?us-ascii?Q?oIiN2/SbxWkMW0NiWPNhqAc5Z/IUgj/0SrT0mKis9p6mmGbZl5B/lU5efr3g?=
 =?us-ascii?Q?nHz5K6HoF/FvA8JfEPAgrNZ/OK7NCK4=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c77c5ac-2095-4e4c-4112-08de96f3d31b
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 11:25:09.8097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XtRqNxyl9mQTIfDzl2/vCXj5iNxN3luOQqIc8aijKJ2A0zbbJ586RhxOT2Ae9ceQ4y65MlJvAdWW+X7YnX5K86PWYyB+zo6QlPRcJhW9ymU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0749
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
	TAGGED_FROM(0.00)[bounces-36133-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[minda.chen@starfivetech.com,linux-usb@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,body];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[starfivetech.com:email,starfivetech.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B67FB3D653B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

JHB100 contains 2 dwc3 USB controllers and PHYs and working
as USB 2.0 speed. It can working in generic platform and
setting default properties.

Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
---
 drivers/usb/dwc3/dwc3-generic-plat.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
index e846844e0023..e9e29b63aaa4 100644
--- a/drivers/usb/dwc3/dwc3-generic-plat.c
+++ b/drivers/usb/dwc3/dwc3-generic-plat.c
@@ -214,6 +214,7 @@ static const struct of_device_id dwc3_generic_of_match[] = {
 	{ .compatible = "spacemit,k1-dwc3", },
 	{ .compatible = "fsl,ls1028a-dwc3", &fsl_ls1028_dwc3},
 	{ .compatible = "eswin,eic7700-dwc3", &eic7700_dwc3},
+	{ .compatible = "starfive,jhb100-dwc3", },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dwc3_generic_of_match);
-- 
2.17.1


