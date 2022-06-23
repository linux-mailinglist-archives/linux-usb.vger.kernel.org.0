Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FC4D557C67
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jun 2022 15:01:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232152AbiFWNBO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jun 2022 09:01:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232143AbiFWNBM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Jun 2022 09:01:12 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 482FE4D25B;
        Thu, 23 Jun 2022 06:01:11 -0700 (PDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25NAQw7P009498;
        Thu, 23 Jun 2022 13:00:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=gUwRl06WjC1IiOBBH1lIVovJ9LIhmh5C7hbGf/U6Auo=;
 b=Qpxji6BXYYqC7jI6wCvpP4WUubTFyvpC9kXU4TVYqNR6odrTMN2hc3zCSEfn/pVxFwbE
 kOpLOwrJwXGmIV+j1DBEG1HP50PQjnI+dTE8qCRKsOnhYzFQ+QtBFeDBt3CF6wTZGQoP
 A+RMIamODz9LnT9iLAq3xjro021xZzkhIZQmaQketMfelTq4VWU+vxJlyo0kj+embwAp
 iwt5D4vEgnqCJFdxAtDPMi8QHb/b+ClXHs1l/aOGsiXafhhDEM2U2XjEPhZDD78wBw1b
 jl9Euq+wOSwUImcOybsZInz9DDq/rxa5UUbfBNrR46R1+ODPgvkl7oMwv1+wLDDrN8vk 9g== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gs5g235ub-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 23 Jun 2022 13:00:30 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 25NColK8001151;
        Thu, 23 Jun 2022 13:00:30 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
        by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3gtg5wfwtk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 23 Jun 2022 13:00:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QHqqUign5uPXkilyx3IZSbg4JPDr62QNvwgRX5ucnpeieF/iRMgmtUjRaBqhPUH/lc8Fp5SxCOF1UPPEVjgDXls+9r5/CGhzM8yJ42gGasc/0VKu/1E9IhQuzSdrqbrXt7rErQubY1i3kGgJv3Oe5f9rZtT2TLwiVM/b+r4DdK06slXbPNiul2xzt6oVWExBOkvNUtKzLpBLctSr0zN8Q9l7tVmtB3/Frccpqnlg62F/sWXipEccGiQuO39Dki4nK0M8PCkqyhQ8I/ver7ERa6ULIt5DrKVub8o2m0mwwCQJsd23/sOaIgER+K2uPZkmox8H7dhTmGdPpmEYC49S1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gUwRl06WjC1IiOBBH1lIVovJ9LIhmh5C7hbGf/U6Auo=;
 b=DTLC6bapsa/niUHR86bj0ctyHdXKbdiiLU52VUIucloic0pXOFcCJJdmCuOGs4A3Zf3NXwD2IZRsckqH7MzO9dOpIMvkVq9y2uLUbzLjyOSP3vcMqvsJQ+691607NzubSbbvaoggftk/zwJ5CZA/Accx5JJq3cBEc7IjwaUzZWXfgsFyOlGbFB+PnQlGY+PwqiPAocoWHFDMFGl65vgsmDHdfmC28CnR9rRsGO1wHBY0QPQm9NIjCCj8TqdTF8MKHBd8ZQ+OTrgnq1sAR7qDybRGABUd6HlDt4O3cyXS0jQXsD4yLYpmV37UE05iCYW3HXFmZlsO+aPwml6g22CyDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gUwRl06WjC1IiOBBH1lIVovJ9LIhmh5C7hbGf/U6Auo=;
 b=l67XyBiSHrDxcl7otB/2abJIyr4vTxX1hl0MfuelMqB1WtxArT4gQeZcwp28RC/tSSVK9n8N3ClL4ADgEluaN8fC8+PeavEVD3AHgimxWLAa5qg+ljMLJRQFSNTyqmjvfjzrQNtU2lLqUmoGu6rFmwblnHF1Gl7TVj50pLfh5+c=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MN2PR10MB3725.namprd10.prod.outlook.com
 (2603:10b6:208:112::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Thu, 23 Jun
 2022 13:00:28 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5373.015; Thu, 23 Jun 2022
 13:00:28 +0000
Date:   Thu, 23 Jun 2022 16:00:15 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Neal Liu <neal_liu@aspeedtech.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        linux-aspeed@lists.ozlabs.org, linux-usb@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH v2] usb: gadget: aspeed_udc: fix handling of tx_len == 0
Message-ID: <YrRj38cU1nV4gsUX@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0066.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::17) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7e97371-5968-4700-5af9-08da5518587a
X-MS-TrafficTypeDiagnostic: MN2PR10MB3725:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB3725403E7B38B3333E472AF58EB59@MN2PR10MB3725.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JShXHMAyTEeUL+WZLftLWv40x6xaoX4s40KgIFf/gWmh1bXoIol3jTSyfnMaMCBEeMBnZtIbALCtZYGkIdKbWIsp0w4hJweNvgRPuKou9gUWucBw26xsRR+4BNOK18AwP5A6iWoucruIlb7BQcO0WllKnbzsywQIw+pjBDB+ajhsd6kxywQGJrL+eWudITN6U83qHqEfES47A58aEVDmGp3VVnFwe+wzgax7h3mR5Q6HhDGCAdfbmKR0rp4xjTQ8lTdKLDWiphl2ABTpFLrNLWUA9Jo6L70oHJ2XkViIo8J2y62Sp19SYgjPH2zx9f7LS07GopjCBHjb+fbMQU7FCZUQZ7EuA8ID8VPyXtdsHo0HdiITiBjUekyB95UptZW2cqu/Jnd41oTD7+VddSHoDIYCr7eYLv9sN83/8cdOnfyScK1Tp8znEgMRBxZVKN5oXZ8OrfUvyQmt/ffRH1djpT7+CU0Db+ojXL1AHzc5swfqDHSo+MY/yEjIFsQb4rOeZE4y6RpAO3bmD8nV2ccFvRQWwrwn/hVjh2b5YNXVpOuohjEYGdWD88fQ1QMYokktuOMJ+3t10Ffplp5CAIZ8kIXonjXHRP1WxeopqW6cszJub26NESbNQPzsUgc3CukMymtPhC41aJcmxSLt7yIIZUfOpQ0eOqRlQDalubB5OtIBGHhq6LpBnsDCp9kPnDasFOWFcfMAMSWp3KLO12VFKmN1ZAkpg9jkQoPt157DaE9LD6E4TPMfJrmBSsqY0qS0h+Xdo2zPhNK1dVzFxGzhng==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(346002)(366004)(39860400002)(396003)(376002)(136003)(8676002)(4326008)(66476007)(66556008)(38100700002)(86362001)(66946007)(6486002)(6506007)(52116002)(41300700001)(478600001)(6666004)(38350700002)(316002)(26005)(54906003)(6916009)(9686003)(6512007)(33716001)(83380400001)(44832011)(186003)(8936002)(5660300002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SRUJa8Sj1w8NCRPe7bBm3xAAhALUP865z7WBnso17f3TswJ/DOBaC7wM2KZp?=
 =?us-ascii?Q?09fVmf5QijDX0dCSRc3SwidD6K1bbUxW1UvYAUzve2zsgwis2LKqgX/rBMtu?=
 =?us-ascii?Q?q2rxA+JViDgOx4ujdf4YxpU4Mqt/RqaVt42M/n9FE4cr6vS4NcYlrUdzq9G5?=
 =?us-ascii?Q?syRclEKYqFZWqYNUSJDz5XiNPViNviNFJYiXQ1+L3uj7nxEtXMmxmMtJrcrh?=
 =?us-ascii?Q?z+tuW68N+v914P+rtf0r0XfzuaAqjRjXzShJlFm8IK/lsBUGM9OS6c/1bA72?=
 =?us-ascii?Q?Y3avYP1FC2Kqt0/Sb9ivUH7p+DUa3E3VB7jOgTgs/8bGfPDHhC7+G9CUorde?=
 =?us-ascii?Q?WvNVFRr8G/XE4ubDunG5/8UqFfg/V/aatgVpPIOINLtGcYJEvXJE03kXSIqY?=
 =?us-ascii?Q?jQUZS2FNxBeQQMZWlRstUd5NNI5nVgMhjh7vlK0o+INkkt1kdOZp/LkR7+qR?=
 =?us-ascii?Q?6mlTIK4uZWEuug89vUR3mcsRVpqhp1tQRY3b9OCV3gT1FUX4Kyqed6N56Yj0?=
 =?us-ascii?Q?rhxYotY40yqVNYJRiM3Ujq7/JWmVUJUjZjXw2AxoCdWObFE6hgVFc3Y+pYO5?=
 =?us-ascii?Q?aOKE8MPfwQ4ht6xA+14YpVRi+/EH5hy5bl570lCeLdatM2TKbkNpA3BAsiqM?=
 =?us-ascii?Q?V/KXmGH1y35w3u0b6VDdxBpMfWK5kLVXb1s66ZA9tUpJVJ/S5CujUdJsGT3p?=
 =?us-ascii?Q?wPBMgUftdmjb1WM4LIH1LAf0/IuutsV5aSt0H8yxK+wZn89fUR9EGb1NKUkx?=
 =?us-ascii?Q?xjSGi9UdBCZhbwpFmZyrt4wDbRu/HNPQT1CsYfNo2GfpgiXoEhnmsbuxBQ5F?=
 =?us-ascii?Q?9UZ2htqwyalRwtLIjAHK+j44jjvZN/d9YAfYelTcmZwOKdDWIbfAxgGvqXH0?=
 =?us-ascii?Q?h5big5/NPhppoE9Rep3kvtYvi/dROexhg5/Jn9gIUbAUuACesjNq6CanhJBI?=
 =?us-ascii?Q?xfxkoKC66C639JfqfQKn6ov/l5fg+rTkAPcE5LfVYzA56Nfg6OBmRBGSlzhl?=
 =?us-ascii?Q?cbGNkyQJ6wCPbal0+y5EZ9A0AB7SP0lW2potGjvfoLihHDiD2nJdioLKXYgX?=
 =?us-ascii?Q?I8Sf/ujhDCNi4sWvFpoNaMdiF57g3qLYtlBiqpe7WaGACiI4gyOhFRfM36yF?=
 =?us-ascii?Q?iKIdNM4B8wg47ui/eYfbxkjEAn2BBBA2haTBbq/agGlGS3JBYbyR6Oc0Dv53?=
 =?us-ascii?Q?X2aKXv4EawjPOfTpa4J59BV+3JOLgBkCmPZeur+A7g6HX7LNOEWCmf6JlVQZ?=
 =?us-ascii?Q?ULJUG64sHpDKelJk2bmug7zP7cwJIpsaFih5I3F0WVYiD5ymJQeVNMGVdjmb?=
 =?us-ascii?Q?lgg6aSN2mTslBF2074py31TD1oP2indBgAIilse+eSfjOiq0NESr7sNrLJPB?=
 =?us-ascii?Q?2s3hkkGlCw3UDudkRbgZN49EkyecnTSMfDQJSHs1R++cuDGCDKjeRXSf9Czl?=
 =?us-ascii?Q?gNlkcTR9qluXUhx8XrflTbeOwuM4fgnLv+bmxfl6b75h+F8bAnYQ3dnRjWyH?=
 =?us-ascii?Q?L7KPQ66j/kTE5xS4FLqzOS1SBuHaSEjJTm6jhHPoEtMl9b+MnJk5nPkwXm4B?=
 =?us-ascii?Q?LToCHkkdGJ1RMVwwN11F9OtKybFEUB2ac4QdqN9z0q/t3F/TIYWkVLdZ0ihJ?=
 =?us-ascii?Q?ZA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7e97371-5968-4700-5af9-08da5518587a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 13:00:28.0211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vseIisUH8mXWmh+fJXcQf2eqQTavEZSuqXRp2hBeP333Ji8dH4qWHY1/tirxtGzp4l1saJXi2sEBXJCEO8pgwaaIeE04DYqqnVB3ncS1BMA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3725
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.883
 definitions=2022-06-23_05:2022-06-23,2022-06-23 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206230052
X-Proofpoint-GUID: FsTTwN2fBsFSiB1PaJpWI9FbqftfyKw-
X-Proofpoint-ORIG-GUID: FsTTwN2fBsFSiB1PaJpWI9FbqftfyKw-
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The bug is that we should still enter this loop if "tx_len" is zero.

Reported-by: Neal Liu <neal_liu@aspeedtech.com>
Fixes: c09b1f372e74 ("usb: gadget: aspeed_udc: cleanup loop in ast_dma_descriptor_setup()")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: Remove the unnecessary "chunk >= 0" condition

 drivers/usb/gadget/udc/aspeed_udc.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/aspeed_udc.c b/drivers/usb/gadget/udc/aspeed_udc.c
index d75a4e070bf7..6ff02acc5662 100644
--- a/drivers/usb/gadget/udc/aspeed_udc.c
+++ b/drivers/usb/gadget/udc/aspeed_udc.c
@@ -476,6 +476,7 @@ static int ast_dma_descriptor_setup(struct ast_udc_ep *ep, u32 dma_buf,
 {
 	struct ast_udc_dev *udc = ep->udc;
 	struct device *dev = &udc->pdev->dev;
+	bool last = false;
 	int chunk, count;
 	u32 offset;
 
@@ -493,14 +494,16 @@ static int ast_dma_descriptor_setup(struct ast_udc_ep *ep, u32 dma_buf,
 	       "tx_len", tx_len);
 
 	/* Create Descriptor Lists */
-	while (chunk > 0 && count < AST_UDC_DESCS_COUNT) {
+	while (!last && count < AST_UDC_DESCS_COUNT) {
 
 		ep->descs[ep->descs_wptr].des_0 = dma_buf + offset;
 
-		if (chunk > ep->chunk_max)
+		if (chunk > ep->chunk_max) {
 			ep->descs[ep->descs_wptr].des_1 = ep->chunk_max;
-		else
+		} else {
 			ep->descs[ep->descs_wptr].des_1 = chunk;
+			last = true;
+		}
 
 		chunk -= ep->chunk_max;
 
-- 
2.35.1

