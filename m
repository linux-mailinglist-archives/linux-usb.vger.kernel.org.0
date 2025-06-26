Return-Path: <linux-usb+bounces-25113-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09009AE9612
	for <lists+linux-usb@lfdr.de>; Thu, 26 Jun 2025 08:22:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E6FC4A4D16
	for <lists+linux-usb@lfdr.de>; Thu, 26 Jun 2025 06:22:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AB612264B9;
	Thu, 26 Jun 2025 06:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KsrWjc8L"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C278C1A0BF1
	for <linux-usb@vger.kernel.org>; Thu, 26 Jun 2025 06:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750918961; cv=none; b=a7S7aDB7HCTkbNgvWXm3GavamD4t5oDXBkIQpyK+e/ZIQ3Vt7UEAH7DlQ5H7bfj5ayx0eQf3XZaC7ZEX4dBvBwqQ7mTWjaeXAHliPdVHZ7WQjAy4VRwyQPJ02bmdnar6WH4EW+4Ka7fU8OGr0Qnv7cftqwM+CJ8Yxty1c39Si+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750918961; c=relaxed/simple;
	bh=64n7Y+v+2GRFaRX4HmhQunPzsYfFbpX1pES2JJZt9rw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FrzKKpxPbR8btdu4/jIoIZx7sALo7r+599MKBuEggXfJ0BOMdpgNYO2iDInBKV41hxqwGie/zeQqeoGjZ2YMcmZcCd6XXUEx5bbczBCO956HarzULlANsFnCr4Y+hQGK3EuFsFpjkiwDUpDXshMzhamKh6p7+SkylFl7ERSzVCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KsrWjc8L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q0DmxM013329
	for <linux-usb@vger.kernel.org>; Thu, 26 Jun 2025 06:22:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uWugq8lTZJdYaxUXMYmfOMM8fwBT40IUh9D01m4KvbA=; b=KsrWjc8L/mavwKId
	OAAKXKxE6Sr6v1S91oN80V351KK51Vh9fTA62dLJ2XFMVp0FCSOJmKL2JFpPmUOb
	UqmkdXKB6XFaJ0MyUieUN2Es+8cngevKQCH7659F+lwkmsTIssvgUKvMM7haaN3r
	AybIMgmSbzddY2FMZa3whSM9sH8kxAJTYvNvGB6Yk5/0xgFFXL0tqBc1LLzs26KS
	xLkCDwjcjDRJfAR2BrkUQYZ+yKeIsGHsuT4JZtAQJfWht94ws/M5BbTD5+TS+x5X
	e1gH6XkTXBurKxwphiKHEkVeI2ATaumMVSTKI5YK8hZWNdhM+UwALrcvo2+LnyLS
	0mtIzw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgj6u5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 26 Jun 2025 06:22:37 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2369dd58602so5775165ad.1
        for <linux-usb@vger.kernel.org>; Wed, 25 Jun 2025 23:22:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750918956; x=1751523756;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uWugq8lTZJdYaxUXMYmfOMM8fwBT40IUh9D01m4KvbA=;
        b=WZWyJfNbYiibMxcUefbjNGJXFFSc60W1FafCEDkF/M7kS3jjWdJLj3bM/7EFnwtclY
         Rdy/VPvT0smV4mpT4b2Z/ysLfILR+C3jkFGFH+WxqrVQ5/aeAESIvkouRdF/XVszrsHm
         1V5i4yB69Vl6TOEmOQBB3zQ6zdLnhQ1LPw4w9O4MFRIuzK+pOFF5ys/zU9BamH5swK54
         gJXlRLfIKSYAKv4mZoPpNnS/Q+2aFkfvCodutaBX4PadxPUFCjU/vzTIq3CqcFyk6U7j
         EU4MaE6SiUus4I92H1dOltZBW2SONYwDMFNvUX7KwKQY5mYEA9SfyD2K5NWzTtvdONsr
         /YrQ==
X-Gm-Message-State: AOJu0YyZHZ4yCAV2hEayVUGbdJVSAbsoOhUD1lYUkM8cYwF5YKOfrdBw
	lLEe3A81uCQJ6Zv9m58IhkXfdgI9RR6jGokRGivLibnfjDb23dDZpch++V+9cf0hQ6P3nimMpLA
	rV3NajQyLPytUy/vg+R8cUyhSJ+gW9L6+0LknsDNWv5Szast0pJ4Mv9/D93KZnms=
X-Gm-Gg: ASbGncuMdhoEtyOdYS9w1g2rZE89STEJ/av1yqD43gIYN/BqtI8TP4aU/bYH2/6yfCy
	IWtXiYencVBI9zY6errgQ521n0znxQU3pUALjyGiCpJwXx6kYjxpgrU8SVQl8a5EYlmYyDN0tVS
	ppOMijkpf1+MnnmvTDlDJ0373uiccSFd5imeps/NFr35NQsXKl45TPZgdVWcYn041rvz1//2MXF
	m3DD+JqFreN7OtsDmT4GlxGol1QFunghLbMD9vde8WTBcOLVID6rcwJAT2SMWUeR73XemYvbfrM
	yEKm0pVCXDV+badkWvsczi4uH5zI0jdyRAh9+yupe5caSufeJvo=
X-Received: by 2002:a17:902:c94c:b0:234:b735:dca8 with SMTP id d9443c01a7336-23823f88830mr73233135ad.6.1750918956003;
        Wed, 25 Jun 2025 23:22:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnjkPg88r9vIleP2JIcTnLkYHYT7QYgAUYGJy/gGk6Od/gOwr40Fa4g5wdZUFZshOaOqbO4g==
X-Received: by 2002:a17:902:c94c:b0:234:b735:dca8 with SMTP id d9443c01a7336-23823f88830mr73232915ad.6.1750918955579;
        Wed, 25 Jun 2025 23:22:35 -0700 (PDT)
Received: from [10.218.10.142] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8391494sm153578195ad.1.2025.06.25.23.22.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 23:22:34 -0700 (PDT)
Message-ID: <021a0e4f-bbdb-4469-8c85-d8b7e7185e20@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 11:52:31 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] usb: gadget: u_serial: Fix the issue that
 gs_start_io crashed due to accessing null pointer
To: Dan Carpenter <dan.carpenter@linaro.org>, hulianqin@vivo.com
Cc: linux-usb@vger.kernel.org
References: <926a09f1-d0d9-4bc6-8cd0-996cda0af60d@sabinyo.mountain>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <926a09f1-d0d9-4bc6-8cd0-996cda0af60d@sabinyo.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: SYHrGNs5FEPxoZvQFJmaOhFvtcabQ6hv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDA1MCBTYWx0ZWRfXx1Qev6Xi46jg
 sOWUkpQVoPaVPQH6nXd7vLAPX4snQRjZPCnOCjrf9OWglh6kR/ars2IUk0OJYgDYZ/vh3eqyxzu
 Uxbs4YQRYNI+2nH+AR36YZOOKcRM3DFfKW6U0HQ0I8OtpiC9cwD9+S5Q8YFbbxYjD0w+3p5UrBK
 ZEAQ9wzB9lwLnzfzcDkjeBMy92ZSqUXiaiX+IvU6jwVKZTTkVaTU8rkc2+bIME3gDLIg5CVaX1F
 QV9rndoxXo4qKDYo3UWt5F6wiFqO5zM/DMIOwvF89cbZMw4nFJmCCFupYYpVAZu+MTgjL4638ms
 EtYJNkXqltsDPRitP+zkymLc6cJjWM4qFQt59o+lXSWfDvre/jgNvGhbDoaEn38KngxZvz6JGIN
 V4jyTHpWPC9fgQ7HPSRN/Tlia5aNXvoGDZJ5tB2ZdEMTH2OR4b9qxSHsSYThMDCdUwSqvN6v
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685ce72d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=2zSZeh2DUMBqgrTe:21 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=O5w2hueNEKHyENvDBaUA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: SYHrGNs5FEPxoZvQFJmaOhFvtcabQ6hv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_03,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260050



On 6/25/2025 8:52 PM, Dan Carpenter wrote:
> Hello Lianqin Hu,
> 
> The patch 4cfbca86f6a8: "usb: gadget: u_serial: Fix the issue that
> gs_start_io crashed due to accessing null pointer" from Dec 3, 2024,
> leads to the following static checker warning:
> 
> 	drivers/usb/gadget/function/u_serial.c:580 gs_start_io()
> 	warn: variable dereferenced before check 'port->port_usb' (see line 547)
> 
Hi Dan,

Here's the timeline of commits,

commit ffd603f21423 (usb: gadget: u_serial: Add null pointer check in
gs_start_io)
	- Removes line 547 *ep = port->port_usb->out

commit 4cfbca86f6a8 (usb: gadget: u_serial: Fix the issue that
gs_start_io crashed due to accessing null pointer)
	- Adds Null pointer check for port_usb before freeing requests (Line 580)

commit f6c7bc4a6823 (Revert "usb: gadget: u_serial: Add null pointer
check in gs_start_io")
	- Got accepted last week, adds back line 547 *ep = port->port_usb->out

> drivers/usb/gadget/function/u_serial.c
>     544 static int gs_start_io(struct gs_port *port)
>     545 {
>     546 	struct list_head	*head = &port->read_pool;
>     547 	struct usb_ep		*ep = port->port_usb->out;
>                                               ^^^^^^^^^^^^^^^^^^^
> port->port_usb dereferenced here
> 
>     548 	int			status;
>     549 	unsigned		started;
>     550 
>     551 	/* Allocate RX and TX I/O buffers.  We can't easily do this much
>     552 	 * earlier (with GFP_KERNEL) because the requests are coupled to
>     553 	 * endpoints, as are the packet sizes we'll be using.  Different
>     554 	 * configurations may use different endpoints with a given port;
>     555 	 * and high speed vs full speed changes packet sizes too.
>     556 	 */
>     557 	status = gs_alloc_requests(ep, head, gs_read_complete,
>     558 		&port->read_allocated);
>     559 	if (status)
>     560 		return status;
>     561 
>     562 	status = gs_alloc_requests(port->port_usb->in, &port->write_pool,
>                                            ^^^^^^^^^^^^^^^^^^
> and here
> 
>     563 			gs_write_complete, &port->write_allocated);
>     564 	if (status) {
>     565 		gs_free_requests(ep, head, &port->read_allocated);
>     566 		return status;
>     567 	}
>     568 
>     569 	/* queue read requests */
>     570 	port->n_read = 0;
>     571 	started = gs_start_rx(port);
>     572 
>     573 	if (started) {
>     574 		gs_start_tx(port);
>     575 		/* Unblock any pending writes into our circular buffer, in case
>     576 		 * we didn't in gs_start_tx() */
>     577 		tty_port_tty_wakeup(&port->port);
>     578 	} else {
>     579 		/* Free reqs only if we are still connected */
> --> 580 		if (port->port_usb) {
>                             ^^^^^^^^^^^^^^
> Checked here.  The commit message says that this is to fix a race
> condition where a different thread could set port->port_usb to NULL
> after we call gs_start_rx().  However, the code is still racy
> because we're not holding the spin_lock(&port->port_lock) so port->usb
> could still be freed between lines 580 and 582.  The window for the
> race is much smaller but it's still a potential issue.

gs_start_io() is called with port_lock, hence port_usb is not null @line547

But gs_start_rx() and gs_start_tx() releases and acquires back the lock
during ep_queue, if port gets disconnect then port_usb can become NULL
during this timeframe.

Hence a null check was added at line 580. This prevents null pointer
dereference. It cant become NULL after the check since the lock is held.

> 
>     581 			gs_free_requests(ep, head, &port->read_allocated);
>     582 			gs_free_requests(port->port_usb->in, &port->write_pool,
>     583 				&port->write_allocated);
>     584 		}
>     585 		status = -EIO;
>     586 	}
>     587 
>     588 	return status;
>     589 }
> 
> regards,
> dan carpenter
> 
Looks like a false positive to me.

Regards,
Prashanth K

