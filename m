Return-Path: <linux-usb+bounces-24829-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DB9ADC9F2
	for <lists+linux-usb@lfdr.de>; Tue, 17 Jun 2025 13:52:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 839101778A2
	for <lists+linux-usb@lfdr.de>; Tue, 17 Jun 2025 11:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8810A2DF3EA;
	Tue, 17 Jun 2025 11:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iWxfxuaj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6E32DF3E2
	for <linux-usb@vger.kernel.org>; Tue, 17 Jun 2025 11:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750161115; cv=none; b=j2kB8QXo0RFqLOt/IXDL8cfR2NoofWcj4me9duIW1vgPJosOJS38ZO//qzTpxmubYyNcnAxcM6LQKA43u1TkPzE6anTCALS7TBeMDr1rvC9BWQDhEXoaQnUR3ixHXlZg/hPQyv6oFzMhr5gOoJZlEBpS33bvwlaoo17aC6uKapk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750161115; c=relaxed/simple;
	bh=/BXFx+EdMx6alPR9bTuAiuLHdPkXDBdseFYhixVeO/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i19UltHMd8ijEyVMNSzORHT3hyBbYYGuQ8FrLOUK5tALztyFV9sWJRCJE693yYY6fl9ZdNxQvIvqN1no7RfKX3N/y3T7d5lsOkYd9J9h1oSe8YiQ3J/J9TfmtWLfwkBNvQDc6lXmChkgjgAVnGfRdXxgy4ODqXmg77hI1H2oZM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iWxfxuaj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H7v8ah003284
	for <linux-usb@vger.kernel.org>; Tue, 17 Jun 2025 11:51:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hkYZyKNdjrlbdv/DJGbvw4uFBbZbvwawDUzbtd3vDGE=; b=iWxfxuajUGDpXiY5
	2PXJ5Trwm//yPhKmmbPI9W9Lowy8gvsffeNqjgna3wXa6io2U76H6l6/3yHgKmEk
	xj7LICnIQOhK2WlRlHCAQX4RZ1AaiIpDxsScAWfMCx/up2SpKwpktctiW4GeYPhP
	dxbrWetOTcrQvxM1suaiwZADEilQyXxsXtdyOuO2hrG45V/0CVDhPoS1SanaKM/U
	G0ZABaeOUtfala1RYpBFHAMVqRCFJgY/7zwqcsn8HnKbOrFpaBAOlNg9b1UZxZ6Q
	ie74fEzY0zaXM7qi2eJoxRGs0nkoTcRkO9HMfTIXKB1ry0Y46j7wodMQ/PVW1M/B
	H6/wIw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ag2348rn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 17 Jun 2025 11:51:52 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7377139d8b1so5246093b3a.0
        for <linux-usb@vger.kernel.org>; Tue, 17 Jun 2025 04:51:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750161111; x=1750765911;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hkYZyKNdjrlbdv/DJGbvw4uFBbZbvwawDUzbtd3vDGE=;
        b=mZ8Vtt5/sozHZUTOXriG8uqaTBXMBaBd5lWmC1pkkMNOxP197deBUJrZYDANOXhyGb
         bE7+sFLbD6rceb3UOs8otBZmNzIJvTr72bZpel4juLFsD0sFF1CZFBWBOh9GqCkON3NZ
         w9lpSgloZr7cDXP9+CYd7B4slbsPka5QxkRbzUaCZkQK1UhGaY5lKsEj6mY571JsYz1m
         BSeCEAE08FH3TU9hgq/ww+a1I7hz/EBhBmKlmcoFoOrD/CkDfUJ4YhF23xWWPRhBV1g5
         uCmA5pt6o+ZO9UmGYgg1UMKc1dAsRkWa7t0B2zl1RNE93Ln6GxL7Bdb0wC+OdPBqiF0o
         Wkog==
X-Gm-Message-State: AOJu0YzN6tsjAcIJf0EjNxhQxaai1HFDXG4BLBbXvRu5kniRJlzhP4V9
	aQDtxIF0ZHAHNqmvZY/qtCEX/aKVdwdN0UEsn5H6xr1Hu1Vch2Ka1ZZ1MXVrqVBC0j9KfU2UEdo
	6+AS1WUVgofk8Z7/mzg6L44KEO955KMpKvl6nurOgoSnZ9oRMrRZN8EnlGeBA8X0=
X-Gm-Gg: ASbGncvKQs0bWU2ZGxnGgK9DDA6zf/cRgPM1IYOIEIH4xdOh9Szr/qQMvvCfYVlUW5x
	H4be/sb66NRxCz9Do9djg9vNJNEIJMgF0IkkAeFgVHZt7FQhsWZZxSv8Gp69Ye7fuX3kXpfKdiO
	6JA1edzMw/P0FqthBpoQ5qatVhO25t0wupoFBcQ8cc3dPzrTT/WCzLRK6NTHHnN9vYqZbFf9/u6
	OcJtI6OGzYQ1D+AVrJWmNObmbt2RrVUAhqJzUvnAn1R0Zm3vQ0htGTVGpH7IsnuaXBSVf/gen4U
	aNK7G3lJncklYKIIOyYRZDhSXO/dJcQe1OnlS8sOAlWy6ydQO7s=
X-Received: by 2002:a05:6a20:2589:b0:218:c22:e3e6 with SMTP id adf61e73a8af0-21fbd4d55abmr19231120637.12.1750161110728;
        Tue, 17 Jun 2025 04:51:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8IMow5KohejYAAFfH6NIdurY4fJ4PPLgbxYZLdfcqDuSOwjoFH6JbwBYPg4ceiTJFYl4X1g==
X-Received: by 2002:a05:6a20:2589:b0:218:c22:e3e6 with SMTP id adf61e73a8af0-21fbd4d55abmr19231083637.12.1750161110244;
        Tue, 17 Jun 2025 04:51:50 -0700 (PDT)
Received: from [10.218.10.142] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900b0bfasm8581769b3a.122.2025.06.17.04.51.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 04:51:49 -0700 (PDT)
Message-ID: <4f205442-5415-4c40-acb0-80636f150a31@oss.qualcomm.com>
Date: Tue, 17 Jun 2025 17:21:46 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] usb: gadget: u_serial: Avoid double unlock of
 serial_port_lock
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-usb@vger.kernel.org
References: <aDRMq88_LjlnKIQe@stanley.mountain>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <aDRMq88_LjlnKIQe@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: FwiZbrESfkso7-4LDmaARukRPgP5fFFg
X-Authority-Analysis: v=2.4 cv=edY9f6EH c=1 sm=1 tr=0 ts=685156d8 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=jVqhD_pw5qAts2dj-vEA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA5NCBTYWx0ZWRfX5U3o4LEyDQan
 z4q/LBhsOsJ5BU7OCs9tK/CpJBgk29A0TckY5LNHXwOMboYvhWq4eaE4z1RzIHPz8omTxfinSQO
 ffEfDDgDvkMI6bU71bakP4vLD/hb6+dpcU/nzvRngDpicmxnC3QW0X/uRE4Phdd2hv/hyj2gtVk
 GlAETuSsBhsO8D5k6WGarvSgXU7O7HYkUicG49fqJfP06SdUV05d5Q/CwKYw/JGkV+RtxEG4dIS
 n/sBTnZFN19n7gVsz48sAubEwGjccjTHOSBtWxRii8+4PGht/QLOMb67QPuzPGFGEoktMNVOVjn
 kNWtppmupSNNS+1U1tduNMNjkbJ21zaxcmHrfIh6RvCoROcon4WNfdjpBmcn8dfTRUGCLr0PT3w
 DdUMrUYBeDrTOHDn7UNooO0EOsu8yvxB0zgwyef1/g9q01ALcT6QJJF45SxMKNk9vnpOwg3G
X-Proofpoint-GUID: FwiZbrESfkso7-4LDmaARukRPgP5fFFg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_05,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 clxscore=1015 mlxlogscore=569 malwarescore=0
 phishscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506170094



On 5/26/2025 4:42 PM, Dan Carpenter wrote:
> Hello Prashanth K,
> 
> Commit 1c06aff9b82f ("usb: gadget: u_serial: Avoid double unlock of
> serial_port_lock") from May 6, 2025 (linux-next), leads to the
> following Smatch static checker warning:
> 
> 	drivers/usb/gadget/function/u_serial.c:1511 gserial_suspend()
> 	warn: duplicate check 'port' (previous on line 1498)
> 
> drivers/usb/gadget/function/u_serial.c
>   1490  void gserial_suspend(struct gserial *gser)
>   1491  {
>   1492          struct gs_port  *port;
>   1493          unsigned long   flags;
>   1494  
>   1495          spin_lock_irqsave(&serial_port_lock, flags);
>   1496          port = gser->ioport;
>   1497  
>   1498          if (!port) {
>   1499                  spin_unlock_irqrestore(&serial_port_lock, flags);
>   1500                  return;
>   1501          }
>   1502  
>   1503          if (port->write_busy || port->write_started) {
>   1504                  /* Wakeup to host if there are ongoing transfers */
>   1505                  spin_unlock_irqrestore(&serial_port_lock, flags);
>   1506                  if (!gserial_wakeup_host(gser))
>   1507                          return;
>   1508  
>   1509                  /* Check if port is valid after acquiring lock back */
> 
> I should have caught this in review but this comment doesn't make sense.
> "port" is a local variable so it's going to be non-NULL.
> 
>   1510                  spin_lock_irqsave(&serial_port_lock, flags);
> 
> Maybe we should re-assign it? "port = gser->ioport;" before the NULL
> check?  Otherwise we could just delete the NULL check.
Sorry for missing this. I over-analyzed this one, and since
gserial_suspend() doesn't do much except setting few flags, we can
remove the check altogether and just keep the spinlock. Can you send the
fix?>
>   1511                  if (!port) {
>   1512                          spin_unlock_irqrestore(&serial_port_lock, flags);
>   1513                          return;
>   1514                  }
>   1515          }
>   1516  
>   1517          spin_lock(&port->port_lock);
>   1518          spin_unlock(&serial_port_lock);
>   1519          port->suspended = true;
>   1520          port->start_delayed = true;
>   1521          spin_unlock_irqrestore(&port->port_lock, flags);
>   1522  }
> 
Regards,
Prashanth K

