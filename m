Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7C403D7154
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jul 2021 10:42:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235919AbhG0Im0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Jul 2021 04:42:26 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:22304 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235629AbhG0ImY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Jul 2021 04:42:24 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16R8c9hS014591;
        Tue, 27 Jul 2021 08:42:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=nTIGxOCp4ExiHjES2RXpAV0PHnApEPpHDCY3QOxVjiQ=;
 b=DPhZGj3pckLrMYz8LshLCQ369QsbTqOZ8Dd+v327Cexy2pjpSJ95hZf6IvjQhEa0acAT
 FwiQUh1dtH6y6F4BZ0lx6Fj7tGg7MILqH78TFtGxugujJ9aX6VbFuYOZOxAXWc+rxJAY
 TsYeSTZFJnsP7oGCkpckPFZ+i8Izy8OgTPcyKz4KWDpe469ohmgc96KvW667E236NazH
 RM62BqZwbopnsACwkJwGzrE0a4fBLUKm6NwYs3BIz34u6GAuZzX/QKjmOh/l1dF0Inqz
 Vqa7zP34u8uvMcLoZIlIRnICiUXgus2jPObE5tlGJZ8TfAyTLx3yWerMyNnKAbde++Cg VQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=nTIGxOCp4ExiHjES2RXpAV0PHnApEPpHDCY3QOxVjiQ=;
 b=KDiIQuUNGwRxdn5T77SxaiaWFEaaQOGpYh79fOCmitU+vs1KrhrL+dyNz7yvSAFXTKnP
 laQLWJCyxAM0ZdQpv4lwcbehmHeb1vNievRPIET8RnC//aeX5MvogTp/q7P8bxJ0oKJx
 47Efu71ex5eK25Fybr3OEeFyz2bJbiV0oYCnYR+DepwQBCTU8UyjAgT6Gwebo4ysYCGx
 RhKZJ7YqQZW4JAin5bXRfDy7dZF5ivkAQhfrZQoqd4Ude1ZWkQ/5pSqUzTBbhs5eiFxF
 u62sXEsgokC8bd1DyPK2W+4G7s38S4bpZipeteLP2TxFsSHOn0sM/3hYN1XHbNgdtGDR DA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3a235395ap-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 27 Jul 2021 08:42:21 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16R8ZgZC175778;
        Tue, 27 Jul 2021 08:42:20 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
        by aserp3030.oracle.com with ESMTP id 3a234a15db-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 27 Jul 2021 08:42:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B72AUxAzA6dugGoSNF2I+fW4oeI5BM+6eN0qdwGvVwFHI/2P1Mmb+bGItz+I/H+yinYAYDNDulwn2ETbooXXkWcYieJtupHirZg3WoZbPjA5F35rFZj8toqVl6QjmYHoawkKjLK6G0S6YhbFt9EcOoihwjPQQWXnwioqjI2Zzg4RhK90bAvrLLtoZNmu8C2qaMTa1HzXB1/xBAHb9n80Po68Sx9NwITwYErOmyxBgFc0TexbCCPkJRa4OqqOgPShXIjWheNnAVSkLDSD0MqY7zIAddXVPRnQkeaiwHh01zm3Hu8VmJ7niK/WiXdVJpVF5lchRPS3Tm50by+bp70PZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nTIGxOCp4ExiHjES2RXpAV0PHnApEPpHDCY3QOxVjiQ=;
 b=FF7aHkxFI+PM3GSBx4X5b6VE/HB3b07yoaHoDmq7zWXapsBiBJxZ/2M0OQw1dwPfHU2QhEXEnfMHwURgNu+6Npn8bcNpNeetsCMV7ZHIgNUGT/eP+aMyDKEJ9G0al72lzXS4oR5rPdKBWFWqzExsIY5YO1wJjcA6F4wenA0jfh9cTywZlqs+YA7IHwLDSooLfg3Z3T4eS4a4JintwO+8KEN0f6F58cjL3U6GJRuhtJKCxDkZSYP/U9f8avW8PiytCHcU6lnRMtj24RAULXRi4d2JN1aD27UQz/k9VcHB3KevnQ6MQKp0w+ztqn54nbHDyF6hAVeAw9456Jyo4RhyAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nTIGxOCp4ExiHjES2RXpAV0PHnApEPpHDCY3QOxVjiQ=;
 b=dalo6zRtowXKiBt55qEbJg1djCS2jTkBLP2gI5mDUaXkv+SD1+QtxwwcL/3rleVDfgKkTf896Ls7bpbTyjEfV5G3fLKADY9f8rw2bxZ2+d1qPl7bcSjOQJE2BuwBBmwZahcJpWC2oniIy2MgKN1DjVBfN14Q+TDnOrmjBOl41Kk=
Authentication-Results: mediatek.com; dkim=none (message not signed)
 header.d=none;mediatek.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4468.namprd10.prod.outlook.com
 (2603:10b6:303:6c::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Tue, 27 Jul
 2021 08:42:18 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4352.031; Tue, 27 Jul 2021
 08:42:18 +0000
Date:   Tue, 27 Jul 2021 11:42:08 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     chunfeng.yun@mediatek.com
Cc:     linux-usb@vger.kernel.org
Subject: [bug report] usb: gadget: bdc: use readl_poll_timeout() to simplify
 code
Message-ID: <20210727084208.GA19962@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0048.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::17) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kili (102.222.70.252) by ZR0P278CA0048.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1d::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.30 via Frontend Transport; Tue, 27 Jul 2021 08:42:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 110a670a-b9b6-4e34-722f-08d950da716a
X-MS-TrafficTypeDiagnostic: CO1PR10MB4468:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB4468CE8FAE39389CD4F0D5468EE99@CO1PR10MB4468.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lLvSDxGXAWeDqiX+/IzTac4wtWX3ia/XBa3OO24m/7j+O+TDE4CXzhLpcHcCBQMTWhyougArLh30y9ck74dCpNcWzuxDoXbKO1i4+tqZ5NtKopF2rJRxEZ8kSAyUzS1mI1WJppe6G/dipUFbJjLTn8Hj9//hbBOV/PAA3RDe56s2Rb3mZACqpTVu5vEgAjwEMh6OwKA5+T/PXvpVokDfDPVeVmhq4TxUNapkD+T6rhbHwbkT5fbg61DVNfZ4ytkZm3Lu+7Knh0e75YlI0zOmL7ehZpQEPtaU5s0rartXH3RbvZCww2/TDpTAEVzyc05ecu5/NBh/AFxYweaiy2NprEC/CoqyBBy0+z+xWaG1qjt45v1UlsAop94lxnl51FEn1cPLrlm2iwS1vYSxqQ8cWcc7/YxgD+hAdEuPZ93Rk57+FQQYMj/QQPkqve4Q/w3uhSE2WJ5ZEEJYeUV1cYZHibCHq+xU0SpwMuFywNdtaJqA0H/A8S3rj1qBfFU08eAlF67mj7DmJPqAmjEoalUYtvDKCpTvQuKj5jyn8Bix8pWGjEjNeBldso6sG+VgTklUXUQjgQUFRO8NhRGm3x1+q2cwv8UWCHtewk1j4ttS5OO5XG1xl6eVoR8vbsPlZmitSO1Q3rR0bekgXGsUBGOqVb21mZyDg4mYCIdjrSj6Wb0DpUB2pO0W4ChfTYQ8Qqe/NfvxM9NzfPDuLSDEU573hA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(39860400002)(376002)(346002)(396003)(6666004)(6916009)(83380400001)(5660300002)(4326008)(38100700002)(86362001)(44832011)(66476007)(33656002)(956004)(9576002)(66556008)(38350700002)(33716001)(186003)(52116002)(1076003)(55016002)(9686003)(8936002)(2906002)(8676002)(66946007)(316002)(6496006)(26005)(4744005)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/gLzdExm/MSf17e5wKVaZ7iPJfQc2DI4LDqWzPUgqs+En1/Cc/s7LARyhQ2R?=
 =?us-ascii?Q?H4HJvne+Vos20d7E+w3x3/gH+DEmmgII2j57ba62fa6Qs0zS3Um9wbuMigyp?=
 =?us-ascii?Q?kfkXBtiL2UcYIVT+uEOYd12cp92zGonujbNO/K7Wqt6nbLTit4A+QbnY+ZDo?=
 =?us-ascii?Q?UF3pUrK0MtjgpOUGVHSXDb10soVEM6PaQ7HTIjZ3tY4R9+/FtEcE+I+1XzLr?=
 =?us-ascii?Q?5vLKkEx/JrQfocI9EZGlacu9x5o+m//5V7ial5CgGF7yZ12N0vRE4Bfw2ahR?=
 =?us-ascii?Q?zcPR3nj/hwup89yKhJM5M64cqQ8NPYea8W7uEr31nTlkmIGdEgTpXYJjt0xi?=
 =?us-ascii?Q?KjgLX+yA5Ey/m9bDo46OZQq3J9cWTs/RGG7lX3P0t5BM4pU5T01AQxsxpuN5?=
 =?us-ascii?Q?jzpt9dPKrzTlvhd3X6RBKqPG43HJcFTMII7V09Sr+xs4EwJwGYDvOG6l8NWf?=
 =?us-ascii?Q?N6Rn1nZFekLyU9bkq9fILx1LCiLbp5rgwEnAt8SS7IoqnL8t4Na4YBq1fqvz?=
 =?us-ascii?Q?0qP1CeMelOm9aZbGwHW250ja9pt1m5bTASviG5eX9iKsEejeokHsDqQ0/tS2?=
 =?us-ascii?Q?nHbZ8hNalglLVUSGlmHgVn1syngztaYcB8mpd8YYWnzeyEOlUVhthxGmRstp?=
 =?us-ascii?Q?Lw5v5xiAHeAsBgu+u7gP41mk1clBgw0zrgn3JwMT3+tLFXDsrXhVxD1It3ZV?=
 =?us-ascii?Q?tVd17/ITPnulgYG7r2/SuqHdXjuo3YpXNd63XmaUXh7WGe27xlpZ5yKX60Fk?=
 =?us-ascii?Q?yJrVqawcnQ66isQY6pqn+fItEKjG1HfFpaUMUtgwjP5rjXWPbPhpARN7wupn?=
 =?us-ascii?Q?bpM6UoiETFLw4JmlDw4uyIKzQsDV9l4b/aW9GJeHVqkAG6fSkcfjHsG8OhEL?=
 =?us-ascii?Q?BbBnteRXD2tV1SRlcvAHwWMu2quDQlUb4RNDlJKoJm6VBVrF8bsFrlhO1syz?=
 =?us-ascii?Q?2t+2iw0fM9aLPSHoNLV+r6wJv4nCWREXOckMqvYJ6okgdxcAcfxP2iMzPODA?=
 =?us-ascii?Q?AAQ9UnjHfxH+Jzt8V8FTTE/EK0r2ZEX9oD7THvgcaH4stV63hg+FZBVTQHD8?=
 =?us-ascii?Q?11yBbRb0EDdL+071jDxLzwNAaO2VaEYJdpA6oPhAfMtjwLT0p6FIUi2uh7Ac?=
 =?us-ascii?Q?yxJfDf1wg0ynnzKimG7lIKFQROt0L50xKDtuLuj6BQRy53GhgJyveHSw/wKh?=
 =?us-ascii?Q?VfATZ2DczxMT4YOQ4AmnNW/GT3/Ae183AgdG1RKPxxBShwWDiYS/iNKzudvd?=
 =?us-ascii?Q?STPp1cRaGv6nEKKILPWgfaD6FkjFYak/uVVBYJmCAtdpZKvr+IBPu4XOyIuX?=
 =?us-ascii?Q?cNnkby2jfptLbIbtTPu99DhZ?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 110a670a-b9b6-4e34-722f-08d950da716a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 08:42:18.6579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2siqk1cIyBbvMay30BOobLOhjurvnYSOlo2YB+K6I4Dag9qnB+0ojeFyuWXUIp6T3Iq+kkTe/Z2ckMZXB+8XgfGg0cRc3u4Tu9eCdJMswK0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4468
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10057 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 suspectscore=0 mlxlogscore=789 bulkscore=0 spamscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107270049
X-Proofpoint-GUID: YKffwYanOm5RkKCqFsoByjJv06zc1ARA
X-Proofpoint-ORIG-GUID: YKffwYanOm5RkKCqFsoByjJv06zc1ARA
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Chunfeng Yun,

The patch 75ae051efc9b: "usb: gadget: bdc: use readl_poll_timeout()
to simplify code" from Jul 13, 2020, leads to the following static
checker warning:

	drivers/usb/gadget/udc/bdc/bdc_core.c:38 poll_oip()
	warn: sleeping in atomic context

drivers/usb/gadget/udc/bdc/bdc_core.c
    33 static int poll_oip(struct bdc *bdc, u32 usec)
    34 {
    35 	u32 status;
    36 	int ret;
    37 
--> 38 	ret = readl_poll_timeout(bdc->regs + BDC_BDCSC, status,
    39 				 (BDC_CSTS(status) != BDC_OIP), 10, usec);
                                                                ^^
This adds a 10us sleep, but we're holding a spin lock so it's a sleeping
in atomic bug.  One call tree is:

bdc_udc_stop() <-- takes a spin lock
  --> bdc_stop
      --> poll_oip() <-- sleep

    40 	if (ret)
    41 		dev_err(bdc->dev, "operation timedout BDCSC: 0x%08x\n", status);
    42 	else
    43 		dev_dbg(bdc->dev, "%s complete status=%d", __func__, BDC_CSTS(status));
    44 
    45 	return ret;
    46 }

regards,
dan carpenter
