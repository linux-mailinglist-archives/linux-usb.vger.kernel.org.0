Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4D083D540E
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jul 2021 09:18:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232675AbhGZGhh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Jul 2021 02:37:37 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:64324 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232521AbhGZGhd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Jul 2021 02:37:33 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16Q7Hpok018394;
        Mon, 26 Jul 2021 07:18:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=ukx773Xqbv3J+WBab2SGrOdRLVZPYEic5tjBJce3CFw=;
 b=bl8EmWBOtFESp7/84/jUBR64TMS99y8M1IthkToiBZBDrFqQyeT+CwVgu32Tj5vFi9/3
 8Kb7GFpb6Km3w7OgBJLULvOjIKAGV9si4GR3gagRdbG9RwLndGLwmmFGyldMRdVT+9Au
 dm99KymaSpepLoxYxoQdgTpkPg1qlcy0XajeUV4ZC+ztiSpQyikIVDSs9Gf4j4lTaUWv
 vNYIkL4oo+2CeriRJpM3+eQq7YffH+KsOYa/VNNHUEOaJ0FaBRv+CWgzn1KC72SiHTDA
 2o0EUvEy1R8zrXPKIywu4ef8DtHj9hDQVyEDmssPrc81vagLMy0ABlyveyDCB797dbNF HA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=ukx773Xqbv3J+WBab2SGrOdRLVZPYEic5tjBJce3CFw=;
 b=aXLTdGM8NDxJBUne6Oz1icpgfl1XWPkEiFoiYVdGDTtE5LKv5JyblFAD11J3oNkVMmFa
 5siMc2kUtC0JFxmOcEeaVYcCjAm+BvaMec0LanrwS2FWPO3mM4oaKAfTF6LbFb2MPqaP
 fgs53MDjOyaEi8v/IPZ/Pft6582wIK9fqzD62GqOjFgvGKVaHHW8KMGWSL7hIwba2VCr
 r1heXmKkt9MkeIgcXwZVkw97fqeRsURPlPsSiaOqgDlDwCOH71IHrUF2O3+/+eC3rvS3
 1ab4PRchZzhcGdN11ynZ5lI26RBiVLcxyAor4XIlhAO3/91d8alf0glBovwuYkHm2Gg2 pA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 3a18nfrtsm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 26 Jul 2021 07:18:02 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16Q7EeP0001088;
        Mon, 26 Jul 2021 07:18:00 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176])
        by userp3020.oracle.com with ESMTP id 3a0vmsb79w-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 26 Jul 2021 07:18:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mD4xr+jXTQxYn6oDELlU6P12dfCqHdsarUI/S+JdWtbk7MMnOBJP9XsBjfqq1DwDslr+ZpED8mCJaBjsFwatKKOVONS6Eg4VHAWKxeeJNlL6lwfT7udEOIZ5IyYvyw56XxJ3lDtjMdsGEsajDJvQnKngLqoZn607+s9A5JDIGhxUMWKTwB8xg4DWBcrjK+ZAL0Vp3mSAVuPiwLWBLDqc68vATXJ5eKyCSMZyDAgtX/aEP6IjAsHPWastnNcOXjst0b4NHpWCBEbwZc6tX1X+yzpEwbFOw+XWbEOafRAmvLcYxEY8oJNogfBDvWZ0GBNYew+/gqdIrzU07Lf3E+9HTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ukx773Xqbv3J+WBab2SGrOdRLVZPYEic5tjBJce3CFw=;
 b=Zv6Gk0irf6GM6ZMeFsBP+s2G8pjWHt4QQhJQmhZZiyKo07rMShzB2EcngDTL1Ob2fobg5COIkto4CKmeiDSJR50fmlYoYT7PJjBBeUNv6a0syYS7AfAA+MCbHAwBwio8KnfLxjn/mayhYqJ5tQC/L4oh9j+GdaifPXXWqKe6fUftk8Hm2ak53oc7gmgsQCp/Vd1/vSQM3xnVIakSUD95TNzGNr8i0nefZ/qYWPLHcdFM3u6crHN0kH0+OCo0RInClNuv7iGSeS/OoB5EdBcRUTP0opG8CltvnZknwZW7qOveVx6GqYFypLtpe2Syl27JhYD9iSziNMycQ7ir32QDxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ukx773Xqbv3J+WBab2SGrOdRLVZPYEic5tjBJce3CFw=;
 b=0J5WmTcRD/tuJZgBy/p7NIgyizw+WFm8kZJ/Z2pQL9RFiKQGt8SJtXOhkAMBUKyOwGu7eP05PI6WYGrd7xCYCmjzOxuGxZldXSNxeB7+ABdCeAptdjTv9FWCEQjQXft6zT1+qjcLrC1g8IuO372uQ9eHRndaL+XTl45IH0Nqu5U=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1566.namprd10.prod.outlook.com
 (2603:10b6:300:27::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Mon, 26 Jul
 2021 07:17:58 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4352.031; Mon, 26 Jul 2021
 07:17:58 +0000
Date:   Mon, 26 Jul 2021 10:17:47 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     rui.silva@linaro.org
Cc:     linux-usb@vger.kernel.org
Subject: [bug report] usb: isp1760: move to regmap for register access
Message-ID: <20210726071747.GA8604@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0092.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::7) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kili (102.222.70.252) by ZR0P278CA0092.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:23::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26 via Frontend Transport; Mon, 26 Jul 2021 07:17:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03a6668f-1c9c-44a8-c4d7-08d950057ee5
X-MS-TrafficTypeDiagnostic: MWHPR10MB1566:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB156694D7D63AEF6EA5D546D78EE89@MWHPR10MB1566.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v5HrLBrwAu1SYOB3Vwk2ec4yxkdnQo27wMe4TLx4O9DKn0BeASDtJzOgCw3VsTgn1/XSlfieajJimx0+f27Gu92/E+yYTmvuIFeRegiTIav0CgBuCF0H7iGWJCVUFfpNF+sYUInr7OHrIeIsDIq31fuvgDeYLT0RRpyKFxy6V22JqPDmaDUJl2R4EpHGj8BHlqKJCVqwQ+8IwCQeKrgoHEd8siKTY8TAWh0Y9n+2HKPjkXZisdfLjBHkcCXVerCkQ90Cf70CpMdmWInyL/j4psD9m/WIaozY7es+tYBnPmGg0kk5h7mlBm/bhG6Rc93KmXEwMti1EMJvLN9toogKKsR0eimE/2mkRfspyeOd+yfLCD5w8AGDRmAL7ratN31qCt/lZ1xuN9/PT1M04IoT9vnEtwUSb+mqh3TTXPAzpUOnSxmdDmPOSQ5sIr9S7HU3D6/5mflrClkLGYfMcAPuw2/gD4dhbbd9uB2HbLsjbiUHI09N2PG06pm0j3X/7ikPl81oaM/pYvu3d5oibYrQWv3aDF5Mi5ZbQT56z5jTI3GtC6M3MnEZU+ZGbYsLD+Mte9UP8vVqwHv5aDUfXeZcVpj6kMr6T75DRv1wpBHa91aVmUnnuMhybWimMN+lDlF/aPnDa4E7f33Pdkm/plhPWhSABWKfeIQqE6Lrtbs3jJoog1c5wpsWnuQ7BC8Vj8f/aA8q7tSIBoDYHzLqyIssRQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(376002)(396003)(366004)(346002)(39860400002)(9576002)(316002)(8676002)(38100700002)(4744005)(6496006)(86362001)(8936002)(52116002)(1076003)(2906002)(83380400001)(956004)(478600001)(9686003)(6666004)(38350700002)(6916009)(26005)(4326008)(55016002)(66946007)(186003)(33656002)(44832011)(66556008)(33716001)(5660300002)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BDCVqcSp04gYdiSVrcG3t18z8rNWufYBWfoSSeRsCmBamQiKqE/e71XcLPoY?=
 =?us-ascii?Q?lznSYgFzDQvlQDsq7LRKGhbgd9Hl+cew1SnQiAB8vjEH8VZBYVdIDMHbBzIM?=
 =?us-ascii?Q?P9rGu6vRbMe+yS/tyAPhxeu+q5kSS+x+serhK4GdBU6dcldhaoWfVVB0OvAY?=
 =?us-ascii?Q?NftbrdWBB4WTvgwDLmyIVMZ/MGszhYVK3KW6/8QvWFiQEwL1IJjQixjUMDL0?=
 =?us-ascii?Q?VN47cufwsM1yLgWN8gA++x3LNdOHNckXqzoHAc73jcAeYpNZBTenZafgs34I?=
 =?us-ascii?Q?kxYZTTwj9g+LTv5vlaWs2aKp+ha+qUdXxNpOTUZOmWTnaJQBRf8Z84A++z2C?=
 =?us-ascii?Q?ThamHHOmbZvjl0eARGGJwQ+KAJ4+rIFZQv9XK5+bm3Whyz2etBxbsisaQNb0?=
 =?us-ascii?Q?Rc9TbrKc0dLhJzKp3alAO4VfoT4guv+/7rVtfj40DZ7oP1xR5q+2Sq5w47xd?=
 =?us-ascii?Q?s6HgIyqXP2Hu06l9n/wn9s7WhIVnbsN0vE1JDFWBcaihjfeS0SdrLQ3JTN+R?=
 =?us-ascii?Q?Jy+hZFKkuqQHjDfCvb6Z5tNfi1oMGkfF5ioUoB+frOI6/rASZiqVYcgVH2vS?=
 =?us-ascii?Q?AX2h0hliXOCtf57cHbEz8foOpEml+zjG5vEwCHvXbhNaJLDpTMvrB2zqJyF+?=
 =?us-ascii?Q?qEGKbXks2xd4anSaJZsoHdjlsNgqI+PrV21YVjRNVTESAAI3GGZEM7x4REtQ?=
 =?us-ascii?Q?kuktFQg49CNoTUAHEBbewZHy5KxBkXHvJ6zIyiGfAVu/h7AHO0n+auDMuBnd?=
 =?us-ascii?Q?1Bqufq7gOHuIS+h2NwM22vhhUD5JL0ckNnwAO2ejxfD+23cFdJVkVhbXvBjd?=
 =?us-ascii?Q?ToN8qsUdmquVRa/oSXqHi9Cwg4wJRC9iLFRsId2hxbbFIPQHXsOZFonlHtIs?=
 =?us-ascii?Q?61Cq6E0ypq8+SdNaAbE7OU6V9Jpinmp0+ibl9xJbE0PJGjThtMMKGuLWqekP?=
 =?us-ascii?Q?Lsg3o7/gK7WKSEsR9heL4v0ux/pmnO/y+giSZ0OJ45OKjJga7Yz9Rk9mvaht?=
 =?us-ascii?Q?GTvGB6VtC4mOACT6nYhRSicmmWG4fOWMamgwVRzON20Cgi7pAjwcZaYoNUyZ?=
 =?us-ascii?Q?mFII1gfxcEqssl7hMsqE3PRUkBkT50NkPZ0s50Vf/fBGxOSYR+vDHuaLt+tb?=
 =?us-ascii?Q?61/KLM/bZ9Q2BJ2RroPlAolKTAw1qQaSCO34OynEa/bCiKjmonc8xTe2NAlW?=
 =?us-ascii?Q?fw40GbLfZxYSlqL9SYmQjmD4dQg6mnEeAPWdc6Q6PHIiZS85r+4lP4o5v98P?=
 =?us-ascii?Q?5PD0pTUo4lbRXGD8v5E4lhmlWD64xH4j6XTSuOWPfpn6TojDzDYAyvU3T9Nh?=
 =?us-ascii?Q?9PeleyEUVBzwA5z6RY0FZ/yf?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03a6668f-1c9c-44a8-c4d7-08d950057ee5
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2021 07:17:58.4881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ydMgEdkn3xQROSimHR3XpFbHvIAROPGsSXu38WBd7hqx/ZOrMipVPbWpglMKbdAwaJiGd35gDW8v2TS2TNpxFn/F4GjDvIDDGzqQBnx/STc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1566
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10056 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 spamscore=0 mlxlogscore=978 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107260043
X-Proofpoint-GUID: icfhqpgVIfYbPlNaebPDHVRLgZ-JFIS9
X-Proofpoint-ORIG-GUID: icfhqpgVIfYbPlNaebPDHVRLgZ-JFIS9
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Rui Miguel Silva,

The patch 1da9e1c06873: "usb: isp1760: move to regmap for register
access" from May 13, 2021, leads to the following static checker
warning:

	drivers/usb/isp1760/isp1760-hcd.c:264 isp1760_hcd_set_and_wait_swap()
	warn: sleeping in atomic context

drivers/usb/isp1760/isp1760-hcd.c
    256 static int isp1760_hcd_set_and_wait_swap(struct usb_hcd *hcd, u32 field,
    257 					 u32 timeout_us)
    258 {
    259 	struct isp1760_hcd *priv = hcd_to_priv(hcd);
    260 	u32 val;
    261 
    262 	isp1760_hcd_set(hcd, field);
    263 
--> 264 	return regmap_field_read_poll_timeout(priv->fields[field], val,
    265 					      !val, 10, timeout_us);
                                                            ^^
This used to call something else but it was still a sleep function.

The call tree is:
  --> isp1760_stop() <-- takes a spinlock
      --> ehci_reset()
          --> isp1760_hcd_set_and_wait_swap()

    266 }

regards,
dan carpenter
