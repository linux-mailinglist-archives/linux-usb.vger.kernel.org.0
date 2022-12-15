Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D41664D626
	for <lists+linux-usb@lfdr.de>; Thu, 15 Dec 2022 06:29:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229683AbiLOF31 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Dec 2022 00:29:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbiLOF3X (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Dec 2022 00:29:23 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1020354473
        for <linux-usb@vger.kernel.org>; Wed, 14 Dec 2022 21:29:21 -0800 (PST)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BF02Zd9009332;
        Thu, 15 Dec 2022 05:29:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=95tAXWXHPlnRZ0bp4xzKOcxrQSVML+GCwR4L2ZcfrU8=;
 b=pwo20nKgiffrsixOFHTyygosOksc1P9dtmpUcLdx5Iy3OSRqQ3QJp/losqQM0fNUH/t1
 CU28yMDYCGFuXzP+gvMUr0dsJ9+HFA7gIv+AL5FQ5DauwKXp2Yw83Nl3xg83t5u/ZSgh
 DwZEH1ANKUl+41D3jR2fxmdlg1PVkt/SGq7+alMtrLphikwB6IN15EzS94nndV88HAtU
 ctrcHmajRjrT4TBbnYGpyvgHmydQ+xJiB2advT3DI0zh9xqao1ugyKJXl7dfHZR3Jm/w
 YhRawJUsV64P2P5vO1WOIaPvPtSk/BPEiP/AegqdbENYHllhIkw/RU5LjtOGyE159q9q PA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mf6rrkbep-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 15 Dec 2022 05:29:18 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BF5THeJ024061
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 15 Dec 2022 05:29:17 GMT
Received: from hu-ugoswami-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Wed, 14 Dec 2022 21:29:14 -0800
From:   Udipto Goswami <quic_ugoswami@quicinc.com>
To:     John Keeping <john@metanate.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>
CC:     Jack Pham <quic_jackp@quicinc.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v4 0/2] usb: gadget: f_fs: Prevent race between functionfs_unbind & ffs_ep0_queue_wait
Date:   Thu, 15 Dec 2022 10:59:04 +0530
Message-ID: <20221215052906.8993-1-quic_ugoswami@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: I4dq_O1MtQhqrEPQd_RIMLk2wV7hlRfq
X-Proofpoint-ORIG-GUID: I4dq_O1MtQhqrEPQd_RIMLk2wV7hlRfq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-15_02,2022-12-14_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=403
 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212150040
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series will prevent race between ep0_queue_wait &
functionfs_unbind. Currently, both routines are running
without any kind of serialization to make sure ep0req
doesn't get corrupted.

Changes in v4:
Split the implementation of v3 [1] into a series for better clarity.
Also, tested the patches by running USB plug-in/plug-out along with
composition switch.

Changes in v3:
Moved dequeue out of mutex to prevent deadlock.

Changes in v2:
Replaces spinlock with mutex & added dequeue operation in unbind.

[1]: https://patchwork.kernel.org/project/linux-usb/patch/20221125054119.25135-1-quic_ugoswami@quicinc.com/

Udipto Goswami (2):
  usb: gadget: f_fs: Prevent race during ffs_ep0_queue_wait
  usb: gadget: f_fs: Ensure ep0req is dequeued before free_request

 drivers/usb/gadget/function/f_fs.c | 7 +++++++
 1 file changed, 7 insertions(+)

-- 
2.17.1

