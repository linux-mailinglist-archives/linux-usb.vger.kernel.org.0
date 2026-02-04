Return-Path: <linux-usb+bounces-33054-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDQhNyWfgmlgWwMAu9opvQ
	(envelope-from <linux-usb+bounces-33054-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 02:21:41 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44423E0680
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 02:21:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B31C311DA02
	for <lists+linux-usb@lfdr.de>; Wed,  4 Feb 2026 01:17:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99C1126CE2B;
	Wed,  4 Feb 2026 01:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IXDJFG+8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U1KcZYzW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45A815CD7E
	for <linux-usb@vger.kernel.org>; Wed,  4 Feb 2026 01:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770167828; cv=none; b=Z4GGV8Jor3mDoTFhJNa+XW/8mIvk2qRUQxefTx0MLdNftjl3r0a6Nu/twisDjfuZhUI0R1LZ94j/fqdNea6ltaN5f8GXwMmtmlhsV/Mj+ezx88ELqxKE6weGXi03kxhIH95GX3g37o2YNJmqiWEwl70T4Jdm/n9eg6Qy4puY1Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770167828; c=relaxed/simple;
	bh=b4Ev63WdYIb5qDPb6N5mS3R5uBJvarDSN5nVd4wleq0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YzhlkFnG2g1R6bfLQj14IqLwLps6iSkTzxQbD0qWtbFWZaEYsVwXv8vHILKKyMlHNfFv55KdOU1/yt4dex6m63YG64WPDHLj5v8MS5htq1J77d8WBCRajOOrY/vmngUsi1rDVOdTt//u1o/s7Hg6M1ou4hAU1hOeola9Z3exqNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IXDJFG+8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U1KcZYzW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613Ilgk42667064
	for <linux-usb@vger.kernel.org>; Wed, 4 Feb 2026 01:17:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tdc0EizwIPFBOtmxiFIwC5WDhlUo90mDjUWIc96rJY4=; b=IXDJFG+8HWrkVdGR
	5Jkg87CyBRM2T029VeNbB5tcTRbbpzGzfO/8recMv+qGhh8ZYnxnnosT6jvHfPTw
	kBexcGy1R/t+t8M/3f5mY450NQomS0N50rVaOuyjmb85ngPVHDlgr31atxkraFXM
	0Q17ZsZls6aI2rLKRYe18nYU/Wse1nPdbYRhIl7zXHHHHc/qQzgcxun0QXnAv6o6
	2hsI2azPVN2YGS3PHDw8vAaEgT9qRmBJuiIhorVkCXVBhUhQ6BRn2eDMpa4sXF3r
	saqefsz6aWSSrG3GzoAKVaawFHNCJjt744gmsR4ttRppm5m0AQYoyeEKrtlb0cN8
	ItJlYw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3nf61c9n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 04 Feb 2026 01:17:05 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-126e8ee6227so3201827c88.0
        for <linux-usb@vger.kernel.org>; Tue, 03 Feb 2026 17:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770167824; x=1770772624; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tdc0EizwIPFBOtmxiFIwC5WDhlUo90mDjUWIc96rJY4=;
        b=U1KcZYzWUOZC4j5ulaQn4xIkyPRhtnAAL/Dm1XVjaYxCMfXMg3xs6PGzAjgYjcTuKp
         QufHNKOOWNPdh8lL2Ux7hPUiknfWNyke5mREVPJJPw4jx4rzwIB1wPotw9TlK3x7xDRQ
         9dPnUKwCLHdR/zaeDDM2XZ4xU2MtBrrZ6+wA7W3i5CZBJDwcIh8vGGqA0uG6EE3vXSSF
         z09HRaL5DECAu60HnsmDe/AeWftKqzdBuGPgo8Ka/msy5lKjFjIwvlxkOUPQEJ1gVlv0
         Lg6805K+X/mW6mDqd8j5miwwoqBX1R0EYMeTXiH8hpcsujgLihjZhpH/gYQG9seD3ZEN
         xrkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770167824; x=1770772624;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tdc0EizwIPFBOtmxiFIwC5WDhlUo90mDjUWIc96rJY4=;
        b=t0C7qGsz6IUoVHY0QEvQI7U5rGtik9LwmbIiGZOa0O4lrC7nlS2Z2JOEvJowXQFall
         WSgovFR3B0jgkV5LO/cBVo1sRYJogzKZutEv3jF2OKfk8WYa0crAzZnJFqlw7p9+t+2q
         OPd20okJLUkX7c6xxYKzjwxVWo8UrGTkIPJRPRF06idS/DVNwZ8pDIgCpHLYzf8GbMsO
         pD0KHv3qKwrXaYQ9U9YCnsi1IU9Ajidz6Kdc6AOf+S3WOAnfd7NnVpqmufaMhOgxL+WU
         J0a0/WJeGGg+5aTqZU5iO+FJO9jxtFtlZ77feaxBpnXpFN83FhQVo4REozq+DW9YCA4g
         bXvw==
X-Gm-Message-State: AOJu0YzmCv7mVwtkIgPCSztnqcSORvaao/g946IvflqtNoMxpwpR9bsZ
	Qa/9AhV/D+aGIwfn9ha9Lj0fHqerHStS7pktIk6FsgB6T745ijLm6JxTI3Z56hzrynX0tPiod/P
	nZB7851A5dfPnPvW5bZ4zMhyZMEPxxDxZGSno2TUbrTG5dJcD2EzrloKciSNJZQM=
X-Gm-Gg: AZuq6aJX4N+fvU2GbN04LKDwIARY1eZV8NUenXXgP1gC61aLdt5+kq4AH5AnBVQlDWq
	hzWCTJRRqj+C0oiElAauw0WHddfKs3NHvTqIQdCTcGpygpbMdSHgiTZQPlEImsk6qAb1gdciCDk
	0jOc9Nz0x8AKuUmJC3Ms1HpTruLn3UqMbCtHB1lJNBHncGSsdc9mz624qr8FxQRCW109I60pCDP
	1fhqaOFPAn42omzJkeWNPyJhh86KsANhFqlqgXDhPPPYYr3k3oNjYPeSkh71sFVnyR7/GZeAlNa
	i7M6nlsB8qGLMcnKFh6uAs+HXWe1z0A4d7G6kDJ2Ofs9cl6BbpSQFAYjYhQXo/cu3PNMsg6rJ9H
	tUp8f/DXLt9Xg2oFIUuWDBkF6xOpULr/kjM75ElahORGelaFAAYien5LW
X-Received: by 2002:a05:7022:2491:b0:123:2ee9:d1b3 with SMTP id a92af1059eb24-126f477c849mr684838c88.2.1770167824395;
        Tue, 03 Feb 2026 17:17:04 -0800 (PST)
X-Received: by 2002:a05:7022:2491:b0:123:2ee9:d1b3 with SMTP id a92af1059eb24-126f477c849mr684818c88.2.1770167823693;
        Tue, 03 Feb 2026 17:17:03 -0800 (PST)
Received: from [10.73.54.120] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-126f503ea14sm906275c88.16.2026.02.03.17.17.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 17:17:03 -0800 (PST)
Message-ID: <f9dbd6fa-5090-448f-bd33-cb6a04f12526@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 17:17:03 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] usb: xhci: add interrupter type
To: Niklas Neronin <niklas.neronin@linux.intel.com>,
        mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org, raoxu@uniontech.com
References: <20260128131504.124322-1-niklas.neronin@linux.intel.com>
 <20260128131504.124322-3-niklas.neronin@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
In-Reply-To: <20260128131504.124322-3-niklas.neronin@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NFsOTZA2iagO7dz655_rrOwQCmaW7ysb
X-Proofpoint-ORIG-GUID: NFsOTZA2iagO7dz655_rrOwQCmaW7ysb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAwNiBTYWx0ZWRfX8y0JQo/TAAio
 NvCfvci7Dahx7VsocAz1mPvRfmCW/tlfhScZqcPiVZguF1ecQPgotStDeLL102OOic6o8wjBAtI
 n8dA4X3QC8SyhzzQ4W/QMRnQv0MmRobYn+4OYruupNa1fA+cAclpIXY/vHEMo8Wg0KvXHolDEkj
 CVHETqwxNtsSCEQRyMc7sw1Hbh9TLQiQwLFiNyFSdCWFU60MDX5FYpOMIDlvnUW3qmybH9Cd9jv
 hJIn3HhY0ZAtB0CClJIGFcQDqco/l3KtIVhAFBmMCpTvJPMjuIVJly2uj+gRZyufOcy3n5WONe8
 BdBPH3bFh3isOYdtyWOLUooQgAtVZWR8TfLntSYIQXag4fro/XDQr2imJNZn0QqHehRNtYf1CnM
 CgtFqC09GSKDblQYigKPRp8YDYDblrcFxrSL7H7YkMbHu28CAPZTRDfOTwDuxcCbCwMCyCDNpwP
 XNqgfKCAaU2zFl2bTng==
X-Authority-Analysis: v=2.4 cv=doTWylg4 c=1 sm=1 tr=0 ts=69829e11 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=-IjgKFq8M_pXHX_M2m0A:9
 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040006
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33054-lists,linux-usb=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,intel.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wesley.cheng@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 44423E0680
X-Rspamd-Action: no action



On 1/28/2026 5:15 AM, Niklas Neronin wrote:
> xhci-sideband creates a secondary interrupter without an associated IRQ.
> Such interrupters are non-operational and cannot enabled or disabled.
> 

Hi Niklas,

Is the wording here correct?  Every interrupter should have a physical 
interrupt line, however, it may not be owned by the processor running 
Linux. (ie offloaded to another DSP)

> Add a type field to struct 'xhci_interrupter' to distinguish
> non-operational interrupters. When the type is set to 'INTR_NOOP',
> the interrupter enable/disable helpers become no-ops.
> 
> This allows callers to iterate over all allocated interrupters without
> special-casing, while ensuring that actions are applied only to
> operational interrupters. It also provides a simple extension point
> for adding additional interrupter types in the future.
> 
> Operational interrupters remain the default; no-op interrupters are the
> exception.
> 
> No functional changes are introduced; behavior remains the same.
> 
> Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
> ---
>   drivers/usb/host/xhci-sideband.c | 1 +
>   drivers/usb/host/xhci.c          | 6 ++++++
>   drivers/usb/host/xhci.h          | 8 ++++++++
>   3 files changed, 15 insertions(+)
> 
> diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sideband.c
> index 2bd77255032b..21ee4e96bc70 100644
> --- a/drivers/usb/host/xhci-sideband.c
> +++ b/drivers/usb/host/xhci-sideband.c
> @@ -352,6 +352,7 @@ xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
>   	ret = usb_offload_get(udev);
>   
>   	sb->ir->ip_autoclear = ip_autoclear;
> +	sb->ir->type = INTR_NOOP;
>   
>   	return ret;
>   }
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index fcf8b486b0e0..c4e0c1cfb94e 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -314,6 +314,9 @@ int xhci_enable_interrupter(struct xhci_interrupter *ir)
>   {
>   	u32 iman;
>   
> +	if (ir->type == INTR_NOOP)
> +		return 0;
> +
>   	if (!ir || !ir->ir_set)
>   		return -EINVAL;
>   
> @@ -331,6 +334,9 @@ int xhci_disable_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
>   {
>   	u32 iman;
>   
> +	if (ir->type == INTR_NOOP)
> +		return 0;
> +

In some of my previous discussions with Mathias, I think he mentioned there 
was a use case where Linux would handle interrupts for both the primary and 
secondary interrupters.  I didn't get much more info, but maybe it was for 
segmenting events occurring on different EPs.  However, I'm not sure where 
that control/trigger comes from, ie from the class driver level, or within 
xHCI.

Just wondering if this is going to lay out the groundwork for that to be 
added, as in xhci_sideband_create_interrupter() we're just assuming that 
its a INTR_NOOP versus allowing it to be configured by the caller.

Thanks
Wesley Cheng

>   	if (!ir || !ir->ir_set)
>   		return -EINVAL;
>   
> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> index 2b0796f6d00e..59840d613e94 100644
> --- a/drivers/usb/host/xhci.h
> +++ b/drivers/usb/host/xhci.h
> @@ -1443,6 +1443,13 @@ struct xhci_bus_state {
>   	unsigned long		resuming_ports;
>   };
>   
> +enum interrupter_type {
> +	/* Normal interrupter, e.g. Primary */
> +	INTR_DEFAULT = 0,
> +	/* Non-operational, e.g. xhci-sideband */
> +	INTR_NOOP,
> +};
> +
>   struct xhci_interrupter {
>   	struct xhci_ring	*event_ring;
>   	struct xhci_erst	erst;
> @@ -1450,6 +1457,7 @@ struct xhci_interrupter {
>   	unsigned int		intr_num;
>   	bool			ip_autoclear;
>   	u32			isoc_bei_interval;
> +	enum interrupter_type	type;
>   	/* For interrupter registers save and restore over suspend/resume */
>   	u32	s3_iman;
>   	u32	s3_imod;


