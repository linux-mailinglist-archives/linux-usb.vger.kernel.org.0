Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0183589935
	for <lists+linux-usb@lfdr.de>; Thu,  4 Aug 2022 10:21:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237494AbiHDIVr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Aug 2022 04:21:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbiHDIVp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Aug 2022 04:21:45 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F9F13AB01
        for <linux-usb@vger.kernel.org>; Thu,  4 Aug 2022 01:21:44 -0700 (PDT)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2748Fja5004832;
        Thu, 4 Aug 2022 08:21:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=LIOf1V8kFCsP823VDElTLU8G7YAZXLAFWYnfmdUimvY=;
 b=rpcQoPBcDN2eWBsaPC6NfDMjoIPgxOHb2bWDXmhep64sfvR5FEmVyJlnURk9UoI1yxiI
 T/dG+wc/HB2vcAvcikXNbzRqav6Vw6Wpcx64st12M0EPy4AvBlyfHE/F15Q6EArIlgtX
 UmrM98JRDE12x9ODAZOOPkuAP+RcJkkyaAptf8wVQdK02cvver22E2dH6r4QngMImgZI
 5pe67qvs32tpAI1Zo1VttYmOQMH4hkvqdkbB7LEdOKf9/i72vC5BNe5HK/w/T33ml3ge
 McvgqZqOsSnbKAPS880P25IC8oZqSXDISNHqjk2aNwalfprAaXaJIiKtmV9EdXO9B6q7 /w== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hmvh9uvyw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 04 Aug 2022 08:21:19 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 2747JqL3014879;
        Thu, 4 Aug 2022 08:21:18 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3hmu343u2s-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 04 Aug 2022 08:21:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mF93LvGtJ8y1LdJupss5sg1YIWr5vafp7lhwX56xvA11ra4j94wnegU8zpskkArX1siBVPNa2sTRMBFm4hZd37rHZBDaeiKRgCxMPa5AP+CtMcA6aRFwpaN1grP37Jfw5y0ysc+IN7VWhawclp3tBkcR7Ba2HSPfbDw6N6mChuIATA3p/bQA2eYP8N7F7TSfJd6Ry58AiRcE8xrtmM7cKDeSjMsCpqf9+U58wBqAGbUQxK5W9dsQAP7oRUUyfGMhsPyiWe+CmXALLr8Z66jZJUivX5bDS15YCnNCo4XN+mLFRrctHQPZWs4mMd/05UuFU1jmui1LCchtS2jEAaUiQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LIOf1V8kFCsP823VDElTLU8G7YAZXLAFWYnfmdUimvY=;
 b=M3c+COHBKi50xivvwWZHM9fuHvic0yf0KJGfJLHW3jJWQbOCiySGCWjAOXXmk9VHlxQ9cqM20QPDIbhRVCGtdSxgQ+/VR5ef9v37BdnXvAom9IE2u+u1WnJMpmZ4i/8qo3stfG/0RB9gKlqFtY3VtEGoRCRiT3hmHT3X5LwuuRfv4qbwRAS0iU6sq2xb5w9bfXfzbe+xvgT6dZSQ+wu5wb48LrglwPLHA6rILHIzIt+/85qCe06XUKeg9CiEidjfDo7KV3c6yl30ysM7ihSyeJ6eTwwCjQia/Qhl+uYv0BSoo9z9xDCAWyL+gt3gcRJ7bIx5hTrsxxBoM+R/ZobWAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LIOf1V8kFCsP823VDElTLU8G7YAZXLAFWYnfmdUimvY=;
 b=UIPcoP40WjyczkYb2kmUs1FR6e6mXbvFcOHx85Ftv+3haM/lxNnTFJsJE2E6xGPQ5OJJgI5/Hu+UXvJUB2m0sv8WAK16Panm07752g0r4x6wiQVu5YXMn8kL08xE09BZ/QtKBqNAfAMtzIEwJQhD1leeayTHi5SXFYbOprCRcQc=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BN8PR10MB3300.namprd10.prod.outlook.com
 (2603:10b6:408:cc::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Thu, 4 Aug
 2022 08:21:16 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026%3]) with mapi id 15.20.5504.014; Thu, 4 Aug 2022
 08:21:15 +0000
Date:   Thu, 4 Aug 2022 11:21:06 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     strochuk@ispras.ru
Cc:     linux-usb@vger.kernel.org
Subject: [bug report] usb: cdns3: change place of 'priv_ep' assignment in
 cdns3_gadget_ep_dequeue(), cdns3_gadget_ep_enable()
Message-ID: <YuuBcg8LzwdGu6Ht@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: ZR0P278CA0157.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::22) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 836b6199-ad4f-4484-958c-08da75f24c9c
X-MS-TrafficTypeDiagnostic: BN8PR10MB3300:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NcymAjQNcTUvsVOYOffdLNKY0/DWEpCmL+PfMG98R8CtcQ+p3Usl/T2sIhm5IFecbGLXzRmTElX0XQHYUmMDnAXzZmaaDyhrbPujU0PA9MaJnR17xBgoGrpLQvg2gLxEY158fnj0YTxe8GvrsegJQs53gZ1N9TerJc+s6rmhL1y4yKg6GQG5qcypA5zUmgtARfvEdoiOIK6FExWO7t6Bt2cE1JuBOZNbuXy1XxC79C1NKQ1NHppls4IIK6SLLg/5tx8QgxxdXydliYlQnylbEQ94mAVmWkjG8SZBgYsXuUEP8mgW8oCz1oGMcfs1umPEAIH+6wHIajjI1DdwtkAko4VLlMiGMYaLn3OM6V7HUHJu/L9sVoqcH+4fDRpTmtthNu8ZAOB3TML2IyI7/nY+GaV5grdNyRu9kNHSbCVu1Sgfymwr1Iommx0JCDfvUR/iiiqmlYVqU7jD3m6Ox4OQ4aethOZzDQCA3azfy+FlP0cIZlAQ8PCAXbjgbBNoRrODrd1ZmwDEkNpi8vYYsB7ozV+6vKK5cv4v87za4eznsHNvozRB/utWdJ4/VDze0bQhPMUqKNatCszkzy4qOaBEkG4nUWzEbD1bY3D+xoJqT6GpaslkyrWcN0RIvmaq/gh7/C4ovsUe9cZIgl0ZESE3CAlZRz9QrnAreTNsy8UCwoBADBumCV/+okEgmf8jGa9Ug3/SIKhxbpNPkRkF19Xpd1PCCYCWvKEbJSrI+vDr5xZ3v3SgbYiTEOCWMDacsX6LKQkLAW6tHfhEjZitMpH3Bi6jMvsbWDUXKzESNVobPg4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(346002)(376002)(136003)(366004)(396003)(39860400002)(6916009)(316002)(66556008)(66476007)(66946007)(8676002)(4326008)(86362001)(6486002)(8936002)(5660300002)(478600001)(41300700001)(38100700002)(33716001)(44832011)(2906002)(38350700002)(6666004)(6512007)(9686003)(6506007)(26005)(83380400001)(186003)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZGmTYvAG3vXXbxISzyBUHcyBkOCvY+xeLJ2UAvlPxxQp1mN4R9aEo0Q5bSC6?=
 =?us-ascii?Q?B/kA7HVQK3DdZSaNSBQXYwZgz7zbSVug2DaQMDaVtsmw8Zz+SxsKyMMuKQlE?=
 =?us-ascii?Q?+rKdveWpj4a/6MRD8uE0bcbdqAxTH6c6+2mnjORyyBuLomQDpQnZTvX/q2jS?=
 =?us-ascii?Q?8WE9Cqd/yZOEkBV7/ufKTZnU7NDVcXvjjtX5qFnmlH5SSlGuHcMeCcUERa1z?=
 =?us-ascii?Q?H/9SVN5hBfNpw/m38wmj8i5GZBM+5M4spUGCSd+sMxM0HsHpT/WCV8kVJj3N?=
 =?us-ascii?Q?g5zDw3C5hT03zzplA/zcf3pn8ZMLAYJ11wp903zi1jw3jK8JMj69SVjYxaCz?=
 =?us-ascii?Q?nhIxbc4ouSXLo5PX3tH9iR58TQ0lH4/C49cumPM3UHy6oV99KBUk57KzKjN4?=
 =?us-ascii?Q?lHtFF+dijcIHfB0d+xh4Ou8pJRXu9aWGuG4z6DCx8NOHqO64CQ1+AraLCoaV?=
 =?us-ascii?Q?U2beCxFyhlM4LAGiXkkOS4Oq8IrwDso3tEoWq2iZPD3lIBG44BSL0U0okLCM?=
 =?us-ascii?Q?dr3j4+7S+lxtRq/hTxm5KwpsB9KcqGbEcT8Y6meebdWmPZTyCOONPsWwtga4?=
 =?us-ascii?Q?NA41X1xuXXxJOHnSZ5DxQLZ7hnjclc2H2dcOQOnrTO/14qCkJgmgZ9RcV5Zr?=
 =?us-ascii?Q?TCyYZhW27K7p/5iCdysgVH+sGKOxLw6qcJ6E+AIMvGTsjj6xIV72XQYhq0t5?=
 =?us-ascii?Q?41qkSv/mIRa+onVTO1dT/VAOQV+1K3MNHyt8qQ+0ae+l19k08uwyohYq7htQ?=
 =?us-ascii?Q?xI03JVCon4hqWgL6SbYVK//BafKO79ih6V/nyoUC6jVEfXqmmChlWAoe+lIC?=
 =?us-ascii?Q?g+nVCi6NtGyr6Vhhk4mJaLD5UQmpL5GAQCHbTkyjh+mgNHpiMxV+hfCGNi2O?=
 =?us-ascii?Q?e2sAtZ/3KKf4WY1NjRlgwzGo/ZqWfVj30UY9WpXde4Ylet7CsxP9BPg4zqk1?=
 =?us-ascii?Q?GX18WHl+O17b6EuwSmjCvRJeq1wCcDvW4bXrhwmDluYkchpuqJ2m5d7gu2SX?=
 =?us-ascii?Q?dVHrl1M02BbPUFOSN7Z2f5iuPttuyxWWtS4Nifadg3QaYa0j6yQKeXpOqml6?=
 =?us-ascii?Q?g+p2TfXYlopMiPmGkldsWG2tLAzybvtFr+VFI0CMiDtMQEdbULIbcRYxPtxa?=
 =?us-ascii?Q?m71HAqaEY1SfFH7VPNngLV9ak/9rVuuXdbZ4tjqJEp0rO0YZJWjFAD5+FsZ1?=
 =?us-ascii?Q?t+1fgPdRol6pJtR2xDdFdlmGO59DmpqyDq4jmS2a3oS8AwZ7ZLnaaN9xpobr?=
 =?us-ascii?Q?SpFskKlbispq7DzbEMX+JyvWhgVbv/Z5rDKi7xAAwwhcHny535xT17Sflfl6?=
 =?us-ascii?Q?U3vR+siWY3mGti/5B0AXIkh4lwPb21vgL1g6mNUfYYfihmjaZ2JP8vjEVgVW?=
 =?us-ascii?Q?o3hzfvmsLomzqyPznB9c2UWR4Zzjc6xmBrepZxcnqe5nSPRFbrJoxi6CbT0I?=
 =?us-ascii?Q?eYhzc0YSh0V1VMpqO9qmqYDgBajMC0QtY0LPjsyPb+l5XMwWbeEJ1OUeHqzZ?=
 =?us-ascii?Q?04pVbCz38/kFX11/7rgUBnMH82JhZmRfim4ZeChtWVMW52/3zpWFXLHmBCKE?=
 =?us-ascii?Q?FMR6KZL1I8h4a6Efw2JQyFdOWQAFffkgvK1+vEwmROlxq2ctz+qKxlvayol2?=
 =?us-ascii?Q?jQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 836b6199-ad4f-4484-958c-08da75f24c9c
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 08:21:15.8586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: clw6oWbh4DBZEClc+82twMvt2aGmfb55RZwH1d/rbBRhTm3oI0Z9tXZtqhW4evGH1Qr/hKY8UMSSNszmqLavNM8qL1dCJTb39kRcCzJ/+pM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3300
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-04_03,2022-08-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=660 phishscore=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2208040034
X-Proofpoint-ORIG-GUID: v1QMlLH3BUdEoEJgzbiDdbnTGyE09YPp
X-Proofpoint-GUID: v1QMlLH3BUdEoEJgzbiDdbnTGyE09YPp
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Andrey Strachuk,

The patch c3ffc9c4ca44: "usb: cdns3: change place of 'priv_ep'
assignment in cdns3_gadget_ep_dequeue(), cdns3_gadget_ep_enable()"
from Jul 18, 2022, leads to the following Smatch static checker
warning:

	drivers/usb/cdns3/cdns3-gadget.c:2290 cdns3_gadget_ep_enable()
	error: potentially dereferencing uninitialized 'priv_dev'.

drivers/usb/cdns3/cdns3-gadget.c
    2274 static int cdns3_gadget_ep_enable(struct usb_ep *ep,
    2275                                   const struct usb_endpoint_descriptor *desc)
    2276 {
    2277         struct cdns3_endpoint *priv_ep;
    2278         struct cdns3_device *priv_dev;
    2279         const struct usb_ss_ep_comp_descriptor *comp_desc;
    2280         u32 reg = EP_STS_EN_TRBERREN;
    2281         u32 bEndpointAddress;
    2282         unsigned long flags;
    2283         int enable = 1;
    2284         int ret = 0;
    2285         int val;
    2286 
    2287         priv_ep = ep_to_cdns3_ep(ep);
    2288 
    2289         if (!ep || !desc || desc->bDescriptorType != USB_DT_ENDPOINT) {
--> 2290                 dev_dbg(priv_dev->dev, "usbss: invalid parameters\n");
                                 ^^^^^^^^
Uninitialized.

    2291                 return -EINVAL;
    2292         }
    2293 
    2294         comp_desc = priv_ep->endpoint.comp_desc;
    2295         priv_dev = priv_ep->cdns3_dev;
                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Initalized here.

The commit should be reverted.  The fix for those static checker
warnings is to delete the NULL checks on "ep" and "desc".

    2296 
    2297         if (!desc->wMaxPacketSize) {
    2298                 dev_err(priv_dev->dev, "usbss: missing wMaxPacketSize\n");
    2299                 return -EINVAL;
    2300         }
    2301 

regards,
dan carpenter
