Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8D5255938B
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jun 2022 08:35:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229765AbiFXGff (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jun 2022 02:35:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbiFXGfb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jun 2022 02:35:31 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E62C55DF08;
        Thu, 23 Jun 2022 23:35:30 -0700 (PDT)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25O4UqJl019089;
        Fri, 24 Jun 2022 06:35:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=0waN08/Yq7hfWuSt4ERFMbI9k1cMOAKxcjPWKE6zFvQ=;
 b=uEUEXtTvA5AEiBy7M0hh1vikeaUtfF7UDhYgaiIqHdWWOzSfFB3uJpzkCfTEjmJCQd2Y
 HwxvX/y2VG/NOyKrYS4ypu1vi700jl9F5o/PqgsavKYT6GF7DdaittTsya2IkLJP83EC
 47Ucz8oiMn50Ask3GuNiyppmrfDKDih8kafblY6zoGqYAKJVdSOr+1OK9+4cW9uORDHE
 XjrguxXjC6XY/P/1wYAARAEov+xRlMxiVKckMqRN4AqlL2nWYPsuIrpdy4Kwdk7+UABs
 UpaKTqwvvC29VE1H0dAh0bHccliGwZy1mixTkLvypyDnV9+qTBZ8OrhHJyMiL59mCdhn OQ== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gs5a0n0xn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 24 Jun 2022 06:35:20 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 25O6Kiqt033962;
        Fri, 24 Jun 2022 06:35:18 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3gtd9wy1kr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 24 Jun 2022 06:35:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UxG2neF2cxYFnOgq87KgvndKZRRZyJ7RU4WqBn9Uxi67a/hAjDjj2R9SSN889Pe8kkuQrmjSA9U1RjxN/2Bgpq0lupeb89SL4uYWgewgBFsa9uQonKnRUQvmaNV5y59ItFulLGWzbVMAxQ6FQ9KGZzZHR9iLSLsNSoHHHqkwR6/6vTY25l8TACaxbaXldefcafG9WMNInCrfqAPYg0ylRDpRoWIlWbh/NwF5ZPMlnFhqRbPvECqEePfU1otCx0V+igaqWFE6tTf3XQHRMCSuvtu/qA5VKKpa94L/k/e7T9XxPj5GAehi04CS8OxoIFAJfC1htmEbbwDVHX6NVGkO8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0waN08/Yq7hfWuSt4ERFMbI9k1cMOAKxcjPWKE6zFvQ=;
 b=MLPDJe3q4tu2ZMGlq63yFCqXUCEZ6kpsdbX07HKSF4stZcq3Tw1FvXmiq0siIzv7U3472+CnlaXhXxRt4edGOJSs7OWGphsihmoL8c0I2zfCtwAkgkfHSZkYMRlitJ3aURnZ+MOEHGYVjeB6IH+OPbMc7uavjGu4B9qq0fgMXm2JNbtBEH9zX+0r/B23ySrnK6LSY1aumGCnOotFYGANxiTLfv5dqgr8jSqQQMYc3mC7QtaXN3UoHNvQ/tSp2Bj1JKzWN8p6UdarMyQ0GbchL1yo/fPQJo2oabLndWUgSGKXHg/H4X+34JOnfE8u/5B+GZIR53SahxsZ7CTh8sqIhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0waN08/Yq7hfWuSt4ERFMbI9k1cMOAKxcjPWKE6zFvQ=;
 b=irM14txr8gTA0rk3b54jRdv6VAG7bp6CqBvdbM8aFozbBLtqdgNx1klh1+s6t/PdOjba5BJQH2LzHl9xWk/ImtYcQ8yvrWCLqI7rdj9IVMpMPkqjUNbbyYtRjqknQN+/1ZN5ZT0tDewDiMzve+oj0yYsj57qpMYsbVRLiJ3iqbc=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BYAPR10MB2918.namprd10.prod.outlook.com
 (2603:10b6:a03:8c::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Fri, 24 Jun
 2022 06:35:16 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5373.015; Fri, 24 Jun 2022
 06:35:16 +0000
Date:   Fri, 24 Jun 2022 09:34:57 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     "Herrenschmidt, Benjamin" <benh@amazon.com>
Cc:     "neal_liu@aspeedtech.com" <neal_liu@aspeedtech.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "balbi@kernel.org" <balbi@kernel.org>
Subject: Re: [PATCH] usb: gadget: aspeed_udc: fix handling of tx_len == 0
Message-ID: <20220624063457.GG11460@kadam>
References: <YrMsU9HvdBm5YrRH@kili>
 <HK0PR06MB32023259EBD6B4C649C62E8280B59@HK0PR06MB3202.apcprd06.prod.outlook.com>
 <20220623064320.GN16517@kadam>
 <e0b1c201bec2ccb68d1779ea8e9cfdf27563dd73.camel@amazon.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0b1c201bec2ccb68d1779ea8e9cfdf27563dd73.camel@amazon.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0020.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4d::20)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d3e2c24-2c14-4647-2c1d-08da55abb360
X-MS-TrafficTypeDiagnostic: BYAPR10MB2918:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LGjO1nD8vpwmgVHvXFywVdM/S4QedwEviQCzXp6p2FawtU8YkQqLgy2jCpqR0qP6fZbSX1Vq6O7Ev0iLhlRG0LEMkM5orz7o44s8Z8il+SwHaiwAJie9jZtoR7ZCGltotJna9NNz0IdBmyCEJb9BvmF0X3A7eHXAM2bFE6YU+hYuwnXa8xNNi5sQT6K58tPQjGIl8HGpWQWign2oSKxClkCM8v0zQhgA/qBkdYzAoYEKPXLq8rPy9JTYNi9fs+1hCMppOJ019ORs3qifHLf4Go0OuV4fT90OWBbBS42wDbeOhDhQATJp7m+pfHtMryto/IQ5+dcklX7RWsIYFiD08gRLKw+yz6xnoDTjFte1xS36UW2+7l3iVu9OHP+ZjCCuhd6r4fGt3E9FOyq7rZmhkZvnyo17baEhEF5NvxlYW6vXTGw6vJzdQCVhs0sjJKmD9BNM/sFdPFI6wTLMUhYPJV2PuQDN13A7pcxq1LzQMU544QQQuvl4MSHnDU+JdSWyZZaCZDc6vH4N/eZ40UmBZtY4wn9Ci2kEITmSklDUuFNW58hNLrhUvdi+ofWWB67H7ojmVpzlj8dbIOiDVGJUUKzIOi2JzQX5QVfzcSN5jnWeYxAWaH4KaE4u/5PHghhMHRb+p93hheEsBxtB0h/1shZHMuzI+RtGJU7zUInF+9KGNpkiUEa0agoJF2YgSwmHH9sVe70SKlnFzi49AGtCcsVFiQNf/phOOO/wr1KhSse+u7EsyMOReXHrJ4Ck5/FQ1pXX+FWaDlx0bhcdnyKIEoea3ASlmtxdifsn/GIO2Uo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(376002)(346002)(396003)(136003)(39860400002)(366004)(66556008)(316002)(478600001)(186003)(6486002)(6916009)(9686003)(86362001)(33656002)(5660300002)(54906003)(26005)(6506007)(6666004)(6512007)(1076003)(52116002)(8936002)(41300700001)(38100700002)(33716001)(8676002)(44832011)(2906002)(38350700002)(4326008)(66946007)(4744005)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RwQicHB1r8xjHxmDc58lIukELyX/cRJXfs0HWsg1tnPcTj6sTa2PAZuQBgwJ?=
 =?us-ascii?Q?STJZuNDXR8hcTqSpEZ3ShyN9qzXu3Qw8lixNXQyL1VpXiqb2lvQzbmdYFQgn?=
 =?us-ascii?Q?d51LN8L9l6sw+ZChK8eaLWbgMrj5JstY42rhCGLjqTO0O0lMWL5ggUF/f7Df?=
 =?us-ascii?Q?jgsbHHt0UfzeSpVtW7qUGnCzFKFistaASzsSzWxeRV85PTHoicyyPYNYrXTN?=
 =?us-ascii?Q?vXEm17G6YGNlMeGdGUiXBJU3B4vgWpSgI2iCvjhzakxkZihkpu6f4iJotSoi?=
 =?us-ascii?Q?UWjSmG7JrKLi0XOUUrPdhZsXkkd+XryQqEjmU7CZDMGYFxfQ3JFpLJjDpUIr?=
 =?us-ascii?Q?PomEpdEr5bdOCsZG6WY8F5gT6YgQXkp9KgiyNVrChA8/cy1W9xly4Y4hlqXB?=
 =?us-ascii?Q?bV+T/b2Ly4Wyove8a6NTfzcyvkPuMRp/T2yv6pjlCzRTizWg6yLlg3qPtg9n?=
 =?us-ascii?Q?LUU6ENLY6o8Ia7dvW/NEZza4LjJ1lzQuyY1IhRlGdhSUAYbqC9PMqB6+yEaT?=
 =?us-ascii?Q?1VAZ4Lg/mZ3KzJ/jbXwUzOIP7+/yv7jiBK8EpX0wBsIZEdKbPJLGNrhl6uyM?=
 =?us-ascii?Q?TFC2teXfPz3hS/DDUy+91Y5ikZnHlX9AoLeDP0BOn2MTOcO1UUcgmKXWp/3M?=
 =?us-ascii?Q?141SUfaUOej59qf+s1IMgoVs/3vT+Khj2H2Fh5q4KQ0WOQDR3s2GaA3NS+Je?=
 =?us-ascii?Q?8m04sW2HPGXlngZL8KrEPG9lTL1VcAJ/yeQyf+sVHMW9A9HXwU57Qh3BO1yR?=
 =?us-ascii?Q?OVWDhz+NanVaO1NXy/bOhB/M64TPujwtmhn7K1A3b5grEhFz6BhL66VQf6FX?=
 =?us-ascii?Q?lGkfNoHc+Tvh/48YyKNDx9ZpWJQ6rliTtoeDLY6qfIVyrQQS5tomZiFk5lPo?=
 =?us-ascii?Q?ZqDlAqUnGJ8pRLrvet9QG02QTKvZ1pqmS6Uldu9pBadWjFrMNy2+OO9B2euE?=
 =?us-ascii?Q?b0N70rqRo74EZH6x8zJqo5NnZsXWeewwXuDBpdvciXGHZ4e3VwXapAOTiAer?=
 =?us-ascii?Q?KMsdzcOyiN7wAwB4LTExcKluvsqMgoAFeZzz6KdgQ0wWqGMgIV+etR9/j/qX?=
 =?us-ascii?Q?6hreggMDwRjZ8i4k8XJbD5bywiX9ou0fF1sMbbEOKq8LKA9MekebGO+brunn?=
 =?us-ascii?Q?ShNj4U6pbosXCfLZbrbZhx8MTvfGh4GYKTdplhtEPg4kRbJezflLmpDMKjBF?=
 =?us-ascii?Q?oNz+hRnRWieBIRNpY3S0plENWBYaFeOnVANYG3z8Yh3gDctn+LhJcOlEGrLs?=
 =?us-ascii?Q?KzmnqZegWU+tJ7c4FuTnIOceH/i8NfSIzdskTQ3XwHRfFoDLZWfJvcDl1mOp?=
 =?us-ascii?Q?6VPb5H0be24V43X6cVxCjJm/QImS5xVBeR+zYUW+shv+7n5j1w/vpbf0KFUb?=
 =?us-ascii?Q?xlq6Uw1r8QzDaIw3QTMQT6G5V8vRbHl4vCylsuoCdQvI5Jm1EhYfoWFVXBmF?=
 =?us-ascii?Q?h7yj86TMKvBsxDugEeD5kEHdbOLKmgDDwLJGIuyhLQDXtVPopGN3KvA5IMTI?=
 =?us-ascii?Q?IrzMU+wPbuiXGOSaG33Pn00zb36m8hdoGm6IpE/I+wmdB4hnDkI0xS7Qb4jp?=
 =?us-ascii?Q?BiyUQlKoNfixdRUaemnjAfB2XuYKJTpLhXusnosloLqkJd1YP44frXC3VZRE?=
 =?us-ascii?Q?FQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d3e2c24-2c14-4647-2c1d-08da55abb360
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2022 06:35:16.5258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 70ANNrXkWhLi/jsvwyLetPUjXXpFu6xIC4E0blYZ0RsYhd50DK04hrZLAm066q7+HO7905XInhUhMJKiIPnDIQn7ea0oOvuunk5klErwrhI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2918
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.883
 definitions=2022-06-24_04:2022-06-23,2022-06-24 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=690 suspectscore=0
 phishscore=0 malwarescore=0 mlxscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206240023
X-Proofpoint-ORIG-GUID: y_aQ-1rHHJ5XfspMmUo08XEI7jBLZivq
X-Proofpoint-GUID: y_aQ-1rHHJ5XfspMmUo08XEI7jBLZivq
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 24, 2022 at 06:17:31AM +0000, Herrenschmidt, Benjamin wrote:
> On Thu, 2022-06-23 at 09:43 +0300, Dan Carpenter wrote:
> > On Thu, Jun 23, 2022 at 01:41:49AM +0000, Neal Liu wrote:
> > > > The bug is that we should still enter this loop if "tx_len" is
> > > > zero.
> > > > 
> > > > After adding the "last" variable, then the "chunk >= 0" condition
> > > > is no longer
> > > > required but I left it for readability.
> > > > 
> > > 
> > > Use either "chunk >=0" or "last".
> > > I think the former is more simpler.
> > 
> > chunk >= 0 doesn't work.  last works but I think this way is more
> > readable.
> 
> Hrm... what is that driver ? I've missed it ... is the code lifted from
> aspeed-vhub ? If yes, should we instead make it a common code base ?
> And if there are bug fixes on one they might apply to the other as
> well...

No, I'm the person who introduced the bug so it's unique to this driver.

regards,
dan carpenter

