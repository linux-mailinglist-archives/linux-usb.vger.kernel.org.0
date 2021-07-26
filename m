Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F000B3D543F
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jul 2021 09:28:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232213AbhGZGsL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Jul 2021 02:48:11 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:28700 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231728AbhGZGsL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Jul 2021 02:48:11 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16Q7Haeu018313;
        Mon, 26 Jul 2021 07:28:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=7be1+pJRa+ct42XDWpY63Mt8ByUvPNf/PkSQl0jLKzw=;
 b=Ek4bZuRA5uFJ7xyhvknqAYrm6Knc6/yPw+pYarpQ4VK+VbDNcsSKxrXVouoTpOeSh63p
 PkUA8FdmQwYlN5nv9+OENBwq0G1D8M8zRglVnDcGfklSya8DFta2TIGHeFqPZ+DTEaNm
 Ech+S3JR2jgIaksI057b9L1WtrT6sUwcOmWZINNBedKAiBSyGTBx7j1RDXDdfJGfX9dM
 EbrfgEGC18YzdVJhIs1+yL+4zNwTbCuqiHGKb9DJ6iidTubjsM5AxuILcNKnQCwT/u1O
 wkvQ79Qx+RY+GMzx1w2TIT++/vYXQRotJPOgr7UB1lWQbkU6kO46vQy9i46xTMWd84D1 rQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=7be1+pJRa+ct42XDWpY63Mt8ByUvPNf/PkSQl0jLKzw=;
 b=dWSeJtMxr4o+ZFa9hKCXsSAP7mKUKp260wAWNCtlS8TxE8W0kBq/tVq0mgAtzYYCuEOD
 cQ/A6SUOIfPL6OynTagppnPYjuyNlSRkpnzrA+90IjaMNQjDM7vJQUJoFkdmlGhmiKZB
 GfljLbqYzBoM/twxRImaIjShjpvb5NZ7hes2KkqlwqtTv+fqezrZZ/EiGiBAhRAa2XWS
 vVyO7IgdZcLVCSqXY/ik55D1iDocb1a6j2QcTcmTVdSNONsp7ZJt2mwC4+/CjhfJ1AQl
 p6Qg1FRzCzQRXkgG8G4UVVbflgZWrbuC4szAd4WwAzRveMUYRYFnbKVoOVDW4kqPfClf Rw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 3a18nfrud4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 26 Jul 2021 07:28:39 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16Q7FOt7155262;
        Mon, 26 Jul 2021 07:28:38 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
        by aserp3020.oracle.com with ESMTP id 3a0n2fdk6e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 26 Jul 2021 07:28:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n9MwgoTEFBz1qXY/l9VG6UMJeb14nS6R0FKzk2MdnOYKlMwfQ39VSYJyPQh/sYdmD0CtSLAYHiq7/5m7JD0/ttCFBvmK2WZAFc4Y5fzy1sTjMAQkrZh4SOVDwGkZFGQdpvsm6XcCeQ+vw+lbbaWTjtvlkd8awUBRnORv0sB1IaDqI6ziKE4ZrAe0enCIWt8+efdUwm5H1ckFEfluS5+HVse0W1/JpYrBOd2ZN060B8uqXOnjlWP4cDnL3oLbBc88gCJ6zkL5oJM97uq8PZHCDZ/L2DDL8aDEkubRdvjBJLj2ikKPOSLD46uhmPx8VI9HStVzfrHGZ84wBqHU1aW11w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7be1+pJRa+ct42XDWpY63Mt8ByUvPNf/PkSQl0jLKzw=;
 b=UUPVXoNbnvj+WOS92RkeZCOEoxFsEWr8dcSBZKSIZMGYiCmQYXQkdm92URIq8+AK6f0zX8f+CWpsFRxQxkynOaNhJp4MFhLqsuFn4OnpZHroEUQU/7sfjn+ZdBeVniS2iab7t8YcOSO7GsOn3S+0gfIvzxdJTuu4q+C+592JRtMMOkaPSM8arWfrXq8VqBQbPsqlZSva6Ohyp+FfIGfYf1Z1eeIx1v4r/VL2Z/fCTz+cZroz5RunTB+Oz0k48MZ0hfD/cJAACiOthiqF4e1Rysgd2HU2SxTugElefRhYLoUZ2G2cGsal8WNFDelu3fsb7aa7H6Fgq2uU/KPBWI6IjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7be1+pJRa+ct42XDWpY63Mt8ByUvPNf/PkSQl0jLKzw=;
 b=uW+TZhuRv0NRFVSzZhcyyzl+L+vWyaHP7Jndubvx3c3DOh3Lr3ynKmZ5Ro6uRyJ48OAyp/qkOdr4OLz2GG3074j0yZZIW6qLYi8asxOL2QtlUxqgjESluJUTZ2b20PweZzgRYQfNiBXQRexEX5gWTStG/kT/wj+MpbT7ToG+21Y=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4577.namprd10.prod.outlook.com
 (2603:10b6:303:97::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Mon, 26 Jul
 2021 07:28:37 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4352.031; Mon, 26 Jul 2021
 07:28:36 +0000
Date:   Mon, 26 Jul 2021 10:28:25 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     rui.silva@linaro.org
Cc:     linux-usb@vger.kernel.org
Subject: [bug report] usb: isp1760: add support for isp1763
Message-ID: <20210726072825.GA9005@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZRAP278CA0001.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::11) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kili (102.222.70.252) by ZRAP278CA0001.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:10::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26 via Frontend Transport; Mon, 26 Jul 2021 07:28:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b75b1d5d-6c2d-4a6f-0022-08d95006fb6d
X-MS-TrafficTypeDiagnostic: CO1PR10MB4577:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB457766F4B019FB56C15C77408EE89@CO1PR10MB4577.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fn+5pmOpnPTQYsXR+8/aGjIZZH+UyMPM8Cr7kMho083WkBzq+ruXVNYdrWd5r5BASz05mFG4T2ms4roQz3gifktir4xs9liE+ojM1+2V82ehxliLC+fgWRtWi+lRoiEa+a6Lr6QZGbFS4x7YVoCR6nvcEBY65J78KfvKNZk9mMz/VESc6lhZE+VgyW0tWVBEC/uPxWMXfcMCmHBEkKBu55QKQ8fZkFDw+ZCV3idqgaCSh5njeZ14mDBfaR41S0REEO9PSLLPqJoLiy2X7OoOblHqTDKFB92gMPPTbmBdCgnqPzLkSaudEloMxiAMcGUsuOCh4/8dcQiI6EX0+Wj+zHkqM943gMRpfQYopixj4FfJu8rUSM4CuYA8jqhOCjMHl11rlE1YmWBdpEj3tvTl/IH5U+Ce9KrRn9zbTWxnfLOIjbrOSQ35/XcYi2RX/k4qEg9iEnHXxyOhbY5IaYfk4dy8Ddls57rB3ZoaSs8xPPiWto4wsXQ42n9vGBtsurNSra9g7ct7AhxaV3/l3okt+VhPSGQIHz9q2J3N01aFWQQ2/pJ/xtdZ6U5ewot9te6S64tzUbPrFu1TIk+jM1Rh2fkelk/VA+CU2styg9l5ko3iM2nLGMmHKf6fMsjQ82zAsy+U1ysamL2/XzeBrlMVq4uiaRN3dd/xoa8mKanFUb/b2jvI7gV9WKYFlINsMTtvayUxAQc9ro0FMzvLV+eynQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(346002)(376002)(396003)(136003)(366004)(83380400001)(66946007)(6916009)(2906002)(8936002)(4744005)(8676002)(38100700002)(6666004)(38350700002)(4326008)(66556008)(66476007)(33656002)(186003)(86362001)(9686003)(44832011)(9576002)(1076003)(316002)(5660300002)(956004)(55016002)(33716001)(478600001)(26005)(52116002)(6496006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i9u+cMh9aQhgyQgm3LYrCLA2bH7Sx2WQTJwKI2hl9oj60TAVhMlB74xSmI7C?=
 =?us-ascii?Q?+dKl9qo0ym9o+WyGR/uFNM6pOyRD4vGHVPVbZ+pyyyAFmaJBvficej2lMGrO?=
 =?us-ascii?Q?OqbqITZH6ENzzbRuz4pFdwZ/R2AUYOuO/UDk2VkjAK+jrkLuapHE+b3ZU440?=
 =?us-ascii?Q?mPd7DwJvImsJmPkEZHI5IXtyNuN2ot6ktCyQaWgdCRekZ8geFczrV5hrFiwE?=
 =?us-ascii?Q?yYK/paNz9n8bTftyx0RmhEZIEpTyF3oyLBNZ+2+XMofO37ViPU7aJEWOmk+B?=
 =?us-ascii?Q?fmYpzHxqbKxCM+muv1xgfsjHSFcGg32Sqy9CsAfvwCRVfVFoEzwkVkAVdLN6?=
 =?us-ascii?Q?YVVQLAIF9GtnNdIDA8AWrlLx4f1quJoRYPBLdv437HgGQEGpR7CL/asE9jF6?=
 =?us-ascii?Q?rlCUga2mp454vy/cbht8AnJjzabyomI7UhqYCBo+DkzXqN6QEUZ2qZajLfgx?=
 =?us-ascii?Q?/Mk40qVnHw50zSEWSjEhujnugzwYbjVsF9NzjR1J0MqSkdPDFuLb5PWYfot3?=
 =?us-ascii?Q?rKwET3BIuyiUMiU6lTDB2SBoOfrZoYRiXwa0TZjkHGSohpLU8GkJAy08yBCZ?=
 =?us-ascii?Q?rvTFYdAD4CiD9WZ28DDjnqOVnh8QvgtX3yhFsKRPHH/jIVUbTC3xovIsYujR?=
 =?us-ascii?Q?InC8gl0l7nAsIk1OhYS1tNDV7qnPztU4nqrG92XEgbMjgrzP10+yxR5tA5nC?=
 =?us-ascii?Q?rHm34xVE2S1NjaRAlztB18TdCliwtfM04eAjnRYEot2PYlXsg3vobSoWqBdw?=
 =?us-ascii?Q?ozQ9UGb693IgqCWWu8jtyjuTflE8fk+5NWAIEVa/XKFjiv9NhlqRUXs4Wgvq?=
 =?us-ascii?Q?n5zSxuBhWAspn3gc/ix5Ks2qIzw2u2UVOcAQBnepqZya6rsF0pC69zhxmlZ1?=
 =?us-ascii?Q?xn1xUseDfllg3cWCfXjMdTkOTf+9KnQs52DAVlUpN8pToN4qUtFWxCvr68YF?=
 =?us-ascii?Q?wIpjQ49Z3F41/umoNtG8VNyE98SBqRDVCObdWXTxKXXirrHtut4KGqfCfz3J?=
 =?us-ascii?Q?gc3vplwCWtKTmRHg8Sl0KdvV5y5VjHLNi+GpnFsdYh38JFTISjMLxy8nd3Rn?=
 =?us-ascii?Q?1PjnKkWfv/5U06Tbll3s7SvvY4dpSwMxXzi8oPCXKhqCeUIKODWh+HP8L0xF?=
 =?us-ascii?Q?Pn35yI4Re/Y61OvMQxu+EzmYAXeGrPzxRVXpLcSF71Bl1der8tPpMDkr/cUW?=
 =?us-ascii?Q?KGhPCGbPX4FhdrELHItZiqoE7tY0Pkyz/X7UUD2A+e999wkJziQxcCXXGCtz?=
 =?us-ascii?Q?pmyyAa9tgZd1P3lrHL7BbTfj6YqNvNCFZtKycLn3HV6kMzeA2Yt7OSngjd2h?=
 =?us-ascii?Q?O6zTc/mm/xlu6Fyr37rjBuHA?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b75b1d5d-6c2d-4a6f-0022-08d95006fb6d
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2021 07:28:36.8915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7B8rJzRb6GbAHdNTw0vIAkuuKDsUiuUhvrQFLlJZ3oh/h9oN+SmG3ZNiVtprCq7Juz2kcsHq6aNPvUv4i2ULQdzyDQ8g9dvHcZpwvYYhRcs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4577
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10056 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 bulkscore=0
 malwarescore=0 adultscore=0 phishscore=0 mlxscore=0 mlxlogscore=835
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107260043
X-Proofpoint-GUID: y4Rzl_n-_ELyvoe9IGWGPRuN7PtL_meT
X-Proofpoint-ORIG-GUID: y4Rzl_n-_ELyvoe9IGWGPRuN7PtL_meT
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Rui Miguel Silva,

The patch 60d789f3bfbb: "usb: isp1760: add support for isp1763" from
May 13, 2021, leads to the following static checker warning:

	drivers/usb/isp1760/isp1760-hcd.c:276 isp1760_hcd_clear_and_wait()
	warn: sleeping in atomic context

drivers/usb/isp1760/isp1760-hcd.c
    268 static int isp1760_hcd_clear_and_wait(struct usb_hcd *hcd, u32 field,
    269 				      u32 timeout_us)
    270 {
    271 	struct isp1760_hcd *priv = hcd_to_priv(hcd);
    272 	u32 val;
    273 
    274 	isp1760_hcd_clear(hcd, field);
    275 
--> 276 	return regmap_field_read_poll_timeout(priv->fields[field], val,
    277 					      !val, 10, timeout_us);
                                                            ^^
Originally this used to call read_poll_timeout() with 0 us_timeout (no
sleeping).  The caller always holds a spin_lock.

    278 }

regards,
dan carpenter
