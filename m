Return-Path: <linux-usb+bounces-360-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8112E7A5A10
	for <lists+linux-usb@lfdr.de>; Tue, 19 Sep 2023 08:41:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9CBE01C20922
	for <lists+linux-usb@lfdr.de>; Tue, 19 Sep 2023 06:41:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 373E734197;
	Tue, 19 Sep 2023 06:41:27 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF8479C0
	for <linux-usb@vger.kernel.org>; Tue, 19 Sep 2023 06:41:25 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A86A116
	for <linux-usb@vger.kernel.org>; Mon, 18 Sep 2023 23:41:22 -0700 (PDT)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38J5j4kd029011;
	Tue, 19 Sep 2023 06:41:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=S8DOQNJ/euyiNGksYfKalyrHNlUdw5ZXpBrMMC/pU/k=;
 b=ln4VOCMrutmBzEu9wKa17+0NioEEU2bokiUvrzn+Z7sb4qMM0MJ06mWc/a3kC1kz6NQR
 Y1Oo3EhVMpa1XmxIYtsF3EYgImGdomzewk/bPd/mY8iVCCs7IDsoEqZ6OMRuLoRFktpL
 P3oZVSWIQiuMu9uhblv5Wz+bmLmaNcB918FNlCi45S9Di+3nxBFWsSH9biSbEDulKtNu
 DvVlW/kLkp7I1MT8/wICvi+V2j194KzfxPRmTGxTMvoFjTc3KHbMesrn1eXMwzz1uQni
 9dLSKvSh967E2/K/wrmS2uy7h6yyzwUuL80NhsbFHTGs9NmMBN5gl6pLkUa7n1qEAuzw FA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t6mv1t54n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Sep 2023 06:41:17 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38J6fGDV004734
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Sep 2023 06:41:16 GMT
Received: from [10.217.219.221] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Mon, 18 Sep
 2023 23:41:15 -0700
Message-ID: <daeaedc7-0fff-43f5-8fb3-d5355125f566@quicinc.com>
Date: Tue, 19 Sep 2023 12:11:12 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: XHCI: Implement xhci_handshake_check_state() API
Content-Language: en-US
To: Mathias Nyman <mathias.nyman@intel.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>
References: <20230919053934.18037-1-quic_ugoswami@quicinc.com>
From: Udipto Goswami <quic_ugoswami@quicinc.com>
In-Reply-To: <20230919053934.18037-1-quic_ugoswami@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: NBgXTdW6NzSuf2f7KvzX5_2yAtjoKlH4
X-Proofpoint-ORIG-GUID: NBgXTdW6NzSuf2f7KvzX5_2yAtjoKlH4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-18_11,2023-09-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=578 suspectscore=0 mlxscore=0
 adultscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2308100000 definitions=main-2309190055
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net



On 9/19/2023 11:09 AM, Udipto Goswami wrote:
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
>   drivers/usb/host/xhci-ring.c |  2 +-
>   drivers/usb/host/xhci.c      | 20 +++++++++++++++++++-
>   drivers/usb/host/xhci.h      |  2 ++
>   3 files changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index 1dde53f6eb31..af9e27d3d303 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -450,7 +450,7 @@ static int xhci_abort_cmd_ring(struct xhci_hcd *xhci, unsigned long flags)
>   	 * In the future we should distinguish between -ENODEV and -ETIMEDOUT
>   	 * and try to recover a -ETIMEDOUT with a host controller reset.
>   	 */
> -	ret = xhci_handshake(&xhci->op_regs->cmd_ring,
> +	ret = xhci_handshake_check_state(xhci, &xhci->op_regs->cmd_ring,
>   			CMD_RING_RUNNING, 0, 5 * 1000 * 1000);
>   	if (ret < 0) {
>   		xhci_err(xhci, "Abort failed to stop command ring: %d\n", ret);
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index e1b1b64a0723..b3407fdce288 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -84,6 +84,23 @@ int xhci_handshake(void __iomem *ptr, u32 mask, u32 done, u64 timeout_us)
>   /*
>    * Disable interrupts and begin the xHCI halting process.
>    */
> +int xhci_handshake_check_state(struct xhci_hcd *xhci,
> +	void __iomem *ptr, u32 mask, u32 done, int usec)
> +{
> +	u32	result;
> +
> +	ret = readl_poll_timeout_atomic(ptr, result,
> +				(result & mask) == done ||
> +				result == U32_MAX ||
> +				xhci->xhc_state & exit_state,
> +				1, timeout_us);
> +
> +	if (result == U32_MAX || xhci->xch_state & exit_state)
> +		return -ENODEV;
> +
> +	return ret;
> +}
> +
>   void xhci_quiesce(struct xhci_hcd *xhci)
>   {
>   	u32 halted;
> @@ -201,7 +218,8 @@ int xhci_reset(struct xhci_hcd *xhci, u64 timeout_us)
>   	if (xhci->quirks & XHCI_INTEL_HOST)
>   		udelay(1000);
>   
> -	ret = xhci_handshake(&xhci->op_regs->command, CMD_RESET, 0, timeout_us);
> +	ret = xhci_handshake_check_state(xhci, &xhci->op_regs->command,
> +						CMD_RESET, 0, timeout_us);
>   	if (ret)
>   		return ret;
>   
> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> index 7e282b4522c0..504c04d19c05 100644
> --- a/drivers/usb/host/xhci.h
> +++ b/drivers/usb/host/xhci.h
> @@ -2119,6 +2119,8 @@ void xhci_free_container_ctx(struct xhci_hcd *xhci,
>   /* xHCI host controller glue */
>   typedef void (*xhci_get_quirks_t)(struct device *, struct xhci_hcd *);
>   int xhci_handshake(void __iomem *ptr, u32 mask, u32 done, u64 timeout_us);
> +int xhci_handshake_check_state(struct xhci_hcd *xhci,
> +			void __iomem *ptr, u32 mask, u32 done, int usec);
>   void xhci_quiesce(struct xhci_hcd *xhci);
>   int xhci_halt(struct xhci_hcd *xhci);
>   int xhci_start(struct xhci_hcd *xhci);

Please ignore this one, seems the changes isn't correct.
Will push a v2 for the same.

Thanks,
-Udipto

