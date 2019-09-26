Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09433BEBE5
	for <lists+linux-usb@lfdr.de>; Thu, 26 Sep 2019 08:20:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389270AbfIZGUQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Sep 2019 02:20:16 -0400
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235]:40194 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388609AbfIZGUQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Sep 2019 02:20:16 -0400
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
        by mx0a-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x8Q675Wa012327;
        Wed, 25 Sep 2019 23:20:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=proofpoint;
 bh=Y5WCNYbmoAAhRz2ELsqXsxhYntgLJIAf1Nlwb7QbUdU=;
 b=OJT8LdBKP0LQUUl4hoZ0g2pfuc7ws7p4yHdpmrqbJ7EDgZ0Gx3ICY+RVQSIV0uwYRiM1
 VqHS7fD8PexGXi2da5w/okgGLjOMf1+8X690WBe0Jc7NPraik5sIZVNly4xo486L9gEy
 iwHLDREy+kk23ECW5flUWACn81gb+tpQUeC7KzgYRBcEHsP+11okJMG6rImBO1rWA4dF
 DOtT7MEvUW2L/+2HhIxfObco6hkm5C/h7eguR0Tog7/T3v7SnNG/QIH7ETGYHG348c77
 M0NHhPqMQlC+gUJHGjaQX9mPjSPpU2HNplmrIBx8B1vOy3z/Od+ceq8a6ldTFEBt0v/9 cw== 
Received: from nam03-dm3-obe.outbound.protection.outlook.com (mail-dm3nam03lp2057.outbound.protection.outlook.com [104.47.41.57])
        by mx0a-0014ca01.pphosted.com with ESMTP id 2v5ge0k4uf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 25 Sep 2019 23:20:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d9mr/G/3qUkhOVDnpYr17xT9JQ3Uc74h4+l0SUw8d26LZxIVwsTKO0HSpdXaDu+G+4ZMWH2TjnvOXDJBJMaG/rOgEEBKq1PyziGtJBSqTY7gSMvXg1lEWin8GF2dzWofC+EvnSsx2iHWiGa9t0/qPQVL0iyvW12Uo6DVa9SY8xx45g0E40B4qvfLtWAJOllklEvHKFsFDB66XcQkXr+fprRuFz5drSgtfxf+THLg79mex72VhedDoGn2JT5q2fCxFM0u4W0y+iF0fGHyEixQIwBwZYpUUTArg/a/L8tdRQ0IFKc256R+JvpPnJA16HWT7R6BFNZ8196RTTUp7jgy5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y5WCNYbmoAAhRz2ELsqXsxhYntgLJIAf1Nlwb7QbUdU=;
 b=FVMLLv+BeVxTzUeiyonWfCz+QV4f/yE3Faz5OMCQvolFF+a9aCJg+CTv/W87Aa2xE1Q5JNJjU1i6IfmPJ/6ZrpizddYdgOawy2p9If9erRTU1C4aoN3wTa4Yzkb1bkpyzXD86xYcOTvZcFi6ncSuVuac+qsH+Q7KBpNvYGEiovx6Hbiajdf/po9KiHmYP4KET9AT8PEYL6Fc9tqSD/1rHiPU5et/c62rtu+1WpLeyvBNYAWDp9HjXDdhe1oo7GQvmNFJsUtUKHHcowllyzLQx4eVhwUQkc8WaDSyubrdPJ4P+EFlX3XH/JYebYYW1Oj1w/a73CDUW9z0Ov9MHkMDqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 199.43.4.28) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=cadence.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y5WCNYbmoAAhRz2ELsqXsxhYntgLJIAf1Nlwb7QbUdU=;
 b=WS3uOHvi2zC3CUPebfsoBbm6nR4Bb8ZVb49cWv8jiyBkWiPk4uU6ncqHL/C9RU43bAsg1f8yj6cKl4DBiX758yZ4rCZxKckdu5cFPGCTrsmqNPOTllsSPQRm6J9p9cDsO9TcgNoxSfMm26TinjsNEtQfNV7vMduMT78pXKIEe9w=
Received: from DM5PR07CA0064.namprd07.prod.outlook.com (2603:10b6:4:ad::29) by
 MWHPR07MB2813.namprd07.prod.outlook.com (2603:10b6:300:1d::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.23; Thu, 26 Sep 2019 06:20:06 +0000
Received: from BY2NAM05FT048.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e52::207) by DM5PR07CA0064.outlook.office365.com
 (2603:10b6:4:ad::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.14 via Frontend
 Transport; Thu, 26 Sep 2019 06:20:06 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 199.43.4.28 as permitted sender)
Received: from rmmaillnx1.cadence.com (199.43.4.28) by
 BY2NAM05FT048.mail.protection.outlook.com (10.152.100.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.7 via Frontend Transport; Thu, 26 Sep 2019 06:20:05 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
        by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id x8Q6K2WS009648
        (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
        Thu, 26 Sep 2019 02:20:03 -0400
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Thu, 26 Sep 2019 08:20:01 +0200
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 08:20:01 +0200
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
        by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id x8Q6K1EN023315;
        Thu, 26 Sep 2019 07:20:01 +0100
Received: (from pawell@localhost)
        by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id x8Q6K0kr023314;
        Thu, 26 Sep 2019 07:20:00 +0100
From:   Pawel Laszczak <pawell@cadence.com>
To:     <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        <felipe.balbi@linux.intel.com>
CC:     <dan.carpenter@oracle.com>, Pawel Laszczak <pawell@cadence.com>
Subject: [PATCH -next] usb: cdns3: Fix sheduling with locks held.
Date:   Thu, 26 Sep 2019 07:19:27 +0100
Message-ID: <1569478767-19889-1-git-send-email-pawell@cadence.com>
X-Mailer: git-send-email 1.7.11.2
MIME-Version: 1.0
Content-Type: text/plain
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.43.4.28;IPV:CAL;SCL:-1;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(396003)(39860400002)(136003)(376002)(346002)(36092001)(199004)(189003)(4744005)(36756003)(8936002)(426003)(81166006)(8676002)(81156014)(76130400001)(5660300002)(50226002)(486006)(2616005)(70206006)(70586007)(110136005)(50466002)(4326008)(16586007)(42186006)(336012)(26005)(2906002)(476003)(126002)(107886003)(54906003)(356004)(6666004)(4720700003)(186003)(47776003)(316002)(48376002)(14444005)(51416003)(87636003)(86362001)(305945005)(26826003)(2201001)(478600001);DIR:OUT;SFP:1101;SCL:1;SRVR:MWHPR07MB2813;H:rmmaillnx1.cadence.com;FPR:;SPF:SoftFail;LANG:en;PTR:InfoDomainNonexistent;A:1;MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a017844-d1de-47a4-264d-08d74249929a
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);SRVR:MWHPR07MB2813;
X-MS-TrafficTypeDiagnostic: MWHPR07MB2813:
X-Microsoft-Antispam-PRVS: <MWHPR07MB2813D123FBEF5976BA85B9EFDD860@MWHPR07MB2813.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-Forefront-PRVS: 0172F0EF77
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: BjNp+YQH7r29eRWrzgtDb+yG2+x5nqfkb+cVHei4VDkXZdIrqqdFLH5/08x1gDbh8i6bwpxNodIsvyiHD/+oIYeyidzoiutEv9pGGswCO38EdEqv+kVgqlpDmgwsPuy1sBLWMJZ1AQ4qkacGxrN4g2DoVRsXRJQsjvPSpIy82v1moJfxDw0ltoj51WgFGvcEvx11n60o/v487I8CcxWbHGbmbaVJ2sC70oLC8vYT2hGLjkx4Y/zZLmKq+sSPa3HaJy6ul3bFdWmlGS4CIuqZ4KwkXassgQkbi1PQROrPwAe7BFFRWBXG+vJs3Rn0jiUl0o08f7VUS9Kkfk5ECdHcd27Zz50vBqhnIu5LUCdJiYFeFVa/yYkG/ND8SYDAU00RssySxZQwFjW1BKqoDrYSuJu54mmqeDmOEcO13hVHv14=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2019 06:20:05.4355
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a017844-d1de-47a4-264d-08d74249929a
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9;Ip=[199.43.4.28];Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR07MB2813
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-09-26_02:2019-09-25,2019-09-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check score=0 malwarescore=0
 impostorscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=643
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1908290000 definitions=main-1909260062
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Patch fix issue in cdns3_ep0_feature_handle_device function.

The function usleep_range can't be used there because this function is
called with locks held and IRQs disabled in
cdns3_device_thread_irq_handler().

To resolve this issue patch replaces usleep_range with mdelay.

Signed-off-by: Pawel Laszczak <pawell@cadence.com>
---
 drivers/usb/cdns3/ep0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/cdns3/ep0.c b/drivers/usb/cdns3/ep0.c
index 44f652e8b5a2..0445da0a5a0c 100644
--- a/drivers/usb/cdns3/ep0.c
+++ b/drivers/usb/cdns3/ep0.c
@@ -332,7 +332,7 @@ static int cdns3_ep0_feature_handle_device(struct cdns3_device *priv_dev,
 			 * for sending status stage.
 			 * This time should be less then 3ms.
 			 */
-			usleep_range(1000, 2000);
+			mdelay(1);
 			cdns3_set_register_bit(&priv_dev->regs->usb_cmd,
 					       USB_CMD_STMODE |
 					       USB_STS_TMODE_SEL(tmode - 1));
-- 
2.17.1

