Return-Path: <linux-usb+bounces-2845-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0956B7EA504
	for <lists+linux-usb@lfdr.de>; Mon, 13 Nov 2023 21:43:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B85CF280F7B
	for <lists+linux-usb@lfdr.de>; Mon, 13 Nov 2023 20:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACAB323776;
	Mon, 13 Nov 2023 20:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DzUQlpIL"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8564C22F18
	for <linux-usb@vger.kernel.org>; Mon, 13 Nov 2023 20:43:07 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 751E2D56;
	Mon, 13 Nov 2023 12:43:06 -0800 (PST)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ADJUUaG028485;
	Mon, 13 Nov 2023 20:42:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=R1wDfApUJdDx6Oe62ut87q6ffTO+AP8d2ixBldbstqk=;
 b=DzUQlpILfrgIqd3eAXVxmM41yMK8+FvdBEojPx5VBiAxXRTluQ0o58GBytCZG8JZxR+P
 2h3JIoDC5ZEThXLvvoH0zy5KZPdXESRBEgEVADmbcxG/fAXhFPPG1G5oawhbk4KHCFD0
 BkPunPAKr2MwJ6B6x3kLn75x+xxqSxn0e/UnY3GisclNRPF5bG1crxfnb5SiGxLCmNle
 YhCCnY03FOVKmbWNVytHxdl5GdioyP2C5hq+EXatK8Is0Q3LSREygKdGL/aP9icTrDhx
 Pnrk1xaTH2QX9u1gRGmcrxz+Gxys1lrYKcKDrUDB9moVbmV+DsBOVleEuVRCsJw987UH iQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ubf6d9rtn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Nov 2023 20:42:58 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ADKgwR5014923
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Nov 2023 20:42:58 GMT
Received: from [10.110.104.83] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Mon, 13 Nov
 2023 12:42:57 -0800
Message-ID: <25543cab-7c51-fc7f-767f-a70e5be37eab@quicinc.com>
Date: Mon, 13 Nov 2023 12:42:16 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] usb: dwc3: Fix an issue that using pm_runtime_get_sync
 incorrectly
Content-Language: en-US
To: Kunwu Chan <chentao@kylinos.cn>, <Thinh.Nguyen@synopsys.com>,
        <gregkh@linuxfoundation.org>
CC: <kunwu.chan@hotmail.com>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20231113153515.751823-1-chentao@kylinos.cn>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <20231113153515.751823-1-chentao@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 96C8uj6cFTZXo8hyjFMFJolZrRHZ5c1b
X-Proofpoint-GUID: 96C8uj6cFTZXo8hyjFMFJolZrRHZ5c1b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-13_11,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=762 mlxscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 phishscore=0 clxscore=1011 spamscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311130161

Hi,

On 11/13/2023 7:35 AM, Kunwu Chan wrote:
> pm_runtime_get_sync() also returns 1 on success.
> The documentation for pm_runtime_get_sync() suggests using
> pm_runtime_resume_and_get() instead.
> 
> Fixes: 77adb8bdf422 ("usb: dwc3: gadget: Allow runtime suspend if UDC unbinded")
> Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
> ---
>   drivers/usb/dwc3/gadget.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index 858fe4c299b7..0330de73cd9c 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -2745,7 +2745,7 @@ static int dwc3_gadget_pullup(struct usb_gadget *g, int is_on)
>   	 * successful resume, the DWC3 runtime PM resume routine will handle
>   	 * the run stop sequence, so avoid duplicate operations here.
>   	 */
> -	ret = pm_runtime_get_sync(dwc->dev);
> +	ret = pm_runtime_resume_and_get(dwc->dev);

If pm_runtime_get_sync() returns 1, that means that the runtime state is 
already in RPM_ACTIVE, so in that case, we should allow for the pullup 
routine to continue.

What is the end issue you're seeing with the current implementation?

>   	if (!ret || ret < 0) {
>   		pm_runtime_put(dwc->dev);

If you think using pm_runtime_resume_and_get() is still necessary, I 
think you'll need to figure out how to address the above put call as 
well.  pm_runtime_resume_and_get() already handles error cases and will 
call a put noidle.

Thanks
Wesley Cheng

