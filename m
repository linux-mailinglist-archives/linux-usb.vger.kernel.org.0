Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E09D5FEBBF
	for <lists+linux-usb@lfdr.de>; Fri, 14 Oct 2022 11:36:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229786AbiJNJga (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Oct 2022 05:36:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229994AbiJNJg3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 14 Oct 2022 05:36:29 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F99C18541E
        for <linux-usb@vger.kernel.org>; Fri, 14 Oct 2022 02:36:28 -0700 (PDT)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29E81Vxb002936;
        Fri, 14 Oct 2022 09:36:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=RdZj890NWVH6uvz5gn/p8R42j1NxSb3hL7b2bE1uY7o=;
 b=nidLGk/yp82iunY8vhqK/+Shn5SBOUDaFg1MNQ5BthLffXny3/EeRnTgN7p86dfU4+xQ
 eAjX3bZzxdIubRkS9iU1FZsXU7JtP7NkBSVvXlcPjOGzYW3JLi/xJsX9gImkHq/tcL7z
 YPmEkBTAvrXz7CBWTyGr13iAOm28VdOGiU7SMp5lGYSuM8lOenNnXoYXz+KI3VnCrpqz
 XaSC+woNnGhQ/BLSdcRY3H7Qxi1EebV1MtPg8ygoMf1FYaBVCIIVHITzYTbevn49Y7kF
 YOZLtf/35Y3Uqyqe96a7eNk+1Gt7gc4GA2oa7eakkg3XNxW50whjfAB6G3k6ZwhMmWfU jg== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3k6qw7hmtd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 14 Oct 2022 09:36:27 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 29E8F6FG003974;
        Fri, 14 Oct 2022 09:36:26 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1anam02lp2046.outbound.protection.outlook.com [104.47.57.46])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3k2ynddr6q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 14 Oct 2022 09:36:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NMbDg4Ay8Eok+x9ROhRwdxaFpkBenv25gJ/up+enNXrB7A2RNc4OyfIea72uq4lDSrM8wgfgf63Rcuc+YqenZwAMZQXBHAOOMLC65RgvG9yu9pA4zGlnkg2RB6ypYl+JrcjRtsLnoocbHDqpoBqmpBJ6QLmx3tGtl7y+UEwxA6M13ouH7mDKzjT6QWITErY2i+RZVtqRFd4x3JwbPYxgOdRonabW4exWPtkJ+cqjtomB1tYjCBbYSNlEcM88inzBS8tsl2HjLSYceN4gZzWVtXIH2etHW4XX2pVCQL2K2EV7wcT0sH17U4fQHDcXcseAbK5hhRQ0pRQcQpmPwNfrfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RdZj890NWVH6uvz5gn/p8R42j1NxSb3hL7b2bE1uY7o=;
 b=iMjjkD2SqUp2nmPtAgi66qc3VyOxqfAzfFnvN81uXR/ybiGDTL5OQj1HAh3EDOkzGXlFkBVjpBY087ZuJpkmQFJSaPShKxvP260MygTW8p08FyKoJI3DQJiIHSWLdRqev66DgyDNvb9jCOf1Oucp7fMIFSAOsm+vprmTIDzyFHXtHpsH4lz7ATQVg9QzcPq3Fxe70FVPC6GqEUJkv9ZdmzzV4nKwbA1Im+iXPq8/KK0tMOIwfCtVe5cBdwP2z8O68MGLcjlwksn+fSPai3sGGAAVoRU/rTeozO2xEqHvT3ZaT1frSoAg+bSQ1pGc9SyUMeQAihidkMB6ruG6XRbBCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RdZj890NWVH6uvz5gn/p8R42j1NxSb3hL7b2bE1uY7o=;
 b=UvW+CM/m1codo5WaC5BumFUWcOp3EY3TG2+elDjkOfequgRMwp8hsQlIjV+Orihful8pSC71oGcQTg1bL+hqcA8DQSVSqF6TOcNuyhTvLhStQf54fXpo4pbQrUbQugnxmUAr+OfDM0HGf1nKP7WBKpfNnnlG2ehLuTJWTm+5p4w=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Fri, 14 Oct
 2022 09:36:23 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::1b8e:540e:10f0:9aec]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::1b8e:540e:10f0:9aec%4]) with mapi id 15.20.5676.031; Fri, 14 Oct 2022
 09:36:23 +0000
Date:   Fri, 14 Oct 2022 12:36:16 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     andriy.shevchenko@linux.intel.com
Cc:     linux-usb@vger.kernel.org
Subject: [bug report] usb: dwc3: drd: Defer probe if extcon device is not
 found
Message-ID: <Y0ktkKfTgISmLogV@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: LO4P123CA0269.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::22) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2365:EE_|CO1PR10MB4531:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bb27f96-b78a-4ae9-9279-08daadc78ee6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XSHR37iZ+/Ui8pql3gUJRiSwRWXk/+ft9o++FmPo3lQf7zIClaF2/ZI0pJeKbEU4+Fj3u6kF/pvPOZl/Dgx/ubsQD7AE97tyZ1IhiyopFXXE0uEBc1g3vYWShosEiOyRjdZu/on3P33WeV3AUgDhcl+vbuhT3sn4/I+hB2QJObOWS3HNdZYq70PeK2kPpPGw5uPN+p92JquBlP8i+ixJbSt4wy11ssZGJCJyV7yPcTZ71Cks+1eduP5y6CcFu5SgrtsV2eWro1yAnJErCW/bRBp7miXzcIFHfdxV4mPiIr5OGHpnkXP8h4IDS16pZ8EaCRwMKIyM2XAoakz1+EVkLnNv/1TLjjW96UFyciBUJok52YLzl7WGkO/x3H0z3A2mH2UjuoQ8Cio67Z4YdZzXJEc34kJ3OAba02ZPg9b+5Q8Rv15AKEMW2VLdJ8ibpMDFU59UYFVrdaY54NDPpJ+xewUl5eJ5PshoVhMOwrOfO6H7bzyC/RmoleArwdzxtXGqecvMsVscpjubEg6361gYx+KTBgMozgRAtT0aanEXObOVd1eMEN/bEaDjXVazkcodDbNZuexXpIRBWN5Gpq3oXrwfAdMAZS10V/uyVV0BMT4jMroE5QHE/pOYZ/bZx8QafNwB/yfxT81CLcICFdQU8qt0wKHR9Obe47UFPUOOCqEkwittP5M7xgB2dKvhbxwpex77PtMl6yi3Vrw78ZwAog==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(39860400002)(136003)(366004)(346002)(376002)(396003)(451199015)(86362001)(2906002)(38100700002)(5660300002)(186003)(9686003)(478600001)(66476007)(66946007)(33716001)(66556008)(316002)(26005)(6666004)(8676002)(8936002)(44832011)(6916009)(6512007)(41300700001)(4326008)(6486002)(6506007)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JYyIfogH2knsjDHWyVGJpBKdrbBNPM3RFKTvSW7ENQT/e6bQxzRilKSDNorZ?=
 =?us-ascii?Q?6PIjMGw/qDlP/0Y3HRQPUXDPoVOVoPdxnDufL3CMpPWuEu8Y8XifHBeN2Nli?=
 =?us-ascii?Q?J9lNKkoLmtmapYMOn5VthsoRqHWn/mTU98bh8gJYmEtVJ9Igh+mEoGlZ9FhP?=
 =?us-ascii?Q?VD+tOqAI1zyga2H3ehvJs8JDejEs3ipmTKRaVWdCR5kwhkqyu7CilyBGDPs1?=
 =?us-ascii?Q?LTXzwx2Iqix47luxDxnpVwdyp5NSxKf6zYyNhp9XZRKjQ/eDuohEPwSaPCov?=
 =?us-ascii?Q?Pl9NSMjUN4w7Jhm9YHHkH5unWpiJvcVksna7pW8JeyZexJpLv4P0ffacWv0o?=
 =?us-ascii?Q?fF5WcPPnUVjN/m1aAVUvhKQeGwpvurFCFwk9lK5pwg/LBWNDZVuFPef8g2rZ?=
 =?us-ascii?Q?z5dh6EW5iDqzJpwsXYfWdsoqiddsAEj21utk99h01ZPWify7Q4FdM5D076f4?=
 =?us-ascii?Q?4lqFSGbzoXEVpo/5dbwjZp1vj1NWGK/o5+xgQWceND+3x/TkWie8F2PE0WTN?=
 =?us-ascii?Q?5VOarmO4bx/B6v9QYmLt0qEoNba0WlFVafhGfq/iU4m3uZhbwvVZXg/SQ3w6?=
 =?us-ascii?Q?ereSdqxFGIpUR/XjbSCn3fWchQmH2przDb7FbiyFfLIM2LOZJPe85hyjMYRV?=
 =?us-ascii?Q?pJXf4zWIBatvNcv66RjoKB6QzQqnwt4DGTSKnqxnWYTTGaW6Q0BXDTE2UAsj?=
 =?us-ascii?Q?Td+ZckoliD1T06amH6ieq30LWjoAdGVijFMik+VEB8RIjRKYFzeKDiZEkUAW?=
 =?us-ascii?Q?sTC4Pf8eICsf/mUD7AXmS6ew//I9lGNqjVYSqGeUJqdHfZbiYJGKM77hpaAX?=
 =?us-ascii?Q?9o/nnsuFs+09A6zM9hEHUrjpcilkhRA+Ijiyxm6teGHSE/dJ5UYW/+X1vEDY?=
 =?us-ascii?Q?DdV5iz2V2iR9Bv6xvL2kuJygL7T2w8G8kyASvARrQ5FOHMD6w2OQNrPbtdGA?=
 =?us-ascii?Q?w/1qM48Lm3bcYm+099TXjACyzAxzpsFvaXgNf/i6ow9jec+QNwl9srS0bfYh?=
 =?us-ascii?Q?3qoXYDi9xB1OJ+8pHtugnEiIVhso7YHHQS8KeoNoo2CBVGyXcU1vzPPQClfB?=
 =?us-ascii?Q?JAp5AgafLvmJFEhFwF4Sq9jLn/f8xsrYx1kifY/IyOp1nUc5uQVGULMoU0Y5?=
 =?us-ascii?Q?hGPCXLc1pRFV0kFXhiMYSHtMIXFJ9uL0XiD7fXrEb2Jh7/7ct1pyzIvM3OQl?=
 =?us-ascii?Q?lrcP4ytigAtJsp0hBQVJrtoVWjhIY+5n5uqi+97Xut1UdzpDlNTz1DCETm5d?=
 =?us-ascii?Q?a6DH/QMfhKQbq5PJ2klaJdeVN0vGlnRtsq4dvNj+bwG4txAk8vky3BDyPBBL?=
 =?us-ascii?Q?/4PyqaxpcDx+2b213BQ/FBdMIDj7kxLU5ex3ajLu5CnKSJk4FjDqZhqeTrD0?=
 =?us-ascii?Q?rrbCSElViQtVm+adoCQ6Cc35KeyszM3hJMmPRxodCppDGFmpfUwjl43KOF1v?=
 =?us-ascii?Q?aCbeAIfLCDMyV9eYC0YOkWksMLMXNYfjr6lnGG72NgXcECgGLDQW8atYFB2Y?=
 =?us-ascii?Q?5qrS78cDXTN5NayDwGedOZV3bG/Yq/uj6eDEV/flONb5SpObXC85xCNNePhK?=
 =?us-ascii?Q?zRkVcR1/MwPuNrGemv7GvZmVdPfmJCMkTi4svwSdFVHr0RSmcjkKrJkv4F6L?=
 =?us-ascii?Q?Ow=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bb27f96-b78a-4ae9-9279-08daadc78ee6
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2022 09:36:23.7668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: trywpj/vGfy0zOFetAippJ8MssW1faRYPVyBWR20UwGlNSrfANi4ZVJkd/reLsXD2M6KyPCEyXszr4DD1NowQlu9rpmeiD4KzfBpYVHQYD8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4531
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-14_05,2022-10-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=674 suspectscore=0
 adultscore=0 mlxscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210140054
X-Proofpoint-ORIG-GUID: 9hWrnLwgeYTmY5QeHpIjuSHKqZaKg4gn
X-Proofpoint-GUID: 9hWrnLwgeYTmY5QeHpIjuSHKqZaKg4gn
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Andy Shevchenko,

The patch 98bba546e82d: "usb: dwc3: drd: Defer probe if extcon device
is not found" from Feb 18, 2019, leads to the following Smatch static
checker warning:

	drivers/usb/dwc3/drd.c:460 dwc3_get_extcon()
	warn: 'edev' is an error pointer or valid

drivers/usb/dwc3/drd.c
    442 static struct extcon_dev *dwc3_get_extcon(struct dwc3 *dwc)
    443 {
    444         struct device *dev = dwc->dev;
    445         struct device_node *np_phy;
    446         struct extcon_dev *edev = NULL;
    447         const char *name;
    448 
    449         if (device_property_read_bool(dev, "extcon"))
    450                 return extcon_get_edev_by_phandle(dev, 0);
    451 
    452         /*
    453          * Device tree platforms should get extcon via phandle.
    454          * On ACPI platforms, we get the name from a device property.
    455          * This device property is for kernel internal use only and
    456          * is expected to be set by the glue code.
    457          */
    458         if (device_property_read_string(dev, "linux,extcon-name", &name) == 0) {
    459                 edev = extcon_get_extcon_dev(name);
--> 460                 if (!edev)
    461                         return ERR_PTR(-EPROBE_DEFER);

This extcon_get_extcon_dev() returns NULL when CONFIG_EXTCON is disabled
otherwise it returns error pointers on error.  -EPROBE_DEFER does not
make sense for a .config issue.

    462 
    463                 return edev;
    464         }
    465 
    466         /*
    467          * Try to get an extcon device from the USB PHY controller's "port"
    468          * node. Check if it has the "port" node first, to avoid printing the
    469          * error message from underlying code, as it's a valid case: extcon
    470          * device (and "port" node) may be missing in case of "usb-role-switch"
    471          * or OTG mode.
    472          */
    473         np_phy = of_parse_phandle(dev->of_node, "phys", 0);
    474         if (of_graph_is_present(np_phy)) {
    475                 struct device_node *np_conn;
    476 
    477                 np_conn = of_graph_get_remote_node(np_phy, -1, -1);
    478                 if (np_conn)
    479                         edev = extcon_find_edev_by_node(np_conn);
    480                 of_node_put(np_conn);
    481         }
    482         of_node_put(np_phy);
    483 
    484         return edev;
    485 }

regards,
dan carpenter
