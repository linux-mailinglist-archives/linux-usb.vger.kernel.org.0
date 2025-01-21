Return-Path: <linux-usb+bounces-19548-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 45391A17676
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jan 2025 05:20:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D79011888112
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jan 2025 04:20:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DE441925BF;
	Tue, 21 Jan 2025 04:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dbIGMZ+j"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E7A1487E1
	for <linux-usb@vger.kernel.org>; Tue, 21 Jan 2025 04:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737433217; cv=none; b=P3gLzBxowRGqjXvtLCkVOxxNThvXDx4iyS9NmhBMymZzJtrUd4KbdlRi2J+hWOCEfaUgmOqmdi5nLetq8yj4F3qVENBj1+LN+NzXkRWBYI6z1sD5YP641xHBggkqlMa6iZir7GiE+YYVLL4zNudIDrflD/VuhPmafBBUW81qPRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737433217; c=relaxed/simple;
	bh=WtNseL/4ux+w4KqLgQWzWM6xsYjXs4B9v86pjNSLAVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OJ0rw3wV+FXfJTXUGhYEIlmtJ2ojdzUY+pC7n+FhmTAeZ7O5fkLFLibRdKMnub3WRcTXRrASsSq0XHuA2wj7sWoostmBUWxMmq4hRVilwEe9NLwoGSI8FlmbKqehD2NuDvZ0KcFdLG0clgqOwpS/dkQYiJpva2qPhPsGs2kGFjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dbIGMZ+j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50KLwK1a000934
	for <linux-usb@vger.kernel.org>; Tue, 21 Jan 2025 04:20:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EnJ8550TGSZJxXunYDeoj9cQwxmwwmeTmd5HHzXnzus=; b=dbIGMZ+jaKY3f+g4
	AjVoo6YSMwEWMsuMzmk1cRlHv+1CUER+OdiOJuhD+qdP/SYRYh+Wm/IMK6sK/0+A
	MJM3mcZNjQKUecYZhSd/tWVxkkrB9bXJDyVQt6mZ3baJRE89qPvsqRvyV9PB6TNW
	gqpTy61zuI47QpPe6ISkifJaZQO3exXJQhW8YdMWKH3jkiIABddyv3E0zReEujBH
	6L/6vuuLPUy57RHJpSNaN73+YjxsnAjOaglr+92lm5Ye9JhqshDCDtnGGJ6h07GG
	3xoM+Fs1Ws/KTKw/wL1ARfDStvf0f2ifL+8hG6NGaR92hdyPyIt2D8nug2uRFFr4
	0u4sWg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 449ruf97c2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 21 Jan 2025 04:20:14 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ef9864e006so14552888a91.2
        for <linux-usb@vger.kernel.org>; Mon, 20 Jan 2025 20:20:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737433213; x=1738038013;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EnJ8550TGSZJxXunYDeoj9cQwxmwwmeTmd5HHzXnzus=;
        b=L/BKnxeyaVPOmaO6r9O6A+toH8ez3fFOQ3HuzSpJcL7FMAZChWLDymJDR0Dt6K6ASY
         vNokwa6WVzi4Ui0RaM2IzuIU66wxTihmSDyHWuVKWNoQlsf9mKklfaaoLZ/RvPqktLSK
         tzKUj40oUIksKoNKndYGDsPFlH/jVi0ne2k3LTk9nUnlrsOv3zN73Eb44BdPRGMHVJUD
         q105llbxs6Ngyo0RZNopVV1jW2hX3+l203ahzbAzkJ7qsAHTuXTk7EJ1ToovXrNZ/ts7
         QEiUCD2rANa7LREQejvN6OMdrHI4Ax/pY4dJ4iYNM/vVIAMthZrXdZYO0E4LImCLJBrc
         iSkw==
X-Forwarded-Encrypted: i=1; AJvYcCWQ8p9GpTaL+blmLvCyQkHZPS7vneKg/qoKooxgtoiYD8TqWxX8IvbLXTKHtzcKcV1rfXEE9IkeZb8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzotzjr+AAyXgDwrUPSeOoOUnUtVQak5n356My4bCk5/px2rLd+
	E1Wfy6RmY5tXubSto94zwmfkKLRmdrIBjtb2y7ZgKDZbFd5yfwOH4phqLMdmdze4U+CopwuJ59Q
	xCWMQ/Zr6S8l99pGLTI3+KbKYIYe8wCf7O0gcvb9nkWEoiy8+SXMIbFHbGAk=
X-Gm-Gg: ASbGncuvuSKo10aSE85TzWxjhHKBt4qHeNZHDbfjD2Yfcf2WhsP0h9rbXYvsTecY/G8
	832UMmHWG85Eon3yrA6LdmQNcP4DTjA4vDlijqXfGqnJd7KFGN2ug6yRDdVpO4E6vdoFcA8BFdm
	nQB3i3Rf8af3pDKfSGn3VLVl2Nm/m23pJkfN9I5GPpsmU12K+eUpq+yR8a0jFMsu7CmUBiJImGT
	ov/c8e7M6P2lIBfenfHgUXa2LeNp8qXoZD291Dezt40VhJ8UE03rQlRVSiWNcJLz1/pb8Jm1OYY
	JaJRH466BRkK00ZkoH8=
X-Received: by 2002:a17:90b:2e4b:b0:2ea:9ccb:d1f4 with SMTP id 98e67ed59e1d1-2f782afebd6mr28121779a91.0.1737433213484;
        Mon, 20 Jan 2025 20:20:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzuu+UMw6dxadVPS9Dl69yNaWc5EQ1KUib72aIqfm+b75fFvwCWDZZxholjsCWJKBU8jL8mw==
X-Received: by 2002:a17:90b:2e4b:b0:2ea:9ccb:d1f4 with SMTP id 98e67ed59e1d1-2f782afebd6mr28121744a91.0.1737433213103;
        Mon, 20 Jan 2025 20:20:13 -0800 (PST)
Received: from [10.218.35.239] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f72c2bb2cdsm11901421a91.34.2025.01.20.20.20.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jan 2025 20:20:12 -0800 (PST)
Message-ID: <1b1587e8-5c38-4138-a27a-1de71ff07ce3@oss.qualcomm.com>
Date: Tue, 21 Jan 2025 09:50:08 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: gadget: Increase the limit of USB_GADGET_VBUS_DRAW
 to 900mA
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simona Vetter <simona.vetter@ffwll.ch>, Takashi Iwai <tiwai@suse.de>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250120111702.3738161-1-prashanth.k@oss.qualcomm.com>
 <894f42a7-50a5-401e-a705-a06eafd6161d@rowland.harvard.edu>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <894f42a7-50a5-401e-a705-a06eafd6161d@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OQwBiNlv714vNr-fEVM9QDIyk4tLiADK
X-Proofpoint-ORIG-GUID: OQwBiNlv714vNr-fEVM9QDIyk4tLiADK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_02,2025-01-20_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 adultscore=0 bulkscore=1 impostorscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=539 malwarescore=0
 lowpriorityscore=1 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501210032



On 20-01-25 08:17 pm, Alan Stern wrote:
> On Mon, Jan 20, 2025 at 04:47:02PM +0530, Prashanth K wrote:
>> Currently CONFIG_USB_GADGET_VBUS_DRAW limits the maximum current
>> drawn from Vbus to be up to 500mA. However USB gadget operating
>> in SuperSpeed or higher can draw up to 900mA. Also, MaxPower in
>> ConfigFS takes its default value from this config. Hence increase
>> the allowed range of CONFIG_USB_GADGET_VBUS_DRAW to 900mA.
> 
> Is this the sort of thing that really needs to be a Kconfig option?  Why 
> not make the decision at runtime, based on the needs of the gadget or 
> function drivers and the connection speed?
> 
> Alan Stern
> 

Right, set_config() in composite.c does this in runtime based on the
values of MaxPower (from configFS), VBUS_DRAW defconfig and speed.
If we don't set MaxPower from configFS, this config helps to set it
during compile time. In fact MaxPower in configFS takes its default
value from CONFIG_USB_GADGET_VBUS_DRAW . Sent this patch because Kconfig
has this limitation where it's only allowing values upto 500mA.

Regards,
Prashanth K


