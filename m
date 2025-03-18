Return-Path: <linux-usb+bounces-21847-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA6CA67741
	for <lists+linux-usb@lfdr.de>; Tue, 18 Mar 2025 16:08:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEA451780C6
	for <lists+linux-usb@lfdr.de>; Tue, 18 Mar 2025 15:08:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0065E20E700;
	Tue, 18 Mar 2025 15:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lHoLZqpe"
X-Original-To: linux-usb@vger.kernel.org
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012034.outbound.protection.outlook.com [52.101.71.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DC320E034;
	Tue, 18 Mar 2025 15:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742310477; cv=fail; b=R2rodk6RIBJ4h5rzI0NOJ7KI0HwZZBgSnX6Qvnx+meuPo4JBqck7kyS+bee4sMWRcQfwm81wtaAi01jjcQFLElxpBzWWVPjEPvZh2qepoji6X4p2OwBS1p6NUWprzUa7OvYFF1O5ePsDEriS0jbjLjMXu6oYwkCZtPdf9sTLE9w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742310477; c=relaxed/simple;
	bh=B82TLsalpnkS4R+/OaBECtJfk2N/0FK9HcM82qVvpHY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CFCH8CFiOA75OQFPQPwHvlzdXdkcPUK5SomVG4Zy0dW7I/7TW/E+QpIu6JKTChWVROEcajL8U1fOc0pXCV8TG1stdCxxsfDXaOZbmjcKAvMJWoSH5+2rUorcYHyweJXgjkmHyMgISoh3wduVYlrB6EoFzc/AcXx4YQwn7BZ5Whc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lHoLZqpe; arc=fail smtp.client-ip=52.101.71.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qLCiGm2q/UympSYHeTDvo2pIJnnn6AjE6EnnTA2FH4zhH0kvrjpI6CAwc+enhJOx18mHAV0yKkojlMXrm/ILn/G/HLJ4l/OflbtiXKOKIn3qs8EOTcErZWueYuLlHTJp2h1u6abzeepvjxO0LC98t+Vbqz7BRF/95ijgiVmo9xAR7Rx9VGirQhW0Uxtk8bSnlWgTcACdYikTxuXYur5DS4QdZcO+04AQ6M8WNmvWt5vQBAHNeyLwVbI22bAVww4SYwoFALmfdeDOtojUoLLxg6oUaDD2GM20KfxpBuw1naRqKqeH3PU0Xuesst2o+aBjvgzL0pzezAoVwyHcEkqNug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qycMcF/QhJ8LBUeGee+a04tGfKCRbUvzrR+4ilcVcq8=;
 b=cub9UKU+vehrXTvzNYcvRvTdIf1Q2CEEmeAOY9TEySknq/Bv0uGK4ngcyQcUYGeswgcZCZEnvrUX+3XaQ3FFCRXKG/dpGD/8RO2ezX1EDEUFYpN5d6z11GL5xzvM17bUOF/yfaQZf1T8Th+UMC7fw4tO3w8+pJi6lXuueQPZeCuOpvfefIqOKMDGfH8OGYcLr485RHKMsvClOqA5qGJdfYKiBElVj171hoofjnAPZu3J/TNNeOMwZFbJJToLt+T88OVLKKPrAWWcVJtLUwzEtFfV7RYzZzFrM7L43UoWz6vo8jZcBUkl//So3p043MsNxKRUWmVQ2pUo7HVyR93ugw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qycMcF/QhJ8LBUeGee+a04tGfKCRbUvzrR+4ilcVcq8=;
 b=lHoLZqpezVJ2tbHSC5J8gXaV9BvrqyCv4Ze37+PwbP96H8hr+TRFoyC//KjKK9TVgOFHt9luNWEMd5XM6luLq9ly8KRi4A4KFS5S+CSO8GPULrYckolqsvxr+6iXL26eD/ACLEHtq3AjyO4Y6qsB9N1YCcoDNc8wrlIJBfNAeNTc0yMIk2g2i6qBVxiljibo2SUGMcuf8d26M+cK6a7vAUzn37HWQMVFH3FHXlsLeRejL2wWENEHYEw51vhGRmkN1GOitsy3m0Jkw1JncTfGz5POGUuKdmfvA/u2UsYJcBkdW4dZ7kCrnIUXx2CnT7vhSgQQrthITwwV93SJzKzvMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DB9PR04MB8348.eurprd04.prod.outlook.com (2603:10a6:10:25c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 15:07:50 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%7]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 15:07:50 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	peter.chen@kernel.org
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH v6 2/4] dt-bindings: usb: usbmisc-imx: add support for i.MX95 platform
Date: Tue, 18 Mar 2025 23:09:06 +0800
Message-Id: <20250318150908.1583652-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250318150908.1583652-1-xu.yang_2@nxp.com>
References: <20250318150908.1583652-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0020.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::6) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DB9PR04MB8348:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a10844a-50e9-4715-4e66-08dd662ea65e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|366016|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yy9nq0bzSywp26o+c/gRkoxNxDuh9Z6TMU/Q18ynhfl29ab1WP4pwJql+cbF?=
 =?us-ascii?Q?NkqOXL8eNN8joFnz65+sE/pIwDu+aEDDZT/1BeHf9nl7iBNURqdErHlM9xSD?=
 =?us-ascii?Q?OL8Jg94+M3nDIq7+Wr1XPUtR0QyxtQtjpHeQR9QZ8emL8FCx7XvAXjf+u3XR?=
 =?us-ascii?Q?v3ADMlKD9+rI3u/p3EOPn+P14qaf8Dp1+hhT0K4GDKKM7r9r1yajLFptLHCp?=
 =?us-ascii?Q?bVWzNccI7kezp4ZMMIySdpQZGsWn3CLQGMXPHNcLns/+eCBOWzWvy3OI1KM0?=
 =?us-ascii?Q?4Dygk0ZL3NudoQnYlkq2/o6bUi7QjIjuakDIfy8m8CGTjaU89kjTZJ9QIMuW?=
 =?us-ascii?Q?If8rQiyFaHokLZq5Fctp2jc5yBqT+gR9e5hJZt1eHNGpGOTzwHyIX0/TmLvQ?=
 =?us-ascii?Q?UTkcvU1M7f/hM0ky8Af6moJ/7Vi50Y0dWVYx/GSVERoboFrFxgefaUhDILSQ?=
 =?us-ascii?Q?q9a3BBTLa4TXJzaNmZvOxKGpmJveiHHON3fyC2ER/3Vsx+COBfgz5x0r9Xts?=
 =?us-ascii?Q?xSxNI9oyrhIqAvnXsyLWadwFU/z57xbQ5p+LrKooyanKBUCflH7gAaxzzljF?=
 =?us-ascii?Q?e/wXWvOgtzCW2nPDI56jwmhiemuB3clxxul1hD2BEtHWzlrmqS+BRSP7vRKu?=
 =?us-ascii?Q?X9Ks3U+e4M9vKGjnm9zeftZ+nkiiIkwojfzM/3h1IPqfIIwfxzRMYWl2z29k?=
 =?us-ascii?Q?9t7MLdhAn1JawwQaWITz1p1AshOnS7BnMpmmSttbbXm2sixMJKMR+Yhd1DUf?=
 =?us-ascii?Q?uuLXRfvwddl8pdyEeHlM/xbt07ObTpbo50f0pHC9jWtrERsd20WFL0FL7GUG?=
 =?us-ascii?Q?Yk83AED1S9BPbKpoddBJqvSP0t1qo44iKutIbVin3smSAxodp+f9Jui4f5Fs?=
 =?us-ascii?Q?ZgUmTBljzQa4koPsemazlfAw5IU2IC8sLeRl+YLtzOKUNyfRLaMN40PpHmFx?=
 =?us-ascii?Q?8HLy55txu4fmcZDGF7rWRlbuq/xKtv9rg9SLHs8eCxJtdNkyuHpPIF4ghIwi?=
 =?us-ascii?Q?XSBjdhcF9rx0Ra1olyPxEB+rQ0Zso8UjwAe7XIO1kpk6bCQjUtTk2F+OfEGZ?=
 =?us-ascii?Q?BAGcvIj2s7GjY/aizeaSZWdKCUzZQSqGb3RE8CIuE3pGSUdrTyKNsISn/X8n?=
 =?us-ascii?Q?yiZqNOcLeJVNQO9eLMmkcKfCPxm1lJ1XtFSsDg6fpZO+fD/eMVySrsyifdH6?=
 =?us-ascii?Q?KPcZmLuu5AzvPl9ekM2yUG/EQYOWHWBlP2FxmmajYBP1JJgCNv5ElYTHpAER?=
 =?us-ascii?Q?dWF3EkDymvSaHSANOnTLuW6bY20EXwMoxrgUV89oKSz0ei+kRV1oVC0k63xh?=
 =?us-ascii?Q?2eBtmuGz679DSU55reAdcmhYQ3sEckmP7WS2cBbeHYeA5atUz/mjctydR8XD?=
 =?us-ascii?Q?FvWXUSZ75qYs6VU6+7cSk5N1wPk3rZ79fG1YrVv3W+BLT+3k6qYKY/ct4Wem?=
 =?us-ascii?Q?OOlkFsllnWXzR90Zgm7mFfzMVq8ywzwg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ghfUKfYiE6TR06hA6BMr7fBbD4Oduhgo/YnCFE6u3sN4us/69Mek53uGBj5y?=
 =?us-ascii?Q?vaeRUiFUETXDiIK5723CIKwBH4wyJWiCDVSHYK6XQURxSdX5jfJ1mITduZxW?=
 =?us-ascii?Q?xzfqxlVLOGyrb96qxPyNb3eKmK+qKh6/E45796RDqDfIGNnt2HZk9PMxUdB+?=
 =?us-ascii?Q?fWXCkfV0Ea20e21k7jTWgDcmMBS24cfNHAm3dilRRVqTNNMAk5l7qpKF/5Z0?=
 =?us-ascii?Q?uldCmD6K5wS2dIr7Zh2NmPjwAzVAyjayZKfWXeOKplYR9eFvd1fB9ZPUXat/?=
 =?us-ascii?Q?piFqPWotWN6SLn4IK+l2RCpKKUmBbRh1Hdq6Xi9TS4rVvp3E+VHz9szlwB6n?=
 =?us-ascii?Q?+qDAFaW7Ro1JBBCvTrIqp6T9ZY77PrPum4nSNxdctlk2v5iawraKwtSd6dlH?=
 =?us-ascii?Q?gxoxL4/sxflYHa08a6YcAfYNK/n7i7mQiXP7QwdmBeSu/zhYmn5eXjqnYPcA?=
 =?us-ascii?Q?RzUDOftCvvHskTC4PAl0Kx8Rr0PUnaHygEeAKIp1mHTEdW2qiClGY3dWt20K?=
 =?us-ascii?Q?wuYPBWC3Qmg1gf4vXrJYb/aMxgK5Opdom7GnVdJiKiew0a2SGKaYJ2f3wacV?=
 =?us-ascii?Q?A9LmkWQXeOKR/7vXr+lFFYLUzNsbkCc2r3fQjz7pKMQcw/+ixZ4CaDsyeoJi?=
 =?us-ascii?Q?Jsij07FU480PK/iFD4xqb/BIgbW0qYxTzjvchKjG0UWt2K1kAf1lfYRa9MjP?=
 =?us-ascii?Q?zrdIQYeD+MVK6fCWgtPDLOSBu7xGdliB19MKr4YorIn7oLLzU7DhgvPF844H?=
 =?us-ascii?Q?of6C7x9b3V2p8Si0gD918avAsmqg6k1cTuO2Q1KFXAcOLFsARi/MoTx1w0TK?=
 =?us-ascii?Q?Sgstc+dU1lzUyY1F7a/FLJyGedpL/f//qHphi7obCAa1ZkyPcfkiG6m3pURT?=
 =?us-ascii?Q?qPjFq6fxC0LdXoFKKkzaEi6G1fMdcIhWR24RGL2n65AA7Vrga9Vz2yRuHcFa?=
 =?us-ascii?Q?xVzECE/jVwz3sPR1IM0bPJwDQClJg+Lte0W16K70RLMPhOsRb6ZsXBUK+6al?=
 =?us-ascii?Q?3sK1Rw6rllfRfDGcw5AJ7e+NXaefO31tEJVDjQW6L7IFgf9Ls+ehiJW84Kgi?=
 =?us-ascii?Q?BOBlCGToxr6VSiDFoLtSk3J1GLS0PBSZiaFvg3WPmWT/czsytNka/BJGrEPK?=
 =?us-ascii?Q?CDkfymIGPuphFOld+yrdCZIN7WKYNBWHWQTHo3QXvmkv0Pylfwhmvh45R2Vx?=
 =?us-ascii?Q?WCIUWt1UbM+0LwGBvYVtwmpEvq+uPjo/evQ/0cE+I7SciPw5MFz+rpXDSyNe?=
 =?us-ascii?Q?ro1YmR4ZsDA0c/8Dui/iiCe2OfVpUJDTA0FSJ8puivjSI25SxQER5iiP/JJ2?=
 =?us-ascii?Q?rJ3cd88HSxC3GK2DnAlGTImlQjxzIqcjR2yA41F5cRaRr8F04hugIMeREaid?=
 =?us-ascii?Q?+xTfnbgSIt7Eb0yOGGVE6J0PpkheE+lUycxpUXaHXorhTECwHWPSSDjqIaFG?=
 =?us-ascii?Q?USdKYhgGJ7jxZRaloVroZwOWleBITMM9C/dBlI8GtSALuaFLbMM9m1BrosSH?=
 =?us-ascii?Q?LgvOgaxa/BEUvhiApEwXPKvS9QpC0BI4A2m/In+d/dwFrtq8SwDtWhjbdALI?=
 =?us-ascii?Q?fVVJd3DuNbOwzTDBifqywzIGaH7NqiHD6CwBRWMj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a10844a-50e9-4715-4e66-08dd662ea65e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2025 15:07:50.5760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UD5ZTNZ/iCCJXZvf8QaC7w6YFB9YK7dwWWwU18y6cKNZqasJ+Br0tTCtihs6nSjmTWTVvHTeYv7+6851hjPcMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8348

Add compatible string "fsl,imx95-usbmisc" for i.MX95 platform and
restriction on reg property.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v6:
 - no changes
Changes in v5:
 - no changes
Changes in v4:
 - no changes
Changes in v3:
 - add Rb tag
Changes in v2:
 - improve subject and add Rb tag
---
 .../devicetree/bindings/usb/fsl,usbmisc.yaml  | 23 ++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml b/Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml
index 0a6e7ac1b37e..019435540df0 100644
--- a/Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml
+++ b/Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml
@@ -34,6 +34,7 @@ properties:
               - fsl,imx8mm-usbmisc
               - fsl,imx8mn-usbmisc
               - fsl,imx8ulp-usbmisc
+              - fsl,imx95-usbmisc
           - const: fsl,imx7d-usbmisc
           - const: fsl,imx6q-usbmisc
       - items:
@@ -45,7 +46,10 @@ properties:
     maxItems: 1
 
   reg:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: Base and length of the Wrapper module register
+      - description: Base and length of the HSIO Block Control register
 
   '#index-cells':
     const: 1
@@ -56,6 +60,23 @@ required:
   - compatible
   - reg
 
+allOf:
+  # imx95 soc needs use HSIO Block Control
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx95-usbmisc
+    then:
+      properties:
+        reg:
+          minItems: 2
+    else:
+      properties:
+        reg:
+          maxItems: 1
+
 additionalProperties: false
 
 examples:
-- 
2.34.1


