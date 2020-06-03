Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 281841EC9C1
	for <lists+linux-usb@lfdr.de>; Wed,  3 Jun 2020 08:53:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725876AbgFCGxx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Jun 2020 02:53:53 -0400
Received: from mail-eopbgr20059.outbound.protection.outlook.com ([40.107.2.59]:50492
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725883AbgFCGxw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 3 Jun 2020 02:53:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZqKjfbTFFunQmye7lgYy9NVjGwjlmm11evOtC9KYjUP+6r8chMZC9yAEF/MXVkuso6wHRYB0fRD9UgQHuJa2T1or5oF9LhHBXXstDW05+PXJGowoQGBYIqtt3m3vb/yWzf0K6Wi/NLm7I8yIWPo8kQkYLgJ7TFHFO1TALapgrEv8Hnf5AEY9boaMI/vgTYPBBex+HLis69ROHZbkHWwbPwLQ5XGTTrVR5/AV9kWywaNMmNY9ppiArvlmGOMoeQ5sCYn6vOyLEEvqEC+GnZJxNPtTRMLasu5vfqvKxkUHKTUoeMAraXf0CT2H41XXv8EIo375U/HeF4qwOXri+3uhXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yCYZfkHsDRGglWpvzYtjdaw4684/DKNanJPHIE2j/F0=;
 b=iTFFT7ETJ4UnkKVeNfFoe7TL3F9Op7uqpOfyXwr8tY48A9BOSxMpOEKOWDVO2P4+9XYhbl0gFtaKEG0vNuFpyRYBrXhvSI4ubj+jaXXGyTk4X2halB5RvgUi0tpfkpoznJ5TeX1B9BpYocG+8dfRd6AWRViQVodiA6MLCnVUOVNtc8I8Xs4rhlMY2krx/qQXkI+JNYw2JcLnr0nU7V7byFQFuH06SgiYwe7g0RQ5FfnxKmopj17eDz9yq/DXo3DlWuwtzGJfzNcEy/PhJ0E3ubiYaHfzdpdTjcFqNDtANbKv46x/djb5ob54B9bUigqlt4wlg/mcmkNX9SF5ymlfKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yCYZfkHsDRGglWpvzYtjdaw4684/DKNanJPHIE2j/F0=;
 b=ZgP8J5f7JNZfx9YfVWFWymr3o364FgOQ+5dyv7ARJwu6tHAhLQcmTX/gAiOi0jHYGBE84QME2nJL3z3/a+y5bZEaWNjUVNloseLoW25RaParcPsIOu9haXnmTage76eZLNnWp+AgRe4r/9W88iFyyudYLJRpBlBh10ALFGJCmbA=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6824.eurprd04.prod.outlook.com (2603:10a6:20b:10e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Wed, 3 Jun
 2020 06:53:50 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3066.018; Wed, 3 Jun 2020
 06:53:50 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 2/3] usb: cdns3: trace: fix some endian issues
Date:   Wed,  3 Jun 2020 14:53:55 +0800
Message-Id: <20200603065356.14124-3-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200603065356.14124-1-peter.chen@nxp.com>
References: <20200603065356.14124-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SGAP274CA0006.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::18)
 To AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SGAP274CA0006.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend Transport; Wed, 3 Jun 2020 06:53:47 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2192d707-4f54-4857-0dbe-08d8078adee6
X-MS-TrafficTypeDiagnostic: AM7PR04MB6824:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB682400B3246D94D3F1E87CED8B880@AM7PR04MB6824.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:418;
X-Forefront-PRVS: 04238CD941
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6J3c7sx5Zqb2Fq4grwARtJkaO6CZiphVlJhL1ti/BkHDYCAYLIbInrOAL6GoNS4dLewvguRa7EAmMqWPkjgoo6o5qIHZ7OaY/XVPkcZtx607Ge+x3s30g0+0971LuiOaWV3r2zHBFIuTtJn3FDpDRSMwbh5M5sDP74/JSCg+7S/yBTqXKmk7z9CcsFUlxN5ZibvIrz1QZsV/OnITRLdNgZOosxGyiqy74cD5Xhf/wRGlmI0Vpp1huMVBbTWJJJoZhMYEn7Q2xsFkPoLdx676ay8el5S20vn4vmTcnsqr8un7U+Kwe7qROzhepwLjFzlGgoEujLc+fsnsCg9XlPqd1Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(396003)(366004)(136003)(346002)(376002)(478600001)(16526019)(8936002)(6512007)(6916009)(316002)(8676002)(956004)(2616005)(52116002)(6506007)(186003)(6486002)(4326008)(44832011)(26005)(2906002)(1076003)(4744005)(6666004)(86362001)(83380400001)(5660300002)(66946007)(66476007)(66556008)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: iGAcZ5aY4zYdnJPowdxp+unWIagtJqtSlVqwAWvqLrFdkw68G1caJi/kAuJx7jOuBdeSemF0zaMUFug1DDkZ+GP9KbS6jtgolo9pJryduvI6kVlawUHHpczVsArEhvySC7fvkUL/J24Otyv/1cw2RqaYMBTJpis9r5r7ExJeZdsPxVYsfm3Qf9Oc3DNKEqBw/udvukPHzgXNPNt5tg8pCNpaIUUeX9D+6DPOgbVV2Pbhe8W4PCsdBTluQLcMZ3D3iEV37kdJ8Cqud+e9krmJKGkIkGLT8Bzm2v06auKHbi14QMPttBEw/D0LmtI3zZqliTY3J8F6s18WtMQDqVy+lAucRvu/0FodoYZabXQ8oA2MafTUMfAMvXPUT6wyCtKRLoIuVG6zt+DZVG/YHFYYGEfqnKNkBoEb58cxpVxjEwimn55S+kdMGalgE6RNy2uMXV6K7mfjLOgL5QYIB9/0Oy0dhbE3ss8yyJps/BZ46kE=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2192d707-4f54-4857-0dbe-08d8078adee6
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2020 06:53:50.2631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qa6dudadWYGIgRemq+riYb+DxQkkYDJUR8ktiL414KWDqpRFUnET3rKmHNtuJQ3+OvkGcBDeJgfu2gUefbmF+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6824
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

It is found by sparse.

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/trace.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/cdns3/trace.h b/drivers/usb/cdns3/trace.h
index 8d121e207fd8..de2c34d5bfc5 100644
--- a/drivers/usb/cdns3/trace.h
+++ b/drivers/usb/cdns3/trace.h
@@ -404,9 +404,9 @@ DECLARE_EVENT_CLASS(cdns3_log_trb,
 	TP_fast_assign(
 		__assign_str(name, priv_ep->name);
 		__entry->trb = trb;
-		__entry->buffer = trb->buffer;
-		__entry->length = trb->length;
-		__entry->control = trb->control;
+		__entry->buffer = le32_to_cpu(trb->buffer);
+		__entry->length = le32_to_cpu(trb->length);
+		__entry->control = le32_to_cpu(trb->control);
 		__entry->type = usb_endpoint_type(priv_ep->endpoint.desc);
 		__entry->last_stream_id = priv_ep->last_stream_id;
 	),
-- 
2.17.1

