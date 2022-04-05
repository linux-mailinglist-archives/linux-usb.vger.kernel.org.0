Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 352364F2326
	for <lists+linux-usb@lfdr.de>; Tue,  5 Apr 2022 08:30:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229952AbiDEGcg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Apr 2022 02:32:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230308AbiDEGc0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Apr 2022 02:32:26 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5B508300A
        for <linux-usb@vger.kernel.org>; Mon,  4 Apr 2022 23:30:23 -0700 (PDT)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2356M6R8000758;
        Tue, 5 Apr 2022 06:30:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=z04h6DACPuap+EJjn55ANJbqIsbXcS/psRJjfXBPFuw=;
 b=X9JOW49VJOygTto0XOega242JWmRcUl0HcfIH/YmplXOS6KD+tTGrXHpQjVl+kdYB5wn
 2FTI6stfM3brFmajtfznDleV4D2RBBFZid+RpxkcdnPuhWpmAbup85LEuEYZdzKT/J3R
 S+OK4CWBIBS6J5bVOGU+spKUpOXGCEMwo7wVKS1rON8V/1g/Gcx76qUq8xjq/xI54hUC
 3MMVNIiwtY1qoQ+goCJMT5ilRyv8GDqrjJePQWoXtP90dilIXCVcdv9Bo0cBOaXliena
 iRAp7AL2q42AaYFH76fku6kXs+Bt2h+hH6p7jOKhLP4ipO36SLMwOUVCh++6gCXZfr2I 9A== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
        by mx0b-00069f02.pphosted.com with ESMTP id 3f6e3sn3vh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 05 Apr 2022 06:30:15 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 2356QXof037525;
        Tue, 5 Apr 2022 06:30:14 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3f6cx36452-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 05 Apr 2022 06:30:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cnIICKNbiYF/iLIAdYSm8HGd+Fu0BOMcAPhSGIkBFacOP4Mg3E23rj1GWPpaY0z3uevevGeTkkVYFvGQvHzwFqsdX9ZFVZca5j/AkhtG0bCpm9jlpgGXxtYFONIY9LxywRSUb/llbs2UTSY/PjskfeqhBFf1Oa9d6uLaVGqDaV3kkmiwaRmifkyLuJfn9KA1sBY7x2XSkkaYbnKQ2rSatawKtsrriOugTrM0VBD7VqxHPqW+RFC/TuzpkOmzK5l2avW+zvp2f3ZukV9CbBhUUOq23I+NCJqliRpgkWSxfT+ocU+IGdgfVBV8sctjPcPyGNEp/E0M4lNIKO8t+KPiFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z04h6DACPuap+EJjn55ANJbqIsbXcS/psRJjfXBPFuw=;
 b=BDoIEGKrSo62FEWs6UhFErcfZc+vG8YLNI3lGnoM6sb2koz/rnSX+NJrDx8NXOWJvOJPiOJkY7y5R/awjIFWjxdiBIHfCC38vKTOk8LpyBVKEfvojz1/Lmo4dPI54p4u0Pl3Vbrus9nMZlayLjjtMoIn/R1Qi/5b9ccavjlREUw7rOtdVUEXbTqmPivFZXUVtxI5Rq/Dc8Y/gsDRfAjSQ73pfRWvhbCbKcorbQIpyGR30BE/Pnk9ntz4RrXfYgBolrts/fN6MgRfns90mfjDRSXRt5E+57PRo6Obu14rOTXx+GD6EjtCcoTOO4oyAXc5THXWlMYICxsLBLpqNgiaNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z04h6DACPuap+EJjn55ANJbqIsbXcS/psRJjfXBPFuw=;
 b=cVbN2w0r9yKh+c0L4gzokfpqI88OegQ5jhMrVP69C9TsV7X6RCQt/qY6kTfEjQLvlKJPOoJN8eIdkABXc2NDKiVS1d9PKXkIPwwAkVrSKW18U9EcrN0ZB0+IvowF3jl0xIErJn9QxDZUe6ml5BcBcqlhGeAcupDRoKZE5SMp7YI=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by PH0PR10MB5435.namprd10.prod.outlook.com
 (2603:10b6:510:ec::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Tue, 5 Apr
 2022 06:30:11 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87%5]) with mapi id 15.20.5123.031; Tue, 5 Apr 2022
 06:30:11 +0000
Date:   Tue, 5 Apr 2022 09:29:57 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
Cc:     "kbuild@lists.01.org" <kbuild@lists.01.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "lkp@intel.com" <lkp@intel.com>,
        "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Jack Pham (QUIC)" <quic_jackp@quicinc.com>
Subject: Re: [kbuild] Re: [PATCH v4 3/5] usb: gadget: add trace event of
 configfs group operation
Message-ID: <20220405062957.GJ12805@kadam>
References: <1648621087-14948-4-git-send-email-quic_linyyuan@quicinc.com>
 <202203311137.r3Nm4dyZ-lkp@intel.com>
 <DM8PR02MB819863DE601523292E58CD50E3E49@DM8PR02MB8198.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM8PR02MB819863DE601523292E58CD50E3E49@DM8PR02MB8198.namprd02.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: MR1P264CA0122.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:50::32) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c903ef9-cc63-479a-3bf6-08da16cdbc6a
X-MS-TrafficTypeDiagnostic: PH0PR10MB5435:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB54356AC9E5D67CE33173B6218EE49@PH0PR10MB5435.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1pxGMXK4bkEXRO57ntIUGYqdNL1tlqnrzEenA5uv0LsMQWC46uFsZ2t+STz4wSGhMnNgvdrYQ3MaWAuVDp3kQbyffAqf5WXzCxdCrF2lcU55ZQp1r98aYDGimEfXe+uytPNPV1f9aiNblbLKRCPyWrEvIVdAcZCnc1wJhc1WreJinZtXFQ89BRKD7P8EwfdR/6qDVO2cx2g7JcHP/wh3H4LbuKD5NR9sRCo8G4M0vCgRe3ly0TJIQ+O6kuWtZwcBxfGK8IzhfxFpbI4kvaNTD0RQlbZHaSakiokeCvivTzyE22Law1l/7HF3YwOvyoRdv6njjydYYqKmUqqIkoiY2Hx6Bs/qmEmah+znVEcdrk0oAHptsRvmEyQZ2Ig4WfzAtLZeG27ovrGPpclg6IG4TEDpCuF+vcSF2UIQ4l5fQ6lq2/1v8FRB7hBOmIdLZCVXGkbXgPD13+Kxb2UL3xASIzUMRl3yb6BobzK9K2OB7LdpK4KTKYwDC92rzel2WMIcoiN40dRy0LTjyUx2hy7F7J0kxGVWz0+uDUElG17RZ1vvRu2OAM5tksv+KlvWIZb6x9c61cAmZOAauZ5F98Z5CVRFzqjLdwLXXqZz5cN4M2R6mr52yj9YemMfVBQ6UKVhPwXqjWRwl2Dy4i9CaXq57BtO8Q5HiNn9p9wbUdyMQ1XZf4QKdZr33w2tSQeMk5o1Ud8RWiL7KlYzxOzeuHnWo3rMbTgkBlzH/GzvYRxCv1eWar6d4YSjgSHxdYLqnr0WzMjgDYmGfRVhTJGvo7Pq9k+/hSsq2I44NgNxE0zBIu3VpciBvcrgY21b2UAm2Y4a
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(6666004)(6512007)(6506007)(66946007)(26005)(316002)(6916009)(66476007)(66556008)(186003)(86362001)(83380400001)(9686003)(8676002)(54906003)(52116002)(53546011)(2906002)(6486002)(966005)(4326008)(1076003)(5660300002)(33656002)(33716001)(508600001)(44832011)(8936002)(38100700002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5o2OLd//m1A1MQP1NRlcfnJWsp5wSexoljILrzDjWTXzUmT3sPnjlFomzapr?=
 =?us-ascii?Q?E+ppmUWwBB8PdCOdwaoifM4Zyfr/xXsdHkxnD4IW9isEhxGJfVWhlYPyUEWD?=
 =?us-ascii?Q?fcbw0MrMG249OnPGcNsFxlGLNJxrEFi9zxlpzFtGtLu6K4aNVOSjIj0inaPZ?=
 =?us-ascii?Q?yst4BGsm0PllDsde/1k3K0lhe57gWjgHO8w2JneiUR+ES4uiSJF3V8Z6cwJ8?=
 =?us-ascii?Q?rRuRscB/l5LHLFLbNPKEbjYS65sJIt7zh12hop4ZWKxPc3r48KCqDYzaznaP?=
 =?us-ascii?Q?GtEKDf+YfxRshJUPS+IQwtZxNrFIh9os7WiEOOejxRIZVtX1gTTkjvNX8vAn?=
 =?us-ascii?Q?iXTkiMCI3uW2FqX0AUWAEKEjzO1tWaAdupoik7SaJNjXQV50HMLuDl8uGxgx?=
 =?us-ascii?Q?DgVn4WnGxS5m0D5sD2xoGMOnxaRJFwYVHkeRsLv19PgmYML6xysKP3DGmGYh?=
 =?us-ascii?Q?gQDkvD3sFFNht4RUVr825NavEHoPU7xhZGD0iTaHOKqs1biD+otoxlhzmMRh?=
 =?us-ascii?Q?yrkL4Z3/5OZoK5GiG96kJtCttM0aaH9VKEwwosiCNG8YAacUY15jtFYRhUeC?=
 =?us-ascii?Q?1fu1PMDQHmtsIBiAm6oVMWuuxcfKdwOKvxnjvX6sjmiUY0r1Lt/uZJr7p9uC?=
 =?us-ascii?Q?XkDBmOKE37sHW8bA+TbkFhqiBzAPgqJT5xuK+BrqRxdDyC459pTyDFDZvVat?=
 =?us-ascii?Q?/mSAWjpyUOAo7KKh5f6+KqxJ/mYbOqhuYPBbg/ChSudw5N/wgUxAJiDG8cnG?=
 =?us-ascii?Q?sRC5+iU6blhD8chUZ5tLq4RAcFS2JW7+LrvYoNLe1EQFGkBRuyYgteU+DBXV?=
 =?us-ascii?Q?vAIsO8xx2JghK0EUcjAkPqd+ETJZwOzYdLONYYXZPn4hoDo2UYMGV5Ec0w1B?=
 =?us-ascii?Q?NCPd0rz4776PbmNTr/Gtuhno4v6mPaulMrNBl0eP/x2PhczPg1MCrKS+p+IY?=
 =?us-ascii?Q?VXRfhw6VB97UeODX/dXAz8yperqNn84caKN/9Jx2Tg/psokwN40FhjKAQUGo?=
 =?us-ascii?Q?Se83He5sXi98hO9cdf6nHsgTOmzyzG6QFCsTRoWS1SmKU4i+x2iPXZSaXb3v?=
 =?us-ascii?Q?dlrYoslawIL2t4uxxnnRWnPdbHcHjuBOPkkOFUH4caH2GOowa1p7dr32Ya2h?=
 =?us-ascii?Q?gQr2d3DaCpPE+3FSLQStm2GhsKMqajOjGCtsQci3aVQhgcnEAXCHWzfDK6LT?=
 =?us-ascii?Q?ZnY9M2jZXIk8LRO9Q2ekpOKUedz9U5clTRGQkcUs6XTZBZXGzQ1oqof16j12?=
 =?us-ascii?Q?Ymix6WHPQSQ27JiYiuuF3KWH4jLLX1KSdY+t93mIqlD8UMwnml4vcFrN74rd?=
 =?us-ascii?Q?yan9Z9j3dsOh9yzIAdQY4lpIUx9kyRrm3jT4ZE/lCqF28x4Q08dX3bhZgCJi?=
 =?us-ascii?Q?zNFGBIq/XG0OBHlcHkW45znOkIw+Wjm1rgsKMFqcA/HRVt4s5Oa7mjhR7LSt?=
 =?us-ascii?Q?IIzjNlcwBAlpuwvFGIZo8dSY6WV/uNh3+GEtne8Y/rC3KAYrBtxSmAo0gILn?=
 =?us-ascii?Q?CtvCM0V9NTMSdu3WtobLtttQjTCsbYtD6TBlbldjkp3mO1KUfaCoxG2VAgoK?=
 =?us-ascii?Q?LPHmCzuWnPRaOpOKoCA8Hs0MD/1VIYD5gNpNo73hRDOeIsEK+Xq7w7d3/c71?=
 =?us-ascii?Q?lSq11A7uQo5d/Q2Q1TRs56GO2Vf9F5W+C95RX3Sw5dectwv6CxOUYQiBNiuG?=
 =?us-ascii?Q?KaTaIJPlo8DesTdjwpwamaeFxMwEl3tSDN694ST7dfWUcroksxi2RJgaF3a4?=
 =?us-ascii?Q?zIdjU51euJM9TkPM2+L27Oa2Kitn8Oc=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c903ef9-cc63-479a-3bf6-08da16cdbc6a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2022 06:30:11.5125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: td1diKgn8Ql81CWGJYu7Jx50w0fDp2H7uJN6128CKh8exPfA/0InEo8f1J/RHZmWz+n91mwbdwY9c9iMeGj1XAG8beuMgB7N5OxSBDcUIkE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5435
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425,18.0.850
 definitions=2022-04-04_09:2022-03-30,2022-04-04 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 bulkscore=0
 adultscore=0 mlxscore=0 phishscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204050039
X-Proofpoint-ORIG-GUID: fXEDCVK_m40Gq31zcIDGRSH7IanvPeUA
X-Proofpoint-GUID: fXEDCVK_m40Gq31zcIDGRSH7IanvPeUA
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 05, 2022 at 01:54:09AM +0000, Linyu Yuan (QUIC) wrote:
> > From: Dan Carpenter <dan.carpenter@oracle.com>
> > Sent: Monday, April 4, 2022 2:36 PM
> > To: kbuild@lists.01.org; Linyu Yuan (QUIC) <quic_linyyuan@quicinc.com>;
> > Felipe Balbi <balbi@kernel.org>; Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org>
> > Cc: lkp@intel.com; kbuild-all@lists.01.org; linux-usb@vger.kernel.org; Jack
> > Pham (QUIC) <quic_jackp@quicinc.com>; Linyu Yuan (QUIC)
> > <quic_linyyuan@quicinc.com>
> > Subject: [kbuild] Re: [PATCH v4 3/5] usb: gadget: add trace event of configfs
> > group operation
> > 
> > Hi Linyu,
> > 
> > url:    https://github.com/intel-lab-lkp/linux/commits/Linyu-Yuan/usb- 
> > gadget-configfs-new-trace-events/20220330-141926
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git   usb-
> > testing
> > config: x86_64-randconfig-m001 (https://download.01.org/0day- 
> > ci/archive/20220331/202203311137.r3Nm4dyZ-lkp@intel.com/config )
> > compiler: gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0
> > 
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Thanks for report this issue, I will fix it,
> As this series are new files and still not approve,
> I don't know is it possible to add Reported-by tag ?

These are auto generated form letters.  I just read it and hit forward.

regards,
dan carpenter

