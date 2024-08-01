Return-Path: <linux-usb+bounces-12813-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2671E9444B8
	for <lists+linux-usb@lfdr.de>; Thu,  1 Aug 2024 08:49:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D5511F2300E
	for <lists+linux-usb@lfdr.de>; Thu,  1 Aug 2024 06:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E144157A61;
	Thu,  1 Aug 2024 06:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lMfuu3GR"
X-Original-To: linux-usb@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011029.outbound.protection.outlook.com [52.101.70.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0511C1BDC3;
	Thu,  1 Aug 2024 06:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722494932; cv=fail; b=INC6VwUpJqHGMj8FPpSBkraEwBCgCRhx5C/BrAq1ZLyjHwCpHmQezESAk0UFxKfnIlpEX1H58jDypppGpso72nrYfNmUi45hVWFjdrw2Z7zIRx/RLOU/3x3LILQUUtCyTE5TWXvbKcbi88DsfLqo0w7qtTDIM0dBOhDtO6dHvnI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722494932; c=relaxed/simple;
	bh=f4jzhagkV64krS5KaBeP4qWU2eknfi3BpbgDnDuW+jw=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=AOPLdo9r6YKKwDJKH7mFhT29oGzHfo4BnUetIGsvn6BqcWGUCDuxA+FBjMyqsxVwN+C7gePeyVZAnq7HKg/HgJJKtGsn6Zb0eMmq8iOAQrmv4kKH9gKSYzo2nTnumB4gfaH4iyK7rEHZO21Xl8+K6GZnz/sk6xnAIfhwMUHDP+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lMfuu3GR; arc=fail smtp.client-ip=52.101.70.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FL/8+yiy/hwCHkKrUlDgxHcIlfl/59MMO9Hbd6SBeH2tGStSjNCgnRaXa2CnH00YRY0Xg41hy1WB7Pe7ykA2Y8A7Q3HUUAzuZeJRYyyvDhb7xGfzMDz8Kiccve/39KUlbTshfRGLjQp4iva6CoysU3/glAoo7DVGAJTN7QFcVX22aoJRv4g27uuZHVKG5AzDlmsRIvAdrimkkGSOHi/2/umb31/hRXcUjWipfIIZSaHfOPn3knJ1IFil3Oa9MCPHLe/7AsU5DxZNbCSsZG83geviTFORcuD1VBdMPy2NVWmI7mDny+PF4azk0sJL6USyHp61m8TQ45jZxjaI+tfIhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OlkFZv7k/RvlVJ7xhNTnUbByDhIGLhPLSMfn0bXRuSM=;
 b=HPflrGzGOj/cwQxG7xLvIpi/6GJvUbHMlIJIEaVLF8YuQKP7uMmDqNBD5mO24uuA7lnv5xR3YIh3hXahRKeP/ZTPiLUOjzQAscDr2O2vzCMM0UB5rmWqiuCWsdMALviJOS67f4dH1WhX19JiRyCiPCtP/4uQXKk1xCxqevkE1kOBoaSI512mZGVfvIbZKJ5v0Jo1/tcaA5Odo+0Yai5SfxMueYzzOl38fd0KjfquwLDtLfGg4bf+5c/bNb0XOKjS2PnH+g/5jSA6qUMDZDTowXbq7O2EYWIxI67o+gE7cYbGXww2CGPk0m4cmbcrpitW9M82A1v3yOIO7YqmByWBug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OlkFZv7k/RvlVJ7xhNTnUbByDhIGLhPLSMfn0bXRuSM=;
 b=lMfuu3GRJs7swoalHVpndk9EHxNBk/kvN3SVelLlg7ARBmtMg+CjyVkLTxlR//NuLaJb91gBT/joLT9wijtgL5+hJ0IK/FgTM1DfJ9ZwBgpbraUFzWJ/O+Df7fRi1EExhtuJk3sI7pdiUDBQXwd5RIkOjQ68u836EcyFWaZdTL1j9XnqYy+leGGc1Nk9uctEdr3iLQSDkctx+f3ZLd0Kq0DoCYSZILqYsUxlHato95dNZj3IR+IWfkWAlr0TAZ7l6ooOwkH0b4QdYj33kI7dU4Sm+BPErsTfSfBYEo2Kdk/20BeaoUC0376Q3outVgQO5NBZPfFjg6IDRtmhjPmMZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AM9PR04MB8732.eurprd04.prod.outlook.com (2603:10a6:20b:43f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.28; Thu, 1 Aug
 2024 06:48:47 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.7784.016; Thu, 1 Aug 2024
 06:48:47 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: andersson@kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	jun.li@nxp.com
Subject: [PATCH v2 1/3] dt-bindings: usb: gpio-sbu-mux: Add an entry for PTN36043
Date: Thu,  1 Aug 2024 14:49:05 +0800
Message-Id: <20240801064907.3818939-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0011.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::14) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AM9PR04MB8732:EE_
X-MS-Office365-Filtering-Correlation-Id: e569aa64-e693-4175-76df-08dcb1f5fdfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|7416014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OAVMO4cNzu0L/UPHpQWSxN1/uq6eEgIh1V+8rMqkZ/4S2ZnKV69vV3K9fLrN?=
 =?us-ascii?Q?OSjZE+yB9pZ8SZCF3gUgFZ0le038HWHYLQJ1SzzMxhx4EQy9W/+FbJOCW8tK?=
 =?us-ascii?Q?SWgPxWw85hcQCUalKa3BmKzVP4BqdKDsun+869SFKw8qQK55a57KFNuyNIKj?=
 =?us-ascii?Q?FQOSFDqct63KRdVbYET9NILMXkpwh1F3c4Rq2JEcFmMm2uyV6LJP1gMzuozN?=
 =?us-ascii?Q?TKb/X7qS9LpkNxAMlrEOJGdyDzAlKOItlA/VYFrvjXksb+1pbndKGP3Cf66B?=
 =?us-ascii?Q?NdsFu/NYWmr9L+TC9sycjrXd9NDzPe/AuNK35NVYs23Ybix/YhNQKfxY+ZCu?=
 =?us-ascii?Q?bX5w2H+a4RYn9qFQg2SXuV6bMkY+InXmwH/RtLoq6Q5svGEIUNBVzXG7OWiz?=
 =?us-ascii?Q?7PMycFtPG6JMG2I5BT0D1wZXXbeKTeG/wAzH7nkWXtxjahF+rGxQoNK6VfIG?=
 =?us-ascii?Q?SfN1D/zCf71ePceuilhhmMOLYAQpthPnWd4USTgRZG/8iW+sQTGkkyttcBG6?=
 =?us-ascii?Q?vs2dzyPhYIVcMy/ukfJfvKkU73T/B8gEwYpREb3hfQrYFUTg/9TV+otFWW7H?=
 =?us-ascii?Q?N0l3bRSUbcoF8zTKjOnQsdpWjWcjyfVybJZQ1NB+y1tXgnCAm5ZIfxHk1XBJ?=
 =?us-ascii?Q?YLQ4WWISZUFHxU/IVCvXu8H0kcVbyCBb0fuwutO3aUGMRvGReF254CfuD901?=
 =?us-ascii?Q?t+xGtXU3N5PYpjJqG1YJdJHwprLis978q4nZOWHsAjcFvrM+kmTiAyw1O/tj?=
 =?us-ascii?Q?vjGSAoEYBE4HrHr+JBJXau8bJqN4NjaH4wQHEvSJZrL+PvWReeMIq3naxLcW?=
 =?us-ascii?Q?JPp3eJXt1ToqO7vdOHJZB9rOvAaB0LmO8uQ1AlkT2rpj/WNknMiEAP7+tsp2?=
 =?us-ascii?Q?ue2j2TGIQaL3Bm+8M9dp6GvvHlMBXuh/gPGUCopFWPBKpXRrPyv4hKtnWpn2?=
 =?us-ascii?Q?PFYqgnsklfidUL7AqD+GdqTDZ9/p81qgo4Oe11njzJS7vi8344T/zUmVm6jZ?=
 =?us-ascii?Q?PMDM+WBPcDT9k1sTCovzAcnXNtlZ0C7M7tTucbpkg7oMev06gsPGMwnDtWfR?=
 =?us-ascii?Q?avVRj0L7TB3gjtirxy/BebkqWjvXeQGDRhWVJkwweRwLpPRaWrzTqDHztjqX?=
 =?us-ascii?Q?JU8WIqGTo/ioY/sq+8Q0BmEE3oMYhsfL6o2oeSU1eRbvJ82mvuK4L5WD4GUV?=
 =?us-ascii?Q?KtY80Vo+HbbeYVtl91hpGxfIa/4HTU3X3dhdXq+MbGPFuFyZMD51wgSlZ9bh?=
 =?us-ascii?Q?+CDt/uLgIoTvyzleXLlfKirQniC5OIKTwoC1k7ulsNPRftU82G5FhgZkTVbz?=
 =?us-ascii?Q?Zo6dl84pwQx/HYbl88smEJfNtQ6ZpbIR7dqBpLfK/E/J2dACtDaWCFBnucFU?=
 =?us-ascii?Q?t1VURgU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hlU37+8TuGCoaCubXEz+P0WVmAQ83kf2ZajeqVlLBDsUeOZ0muVjIPxNvPrS?=
 =?us-ascii?Q?WRqse4k+Gh+d3x9Fvv5JMbyu82O/rAG1gkea9VpmnAhEO9E1/8vZn1COtVtT?=
 =?us-ascii?Q?ibAQFnuEosUJB8LHR6jtD9fnF4MkB5/31ORzL7sfbUCt6mhrJBM5c1ulWVVv?=
 =?us-ascii?Q?zQ3UdbNLpeWozVvUmtV3t7VqHymAhxz0agrrbTojX5PCeS5JGordBOpXYtWN?=
 =?us-ascii?Q?VwHF7ko4wXrRL9ebfxhM41MJobHzb6LvTsAEswn0zF5+KFlxmoReT33w5K/x?=
 =?us-ascii?Q?pFixd7nT6OgOkUPM1EnK/jjfq5+DtNRIHDWZJTsycnO2sX7I3AH8ypPsLSAg?=
 =?us-ascii?Q?RZ58OflHXKscMxKTN7YQXzir8qfig4aHkxhZNWH2fPSGMmNPUBZdD+UEtvfa?=
 =?us-ascii?Q?7EJfi1AU9UPMXs+X7spdSXkhEnwihEdMEod1pvKD6P5c4Y2j2CI6IG4WldNE?=
 =?us-ascii?Q?6UUnQgXSxfhI2I62VO8qGDCsS93YbzM9vhXISsqTjI0NPSuVX2vTlG9H47hy?=
 =?us-ascii?Q?GZiGMkBDfpsvNuPyibOq98BKsAt0AgFmH59BOi2eiYqi/8So4yCVhjYMSnKu?=
 =?us-ascii?Q?L6lVjuE1vay5ce4PRayQOmRxWeoM/KNYfEuceSGExx2FymgRdtMSeQH8BEjo?=
 =?us-ascii?Q?3XNZIwb6gNS9kZcPb0vSkPAYvqv1+XtxPWLNotJLfn21DK0VtmJwHeNTj8oX?=
 =?us-ascii?Q?29uh3E4Ld0DgZjLE/GrL59oOm/jnqWD+y9AkQoGuutDl7W0GMymM7yKxbB1F?=
 =?us-ascii?Q?djZS/s506SHipV7qQ1ttQXRBJkA5qVeLhfrUqrB+cXJYktxqXn15ER3aWGs8?=
 =?us-ascii?Q?VFEuC6Q8BRZ7fwu/Patsr20af9W64VRyY1hk2tHxUoTCgiPYcDg65o2O2YL1?=
 =?us-ascii?Q?fmjDvQvGLwLcu88kmi/4q87M8YFSHjpcw3JwtJkpNFwnl71rEpIcbXEVeu58?=
 =?us-ascii?Q?6+NBftqO1oH5liBUW5SkTKmWHpgRAzLoB0a3JgJSMWB54RnXxnR+8OZIiJGE?=
 =?us-ascii?Q?HZbCzxtza//o0nqdeFc8Z2S9PmFVDUphLbkqQQQkhqub3ZhuazbsskTKKveJ?=
 =?us-ascii?Q?WNMcf1KkXzCtktQxj2YcVP+a6cr7g9FerAXUMkhkhdeEcETzLZxqFfDl1ktW?=
 =?us-ascii?Q?0aSM1b1eqz0rRHawsATmtoE+xvEqve7I9EWQqICC6hYOVzW+y8t3doFF9X1H?=
 =?us-ascii?Q?8mi8CjKz3H8XKINEWzgpNNWY9lZ7JMd6zGaI7aN7pGa8BL2qj2SjMQrELzfj?=
 =?us-ascii?Q?OebjeOqrYnKBHbxCD7doXquwD+8GZAAn0ZQaQlhpqO3aJ/k68KBJ+vl/8L+S?=
 =?us-ascii?Q?px8wO5+BadjEXrs7iJ8QtyPxBnRcOViaVUdQhslwTVMKbM7a6lSZ/ijCgn0N?=
 =?us-ascii?Q?KyymLqG+oH8/gU6+iEAXHhyxClJ7UFowMjEz3ZJ67T0pHd/L+EORmMC5T4g8?=
 =?us-ascii?Q?5GIy91Yim2piVYDEBNpkcVG+VjMU1BwqagAiZGT6hotPzMAG0K3BCrTMOWpM?=
 =?us-ascii?Q?f1neBImGhHyVRJWCG/gOy2HoyeRGH9CqhgvV64ALT8iLu1BOBwi5CZv51bHS?=
 =?us-ascii?Q?GZjVwKuekZxapMJ9cd14Jp/k4KM4RBfRrY9WNvxz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e569aa64-e693-4175-76df-08dcb1f5fdfa
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 06:48:46.9848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g0LJxzn7fOVifg4X+QyydrxTsKa9rid9FswgAyc/4CNWNTULJ1xDCvTqHR8DxbA5xN+gzdjw3aU7s892L9lY7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8732

Add a compatible entry for the NXP PTN36043 GPIO-based mux hardware
used for connecting, disconnecting and switching orientation of
the SuperSpeed lines in USB Type-C applications.

PTN36043 datasheet: https://www.nxp.com/docs/en/data-sheet/PTN36043A.pdf

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - add Acked-by tag
 - s/SBU/SuperSpeed in commit message
---
 Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
index 8a5f837eff94..152849f744c1 100644
--- a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
+++ b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
@@ -20,6 +20,7 @@ properties:
     items:
       - enum:
           - nxp,cbdtu02043
+          - nxp,ptn36043
           - onnn,fsusb43l10x
           - pericom,pi3usb102
           - ti,tmuxhs4212
-- 
2.34.1


