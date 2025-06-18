Return-Path: <linux-usb+bounces-24880-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 739D3ADECA8
	for <lists+linux-usb@lfdr.de>; Wed, 18 Jun 2025 14:38:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF8E91617A0
	for <lists+linux-usb@lfdr.de>; Wed, 18 Jun 2025 12:33:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C142A2EE5EA;
	Wed, 18 Jun 2025 12:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MZPG4WKA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B152EE274
	for <linux-usb@vger.kernel.org>; Wed, 18 Jun 2025 12:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750249707; cv=none; b=T3jUsZWkA3PmgGDsD+O7wN/rDK0EYti7B7qmBMg3dSyYjaEDDRETwMeGGj3XhW821qn5K2JhI2AFjpwl7n7aGOCYJgAgcM/CYwLI7kxe2Os/iy2JW979WrJXqAQi4gCnuES+Bw7QwkttyiOf+Afwl+DLNG1bipuNxJ+aYjjrB4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750249707; c=relaxed/simple;
	bh=SGGHR1NqClMJ+M0KMBTSpiEtbyInmggJO689JFl72EQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H4P+eWSu8y6AiNdlU8SR04sUC6nrtinyPsbR2bpD+fpyax68NRH7YGkvg2eTjJydxZ6zcZO9uTnWkZdjWehBIyLI3qlTCtD6BUvm/hakxlrdaSmK1zSk0Tv3l1/v77wdmrtxe5UJpF1Rxwgs4atmnkvsJAjtScRCdv4rPtBwJFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MZPG4WKA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I9iOUv005767
	for <linux-usb@vger.kernel.org>; Wed, 18 Jun 2025 12:28:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p6xOgbRbrA02R3HdzmsRIbjOdD2Sg37CCZtJoQqYbhk=; b=MZPG4WKAV0kt7XDj
	quCCDZ8Wo/h02Nrvsnn0wdVIbIyNcQxmq6/vzaxOohmASW0V3ugYzTvMB1xgfdW7
	cTgUrpNYqWQvils8cdFpl0TaC10qOCjJYhm71e+O0PYquvFC8pjGOZ09S3lra0xS
	eVSiRM2D32M1fT9a3Emhd/QvSjMjk2TTC5DXYNErB3W+9huUeSKJc9oHbuFzMjQS
	8pzKNbjjSGPIeAvXhwO/J9Ex63p5bv31W07F2EPnKmviK485bmj0duAFrGvdaCyu
	tuNXd0tZwE1S82ldLvv0bBfAqePg3l3Q0jgkk6tH+Yf3xXZ7Y8uJCOVZDFKpO++Q
	aQMn8Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hd46pa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 18 Jun 2025 12:28:23 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-311ef4fb5fdso6060119a91.1
        for <linux-usb@vger.kernel.org>; Wed, 18 Jun 2025 05:28:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750249702; x=1750854502;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p6xOgbRbrA02R3HdzmsRIbjOdD2Sg37CCZtJoQqYbhk=;
        b=v/gBonqFgngbl/8DuqTHd/UxxoZroMOcTN5NOvphvR7OkuWrNI5e+lb1Zlp4kmM5NS
         q0k/dzr3Ce7D33d9kTdsLiAnFSCVdmWOUvUwflB4x1c/nKA/y+y6DWdqkIoI7eEjvtCP
         uQ4kTJq+j6g2p5MEnRn21PjqiG/DkefFMElWWSAL5aBc1dGm0/F1AyrmycLn7LdLEks1
         shOjuijqO2g81r44giTnsjdn5fygx3M/4068pK0iJQHg9WPTpF2J0ybkgrToBnUwkjwp
         nMOHltAicw6HS7VvKtTHF3ThTwr6phq8Izac2qiH9O7XoAu2EBLd1sNRvHwFeDygHsC5
         fu1Q==
X-Gm-Message-State: AOJu0Yxz8KRX5hFqejeo/8/SmAbc8Tp12897/hfXAGIiLn6o/bpT0hul
	n1ZxN3/sWAzWZ4zh1TzmDHmBTO+FvT5ZNHwmTUX2P9yyeAYjoSVAkansnBZYTTHC3oTUwpF5d/X
	/8VvKtNFvKDKkYdIvJykic88I2rhyj7W7zk01xqwfC8DRxp40wINBxGXtkzFlMxQ=
X-Gm-Gg: ASbGncvUv1Rdp60Oe61+Xidc8A3sIAOZIs0I4xr3Ayac1QncL9bf/s+QzHWeR085Bs0
	RZzgNli9DwBPinHPZXw2bZAT3Uuzd5DJy4agmDM023/ziRVONV9jkWlJ6ykXLGOePGYbWTkPvpb
	dW9WQ4ncfDe+3IYHiQfF9qP2LqrxjvBAYUn7HtveJJ+xhTb/+6QHWbXFJvgL9w9RQs3a6TaEmpz
	RGjBMRWOz0cAUI+Zs8UnSXBtHyQgtup4WGVL5AHzN9hTf2aKVjZ5ZRS9J7mz9MIWw2o+EeHI3Oi
	ig0N8pNxCE3wXdXcuGUfT8jHci/G3ox43+UdN5dkY1wl/Oft+xY=
X-Received: by 2002:a17:90b:3c48:b0:311:a54d:8492 with SMTP id 98e67ed59e1d1-313f1be19abmr24396521a91.6.1750249702460;
        Wed, 18 Jun 2025 05:28:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0s0iFtkw1AOj/1npoQmPFdLviiscI3pzr93fmguRPHGKNJ3kN5JB6C41oFBZfgOjZSxk+9g==
X-Received: by 2002:a17:90b:3c48:b0:311:a54d:8492 with SMTP id 98e67ed59e1d1-313f1be19abmr24396472a91.6.1750249701999;
        Wed, 18 Jun 2025 05:28:21 -0700 (PDT)
Received: from [10.218.10.142] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1bd9ae1sm14159310a91.18.2025.06.18.05.28.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 05:28:21 -0700 (PDT)
Message-ID: <2fadb854-f838-44c9-968e-96f0c00f4d3e@oss.qualcomm.com>
Date: Wed, 18 Jun 2025 17:58:16 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] Revert "usb: gadget: u_serial: Add null pointer
 check in gs_start_io"
To: Kuen-Han Tsai <khtsai@google.com>, gregkh@linuxfoundation.org,
        hulianqin@vivo.com, krzysztof.kozlowski@linaro.org, mwalle@kernel.org,
        jirislaby@kernel.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250617050844.1848232-1-khtsai@google.com>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <20250617050844.1848232-1-khtsai@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDEwNSBTYWx0ZWRfXydxPr67ySHIP
 c7jGWVhphnOLRGQoyqsC3b8BxuY06qv5AKPgZ7+8v32AYYVCSqs4W0QlbfqNG/RBOTMR8Y/ARdY
 oBxCTzAFuDD+INOCwkMEdEd9IUxYP+/iCfcum3ocwFlY4zddaaJPR0E2hgpt+8hZPaZej+AUxzg
 Mjw396z3pryjQ3g5whIK3tbIGO0I9NEw5SpJGlAT567Kxhya+IW7tCad05MKvLfdUoCMIkOPQ1V
 kx/OoSQi1CbIq2yxDEvLcC/QqBv54lcUy7C2FJA3T582FMbLcERwKQloWtCqLQacupzwYAr3x5i
 zzUAQecAZzgZ4RlpYwlneJocMmUsno8Bwb0/k2fk26Y7KTFOTJgRmzDA7IwDLxXG0MGzkPdeTqf
 q2kbmaf/R9K2g5UMr1HbeoALiqhRZSOdWYhzjlctXyal/LISOOYHLQFwkQEMkTjJoEwo7dez
X-Authority-Analysis: v=2.4 cv=PtaTbxM3 c=1 sm=1 tr=0 ts=6852b0e7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=1XWaLZrsAAAA:8 a=EUspDBNiAAAA:8
 a=-OAJHiNwx6N_JZPXFJwA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 3ZMK4B4OsUw8d6evlSD1ncg1kApAU_1Z
X-Proofpoint-GUID: 3ZMK4B4OsUw8d6evlSD1ncg1kApAU_1Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 mlxlogscore=551 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506180105



On 6/17/2025 10:37 AM, Kuen-Han Tsai wrote:
> This reverts commit ffd603f214237e250271162a5b325c6199a65382.
> 
> Commit ffd603f21423 ("usb: gadget: u_serial: Add null pointer check in
> gs_start_io") adds null pointer checks at the beginning of the
> gs_start_io() function to prevent a null pointer dereference. However,
> these checks are redundant because the function's comment already
> requires callers to hold the port_lock and ensure port.tty and port_usb
> are not null. All existing callers already follow these rules.
> 
> The true cause of the null pointer dereference is a race condition. When
> gs_start_io() calls either gs_start_rx() or gs_start_tx(), the port_lock
> is temporarily released for usb_ep_queue(). This allows port.tty and
> port_usb to be cleared.
> 
> Fixes: ffd603f21423 ("usb: gadget: u_serial: Add null pointer check in gs_start_io")
> Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
> ---

Reviewed-by: Prashanth K <prashanth.k@oss.qualcomm.com>

> v2:
> - Remove Cc: stable
> 
> ---
>  drivers/usb/gadget/function/u_serial.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
> index ab544f6824be..c043bdc30d8a 100644
> --- a/drivers/usb/gadget/function/u_serial.c
> +++ b/drivers/usb/gadget/function/u_serial.c
> @@ -544,20 +544,16 @@ static int gs_alloc_requests(struct usb_ep *ep, struct list_head *head,
>  static int gs_start_io(struct gs_port *port)
>  {
>  	struct list_head	*head = &port->read_pool;
> -	struct usb_ep		*ep;
> +	struct usb_ep		*ep = port->port_usb->out;
>  	int			status;
>  	unsigned		started;
> 
> -	if (!port->port_usb || !port->port.tty)
> -		return -EIO;
> -
>  	/* Allocate RX and TX I/O buffers.  We can't easily do this much
>  	 * earlier (with GFP_KERNEL) because the requests are coupled to
>  	 * endpoints, as are the packet sizes we'll be using.  Different
>  	 * configurations may use different endpoints with a given port;
>  	 * and high speed vs full speed changes packet sizes too.
>  	 */
> -	ep = port->port_usb->out;
>  	status = gs_alloc_requests(ep, head, gs_read_complete,
>  		&port->read_allocated);
>  	if (status)
> --
> 2.50.0.rc2.692.g299adb8693-goog
> 


