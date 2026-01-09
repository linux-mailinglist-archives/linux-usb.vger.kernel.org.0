Return-Path: <linux-usb+bounces-32102-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C401BD087E9
	for <lists+linux-usb@lfdr.de>; Fri, 09 Jan 2026 11:17:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 942FA3076B0C
	for <lists+linux-usb@lfdr.de>; Fri,  9 Jan 2026 10:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68B333370FF;
	Fri,  9 Jan 2026 10:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XqPBKLwQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SCOs1sYB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA4E3382F0
	for <linux-usb@vger.kernel.org>; Fri,  9 Jan 2026 10:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767953061; cv=none; b=kXEvwy/daCeHBrkiFS2ovGWIyiEslClugaF72pis8PkYK/4k40DVab5SEe1YLtzaPZYA0RNs+3D4VDEIEQl0gZY8My6yyAJCOVC7oxNK7QUUDTyHfXXMbMRgjs2GjOj4tYMyRJF7JckUHAaKFvwtzEqe8oxGeZPej/OdujkSKt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767953061; c=relaxed/simple;
	bh=4gND28Lt13WPa+PGsRscD9P07b3o3hF6wDoVoUMQE60=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lh8zOZQDKPUwMvu2qwaJZ6X7I1A6ZuMrz+yuLs55JHWJOrNaKlTa3bzuce8HgH4RnzVC/0rdroJKUWdgEwaCCAAu6wZKi+HEzqnCJLzo9utbO2a0+1ny5wbeUCNfNTUFQM5rXODy74JEBET7fmW+U2YVgwp7oF0CN+e/hfnRD4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XqPBKLwQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SCOs1sYB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6095mH1f3019005
	for <linux-usb@vger.kernel.org>; Fri, 9 Jan 2026 10:04:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pw9yVWa+iua4ICCXUXwrMuwSfJYVWu5HzOrh73USyMY=; b=XqPBKLwQQZ8iNCL4
	p8grlDn90NQMHvTfvc3evK6wOWmE3Jl01iU//yzxqCI2oWAxwOBmH7yeQ+KyBYnZ
	8karB79IBYLIF18KYg95OUvRydr0vS0Y/rrc4PvDGJd+BQDDtfm7hfGhY3wa8JmG
	aM4KIFpwaJ54xyrHx31ZGQfSBys0s6ohCzujXQ/tGI1/WigJ9AiwD8HhTXTDaNna
	GpIdcMjIXfHlsDF3gQXT0sqXY2DROSYdd1oTw7LM2zw200YbgFaGtJIq4g5jcjHe
	sc45aZitQg6447HWgePT2Ry702g4jjm1606l6hmlpsydodmwFg4gu3y9+ktpEX+U
	4cBHIw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjjk3j9fq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 09 Jan 2026 10:04:18 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34a9bb41009so5795403a91.3
        for <linux-usb@vger.kernel.org>; Fri, 09 Jan 2026 02:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767953058; x=1768557858; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pw9yVWa+iua4ICCXUXwrMuwSfJYVWu5HzOrh73USyMY=;
        b=SCOs1sYB+1ALLzzir+Nmadwefgg+PU+ooGrVnidFVpAXdmHe8aGA+a8x1tkCg/S/JF
         BcUqLwDKlh135cZXHD34EXDXlyH2QYG8Pv5u4nq1gHCA3s/DfRZ6JQAoj1xAtcynbBmj
         51ZvRLxiV1Xo9SLzXTChLYLjnbhtswWeOviILktEDCUnFfHLJI8aEc4Lxlk++gy8hoDP
         +Lg6Psk8wBVZuO/ZDYRrZKHZEYuJYaFMoFKuFW5Qd3XYX6qu7vg8h84uThOQAe2ki88I
         88m5RAvZ1CjdrFfPuwkcIcE//SUN3c/EQVTEPxcqkebfkXN/TEjY5XcVsvOZrGzjpPQT
         hTsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767953058; x=1768557858;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pw9yVWa+iua4ICCXUXwrMuwSfJYVWu5HzOrh73USyMY=;
        b=ZTGddyo3Gc/iSXO+FF8fKwJ8YrpS9fenJ9ZjKQjsmRDgotueNK8lX0oO7dUnKCf80P
         HcDaLfa3PHwZk+Lj71rcalaw7uYqYmEhfy+OS7L8Jqh4fGfWfVQ9Yeww8hQIwVSsB08r
         l6UhFZ6eMhB3zXs4rppY1XOzxCF1QYAmy4HktA1rHXNgSlSyYtpjnLkEFmbtloNGnTR+
         5mCi8B6cgfQv3ExS/Zbo7jXx1w5eVLLOJtjFGtKe24/KjJju9ao4YWL3MnXGlu3sa3PB
         D26w5yAMV3YD6HUrdBgd6Qcu7nGONqRd4S483n4JFGjXa/gMhB8xtzf1J35ewsqriVzd
         g9aQ==
X-Gm-Message-State: AOJu0YxhxIUcylUvPISdqdXdtALBNxhFoav3aw1sm9k+kCLe04PUGW+q
	IC/rJGIEyYj50CqitIAZWjsOuaxraXWjProPv/FAajnvNb16+nx56dyJKT6nIMCJxYAKhW7EiAk
	FfAepVMK1g6t2OF8OpknD8brSDjFPg8N7PgxC5gRJvJ6oETMxqMf/QBLy4WaNGQQ=
X-Gm-Gg: AY/fxX5LXR+J+9DEjZn8wjwDiJYVdMpYOHnyHp5yxv60b7AdlkyIWccAC5zauI/oplf
	m/NLDWK8+Vmdmb50Bj35l3IqgF6I3Txm2RUmJJlskEfk/bLtkhc3k/NfLUsucxdpyV+gYpN5yKF
	gTAAXzwDoRMxiuvqTVw/F8KSfQDTlGYt55A8L2jo3fyarO70i8yyqZVLQEJWfnsZbn6kOD6Qaq3
	fVA0zhWf9v2pGePDzqtgkb6IiXGeg2E6HVpgVFxWGQ3/+8xDAPTP6nKb0QT/cFf7EbXg0/vQIx3
	8JAm3kGTNjIhRW2K3HXPRu4D4UNv5nUqeQ/l7jbfl6Ob6PC5f6nLI2xajVrpBd0NCwfw0cIWrgr
	8yyA/2lVmocOfovfrJYMAopCGOlQuIzQHpO0D5w==
X-Received: by 2002:a17:90b:5628:b0:343:a631:28b1 with SMTP id 98e67ed59e1d1-34f68c94e8bmr10311243a91.16.1767953058062;
        Fri, 09 Jan 2026 02:04:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGiLgDNAW0hs1SOJjWtTY4DH9oTtD0nronINufc6daYZBiFEsEPXX7YvXEZT4WpOEdOhbL/8Q==
X-Received: by 2002:a17:90b:5628:b0:343:a631:28b1 with SMTP id 98e67ed59e1d1-34f68c94e8bmr10311212a91.16.1767953057588;
        Fri, 09 Jan 2026 02:04:17 -0800 (PST)
Received: from [10.218.10.142] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5fb75902sm10126603a91.16.2026.01.09.02.04.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 02:04:16 -0800 (PST)
Message-ID: <cdd3968e-e5dc-4e82-8e0d-accfb85823b4@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 15:34:12 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] usb: dwc3: Log dwc3 instance name in traces
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260105115325.1765176-1-prashanth.k@oss.qualcomm.com>
 <20260105115325.1765176-4-prashanth.k@oss.qualcomm.com>
 <20260109011813.6uxqrqzcf54y75xo@synopsys.com>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <20260109011813.6uxqrqzcf54y75xo@synopsys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: i9O5bWL6EKB2gY-LdICDlkIpZk12oMz7
X-Authority-Analysis: v=2.4 cv=EazFgfmC c=1 sm=1 tr=0 ts=6960d2a2 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=CmXlUJo9RQZuRksvqgMA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: i9O5bWL6EKB2gY-LdICDlkIpZk12oMz7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA3MiBTYWx0ZWRfXwo+O3djIGWdq
 kgqh4Wj2v+ZNFlg0a8kYWSsiPkbtOKTzYSNcumkKUqYYpGLqqgfk1lnmE19k6bFbGepNr6xqXso
 nQIYqrP2SGuw9SIc3CFU3/NkC1ZsonpTtYsFoD9f01G+QtxWpE1IGMvAfx8BhCHLTYq8uY2TmUk
 AlIotadjXAaVG4zcBe0cKRLq/LNOSLVklc5vaIBcnWSK2iub//lmWYQLCEeDFWKFBtLoO7ph6Os
 gSMox19ALNssd1Rq7pPWE1VKbKFKo8/6pEESPuR8Sfd/Y8dbcWAKbS+jvkqcJEN9JexO5AvdLMp
 klCefrB7vDPyDG/LapO4oY8Fd4uQXFkY2OpusmaUObvxF1JMQKGvttR6pfER1w56vSi9j4ifVTY
 ic6PvlOOLskyUDyVu6JoJv6rD16B7Lg3zXhzp7D4cvfM9pJpO8luVhcCZhcw1e8S3nenUtJsjD0
 SVE+IeDlB0u0384xshQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090072



On 1/9/2026 6:48 AM, Thinh Nguyen wrote:
> On Mon, Jan 05, 2026, Prashanth K wrote:
>> When multiple DWC3 controllers are being used, trace events from
>> different instances get mixed up making debugging difficult as
>> there's no way to distinguish which instance generated the trace.
>>
>> Append the base address of dwc3 controller to trace events, so that
>> the source instance is clearly identifiable.
>>
>> Example trace output,
>> before ->  dwc3_event: event (00000101): Reset [U0]
>> after  ->  dwc3_event: 0a600000: event (00000101): Reset [U0]
>>
>> Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
>> ---
>>  drivers/usb/dwc3/core.c   |  6 ++-
>>  drivers/usb/dwc3/core.h   |  2 +
>>  drivers/usb/dwc3/ep0.c    |  2 +-
>>  drivers/usb/dwc3/gadget.c |  2 +-
>>  drivers/usb/dwc3/io.h     |  4 +-
>>  drivers/usb/dwc3/trace.h  | 88 ++++++++++++++++++++++++---------------
>>  6 files changed, 66 insertions(+), 38 deletions(-)
>>
>> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
>> index 670a9d4bfff2..3aa85f5f1c47 100644
>> --- a/drivers/usb/dwc3/core.c
>> +++ b/drivers/usb/dwc3/core.c
>> @@ -158,7 +158,7 @@ void dwc3_set_prtcap(struct dwc3 *dwc, u32 mode, bool ignore_susphy)
>>  	dwc3_writel(dwc, DWC3_GCTL, reg);
>>  
>>  	dwc->current_dr_role = mode;
>> -	trace_dwc3_set_prtcap(mode);
>> +	trace_dwc3_set_prtcap(dwc, mode);
>>  }
>>  EXPORT_SYMBOL_GPL(dwc3_set_prtcap);
>>  
>> @@ -2193,6 +2193,10 @@ int dwc3_core_probe(const struct dwc3_probe_data *data)
>>  	dwc_res = *res;
>>  	dwc_res.start += DWC3_GLOBALS_REGS_START;
>>  
>> +	/* Store the physical base address for logging in trace */
>> +	snprintf(dwc->base_addr, sizeof(dwc->base_addr), "%08llx",
>> +		 (unsigned long long)res->start);
>> +
> 
> Why string?
> 
>>  	if (dev->of_node) {
>>  		struct device_node *parent = of_get_parent(dev->of_node);
>>  
>> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
>> index 23188b910528..c16e47273ea0 100644
>> --- a/drivers/usb/dwc3/core.h
>> +++ b/drivers/usb/dwc3/core.h
>> @@ -1178,6 +1178,7 @@ struct dwc3_glue_ops {
>>   * @wakeup_pending_funcs: Indicates whether any interface has requested for
>>   *			 function wakeup in bitmap format where bit position
>>   *			 represents interface_id.
>> + * @base_addr: The HW base address of DWC3 controller.
>>   */
>>  struct dwc3 {
>>  	struct work_struct	drd_work;
>> @@ -1412,6 +1413,7 @@ struct dwc3 {
>>  	struct dentry		*debug_root;
>>  	u32			gsbuscfg0_reqinfo;
>>  	u32			wakeup_pending_funcs;
>> +	char			base_addr[9];
> 
> Can this be u32?
> 
Sure, will change it. And also rename it to dwc3_reg_base.
Let me know if that needs to be changed.

Regards,
Prashanth K

