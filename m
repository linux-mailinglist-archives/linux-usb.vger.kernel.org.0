Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27DD43D3102
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jul 2021 02:45:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232933AbhGWAEY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Jul 2021 20:04:24 -0400
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238]:39928 "EHLO
        mx0b-0064b401.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233072AbhGWADa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Jul 2021 20:03:30 -0400
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
        by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16N00s3v012359;
        Fri, 23 Jul 2021 00:43:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=OSiy94WP2XfmfRE7YIPlDS4aWFzqv7QDmK6zhpfWNyQ=;
 b=ko1pupbl3wI48shNWJO2ueA/I9RKGTfkEwTGIlFaO0C57lOEj4Jja3qBeusLnFk3t5Bo
 08H6WjmuT4y/I4s7ilqynxR/P3ebJy1XeVpVqEC0zE+nBPaE5ykyg370SG3VDBN0xtS1
 mv/qvqK0GuBXS3ojea1QP6HJb6prmbaWLeYv2oYm+BczOZshMGdsuo4JB0OTQhApV56g
 tz2xifFhjAZWthz5ZlcH8NgKxtmyTPkhE8FukoajeFKZJ/M1eqXbrhGIOS2IQGLz+X7D
 P67pw3fVFvdI3PO3St2gwRUwOcT3bKHJ0i6CKGGVhBQvx6H79uwccFLC5cnixTPmwFZj sQ== 
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam07lp2049.outbound.protection.outlook.com [104.47.56.49])
        by mx0a-0064b401.pphosted.com with ESMTP id 39y84kgjpv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 23 Jul 2021 00:43:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XFWk7KwjmGkQoP1LeRQV3JA0gepJlkuIYRcwbBDH8R3m/junWV1Qt87F6oT+AXW4UUAChercr9GGeEcfe+BsBsp7ub0hiKKsrhA1ulSEpKUAqykbLf2dAQ+4q9BgYOug5ud+MDmtCXE6VrndGB+DWE10OwNmNqgfQ+w0XP+ssUsQIiDix4VrLwf4XVE3P2Ax98g8VQ+AarBecskYmcKcokzAvSheV9BF6yXfzuzb7j0a0P8z+9+2V6soT6BKqfS6+MMy6U3qK+A0/vrbp8VDZLI/O9EbCEKw4FtwxEsRg1f7K3gndM2y9LgypjBeoom9lcOPE1A/aYaQHmw9CSkbIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OSiy94WP2XfmfRE7YIPlDS4aWFzqv7QDmK6zhpfWNyQ=;
 b=dMNf8QUhOSgegx/wLpA9dvhXlpnu/uogecij2uOjI8Yt18CVzesC/LgIaZZ6yNrwrfrpxn0Lw+GrIVhB8GtEK5tqTLWB2/fZ9GtEXQeNlJfTfOwauXv9rM2xFXszKlfEnagjpl7+469P97PRVtGO0pinaI3geQvByHxtpL69XO+nNV3jVXXX6fmxge810BRIWD+PetknWvTSBOgeR6yu/kYicQPT9WMR/Ldrn36AWT6l87yHMVUzaAcRG/vXITKVpO4f870SrP+VSBnG5OdMbexfvT0O0n/XqccJZPT6fQunttQDLLC+oD2MlegbborfUfyBW/n+o6HUcGtbhW8V1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: rohde-schwarz.com; dkim=none (message not signed)
 header.d=none;rohde-schwarz.com; dmarc=none action=none
 header.from=windriver.com;
Received: from BL1PR11MB5478.namprd11.prod.outlook.com (2603:10b6:208:31d::12)
 by BL0PR11MB3377.namprd11.prod.outlook.com (2603:10b6:208:66::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Fri, 23 Jul
 2021 00:43:50 +0000
Received: from BL1PR11MB5478.namprd11.prod.outlook.com
 ([fe80::a140:b563:8725:5c2b]) by BL1PR11MB5478.namprd11.prod.outlook.com
 ([fe80::a140:b563:8725:5c2b%8]) with mapi id 15.20.4352.028; Fri, 23 Jul 2021
 00:43:50 +0000
From:   qiang.zhang@windriver.com
To:     guido.kiener@rohde-schwarz.com, stern@rowland.harvard.edu,
        gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH v2] USB: usbtmc: Fix RCU stall warning
Date:   Fri, 23 Jul 2021 08:43:34 +0800
Message-Id: <20210723004334.458930-1-qiang.zhang@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HKAPR03CA0028.apcprd03.prod.outlook.com
 (2603:1096:203:c9::15) To BL1PR11MB5478.namprd11.prod.outlook.com
 (2603:10b6:208:31d::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-qzhang2-l1.corp.ad.wrs.com (240e:305:7883:5533:845:1f96:2bde:f4c5) by HKAPR03CA0028.apcprd03.prod.outlook.com (2603:1096:203:c9::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.7 via Frontend Transport; Fri, 23 Jul 2021 00:43:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 46f9a0ed-661f-4a8d-f545-08d94d72f050
X-MS-TrafficTypeDiagnostic: BL0PR11MB3377:
X-Microsoft-Antispam-PRVS: <BL0PR11MB33774D0A7EE3CD88A57C9657FFE59@BL0PR11MB3377.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PtlWicCeNS4cd9LGiO/f+6QLyfapaS+xR7jQ5dW4Y//Sm8nTqQMmhmkmurFMC75cUQdymqX+jpWUGQDw/pklZIxCCAUcqEa9L3v5dMHFTL+vHapLxITvd7i2ieTGdCBdJOpuxBKBF3BHl3EZG/0IQPZzko+kCAm1uMA2Ge+xAz0ZwpG44SixuH6dAYeRhdXZZHrY/SWBl27vmFZc9dbhEGYlG2eeeSE3CHtWit9uEW3L4KLT1lMitfeYQNJSJmwU5ENX5GFl2xYSLsxX6zoJZtgfBJuUwxCUBeSHNVXqqVpKz3ganCDHQrCqoECyZHcj7euvw8jcvLTGlnIRPT0Wq4p2RVMJB80YSclIdXNqBJA0pylhdgsjuOdvP5aWp811TUHCLSigXVPsSK73UozPvtW0O9H3gjK57mp0dQAx6Gjct5odanq0vb+uS5MPv6+oXYRHN00fMxWVLWgYiSDq4GV5DIQRc8y9v4WcgT5DhuneDou83dtuWX90lD2ljAGoljRFfGH2bGXxD+GNAERN/52JqDHiDy1Q5EcLHleF6KzTwQ1aYq1deVV4HY7XcGSoCSQUe4iOQPUp27BAqgSgiB2ccrkEgrD1ES/1fW6EBjdBGt+qloi4pfaDMjmmGOMqp0OfjTCXvrPswOTAXJT7NQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5478.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(86362001)(186003)(316002)(66556008)(66476007)(38100700002)(83380400001)(6512007)(6486002)(9686003)(6666004)(36756003)(6506007)(1076003)(52116002)(8936002)(4326008)(2616005)(508600001)(66946007)(8676002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?C/q2dv3snajIvdGTNZ3poXmg9idalPZ/oHCNbQrfAlwGAdF0kyAuMXqW+Mh1?=
 =?us-ascii?Q?Nxbm5rmw9vrJSwMvfkxCJLMX3x8raQQUXVX5PS6uelOA15OQxOqcup027O4T?=
 =?us-ascii?Q?rs3qvJwnR8e++eIOwyvdf+qOe3fpNFVPone3Ly9fmuaYv/vl3Ag+x14KgQcr?=
 =?us-ascii?Q?o7FFhmeJrqgZV0pCZl9L/DItjk//xMhpc2JeXekt6cJIn5AZ4YKlgAvlaNDV?=
 =?us-ascii?Q?h2yEKS7JVaHNhMjMX4FYdpM668sj/K5QLGlLQhwrIVns5XRz2aIIevzxt4gz?=
 =?us-ascii?Q?J7J3Q+ZBViOidWSysSmobnDLRnHJ0zI7bEj2YDj2+r1Kks2tK+FIHrof47N0?=
 =?us-ascii?Q?NeA+kX6MpiVKY13BD2xCeblgvqcSFqsn9/9n6cSh4hIjiLgJPdVWzhMOUfbF?=
 =?us-ascii?Q?o24PAhXARWILrpWzZtCoyKACmZwZ8nvtt8SgiwiHTFW5uz7is2nkbOyz/S9O?=
 =?us-ascii?Q?Fg4V745S5JqDc6McUmHM7E+8jupJaFgXQLxOw6SLEuNmPRIweAHkwo6NguWC?=
 =?us-ascii?Q?fw1k8l9nuZDwnWyppOQbyVJK7KsYvvTpBt/+d3qjRo665brnZGSYixgP3iDG?=
 =?us-ascii?Q?h4tP2Sjj6klyQFERoWE141HwvZ7QMFL6vyJDvpp2lsebx6QuQi+uWpEYsh3D?=
 =?us-ascii?Q?447/QtDdmyjX67sYWRhXfPHF2FBQoZu/PO75F7RR36zN2QNHUUWLi5iR9wrw?=
 =?us-ascii?Q?pTh/dQgpqoWmny8jTTYx1Qg99tEcjycTjgFrTH6sEh0b6lbeRZt1gELy/35+?=
 =?us-ascii?Q?cj6pRfTXG2RqZiNYNqsrnXks+C1YmuXXCjNZTysJE+7pyJLUZ0bBEYcMhUxg?=
 =?us-ascii?Q?Uw4a1L25IT4U2CxcmnGovtosEsh6JHcPj8lkdbm43v5Cja6EEkaOqOeaIrEc?=
 =?us-ascii?Q?VvJdU7fGaxLIGQkc6XxPKToCFh+EmsM3h2OrCE4kOu3UfMJTh/2wSwvLur1b?=
 =?us-ascii?Q?9WzUSbuZt9oJEx3UhTbtdWCWKHJb8+y9pqih42/LqwwXnEmn+dPDAUeWtCxd?=
 =?us-ascii?Q?rzc+YdVV4IewsFQBX4YwO2XW/+7MS93ESNHieABxbYd6ZK7H7SCFKGaCXYur?=
 =?us-ascii?Q?sw3iZ6DabPDKeYoKeg6fOdOZWc/tp6a1lUyMLhWY6nosGY7CDf5QgErj2hcK?=
 =?us-ascii?Q?t+IdJXPogjMdJ1EGV4P5FZ1QNF6EVwdZqFwV6lhDdU27dBtWtzZtqIE6XYvr?=
 =?us-ascii?Q?K5HVEtpFYeiS7CXLe6BfPQmjldTsEbMXQgqD1lyN4RRpQU6sB+TSlH9bvMYi?=
 =?us-ascii?Q?3xLv8nFCc7DjgyHU5kYC5J3hFyJKGwKILk8W8Pskfr8DkKmHo7TOZU3cZgPy?=
 =?us-ascii?Q?b5sKhyJjeJ13N2mwZb+8g2BGXRN6WlfXWS3VhvNXO4PNDBpBOIoc2j/fsUze?=
 =?us-ascii?Q?5YkXxaV7c/scHlbgCxh+iRww5ymr?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46f9a0ed-661f-4a8d-f545-08d94d72f050
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5478.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2021 00:43:50.6568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I7q83OUIPOkdpG6R9+zxULIjzGC+UInm41lvwmC+IgwYNALFhT7/DVsDoX0rmzqYcZgBF1brUIBbOW8vxLAUi3hCfnmeokKW/cVSAnEJAQw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3377
X-Proofpoint-ORIG-GUID: OYBz7PWXYV-TSmf3tMIGT5gDtRHbDUgm
X-Proofpoint-GUID: OYBz7PWXYV-TSmf3tMIGT5gDtRHbDUgm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-07-22_16,2021-07-22_03,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 mlxscore=0 clxscore=1015 adultscore=0
 impostorscore=0 mlxlogscore=999 spamscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107230002
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Qiang.zhang <qiang.zhang@windriver.com>

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
...........
usbtmc 3-1:0.0: unknown status received: -71
usbtmc 3-1:0.0: unknown status received: -71
usbtmc 3-1:0.0: unknown status received: -71
usbtmc 3-1:0.0: unknown status received: -71
usbtmc 3-1:0.0: unknown status received: -71
usbtmc 3-1:0.0: unknown status received: -71
usbtmc 3-1:0.0: unknown status received: -71
usbtmc 3-1:0.0: unknown status received: -71
usbtmc 3-1:0.0: usb_submit_urb failed: -19

The function usbtmc_interrupt() resubmits urbs when the error status
of an urb is -EPROTO. In systems using the dummy_hcd usb controller
this can result in endless interrupt loops when the usbtmc device is
disconnected from the host system.

Since host controller drivers already try to recover from transmission
errors, there is no need to resubmit the urb or try other solutions
to repair the error situation.

In case of errors the INT pipe just stops to wait for further packets.

Fixes: dbf3e7f654c0 ("Implement an ioctl to support the USMTMC-USB488 READ_STATUS_BYTE operation")
Cc: stable@vger.kernel.org
Reported-by: syzbot+e2eae5639e7203360018@syzkaller.appspotmail.com
Signed-off-by: Qiang.zhang <qiang.zhang@windriver.com>
---
 v1->v2:
 Add fixes and stable tags, modify description information.  

 drivers/usb/class/usbtmc.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/usb/class/usbtmc.c b/drivers/usb/class/usbtmc.c
index 74d5a9c5238a..73f419adce61 100644
--- a/drivers/usb/class/usbtmc.c
+++ b/drivers/usb/class/usbtmc.c
@@ -2324,17 +2324,10 @@ static void usbtmc_interrupt(struct urb *urb)
 		dev_err(dev, "overflow with length %d, actual length is %d\n",
 			data->iin_wMaxPacketSize, urb->actual_length);
 		fallthrough;
-	case -ECONNRESET:
-	case -ENOENT:
-	case -ESHUTDOWN:
-	case -EILSEQ:
-	case -ETIME:
-	case -EPIPE:
+	default:
 		/* urb terminated, clean up */
 		dev_dbg(dev, "urb terminated, status: %d\n", status);
 		return;
-	default:
-		dev_err(dev, "unknown status received: %d\n", status);
 	}
 exit:
 	rv = usb_submit_urb(urb, GFP_ATOMIC);
-- 
2.25.1

