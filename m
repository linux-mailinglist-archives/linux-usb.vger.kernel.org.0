Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83DC3557493
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jun 2022 09:55:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230412AbiFWHzq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jun 2022 03:55:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230403AbiFWHzp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Jun 2022 03:55:45 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 983B14706A;
        Thu, 23 Jun 2022 00:55:44 -0700 (PDT)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25N73xpc004720;
        Thu, 23 Jun 2022 07:55:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=ayceEkAS5JFTqEFviSVDv/09ZZGtqFDpagQCfbAVuo4=;
 b=O0ImFdIClkDCWE7V/xsZDwKBau6Z1+/OY4v7WDiEbcyiY11Xjo58LiyR78JY7+jFCogT
 ntEL4C8fJfBj9d9ruhDn5B5anxgLgnmFgP5BR4ddPzhn9+qDRPlI5Fv7qVZWvuhLE2GL
 lBpGGu5SQLoDq7c/JYSzi2YxldwORYAHE6PVwMZ0qGf98Lr1nLppkR66HLUKHSgKsd4D
 aNQwsUKpdVHfDMKQwq7bgo0ZB1R2pOxVJKYI+alvA13ME2zXDiJtY+dUgrQ7eyBoMoLG
 tvii1LUXueEM5Y8xq0wCbgQw/u6Pu1fzQNd+VsW6ixfDPemY5JRgV+qDXsnWj+TSryQX Vg== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gs54ctbf8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 23 Jun 2022 07:55:27 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 25N7oZX5040912;
        Thu, 23 Jun 2022 07:55:26 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3gth8yb0c8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 23 Jun 2022 07:55:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JRReWEyhnGzvdlZyRm2/5a/otlC/eyX2QZ1kdDsvAzgSxRcDlirN8tiiipIVZB8Exrn/V+kvNZAVO1zuIickhYLhm9bWnMJAL6PvEWAGriUyMR9ayotjRkkhCzzJLoNz6wAC/93JqghIM7GwGACEuzgdTxiqfrkALR//b1tP2toRSVzuET11+4/5+S4mvuuDl3VxvpLOw9EaRH6jMN70DiswsDAGWGRu62fKAWv7w9IgU+YlVLRx/HMkjfCrNMXUQLPGh1nZwlq+m5eqzvwuBSymYruXTLSvDgICrK+kEa13nPNn2Q+qc0FOlEN0DlyJkwr/wNqcKWXyMKWhHVLQJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ayceEkAS5JFTqEFviSVDv/09ZZGtqFDpagQCfbAVuo4=;
 b=lj+r/Y0mQqhIqjmfYCXnWfISUiWCPeQhk+YooaldXySx7jeCqtj8lOJvgS3v2kOb/gA2+p12MVb7TNk+1fND6N2pvf+6JfPc9M0JEfWAT1ZwXkfiTERKAMFxQRcjHa8zdd4hvLKd72ODOUQsqVBHiVGHpVLRqSO82TkANVStt2k10jDEwijhwFJ0X4cyco/XlDPRt/dPLWrpX+wNIw/wMR0k6w7Zc9yP+QLjz9riveF6KSRCkapGvOd5guab5842Mpbf029ZB7pU9514AtdCQi3M/J/KLS4I/numF54uiULpU16GtSe9TzXrPn0WlrcecLw7dK82uzbmvrYcO9XWsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ayceEkAS5JFTqEFviSVDv/09ZZGtqFDpagQCfbAVuo4=;
 b=jxDIRyQM//aNyIjXjW55/DrrsoLtzot8KDqbvGnMa1lfEQoEdiCyVK9EL9hXCnO9rBktUGjSrZv36dszDXh9MrfG28KuoBeL6RuuYLp/WWkOrqGBIPii2glZ6gm2kq3gIdmLeTYSUWW911G4cOlDz3OnanZaEVL/eu4jqiTLDjk=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CY4PR1001MB2102.namprd10.prod.outlook.com
 (2603:10b6:910:44::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Thu, 23 Jun
 2022 07:55:24 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5373.015; Thu, 23 Jun 2022
 07:55:24 +0000
Date:   Thu, 23 Jun 2022 10:55:03 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Neal Liu <neal_liu@aspeedtech.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] usb: gadget: aspeed_udc: fix handling of tx_len == 0
Message-ID: <20220623075503.GC11460@kadam>
References: <YrMsU9HvdBm5YrRH@kili>
 <HK0PR06MB32023259EBD6B4C649C62E8280B59@HK0PR06MB3202.apcprd06.prod.outlook.com>
 <20220623064320.GN16517@kadam>
 <20220623072216.GQ16517@kadam>
 <HK0PR06MB3202379EBEFD773974832F8080B59@HK0PR06MB3202.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <HK0PR06MB3202379EBEFD773974832F8080B59@HK0PR06MB3202.apcprd06.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNXP275CA0021.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:19::33)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e83393f8-3c79-4222-59e2-08da54edba90
X-MS-TrafficTypeDiagnostic: CY4PR1001MB2102:EE_
X-Microsoft-Antispam-PRVS: <CY4PR1001MB2102AAC659970BFAA8CD1B5F8EB59@CY4PR1001MB2102.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Rxgwg234/bI88XC7pHDBU2KUD39HcCu97+RMKE7/pwfMI2iVzQTS7lHnjS7NooKjbl4yXYBUV1YBaGj2bSX/OG47M6gV/QjeeXvJMYrTPBXfUxsLzZa5iUC3zEDqxai5OmOuGKttIaWPWntUnIWMCnA4qnBbTlpVEtt1hXaoYz9wUbfVS1Gr7kh/iU5OpotDGaRIIqVaBvuJU2VC0vY/clXm1igKK1pTFg0VFlVlP9e/n0crVIlFBlilKmGHNbU3KQpq/zVEnEWQeKGYuop1Ke6iTCdTHySpk/JxH8dt70zVTFYAeEofIJp3bystThh9B45eauv4cMoyVaTc+QAa59Akp3lV1XIExhg+0Q5ZKQBNfN9mhLmUqVEt3Km3U+ScJ2METOMf98Hb17u0dy3vJpLjiX137/4mEmd/bwGaXm+D8H8wLo7PORUzOAB4iJWAvIrgS5fPsvgbnDSKDjDB8VFWODeDqc+4zGqgFunMr5E77Fgg66cAHCld9pT79Q1wXV1QZKpHq0YrxfyQMTHR4JaQ0xDIy8mMEYX5MRddrh1j++/vzrNA5rzdIpLeyFcsfGVka1fyESvf8PYkqKyniwEJoiDqovt6pTwTJDn3XTmS21wd8Rix6z/XjDmn6lRyoT1ZyeAi1JZ+39677iNHxVppYolOm5iTiae3ohNis3sLhX/uHyeBke0NdaK8IaNNIdOlNpzoN30Ucq9UnDT3N+0sM4uDn7Fr2NiqRnzuX+TLTvoEmqBsAJldY3S0etIVGWfY/Uja+aoHtf2IHFUcEw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(346002)(376002)(366004)(136003)(396003)(39860400002)(9686003)(6486002)(6506007)(6512007)(6666004)(2906002)(52116002)(66476007)(8676002)(41300700001)(38100700002)(33716001)(26005)(66946007)(316002)(54906003)(66556008)(478600001)(86362001)(1076003)(186003)(6916009)(83380400001)(33656002)(5660300002)(4326008)(38350700002)(44832011)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Tisxnz0t/FOvZwJBmeWKCrJ0WXjUYwsJPmbPdiYgRl5DL2hPh/preM5YpvPK?=
 =?us-ascii?Q?rQL2ZlerXp1sSILDy9Z1vV0WQ1/a4OAlCV0NWzWw5sq7O5li971rqh/3qKV4?=
 =?us-ascii?Q?qcyxRY72bCmpgxM8OoEf/Sk8RfWO8RE/eDj2gfegtm0EU7T6CULU3PPeaZJT?=
 =?us-ascii?Q?cnad90/7CwT2tPCgd056yrDyKbTMPRLCSFYgEYsqfksVF/g5Uh0Di3euSsWQ?=
 =?us-ascii?Q?fiLb+yxCBQOVydC3RPky38bbT4HtJWp2aOznGoXPtNCQ5HIaK7eoc80el8+7?=
 =?us-ascii?Q?eQ6dk9l+PzTR+Oind5PDN9a2ek22nrN5Kam7d16223GB2xRFW5gClfLmgYFh?=
 =?us-ascii?Q?tmvbLYSrB4uj23rRVgx3UzBdkfsjjw5DAyDpbwukclNMNKNTkJZqmscNYITj?=
 =?us-ascii?Q?GSiQy19JHRePnYLbEOVaaqzqMCtVA/+MHQH6ZdKETiRjx00rPjscA21RWinN?=
 =?us-ascii?Q?swy9DL2V78tjrtgY2nrubEWhpKlmlPfqDZB6jTO8Bao4QMH73eb3P2Bz5qkJ?=
 =?us-ascii?Q?gxNApQ7KlR+u1Fby+EAHKMYdet2Ma2IeGZVp+c0vx+uEXpR/8yccRlcT86O5?=
 =?us-ascii?Q?S/KD+mkYfZ231WfJm6qpqtC1GvP7jwGUfOik9cpV+GR1muoqjmUHvYWBO/AY?=
 =?us-ascii?Q?RxiZSPIZw8QuiiLH0SPX1G4MUQFJ751/eZSN90Nzs6hYA2a+qHfUH4BiCxls?=
 =?us-ascii?Q?Jh2o6L9zJL2xKpUpOUojklhrh2LgPDWHnQUKFMZixfAwzQW194CY7AuX8OC+?=
 =?us-ascii?Q?PQymQ5N7RMRKkHpF459mCvQ2oyM82SexDckhKFXHQY1l4NZg009/9rVIYDzI?=
 =?us-ascii?Q?YFz2uP6C0j0sdveMbIPsVPtg9vSQSU0nZmsw3mt+8aFlDbB0VzQ+clAADTOm?=
 =?us-ascii?Q?HFs7+I2FZuf0VFLLJiH9dEvIrjnlcVjc/2/P1YmCBHFE0+yqFXwDJNtsCEgX?=
 =?us-ascii?Q?kTEbANy3FgnX3tsWcUIU5OvU+k9vZSDFcwrne0X1YAy29EZfwAUDPkgyJn0Y?=
 =?us-ascii?Q?CKKi+lfFJGR5SfZaUEahCY8CLWzINZlCEjIWwmnZHBJ/FMDQ3f/1fIaRy75+?=
 =?us-ascii?Q?JJYDSD6kBS7VATmhvZEm4mE0AWyngscpQ4nKZbt8pjFlDqVBqlJDHyB4MDPj?=
 =?us-ascii?Q?nDDDMe3OmX6e1LxONNjpul7Hrk690UFKNr2MSuZeaG4Bmuuso0RX9/PkdxSD?=
 =?us-ascii?Q?UVFWM6T/Y/SMjJp9lur6lFLSw8sLSTITSr3lDz88w/Pn0iTD6WTc0qOlLKKH?=
 =?us-ascii?Q?nU2bsxI0NaXQPbf3US5KYr9PVYr3iYkvciXSV6J/A5n6qSalREeDQQDegeHw?=
 =?us-ascii?Q?m214OyqLHtCkriDu1ccyNlMyDANONnv3HR2Bv5RhxX+JBitRZR7Am2ghI6DB?=
 =?us-ascii?Q?vuXO+/ScBwRZjRag84b5y1oghY2l3cRWPhzZ6buzwfr78l7HMCnPbv9BT+jo?=
 =?us-ascii?Q?8M1wVtVRAebAr470udU/1eKvmzOVhnlT/nKPV2cWra7EjI66P4oQmPsXdLmh?=
 =?us-ascii?Q?A9JVXeIj/H8kVYJ5lLqdtfvOuP7x0Hv+scq8u9Te1QNMJHqhbbyhIGw2MZDZ?=
 =?us-ascii?Q?cuSwljSOYLiiLP1AQkWCSjp04W8wxboP4DCdJBeE+GFC9vg1TCkmKyxJXRuf?=
 =?us-ascii?Q?rQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e83393f8-3c79-4222-59e2-08da54edba90
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 07:55:24.5350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b7pBY/EfGMilbuC5cn2zj+3RjkM04U2nYUBWo8vMLkG6GzR9+OmbqIe9joo34hi2yL6Sh9l3LyzH+3Z/BKrI5hloO4bPbBaEH6HKcP1EGn4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1001MB2102
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.883
 definitions=2022-06-23_03:2022-06-22,2022-06-23 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 mlxscore=0
 phishscore=0 adultscore=0 suspectscore=0 mlxlogscore=677 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206230030
X-Proofpoint-GUID: 0XokYetPWwnTC8d5HIjpcsdnxI85QFfj
X-Proofpoint-ORIG-GUID: 0XokYetPWwnTC8d5HIjpcsdnxI85QFfj
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jun 23, 2022 at 07:52:28AM +0000, Neal Liu wrote:
> > On Thu, Jun 23, 2022 at 09:43:20AM +0300, Dan Carpenter wrote:
> > > On Thu, Jun 23, 2022 at 01:41:49AM +0000, Neal Liu wrote:
> > > > > The bug is that we should still enter this loop if "tx_len" is zero.
> > > > >
> > > > > After adding the "last" variable, then the "chunk >= 0" condition
> > > > > is no longer required but I left it for readability.
> > > > >
> > > >
> > > > Use either "chunk >=0" or "last".
> > > > I think the former is more simpler.
> > >
> > > chunk >= 0 doesn't work.  last works but I think this way is more
> > > readable.
> > 
> > Fine, I can remove the chunk >= 0.  But you can see why your idea of
> > removing the "last" doesn't work, right?  I mean maybe it does work and
> > there was a bug in the original code?  Could you please look at that so we're
> > for sure writing correct code?
> > 
> 
> Why removing the "last" doesn't work? If "chunk == 0", it would go through while loop once, and chunk will be negative (chunk -= ep->chunk_max).
> 

chunk -= ep->chunk_max could set chunk to zero.

regards,
dan carpenter

