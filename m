Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A6186CA0FD
	for <lists+linux-usb@lfdr.de>; Mon, 27 Mar 2023 12:12:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233486AbjC0KMk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Mar 2023 06:12:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232598AbjC0KMh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Mar 2023 06:12:37 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 552AC4C3E
        for <linux-usb@vger.kernel.org>; Mon, 27 Mar 2023 03:12:36 -0700 (PDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32RA6ltK007270;
        Mon, 27 Mar 2023 10:12:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=1r5mxN4t7pbo0qiCyyLZRgIUhvIojFhAbi25ytEx2mc=;
 b=hbTh7xQFzAD9Ga8OvYfPDjN6jj7FbE4DvTEJCEGapccv4Z5oKxvVRUq6H6lmAx54KwaJ
 gAlCeBUlzIIUrcJkxJVQohsLCAcUZ50AkpwLWnT6YOi6+JdoMJ9IytDKgayTNXebHnEs
 sLjW8na80x7h1fx6E74bh3ydDNLnb/Wk4v/y7LtzIhvvAg7lwp1h2/tc5ug73YqzBvEZ
 F5vDsItR4V+5QCTYTwbHYhyOqdjmKfqcLIYNjofxnkdXCsPINzMfZ5pLkWwasilj2pzl
 hsOinmIytufZKNfNXm8uS+GVm5NqtlIUMKCkr0KLXstNXkMYKGjcKd7ylbmxe9y0O/jT Rw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3phte8byef-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Mar 2023 10:12:34 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32RACXHZ021046
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Mar 2023 10:12:33 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Mon, 27 Mar 2023 03:12:32 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH v3 4/6] usb: gadget: f_fs: add a device reference of usb_gadget->dev
Date:   Mon, 27 Mar 2023 18:12:18 +0800
Message-ID: <1679911940-4727-4-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1679911940-4727-1-git-send-email-quic_linyyuan@quicinc.com>
References: <1679911940-4727-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: MB1WcMJAWcUPzeHzLSGwoiD3y1xhhpVE
X-Proofpoint-ORIG-GUID: MB1WcMJAWcUPzeHzLSGwoiD3y1xhhpVE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 mlxscore=0
 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=542 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303270081
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

It is known that dev_vdbg() macro can accept NULL or non-NULL dev pointer.

Add a struct device *dev member in struct ffs_data, set it to NULL before
binding or after unbinding to a usb_gadget, set it reference of usb_gadget
->dev when bind success.

Then it can help replace private pr_vdebug() to dev_vdbg() consistently.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
v3: new patch in this version

 drivers/usb/gadget/function/f_fs.c | 3 +++
 drivers/usb/gadget/function/u_fs.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index a4051c8..25461f1 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -1722,6 +1722,7 @@ static struct ffs_data *ffs_data_new(const char *dev_name)
 		return NULL;
 	}
 
+	ffs->dev = NULL;
 	refcount_set(&ffs->ref, 1);
 	atomic_set(&ffs->opened, 0);
 	ffs->state = FFS_READ_DESCRIPTORS;
@@ -1831,6 +1832,7 @@ static int functionfs_bind(struct ffs_data *ffs, struct usb_composite_dev *cdev)
 	}
 
 	ffs->gadget = cdev->gadget;
+	ffs->dev = &cdev->gadget->dev;
 	ffs_data_get(ffs);
 	return 0;
 }
@@ -1843,6 +1845,7 @@ static void functionfs_unbind(struct ffs_data *ffs)
 		mutex_lock(&ffs->mutex);
 		usb_ep_free_request(ffs->gadget->ep0, ffs->ep0req);
 		ffs->ep0req = NULL;
+		ffs->dev = NULL;
 		ffs->gadget = NULL;
 		clear_bit(FFS_FL_BOUND, &ffs->flags);
 		mutex_unlock(&ffs->mutex);
diff --git a/drivers/usb/gadget/function/u_fs.h b/drivers/usb/gadget/function/u_fs.h
index 4b3365f..c5f6167 100644
--- a/drivers/usb/gadget/function/u_fs.h
+++ b/drivers/usb/gadget/function/u_fs.h
@@ -146,6 +146,7 @@ enum ffs_setup_state {
 
 struct ffs_data {
 	struct usb_gadget		*gadget;
+	struct device			*dev;
 
 	/*
 	 * Protect access read/write operations, only one read/write
-- 
2.7.4

