Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FEF23B6D03
	for <lists+linux-usb@lfdr.de>; Tue, 29 Jun 2021 05:33:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231805AbhF2Dfx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Jun 2021 23:35:53 -0400
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238]:51378 "EHLO
        mx0a-0064b401.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231598AbhF2Dfw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Jun 2021 23:35:52 -0400
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
        by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15T3WtOJ005961;
        Mon, 28 Jun 2021 20:32:55 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
        by mx0a-0064b401.pphosted.com with ESMTP id 39fkpr8bqx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 28 Jun 2021 20:32:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PHhNwLr/6AfqTbI1AOJUqoBvF5PfI+lt5JuMqbJwVAkzbIVhrDQzyqK2F303wir8htCvtOAQwK2dgW14WvT3lo1OlwCLyjiG/f1KuItxyDiUNomWKl5XJLT5AXVnbY6Mk658zMKne92/4puBM1CbwEMTFGQxaGk9OvF7o3Og6qyee0jm3j1jYtCknvU8m2oXR0kyca9paCi0NR1a9ds+E+E+hUuR4vOu/zPb2eSoMiIiNbYYh3l5Pp5HJLAH1e58lpRfEyUGd055ls5+vYr0TxL1T8QOCyQnDryGnjlxcKByPiI+C7cpQ2nrJwvCTkBdC8lBtt6sCJFBVzB8YLzSfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b3LP1fiHfcR2ARBU7CWEMrJHDg0TNLlPKUTboxVvC5I=;
 b=gAqvJa+win1GuJN+F3lpYO4g/M0/m6/Gc+WEmvFysD0H7y7cnfuGWMgI1lNP/fbxgdz5d5R1/yYssyJ/McMs+Vp3MNRRP6TQ9ZllulLWCK3XUa+0nMAL78cfnH4h4bukamNkYABlMMl+hzXDe9yaOqVEGqaTZkBrN7dXfcq+G3CdhG/DrtevCk/XBn1xchutUHlu1myw+AWqd2M4qn0QfKjWSw9RVuL2U8X7A/rivIg+P5lwzyV0AyQ1/HujVBHO55PMArynox+1NTnInAyTnjVbpAjKvKJc6BUqMIMdqLEahui/YzcO8omb9O+cJFFCVTMNvfSgkYC4UW9H1wxRRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b3LP1fiHfcR2ARBU7CWEMrJHDg0TNLlPKUTboxVvC5I=;
 b=Gnk0We0eRacS8r1SESDAV0dy0rKpQN0skmDStqnfk+OwrfdafQ47VvZVs78nOfQHsLIaFoZzrXszHy8MwSgOkCkFCWVK90tVhk0UELK6ubgIWPt+QJtScdtXHW0LEpVJDihlYg55ozLt6lloLPT2DOeTtLqZBC9NJAkG9eV0d80=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BL1PR11MB5478.namprd11.prod.outlook.com (2603:10b6:208:31d::12)
 by MN2PR11MB4448.namprd11.prod.outlook.com (2603:10b6:208:193::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Tue, 29 Jun
 2021 03:32:52 +0000
Received: from BL1PR11MB5478.namprd11.prod.outlook.com
 ([fe80::9967:5190:1cd4:bb93]) by BL1PR11MB5478.namprd11.prod.outlook.com
 ([fe80::9967:5190:1cd4:bb93%6]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 03:32:52 +0000
From:   qiang.zhang@windriver.com
To:     gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        dvyukov@google.com
Cc:     paulmck@kernel.org, dpenkler@gmail.com,
        guido.kiener@rohde-schwarz.com, linux-usb@vger.kernel.org
Subject: [PATCH] USB: usbtmc: Fix RCU stall warning
Date:   Tue, 29 Jun 2021 11:32:36 +0800
Message-Id: <20210629033236.7107-1-qiang.zhang@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR03CA0059.apcprd03.prod.outlook.com
 (2603:1096:202:17::29) To BL1PR11MB5478.namprd11.prod.outlook.com
 (2603:10b6:208:31d::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-qzhang2-d1.wrs.com (60.247.85.82) by HK2PR03CA0059.apcprd03.prod.outlook.com (2603:1096:202:17::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.8 via Frontend Transport; Tue, 29 Jun 2021 03:32:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 953aa2e7-91b0-4eed-4ddf-08d93aae93a2
X-MS-TrafficTypeDiagnostic: MN2PR11MB4448:
X-Microsoft-Antispam-PRVS: <MN2PR11MB44480B5D5E65F19CB818126BFF029@MN2PR11MB4448.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3LCtU37QhpDgzeoyQ6wmC63wBcAfIiOZCsq4GLFCBvg083g49KLotO3ZWu9a3/F4lDV4XUuR+QapSQVdJOCXvcUaBW+FKEm68kjp5RglErh58meUm9lV3IMryy5S5U3dE6Cxj7so0SYjfi1xjv1Ip1rLSPVOmvMS68sKbPzaFKyxqpy/q7b4UJVdqSudaUoANdtQKvW17oaM+p1eaad++zU8O0vNxAoGNSqeS/LmDS8/ninzssfWiJgS3Wdk6pzTe1GKII+OpzTNL1ltEKCY63+n28/Uq6/00TSRiE9g/+0lIIIxb4n0yeHFB+UXwJNfxZ7MNLMrVsu6qBhX/+7fo402HXyXdj2jGu/mPvEf/K0Y5Ylvl7y5eBgFoyPGkWrRMKgdvhffXL4nSTZ3G80SdEzAGgbq+slma/ruXxVL6mXq4M1pJFcW3MoiDZ9wXuYVufa/qewBxfnTzqziL/ITQ6JcD7R6mG8P+H78F5b4ng1c514X70fQ5fDh1zrY+3OkM32wz6/1m0NyZrft3+VbWLV8lJoMQDfenAhMNol3mH1/xxAhkCHiqAXiXBNXn5xxCo+g81NWnsVluxU8FvN2ohjLR8uBKZB22/8C5eDDSYA2lzQlTHVvApk3VRRujRT/1zKPwo4zy3WAGQ2lZM6Pog//wUvykY4CdWSb8KYcXHdhZpS6GYFaAI11Rvq2Jw3K1EYAhMtcZlZe33kU6aQ9bA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5478.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(346002)(39850400004)(396003)(1076003)(8676002)(16526019)(8936002)(478600001)(186003)(2616005)(6666004)(4326008)(9686003)(38350700002)(38100700002)(956004)(6512007)(6486002)(5660300002)(2906002)(36756003)(316002)(66556008)(86362001)(66946007)(6506007)(52116002)(26005)(83380400001)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bbGs2jWjoN8qNe184O9UkV1laToZaofFPbvqhosu+8xeXrZzHWuhPagFSQut?=
 =?us-ascii?Q?SEpg/udlTrgWBKY5/kWNUBxRS/GmQ9HEwjGoSTRdf0++fVIxC/R2gqv5Roj1?=
 =?us-ascii?Q?5Ws2hKazh9e1bShwyKBVUjCZcqoWo1Lkpz25mYEK2PPu+i3MHq6Vlkwcico4?=
 =?us-ascii?Q?QronZL+qI5rWEGeySwPgHSSfBIn9iJC17OE0X6olqypt1KxqBjVktIYrc7n5?=
 =?us-ascii?Q?HjpbsqnV5oJ2FUQhSW+r/L/61kmDvIntEhpnOnBIH7fEdahUFUdjQ+Yt/zN2?=
 =?us-ascii?Q?hfDzTzDFZtyEP6yC7Ojq1hD0xR/MTyq8/d+PA82/NEqciOV5i7IXnq74BGUU?=
 =?us-ascii?Q?euhi6wOZfRuPClqnGYlB3Z57zEE/w5U9RVayXZNtkABNCTkMwy000LuhaHjc?=
 =?us-ascii?Q?NG6SvAsPGPHVE/mNfYIsP6VDFerf033YKKQn+I64x7IoGXoe6EuGCwFw24fk?=
 =?us-ascii?Q?R8INHS2xAG2UDGcEaI40s9ZwAzzX33wvTb/FbQF+dwCdupUB3AEDRr4VEFm0?=
 =?us-ascii?Q?8F/2R/g4mibSkLZrC++bvstVVSqFYdqx5vNeyKs1Fy3JhmDzoAnq4p2YDtWq?=
 =?us-ascii?Q?O0Rbal4Ba3zNxcy1nS+aXyEyWk0uMGWN6DnoKHpH8P9ex3SUa3XXGaBJPDSN?=
 =?us-ascii?Q?/HuomKRSkDirpWkN5gjs8uX8AgXHG/iqnqs4clO5UOBsAfke6Vp3Ii5aGlLW?=
 =?us-ascii?Q?tdw5lI0lF6tfoe2o+Dxk/tAg24wcB+H4/x0EsP4eSBEcYHK8S/Tah5pOkA1V?=
 =?us-ascii?Q?gF9sBzYC2Kv0FwBLm2uoVG1bVsyYmvA0kauYioV73N51TAEsfcdByCDDDG2m?=
 =?us-ascii?Q?k+xeWPNE58ilRIhDB0eJERDDyrG14fmftm4Bl9/SdIva3HqnHYKHf9+Dk6Va?=
 =?us-ascii?Q?mHZHghSgKbkN1yUQ6vu2MsYUmo6mW7xkfTD0Euut9jO74pn63x1zLxgYrU50?=
 =?us-ascii?Q?QEaSxOTlh1wHmVgPErrxb0Jxn7AyLJEIZaSV+HggV1Etm6ShBm0eUQwWr2tW?=
 =?us-ascii?Q?7g/YkeAUqqnt/Ms806OAZY4POH7S4MRlV42un5PKiyqaPiW/+Y6/MjyIF3Yy?=
 =?us-ascii?Q?5sqGEkksEt7UBr5HPn/POF+0bIKxzbXUl82gAnaj/S7oIjY3FBGWP//3ZAd1?=
 =?us-ascii?Q?HCMGC0aL6hpTGhyDC3wZlCU7c17qPLnkPZnUWCYgG9NDmpe7WvwIz2J/8CWi?=
 =?us-ascii?Q?kBoG1ldBI7BS7ZSYyz/pPOnCATABQMeKmnUDxam/pfx0Hej9EdtlMzTrLDyo?=
 =?us-ascii?Q?uJFo33DyaubwscXt6jaKSgPu60tQClRJ9NiF3cN2jU1vATQVC1qVu2nze2Hg?=
 =?us-ascii?Q?W4MS997I+1Ib/iWdSwgwFnHO?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 953aa2e7-91b0-4eed-4ddf-08d93aae93a2
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5478.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 03:32:52.6916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Veh/nZZNDR3I8iC5n7k7LsZVvSkHwQqiRfMXhUqifSsmBhA5XIkiCYUCeXrgqxpVeQoVyneIJwzVYGRxczeSPAMdLK7SztodVGUMyr9I/UQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4448
X-Proofpoint-GUID: Q5RNQkMMtI659mTqmgAqDBD6M5H_cYH8
X-Proofpoint-ORIG-GUID: Q5RNQkMMtI659mTqmgAqDBD6M5H_cYH8
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-28_14:2021-06-25,2021-06-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 impostorscore=0
 malwarescore=0 mlxlogscore=838 mlxscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106290023
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Zqiang <qiang.zhang@windriver.com>

rcu: INFO: rcu_preempt self-detected stall on CPU
rcu:    1-...!: (2 ticks this GP) idle=d92/1/0x4000000000000000
        softirq=25390/25392 fqs=3
        (t=12164 jiffies g=31645 q=43226)
rcu: rcu_preempt kthread starved for 12162 jiffies! g31645 f0x0
     RCU_GP_WAIT_FQS(5) ->state=0x0 ->cpu=0
rcu:    Unless rcu_preempt kthread gets sufficient CPU time,
        OOM is now expected behavior.
rcu: RCU grace-period kthread stack dump:
task:rcu_preempt     state:R  running task

In the case of system use dummy_hcd as usb controller, when the
usbtmc devices is disconnected, in usbtmc_interrupt(), if the urb
status is unknown, the urb will be resubmit, the urb may be insert
to dum_hcd->urbp_list again, this will cause the dummy_timer() not
to exit for a long time, beacause the dummy_timer() be called in
softirq and local_bh is disable, this not only causes the RCU reading
critical area to consume too much time but also makes the tasks in
the current CPU runq not run in time, and that triggered RCU stall.

return directly when find the urb status is not zero to fix it.

Reported-by: syzbot+e2eae5639e7203360018@syzkaller.appspotmail.com
Signed-off-by: Zqiang <qiang.zhang@windriver.com>
---
 drivers/usb/class/usbtmc.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/class/usbtmc.c b/drivers/usb/class/usbtmc.c
index 74d5a9c5238a..c4e1a88fff78 100644
--- a/drivers/usb/class/usbtmc.c
+++ b/drivers/usb/class/usbtmc.c
@@ -2324,17 +2324,9 @@ static void usbtmc_interrupt(struct urb *urb)
 		dev_err(dev, "overflow with length %d, actual length is %d\n",
 			data->iin_wMaxPacketSize, urb->actual_length);
 		fallthrough;
-	case -ECONNRESET:
-	case -ENOENT:
-	case -ESHUTDOWN:
-	case -EILSEQ:
-	case -ETIME:
-	case -EPIPE:
-		/* urb terminated, clean up */
-		dev_dbg(dev, "urb terminated, status: %d\n", status);
-		return;
 	default:
-		dev_err(dev, "unknown status received: %d\n", status);
+		dev_err(dev, "error status received: %d\n", status);
+		return;
 	}
 exit:
 	rv = usb_submit_urb(urb, GFP_ATOMIC);
-- 
2.17.1

