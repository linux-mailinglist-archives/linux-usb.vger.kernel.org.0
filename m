Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEC534F0F77
	for <lists+linux-usb@lfdr.de>; Mon,  4 Apr 2022 08:36:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377494AbiDDGiW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Apr 2022 02:38:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243245AbiDDGiR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 Apr 2022 02:38:17 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40BAADFFC
        for <linux-usb@vger.kernel.org>; Sun,  3 Apr 2022 23:36:20 -0700 (PDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2341piJW020990;
        Mon, 4 Apr 2022 06:36:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : in-reply-to : mime-version;
 s=corp-2021-07-09; bh=c17dE28g1eI+VKFLNnPQhP6T+YijKfYYMxrhso9/66g=;
 b=o3tI9a9D9K+JB4luM5OUu6tDnRWKFQQHwml6Pgg4E98we4RDhrzSaAFuXU7xNN32qt1c
 84qCi/LF+zgd0AX8F2Y0Yu4TnZlgcWzBpwNVDPJQEWsgBA94WVtWwErkjU3xSDZmy30r
 Mpvn4e9hakLnQSzxo3Iitk1JohFZlOqiJbo27vdj+DN0UtoDRYzjK/Zdf/5pwcZTE+2p
 yYnZTkVPyQaNOICPz3rt1HWlHl+Fz5qG+ARvqjGPDMkXmDINBfP2vVuQGl49drqMyvao
 4xd46BY9XHqPgSV2cETdtpHkHxtek37QNe32aWjqeEl6PdH5zUb4Cd9482/2AFMkdWeZ oA== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
        by mx0b-00069f02.pphosted.com with ESMTP id 3f6d92t7b9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 04 Apr 2022 06:36:07 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 2346UkKQ015051;
        Mon, 4 Apr 2022 06:36:06 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
        by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3f6cx22s0t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 04 Apr 2022 06:36:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pv8K2k49TUZTY8+y/YLLd0w6iSBdRmUb6c3GPQUJy1fZN8oTtM/Xvpyo3TDN2NJlHFTT3CECcAmdCubbVgzYXbzbOh9rMy1gtMiV7wlz7VFicU6AvDe4FxO+0G1jjz8SUfryG/9pMSHGvYlZ46XizSVWoFIe1QfMQGw9XL9lsXsy+Jgz1Aj4DhJk85VMPVPE9igiAbANpnyUt9TC4PG/ygI8EnEwA55af7siEKv2vQ4jYVWs4I90+Ovwq2So2nTo22emxMBvKxPrXGgCpmTevgZmMWcse3SxqXIAcIw0x9VaEINvHnYBmasE23XP0k6liO6WtjeDvOJ7vyFtDPiwmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c17dE28g1eI+VKFLNnPQhP6T+YijKfYYMxrhso9/66g=;
 b=ITflKm0b0esuKBOoTlhTYugtwIn6UOndezSt9cbiB4/0i9jQyps8g8T71i9+6CKzUY5ZkVfSFBssR64tPTZOTtDKJSf3+tjWQMHy93ab0HL/cuexJz+wqpF6+Y0aVXucadVJvA5wSktBvkfkmw5O+w3K1y5Rkp8ZvjQwAkM1klsL5a54JiYqNVtkt3mZDobHCqEE7jDhFlEME2eteG4Qw0DTgAg4U6phMwNCGgJPDxax9cmKuZcIDqzBjmsfXGhSD1ijh1b/gI4wA7BZIJyoNCW8EzYOiLp5VN6NwkptP09YzHJNhSasDd1e4rq6q6sA+ItHAQC6VFH7CKNgVYCo7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c17dE28g1eI+VKFLNnPQhP6T+YijKfYYMxrhso9/66g=;
 b=jzeAXCReLpSVTJ4a06nxy+jCp+9dXiPRja0+V2bb2xnJ8MyY3WAb9vaFp9TKSVeEpzz4l9WPHmxSTjklc1Wo7SgnOFGgtuUNVhOw8zwLxbJ99c0Qlq3CcNW6cKP15zzr3I13GNCEKgI7V+XhwqwpDqS/6CP9SEzh7y2NtsMRTFE=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1997.namprd10.prod.outlook.com
 (2603:10b6:300:110::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Mon, 4 Apr
 2022 06:36:04 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d4e7:ee60:f060:e20c]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d4e7:ee60:f060:e20c%7]) with mapi id 15.20.5081.025; Mon, 4 Apr 2022
 06:36:04 +0000
Date:   Mon, 4 Apr 2022 09:35:43 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     kbuild@lists.01.org, Linyu Yuan <quic_linyyuan@quicinc.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     lkp@intel.com, kbuild-all@lists.01.org, linux-usb@vger.kernel.org,
        Jack Pham <quic_jackp@quicinc.com>,
        Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [kbuild] Re: [PATCH v4 3/5] usb: gadget: add trace event of configfs
 group operation
Message-ID: <202203311137.r3Nm4dyZ-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1648621087-14948-4-git-send-email-quic_linyyuan@quicinc.com>
Message-ID-Hash: V3G4WDUECSIUYPNQFKHG2H63EV5FC6LO
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNXP275CA0032.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:18::20)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f95e28fe-f2e9-4342-840d-08da16056456
X-MS-TrafficTypeDiagnostic: MWHPR10MB1997:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB1997C0B62141B07114F58D088EE59@MWHPR10MB1997.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: enAwK/xanS/aydLjr6R1OE7NLWs2FkWiHpu99IrsIutdbG0tWcRejVUltmeiWtItzR/o6XoMRbbKW0CW5qPlJuwfBtwegS2omfPpEwRnXGvWnZwofAsCFHtkllvvoP97lBRPkuRB7P+sz+Ifi2u65IN4UntFnqAmoimetTPoAQkGrjUbyZQP0q3dscJ4oJD8HcZbB5kazMtu80Oc647zg5WgTPAIEb2G310xT/9sBEZOkIpLE6wMiTwOkQexJebSMhlzohszzTCCdt3JtMzhnxTPK+8Z4JhseOwSf6thocXSWutvsvxqCl4obSydoxwLvcQTblnfJvtYJe+O3JkfKyud9u1FnTil4ATtF+rn1fuIXeIwSZmh77NG76BU24okhcSMkFNIL1V4NPPAXDnOemP3iNzL/m0eLL7UpInyPldNJEEaawad15rosqJcObEt7R9aPTd7Z7sFYqf+I3cWrpIL3S+RVoh44+lzBovfREKqpLvWzaDdJNJeRx+OiJgAT6LJcqTCESD+aOX3CNfEUoJxfWQhUWDUh/3AfXHh/x5+vPtO9Dvg0BcyS0H8+1AZs4/LFiG2B/qRkQ6WlGsYsFpfesHeMu9s01gmT8ZBgmj06u3qdPu21TMPc2dCynTVw0wUr5RMA5rJ/WmdCdvZvbrTIccr8xRGdduD9McCYGBoZ5oIAAbK4ZO4HUbax6adFcZ5XUgpRoq4lc55gMIUK36fXVzEqxE7iyPJcOfPejpxzqNZ4BB6SIymPaWG1DGb+fX7SUr66YjI4RBIclo66Tv14qq2xc9HDS+xtQGerzCrKED6RF4kyq2GlFJL9xEGGzn0deiz6ENQb7mB3DhJrA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(66946007)(44832011)(83380400001)(5660300002)(38350700002)(4326008)(66476007)(38100700002)(8676002)(66556008)(52116002)(508600001)(36756003)(966005)(6486002)(6506007)(2906002)(1076003)(6666004)(26005)(316002)(186003)(6512007)(9686003)(110136005)(54906003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DZ7jSY5Pc4WriTBCKluaU8wRvWsB1UMM4XWxXdNUH1gKl0TQFypM8rhXLfSD?=
 =?us-ascii?Q?mzTWBjwgBqS0W1pzwMvQPYbv068eHcoZ3BfIhe4q6/fsMJS7if6FHmStOZdQ?=
 =?us-ascii?Q?v2ATRZZ6ZjVaZj/6TzscQRiIh77d54VWWYypQ4se9zK92QZ+YAyggoiCBb16?=
 =?us-ascii?Q?2TS88GrGHZlJFZoz+UdMHNJRaAC2mrBZX24hnjdrJxX8Ve6RQUiSQBnuBVIi?=
 =?us-ascii?Q?PkYIWH39aimNIm7RUxY08cI0f6tcS5oDZ2KKlnxQrSDGU1bb69VM2V6wIsN+?=
 =?us-ascii?Q?flmukpxpUF3sZwWSoerj3NDnmAKhs5YYF/drY0PSJsEtOO+dtZGStdsFuQYv?=
 =?us-ascii?Q?v6PpJV+3yFeD8aVE8yoEMLpOrKAC44YnrhSXDEePmb/fypXYWtZ/52W0fSri?=
 =?us-ascii?Q?ZhpA5CcE7kt8/OaY77qH61d3pVhiNEoTKxNye8E8eVzFxkvpwKg6gF18XjNb?=
 =?us-ascii?Q?2T38lYIlRBLp88ekipPRM0oVcYVdGR13lc+HkGFl7807tBfhS2v7qeEh6KBo?=
 =?us-ascii?Q?bBg1SUfP73D383CyfKgcdjk/mywHRZxyqlG3jd+MMzAEcTKYvRnzCWb+gDUv?=
 =?us-ascii?Q?uh0I23xR3rRclCC9JRfI5CPmrMaAO1IIWKKP3EA5EOMoRHBWEkCbz+QP2M+D?=
 =?us-ascii?Q?umiC1/7D3u/o04nqaBikHRU3jHH3+PbtfsIsvM46GZan/tierZVMd09v24vr?=
 =?us-ascii?Q?nf30zsgqn03beunypDSTWZpwUO0ErFleim5c84mTF10k9Reaafnp+wSarAVl?=
 =?us-ascii?Q?fu8vnfB4/KPjRw9rvlG+T19Qpc7HrFQIKt/WN7HBkWn7+Dk0bc/YTX0pxssV?=
 =?us-ascii?Q?GUtXDhzLu0sF/znx+M8Ry9FQVbO0o2n2yRuXDPH3COYgpy2vvn5PgSQN5qoE?=
 =?us-ascii?Q?Wk0yEufUbN1FHvqE5Pzp5DFzpArBTyNx0wlnD/azbzuE3N8QW4CIDM83zEOi?=
 =?us-ascii?Q?wEGnMD7GQ472JVyGsw6v6tOk6fGpPC1u3+AkIIXK4idXxILaDHMs+iCQ9vGZ?=
 =?us-ascii?Q?/MjfBT2I5VEnNWDFccrcxJR0QzncHQpabopZLFymnWFn4IpzM6L0OBwQhBFP?=
 =?us-ascii?Q?Csau9gaoRrySzNwDHqUhjZqbq7XeFjoZk3ef1c/tLKsg9D63YhueFHWthG5R?=
 =?us-ascii?Q?7c0QMyZiMGjsgD/ub9FAI6MlxWtN8n5ZXvy+h71JuCwqGomVDIZL8pDMwtBh?=
 =?us-ascii?Q?TC8+Ud9RSLAPVgDMlbwJbNiiD1OzfQHc+1tgxfE6+ToE9Rr4Z7CSdns823gt?=
 =?us-ascii?Q?pF8aPcWACnroh0nw/pP11J7EJ252ksyrAP/KitOyUlg30QJq66UX/tI5/Ttv?=
 =?us-ascii?Q?JtA3kWMBdbU43UQ+jVChczSUcH6cM+shXmHOtGNzV6WGH+DCjiknlQRvTCwu?=
 =?us-ascii?Q?Aedejb5I5cS1DOkvzMpPREXADUX8/mChn+TXeDnF0sB/9GHsrP0v7UTky7S/?=
 =?us-ascii?Q?+zz06P7z0Vhu8pnq+pP4svje2lbJaA/pZZs9Gz0Im8ig5FLtKvUS1ty34aR4?=
 =?us-ascii?Q?qe2cKCX09PtvGCu1wbKWG0ckWRE0I9JkEHrwsiLhQKvqHRRK4HUKXjzuqmCQ?=
 =?us-ascii?Q?nCyPcneYAuMDwbQEfms1dJ8Rrzy0xmfK33DXAVr3Qeg4U+9eUz2tFApUe7O5?=
 =?us-ascii?Q?A3Vqr/Gu0AlgdYZ8AIIFTKRLF6/GalhKtSxI5qewUBYUxpOjMLKqnl2dD4FJ?=
 =?us-ascii?Q?COHfSbp9dX1yS2aPXF4/Wl4SBCnqCJyThKrmHtmAAUHrDFgEMfKhNuAouq57?=
 =?us-ascii?Q?r/4wE503yDkaWsDWqf0jKSwWHRbTq5s=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f95e28fe-f2e9-4342-840d-08da16056456
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2022 06:36:04.2104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5OL+2EVL4q6Y7ncW4ml8QkPqWJLugHn1l1sGBxp8YkAaXPDDrTfRzJasBRNZ25cYZrZAwOgsN7KZzB0wMTShxNdW62zQtfkPi4P0+qZjMoA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1997
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425,18.0.850
 definitions=2022-04-04_02:2022-03-30,2022-04-04 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 adultscore=0 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204040040
X-Proofpoint-ORIG-GUID: dMjvO_Rg8WEfmn8feMjcPp2GIHkB7inJ
X-Proofpoint-GUID: dMjvO_Rg8WEfmn8feMjcPp2GIHkB7inJ
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Linyu,

url:    https://github.com/intel-lab-lkp/linux/commits/Linyu-Yuan/usb-gadget-configfs-new-trace-events/20220330-141926 
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-testing
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20220331/202203311137.r3Nm4dyZ-lkp@intel.com/config )
compiler: gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/usb/gadget/trace.c:26 gadget_configfs_group() warn: returning -1 instead of -ENOMEM is sloppy

vim +26 drivers/usb/gadget/trace.c

2f8f6deceeec1e Linyu Yuan 2022-03-30  16  static int gadget_configfs_group(char *group, struct config_item *item)
2f8f6deceeec1e Linyu Yuan 2022-03-30  17  {
2f8f6deceeec1e Linyu Yuan 2022-03-30  18  	struct config_item *parent;
2f8f6deceeec1e Linyu Yuan 2022-03-30  19  	char *tmpgroup;
2f8f6deceeec1e Linyu Yuan 2022-03-30  20  
2f8f6deceeec1e Linyu Yuan 2022-03-30  21  	if (!item)
2f8f6deceeec1e Linyu Yuan 2022-03-30  22  		return -1;
2f8f6deceeec1e Linyu Yuan 2022-03-30  23  
2f8f6deceeec1e Linyu Yuan 2022-03-30  24  	tmpgroup = kzalloc(GROUP_LEN, GFP_KERNEL);
2f8f6deceeec1e Linyu Yuan 2022-03-30  25  	if (!tmpgroup)
2f8f6deceeec1e Linyu Yuan 2022-03-30 @26  		return -1;

Better to use proper error codes.

2f8f6deceeec1e Linyu Yuan 2022-03-30  27  
2f8f6deceeec1e Linyu Yuan 2022-03-30  28  	for (parent = item->ci_parent; parent;
2f8f6deceeec1e Linyu Yuan 2022-03-30  29  			item = parent,parent = item->ci_parent) {
2f8f6deceeec1e Linyu Yuan 2022-03-30  30  		if (item->ci_type == &gadgets_type) {
2f8f6deceeec1e Linyu Yuan 2022-03-30  31  			kfree(tmpgroup);
2f8f6deceeec1e Linyu Yuan 2022-03-30  32  			return 0;
2f8f6deceeec1e Linyu Yuan 2022-03-30  33  		}
2f8f6deceeec1e Linyu Yuan 2022-03-30  34  
2f8f6deceeec1e Linyu Yuan 2022-03-30  35  		if (tmpgroup[0] == '\0')
2f8f6deceeec1e Linyu Yuan 2022-03-30  36  			snprintf(group, GROUP_LEN, "%s",
2f8f6deceeec1e Linyu Yuan 2022-03-30  37  					config_item_name(item));
2f8f6deceeec1e Linyu Yuan 2022-03-30  38  		else
2f8f6deceeec1e Linyu Yuan 2022-03-30  39  			snprintf(group, GROUP_LEN, "%s/%s",
2f8f6deceeec1e Linyu Yuan 2022-03-30  40  					config_item_name(item), tmpgroup);
2f8f6deceeec1e Linyu Yuan 2022-03-30  41  
2f8f6deceeec1e Linyu Yuan 2022-03-30  42  		strcpy(tmpgroup, group);
2f8f6deceeec1e Linyu Yuan 2022-03-30  43  	}
2f8f6deceeec1e Linyu Yuan 2022-03-30  44  
2f8f6deceeec1e Linyu Yuan 2022-03-30  45  	kfree(tmpgroup);
2f8f6deceeec1e Linyu Yuan 2022-03-30  46  	return -1;
2f8f6deceeec1e Linyu Yuan 2022-03-30  47  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp 
_______________________________________________
kbuild mailing list -- kbuild@lists.01.org
To unsubscribe send an email to kbuild-leave@lists.01.org

