Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A404E69172C
	for <lists+linux-usb@lfdr.de>; Fri, 10 Feb 2023 04:37:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230383AbjBJDhg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Feb 2023 22:37:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229825AbjBJDhf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Feb 2023 22:37:35 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA63F5CBFF
        for <linux-usb@vger.kernel.org>; Thu,  9 Feb 2023 19:37:34 -0800 (PST)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31A0gNbH014783;
        Fri, 10 Feb 2023 03:37:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=2cWkX/ypDCJc55qKYlbbKOjHyU2ZlkBtCTNji5zJm9A=;
 b=cy5llTyASXbgSMiupvJ7VyNvDGliuOVzqeld6YjbfbExsFlT6IQF1qRM2FmMJ/67wXSA
 h7KU8Q1sv75n6lVIYZPOIMringwz5YI9aQuPLYbJ5n2MmJ9iHAe7FI/AnJEHfGuzeoJK
 4OzHahwKsCiJ2ufuO133+QTmvWKzEiBcknnnQ1jkuHZArgb+ZUy1RxyK80oMcqN88wm/
 NnCnbPcuqxaAQ4Zs3pFdAUjChQRp0Eh+HwbczAUCOq7stilJgpuCraTr+moDtCcNCqxu
 jmWZ1mJaHt0OtTXe8CDGgzv0AEfJHSZ3eoXRNuqLxJAvepEWVjStxnYNvmdvIp1RPaEu DA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nmww6t7p3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 10 Feb 2023 03:37:31 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31A3bUID030129
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 10 Feb 2023 03:37:30 GMT
Received: from hu-jackp-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 9 Feb 2023 19:37:29 -0800
Date:   Thu, 9 Feb 2023 19:37:20 -0800
From:   Jack Pham <quic_jackp@quicinc.com>
To:     Jerry Zhang <jerry@skydio.com>
CC:     <balbi@kernel.org>, <linux-usb@vger.kernel.org>,
        Alex Mallery <alex.mallery@skydio.com>,
        <quic_wcheng@quicinc.com>, <quic_ppratap@quicinc.com>
Subject: Re: dwc3 stuck in U3 state on USB3-only link
Message-ID: <20230210033720.GA1532651@hu-jackp-lv.qualcomm.com>
References: <CAMKO5Cs69cN+RZNvszobqpHwNNsPFafAaSUxg63sWhSGPXcjyw@mail.gmail.com>
 <20230209081136.GA31049@hu-jackp-lv.qualcomm.com>
 <CAMKO5CvCbABxEauXiojEPLK6q8543wm2SBsLisMEZ2b_-Gkx1w@mail.gmail.com>
 <CAMKO5CsEyGFQgvSM5wZUbrcR60b7rwJLGB4tNpgbsf05ta_DLg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAMKO5CsEyGFQgvSM5wZUbrcR60b7rwJLGB4tNpgbsf05ta_DLg@mail.gmail.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ttmJX9vbu52Q2b2raqvKTdd1CQQXdzyz
X-Proofpoint-ORIG-GUID: ttmJX9vbu52Q2b2raqvKTdd1CQQXdzyz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-09_17,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 mlxlogscore=513
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302100030
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Looks like our replies crossed paths...

On Thu, Feb 09, 2023 at 06:39:41PM -0800, Jerry Zhang wrote:
> ok I was actually able to get it working! setting
> snps,bus-suspend-enable; and adding this simple change
> 
> diff --git a/drivers/usb/dwc3/dwc3-msm.c b/drivers/usb/dwc3/dwc3-msm.c
> index 801381de3769..09229d25b39a 100644
> --- a/drivers/usb/dwc3/dwc3-msm.c
> +++ b/drivers/usb/dwc3/dwc3-msm.c
> @@ -6331,11 +6331,11 @@ static void handle_state_peripheral(struct
> dwc3_msm *mdwc, bool *work)
> 
>  static void handle_state_peripheral_suspend(struct dwc3_msm *mdwc)
>  {
>         struct dwc3 *dwc = platform_get_drvdata(mdwc->dwc3);
> 
> -       if (!test_bit(B_SESS_VLD, &mdwc->inputs)) {
> +       if (test_bit(B_SESS_VLD, &mdwc->inputs)) {
>                 dev_dbg(mdwc->dev, "BSUSP: !bsv\n");
>                 mdwc->drd_state = DRD_STATE_IDLE;
>                 cancel_delayed_work_sync(&mdwc->sdp_check);
>                 dwc3_otg_start_peripheral(mdwc, 0);
>         } else if (!test_bit(B_SUSPEND, &mdwc->inputs)) {
> 
> allows the device to successfully enumerate after a host reboot. Can
> you provide some feedback on the correctness of this patch?

You're inverting the conditional logic of the if check here so it's
probably not correct.  But (treading carefully here as I just mentioned I
trying not to deep dive downstream...) in doing so you are forcing the
driver to call dwc3_otg_start_peripheral(0) call, and lo and behold it
would end up calling dwc3_overide_vbus_status(false).  The msm-dwc3
state machine then probably takes you back to call start_peripheral(1)
again.

Can you try to do this more directly by toggling
dwc3_override_vbus_status() off then on again as I suggested in my
other reply?

Thanks,
Jack
