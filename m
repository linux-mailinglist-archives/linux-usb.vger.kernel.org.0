Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D127127F8EB
	for <lists+linux-usb@lfdr.de>; Thu,  1 Oct 2020 07:10:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730723AbgJAFKG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 1 Oct 2020 01:10:06 -0400
Received: from mail-eopbgr70057.outbound.protection.outlook.com ([40.107.7.57]:55458
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725952AbgJAFKF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 1 Oct 2020 01:10:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BXGQLxzqhN3JRHylinhJi0eLRiIWfFQQo0ccVgXTGWHDuZgwhneqyr5H3873ah8gcVcAM6eDksLJcoeeU19pDKpX6hVIv1VSNgSArgO90o/K/tLIyrgAO1wAtk/W0ekIPCckApBGwLSTN/Xv0BK3eYvI3BqnYpZ5XXrCbJ8iuCUsym0Z1uicjxJ9INjfawUO5F/WTcyAn7TZfvs5IyW1dI+2inQoR87ALacJwRJRP+a+e36/F6ajifCigoQEk5V6SkYADzibIKfqimsBG8SSirL/xPTcROZvP0F2ZjlZ2GIA7Jz97ylyYoV4ckdq9LxUZifcZ/Y6MqoDNBHF0rBNOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D8Qa49CsSudhF1+O8+6QH/uDpcce8pGm0cWzq047nRc=;
 b=D11HPQPyRwCUOCT/gqfFBri9tf40TvC+PGTR8GJogNSHBUDImcrwBcsNQhAW7qdDm3vNUNoSDRzSJgV1e5Rw+PdeR+j8Nh7njkX1JAb3CWwm0IESBsFcHNBZ0ISKGRC2to4XpOMkS7OSh6NYcfVa7M8yEbXDygXPOnrzo99aDERGCSNupQ31RvUhGRfqmpgXeUPp/usOWzoTrftfsbbj89IHYf9EyZynIHikRwyt0Q+6Rsul2TGZFGllPj37Uvdue7/wPJbH09008Qotpljgcl01/Cg8T7WntQhIdSz5fuHVQfLgzyiWx2xSuZz6GW4KQ+lh/O9pT7voduGnYYYdpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D8Qa49CsSudhF1+O8+6QH/uDpcce8pGm0cWzq047nRc=;
 b=NuANVy6tIq61389w/wQyIwckreab2kZKDfaQfCzOMPkVhC1V+azZ5xSoe+oYCBs6WXO6jrLAOmtlSDRtY7AYIHy9ANFwrlKRTWQs1dz37jGXOqzeHVa2BTA9dvPbP7DblSgFWk+wrCUo0e8QOzAwl92GWTN7fn5Fz58YrxowEGw=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::12)
 by AM0PR04MB7137.eurprd04.prod.outlook.com (2603:10a6:208:19c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Thu, 1 Oct
 2020 05:10:01 +0000
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::ad01:9b1c:3b4b:3a77]) by AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::ad01:9b1c:3b4b:3a77%7]) with mapi id 15.20.3433.032; Thu, 1 Oct 2020
 05:10:01 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, pawell@cadence.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH for felipe/next 1/1] MAINTINAERS: correct Peter Chen's email address
Date:   Thu,  1 Oct 2020 13:08:37 +0800
Message-Id: <20201001050837.14499-1-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [119.31.174.67]
X-ClientProxiedBy: SG2P153CA0017.APCP153.PROD.OUTLOOK.COM (2603:1096::27) To
 AM8PR04MB7300.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2P153CA0017.APCP153.PROD.OUTLOOK.COM (2603:1096::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.7 via Frontend Transport; Thu, 1 Oct 2020 05:09:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: acc045aa-2b25-4ba2-c3d7-08d865c83fee
X-MS-TrafficTypeDiagnostic: AM0PR04MB7137:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB713792A20560439CE5B45C428B300@AM0PR04MB7137.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:741;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rUqQa0jBb44LgoPwo6DdR27zaxepecup6soVgWUV3m93tp77q0WzS9ieg/rNB0OHU2HTlCVunUUqAVx6XwBlifoIS7S9E/9QOiEuCaedGsN20GUy1RhNiMX+GzbM/+q576kz1Fuf9yaq5L+jzgI48zfH9NN/ClkWnwEvLMhc6g6LD4V584OiELBwI6zb4x3hHFjMo6+8r52jc8Ly6+h6bSnZFTNz/4946PVor25lY8KLo32HPQeSMJRgFNVcF4VElLgaXedEoX1HyiFlSo6K1Zq7w1xZF9wweMPgcWeBSOtj98S85sMNz3FmHiJp2FizsZKONRpJc0aAFHsg9qrS3CoM6Q8xNLUZCISV49T59lpsrv/jCn6Pknp1DT8kdZEl
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7300.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(396003)(376002)(366004)(136003)(4744005)(44832011)(2906002)(66946007)(52116002)(8676002)(66556008)(478600001)(5660300002)(66476007)(6506007)(6486002)(6916009)(86362001)(956004)(2616005)(6666004)(316002)(4326008)(83380400001)(36756003)(6512007)(16526019)(26005)(1076003)(186003)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: wtZnNv/JiRSMbJtw/bsPd9FebaEwbzac3Lkf/mppr1v9xbTO7ZSjWdov1caa9R+Qgy+fNA6/DOl/Ep9RGwylRQDUgaJQNelFZ4W1bFIJzXHTY2j7B1yORl4GGQ9uMVAmo90HjvqMBVLSh9rpyFswbf11xoHAwE7bBPXcrjb2dazuBOHI3a54h0nSrjJCo0O9REaV/wKnPmt8MNG5I7geSDzst8L1NVsPg4r8WGDBbweKVHQvijF94ugqHJ/v8CCVHqYNVZVS+GZAnxd9LanX3Vu0u879K9w2w03IUhdzm9nFzndOvU7yeUi1LaYmZQv/WMKIheUKCZSaUqYKKCt4yCLlWqOu3PP0z/A6UVwQCkTikv6Iy6zuoHVrONphHyPA+NRo6fYpcasQKsTeZjCfI5+h1B3dnWDYFZhoL/VUVrXv9+DL5kBT5ApulOyFQjjj7iyz7Z7mRtCn7QOQA9W6sIViEgskoyBmvJL8Pc4DgY4VH5OfgUAWxD+hn/IjZuFqucLB0vfNfKZrBlkSm4P2GA5Vf86CMq0qsygKIBVfk46VrJa9z54NqLm/xjRNunwO4S/E7l9BsRswXgILyrvw7IbLotB2/JuHbkGiE2CxXrGILx6hk0uAOOPIutxh5d09ag5p60blKZrMy/FJoXx1qg==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acc045aa-2b25-4ba2-c3d7-08d865c83fee
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7300.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2020 05:10:01.6697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EDr9dlzP+P1KRbuJoVulaQ0NgoZxaKwnk/zRNSIpVb+uTfSE3WnGrk5BqCuYVime5AoQD5hNpP1RpbuJ53dX8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7137
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Correct Peter Chen's email address

Reported-by: Pawel Laszczak <pawell@cadence.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
Hi Felipe,

I am sorry I wrote my email address wrongly, the related patch
746a439775fb ("MAINTAINERS: add Cadence USB3 DRD IP driver entry)
is still at your test branch. If you agree, you could squash
it, or apply on top of your test tree, both are ok. Thanks.

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 47816f4c1d81..f1acb31f7dc9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3857,7 +3857,7 @@ F:	Documentation/devicetree/bindings/mtd/cadence-nand-controller.txt
 F:	drivers/mtd/nand/raw/cadence-nand-controller.c
 
 CADENCE USB3 DRD IP DRIVER
-M:	Peter Chen <peter.chen@nxp.org>
+M:	Peter Chen <peter.chen@nxp.com>
 M:	Pawel Laszczak <pawell@cadence.com>
 M:	Roger Quadros <rogerq@ti.com>
 L:	linux-usb@vger.kernel.org
-- 
2.17.1

