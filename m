Return-Path: <linux-usb+bounces-31903-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7BCCF289D
	for <lists+linux-usb@lfdr.de>; Mon, 05 Jan 2026 09:54:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4258300C5C2
	for <lists+linux-usb@lfdr.de>; Mon,  5 Jan 2026 08:52:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F733328613;
	Mon,  5 Jan 2026 08:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SCmoZYtl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bt8xy7xl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD5A328624
	for <linux-usb@vger.kernel.org>; Mon,  5 Jan 2026 08:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767603114; cv=none; b=rfXVOYsJuLNVVl5V4LCBVSsXCIV97YDqa98H9ntp57RsX4cm8fj6TOZ1zpd6FFvfW+O/WDelashkgqrxZ3I2teKxQfGjPsYyPtS77rxoWC5aoKmZaVM9iL6CwIaM7rmvEgmrKDVvbFVk1VMlQYpz3o5uQCEH/PmpkDc6sFD4cQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767603114; c=relaxed/simple;
	bh=3Aea8OD4nTXZTLXfReij5QErZikq/t7xs9H1lido2B8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mIscnnG+Tefr5FqPeC4Z6igE3sZRvFGRau4nQi2m+Sm287iNt4kypC/CG6HWLtoBdwWqyrETzXGklAqcWYluplw1mUsF2gBHqDu+KQgVHGBo7xs1915cZDQS5hglrgDl4e7BAlYsr45df+Gtx0T7j1LMA/CwYBXqB//8KxMV53I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SCmoZYtl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bt8xy7xl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6058Q9wV3874886
	for <linux-usb@vger.kernel.org>; Mon, 5 Jan 2026 08:51:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7+tdnWgm4pl32FpO9174FrM4tFQIqsOXSpDXakRLFSA=; b=SCmoZYtlds1w5E4N
	UfK8lEHMDQtvJwRP8xUWHDFJPnHyNMvcU8FQYPTEjTxnyobLQZSEGJZxwjfTHgUk
	3GIQEvIlKk2z5Y9amrCRZunQqxIVCQuPK4PJC/lBiLeKI05DicCjvqHRANRWfQx4
	j++EFI5Ej4fF7EyiN+DI+dKsb4V9V7OKYzA9Sq208BjD1I2Il1XcnmjoUGfmid/8
	xKm+i/YvSqEscZ2sUlOYozEjcXzc2dvrQUUg3X5mcRrpjpFITH7IkWUqkq5OYfXr
	qxiDKyyOEW7zsnsnYMTnDUx0a8EZI+FMGghnyq5is3G2iwdcV/Pt/YlihDEy9ly5
	EIzW3Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bfyx0hbp6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 05 Jan 2026 08:51:48 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b0588c6719so1469130eec.0
        for <linux-usb@vger.kernel.org>; Mon, 05 Jan 2026 00:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767603108; x=1768207908; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7+tdnWgm4pl32FpO9174FrM4tFQIqsOXSpDXakRLFSA=;
        b=bt8xy7xl7TBypO7anth/Cqz2gwxfRAdyZ/45MwfJHSpEXX/0bbA+Bhu5Kr2moI21Il
         jTCw56sfvnA6nvUdhrXGGeTOE8k7l9yeIo8aXgti7ZNDcsNT8DxgJsDsxpQKUzCEeXKC
         tW/WKYgVIW9iAhIXt20PIeN8r1/NOvKfqMQGMowxpMkQuRRT0DajsQsVSR+sIzuwWjUB
         Fa7/MTN9YJoRrjH/jONc3JeIHp7rgEpbUAiUYeApWJ/n4XQeq0PvBGuNmPLCs1so5h+d
         36vOCu887fD+6rtVjBvNV7+mkh0zpyz3RJNEUlaM/laCeJSPDOuv4rr72vSMYDX2Npcb
         bYNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767603108; x=1768207908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7+tdnWgm4pl32FpO9174FrM4tFQIqsOXSpDXakRLFSA=;
        b=hxr5sXt23iATu3oGTgm38b/hi+i7+Ua4eEEhvjrQWL9/DHKpDwIVpd6gK+PZKM8ADz
         ntUDgMpeeU/MpjIpgwRMTijPPAxNJRdd3B/BUoODQdkun768o28Lux1gnI3BqnvRcSp9
         /h8DFu+n4LMGgtT4Ep1+G4reYfZTD7hxxiWMlJ+g+r483EJzGcg6AxTYeORTmS3LlNGb
         GZkZcbSapOxBbM1S9Gmui4p5vTyVBK95j+sM7ebj7VV/4RSF53ju09wzWmTy9ctzXsB4
         gxM/YTeSS9vgjllbKkH4h79xgMnv8ks0kXEgMPQjpKTOKWZJ/D34G9XKSlPwe/ngCxj1
         DsKQ==
X-Gm-Message-State: AOJu0YxZh6cyPtdCM4L8faa7H41pE5w9S8EoCGX020SOmU65ci3nVFYg
	kag/oI9PwgLPN1Og8H8AqrmwO0olofkKhj8i01m8djLgcEKM6l5vckXZfndTY1ml/pkHzBIBxYm
	vl/JPdlp1uqPacBUdJeVOVf+agwKyi7AaNAv/IiO6XhkKaHYzyzD7jt7mt6ji6lVidomfJ06DeX
	arBigogU1UJ988YMJAPcPVbmUy1pJ4C9f4CcFBB7DY5/S1PRfD
X-Gm-Gg: AY/fxX6GURuuQPS/xmDMNVgdRXntfU/uzKAc6DMi+0hx2asCj6ZsA1s1etsbcpaCXBJ
	/IyYAmLAxvVt7bCHkeJ4ja8EG5V6dPhXlNTyk7XZNjN+tHU6XCHtyni0pdfci9Li70DVNk1kvud
	822u4JixHzvxGswU+Sx+OztwRLojoZ7yM2DO1NGkfOThcLCMmwLPVsxyKw7M8ft5ZGnd5t
X-Received: by 2002:a05:7300:7a27:b0:2ab:ca55:b75b with SMTP id 5a478bee46e88-2b14349c597mr5341946eec.20.1767603107496;
        Mon, 05 Jan 2026 00:51:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEyagPUdp5Qlp0LJgPykykuInGpRJoVts7cpy6aJ/iQc3JlZfRGh0nNSVa9/4ki4kxzJu8gdnAhdsPgB00PU4U=
X-Received: by 2002:a05:7300:7a27:b0:2ab:ca55:b75b with SMTP id
 5a478bee46e88-2b14349c597mr5341936eec.20.1767603106932; Mon, 05 Jan 2026
 00:51:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260105050724.2041581-1-udipto.goswami@oss.qualcomm.com>
In-Reply-To: <20260105050724.2041581-1-udipto.goswami@oss.qualcomm.com>
From: Udipto Goswami <udipto.goswami@oss.qualcomm.com>
Date: Mon, 5 Jan 2026 14:21:35 +0530
X-Gm-Features: AQt7F2rbJoNHFaryaOsEg72CQXV5MmCezWWMQZH8n8FmJ1vbUPrnekQfFFfUTno
Message-ID: <CAMTwNXDcHwMApfR87XzKCcePzHrrSYrzknH-+fnFoBJXYNFLmA@mail.gmail.com>
Subject: Re: [RFC PATCH] usb: gadget: uvc: Prevent smmu fault in unstopped
 stream uvc teardown
To: Frederic Weisbecker <frederic@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=CZYFJbrl c=1 sm=1 tr=0 ts=695b7ba4 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=RULmB7h89U7UFx8WAMEA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDA3OCBTYWx0ZWRfXz/fQhGRhz7/3
 7XICzW81SHEy0VFgooyhzfxUewAC0bZmWx+mz1KHBhGgXWf5Odvox/GuBXGbbeUPq57W+aCrZWf
 Fp+cf4ZFkIAt14PbIirNKa/pkG4ckrDNEgl3d/cOLERJg3x/6FxZxJJ3irM9nQYwDoy70mYxzjX
 p1cypvtu2L39A71gUIE+i2Q15KuPP7V9I373WxOQdidqAkXMu6Yhkhif/RmWz/7n2JL4s9UnI7g
 QNM0rkO+bDcxFPSZEiAzwhBrrZZPpMI4HAcEs1bZVhXz8FQYPLabGWyBb+GrlSX+nOzRwzaPP+x
 GcLnJFV7QQQwAyFZmKz6HmG/iPj2D3nKB43RG4qSn0BLhadahWk/XLDg6sOggdz1JGtcpWHeshO
 9299QVOlizo74cQGY7wCKfDvZFmVTQ2g+j5A+ttR8/27yt3Fszgk7yIkR0DrHxX0oLt8Q2E3LKJ
 TIKMWytACl7iEjy3qpg==
X-Proofpoint-GUID: MPDLor-bfRtV7u6LqX6cwaBtM0ayyXZt
X-Proofpoint-ORIG-GUID: MPDLor-bfRtV7u6LqX6cwaBtM0ayyXZt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050078

On Mon, Jan 5, 2026 at 10:37=E2=80=AFAM Udipto Goswami
<udipto.goswami@oss.qualcomm.com> wrote:
>
> When switching USB compositions while the camera is streaming, an SMMU
> fault can occur because dwc3_remove_requests() unmaps buffers via
> dwc3_gadget_giveback() while the controller hardware is still performing
> DMA operations on subsequent requests in the started_list.
>
> Fix this by adding a delay in uvc_video_complete() when handling the firs=
t
> -ESHUTDOWN event  (detected by checking !UVC_QUEUE_DISCONNECTED) to allow
> the controller to  complete in-flight DMA and drain its FIFO before
> dwc3_remove_requests()  proceeds to unmap remaining buffers,
> preventing the SMMU translation fault.
>
> Signed-off-by: Udipto Goswami <udipto.goswami@oss.qualcomm.com>
> ---
>  drivers/usb/gadget/function/uvc_video.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget=
/function/uvc_video.c
> index fb77b0b21790..04724bd44ab9 100644
> --- a/drivers/usb/gadget/function/uvc_video.c
> +++ b/drivers/usb/gadget/function/uvc_video.c
> @@ -366,7 +366,15 @@ uvc_video_complete(struct usb_ep *ep, struct usb_req=
uest *req)
>
>         case -ESHUTDOWN:        /* disconnect from host. */
>                 uvcg_dbg(&video->uvc->func, "VS request cancelled.\n");
> +               if (!(queue->flags & UVC_QUEUE_DISCONNECTED))
> +                       delay =3D 1;

Apologies for the oversight. This revision has a compilation failure
due to a missing declaration of the delay variable.
If the code logic looks sound, I will prepare and send a corrected
version after the review.

>                 uvcg_queue_cancel(queue, 1);
> +               if (delay) {
> +                       if (in_interrupt() || irqs_disabled() || in_atomi=
c())
> +                                mdelay(1);
> +                       else
> +                               msleep(50);
> +               }
>                 break;
>
>         default:
> --
> 2.34.1
>

