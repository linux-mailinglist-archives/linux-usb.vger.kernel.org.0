Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C7CA76E404
	for <lists+linux-usb@lfdr.de>; Thu,  3 Aug 2023 11:11:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232041AbjHCJLp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Aug 2023 05:11:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234556AbjHCJLW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Aug 2023 05:11:22 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B2B03583
        for <linux-usb@vger.kernel.org>; Thu,  3 Aug 2023 02:11:08 -0700 (PDT)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3734HEut022345;
        Thu, 3 Aug 2023 09:11:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=b+N5Zbc2Ub4eW6S9yG2DM3gqbtj4xil/y/yDYHMPbo8=;
 b=Iko9iQ6+dggg/ar4WolcocYn5gqbd+BU78KmwFQ+0yetUCXMbbl+Kh46Kd7rqYzSKdHL
 d9gj+XCsCQrHcxtJMJMt/rZejpSemKiOk5EszdKFIM5e5IV7mPrUu0BPiBvxcNyAGrPK
 ntXqZJZ92fcLEgQNsRL6DJILnjPwWbz+muNFsEjXVv6tOD5voiKtAoI8jmSwlnvsx6Ka
 HEss/3jaC2weuuXraBa4PQkHJtpNyLJZ7T2z+f//C9M/JVu9WQlczlcGT/Nm9LP86qzJ
 53erS2gmb3B32W44/byeNCCM3OV5GlciFH/QcKY/ssKS1MMUAttufPRgBoh1etfESzLu tA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s83q0gkwh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 03 Aug 2023 09:11:06 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3739B5iH018336
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 3 Aug 2023 09:11:05 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Thu, 3 Aug 2023 02:11:03 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH v2 0/7] remove some usage of gadget_is_{*}speed() API
Date:   Thu, 3 Aug 2023 17:10:46 +0800
Message-ID: <20230803091053.9714-1-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: RY-qX9mMsskWb2XuKelddyVdiprcIEec
X-Proofpoint-GUID: RY-qX9mMsskWb2XuKelddyVdiprcIEec
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-03_07,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=393 priorityscore=1501 mlxscore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308030080
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series try to remove some usage of gadget_is_dualspeed(),
gadget_is_superspeed() and gadget_is_superspeed_plus().

please check each change for details.

V2: fix comments from Oliver Neukum <oneukum@suse.com>

Linyu Yuan (7):
  usb: gadget: use working speed to calcaulate network bitrate and qlen
  usb: gadget: add a inline function gether_bitrate()
  usb: gadget: f_uvc: change endpoint allocation in uvc_function_bind()
  usb: gadget: unconditionally allocate hs/ss descriptor in bind
    operation
  usb: gadget: config: remove max speed check in
    usb_assign_descriptors()
  usb: gadget: composite: cleanup function config_ep_by_speed_and_alt()
  usb: gadget: remove max support speed info in bind operation

 drivers/usb/gadget/composite.c             | 34 ++++++-------
 drivers/usb/gadget/config.c                |  8 ++--
 drivers/usb/gadget/function/f_acm.c        |  4 +-
 drivers/usb/gadget/function/f_ecm.c        | 19 ++------
 drivers/usb/gadget/function/f_eem.c        |  4 +-
 drivers/usb/gadget/function/f_loopback.c   |  4 +-
 drivers/usb/gadget/function/f_midi.c       | 56 +++++++++-------------
 drivers/usb/gadget/function/f_midi2.c      | 44 +++++++----------
 drivers/usb/gadget/function/f_ncm.c        | 23 ++-------
 drivers/usb/gadget/function/f_obex.c       |  3 +-
 drivers/usb/gadget/function/f_rndis.c      | 19 +-------
 drivers/usb/gadget/function/f_serial.c     |  4 +-
 drivers/usb/gadget/function/f_sourcesink.c |  4 +-
 drivers/usb/gadget/function/f_subset.c     |  4 +-
 drivers/usb/gadget/function/f_uvc.c        | 36 +++++---------
 drivers/usb/gadget/function/u_ether.c      |  5 +-
 drivers/usb/gadget/function/u_ether.h      | 13 +++++
 17 files changed, 99 insertions(+), 185 deletions(-)

-- 
2.17.1

