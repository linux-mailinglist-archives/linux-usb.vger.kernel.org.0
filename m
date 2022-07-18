Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6BB75780E2
	for <lists+linux-usb@lfdr.de>; Mon, 18 Jul 2022 13:35:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234212AbiGRLf5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Jul 2022 07:35:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232158AbiGRLfz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 18 Jul 2022 07:35:55 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DAC8DF24
        for <linux-usb@vger.kernel.org>; Mon, 18 Jul 2022 04:35:54 -0700 (PDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26IB40QB024899;
        Mon, 18 Jul 2022 11:35:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=OoYJG1pjRUvR6XnwtMU1qJJE/qTi2GZluGLe/6YOybU=;
 b=Rwv7ejtP+piPGFlIgJpz7HyOpZ+uuwo+iK4AP9KX7pXTEejJFiHjlAG5pqqgjYKlcwjO
 xb6b0ABYnT/Y+Y/NlEwSz0HVFjJdYsjv+LRxl90g5+bHnx4ykBk2ay4IuaKtCvMIVwe4
 5XaXRvrrCIs9dwYrhkmQXzNcEgy5S0/y7gtwWWD0gxxUL6+ysRl04SoLPcuDHzl//V5u
 iWwKds4VlXrg0JlfYJ+xdmkj2fWZSZcC8L+wtPbt8Ntg/3AUS5Nr55/sdQeKz14ajAHt
 usXdftSgJ6PvE1NB2lkkFhi7/xw31hkbuOlp6aAkAYZTD4TKQcH03i6KUZMmZMmRn7mq jg== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hbm42b0c4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 18 Jul 2022 11:35:49 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 26IBY06F027924;
        Mon, 18 Jul 2022 11:35:48 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3hc1ma62ed-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 18 Jul 2022 11:35:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lMGPQl1oxgklGrFC2rmdNnv3Mqb+dbfiBwjE7eMZ7rpI+F7oKxZDjMREZOhj5cWTTl7BXwaI1ASUZEhjCPJ1N8gbzun1jzbzyQFLsFpHlC5yC++nnhg6nQVlDmySkv1mqubL9PYFjdQuC3ep/PXluii44UOhpwal94dTOxc+J3DC2FayJXMwlW8N5GFmilRfJuFolVsObvvi0R9PoCRhIHcEmmZbYHD8TaCefdS79gvCw4NxQAkkUTOb6x2zD3PUPOEqGimK4gwczmaB3RhpVIqB0cADx+FNRwVctZB3FahrVExYDmMIeFYE+NTnZzUTYq/d1KQle/WXEqPJOhEfWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OoYJG1pjRUvR6XnwtMU1qJJE/qTi2GZluGLe/6YOybU=;
 b=GDjXGhWXIHHVHYXPXvse96VRf6dY6ll16ETlsynSpcsU69F1NFam/KuxEbefLUjxwM2t480WEGvl+FeLuZ44hGULVmbVXL5aBR0iXsjn7gAzFWXUvoJTB+80TshRWl/ciqX9Kpj48Bu5dmDOee1xWRzuTOxslv8oXxEuz+pirNVAczUXw3k/SMk+bOQKSxcMVf3qmM2gVpNHlibeyNTM7azobRlvOgIYlJMFM4+bG2dcrgFsCNdK4NmygTXvFYITrIS1yde5IC2iRW/XeRmm3ce5SR0fO5ZqAvb7Zwdd3XQWgMJjuLADvLC2tO9POcc1KGHBy5WPemMS6p8GelpUPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OoYJG1pjRUvR6XnwtMU1qJJE/qTi2GZluGLe/6YOybU=;
 b=xGiW1Ma18C9XK2s4lkyarDfhDNFQ0iUrT0LfALsygvew5Uh1f1WLduDz4EOh8LlZ4LNQ4BVYQje/D4yNH7872gSfCYPLKNGSN79SW9CdvFVg2+jLR9QfFcmQobUEnGP2XcqW3yZ+jtWz7G2NLyjwt69pZ7G5m5eDTGO6JX4qmpU=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CY4PR10MB1622.namprd10.prod.outlook.com
 (2603:10b6:910:8::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Mon, 18 Jul
 2022 11:35:46 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 11:35:46 +0000
Date:   Mon, 18 Jul 2022 14:35:24 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     kbuild@lists.01.org, Xin Ji <xji@analogixsemi.com>
Cc:     lkp@intel.com, kbuild-all@lists.01.org, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [usb:usb-testing 43/55] drivers/usb/typec/anx7411.c:387
 anx7411_register_partner() warn: passing zero to 'PTR_ERR'
Message-ID: <202207171059.zvoL5dcM-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0044.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4e::21)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c791255-01f1-4d32-0bb6-08da68b1a7e0
X-MS-TrafficTypeDiagnostic: CY4PR10MB1622:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sVSPPXiAw+g/lhoh0Hy60sT4eCXR1e9i/AO/mjnKNhsVvqBtMfLhj2fDs9fsGwOP/gYOWqjlevyBkGBep1Do+fkpgJKl+H8mOkrPLYRGwwHXGWHG5htSRyOUfT7DbgA4Z683aOGdVpfy8d2HLqK1EIKmMVsbYfDJ/Uak9g6rdldVvekp7BfZ57p8NJBvJuQCWEy6odSqurXnz5f2o5tsoFQQGwQmm1N9XOnbz1nBOapMOw4HRKf1mOVre6ekwTPwTIEN7bdpdjQACEPNzPI+XOcZXM50R5lGEt1KGXO/dEd801/KtzfTVFq1st92oKKKmATm7KDvakEbQLjPgPsnaE8j8hqsRzsxg6WKEPLAtJctCS5+7gevve2sN16UrjWyORHUlAHeNazAWV/lVBzs9z1f87fYuQdfS6CVLBHELUAhPMIllVF0q5PexED+nolFn4ByQVi0K1HNg/Bu252yiPx864QqpP+idi/9DqzFrPrkNKTp0boNQMaGk3wf3+ybxeXBeqkyMBfiIRv2NR7FccaQ9lv+IfhxPQgfRjSZ5LA+fKfMNO86Qci2WtnhYSNLn22az6mcMq6e6IcRS3zYliteCNm+c75vSsiQLO0PsvdD45sSvkY5eiO5LFwpSSCef6kisuwjgNFJViT9h+KM3gNQfs5m/VLnK6BFtR63UwgDvx3hoVI5C90gietEDEcYWFOR7jyTafOgwpHdweF40P2X3IuaYAZCeQfQVGFerOHXuhZpLWumXHPZkifNLIdW0LyRSnAtTW3LREfpop68jTbhwBBK8J/njPGjx6VKBoQsLN7r3JgajWtt4Q6CHBPZM/HKNvpCwcUShH6Lh9P4MP8FFX7YLrvVBL1/8A4p4d7BBaHHTJySEjDyc4ZgXHyuLcL3SuTJt9mqEL0wG9NxHQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(136003)(396003)(376002)(366004)(346002)(41300700001)(966005)(478600001)(86362001)(52116002)(6486002)(186003)(6666004)(6506007)(9686003)(1076003)(26005)(66556008)(66946007)(38350700002)(38100700002)(83380400001)(6512007)(8936002)(44832011)(36756003)(2906002)(6916009)(8676002)(4326008)(316002)(5660300002)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/EU+qV+tznpPBs0prLaWIeSF7HFAjYla32pgMowBjQG4gaD4d2FHPQUjicFa?=
 =?us-ascii?Q?RgsNEUD4Sc84SNT0rqpEr87n0aTrWuc+9JAGIqXVKZPgt8Qnqw8h8f2prKvR?=
 =?us-ascii?Q?QU1CR0vWiWBFIj1VxvacSjjgTQmcPvEB7WdkWWg8itcOaan0rmKgCmqiipl+?=
 =?us-ascii?Q?uDbn7DNz9I7jP5tAFPs7EPEp5+HlSbmofXCCT2KJo9WmiAZBJYLzPJLDQffX?=
 =?us-ascii?Q?ABnOYsToH2vUzuoYnBk5eRzq9wIZrsK6ruGwLFVdY7B2aWonNgLen5oxtj6e?=
 =?us-ascii?Q?jygIgBRN0///kVGYMiWb3KVQpP7cXG7HC3R+r+ctFST/vuzWj3e9vqrcYfst?=
 =?us-ascii?Q?EaEU9hDHGyIsA7fcJbsxUD2ry1rwndwU0ZOObaIEezA7ke4G2ywutV8MJS2p?=
 =?us-ascii?Q?9WXnUCvdkMjNVHgLQeBFBVS/DdpJ7eUsk/yW3sgdMl/69W9g+nnX2tAQUnKF?=
 =?us-ascii?Q?ZbemxQceo9UBizo8EuZmn1NxkzBD3aLgPskZCl7bbWHvh8rQag6MpPkZUsSz?=
 =?us-ascii?Q?Epn8e6R0hE3D6stnebAUFpf5qGupAUVKL3DeihmQOhdzPw2FkTgMNYbe28kf?=
 =?us-ascii?Q?YUa5+ASvf7i7eO+YiCdwPR+MG98rUb09eDtVVEHwExohULWMwovED12S+yFY?=
 =?us-ascii?Q?UCqjvHUj7W5wKPagvKDW9LrZ5fE1/Hr8ng4O5IyQ8ZkjowlyEA3V3DhOYVpj?=
 =?us-ascii?Q?pXGpkh7P3hd2iajU0caBNlZ9iK0g207Wbx1rglCkZ4uiXpK4EE+ARGhPqPaY?=
 =?us-ascii?Q?z2PqVQbQ1H6HS9W6nNRcgOBpK1UR4RSEnyRn1Y4N748H8AIo82KYEUAsxJvS?=
 =?us-ascii?Q?Og2AcLgKgIhT1gtpvsZmcJ3l8XeyHPK2fDtkQVQlXpJfHRQQJJSXie0YsEAl?=
 =?us-ascii?Q?+lDRYMlJmp2YYaoBZLhEBX31dPBsNOaQqF8RJ1vIYNcePAcZtJPc1CA9xayB?=
 =?us-ascii?Q?suzKMmeABL1hwVhwb+7k5AOsT5bCk634psVhNskXhkbNfZl67Rl/7vCZVANI?=
 =?us-ascii?Q?upkOHbC/FO8mjBrciUGSq9eUQ9vwQ6rS/J6nIdraBUKutW1vy13tcXoF4fq3?=
 =?us-ascii?Q?RbRfy7LwmtxSBw9b1al3+v8L8dpM2imyVV8PZh7EPygfqhTpptJPW/mLjAEt?=
 =?us-ascii?Q?uBTA5qQosd5LiWmTrvHRWQ7UVj5LhNu3UmTG9i/FBFIi2lYXQ8dS1qJ0BBdf?=
 =?us-ascii?Q?M+WqFJF1LFVz6+lIunxvMbWD+Ckf+tUh10YbNYcqejIrzSMIyHzBiWyt0jue?=
 =?us-ascii?Q?OY95RaonggsTeRmMhoezyWeESy5g0P6NgDlbkuDISW0PvOyVW7W9M84h4lw0?=
 =?us-ascii?Q?BkAbADAZEnBCL7H7UWVR0XADyYxJM4aJ38Arbh/6hf/VsG8tjaoxX/VwufR8?=
 =?us-ascii?Q?scB9NGOieGMF0kPBuFy/JdBda16GjmS1jSPBIBR9ZbrdOLFaQHpcPRHQFiY2?=
 =?us-ascii?Q?WSMKtBEhNEofjij2kTv+YEOtGTy3iZnMYvxv7cJHyiaMJITKjzUPy1YYqbJo?=
 =?us-ascii?Q?YS8LafpBVu0BjwYbu3680sTeGZSRxYuW6xpfPIJm1iyp759f3qVi48jcaid5?=
 =?us-ascii?Q?XtSU+d5xG/NPO9FYOjPXWrEccbKPf0pRx32Lc/swG3GFiV4Kp77uE48JIG6t?=
 =?us-ascii?Q?mw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c791255-01f1-4d32-0bb6-08da68b1a7e0
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 11:35:46.6168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OfHhNywmCLuB0NYbKs6KmT7rVDd00mUuzoQ3uq7i7Dvpn2kV6/4aJiTYLEVvhzBccqlr6rs+53uveZxQCXdfI7YwuAmFocUEVN0fKonG4z8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1622
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-18_10,2022-07-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 spamscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207180049
X-Proofpoint-ORIG-GUID: Qs7NVNocbErsOZTyh0uCeXFgs-0Fhk8L
X-Proofpoint-GUID: Qs7NVNocbErsOZTyh0uCeXFgs-0Fhk8L
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
head:   c76d09da77d69d7f737540985912ad2bca654713
commit: fe6d8a9c8e6456f8e7ba6b4ee528460beaf65a71 [43/55] usb: typec: anx7411: Add Analogix PD ANX7411 support
config: xtensa-randconfig-m041-20220715 (https://download.01.org/0day-ci/archive/20220717/202207171059.zvoL5dcM-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/usb/typec/anx7411.c:387 anx7411_register_partner() warn: passing zero to 'PTR_ERR'
drivers/usb/typec/anx7411.c:573 anx7411_typec_register_altmode() warn: passing a valid pointer to 'PTR_ERR'
drivers/usb/typec/anx7411.c:996 anx7411_register_i2c_dummy_clients() error: buffer overflow 'anx7411_i2c_addr' 4 <= 7
drivers/usb/typec/anx7411.c:1484 anx7411_i2c_probe() warn: missing error code 'ret'

Old smatch warnings:
drivers/usb/typec/anx7411.c:997 anx7411_register_i2c_dummy_clients() error: buffer overflow 'anx7411_i2c_addr' 4 <= 7

vim +/PTR_ERR +387 drivers/usb/typec/anx7411.c

fe6d8a9c8e6456 Xin Ji 2022-07-14  373  static int anx7411_register_partner(struct anx7411_data *ctx,
fe6d8a9c8e6456 Xin Ji 2022-07-14  374  				    int pd, int accessory)
fe6d8a9c8e6456 Xin Ji 2022-07-14  375  {
fe6d8a9c8e6456 Xin Ji 2022-07-14  376  	struct typec_partner_desc desc;
fe6d8a9c8e6456 Xin Ji 2022-07-14  377  
fe6d8a9c8e6456 Xin Ji 2022-07-14  378  	if (ctx->typec.partner)
fe6d8a9c8e6456 Xin Ji 2022-07-14  379  		return 0;
fe6d8a9c8e6456 Xin Ji 2022-07-14  380  
fe6d8a9c8e6456 Xin Ji 2022-07-14  381  	desc.usb_pd = pd;
fe6d8a9c8e6456 Xin Ji 2022-07-14  382  	desc.accessory = accessory;
fe6d8a9c8e6456 Xin Ji 2022-07-14  383  	desc.identity = NULL;
fe6d8a9c8e6456 Xin Ji 2022-07-14  384  	ctx->typec.partner = typec_register_partner(ctx->typec.port, &desc);
fe6d8a9c8e6456 Xin Ji 2022-07-14  385  	if (IS_ERR(ctx->typec.partner)) {
fe6d8a9c8e6456 Xin Ji 2022-07-14  386  		ctx->typec.partner = NULL;
fe6d8a9c8e6456 Xin Ji 2022-07-14 @387  		return PTR_ERR(ctx->typec.partner);

Set to NULL on previous line.

fe6d8a9c8e6456 Xin Ji 2022-07-14  388  	}
fe6d8a9c8e6456 Xin Ji 2022-07-14  389  
fe6d8a9c8e6456 Xin Ji 2022-07-14  390  	return 0;
fe6d8a9c8e6456 Xin Ji 2022-07-14  391  }

[ snip ]

fe6d8a9c8e6456 Xin Ji 2022-07-14  547  static int anx7411_typec_register_altmode(struct anx7411_data *ctx,
fe6d8a9c8e6456 Xin Ji 2022-07-14  548  					  int svid, int vdo)
fe6d8a9c8e6456 Xin Ji 2022-07-14  549  {
fe6d8a9c8e6456 Xin Ji 2022-07-14  550  	struct device *dev = &ctx->spi_client->dev;
fe6d8a9c8e6456 Xin Ji 2022-07-14  551  	struct typec_altmode_desc desc;
fe6d8a9c8e6456 Xin Ji 2022-07-14  552  	int i;
fe6d8a9c8e6456 Xin Ji 2022-07-14  553  
fe6d8a9c8e6456 Xin Ji 2022-07-14  554  	desc.svid = svid;
fe6d8a9c8e6456 Xin Ji 2022-07-14  555  	desc.vdo = vdo;
fe6d8a9c8e6456 Xin Ji 2022-07-14  556  
fe6d8a9c8e6456 Xin Ji 2022-07-14  557  	for (i = 0; i < MAX_ALTMODE; i++)
fe6d8a9c8e6456 Xin Ji 2022-07-14  558  		if (!ctx->typec.amode[i])
fe6d8a9c8e6456 Xin Ji 2022-07-14  559  			break;
fe6d8a9c8e6456 Xin Ji 2022-07-14  560  
fe6d8a9c8e6456 Xin Ji 2022-07-14  561  	desc.mode = i + 1; /* start with 1 */
fe6d8a9c8e6456 Xin Ji 2022-07-14  562  
fe6d8a9c8e6456 Xin Ji 2022-07-14  563  	if (i >= MAX_ALTMODE) {
fe6d8a9c8e6456 Xin Ji 2022-07-14  564  		dev_err(dev, "no altmode space for registering\n");
fe6d8a9c8e6456 Xin Ji 2022-07-14  565  		return -ENOMEM;
fe6d8a9c8e6456 Xin Ji 2022-07-14  566  	}
fe6d8a9c8e6456 Xin Ji 2022-07-14  567  
fe6d8a9c8e6456 Xin Ji 2022-07-14  568  	ctx->typec.amode[i] = typec_partner_register_altmode(ctx->typec.partner,
fe6d8a9c8e6456 Xin Ji 2022-07-14  569  							     &desc);
fe6d8a9c8e6456 Xin Ji 2022-07-14  570  	if (IS_ERR(ctx->typec.amode[i])) {
fe6d8a9c8e6456 Xin Ji 2022-07-14  571  		dev_err(dev, "failed to register altmode\n");
fe6d8a9c8e6456 Xin Ji 2022-07-14  572  		ctx->typec.amode[i] = NULL;
fe6d8a9c8e6456 Xin Ji 2022-07-14 @573  		return PTR_ERR(ctx->typec.amode);

Wrong pointer.

fe6d8a9c8e6456 Xin Ji 2022-07-14  574  	}
fe6d8a9c8e6456 Xin Ji 2022-07-14  575  
fe6d8a9c8e6456 Xin Ji 2022-07-14  576  	return 0;
fe6d8a9c8e6456 Xin Ji 2022-07-14  577  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

