Return-Path: <linux-usb+bounces-986-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CD08B7B6073
	for <lists+linux-usb@lfdr.de>; Tue,  3 Oct 2023 07:42:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 80A602817FD
	for <lists+linux-usb@lfdr.de>; Tue,  3 Oct 2023 05:42:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D656F3FC2;
	Tue,  3 Oct 2023 05:42:07 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048C3EC8
	for <linux-usb@vger.kernel.org>; Tue,  3 Oct 2023 05:42:05 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A01A1B3
	for <linux-usb@vger.kernel.org>; Mon,  2 Oct 2023 22:42:01 -0700 (PDT)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3935GrfO020467;
	Tue, 3 Oct 2023 05:41:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=liOSk9kAbMdpvf1tCH7DTropd1lf696xuT/ZkuI8Ywo=;
 b=UI8v0pdl3sc8Hd7XpjQKn6qkiBzWzLjEX++4h+jyNwyTlEmy2V4zCZZdFbLxd92KMoME
 c3YI8EzXOx4pix8a6k0zplqlcX80YH8c74pyNsoyJrHEGqOzmEr7q3wGpMy9Wb2l3AT4
 BSbTQSqN78fu7+19GhElQYfSfLRzFsmMDb+ImdPntKlJW+6+nksKLUF9cHJpjpNGw8kR
 R5IHXSCmdmQQ+mMnelVkju72ZCWdX2dIWsoyDD0un76cLb55U65MOqtL5UmUJj5+rTct
 VA+xP+Cgcg5MB+FajF49OiM5gJwesbYzq3LScYwzKb4TRWo+83gg9HOQGmBnRa4cYEC4 1A== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tg9hdrbau-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Oct 2023 05:41:57 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3935fu4i000703
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Oct 2023 05:41:56 GMT
Received: from [10.217.219.221] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Mon, 2 Oct
 2023 22:41:54 -0700
Message-ID: <179abd6a-3c4e-456a-a946-1f8c7d715491@quicinc.com>
Date: Tue, 3 Oct 2023 11:11:51 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: XHCI: Implement xhci_handshake_check_state() API
To: Mathias Nyman <mathias.nyman@intel.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>
References: <20230919085847.8210-1-quic_ugoswami@quicinc.com>
Content-Language: en-US
From: Udipto Goswami <quic_ugoswami@quicinc.com>
In-Reply-To: <20230919085847.8210-1-quic_ugoswami@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: F2lRzNMhLCeBt_Cdk1OGcQk6-ln_HOJq
X-Proofpoint-GUID: F2lRzNMhLCeBt_Cdk1OGcQk6-ln_HOJq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-03_03,2023-10-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 mlxscore=0 suspectscore=0
 impostorscore=0 mlxlogscore=428 malwarescore=0 spamscore=0
 priorityscore=1501 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2309180000 definitions=main-2310030045
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net



On 9/19/2023 2:28 PM, Udipto Goswami wrote:
> In some situations where xhci removal happens parallel to
> xhci_handshake, we enoughter a scenario where the
> xhci_handshake will fails because the status does not change
> the entire duration of polling. This causes the xhci_handshake
> to timeout resulting in long wait which might lead to watchdog
> timeout.
> 
> The API  handles command timeout which may happen upon XHCI
> stack removal. Check for xhci state and exit the handshake if
> xhci is removed.
> 
> Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
> ---
> v2: Fixed compilation error.
> 
>   drivers/usb/host/xhci-ring.c |  5 +++--
>   drivers/usb/host/xhci.c      | 21 ++++++++++++++++++++-
>   drivers/usb/host/xhci.h      |  2 ++
>   3 files changed, 25 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index 1dde53f6eb31..26add6c23a1d 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -450,8 +450,9 @@ static int xhci_abort_cmd_ring(struct xhci_hcd *xhci, unsigned long flags)
>   	 * In the future we should distinguish between -ENODEV and -ETIMEDOUT
>   	 * and try to recover a -ETIMEDOUT with a host controller reset.
>   	 */
> -	ret = xhci_handshake(&xhci->op_regs->cmd_ring,
> -			CMD_RING_RUNNING, 0, 5 * 1000 * 1000);
> +	ret = xhci_handshake_check_state(xhci, &xhci->op_regs->cmd_ring,
> +			CMD_RING_RUNNING, 0, 5 * 1000 * 1000,
> +			XHCI_STATE_REMOVING);
>   	if (ret < 0) {
>   		xhci_err(xhci, "Abort failed to stop command ring: %d\n", ret);
>   		xhci_halt(xhci);
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index e1b1b64a0723..95b4c63dbeba 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -84,6 +84,24 @@ int xhci_handshake(void __iomem *ptr, u32 mask, u32 done, u64 timeout_us)
>   /*
>    * Disable interrupts and begin the xHCI halting process.
>    */
> +int xhci_handshake_check_state(struct xhci_hcd *xhci, void __iomem *ptr,
> +		u32 mask, u32 done, int usec, unsigned int exit_state)
> +{
> +	u32	result;
> +	int	ret;
> +
> +	ret = readl_poll_timeout_atomic(ptr, result,
> +				(result & mask) == done ||
> +				result == U32_MAX ||
> +				xhci->xhc_state & exit_state,
> +				1, usec);
> +
> +	if (result == U32_MAX || xhci->xhc_state & exit_state)
> +		return -ENODEV;
> +
> +	return ret;
> +}
> +
>   void xhci_quiesce(struct xhci_hcd *xhci)
>   {
>   	u32 halted;
> @@ -201,7 +219,8 @@ int xhci_reset(struct xhci_hcd *xhci, u64 timeout_us)
>   	if (xhci->quirks & XHCI_INTEL_HOST)
>   		udelay(1000);
>   
> -	ret = xhci_handshake(&xhci->op_regs->command, CMD_RESET, 0, timeout_us);
> +	ret = xhci_handshake_check_state(xhci, &xhci->op_regs->command,
> +				CMD_RESET, 0, timeout_us, XHCI_STATE_REMOVING);
>   	if (ret)
>   		return ret;
>   
> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> index 7e282b4522c0..06d5a90dedd5 100644
> --- a/drivers/usb/host/xhci.h
> +++ b/drivers/usb/host/xhci.h
> @@ -2119,6 +2119,8 @@ void xhci_free_container_ctx(struct xhci_hcd *xhci,
>   /* xHCI host controller glue */
>   typedef void (*xhci_get_quirks_t)(struct device *, struct xhci_hcd *);
>   int xhci_handshake(void __iomem *ptr, u32 mask, u32 done, u64 timeout_us);
> +int xhci_handshake_check_state(struct xhci_hcd *xhci, void __iomem *ptr,
> +		u32 mask, u32 done, int usec, unsigned int exit_state);
>   void xhci_quiesce(struct xhci_hcd *xhci);
>   int xhci_halt(struct xhci_hcd *xhci);
>   int xhci_start(struct xhci_hcd *xhci);

Hi All,

Gentle Reminder on this.

Thanks,
-Udipto

