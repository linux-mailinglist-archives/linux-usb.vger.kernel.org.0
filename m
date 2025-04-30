Return-Path: <linux-usb+bounces-23573-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C64AA48D9
	for <lists+linux-usb@lfdr.de>; Wed, 30 Apr 2025 12:42:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE7AD1C067F7
	for <lists+linux-usb@lfdr.de>; Wed, 30 Apr 2025 10:39:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E98C925B1DD;
	Wed, 30 Apr 2025 10:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OQxbXiO0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA89246774
	for <linux-usb@vger.kernel.org>; Wed, 30 Apr 2025 10:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746009367; cv=none; b=KImUmYyHxp+i+pO7GJs9z0Z4nUddwtcP/pMVvVPxqmzpKtH08Xxve/iEZQT6X2U2lCEWd7cjTeb3jmcbxBWCnyRzSo/eKJNYzDXMVE5nzBLIKH9x4X+Fv8FTeX8cjF4yiE6vvFH9pjvdYg8vRZ27CGWWvkddsJcOPteDIuLO/QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746009367; c=relaxed/simple;
	bh=1vtqFoQTRIbXej5eV7sG9fpFjLNjyjMz2g2tsZ/2AF0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fy4q+jpPI3DyZNnMlUfnMSNAiECWp3UTzCzCkDWXRfrQufsNRRoK50QuP6v0EJ5uofciWSPkFSmRZeT3H6XPG6oGxBds4QLFqQfgKFt31j5qqnhVq54Vspr1mpn0ZmADCNbFfbM6YNG8twU2eSKCESzlfP3LftXh+LEE1Ez84Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OQxbXiO0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U9MRjK002824
	for <linux-usb@vger.kernel.org>; Wed, 30 Apr 2025 10:36:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	94BDs8CU94B85SJFta/gXDeieW046VoIkjXKGdjoOxs=; b=OQxbXiO02fhrlwAO
	8JBmmBgupaY4p12h8H/E1nZV2hR/UzuVzGW4b9PRZIcJ5DKq9Xqpu3+lvW/QX91N
	VpAE8Mci0TuZad4lg9qCt/fKPhrduSwggqMhLXQElKZRoggd5Ktgt8Yo+JZjSvJi
	TZFVI/w50NvXRxlcmh8Y8sfzlyv00tQrqDB6ButQMdjhRlc3j1UrTs0dCYHEm7tX
	slhovSHs3OBGIbSX9qLQXwpGkBOIKTA27XfLfVcCLYLE/X4WZ8fLyEsCvMNj8LlI
	BTWkQTvb4vJi2svGVUlXHH3egrM0zrqCGQeJ82QTcX9FdUB2ESvrhsITKr3yumUT
	T6jX2A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u89sga-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 30 Apr 2025 10:36:05 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b1c122308dcso4236702a12.3
        for <linux-usb@vger.kernel.org>; Wed, 30 Apr 2025 03:36:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746009364; x=1746614164;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=94BDs8CU94B85SJFta/gXDeieW046VoIkjXKGdjoOxs=;
        b=iEE6/HDRU3f5VA2Qk7QDxFxIPNayNT/fc0sq9AmG9LcUpWdvGDZfWq9p3w78MwJtpv
         CEO8G8Zibz8nC6wwOk31Cm6KU7x/l22TaUAtRvDwyx39uaspKQ6UyZngrdIyMBtx4geU
         RRRaayTybmuMojRfvm6hRXJ7Eic3bjMMx2CAoUwhJlkZ4bzVJpTGs430LpI+iY0UVBNI
         sIV+4Cv/L2/G1V/vHY+4rx0sUM/8yXvNktQhax7H+ZU0kcJ3ioGu122yFntP2rmT9+JR
         CM33LFwV9vwWeuCrp33ccmnGnfB3n8rL2Qzi8keiBxiOOAChMb3bbQ0KscGc9GXdhZ1d
         bH8w==
X-Gm-Message-State: AOJu0YwwAihOa36KKF17DLSE6BPDwGgmkQGYcUP/JPMgK95GGAdGYBnA
	8RthhJrUgHLL5n1nXWQNLUnsN8peXOiu5R95c+18j6EvNyn/XjmrzlDOnWgbn+hizky7mZ28Z1u
	KhBA6RlS9hpJeoiBSY4rouWNsZuO7FyRAqwS2l/jMK9LuE1hkkYVoXkOWPVbzDwL+2dY=
X-Gm-Gg: ASbGncsjnw8YtZQAxr70kl5Vo+ffAjaj08MJSlQMKc1HoqWkT32PzRbORYxWGcyoIEQ
	slNKtNwuYkpx4UvE4cu9pIvlQDfYEDGRcGHGqa7nDdTxhL2BOyMFQBGGHdHjPxvrkzDmnLnakPb
	dIZ+fTSZmLRIQfGsrxPzF7KJP99K3zoBNXfprFQPq5Vy86kMYGP0JfXLLgp0o+F8D890VMHgp30
	5vNkwiZNJLeplpVHjJyxtXMdBLsBEB/f2hS0UveGjL/+ZZBEQttKsOXnVi4GKvl6c+h94HnfRkZ
	kGTzzHu/mtkx0CJZdASdqKVWgcA9oK1vSs6j
X-Received: by 2002:a05:6a20:c995:b0:1f5:8262:2c0b with SMTP id adf61e73a8af0-20a87642d74mr4025155637.2.1746009363901;
        Wed, 30 Apr 2025 03:36:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF35fZ3hfAS43Uj+x/VgNSO/fAE5JroRc/KgrUtxxtGr5mGgFSp5FBQ8lqG0iWoF8QDZHWX9g==
X-Received: by 2002:a05:6a20:c995:b0:1f5:8262:2c0b with SMTP id adf61e73a8af0-20a87642d74mr4025128637.2.1746009363502;
        Wed, 30 Apr 2025 03:36:03 -0700 (PDT)
Received: from [10.218.35.239] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039a5c398sm1280352b3a.122.2025.04.30.03.36.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 03:36:03 -0700 (PDT)
Message-ID: <f8c4ce3f-7770-42ba-ba1d-af927f769343@oss.qualcomm.com>
Date: Wed, 30 Apr 2025 16:06:00 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] usb: gadget: u_serial: Implement remote wakeup
 capability
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-usb@vger.kernel.org
References: <aBHatifO5bjR1yPt@stanley.mountain>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <aBHatifO5bjR1yPt@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=B7i50PtM c=1 sm=1 tr=0 ts=6811fd15 cx=c_pps a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=YKPXZkJSukTfAJudJZwA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: qyvXEvCRc9zGGZeOGc_lWJVBEy4_JPCn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA3NSBTYWx0ZWRfX1Qt+wLwH7ohY Ir6Kpfp9XOzCeaIgOGDJFHQTUQC/GJwo/9tpwz/0nw9ZXw2T6pVOQ3I/nUyftDzBql0dh8OC15C WGJZP3Awjgka+pd1TZoQ0nSTfGzveqG1m520prvHLD2ySOm/J6MvixmTpgKSiGCcAoyMAL72c5t
 aEmvT4TWEnIMG//iQuCRAeXGxQCsSYaVlcbppB3oInWWsjYOFw3Arv+puNfjdVQMpZIB00tFsiC mXvz3p8kjwtB6FifiOA3eG0AeYCDWPx/bXw4wjgoaHAZIp9PM+ckaZ7KHCNFXJRc2dqWPwlIkQA 46fxvn3bBuGnC64TVhe+24cuolNad6DYxb7Dd2llpWFUQYmb1B9nrjMmtHBuuiB5QILtvp7nH3i
 xpHd4TraXMJgD4HkmzL+q588Dgcd8UT+Lb47J063a2tyjJk6iNHTNRsLhVKE/qBF559Tbc2d
X-Proofpoint-ORIG-GUID: qyvXEvCRc9zGGZeOGc_lWJVBEy4_JPCn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1015
 mlxscore=0 impostorscore=0 mlxlogscore=762 lowpriorityscore=0
 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300075



On 30-04-25 01:39 pm, Dan Carpenter wrote:
> Hello Prashanth K,
> 
> Commit 3baea29dc0a7 ("usb: gadget: u_serial: Implement remote wakeup
> capability") from Apr 24, 2025 (linux-next), leads to the following
> Smatch static checker warning:
> 
> drivers/usb/gadget/function/u_serial.c:1511 gserial_suspend() warn: double unlock 'global &serial_port_lock' (orig line 1505)
> drivers/usb/gadget/function/u_serial.c:1514 gserial_suspend() warn: double unlock 'flags' (orig line 1505)
> 
> drivers/usb/gadget/function/u_serial.c
>     1501         }
>     1502 
>     1503         if (port->write_busy || port->write_started) {
>     1504                 /* Wakeup to host if there are ongoing transfers */
>     1505                 spin_unlock_irqrestore(&serial_port_lock, flags);
>                                                  ^^^^^^^^^^^^^^^^  ^^^^^
> We unlock here.
> 
>     1506                 if (!gserial_wakeup_host(gser))
> 
> Assume gserial_wakeup_host() fails so we don't return on the next line.
> 
>     1507                         return;
>     1508         }
>     1509 
>     1510         spin_lock(&port->port_lock);
> --> 1511         spin_unlock(&serial_port_lock);
>                              ^^^^^^^^^^^^^^^^^
> Double unlock.
> 
>     1512         port->suspended = true;
>     1513         port->start_delayed = true;
>     1514         spin_unlock_irqrestore(&port->port_lock, flags);
>                                                           ^^^^^
> IRQs were already enabled.  Which is probably fine, I don't know.
> 
>     1515 }
> 
> regards,
> dan carpenter

Can you send a patch, or should i fix it? Let me know.
I think we can rearrange the locks also, something like this,

diff --git a/drivers/usb/gadget/function/u_serial.c
b/drivers/usb/gadget/function/u_serial.c
index 41dee7c8cc7c..1f182fce071a 100644
--- a/drivers/usb/gadget/function/u_serial.c
+++ b/drivers/usb/gadget/function/u_serial.c
@@ -1500,15 +1500,16 @@ void gserial_suspend(struct gserial *gser)
                return;
        }

+       spin_lock(&port->port_lock);
+       spin_unlock(&serial_port_lock);
        if (port->write_busy || port->write_started) {
                /* Wakeup to host if there are ongoing transfers */
-               spin_unlock_irqrestore(&serial_port_lock, flags);
+               spin_unlock_irqrestore(&port->port_lock, flags);
                if (!gserial_wakeup_host(gser))
                        return;
+               spin_lock_irqsave(&port->port_lock, flags);
        }

-       spin_lock(&port->port_lock);
-       spin_unlock(&serial_port_lock);
        port->suspended = true;
        port->start_delayed = true;
        spin_unlock_irqrestore(&port->port_lock, flags);

Regards,
Prashanth K

