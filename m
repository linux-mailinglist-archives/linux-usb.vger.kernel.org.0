Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E36B6099E8
	for <lists+linux-usb@lfdr.de>; Mon, 24 Oct 2022 07:38:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229927AbiJXFiF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Oct 2022 01:38:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229947AbiJXFiD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Oct 2022 01:38:03 -0400
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2085.outbound.protection.outlook.com [40.107.103.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 259697B7BB;
        Sun, 23 Oct 2022 22:38:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l1cgms7Jxu5cZ3UuJiZnrKPB5Ck3gk3JRpSykeakRnLsbx4gjC37L+tLYkOss7I4tCZUkIXGKz7X1RFZ5pk8MI+N9FxXrURQY2BOHUOMPQp+aK00oKVBBzMDEvPftTtwKEOOCNdNwE5qDcf7PNYnWdNqnOONLEMo7sibXI02lfwvjEmTJEinyZio3DXvGxCfC8EZ7IUv0+APGBxTf071YUlLO0XF65Y90rC0NHJowtgn1Y41JsBXVqgpc9Eje+V83JZVwDp5u6dEdgg0kk/zZbRXovohLQZ2iER6LO3w7canpMc8ro5QUuX95Iv9kcLmW7e9JQlBreCHoHyTIpiE6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2nf77kQ3ys5U0Tm669miGOA2KwpA3QFI6mP6XfL+/GY=;
 b=aegG+KXUmwI/v/CQajbCyMQ9lsfTJNpzxSmKnZaneotUNdjyidlvBLBlhq/Ylzyu0uIG4XviM/pyWs2vrDClKzKpZwlkVpjpOcdR15lmO+YDEarspcWCNUikXEwFQM9/qWwHY+YkPGcXtgvS4/+Yub+XOL0+mazu438OQqbu6SjwDcUHTP3PXki0lpucQ5nVCAcf43qO4zimsjN6DzMdZ947V9AnmknI8aXL/FGQs167xzDbq3Lp8alosBUqi0DJQ9BfxtN7w7i0SVxhYkQiVXwV1UDWJ3CB5F/yjZvfdsC3wXeU1JowWSVl6x2F42fZx6FYDvcMpUe8SR564aLqSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2nf77kQ3ys5U0Tm669miGOA2KwpA3QFI6mP6XfL+/GY=;
 b=H7JVIiZGg7he1a+aUjXA/oGjSHcQ1omPVckQQy1CJMW+8+IhbMSv2Y6Zwv2WniWx+ztzsz12sE8RGenGEKV4MiM5PPfkZ/Ty6D7pc/BEJsLKiKHJnnsc4r24sz77NIhS7JTUIKRLOlvsxdkeCIJPqLNC9r2B4TDj3o0DsnOBrYc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com (2603:10a6:102:261::21)
 by AM9PR04MB8570.eurprd04.prod.outlook.com (2603:10a6:20b:435::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Mon, 24 Oct
 2022 05:38:00 +0000
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::cc4:c5c2:db97:1313]) by PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::cc4:c5c2:db97:1313%7]) with mapi id 15.20.5746.026; Mon, 24 Oct 2022
 05:38:00 +0000
From:   Li Jun <jun.li@nxp.com>
To:     gregkh@linuxfoundation.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, xu.yang_2@nxp.com, jun.li@nxp.com
Subject: [PATCH 2/2] usb: phy: generic: Add wakeup capability
Date:   Mon, 24 Oct 2022 13:17:28 +0800
Message-Id: <1666588648-1047-2-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1666588648-1047-1-git-send-email-jun.li@nxp.com>
References: <1666588648-1047-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0119.apcprd03.prod.outlook.com
 (2603:1096:4:91::23) To PA4PR04MB9640.eurprd04.prod.outlook.com
 (2603:10a6:102:261::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9640:EE_|AM9PR04MB8570:EE_
X-MS-Office365-Filtering-Correlation-Id: d1a9ea8a-516a-4161-eb4d-08dab581e9e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ulE9R/e5WJbXrdGy5zW8LAiT238V2PGVjkzv0e43PdO2rJhilj9xrcaLfYlqImNkqmQ+VjhpW9mOEUOqELv91JAatrfSSJo7fIEZF5B5mVU1LA9m/C3qhqNQrDic2wIU5jf6CpwxidW1S41Omx4+s2xpxU6rLyAKCk6CHXI4lLyO/FDew89s8hiIEHm6PkB/8pk9Uw6l5p/SsDOeHSSuMb0i+h4580Y+YDJ8Tq/BrJ3xorFRDdvCRBaCLV32iUr+nmeLA2esBl7z9SzVVwCOryrWjK0dvHnak5HtsOJh/myTvEA5xiW985eTPW4geP4oooLY8WZrHEH/3PYnEKdRtL07HI5p5utQlaqfx5Do+3OUCP4LjiGCbqgzRB/3QaXe5RdApFqXWJjWmdo1nNbqGQR6daQQCt5HlZlDHfpnbL6Anvtm4U32vU12KZ7JIcXYP5n1p7WkQKogFlRQn8tdNyFafTq0f8INF1lMg5jcboBZaC2c9lFhCvfVznVfUl3N37UYpIjtC3Jk8VjQCh86JlpBd0khHZDgOIAvJ6GZlAWy0qWSQzq4vhRRgftum0oFIg4VHHGo1FGFpTg6gn1Uw9g+YBoxfno5FqoIWiETDRIRC8mYv+1GOfoXdioQViL4nAFQVzXOaAXmpMRf//RwAet9jpkDnWKA9qCJiHc/+IMQUDbqrTx85uNjWl2yC9DxlGFq94Neoac+Co119aKgD/cmYO4AhH1gsKbn8Flr4aDDqTNZEYh2jlc3MfQ2hD3/+JqeEMVzMLsK80+ievFAtQPlJG7tYVlkas6L3OgM0gk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9640.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(136003)(39860400002)(366004)(451199015)(66476007)(66946007)(66556008)(6506007)(6666004)(4326008)(8676002)(8936002)(36756003)(41300700001)(26005)(52116002)(5660300002)(6512007)(316002)(86362001)(38350700002)(38100700002)(4744005)(186003)(2616005)(2906002)(6486002)(478600001)(41533002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LtDqIFcndXOmWeUt3ndK9tAAwotmZSgqU+lKvSNr/3F2l8XKY+GTG3igxP/2?=
 =?us-ascii?Q?A9b7klLRDOoQuQ7UAV7sxc2rq9NAY/qA75ZgyeyIWIfPpG9KZ5HgomJwkJHa?=
 =?us-ascii?Q?RKCtJZ/rtPLj+/DO2pCHXVsx1rIIwDXzZPQet6Njx6f7GXMowAw8MKllNjve?=
 =?us-ascii?Q?KpG1pqpV0NkyPmkgA1TZagPGOazeaneo0Xy8WXu/WLIUc4iwEIFWhrT735gt?=
 =?us-ascii?Q?0EcT7j9YTmLtbNWH9aqgkNjRztdWMTXl2BwSDNkZ0ae5zaf/ZDd6fYiFAmgT?=
 =?us-ascii?Q?wBhnIMqhs/yBUMGCRUf/laI2kCf0Gx9wjSGYmet+cU1pLxOT80gdHchLupPi?=
 =?us-ascii?Q?CI73OcV6Vbfby2jMl4mZ1VJdB1yxFJiscUNDsBAnCWKyUY9F5OmvB4dnJ3dW?=
 =?us-ascii?Q?FmVeQ4l4ZvtqI0FCdYapPUPdMhhSNlfQaW4Wev3Z0EGGLOyCo6APrPY2VoZC?=
 =?us-ascii?Q?yfYRYl6KPyz8MFoQS5IwQWdwIBmWVANn2NjLB04oIVSP0wXSbE7/LHnSF/dK?=
 =?us-ascii?Q?2bMRrICjwvE4u+DolTdKrs86Re4kgcnvYLbXnbVVgPYGWKk8cYUSmZWCnAMs?=
 =?us-ascii?Q?XYqdJfWKt6m+dbju5JhHK0RiWTkoK2M5kKXRykMn/WGCJJinI7V9fSzm/DYD?=
 =?us-ascii?Q?MjO06Um0in6mVoj5mm+hAu3FvdhIq9mS1jn8IP92yF3S2clTSOWl68Ea1Bn4?=
 =?us-ascii?Q?aPOXUK58hsKjhSvq5NY8lGWVoPID2up9ad+F9EW7N4ojl3RgIhBzlGTnlvLz?=
 =?us-ascii?Q?UrVBZUOLxo5a/n6KSqgAeG40ikYe15yBOa+tnRK+Axk/8m//LuQNfLwIYRY3?=
 =?us-ascii?Q?alQj5m57jZWnveSK6GL5TAonZNCC2wS/AX55MkUjL1XYPyo74aXEsOiKjj1Z?=
 =?us-ascii?Q?qmhxY4JUIJspIgBp2ysVoOiRzKKJNVUh+QIhzWsdmNBT2Sh/pHn8thcSzIfx?=
 =?us-ascii?Q?No4QfoQDf21iihofXo0otH2b5xkRPRgP0d9IjooSXT84SFNsM11NuS9pigl+?=
 =?us-ascii?Q?BR9OdYumjkQwFzkE9XfoAxUghDByRm5r+6fMIm3qakOwTYP86r/kEZv2STnN?=
 =?us-ascii?Q?C6tG6NZxJ1ZjkU37Kys9VSM7rc5ds3D3jUtR3S+QdPp04o4cQL/nG2/UEfDc?=
 =?us-ascii?Q?QQmMMGRW+bl748VUhbeNq/s7suV6qi3WK0CuTQ/VAsGdkLloidcGxhd414M5?=
 =?us-ascii?Q?oX1VWrr0uZSBt4WWTVSfADlf5XDe7WfFRqD+U6D26TkLPIAJ6lI98gVsifCr?=
 =?us-ascii?Q?wv3D+SzG4Uw47Ss/+052c+/t1bltzqE8SgGnAjxRriWizMSY4Bi1Mlzw7/Qn?=
 =?us-ascii?Q?REwjoXnVB8YjhdMP/yyaoegFMTEXhsqjX5EM3KfvfJP/LESJl5XoosMwseBo?=
 =?us-ascii?Q?y5okvk9DeorMU8iR/2sZBuWn+cHEvSe9grjThz25u3b08x6rp8vOikgCHPaI?=
 =?us-ascii?Q?27pkZ4YHFMNXPkaHASr3i0z7P3aLpf8LVSwjHoZdKMmWTTVE3H5QOxMiX4mf?=
 =?us-ascii?Q?CgqVh5ftwzU4EVXbp7JNTFBkPS+QWjBvbxcBrSonrhTxWkhqAiKgKf99z7u9?=
 =?us-ascii?Q?v32DlL+Np1Rzz+CqkxmuYWaOfAdVFpq83K3+6g86?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1a9ea8a-516a-4161-eb4d-08dab581e9e1
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9640.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 05:38:00.8464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yw79CWMntqifkIV5WsiheOA1Cn7+LI9/39IFDlfBeoysfWFvp3VnnMu+nYIXLa7B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8570
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In case usb phy is the wakeup source, enable its wakeup
capability.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/phy/phy-generic.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/phy/phy-generic.c b/drivers/usb/phy/phy-generic.c
index 8ed9327cc4a5..c1309ea24a52 100644
--- a/drivers/usb/phy/phy-generic.c
+++ b/drivers/usb/phy/phy-generic.c
@@ -286,6 +286,7 @@ EXPORT_SYMBOL_GPL(usb_phy_gen_create_phy);
 static int usb_phy_generic_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct device_node *dn = dev->of_node;
 	struct usb_phy_generic	*nop;
 	int err;
 
@@ -323,6 +324,9 @@ static int usb_phy_generic_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, nop);
 
+	device_set_wakeup_capable(&pdev->dev,
+				  of_property_read_bool(dn, "wakeup-source"));
+
 	return 0;
 }
 
-- 
2.34.1

