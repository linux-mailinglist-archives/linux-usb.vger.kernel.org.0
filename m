Return-Path: <linux-usb+bounces-1067-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F5C7B78E2
	for <lists+linux-usb@lfdr.de>; Wed,  4 Oct 2023 09:40:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sy.mirrors.kernel.org (Postfix) with ESMTP id 35F11B2091F
	for <lists+linux-usb@lfdr.de>; Wed,  4 Oct 2023 07:40:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E32D2D507;
	Wed,  4 Oct 2023 07:40:43 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7FF568B
	for <linux-usb@vger.kernel.org>; Wed,  4 Oct 2023 07:40:41 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82FC99B
	for <linux-usb@vger.kernel.org>; Wed,  4 Oct 2023 00:40:40 -0700 (PDT)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3947CRlH032581;
	Wed, 4 Oct 2023 07:40:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=beHtcsQ63LMmHEJI0mWIG8oU2aan9VoL1BlPmtwtCxQ=;
 b=hcMxPGH3Pr0BPMcx9+Y1925p/xAL/5PRTI3LWkqRH2jiBUtlrVDeXV53wZmQRKYu+hsK
 mopRxQRJsvq4ugL4Zh7wXu6vZrG/bh1yXRc/A++BrMdR02Lhu5yM/MS3AHm3ZzTck1qH
 6mjZJxXF0CMlqKrTmRACSrYk97BXjkJlqqeEUI5ck1JXCiZtzxbrOncbjRmtq9cr/dfb
 wID75xqLUXfNMZRUmw6qOnWsSfs+/H/ZpVTSwyQozqT35sfr524BlFICQPg4XNG1oxRi
 V5DjB8rjBI246/0VGzCKwf9yU3o+Mciq9N4w9XJkvGYwAf0TfbcN58KJLKl7mr1XLdNa Iw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tgqr19eky-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Oct 2023 07:40:35 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3947eYqD027110
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Oct 2023 07:40:34 GMT
Received: from [10.216.59.4] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Wed, 4 Oct
 2023 00:40:32 -0700
Message-ID: <e58ec88c-142d-49d2-875a-4b5c90929d31@quicinc.com>
Date: Wed, 4 Oct 2023 13:10:29 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 00/13] Add multiport support for DWC3 controllers
From: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen
	<Thinh.Nguyen@synopsys.com>
CC: Jack Pham <quic_jackp@quicinc.com>,
        Wesley Cheng
	<quic_wcheng@quicinc.com>,
        "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>
References: <20230828133033.11988-1-quic_kriskura@quicinc.com>
 <0814b6a2-c52d-4be2-ae06-8391767ac144@quicinc.com>
Content-Language: en-US
In-Reply-To: <0814b6a2-c52d-4be2-ae06-8391767ac144@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Qtu6WAKZ0BkPPOZT_K7yK5icaza1y3nb
X-Proofpoint-GUID: Qtu6WAKZ0BkPPOZT_K7yK5icaza1y3nb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-04_01,2023-10-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 mlxscore=0 phishscore=0 adultscore=0 mlxlogscore=560
 bulkscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2309180000 definitions=main-2310040053
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hi Greg,

  Thanks for picking first 3 patches into usb-testing branch.

  Can you help pick patches 4/5 of this series as well into usb-testing 
(I checked and they apply cleanly) so that I can fix comments and rebase 
patches starting from 6 to 13 in my v12.

  Patch 4 been approved yesterday by Thinh and so far no kernel build 
bot has reported issues on these 2 patches for any configs (on v9 / v10 
/ v11).

Regards,
Krishna,

