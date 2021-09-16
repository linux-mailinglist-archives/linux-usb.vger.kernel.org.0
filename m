Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D5C240D402
	for <lists+linux-usb@lfdr.de>; Thu, 16 Sep 2021 09:46:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231644AbhIPHru (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Sep 2021 03:47:50 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:22150 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229908AbhIPHrs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Sep 2021 03:47:48 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18G5RuYY019937;
        Thu, 16 Sep 2021 07:46:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type :
 content-transfer-encoding : in-reply-to : mime-version; s=corp-2021-07-09;
 bh=P/J5cg21WpfRiaRmDvL6HgNH/0oHD5HlsO/TstnZo4g=;
 b=acquziYiLCwFGx6YRb3i2fV8AG3SNhTv0iBCnaVwY0Jc0wzSBg4jmHXAiLEtSQsnNSsz
 UbDC/QSvKIn8UKF3dxE2Mj2+F0r/k8Yf5riSjVj3WGH2qvZAbF0J+gqCJwP4M3vtr0Fr
 QwwKLsd2caXV+Xz4rwTGpKjYeXs5dKjNuVp1Q0KpmQUA44MGdsX+tkf0UdG61CtsYjgC
 vF/L3ZW9VLuhmEilDDfb+3JeWBrFD8068Suc7f7Qd0vqrIm800aaQongcY2jXYh9Ce4X
 wQgtFc6v6VT/Nwum7+wlZW2A2/Z+0r36U5sQp1UN1O4xGdz9Tnp2CPUbmqMbZiJv9Us6 Vw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type :
 content-transfer-encoding : in-reply-to : mime-version; s=corp-2020-01-29;
 bh=P/J5cg21WpfRiaRmDvL6HgNH/0oHD5HlsO/TstnZo4g=;
 b=COyDKij4h/Ot6Filx2j+6809QP+0OohkGeF15UYWQUwi1rQWlpj1KJZQZPH0VcztFnhm
 l6QZKMrr02v+Tlnfxca+Ji1de8b93HMT86gXIOHFzcWUmWfx3lL9OBZMXhhpctWgNdHU
 Y8kp7wfXzIoX+I03yBaYAO/+u2JvLXYqQWjhLIq/C2oOByiNpFKqArY8qRR9kPoWPVEN
 xj7wT8fuvlG2uljt6U3+hTVSsf6WG/UalwkG0bnDNx5yXLQrCDVOSc0UJoPuk6cs54Gz
 yI4JWkyH9iF/CyxC3/WN+q+nLvcJIY+wo56HloI5R/KiAPTeSYrHmTuDftlKIAOGlcYx og== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 3b3tnhruqf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 16 Sep 2021 07:46:25 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18G7jhhH089026;
        Thu, 16 Sep 2021 07:46:24 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
        by userp3020.oracle.com with ESMTP id 3b167use42-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 16 Sep 2021 07:46:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A7zgWJYb9gjyq/rl5nW3vhuLLBwdGHUeeRgBqWBYDHB/irMmG5kG+BCL0/DKxpA9bEb6IFk/azNFhqzC9l8RfH3zBup/QDLXS+3j6lTUzQli+vXzkWSx/KnmpHcIVEJUfB/ET1z4Ot737TOwiIO9UxerVHcV9FjAn/9xmHwVVrTDsNTGmVNdrng4mmBNIBRANSUD0YlWrp6XtTyHg1+9NedrsfFyWYVXAiBCdFtvvNeF4AgNZH5mBtvitKEaMyNHxH37MsKF7gvBduvpMpa+SqBojpczASIbkxkq/tQVHM/dJQ9wTf2SLissbVLKrSUfc5puUJwn7dcY4I1FjEnyHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=AB6HF1GYzyiokgQUUMSvFSk9SdV9BmRRrQpMZG19N14=;
 b=odpufGA3QodsLs18UxfFWfl0bK1/vxpMDvXJ8niJo8H0BqDKfl/u6HArTgAXfYUSIIY09x92Vvf1sLnqYBm4cf6+XzQ45oTRauJZb6iFOgugm04I1hF+jVpFH4Toc3egDDTlH3sjq7IOegOuws4OCzuDOFPPvcJZlnE/2NXG9potooiM0gyyihfXmuq5EjTJ4l8ew4YTxHzIwPMXhuocvi89yk/p3Yv88Y5btbLy4jIrnVGZ6OrQ2I3EE+KfTAexX+AzcW5oiXj8mNPkxI0LViVvB1Z6/XXgm/4cpDUx6+phzsdC9HptDkVIO4+4xMaSMqali++ci4iJRQpFpI0wFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AB6HF1GYzyiokgQUUMSvFSk9SdV9BmRRrQpMZG19N14=;
 b=OxFfpRrRyQAeyXYnlWR+ZthVGMUmqifIis8qtETh+ytNrFdgi//Z9uZsXRcq2a5crwXZ0FRrWD2wIQ0Prw7jd6LLamtQqqxOja4TnLwGOjbejrIzPU1GQGKDjohl/JPmF344g4kbZVGRexeIlaebGEbJDLsXoLTCZhHrx3sz9jY=
Authentication-Results: wanadoo.fr; dkim=none (message not signed)
 header.d=none;wanadoo.fr; dmarc=none action=none header.from=oracle.com;
Received: from CY4PR1001MB2358.namprd10.prod.outlook.com
 (2603:10b6:910:4a::32) by CY4PR10MB1702.namprd10.prod.outlook.com
 (2603:10b6:910:b::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Thu, 16 Sep
 2021 07:46:22 +0000
Received: from CY4PR1001MB2358.namprd10.prod.outlook.com
 ([fe80::95b6:2084:3b1c:27ba]) by CY4PR1001MB2358.namprd10.prod.outlook.com
 ([fe80::95b6:2084:3b1c:27ba%7]) with mapi id 15.20.4523.014; Thu, 16 Sep 2021
 07:46:22 +0000
Date:   Thu, 16 Sep 2021 10:46:04 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Bin Liu <b-liu@ti.com>, Felipe Balbi <felipe.balbi@nokia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] usb: musb: tusb6010: uninitialized data in
 tusb_fifo_write_unaligned()
Message-ID: <20210916074604.GG2088@kadam>
References: <20210915103659.GB7060@kili>
 <e3ce24c3-477f-5a55-a89a-a0cdff564d8e@wanadoo.fr>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e3ce24c3-477f-5a55-a89a-a0cdff564d8e@wanadoo.fr>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNXP275CA0032.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:18::20)
 To CY4PR1001MB2358.namprd10.prod.outlook.com (2603:10b6:910:4a::32)
MIME-Version: 1.0
Received: from kadam (62.8.83.99) by JNXP275CA0032.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:18::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend Transport; Thu, 16 Sep 2021 07:46:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c5cae47-93ab-441f-5ab5-08d978e61389
X-MS-TrafficTypeDiagnostic: CY4PR10MB1702:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR10MB1702A45F35A45317CE161C8D8EDC9@CY4PR10MB1702.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:421;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0Wrcdob2iUoZR2yeewaOtxu+vDDCtl2WrN4d66Wb0apPr18l7qYHtRm9VYNvxYITWDjf2AtuCAYwXnhX9fQNH+2nNMZLwsd75EwEE9PJ5q6rfgScVckQ/XiD3irVUeW+FhYx4ZIEe9cOuUaDjhHlGmiV8caSu/9MBdxgX5tytbXzqnbBXi/B37HO/Iv9yNjelR0EYcolH97dWLeTMV64CM5TNUivQvmgZC7yKZdaK7lm0nCTWyG8hZLmHHfXti9qEDK+tjv8ihDYjXfcYFCaTQXj88jYZeJgzPL7c8LK4nfJ5TWsErznVTeHrX3YiPfzMaMvIx6iJeAqq/bTvZ1aWczI1S/8zUbQlaLiPvDJSvX5AuEIZCK3as+iTS90UlVYckAS19ynHIMMmx5C6jKClIKvgCgM1TlJmWMGhqQxpflncw7ZBkX5jap/jLfifhTa1eysvOdW6G4LjuwEz/PqaPySxz8t1IiJcAncF0WRR49QkOtI99OV2EcDDN5ugzrlKfUwnMG6vNKzxnbbXmRw7uFrAdkjWAhtn2rzS55AL4Ag+BEjW5XMhY/1rviESV60qpk7C/82t9R+H6ZjEhPZ4aW2nPFVBu6s3kCDwBVHj+LVxeeW+9ydgjjqR2m3F3Eilga83sP6hqhBvGVDRw1wrcDdi0lsfbiLzHcIedLPqXQiPAMbx9nYu5rnaoCt8zNmoO6z3yeg29Xp5/J8hJFeKw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR1001MB2358.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(366004)(136003)(39860400002)(376002)(316002)(8936002)(66946007)(66556008)(9686003)(55016002)(86362001)(6496006)(52116002)(4744005)(54906003)(9576002)(66476007)(1076003)(33656002)(2906002)(6666004)(956004)(8676002)(38350700002)(38100700002)(186003)(26005)(5660300002)(4326008)(33716001)(44832011)(6916009)(66574015)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?yqNuLgaQ8se8Pu3LTJds+edGLmOD6TTnh8XaFrMeNr7c79hLZ+vnGNxqNU?=
 =?iso-8859-1?Q?b92gHg01K43Me5Og/uOufRlWS9f8nYiKJndvd1LePrTbqzidU2LhQRlnBM?=
 =?iso-8859-1?Q?Mnbnu6v2B4n8/RkF/Y9gs9hBj6LYoSQ22xC0Uh7qDPRHDG4wVkoKxF7LxN?=
 =?iso-8859-1?Q?WLwKARoN48pq4pPNO66hxZGprIZz5JvTpDrEYxGjarM2KGTPQCGkyzECwe?=
 =?iso-8859-1?Q?o+fw8t2hZImjb2nFly+1HJUPYnLjEStqSgeiamQdfsQfqyLU2y6HGU7rs1?=
 =?iso-8859-1?Q?Z5L0uhXBna8bEeT2UG9WudepNMD8DihRSSIWqG5l/nDUNBMgm0hWZVY4n5?=
 =?iso-8859-1?Q?O1Ic70LSVOjlXKiQpbg0OxVKF4YvaojHWJH3KZ7HGFwj1tqgvC6dmA9JWm?=
 =?iso-8859-1?Q?0GPUQtUX3YO3fadpk5gw2Z7mxBmB+FIhGFH8gUgxgMh7r6Z6bxG9EDeKDL?=
 =?iso-8859-1?Q?/hdxoB00AqAhQ62XSoV+Qr2eBJ6GmBk+PQCWkxIjAkbuXUEa4YK9RAJOhH?=
 =?iso-8859-1?Q?e2ZydvYffi0gMLjqqk/TEWeSo/eRXBTfgKO6LqNSqkyyKHFKK/6CybCyD1?=
 =?iso-8859-1?Q?+SK7GhR2sn1f1J7XlHq+oXpoeJ2V6W498m/wKwHx0ufAEZ7pTPE+5jzeqI?=
 =?iso-8859-1?Q?VcrVeLIb4JccBDlIvlHLReh7pXfik6af+Coniv8dlGJSC3rCNpfgkdL0QY?=
 =?iso-8859-1?Q?j2YyoZRuUMQnT0wepeXR6alZ+QitA0fGJI6ioilBBz095ylC5JZWQNAvY8?=
 =?iso-8859-1?Q?e2MoSbUSvKkP/UHxhfHQ0x4RR1Vtw85tnGNX+3PsbjOW4wBcdlAWf07Ybj?=
 =?iso-8859-1?Q?LBPAAjDm3LC7ytRgsjPvQ20s6CqWP/Q1IeoLlp1DYZb/MGEvP3HlXxRmGm?=
 =?iso-8859-1?Q?D9mmtPz01lqUwt34EYvoUlmqcmH2AAYFbOq9MxT4lSbRTRgt0J3AjzdPwm?=
 =?iso-8859-1?Q?2qP6OmrSzMkSnu4nSiESP13aMG4kM7KcjgUsOGQqL+RvZqSX9jXpYoTFYw?=
 =?iso-8859-1?Q?QtX5ArRyeAVGnygOn408QH31FL9SCMKkzXREZo/W6fRHf6TCPdrlgFN3Gm?=
 =?iso-8859-1?Q?8UJEciukhqqIhEMnQvz3hXqXrKGBSv43WRdPeiTfzSroYQfuCi+cNakWij?=
 =?iso-8859-1?Q?V1sIJhonzOhodI/IXUjF7fTpb0Y/fgmod+K21nyFrk5KFBKsMlAJc2jA3Q?=
 =?iso-8859-1?Q?xPUhvadqNhquEMCTf6bbMmZ8sXm8NliSRPE6F+78sBnmJMCGm/S6eXqdmR?=
 =?iso-8859-1?Q?O+nNuuozABgFNESDUfZJZAAxG+YEa8BXDr1sF3yVT4Bv+d3mZGbDz+2GBH?=
 =?iso-8859-1?Q?8vOHXffIgq7jPvToufM5wbnbcUryUQOduuJkgQAylhja+fk65jwKuvhnYL?=
 =?iso-8859-1?Q?6rGYk2WJbC?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c5cae47-93ab-441f-5ab5-08d978e61389
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1001MB2358.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 07:46:22.3181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jAP4gzHwEFPZwBlcKQe32904gEIIEr7lQw619VyGZ8caxQjDSWemREEhtweqZokZjdre7Kbji7sydY2vvOQxSTPrBrgjj/L1V3r0abGFbN8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1702
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10108 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109160049
X-Proofpoint-GUID: ykDM8bGuT5rueuOMi6YQzAEYp9hHyNhV
X-Proofpoint-ORIG-GUID: ykDM8bGuT5rueuOMi6YQzAEYp9hHyNhV
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 15, 2021 at 07:49:40PM +0200, Christophe JAILLET wrote:
> Le 15/09/2021 à 12:36, Dan Carpenter a écrit :
> > This is writing to the first 1 - 3 bytes of "len" and then writing all
> > four bytes to musb_writel().  The last byte is always going to be
> > garbage.  Zero out the last bytes instead.
> > 
> > Fixes: 550a7375fe72 ("USB: Add MUSB and TUSB support")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >   drivers/usb/musb/tusb6010.c | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/usb/musb/tusb6010.c b/drivers/usb/musb/tusb6010.c
> > index c42937692207..c510fb84faa6 100644
> > --- a/drivers/usb/musb/tusb6010.c
> > +++ b/drivers/usb/musb/tusb6010.c
> > @@ -190,6 +190,7 @@ tusb_fifo_write_unaligned(void __iomem *fifo, const u8 *buf, u16 len)
> >   	}
> >   	if (len > 0) {
> >   		/* Write the rest 1 - 3 bytes to FIFO */
> > +		len = 0;
> 
> +		val = 0;
> ?

Wow.  Duh!  My goodness...

Thanks for catching that.

regards,
dan carpenter

