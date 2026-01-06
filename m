Return-Path: <linux-usb+bounces-31955-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 39ACFCF7EA7
	for <lists+linux-usb@lfdr.de>; Tue, 06 Jan 2026 11:57:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BA7F5312C574
	for <lists+linux-usb@lfdr.de>; Tue,  6 Jan 2026 10:51:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94A9133D506;
	Tue,  6 Jan 2026 10:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ANcwlvKO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UriZ+t7k"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBC3332EC0
	for <linux-usb@vger.kernel.org>; Tue,  6 Jan 2026 10:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767696217; cv=none; b=bDdGcmYN5YGHHsJRhQAgFVEJ8l3SqZLFCRg7Q4VcvOU913yFBDmN0VEBJwbyn4e3j9YBo+P4KVG0ch9OG4jsK9y0ddSf3NaHfEgjhd1W902EbPPR6w6YOk2IQ9hFVAVZTwSzevnZ4SE1ESXtpW4c/RthqxdJh4eVjza6PP1EogA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767696217; c=relaxed/simple;
	bh=2fAB6+/KMuoBVaQEZyY+PNgNh0PS6D79604n36GnY9M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W3gbiDrGChHQy8gjj8OA2SSpNTxApVAd4brzfz663WGX5ecgiXQ5lq/dJvyFs/B3yC/OsnmnpdZEwb3r6tB6cNFMf12SKmSLVdfCWLSSNebeHSP4shNAn/l+4gdn8RLXRBtyUdMpFpkoc2p2xLvM1T7CZrDQZJg060L/7V+OeM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ANcwlvKO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UriZ+t7k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60649fTO2255371
	for <linux-usb@vger.kernel.org>; Tue, 6 Jan 2026 10:43:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W1scqsAzjl0NVnDMaIgntro8hRZ94WypWn4MviwX0f0=; b=ANcwlvKOX7jn/XKJ
	HF7FxzHx0qwHYs5/3oiH6i2G5g4Rcir4SyXQY+eXvV2vNsmaBFroARHXJpbHoMeV
	LP5a77T719CTqYgXmSAe+YsFg3FnOUuaMDfaWAMxKcvGi/rRUgruiFu3FaErYBQn
	C1N2POk9XdZrUA8mO0LnCpb5K3DjzR0T5eKTwDjThxNDiaIRu6OQ/yfIK8DA42oi
	Rh6uySim5vEDZgdBemzrqJ3sQd3P1MEa9tfZkFWQwvbqUSHimQ8YBJwOW/MDdM+B
	xJ7/WjA1TtYc5jdXXWBCparfXbFvGTszMTfP9NkwtdNFNzmQWUCOHTAd5QEe9X2W
	C+ngdg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgu42139d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 06 Jan 2026 10:43:34 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2b0588c6719so2578022eec.0
        for <linux-usb@vger.kernel.org>; Tue, 06 Jan 2026 02:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767696213; x=1768301013; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W1scqsAzjl0NVnDMaIgntro8hRZ94WypWn4MviwX0f0=;
        b=UriZ+t7k2ovu4YqU/rUj5v7eBR7YyaBeEe943jpbSVx7YR03mBuIPjX1eEzUOP+DTM
         bFVZD4DbD0k101HoO0HSpckPOE7lxoZppIK4QMWxqEYAZwK2Im8G/jjtlJNweCNRfx1C
         4n2MMXre6mm5WRBWPF7gpIYUyM1DC1XdUeLw7AnBpf+Fn/rJs33uLn9jj1paq1Uu9yng
         2pPdMzX6pFOCog2HPZ8fLScr+IStGDhyov6aA4r85YuHSj20yjIE4c8aTovuAoQt6Ac8
         4D3NhqadIEkxU0RXQk6Os9nMyFZuNGGTf2WoSfo9LpQ+HdJT6ZxeBn+k1Ota82ujrAuO
         z0Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767696213; x=1768301013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W1scqsAzjl0NVnDMaIgntro8hRZ94WypWn4MviwX0f0=;
        b=hLUr73B+ug719MPKNSqia+8yhGHmYvxjcbGcDz8mYF5FtFDzOIzjaflvaWsFlEDF+8
         TnUAFp3gXfGpAq96380vIdFpmsyTHxNSJfKo8mnrvOS16GN0z++JzBXtzuCT5Wnz/W7L
         0GR3fbLYw7uN2UqDlejv8ECYbv3nrh/h7nfYsrFZacmFljnlKyMUdZQbmYJ/EyeIJKF8
         AbgYbhbtpSVVLDdjLDdpKBC8ZsfIyMt1uTfO2IhFaVSdgDReXlx6NRjHihjSwW/wwxYW
         KpN3c8RB8K65ZhX4pfWbnFplIiYy6KCPXI8wg7lb15tIpJe2R2w0flZI3znY5UbZXX5r
         BirA==
X-Forwarded-Encrypted: i=1; AJvYcCUf5JE9/X23PrmNZn8sw4PhzSjX97LoJiAFnagcoMJ9FnCV7LJihedw2KnhAV6qBBL6DKErQKYB3+s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQS6fokxCn/n6ONm7DoneMOIRlNT3by+RfQYP4Gz0DTo99hwtm
	cRDQXl/sSWxxaRME90DesYCAW2/sqFk3Ea2dL+kBYnMFk2nWwQYPiji+B9Qa2AhyBmVoIs4cUYC
	nkPr/KtPD6greeVdf080kv19eBcQTn/E34x7YLUy9BQdNw6+uldbR4+tnn4DvcE7Jp6nqObHY5j
	VAAOM6oYeflS0mV/nftq6S9ceiA6BG90haQWlbBbZQJO13VHZM
X-Gm-Gg: AY/fxX5WURLCkUKEZ9VWQnE0tuifqqDBQhFGOUU9c46MNkItXmOfaBfdD4jhRhuwWxt
	SD69bYQdqWaq4T7DYRUz30e8hwZvrB4s5gGSzDTqnM26Txhw29B1RLizxgueF0o7VvPvXg4YUKe
	nqanxLk2KDSzXo3VHAbIQciB4P04PcYHZJKDPokYIF2o8D7/0GGw4E+DffRPE/e76hh7Q=
X-Received: by 2002:a05:7300:3212:b0:2ae:5b9b:c060 with SMTP id 5a478bee46e88-2b16fdb816fmr2084060eec.6.1767696213118;
        Tue, 06 Jan 2026 02:43:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFdPzoBpuBp5ZyXX7xscbVE9v3Npbogd2TKw+iSx/3V7+pJ4euz7/+g+ln8tgugk1et2cOEXjiKSeoslRYYEmg=
X-Received: by 2002:a05:7300:3212:b0:2ae:5b9b:c060 with SMTP id
 5a478bee46e88-2b16fdb816fmr2084047eec.6.1767696212339; Tue, 06 Jan 2026
 02:43:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260105050724.2041581-1-udipto.goswami@oss.qualcomm.com> <9101e538-022a-4802-8bec-891c14b221a9@rowland.harvard.edu>
In-Reply-To: <9101e538-022a-4802-8bec-891c14b221a9@rowland.harvard.edu>
From: Udipto Goswami <udipto.goswami@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 16:13:21 +0530
X-Gm-Features: AQt7F2pwwNUr6HcIl37HLQ8QHog9v8XDrz2ODcWuAWxMi_m974LoJrVPvLfHvI8
Message-ID: <CAMTwNXAECok2-4yO8sPtNgGE6u+qLALRSUnsbOfC7XfGKTJn0w@mail.gmail.com>
Subject: Re: [RFC PATCH] usb: gadget: uvc: Prevent smmu fault in unstopped
 stream uvc teardown
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Frederic Weisbecker <frederic@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=dYuNHHXe c=1 sm=1 tr=0 ts=695ce756 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=iBfxf9IVUiYKS4j1rZMA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: 2B1j6R_SHaYDPkUq_fWYy_6EoxmwK0Pt
X-Proofpoint-ORIG-GUID: 2B1j6R_SHaYDPkUq_fWYy_6EoxmwK0Pt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA5MSBTYWx0ZWRfX2X/gZBNdmlj2
 9Yg53uRsiJ8LStYNpKMA1BkSA8XHpDBMUNT7zfGZjOFb7pXubI6fxug2jVfQKoO2f/Jna1yrDZn
 LrtprbN3Cj0j4t5qu88U7UmgEFStUOMc1q7H5Q4zLBV4t0Sbbp37FYrs85fAuxQiUXvfQ7wxYGs
 1FbDxbbdA+EztEvMOJRU1ex2GlU79nu4JVedPhqORd7isarF/xUHDsvM3P3/Q6lU0aPaksBZvSb
 1onyQoWRpWtzlUFhpe2N1FoAicq3VbHzwunbRgYMrXIZ52D5pkJcDntbh8XJW2UMVC4e+AFkEqL
 F059Yvx+y+uPjH3QnoENquqfxHaLBxKxOdschCPPKw4J0tDfJ3r78aa/p/S8YEmfafMo5JH5qTr
 imBlMZZzjPOtfsDch9AOU7xrjufSlW6cogZJRirisVYsStMqPlbncquvpKJLantmdmUC0mJ51mD
 ymERXMGTV4FoJqDAzfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060091

On Mon, Jan 5, 2026 at 9:25=E2=80=AFPM Alan Stern <stern@rowland.harvard.ed=
u> wrote:
>
> On Mon, Jan 05, 2026 at 10:37:24AM +0530, Udipto Goswami wrote:
> > When switching USB compositions while the camera is streaming, an SMMU
> > fault can occur because dwc3_remove_requests() unmaps buffers via
> > dwc3_gadget_giveback() while the controller hardware is still performin=
g
> > DMA operations on subsequent requests in the started_list.
> >
> > Fix this by adding a delay in uvc_video_complete() when handling the fi=
rst
> > -ESHUTDOWN event  (detected by checking !UVC_QUEUE_DISCONNECTED) to all=
ow
> > the controller to  complete in-flight DMA and drain its FIFO before
> > dwc3_remove_requests()  proceeds to unmap remaining buffers,
> > preventing the SMMU translation fault.
>
> Wouldn't it be better to wait for the in-flight URBs to complete, so
> that you _know_ the controller is finished with them, instead of
> delaying for some arbitrary and possibly too-short amount of time?
>
> Also, wouldn't it be better to avoid calling mdelay() while in interrupt
> or atomic context?
>
> Alan Stern

Hi Alan,
True, but i think we wouldn't know for ISOC eps whether the TRB got
completed or not since CMDIOC isn't set for these,
We also tried to address the same from the gadget.c dwc3_send_gadget_ep_cmd=
()
Something like this:

- if (DWC3_DEPCMD_CMD(cmd) =3D=3D DWC3_DEPCMD_ENDTRANSFER &&

-   !(cmd & DWC3_DEPCMD_CMDIOC))
- mdelay(1);
+ if (DWC3_DEPCMD_CMD(cmd) =3D=3D DWC3_DEPCMD_ENDTRANSFER &&
+   !(cmd & DWC3_DEPCMD_CMDIOC)){
+   if(usb_endpoint_xfer_isoc(desc))
+ mdelay(10);
+ else
+ mdelay(1);
+ }
But this didn't help mitigate it.

mdelay is busy wait (without sleep) so I thought it should be fine,
but yah if you see any risk with this I can try removing these.
Moreover our problem here is no one from the userspace or the upper
layer called a streamoff which is why the requests are still in
flight.
We do not see this issue if a disconnect had been performed while in
flight, it seems there is a different approach which disconnect takes
to handle this.

Thanks,
-Udipto

