Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3323E76DFA5
	for <lists+linux-usb@lfdr.de>; Thu,  3 Aug 2023 07:18:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232372AbjHCFSz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Aug 2023 01:18:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232291AbjHCFSx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Aug 2023 01:18:53 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 637031B4
        for <linux-usb@vger.kernel.org>; Wed,  2 Aug 2023 22:18:52 -0700 (PDT)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3735FDgm020916;
        Thu, 3 Aug 2023 05:18:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=r7CXV1K2k31n/kgF6YyewE/g+B0xLq3AQbBNsPsTlrw=;
 b=pPMsBY/LHA6oSoDEYbwh/tyPgYa++2+tcK40uhLvZdhEs696t7pL4bRycWA/+J9FDiyw
 y3tfYLfFoXLPOQ8C3qJWpiZKWRWGmrg1xYwUHzFh/MeXOgAUZ+TrwRlxsck27Hy1/itc
 5oQkr7ap4KH+x92e5aRGAwKvNt49DYhL5R3go0Jd76YFRl6pAxylSc6PvVfHR8lkDpeO
 48XT16RAzZDWv3Y+26E/srwSGepzmNwJFcwaxi5ELklF2a/qvU/jVhIuwdeaHVSm+9Tj
 8Bt4m0cHXwskAN42eHVKOU8qPPoOe16WB8RowIICeq6fRW+8icTVHtnwtwWLz/Ljumyf 6A== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s85fxr1fw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 03 Aug 2023 05:18:51 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3735InW5017238
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 3 Aug 2023 05:18:49 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Wed, 2 Aug 2023 22:18:47 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH 0/7] remove some usage of gadget_is_{*}speed() API
Date:   Thu, 3 Aug 2023 13:18:03 +0800
Message-ID: <20230803051810.2974-1-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _xtGNlGG5uqQ1SIAzE_ZIPatsmV5fqUW
X-Proofpoint-ORIG-GUID: _xtGNlGG5uqQ1SIAzE_ZIPatsmV5fqUW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-03_02,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 mlxscore=0 clxscore=1011 priorityscore=1501 mlxlogscore=531 bulkscore=0
 phishscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308030048
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series try to remove some usage of gadget_is_dualspeed(),
gadget_is_superspeed() and gadget_is_superspeed_plus().

please check each change for details.

Linyu Yuan (7):
  usb: gadget: f_ecm: fix ecm_bitrate() for SuperSpeed and above
  usb: gaget: use working speed to calcaulate network bitrate and qlen
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
 drivers/usb/gadget/function/f_ecm.c        | 12 ++---
 drivers/usb/gadget/function/f_eem.c        |  4 +-
 drivers/usb/gadget/function/f_loopback.c   |  4 +-
 drivers/usb/gadget/function/f_midi.c       | 56 +++++++++-------------
 drivers/usb/gadget/function/f_midi2.c      | 44 +++++++----------
 drivers/usb/gadget/function/f_ncm.c        | 10 ++--
 drivers/usb/gadget/function/f_obex.c       |  3 +-
 drivers/usb/gadget/function/f_rndis.c      | 10 ++--
 drivers/usb/gadget/function/f_serial.c     |  4 +-
 drivers/usb/gadget/function/f_sourcesink.c |  4 +-
 drivers/usb/gadget/function/f_subset.c     |  4 +-
 drivers/usb/gadget/function/f_uvc.c        | 36 +++++---------
 drivers/usb/gadget/function/u_ether.c      |  5 +-
 16 files changed, 92 insertions(+), 150 deletions(-)

-- 
2.17.1

