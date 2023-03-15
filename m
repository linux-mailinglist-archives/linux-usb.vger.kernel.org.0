Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 081546BBB7E
	for <lists+linux-usb@lfdr.de>; Wed, 15 Mar 2023 18:55:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231244AbjCORzi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Mar 2023 13:55:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231232AbjCORze (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Mar 2023 13:55:34 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27E0A18AB3
        for <linux-usb@vger.kernel.org>; Wed, 15 Mar 2023 10:55:27 -0700 (PDT)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32FHY91N024158;
        Wed, 15 Mar 2023 17:55:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=xaAQJ3u8nAExVs6hxUMLNIDnoPdaKPcdvG07wY54jYA=;
 b=W6R7FkxCJfxfhij01CKUq/HRDD+02t9/BldFAA+JDUXfRcLLtQQmBBjB6x3XdplcZxuy
 6s/JweaElL51srfVQ/IrWvi2cIDcUSc41BM9rOb+aLoi79EyQ9sDAlA+wDA1F/eo0usI
 mDMYB9wSM89aa1ygwnm5nYB65yAzkby0P19zHS6kUnOgDG9cD4JjXmO6tysZ776ofjwN
 2RGBTPhN7FcSvEnpz2g7BgDBaCgbcgORgntgSJ3vVvjh5Dqz6WQaBu8m5uifZf/yoUsr
 AT9mpFSv+1jDzUkjSq03+5s+5EOFUNeg6Yjkm9bWMPm613CvWCzgDB9eRwLnQNxCC4uU AQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pbjfu81xu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 15 Mar 2023 17:55:24 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32FHtNRM024261
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 15 Mar 2023 17:55:23 GMT
Received: from hu-jackp-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Wed, 15 Mar 2023 10:55:23 -0700
Date:   Wed, 15 Mar 2023 10:55:19 -0700
From:   Jack Pham <quic_jackp@quicinc.com>
To:     Udipto Goswami <quic_ugoswami@quicinc.com>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v2] usb: dwc3: debugfs: Prevent any register access when
 devices is runtime suspended
Message-ID: <20230315175457.GB1742265@hu-jackp-lv.qualcomm.com>
References: <20230315124705.14723-1-quic_ugoswami@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230315124705.14723-1-quic_ugoswami@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: LkJeSs69SId2asR-trjHqn_N3eF7lKWR
X-Proofpoint-GUID: LkJeSs69SId2asR-trjHqn_N3eF7lKWR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-15_09,2023-03-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 spamscore=0 suspectscore=0 mlxlogscore=752
 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2302240000 definitions=main-2303150149
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Udipto,

On Wed, Mar 15, 2023 at 06:17:05PM +0530, Udipto Goswami wrote:
> When the dwc3 device is runtime suspended, various required clocks would
> get disabled and it is not guaranteed that access to any registers would
> work. Depending on the SoC glue, a register read could be as benign as
> returning 0 or be fatal enough to hang the system.
> 
> In order to prevent such scenarios of fatal errors, bail out of debugfs
> function is dwc3 is suspended.
> 
> Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
> ---
> v2: Replaced return 0 with -EINVAL & seq_puts with pr_err.
> 
>  drivers/usb/dwc3/debugfs.c | 50 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/debugfs.c b/drivers/usb/dwc3/debugfs.c
> index 850df0e6bcab..0e6cf7b89f8b 100644
> --- a/drivers/usb/dwc3/debugfs.c
> +++ b/drivers/usb/dwc3/debugfs.c
> @@ -544,6 +544,11 @@ static int dwc3_link_state_show(struct seq_file *s, void *unused)
>  	u32			reg;
>  	u8			speed;
>  
> +	if (pm_runtime_suspended(dwc->dev)) {
> +		pr_err("Invalid operation, DWC3 suspended!");

Use dev_err() please.

Thanks,
Jack
