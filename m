Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E61964D624
	for <lists+linux-usb@lfdr.de>; Thu, 15 Dec 2022 06:26:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbiLOF0W (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Dec 2022 00:26:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbiLOF0U (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Dec 2022 00:26:20 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E45A33135F
        for <linux-usb@vger.kernel.org>; Wed, 14 Dec 2022 21:26:17 -0800 (PST)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BF4G3B0031365;
        Thu, 15 Dec 2022 05:26:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=Eyda4n/cC2w3sqOYD4nuD8Wku2FohBEp7lZHjsQ4khk=;
 b=m+AXxIK1GnXjCWF3IMrLvfvWMR6ow0kYL+HPivQPcmdipyITlkeFm7jEL7cFLDL/6xOD
 RgXaoUSIlUL22b/0skCY6oGEPVX63qp+t2W8LFutlEegU4U7LSj+ZqAy4NuhpExby3wC
 eTRmf0hYGFo8Ro3i61N9MVgN3EIHVtmeug+LBWsLKX/XnuUyXQnRS1CnbQlL16rvwKlq
 3NoLwEnGQDmkUxhRrWDA+KoQiinFUpqFtj0+hISFstw+aLVe0lmh0HtcraiXG25DjlAA
 orG6BEsTsV/HHhSulCCzTu01uZzSES6rOTQdt5Usq9uP5FHRmv7nduJUyJptlekT6fT8 DA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mf6rck7yt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 15 Dec 2022 05:26:08 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BF5Q7TX025911
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 15 Dec 2022 05:26:07 GMT
Received: from hu-ugoswami-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Wed, 14 Dec 2022 21:26:05 -0800
From:   Udipto Goswami <quic_ugoswami@quicinc.com>
To:     John Keeping <john@metanate.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>
CC:     Jack Pham <quic_jackp@quicinc.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v4 0/2] usb: gadget: f_fs: Prevent race between functionfs_unbind & ffs_ep0_queue_wait
Date:   Thu, 15 Dec 2022 10:55:44 +0530
Message-ID: <20221215052546.8761-1-quic_ugoswami@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: KzhM61RYCz7qijBkgrdHLmM8e5Pbdblv
X-Proofpoint-ORIG-GUID: KzhM61RYCz7qijBkgrdHLmM8e5Pbdblv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-15_02,2022-12-14_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 mlxlogscore=350 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212150040
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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

