Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 678484702B2
	for <lists+linux-usb@lfdr.de>; Fri, 10 Dec 2021 15:21:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242014AbhLJOYw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Dec 2021 09:24:52 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:44716 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242019AbhLJOYt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Dec 2021 09:24:49 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BAE8csc002178;
        Fri, 10 Dec 2021 14:20:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=yXU5GivaLBU/MsqdV/+T/5KBPiXmoLfC+stmdZK0lv4=;
 b=cVukCFlvEm3hAzRS6BvHKUrPxU+bJ9744X7xK+5mLFEjY4KTokzqkeUbW/CaZJuDp4sg
 wIjzUdQdtcJRzuKZnS+2A8luwxdzfOEAzlWyS2XgL66RVyV5RIP1PmvSPQIHTd7+7LQX
 4Qh911CCdupsKTzqpp91D0Zvz+EdSXY+4tK3hf1l0XASae0ymLeVyKgiC9/qiqFgY604
 3mUG0JqGRcQSd3uBHl+98AabEIJ9HXdtKhEQb6cECy1OYoOuChylkR8xIOtLjppc3svc
 jSIloTAlZEqO+Ec4fIo0+2gPgH5hZh/x8vOh3ZPHr2Hdh3O4mn5BUQhpG089D5rQdNRb tQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 3ctrj2xe7x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 10 Dec 2021 14:20:56 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BAEGHH4084482;
        Fri, 10 Dec 2021 14:20:55 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
        by aserp3020.oracle.com with ESMTP id 3cr059bkkb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 10 Dec 2021 14:20:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=klfXZLfgxDyj197qEZL/xENHvr9Gg8fUowTE1xoVyXJjp122xY68/e8BQwieWIIcTbTu62wP/9Q0dV7nbqsFeS+yYOP6pBUYREXlPs5ZULPeL2g1pVc3JT5wwRMbFe0q/MWrA7GZj9CTehQhhAG+AMJjAhRzoI7eT0c4BVzzn9QJVpbYla+Lk7AM7BqoMKS8WPAiP/8V4tEqGmiPDPLx9hlvmDfLIfkct8uqin5s+1Rd1gSfwhuGmF2VybTiEH6w1nVcI7OvyDek72iv/Pn5x2m+fu8afwFtLnWv9LJNBgNqpkJjTiCeJiGQda9E6hzafc+UaYA2ZcCxeasECdxIHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yXU5GivaLBU/MsqdV/+T/5KBPiXmoLfC+stmdZK0lv4=;
 b=fduS4wjbmOk+/DMX9kts3kwYIIMC5Qg3NS9kL9Y9B+jcnlBKYuC3acIN8Kbv0ZGvZFi69MeZ6/kD7BuTQ4OPReaEZrLsQux1RUb1HRHLjHF2PwkOJJoA6GazhYuH6I/9bqtk6FIF3V14PGXHTuVoh32xkQBv6ggxH2ZQC/QyRX90FdiUdRvJi0dle/xY/x1kG1ehbcRRwUT4JvDbHHiSfJIqjSbVOfPXNXUN/bG89P3Eo5r3qOvUx6obmKzlVTZt0urhB0klHegXHYItNf3l/bXlKxwoJRQ10ZCcRjeuOBIU1uf/+67uUjWR3pDfz9xsMlj5o4Bp9m+mXo9QbS2DAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yXU5GivaLBU/MsqdV/+T/5KBPiXmoLfC+stmdZK0lv4=;
 b=ypmBvZeR5EdLS69IdIp2vErJv3qRECzytC3N3T1YKEEcIX6i/XWCnQf/NBEqSVP5f+gyw6FxneyAY1ddE/zEEx6eM/nd2yrRbcwYGsijX6vf61fCn+a021SUrfsHdhFAVN29NlD9RBa7gokxe+qUOUIbEQ9HzlbatwKuwr01+M4=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR1001MB2366.namprd10.prod.outlook.com
 (2603:10b6:301:33::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.19; Fri, 10 Dec
 2021 14:20:53 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0%6]) with mapi id 15.20.4755.026; Fri, 10 Dec 2021
 14:20:53 +0000
Date:   Fri, 10 Dec 2021 17:20:28 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Andrew Lunn <andrew@lunn.ch>, Rajat Jain <rajatja@google.com>,
        Chris Chiu <chris.chiu@canonical.com>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] usb: hub: make wait_for_connected() take an int instead of a
 pointer to int
Message-ID: <20211210142028.GB18906@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: JNAP275CA0072.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::23)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (102.222.70.114) by JNAP275CA0072.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::23) with Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport; Fri, 10 Dec 2021 14:20:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c4f6770-4f86-406c-d54e-08d9bbe845fd
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2366:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1001MB23662BD429B941436EC276F78E719@MWHPR1001MB2366.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4bf86tOXppnemBxB1IfahrDjGOfAd8pzd3s97RcjbNhZIkt37p3LPmhGy3L+v2KFUAcbqYGjBo5++QKRcFCocLL37EDle3BnA6rp9bwDwDKBerjL39PqDft1kQW4danLr81PEwcYrrcc8KGWxqZl+tT3kffmZxVztags0C91jY2aCMg5xIApLe95Ds0t9hzWHr1o0n6nVDsvC4G3HxT6bolPbMQZx1Xj8l3GAJt49wClcMoy4IerxcqHCdXa8F6wpHS3JdJJnsDWUsUb+JqUH5B/eoxe0TTt26pKnjiowY00hstcc1fiCMkA12icjvQt6WLifMKBknAWShoEPMgvGrSVH+xjZk9XtB0CyRz4cuqrVvFySyJKWwhkUH7eyWYSr1aqzcXvzVpHxI0eUHQL8baDAUssNA6cadTyGm5rP4asa5LlGdUFlLmccvPvcJz/HPih4nqZLlF2U2qas/EakOyoBydDbhg3LB/cH2yJ7lqaXL7/ugOJP3Zy0W/CmX2bGl7n4JcPQ+/zYy+6N4poL/6zH+02ubWZMtAGoL9Kvv2d1BhhFByjtv3TjO2oow2p08O1T0jirwuTjHd1YlQCyZC9/9OZhnY3UXJQWLP6q/t4WrSQQjLHVEB6LtWiHB2WAEkcIiNLTC0BJzRP87xcTcuCM7tgC4cs/yjxPCizux2At08iKv5jhzjrNcs8aGTBynA2YaitR3JUvOy54DR4Dw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(1076003)(6666004)(6496006)(52116002)(508600001)(186003)(26005)(5660300002)(38350700002)(38100700002)(33716001)(54906003)(4326008)(8936002)(86362001)(66556008)(7416002)(66476007)(33656002)(66946007)(9686003)(316002)(8676002)(956004)(6916009)(83380400001)(55016003)(9576002)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QWzHKP9JnlHyJY4GbRgOaLTyYT4mHkmtlJHeC6sh84sFbb87Z4oWSay/13/m?=
 =?us-ascii?Q?X6mzMR25hmlo1JBRxx3ay0ijsQdHCGPLdY4DIjq55UQvlq4LiT29ZVp0zE53?=
 =?us-ascii?Q?zJML3pHMr07DBo9ThmN8bQLt+d8TUt5SOLJSnUF+EuFV4NTJMOXaXSNjBhzu?=
 =?us-ascii?Q?s+5R0AGprYNDUcsvHipbFkrrBoaTzeI3+BeovCu/CZdJhnHPLUmFC9YL3I07?=
 =?us-ascii?Q?2uX4eu1S/6o5NOP6pTieZwb1FO4f2SbUWFZt05YSTQIiGXVxMr7kgbLy6yhh?=
 =?us-ascii?Q?+8relSIpTeJgVx0ckP6nYIrh5TdrBwvR+3Vw2EZCLXeuSLr1o/D7Z5GrPl6f?=
 =?us-ascii?Q?sCWZxjvopA8IdfgbLt1rd8i/BGG7SC/rF7Y6soM8ZbppckohYIA47dACiemx?=
 =?us-ascii?Q?HEMRS6Y9jj1VIyqob0iPa4ptVA81NzbfgiOoG7JICPlKQziccjEo+M/GtgRC?=
 =?us-ascii?Q?56v8ViQYOE/12/fUGcfUY/RAoEeGNLYHiMhEmu1XK88IyPtz4EEIfD5kilVH?=
 =?us-ascii?Q?cOHCa2qZqmeYTm4o8usPnEH+ahkdpsEukq4mqiiIAqANZOIuyIDud2tLlz56?=
 =?us-ascii?Q?cRAJhAz18LU1hWzJRSZ6ReVBIo1ZaY0zMtLJYVJsSKSiYk7cCveL+sLeXU/7?=
 =?us-ascii?Q?8aTc4cUftVCq9c836X97xKAv+y+xTBN8n/dyWGylOaHyklRcak8eFSeYudLD?=
 =?us-ascii?Q?HnvIEdhTUbj/aKNuCNpbL3pzJT3KIhwSK8phTAO1IE6OkzKjB1NbLQHM1Qn8?=
 =?us-ascii?Q?B1RTy0pqzx5CQWK9ZnR/vqmIozUjPW0kLLPMR2I4clw2z2OdyT1RV3cyXhhJ?=
 =?us-ascii?Q?XSNhsUXKQCMBg2OdTGL0Uk6A3i+kI0SQqIE9z9HsELNfTPvlTy5imp2aaWia?=
 =?us-ascii?Q?6aE1Y68Y/yR0h4pwPe+BS6TB2G++FVK3GA9XUue14j5SvCmgzn2EYqFNY7U0?=
 =?us-ascii?Q?9i+xRspsd4GfWATu6+E0gsBsnD/ZXH/wvsBerEC8G2XkJBqbC/gQsIAINTgS?=
 =?us-ascii?Q?qQRk095Fxt0MWjhI5fAqCaG8QTh1Bin8OqDd3zpG42K5NweJY/zaI6oVeQKf?=
 =?us-ascii?Q?EMRijTl5jmQZaitlWoC0veSPPL2EadgiNSdOR88VUtORfGMc2jlq6xtdU3qa?=
 =?us-ascii?Q?9eSbZmuO8SXyatsCRTXl/2uLl/9QcT32Ir7X7Ws4scLcQaR4spZLtH/ZhfTB?=
 =?us-ascii?Q?2viFSO2NFkg/ld2AMIHwGUjAUN5jjMBP8hPUqZZ7Hg2Rf+mcdNAcGrsY4RPB?=
 =?us-ascii?Q?XodtlD3xVh/AgRJFHBTKR9o9qxXd1xQ4Kb07gINhRadkjzYbhqLREJOlHrMr?=
 =?us-ascii?Q?0ov/aAyfWRwGaJXJNuZU123RPdMlQ2ImKay2jVBdPt86+l+rfts12d7wzWmE?=
 =?us-ascii?Q?4wFh842yEswM+516R0whvflV0pFRucjx8yt39kNTE7V71/AePXtFJ2KCg7vU?=
 =?us-ascii?Q?6qUOSN1Zrjox5QeW7cfyd9kb08vmbVq3t1+7s8n59bkVQwB6psu7ovLlppBW?=
 =?us-ascii?Q?HlovXhSWApGhMjnJC8qRbAKeL0iPLRV1HSwL7hM7aPJu7AK5clzK5yrNaP7j?=
 =?us-ascii?Q?ng5VfEIVPrNgprquJDe7bjxtLNXJdN5mZDKLGINjQ2h7gOrm2MyiZiW3fvya?=
 =?us-ascii?Q?FJC8cKEBj3O1zDQrvQJJKoqNkWRRku+jDKgEBWQ5YyWHXYlWd4n9OaKnkP94?=
 =?us-ascii?Q?a49Z/6Q6zEHgH51WQ1PMbGW78K4=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c4f6770-4f86-406c-d54e-08d9bbe845fd
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 14:20:53.1765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: apOHXMHdNyODyoVpUScOhQSI83wylJFUrG9lHxxVFmhwZYjt3I4pUkF2QEuI9dMlDghBOYh6OdU3yD6Q6tzLsi2r3egEhjYUCVP62FxVSHw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2366
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10193 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 phishscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112100082
X-Proofpoint-ORIG-GUID: 8XA7vEeyoXijXMi6QraSQA-a-zqKJbFw
X-Proofpoint-GUID: 8XA7vEeyoXijXMi6QraSQA-a-zqKJbFw
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The wait_for_connected() function doesn't modify "*port1" and there is
no need to pass a pointer.  Just pass the int itself.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/usb/core/hub.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 00070a8a6507..0e1fdde88905 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -3570,7 +3570,7 @@ static int finish_port_resume(struct usb_device *udev)
  * This routine should only be called when persist is enabled.
  */
 static int wait_for_connected(struct usb_device *udev,
-		struct usb_hub *hub, int *port1,
+		struct usb_hub *hub, int port1,
 		u16 *portchange, u16 *portstatus)
 {
 	int status = 0, delay_ms = 0;
@@ -3584,7 +3584,7 @@ static int wait_for_connected(struct usb_device *udev,
 		}
 		msleep(20);
 		delay_ms += 20;
-		status = hub_port_status(hub, *port1, portstatus, portchange);
+		status = hub_port_status(hub, port1, portstatus, portchange);
 	}
 	dev_dbg(&udev->dev, "Waited %dms for CONNECT\n", delay_ms);
 	return status;
@@ -3690,7 +3690,7 @@ int usb_port_resume(struct usb_device *udev, pm_message_t msg)
 	}
 
 	if (udev->persist_enabled)
-		status = wait_for_connected(udev, hub, &port1, &portchange,
+		status = wait_for_connected(udev, hub, port1, &portchange,
 				&portstatus);
 
 	status = check_port_resume_type(udev,
-- 
2.20.1

