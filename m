Return-Path: <linux-usb+bounces-31954-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C86CF7DE9
	for <lists+linux-usb@lfdr.de>; Tue, 06 Jan 2026 11:48:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D6A830F2BBF
	for <lists+linux-usb@lfdr.de>; Tue,  6 Jan 2026 10:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21AFE33B6F0;
	Tue,  6 Jan 2026 10:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NaAFOrD9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hTP16W5D"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B4833B6CB
	for <linux-usb@vger.kernel.org>; Tue,  6 Jan 2026 10:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767696017; cv=none; b=nCJuvpAFZ29pg39sANSUex+TE7qUX5tw0CFyrZldl1wXQ0gugfJhg+f9nUesHC504sRvPfG3Agp2p0X3uqMbr/wiA9S2rlhyJtWmvT1h9nxJuwHm6Cz1aGJalAa0MMiZuCVIDta4qTuVK6vIt1KWhMKuj40xX8U5jeN5x1SCWF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767696017; c=relaxed/simple;
	bh=RmCh3WUOtgGdsUg12GnclxOceWwodbj5C7LmfgcwUMQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XDSiaeFq46m8mgsP3wUIBYdPHWeS8pAd/5vJqLzqpIJPvwkiEoTlb4J529vVsL3+AUFOQHvqdQ34BC92pRlSOznW6Oj27AwD3WdVp8Jp9eOF6i8e2m0FRdDtwLtoVf2uJqEXere4Uuo1RiLqglusIOyZQZzwS/oEMt2JUHQfO48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NaAFOrD9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hTP16W5D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60648sML2253695
	for <linux-usb@vger.kernel.org>; Tue, 6 Jan 2026 10:40:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JHqYO6BO15fOPfkj+h7yEWC2Q1w3hq6L9WKK/8MPd8U=; b=NaAFOrD9jOvFnHdK
	fXF8KSD5jRf88nK+DBi8NotXV2+WGjyxsI7MpV8hl4MlgmDS9ssmvBD/Kni0p7+y
	j4maOIWtHhxckYPybqaJpZrHqeBagn4SxJhZbpmSxvfda8DGhc8GBCuaqfE2YrRj
	o22Ox65pVXSscdXzJe6r838YKiwSqPE7XNBS+BMQpTCrronPmW1f3TT8hr1NXBDC
	saFa0UMW8RcT3B9k3Ottg6vI4bScTbV8Yd4O7NxRoXjF4lwgmZdbgHFuwfyICnUY
	ybNaP5s5KRRa74kIWkoM5HVz0NZtpHrM8wWH4Xi+ShL/amLqV63kEgnNr22buT3G
	iKFCmQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgu421310-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 06 Jan 2026 10:40:14 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b630753cc38so1401115a12.1
        for <linux-usb@vger.kernel.org>; Tue, 06 Jan 2026 02:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767696014; x=1768300814; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JHqYO6BO15fOPfkj+h7yEWC2Q1w3hq6L9WKK/8MPd8U=;
        b=hTP16W5Drs6W8FBo7l5HNAMDYktFKeqpzwf9sdUjEBKU3D+sHR2hx1N5fU7qs1remK
         H7J8LEVHYksSh9E1OAHkCgw+AiEbqpEGbf2dfBRwfB+bq1lHbW+OxjVB4fNEMqMbpoq7
         HghWaCP581Ujx1h6bOYrcLRGXYa516zl7Hb3/bhYa5dqx0Kt3mw1clN8aI8q5NFBWfqE
         vcl/JzZJPkQlhC2p32Gw9bC0sezu7xhDtxdnCSnDZHhB1RmDiowPxOmJ6Y6KqMYCKgPM
         liWCxV6zyF9oHAGKZkpH8icM0+g01i72OuepSr2gVoQlSibUo9NTu0EjQOYDtV1Tem1b
         Xnvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767696014; x=1768300814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JHqYO6BO15fOPfkj+h7yEWC2Q1w3hq6L9WKK/8MPd8U=;
        b=byzfFKNPyH21PUfgMT82zDdo6U8rz2UAURyUGCluQHttICZ8NuY0j4EHxkAE6anUg5
         Aka0TC2R/fCsJfrP8slAvEmgJseBOWzFeCcwl05TKTeCq7iU+lR2WIHmzGqOvoryqVXM
         7q0IljBZO16+oU5do4ER1KThkrfs4sOSHfTNs90Q787htCaEjjr4z3jIyeRRkZBUGvba
         KlKWtoGtSOzAOXdFk5RsIfr7y3ttewpCyv32/mtk3hUFRWpEsMv5vNpc0dqZ9h2p30/F
         wSfGqJotAZD8GVBHd66SKxmauNb+uylEEd/uZg2Uh4bQCCYKv4C/7B6AUAWKQpXqHWO0
         +ZiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGLZsKkbssbQ5ntNn9fJyIjw+qoRNF6mRy+XI+mkG2RftJ6TD6wnQQ76uETlJyIPlIcm4d3HOlo1w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQNon0eUMvqK6zmmua719irA6cI7pyLWwttEzZ1KsrYlgUYoUY
	2Yvq2uHx1TLuZgiD5aE2y8KQxhRPNt+0qJDXsNsLOZ2yU6aZG8JDdmFxUeQbf8ytu/Ywe7+NPwU
	LYTX9mrQPXqMCCLQVxxvn+r/JYziUTeSq/C3NHzzjnHvnp6rO61ogXreVzuGXGhsUIoc5iRpCaf
	Muqb/DonJC6/0reR5PhoAVckgzy2vk3eSG/AVzr9bGqnrCpOwH
X-Gm-Gg: AY/fxX4JazHkpF/QMPe6Tqtvod6YnpW3C4tREfTszVlceNCyPzCl7KOpemM/twQmq2i
	kJBWjpdATbTDK1KLMiln+Zk7BPcuy9CEFgeBlgDiBhdckdf1IkP+Bwg3DFgY2TpwS6+ciq+oDBF
	1e6u++Y9iHjn/7oSC9pna0YkkEHY6KvsHXG9Mh8DPtZdwF9qe6i8jtSeXf7P64/7ZoOTo=
X-Received: by 2002:a05:693c:2502:b0:2b0:4fe2:6a2e with SMTP id 5a478bee46e88-2b16f848917mr1563502eec.9.1767696013361;
        Tue, 06 Jan 2026 02:40:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IENOkq0XYxJVZPOPvsObP/xPRnTZZND3nsQw+FBo8HT7De96amjoKu86kRjwo8nECSU9iaSAJcEG8y2SyavXRw=
X-Received: by 2002:a05:693c:2502:b0:2b0:4fe2:6a2e with SMTP id
 5a478bee46e88-2b16f848917mr1563491eec.9.1767696012703; Tue, 06 Jan 2026
 02:40:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260105050724.2041581-1-udipto.goswami@oss.qualcomm.com>
 <CGME20260105085407epcas5p481f61dc289af9b1f2c7cf067dc2db82d@epcas5p4.samsung.com>
 <CAMTwNXDcHwMApfR87XzKCcePzHrrSYrzknH-+fnFoBJXYNFLmA@mail.gmail.com> <f8afe637-923c-4355-947c-bbb82dba4403@samsung.com>
In-Reply-To: <f8afe637-923c-4355-947c-bbb82dba4403@samsung.com>
From: Udipto Goswami <udipto.goswami@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 16:10:01 +0530
X-Gm-Features: AQt7F2qTasol_Qt_xuH-ecFRsSbD9uu0r_9HzcPKmJwiIVah2BF42we1zrQvb_0
Message-ID: <CAMTwNXBAwiz3hcUubazXw=u3R7TikZmm6dCF40_jaC2nW8PEEg@mail.gmail.com>
Subject: Re: [RFC PATCH] usb: gadget: uvc: Prevent smmu fault in unstopped
 stream uvc teardown
To: Selvarasu Ganesan <selvarasu.g@samsung.com>
Cc: Frederic Weisbecker <frederic@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=dYuNHHXe c=1 sm=1 tr=0 ts=695ce68e cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=hD80L64hAAAA:8 a=EUspDBNiAAAA:8
 a=ekaWjGixpw8aJrD4tIkA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: u-gvXNIGVOlF32N5kEaI5J3CP0oUuoC3
X-Proofpoint-ORIG-GUID: u-gvXNIGVOlF32N5kEaI5J3CP0oUuoC3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA5MSBTYWx0ZWRfXwDLJ9raxJ6Ux
 QZWTg4VnrNwpf6hXtAsyGBc0uECFTlqrbDuz+WiEF/t2yDT3FJ9jSkbJoHJD/qJ3eLsuhVKdbZW
 8mfIJaf+aXXuQtgSJ3hCoR2Jha3lY53TpeulEkPx/TAMufcHSesGjTmFAaaY1P6CIadgep3j0HV
 g2jHVmhjEA2+LCxHPzfQNhxLHjhVP52vqZPBeIa0RDLDY+qrIm9lf0XksstBlreWWPXhj4iHs43
 Eo8ZeMGNQy0y+nLt6fymjX2Mpr+5+YjCIzitqQVJtp5JEm9IhRvqvvat/KfCTJj6Sm+Ri7K16IE
 r3Awa5WhzHZll3/7MVZsroUAYEzSU4G6Plvs8vmO3ttgWn18LmLgf2sV3xhzc/Qsl9LUi4fx/ys
 qJB46dEXiiejQmL+TaBw5nYXMVhT0kTEog3VU7d0j+19zG8wOX5rvU10fhbt3VqAjpxB6d3UWPr
 oW46K37CppjOMomxlqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060091

On Mon, Jan 5, 2026 at 3:15=E2=80=AFPM Selvarasu Ganesan
<selvarasu.g@samsung.com> wrote:
>
>
> On 1/5/2026 2:21 PM, Udipto Goswami wrote:
> > On Mon, Jan 5, 2026 at 10:37=E2=80=AFAM Udipto Goswami
> > <udipto.goswami@oss.qualcomm.com> wrote:
> >> When switching USB compositions while the camera is streaming, an SMMU
> >> fault can occur because dwc3_remove_requests() unmaps buffers via
> >> dwc3_gadget_giveback() while the controller hardware is still performi=
ng
> >> DMA operations on subsequent requests in the started_list.
> This may be a problem with how the DWC3 gadget driver handles
> isochronous endpoints when the function driver issues an EP=E2=80=91disab=
le
> request as part of compositions switch from UVC.
>
> In the current dwc3_ep_disable implementation, the
> dwc3_gadget_giveback() request is issued without waiting for the
> completion of the End=E2=80=91Transfer command that stops the active tran=
sfer.

Yes Selva,
not sure if polling for CMDACT is a good option in the controller though.
What i understand the IOC for isoc eps is not set so we won't know
when the end transfer has completed, please correct me if i'm wrong
here.
>
> >>
> >> Fix this by adding a delay in uvc_video_complete() when handling the f=
irst
> >> -ESHUTDOWN event  (detected by checking !UVC_QUEUE_DISCONNECTED) to al=
low
> >> the controller to  complete in-flight DMA and drain its FIFO before
> >> dwc3_remove_requests()  proceeds to unmap remaining buffers,
> >> preventing the SMMU translation fault.
> >>
> >> Signed-off-by: Udipto Goswami <udipto.goswami@oss.qualcomm.com>
> >> ---
> >>   drivers/usb/gadget/function/uvc_video.c | 8 ++++++++
> >>   1 file changed, 8 insertions(+)
> >>
> >> diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gad=
get/function/uvc_video.c
> >> index fb77b0b21790..04724bd44ab9 100644
> >> --- a/drivers/usb/gadget/function/uvc_video.c
> >> +++ b/drivers/usb/gadget/function/uvc_video.c
> >> @@ -366,7 +366,15 @@ uvc_video_complete(struct usb_ep *ep, struct usb_=
request *req)
> >>
> >>          case -ESHUTDOWN:        /* disconnect from host. */
> >>                  uvcg_dbg(&video->uvc->func, "VS request cancelled.\n"=
);
> >> +               if (!(queue->flags & UVC_QUEUE_DISCONNECTED))
> >> +                       delay =3D 1;
> > Apologies for the oversight. This revision has a compilation failure
> > due to a missing declaration of the delay variable.
> > If the code logic looks sound, I will prepare and send a corrected
> > version after the review.
> >
> >>                  uvcg_queue_cancel(queue, 1);
> >> +               if (delay) {
> >> +                       if (in_interrupt() || irqs_disabled() || in_at=
omic())
> >> +                                mdelay(1);
> >> +                       else
> >> +                               msleep(50);
> >> +               }
> >>                  break;
>
>
> How you decided this delay time? And any reason why this delay is added
> after uvcg_queue_cancel?

this was based on a few hit and trails we tried from 10ms and reached to 50=
ms.
We 50ms was an ideal case where  the trbs had enough time to complete
accessing the DMA and release i believe.
I understand that the delay time has no basis however could be a concern.

From what I understand, uvcg_queue_cancel()  will remove the request
from the video->queue and the UVC_QUEUE_DISCONNECTED will be set.
So we want the active requests to be removed before doing so.

Thanks,
-Udipto

