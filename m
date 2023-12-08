Return-Path: <linux-usb+bounces-3921-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E16D80AAF2
	for <lists+linux-usb@lfdr.de>; Fri,  8 Dec 2023 18:40:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DEFFA1F21133
	for <lists+linux-usb@lfdr.de>; Fri,  8 Dec 2023 17:40:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB39F3A268;
	Fri,  8 Dec 2023 17:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Fqo8zjcp";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Mc3imFSw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EAD310EB
	for <linux-usb@vger.kernel.org>; Fri,  8 Dec 2023 09:39:58 -0800 (PST)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B8Gf2DW009403;
	Fri, 8 Dec 2023 17:39:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : message-id : references : date : in-reply-to : content-type :
 mime-version; s=corp-2023-11-20;
 bh=w1Sw62gy9gpTWmxltG+IDcZxaZkEWkzF2oFHQU+U/i0=;
 b=Fqo8zjcpxbdEPKpfcRnx6gkvJW0rcIDF5FoFqXtBAmmlACtlW2bBIN9N/CKcid/n/5v/
 zDsL0EIpBXwtXIJZloV9Fsdq51qVPwTMWS6rgPbL6GLiMM8z874HwqtMA2d6YgTO36y+
 9ShnOLMunEvDnaauGywwQ3bWCfIoAobi7eoA81cXx6dELf0RRweAQg69w5aGQ46LXrIC
 F+nIDfIjOdG6Xvt8KOq9Yytm1SbQuWAs/SDnWBWO4JLKFLSxAmmkurmP9QKixdMo1FcX
 nLjpPahuWCTnskALkdpJvixndiaFvpmiFCcnEfFWmR93iSFIqDCrCUUIoDPaMQ61D/aD qA== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3utd0hpdcb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 08 Dec 2023 17:39:45 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 3B8HUmI1040365;
	Fri, 8 Dec 2023 17:39:43 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3utanf70wr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 08 Dec 2023 17:39:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XjBimayysJ6n9gEXPiiwfpeX6zi499CIUYW2WU4TRB3gsF1JKPoxv0HZ/ojHxjFb9uBP/mm5Fb2GELOO40XFKgMa+1dolxZH6j/NrSQKQeO1mehN9GZiycHhX0cxearvotJ4PZy7lF3jyhoYf80Macxu/EwckF0g3ghwvtAzsZ4r/p0pkVRXwliPQosy4dn4VO/PcRon/FMsi+aT/qbGef30c6qriu8ZKjImbJmwShn6kKsYlWMZ5CFDQUU1fpQ29LBPEP0DCsH+gZmwKfhrs62lP3KtuYcsZWDIOm4AF1UNjESxbaI75Nc7N1wA53Ps016LinfnLrgynftjoMEOIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w1Sw62gy9gpTWmxltG+IDcZxaZkEWkzF2oFHQU+U/i0=;
 b=Ou9LFACf2/WnVjJbEPWbUfmKMgC2oZNDEr1jZPUmVA+zu6dWJEdV/vyqYOwnQbLATZCutuIr30Mkla2kr287dVLkAMlJgl2FwZ0+jA2RCXHshx6T2KJmjbQaQPn/Tb5EmUhqR3F0YyOpIJ30Dl45D4TcgbirHXlU1KWpQCjnordNt+Ugtf0/BGavygYmHpMhT0/06wN6x7Jy6K4dc5BnoUv6Xa0FV4ka1rl74F6a2d7d7AcaKl8ZQ4hqpuCfJXnlBJOEo7a5YCgj0KUaCIggDN1jtTGAkuBJBwAM61DnM3e++DwZo7oy9h72zBk642uq8eABG4WOGj7Ma6zzT2gs4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w1Sw62gy9gpTWmxltG+IDcZxaZkEWkzF2oFHQU+U/i0=;
 b=Mc3imFSwVQytLSn5IsZOdQjGCSJ27gT14lVCiJ70+dRFqsNNtVULcaqsGcmvDgkX5yoxIJhtcHFz2kSiR5hbj3FaJApjyKAXF2v3ZBoqqDCBHmt9uxbSC7JZk4WMqjYy4WI5bNbTECopqtM0UmLKAEhU3rAoqgIYyJONoItsiYQ=
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by SJ2PR10MB7707.namprd10.prod.outlook.com (2603:10b6:a03:578::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Fri, 8 Dec
 2023 17:39:41 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::2b0c:62b3:f9a9:5972]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::2b0c:62b3:f9a9:5972%3]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 17:39:41 +0000
To: Tasos Sahanidis <tasos@tasossah.com>
Cc: linux-usb@vger.kernel.org, stern@rowland.harvard.edu,
        gregkh@linuxfoundation.org, martin.petersen@oracle.com
Subject: Re: [PATCH] usb-storage: Add quirk for incorrect WP on Kingston DT
 Ultimate 3.0 G3
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1zfykk3rx.fsf@ca-mkp.ca.oracle.com>
References: <20231207134441.298131-1-tasos@tasossah.com>
Date: Fri, 08 Dec 2023 12:39:39 -0500
In-Reply-To: <20231207134441.298131-1-tasos@tasossah.com> (Tasos Sahanidis's
	message of "Thu, 7 Dec 2023 15:44:41 +0200")
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0021.namprd04.prod.outlook.com
 (2603:10b6:a03:40::34) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB4759:EE_|SJ2PR10MB7707:EE_
X-MS-Office365-Filtering-Correlation-Id: 24ed8885-3085-4c6c-25d3-08dbf814a897
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zQPgJFLSY8OUijAfIOZj9+q5K2Tjq2grjSwqQQW3La/ZdW9+QECCjlL+KL1O5t6IpdV/1VlTdhzy4QTY3hCIkLiy4k2LuSNAOa6B+6KRV2hdpGWBlAVRXBJTp0bobogSxYe3lMk1puk5aJouJOuJRsfX9P7ndcFF2r6mZvj0lLsGwMzWxyLQc52jl40q+raoj9MdmI+vxuDWwEeUA0/3WbFGE5StxL74Ge3smzqlr8lmpnHD/lX76P/sS/UoDkBjS4DVSqnjeOI2lmfFuwxrBJP+equ/NyDdosU0GCTQo/DQ1mIuxagh9yrZedjDjBxVsymnAVE/MpOvLxHPHd5Nf+9Jr9FamlwZNIFRoPgqgGhuRMLPF/zlNn6YySOJYDMbT/slw6WnFGH3tx5wXbhyxHMPSNGM07OTF+D2VNyPi+otmtpaKgZ45ZxgTsJR84drgJGp8fnoEfmKHFaS2914AVNBhj0hpX+S2tbNlfVJPBhJ4bVbZHpJqtnFSfjcAI8QLHi+dXBEjlv+1RAg+p4dnMXzFRdFhtFtUAoWRIr6oK1ptH8/8B9E66mNkUq4Mmxd
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4759.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(376002)(39860400002)(346002)(366004)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(4744005)(5660300002)(2906002)(41300700001)(38100700002)(86362001)(66946007)(107886003)(26005)(6512007)(478600001)(66476007)(8936002)(6506007)(36916002)(83380400001)(6486002)(66556008)(8676002)(4326008)(316002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gJfZ3tthO8lwya5OhVYItqFg8MahxTqrGVnJ3XBr+fuN9IHhY9LTqtEsHHdz?=
 =?us-ascii?Q?mc4LiYdegC9rQWv+lKJwcmTNsKhfr6pzeSzR9ItdEkRTwWwn7vBBKAgyy42P?=
 =?us-ascii?Q?zoft0qCuZFEDGnc+Ebk+WFhOJoWAQZ2mZZJd6yAuqduYIC0ggkSHlxTAjooY?=
 =?us-ascii?Q?nxNjJ/CrD9RJi3vdK1JvygK/Hu8TVENNXVLU/qD3zq4Kkvj8P/xb09Ly1uUh?=
 =?us-ascii?Q?xHV5NNQ9LNECMYRuw+zd3dBxGPrYacfzhIYWarOiJVunx/zaZ3+MZcwvmyVJ?=
 =?us-ascii?Q?HjrJQTOjZy5ww4eF0F3xXJ/K5ko5WJaHEsJ45Uhv8DFnkGt8YRDttPw5Sqjp?=
 =?us-ascii?Q?x8qLEVyUabTbRTHM23xE5FEnjqzhjYRvcsFtIL5Mg3U5Wsi58/ONWFV+OaOY?=
 =?us-ascii?Q?6nkLCa6fKood7RQ7mDD5L4bQcxY0bTbGYEflorEcZpKI2kF3k2pZOMF1hH4u?=
 =?us-ascii?Q?t4Pd0O1VsoTSqQLx3/84eGRQlCTGpjPR2/46q+13/yLW2wDIplxB6bxmIwze?=
 =?us-ascii?Q?7W0TJbBTfmgbIj0FLc16mdW8NzT9S+WGC9QgZGmzxmG4kFlsH2NKjq65ke+r?=
 =?us-ascii?Q?MwPZy0VrkGl+B1n9SG2GpjqcFz/IBdXzAxRu9gHv31ST5Ht/TE8Z5YdYgiAj?=
 =?us-ascii?Q?Z0CpCAPzHBE2DyDrcPUt2N4FDWCLwqpwfWHbKzGJ8rNzyMrfP3CuQi36wVjB?=
 =?us-ascii?Q?xgXmuQyqaatkg/d8j8twVrq6M9CmSElM5cFynLgOXKYmUzO4rF/6LZ5tMZv4?=
 =?us-ascii?Q?Jc6VXLXzdDhaGu8X503+xKZfKZiQ+I/9yOSOvURq+wtiBzxVWP+H1GG3A856?=
 =?us-ascii?Q?Y6MEJL5Z9VQcGKEgjS7IwpF5478Y5m/i1I1Dn8D7+E0uAFm8Oamk+1Tnp/5M?=
 =?us-ascii?Q?IihEwdLI/FUyXzbCJuLPsOGAvWWPTe4e6GbMINTtDMmOJ5sml8o4kt+hrBzc?=
 =?us-ascii?Q?NnO6CwQlSteNt+vg4igfGvobBTgEDpe+6KCnB00gYbiyP0gU/g+/tRvpUls6?=
 =?us-ascii?Q?h/bat39aV8jskRbht0J0TPILazNn3tG8RHBJdxqoCdJ4b8WxXnNafvnKgTQb?=
 =?us-ascii?Q?8Cxj+A5TyU7a6sOJCGJE6yG4ZnhfuCkGzVikHblhJl2Rnt4ceMP63gjZeu/V?=
 =?us-ascii?Q?wEzzlkV/z45O3YchIFDDwG48SLYFfAorHXULi8XBYEOJTcBK+fCFwQywpJ3E?=
 =?us-ascii?Q?3S1mrwJXF4lZ1OKqhwfzaG/ldQJELAcO7Ku63IqgDyGQA37y7br0YaQH1Szq?=
 =?us-ascii?Q?S4jTv15S/B7iVggjYiz9ereuxeaeETb4SOT5ReMfBsh4kzHEU9V4fzQLqFPm?=
 =?us-ascii?Q?SjQ5sjvseDlCZ6fdHkmhM1TID4xUy4icdPWLa/Zu7stRrOkabk1uKpesK4n0?=
 =?us-ascii?Q?JT9a7QUrf2gqVDQH5t8chGIycurawvYX42GdrTLya6bREm8BTSVQ6utYLPvl?=
 =?us-ascii?Q?sKnEiejCdqDAhwiLfURXL20i9tAgG2nyrKOsImmRTvd9s3ElCFCPVZOZcJAR?=
 =?us-ascii?Q?VlEETKVtiQNIw83bSHww2HN8jFke1tQ8MsiAca8qI/xVvKddZPWPXLvYtFNa?=
 =?us-ascii?Q?CU78wbe1A9bpCd8o/giSH9416vzD4ZEbFek/cjUoJyu3EcG+l/N32c7MylSu?=
 =?us-ascii?Q?Iw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	Mkj5zFju1XglJvPeHumTSiMbS6cJUYjEXiU73yzt6dSbze+9ocCkF/KiVfFo6rn5oDBlBlvXMuj6Q4l2NSjYYkk8t26txBvrQjqz2T2CuUQUI43R7xEXXeN8cTq47PLaclIDInkOVGTek7XoSlxmO+BdoW4N0EQGqLHZRk3Q3wm4EcFRyj0UswV9saQYw3lp565LH1sniNMrcDl9oX3gQyOmRmNwNBOX73cNDUTpuaPd/xilq6UZ6e2qjwftivlaACL0hgNCbhyGlMhQgx9hjgwSpgShfKLl7cSMURspIIF4Vt0TZj+J/Rk6CCUs/YA9+GBSy4x19XUULsazlL1KOQXln1+/AwsEnmL6zHA2wTSu/9PB0Bi8+B1K6R0VExbw8Cl0Vkonk3ezsJEl9Whke4+Gci88EAqoR/rUL/ttEp789QS0yxcUezSwF0e8syQk51hawAA1z4PezPeidAiJNJ9MZXg9PqFcEFweOFODFrb2ai/YmdKjdEvMaKbp/tq3wen254E7rxKAArEDyEwinmMayJUo8qeWhmHiyZppj9QY7QXDRi3sWMZSmtBwwzbIA8iIPg/EUSENFqa2HHaHKWoIP9PusvAoswl8Gine9cA2N/ENXbCiFqSnRjIGHZ6Prk36jqEMV3Z9jvsEwOnog/dLtHSCAstb2bJ7Ni9koAjTx119ZWcfNLoNHkVBVHqm06qh0T1i0+1g5aAAqC/Qxu4bI3E/x82NFSp2lYNoORWjaYWbg8WFBwICSMw2BwFT6kgtPu8vg68IeNddmgHkgafnny2hM7XEbvIpodKBQHqA/KbdBkWvaFlhg3qhsY5h6tWmFoxVQ1DEMxJeQ8oTteQmI2IIJOk7qdiQcWhE/aA1o7gtcvY5dDDEpQTEk26fnnQ/aZX8OT6GboZPrV6s5A==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24ed8885-3085-4c6c-25d3-08dbf814a897
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 17:39:41.5787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4GlHxBtU7h8VaeJ37XHjjFM/a/24exQOdoaMSKyf4osjZqGeLkAiVXdp9Rk05mIPHPT/1DZkutZh8FoltgsbXa40bwZlJ27KioZYfvLBpLU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7707
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-08_11,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 malwarescore=0
 bulkscore=0 mlxlogscore=881 phishscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2312080146
X-Proofpoint-GUID: utAQlnPnLV59kYqHprth_w5BT2U-fOCZ
X-Proofpoint-ORIG-GUID: utAQlnPnLV59kYqHprth_w5BT2U-fOCZ


Tasos,

> This flash drive reports write protect during the first mode sense.
>
> In the past this was not an issue as the kernel called revalidate twice,
> thus asking the device for its write protect status twice, with write
> protect being disabled in the second mode sense.
>
> However, since commit 1e029397d12f ("scsi: sd: Reorganize DIF/DIX code to
> avoid calling revalidate twice") that is no longer the case, thus the
> device shows up read only.
>
> [490891.289495] sd 12:0:0:0: [sdl] Write Protect is on
> [490891.289497] sd 12:0:0:0: [sdl] Mode Sense: 2b 00 80 08
>
> This does not appear to be a timing issue, as enabling the usbcore quirk
> USB_QUIRK_DELAY_INIT has no effect on write protect.

That's very interesting. I received a couple of reports about USB
devices from other vendors that had a similar problems with WP but I
always assumed it to be a timing issue.

Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>

-- 
Martin K. Petersen	Oracle Linux Engineering

