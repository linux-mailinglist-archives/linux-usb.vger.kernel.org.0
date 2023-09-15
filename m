Return-Path: <linux-usb+bounces-110-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAB37A1525
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 07:11:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E05A62817C6
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 05:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A319F3FC2;
	Fri, 15 Sep 2023 05:11:44 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F04AEC8
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 05:11:42 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9716270E
	for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 22:11:40 -0700 (PDT)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38F4xTuV026872;
	Fri, 15 Sep 2023 05:11:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=aVqBn+xd2cDJ3otddJIojom0+YElHPLczxIVX0WZWIE=;
 b=eOR6MRmt7RanhRHZX8Vv3eKBznja9MO7J4wgVoBYdQ8I6374LWXDcY7NJvh8lbR9wlWa
 +xeVjynpEnLfBKPfeyz7ztnVw0nj/+rK81SYxgy3I3Qyu113Nbw5Vn/riKe8Zd2sK+zZ
 s2WnIO+4Et7xBTBFJ2ccOpfsnEwIbrRjbxERkKmXjvP+XEzLlQNx7PeI2cQLrEp0W+0u
 NM1nQpPznfG/ezraJF+JZ5UC0cPSrCrTMOF1Pqsr8kzQ6ZDaxW4Gd6p7CP/lgY70CYnh
 EQMG4BvMwtc2sH9vj9sCHTb3ublGOJXhCejmqN3XyRr800UDYGW4Ib42s0IRVEm+UNeO 0Q== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t4g86r2hn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Sep 2023 05:11:37 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38F5BaIW008701
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Sep 2023 05:11:36 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Thu, 14 Sep 2023 22:11:34 -0700
From: Linyu Yuan <quic_linyyuan@quicinc.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Alan Stern
	<stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH v5 0/3] usb: gadget: reduce usb gadget trace event buffer usage
Date: Fri, 15 Sep 2023 13:11:20 +0800
Message-ID: <20230915051123.26486-1-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: r6kF2B8T81W8VcB_GR7sCuznGGxemHaE
X-Proofpoint-ORIG-GUID: r6kF2B8T81W8VcB_GR7sCuznGGxemHaE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-15_04,2023-09-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0
 spamscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=436
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309150045
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

some trace event use an interger to to save a bit field info of gadget,
also some trace save endpoint name in string forat, it all can be
chagned to other way at trace event store phase.

bit field can be replace with a union interger member which include
multiple bit fields.

ep name stringe can be replace to a interger which contaion number
and dir info.

in order to avoid big endian issue, save interger data into ring
buffer in __le32 format.

backgroud:
the benefit is when user not increase system trace event buffer space,
or in lower system trace event buffer space, it allow more trace event
entries to be saved.


in normal condition, the usb request is most frequent things after
enumeration with useful operation,
so take below trace event class for explanation,


DECLARE_EVENT_CLASS(udc_log_req,
    TP_PROTO(struct usb_ep *ep, struct usb_request *req, int ret),
    TP_ARGS(ep, req, ret),
    TP_STRUCT__entry(
        __string(name, ep->name)
        __field(unsigned, length)
        __field(unsigned, actual)
        __field(unsigned, num_sgs)
        __field(unsigned, num_mapped_sgs)
        __field(unsigned, stream_id)
        __field(unsigned, no_interrupt)
        __field(unsigned, zero)
        __field(unsigned, short_not_ok)
        __field(int, status)
        __field(int, ret)
        __field(struct usb_request *, req)
    ),
    TP_fast_assign(
        __assign_str(name, ep->name);
        __entry->length = req->length;
        __entry->actual = req->actual;
        __entry->num_sgs = req->num_sgs;
        __entry->num_mapped_sgs = req->num_mapped_sgs;
        __entry->stream_id = req->stream_id;
        __entry->no_interrupt = req->no_interrupt;
        __entry->zero = req->zero;
        __entry->short_not_ok = req->short_not_ok;
        __entry->status = req->status;
        __entry->ret = ret;
        __entry->req = req;
    ),
    TP_printk("%s: req %p length %d/%d sgs %d/%d stream %d %s%s%s status %d --> %d",
        __get_str(name),__entry->req,  __entry->actual, __entry->length,
        __entry->num_mapped_sgs, __entry->num_sgs, __entry->stream_id,
        __entry->zero ? "Z" : "z",
        __entry->short_not_ok ? "S" : "s",
        __entry->no_interrupt ? "i" : "I",
        __entry->status, __entry->ret
    )
);


consider 32 bit ARCH,
without change, one trace entry size is:
4 (ring buffer event header ) + 8 (trace event header ) +
48 (trace class header) + 9 (ep string name) = 69 bytes.

with change,
4 (ring buffer event header ) + 8 (trace event header ) +
36 (trace class header)  = 48 bytes.

consider there is 1MB trace buffer space,
without change, it can save 15196 entries,
with change, it can save 21845 entries. 


v1: https://lore.kernel.org/linux-usb/20230911042843.2711-1-quic_linyyuan@quicinc.com/
v2: fix two compile issues that COMPILE_TEST not covered
    https://lore.kernel.org/linux-usb/20230911112446.1791-1-quic_linyyuan@quicinc.com/
v3: fix reviewer comments, allow bit fields work on both little and big endian
    https://lore.kernel.org/linux-usb/20230912104455.7737-1-quic_linyyuan@quicinc.com/
v4: add DECLARE_EVENT_CLASS_PRINT_INIT() new trace class and use it
    https://lore.kernel.org/linux-usb/20230914100302.30274-1-quic_linyyuan@quicinc.com/
v5: use cpu_to_le32() at fast assign stage to fix endian issue

Linyu Yuan (3):
  usb: gadget: add anonymous definition in some struct for trace purpose
  usb: udc: trace: reduce buffer usage of trace event
  usb: dwc3: trace: reduce buffer usage of trace event

 drivers/usb/dwc3/trace.h       |  63 +++++------
 drivers/usb/gadget/udc/trace.h | 114 +++++--------------
 include/linux/usb/gadget.h     | 201 ++++++++++++++++++++++++++-------
 3 files changed, 219 insertions(+), 159 deletions(-)

-- 
2.17.1


