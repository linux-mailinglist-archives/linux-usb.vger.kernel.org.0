Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC308BEC46
	for <lists+linux-usb@lfdr.de>; Thu, 26 Sep 2019 09:00:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727400AbfIZHAu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Sep 2019 03:00:50 -0400
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]:17252 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727051AbfIZHAt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Sep 2019 03:00:49 -0400
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
        by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x8Q6wrJX016637;
        Thu, 26 Sep 2019 00:00:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=proofpoint;
 bh=6XccC4XYXYo1vvv3RKAIZsBkPzHutVvfb12CLLomBHY=;
 b=AUjN6iM1NBxthfkD8KaGbD/OtEclDREP/83q/q+C45Z170+H4DJuAcWXJKvdQzeOVPH/
 BqIabIToiC4cV72F9Upe6ZGba6Umk4EmB1VQAXTsK5PjkcoPb635agGuJAOe0fAQqR9o
 h3+CeWZGbyuN1KPhJRCQBsS9jO9xxq1csNWfbiGDSFr4DP3mwZ7BTWN+qiAGSDPF2lQq
 WBpZ+mEdtMjk86Ckao2f5Uc3+hf0jhFxYO4Ouw4iLNxMkklNNmQIbk2AEYovf04UzBg5
 IbC1b/hSI3Es1kG84+9WO+JjAtxHBcjdTAKARqaVU4PnQUfhgEiauTJx/T1pLzMIPM2i tQ== 
Received: from nam05-co1-obe.outbound.protection.outlook.com (mail-co1nam05lp2051.outbound.protection.outlook.com [104.47.48.51])
        by mx0b-0014ca01.pphosted.com with ESMTP id 2v5fewuwdu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Thu, 26 Sep 2019 00:00:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LzpB/nx14Drzer5iSEAWDtJwzDD2QwC4aB83MszXzG0YcCWoL364k/JKg683+StNLkrpp6/I1cXyjuxmS/opgSKX7H+rCmSSzWSyTHLVH72yq37bv9sxSmo4sqLaL7dLrm6CJYGDG74qf4vgtivoh+mUeUxvw72omcbmpPuFRh5qSgjLgNhPsFhMq+pVVGxyBxsskxbh/W1CgQIeppWnZxiXWnFpqNK2hca4nqstkHtCIK+82WECNzH0B1uLCGkpPuHqc91P6owoo0DoYvY4LUE6sc6Ia2uUk53U/xp2keAFIzyVZUDLx3REDmLFTtQOMZxMaQYGvmExBpCppYT1RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6XccC4XYXYo1vvv3RKAIZsBkPzHutVvfb12CLLomBHY=;
 b=iZMJ+i3TqOZ7urYHQAgslHoPMhjQGgRwBorwY7vAfoR//q5LyprLBUAJX1BDlsU2RuiZvMqWUIwLwH8uhvPPV76Olws+sMuuPX1UzJCZiUv/2Mwwn+Zu+W81KbPo8Vpc7hJYK8GTw35t0F3tJ3JL+g55BLkUXuq9CEAAapF+5ZH3Z8gTU3APtOFXF0p48C5+9b4JG3tVJuS1/08yQX+LOZbOsKS+OmhRc0Ez42xZDQN2P9gdFAS69FNQM1RqLFuHH+CrpcyxbUeuR+OU9o0xO6y8uhmzhq0u5kDq1w90snEu2/2K/MlP4q1cOv3rqD9KZc2R3mB3wyVi0W2d40OU7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 158.140.1.28) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=cadence.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6XccC4XYXYo1vvv3RKAIZsBkPzHutVvfb12CLLomBHY=;
 b=CFtVP1+JHvJFlxgJ33eP8IP9Mg2nPxgyPCZlj0tCszQfieVtMjaIaqBLYeKdQAnbfw3HPbykMMQmqicHyYGGyS2j2db26O6UPqd+vda2A+EPrKdesP7fW0qVz5Dx/qJzjVrPPGSoo2IC71DNHVuYbZFiNufy/PGp1WjSZKiqLGU=
Received: from SN4PR0701CA0022.namprd07.prod.outlook.com
 (2603:10b6:803:28::32) by DM6PR07MB6555.namprd07.prod.outlook.com
 (2603:10b6:5:1c4::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.20; Thu, 26 Sep
 2019 07:00:39 +0000
Received: from CO1NAM05FT037.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e50::207) by SN4PR0701CA0022.outlook.office365.com
 (2603:10b6:803:28::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.15 via Frontend
 Transport; Thu, 26 Sep 2019 07:00:39 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx1.cadence.com (158.140.1.28) by
 CO1NAM05FT037.mail.protection.outlook.com (10.152.96.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15 via Frontend Transport; Thu, 26 Sep 2019 07:00:39 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
        by sjmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id x8Q70aZ3026951
        (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
        Thu, 26 Sep 2019 00:00:38 -0700
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Thu, 26 Sep 2019 09:00:36 +0200
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:00:36 +0200
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
        by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id x8Q70Zg1014324;
        Thu, 26 Sep 2019 08:00:35 +0100
Received: (from pawell@localhost)
        by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id x8Q70ZIL014317;
        Thu, 26 Sep 2019 08:00:35 +0100
From:   Pawel Laszczak <pawell@cadence.com>
To:     <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        <felipe.balbi@linux.intel.com>
CC:     <dan.carpenter@oracle.com>, Pawel Laszczak <pawell@cadence.com>
Subject: [PATCH -next] usb: cdns3: Fix sheduling with locks held.
Date:   Thu, 26 Sep 2019 08:00:30 +0100
Message-ID: <1569481230-14120-1-git-send-email-pawell@cadence.com>
X-Mailer: git-send-email 1.7.11.2
MIME-Version: 1.0
Content-Type: text/plain
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28;IPV:CAL;SCL:-1;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(376002)(39860400002)(136003)(346002)(396003)(36092001)(199004)(189003)(70206006)(7636002)(36756003)(54906003)(70586007)(486006)(476003)(2616005)(2201001)(4744005)(126002)(86362001)(42186006)(356004)(478600001)(16586007)(26826003)(50466002)(316002)(6666004)(26005)(87636003)(246002)(186003)(14444005)(426003)(336012)(8676002)(76130400001)(50226002)(4720700003)(305945005)(110136005)(5660300002)(2906002)(47776003)(8936002)(4326008)(107886003)(51416003)(48376002);DIR:OUT;SFP:1101;SCL:1;SRVR:DM6PR07MB6555;H:sjmaillnx1.cadence.com;FPR:;SPF:SoftFail;LANG:en;PTR:corp.cadence.com;A:1;MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d6db7db-9b33-402d-ae31-08d7424f3d1b
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);SRVR:DM6PR07MB6555;
X-MS-TrafficTypeDiagnostic: DM6PR07MB6555:
X-Microsoft-Antispam-PRVS: <DM6PR07MB6555E3E2916886915194C1FADD860@DM6PR07MB6555.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-Forefront-PRVS: 0172F0EF77
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: AcyudAmw3g1MWKsmVlh51DDLuWVF2zn/VeDbnQHnukieVznAOXpD9Ssve69LKTNOl1WKNVwzKLe1SGg+grJDW2tZaCc6eoXDs93lAaIDXj87EhXWJ7IyXSVRD6YPz6nMdqrmflKQuxWmp2vI6+zzcSnUKtmpjWEhgBVHKj/4sRH9ZaICrTw/N0LQRLAuIkmWJQhS+BOb4UGQE9o20tqx8CVRBZr2kyJOYVc3nvC9u4UQd4nmnIWjBYfhqX6IO7e77RT9UiWShd20GCdqMHHWOmd7HqOV3aSGQ4vOUjRFN80pGcUe6hnq7C0F40LaY8zMTYK0NwM3HvB4HmFuz2DnD4WBibibLeYMezbQpY/Pzpqkm34rDfMR4P8piVqNwkZjUr9Ax9Mzb38m+1Vs+0kHyPHPpOWN/H/wujFvJ3FNnrs=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2019 07:00:39.0677
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d6db7db-9b33-402d-ae31-08d7424f3d1b
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9;Ip=[158.140.1.28];Helo=[sjmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR07MB6555
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-09-26_02:2019-09-25,2019-09-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check score=0
 priorityscore=1501 spamscore=0 bulkscore=0 mlxscore=0 adultscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 mlxlogscore=856 clxscore=1015 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-1908290000
 definitions=main-1909260069
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Patch fix issue in cdns3_ep0_feature_handle_device function.

The function usleep_range can't be used there because this function is
called with locks held and IRQs disabled in
cdns3_device_thread_irq_handler().

To resolve this issue patch replaces usleep_range with mdelay.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Pawel Laszczak <pawell@cadence.com>
Fixes: 7733f6c32e36 ("usb: cdns3: Add Cadence USB3 DRD Driver")
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

