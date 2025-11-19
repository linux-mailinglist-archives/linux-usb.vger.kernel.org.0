Return-Path: <linux-usb+bounces-30732-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF48C705B5
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 18:13:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E59D735EB31
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 17:04:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7DB630101B;
	Wed, 19 Nov 2025 17:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dNy/tFNO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PwufumZk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7BB3019D6
	for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 17:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763571868; cv=none; b=BC6bT6SnWUwPZzT7v/TlBXPDer00Ww1KA96SVmXIbWJNVWqhJaFOZ9Nv5xNYzs9FcojhH4P/F0opS5kDR9scWgYQzEyuD86JZnMmifMODjw76OipD0Gx7ksaRGvd6YsqaDJ6oNCtZLcCVaEdW8tNp04lt4+W/VlD56N1QxO3+MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763571868; c=relaxed/simple;
	bh=jKLAPgso9BGvGTL3YApZbRgRvjdCvMQGfgrTi4KRkyo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Th1yZwk5ZhH0Zi68KD5EmIqqiyNMmoxmHTPBZZtc8z+n8VNqWXk66kBaTSk+3GDJzQCue9bcKUZ7x1UerKd/jOQG0i/ntCKPXE/vgvE8vv92DzdDsc+gP0VBhpSBT5R/u6aqkdkaYJeas37yK6s1f3ioxRTzJYZhQVDiB10VHvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dNy/tFNO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PwufumZk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJFkPWL2583637
	for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 17:04:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nct4hnlW4cqd3dOh6scV/QDDf8z9K2+zW7B+EbDc9FQ=; b=dNy/tFNOh3c7kZJ9
	oaKt9SlC6/29E72oYsV+Dz2/kTH3HGgfLwvIfgD22U2ybvC/5j80BSQc2Z7S7eUL
	aaoCkz0ZPemFnSFEiXZGaCUCdWq0WW5Bl+ITfNm5fkcGKegheTaH9ceUV5I2+rPj
	BxDiF6F5WdXNAlyeXXXydiMLZTB4Ek0ZhU0AegfQuPZkciFwTjwtE5v8q6bGNnMY
	Fwz+HiTkV1pXhMJJIrO/911gtZqi44gHSlQS6d2EjYdU1RZKRyE9rk+v/x99tY/I
	m4QRdNXjrTMo80IzOkqIylUIFesjXZqvbzAaWXk9/ANDbWVox+hbkuaI6cteJDfH
	Qd79pA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahcqnh1eu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 17:04:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee27e24711so70627831cf.1
        for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 09:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763571864; x=1764176664; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nct4hnlW4cqd3dOh6scV/QDDf8z9K2+zW7B+EbDc9FQ=;
        b=PwufumZk1O+Gizf0QkW0fveXxwQKIXmnowwXbufUf/i65NrUru/rAqjL4ItwrtvUk/
         Ik+RuTBXwgf8YD+aeRhYixGd3dDtfnAW2u5dsHi8UdUJ03Zj1GAbSvGRgbjVBGwpKina
         GiB+Pvq3ibpF4pduoWaVM3yOztvzSwjVLNzR+/QpEYB+Ji8siVOkYhPz+neckWkERcEh
         Nf3friTAYQMS0s9WPZubSNC9VlM/0BfWOemADhkr+Cj4/DCUs1b4idjSVJrw4zPKtquZ
         3AIFvlxbtTZhUMj8WMVdFUQMhTlqiCd+VeSPeLlt/n1eNbqOcQKPk2q35ee25gakrpvk
         q3RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763571864; x=1764176664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Nct4hnlW4cqd3dOh6scV/QDDf8z9K2+zW7B+EbDc9FQ=;
        b=nCyRp2AL/38WGTzP3px/t3hg+mzS3QPpEnaxYA3x+bJcQMEdpqFAuZVt6leU6Clhn6
         3pGzrKMDbf1voWfB5WZ/4aP4NuNyF6KdVOxHnaiPHVpMmaQYG87MtWGcKs2vhPPxUkrC
         Lh1kshESCv2G0vtAiGtM6xs/R0YtXxwgGSSGVnFMesfg67xSqBTqny9TQ70i08ii6IeO
         MW36XAkhlFtUkUl5jiOC6VqPDinOg9nzB9m4US4RuJmzUcdTKwHUFcjzzbQ80pYhUVAk
         uSgRePMYXIiKAvxa4M1YD4YY54RIU2zmosr1RjYR7ii1Xcs8zmF69Etp3I+Fi4W/aGCf
         Q57A==
X-Forwarded-Encrypted: i=1; AJvYcCUAVyIb5xNUgVWHHCgpfqUk/FQnwfXmkIWpft1wnHksgD0fcEk3mVIfV1eI6qJx7n0QAP7bBFQgbZc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxI3ZqF3FtEdh4G/hGfqmXLWJgidmWIrwcufrXrVylFxxuH8EQ6
	wSr1Z3DSnYd6fH/Gqvg1zn4qFWVcdAUdFeGdfJQiLLfNAXkiSGhGZgMjCKY8qtl7MPyp0FkjCWD
	FG8z9Zjrbv/mb1t0J7fbKq1vG4ga5sAh7ou2Zu68XxQ+AKv5kC2GWsestLcsSQhIY/8rUyd8jbG
	sw4s0hYnuUNt8QsaPxCltKd4Ug9y7P1590Au8Frw==
X-Gm-Gg: ASbGncvrwwpQLu8J8IYBPWGIn+gBY25f2ULj6Ak1szROLkGrNzfJSyfSueRaAmfCW69
	liQ++871zYWValcCPqwr8aF7eaMwXyXYJ1e5Ccs7oE5RavPvEt9+nfRNNViWStp9liWZKTxgznk
	8Mhmup4XOk6SO422WEWImbVn3N78qMcriEV/G4s02BXgf/5DZ5GKAHrlG7apbAlx8oRuJ+tDB1d
	c6+c469F2fmNtmSiqfEBF63yfQ=
X-Received: by 2002:ac8:7d11:0:b0:4ed:d2e:3279 with SMTP id d75a77b69052e-4edf2196c74mr273783921cf.84.1763571864019;
        Wed, 19 Nov 2025 09:04:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGzCDwAoANZQO3b2SF2NKiMyJ15g6051kITe5kpiEnVi9WeaXR6EObIhZlbGp40soGV123jUPOYf18nyHCFky8=
X-Received: by 2002:ac8:7d11:0:b0:4ed:d2e:3279 with SMTP id
 d75a77b69052e-4edf2196c74mr273782271cf.84.1763571862801; Wed, 19 Nov 2025
 09:04:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251028080553.618304-1-manish.nagar@oss.qualcomm.com>
 <20251029234724.pg2icfi3a63ojsxn@synopsys.com> <CADGrZwXmnKn68v_cR3o+MiLPAyo+ujtgbx50sK=+4rOfgcoyBA@mail.gmail.com>
 <20251114002946.427ab4xdq7qhbi2k@synopsys.com>
In-Reply-To: <20251114002946.427ab4xdq7qhbi2k@synopsys.com>
From: Manish Nagar <manish.nagar@oss.qualcomm.com>
Date: Wed, 19 Nov 2025 22:34:11 +0530
X-Gm-Features: AWmQ_bmjpcG9jrrD_893ZL30WaUb4-KCEes4dN8VLvlSXHi-5XZNLsEhPK00naI
Message-ID: <CADGrZwUnwv5m5r-Vv8CxwiHSxOw3HDfBQJRWezPQRJ_c6V8rXg@mail.gmail.com>
Subject: Re: [PATCH] usb: dwc3: Fix race condition between concurrent
 dwc3_remove_requests() call paths
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDEzNSBTYWx0ZWRfX/QD4KE4Xjh8d
 lGqctyNNvU9UhNLkwTFOVmvcPNzAD4MzO+VJQG1YMqNqtlPDt+X+5XfHtb1GEVLpNcTNKr4Dlpb
 DGaj9LbAv+p8zBzhYZSk75YiPfTaxgJYjKUS3KjLYp7VwqyVTL+HL9DWJN8vyK1xIoSS0Q6ESEP
 anuV9Qf27I/u8tgtfyDZV+ZVwP83VqVR1nnr9fjh1hpeJgmFLEgf1s8DgBarvukzfdM3YpE/tP5
 Y52HZbXwy+FmHfnJ2hMDDJOs9p1MNGSfP7feW1hlu/E8dDRJ+1GnQNZIzotxXU9yULNQbzr4lQg
 G9vkS0CWj2x813UHx88cSlSxDW5CNLzpyMK0vDg1AUyb3GnaupHD4x7pZjoCo/Yt5i6hUv3/BA/
 IW77ZpYmloNUmnJl3y1iG9u7B3t6Gg==
X-Authority-Analysis: v=2.4 cv=ApfjHe9P c=1 sm=1 tr=0 ts=691df899 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=KxlKA3TKRzVUev0L-AcA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: guHKUo0XzmzGrR2bVpERu5EiGV_owSlC
X-Proofpoint-ORIG-GUID: guHKUo0XzmzGrR2bVpERu5EiGV_owSlC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_05,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511190135

Hi Greg,

I can=E2=80=99t identify a specific commit ID that I=E2=80=99m confident wa=
s the patch
introducing the bug.But I found the race condition and suggested this
patch to fix it.

Regards,

Manish


On 11/14/2025 5:59 AM, Thinh Nguyen wrote:
> On Thu, Nov 13, 2025, Manish Nagar wrote:
>> Hi ,
>>
>> Thanks for the suggestion ,
>>
>> On above your suggestion, I added a check for  dep->number as
>>
>> if ((req->status =3D=3D DWC3_REQUEST_STATUS_COMPLETED) && (dep->number >=
 1))
>> return;
>>
>> I included this condition to prevent enumeration failures. During the se=
quence
>> dwc3_gadget_giveback =E2=86=92 dwc3_ep0_interrupt =E2=86=92 dwc3_thread_=
interrupt, the giveback
>> for ep0 does not complete, so this check ensures proper handling.
>>
>> Please share your feedback, and I will proceed with v2 accordingly.
>>
> No, add checks for ep0 too.
>
> Try this:
>
> diff --git a/drivers/usb/dwc3/ep0.c b/drivers/usb/dwc3/ep0.c
> index b4229aa13f37..e0bad5708664 100644
> --- a/drivers/usb/dwc3/ep0.c
> +++ b/drivers/usb/dwc3/ep0.c
> @@ -94,6 +94,7 @@ static int __dwc3_gadget_ep0_queue(struct dwc3_ep *dep,
>       req->request.actual     =3D 0;
>       req->request.status     =3D -EINPROGRESS;
>       req->epnum              =3D dep->number;
> +     req->status             =3D DWC3_REQUEST_STATUS_QUEUED;
>
>       list_add_tail(&req->list, &dep->pending_list);
>
> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index 1f67fb6aead5..a1d2ff9254b4 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -228,6 +228,13 @@ void dwc3_gadget_giveback(struct dwc3_ep *dep, struc=
t dwc3_request *req,
>   {
>       struct dwc3                     *dwc =3D dep->dwc;
>
> +     /*
> +      * The request might have been processed and completed while the
> +      * spinlock was released. Skip processing if already completed.
> +      */
> +     if (req->status =3D=3D DWC3_REQUEST_STATUS_COMPLETED)
> +             return;
> +
>       dwc3_gadget_del_and_unmap_request(dep, req, status);
>       req->status =3D DWC3_REQUEST_STATUS_COMPLETED;
>
> ---
>
> BR,
> Thinh

