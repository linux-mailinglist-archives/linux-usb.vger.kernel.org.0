Return-Path: <linux-usb+bounces-31974-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A0BCFBFE1
	for <lists+linux-usb@lfdr.de>; Wed, 07 Jan 2026 05:40:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E179930034A9
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jan 2026 04:40:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 327A91ADFE4;
	Wed,  7 Jan 2026 04:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YLX2JJ2Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YirvwO35"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F265F4C92
	for <linux-usb@vger.kernel.org>; Wed,  7 Jan 2026 04:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767760838; cv=none; b=SW5dEpqG8EGEtaQ85u/Sa8btnnxIgM3DJS/co1wmAV87hC4QN5myp0CGM1A2MI6+OGiJ+nz7keVm4cM9JNXA+7Lgmk+y3Pf9h+zUm/jWPaY0RUkPD06dBMKCXqtuEB/Vngbi2U2Jc1YbetFedoi8WMQiwiZWepKr0MmcL5EYSI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767760838; c=relaxed/simple;
	bh=qh4jl8ujnVyA3B07NQQCOdaBaBemY0u6bCA81HXytzE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NtD3t39Sq7s1qeB4sGukJ877SJ2KzwJe3racNESvDc1tbibAxrKQ7p8k97dkRN8+/cmv92ImV4xdcptsgNhRg0VdSwyBDVVIVVryB6rvPHd6cbek6GL0naeUA/4qzeS8MGdnalQJy864JodZQ9iuy2x2tEZQETAlvmRBbheK+Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YLX2JJ2Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YirvwO35; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6073ksvM4091254
	for <linux-usb@vger.kernel.org>; Wed, 7 Jan 2026 04:40:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Qu6TxSScz9w85QhKx2GiEo/1L0aA6zETFMU2CZaNlk=; b=YLX2JJ2QCSbxTlGs
	BuSoamDfFwzl2iNu86Q13tSIeTRMivX+6vxlLIKDdqJvuEO5nBAZFbbtwl9imf+q
	4F1PRzD+eBhcfRQUv968jTTrK3OVKi1VlubBTUhn8Owv9yw61nQhk8ujuviqUesj
	R4hF/hEL0RCtvoom4ze5ix3UZ0/1glVrPtcmzVa9Ltbb+p5uh213b/CnFLA8e5Td
	J8tRbcPqPgMIfI034XbqtneRtF79vY9FdmkM1xEkiIrklHadQSrcRtyyRU5W+RM2
	wZKMU+WeebsW9OtrV3TyOMicM1/7XWPdTn1z3bMWXz8Ysp9NAnwtY458SMCvTU5k
	NWpQQg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgyunb2fr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 07 Jan 2026 04:40:35 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ae32686ed0so3870159eec.0
        for <linux-usb@vger.kernel.org>; Tue, 06 Jan 2026 20:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767760835; x=1768365635; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Qu6TxSScz9w85QhKx2GiEo/1L0aA6zETFMU2CZaNlk=;
        b=YirvwO35gVP5tTTFwRwLFFFBinAz6Xe6nO/6brVfn3y4QeVUga3Aul4wa+ysQLXHG0
         esB5uxDGyrJ9ruAb9js51peMPtkyxm5YhBx8vgukqNxaNmW81RLcZQ4ctM9fj3//30qn
         x/X/p1L79AnLJMsR18V+zgNeYrfMWFZXdMYINHWL0Ami+8OJv8QdFhuhrn3z93yVwL8U
         DTQCEibEItWUeJvcQShK5DTZHhQit+HXIUbIP95N93soIQ2WbXBzBo3E1NzKV6KxtqpJ
         RegwtaL3o60HGXzxJVgOCv1Krf0IF8jti2ohS0tKRZwyKNobjfcnlWvXylcJVdxXljiz
         D54g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767760835; x=1768365635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1Qu6TxSScz9w85QhKx2GiEo/1L0aA6zETFMU2CZaNlk=;
        b=IsSNDm+US4hkU99cWvD/DE4l17WAaA8/SThj1TtqcVuGguDs6h4hNSnM4oP1KbZvAS
         BRBc3ZuZVuxcCiVolE6mlA23P302rBB1R3U4KjvUxqv7UO9QBAj/W1+XTvaLmPgY+5P+
         DBIM9P7FDnUmVg4ch8xZsi5aVDNAk0NeWmp58Fh+zZwQfkK/S4sg8+LjFpzHAspU54nz
         tMtQ96AvGEwbvRIV8J8yNRmpITNWP3f34u0dnfWVlFaFSMcK/5LvPmwit0dUFv5EVyiJ
         7Ji1bVvMLIJCplIdmU5EEjr1mrdlEURV9c7kPY/I+52CF4JyNXZ8SmTqQzRgYulSV1Gb
         jvRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaPltk45H+ksVeHkQwv5r9vksxV11kP9FnFQsNv91zXgQvyVxvhdrA97q8h8O4jdKE4/NstTSAzs4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwO0RaQd+1RInt94r2yoNAEA7iO5l4yy2P6gBK1AzHmc9JrFd79
	63B9QIKsruqnekZaCp29L/nbWwLyAPj5tsRCxE4RP9J3YMyRhvs2OEPgI6PzIoYYlEkedoyrbP/
	hHpRSdZtmL6xu+BqxIqSNDLt1a5RR/tTo3DJYBhScZFs5UTZZtHCO/Z7gv7iCyHFZH5OogOkD1F
	hTStKtpeGjDIaN1aHBTPpDjHSGai71ZmE3OYu4kA==
X-Gm-Gg: AY/fxX7IQoLRJMSGaJPFFz7SDpvywq5taZ4ZOIRW8GR8roiPMkucam8/ztntz5yLtIB
	NaDkViIzsYoHGs9gA3VQUu42n9+jvBwXRvQAXBdags0ymOz50uEB9Ov4ZAnSTYSYgLUUqSeH7Hv
	7OFM8D3Fo4W+BfEjw5GuvrTUBkeNuf/yXBji2O3RssGXoPjxLpnIEaidMfkqplG4I5J5w=
X-Received: by 2002:a05:693c:2115:b0:2ac:2c08:9017 with SMTP id 5a478bee46e88-2b17d295122mr660830eec.28.1767760834551;
        Tue, 06 Jan 2026 20:40:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGAU9mxo+7y2WCSdMKCiZtRl9JqW9ZZN1VPEcUPFg/XBbcP4rL90ff8McNYLfEgQvQBorjMCUmiBYbE6C6wdcw=
X-Received: by 2002:a05:693c:2115:b0:2ac:2c08:9017 with SMTP id
 5a478bee46e88-2b17d295122mr660808eec.28.1767760833826; Tue, 06 Jan 2026
 20:40:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260105050724.2041581-1-udipto.goswami@oss.qualcomm.com>
 <9101e538-022a-4802-8bec-891c14b221a9@rowland.harvard.edu>
 <CAMTwNXAECok2-4yO8sPtNgGE6u+qLALRSUnsbOfC7XfGKTJn0w@mail.gmail.com> <a9281a6c-0315-4657-b14c-ab68fc85fc40@rowland.harvard.edu>
In-Reply-To: <a9281a6c-0315-4657-b14c-ab68fc85fc40@rowland.harvard.edu>
From: Udipto Goswami <udipto.goswami@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 10:10:22 +0530
X-Gm-Features: AQt7F2pCpfeL3imfLoqj0xqZQKaASRLMlVYYBOBEI2Sq65QNyKkuu177Vz9uh0Y
Message-ID: <CAMTwNXAY5UEm6FEF=xD2m2s9PBOiLE-Btgii-L3kqiuiKbj2Tg@mail.gmail.com>
Subject: Re: [RFC PATCH] usb: gadget: uvc: Prevent smmu fault in unstopped
 stream uvc teardown
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Frederic Weisbecker <frederic@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDAzNSBTYWx0ZWRfX4CdUqOi2tufb
 7f/DRbvyMID9R4ri5aCW35BBWjc8Jp9jwaR1ecBLD2JO32ahAzUKfembUfbeAPk2RZeUG27AMCz
 8Xcqo4b9x4TjUYvM1iJVy/BWU1uFBF4bZMl1suoCGOZhCt2TOunWk8RFVbXAseltp3lWIGdyg+Y
 7Gax9u4CehBRQt2unn0a/TCn4AOAfD6UXRsLm1T6l9xs9sBSfqoZpluBIQwCGdgBrAPOKs4LM/u
 MgGRlshdudGeRXFGlnckBRyR8KON57OmBwELLtyDyb7iz3lmWB2h2UBBXgEj33OmRL2c7L/bd6F
 d4OnIYOJUgsW8vZMeCVUQFfUS3FyVD67z2qpp0vfLQ4wBt1ftvuVqxosWsccGesw9FtoeEVsFZI
 fFWVdiIKdwEYLgPuhF8kgX86iLOFoSB+oj1yzoxtMLNvcYkYSRx+Wfh3GA3/fE0TbMep3PKtBya
 jkitXGrVRJigIaTvAUw==
X-Authority-Analysis: v=2.4 cv=YqIChoYX c=1 sm=1 tr=0 ts=695de3c3 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=ApgsFdkGLsBOycoqR00A:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: o85lQO1IRz5S1i9FrpU8qIbSmMZjIx2H
X-Proofpoint-ORIG-GUID: o85lQO1IRz5S1i9FrpU8qIbSmMZjIx2H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070035

On Tue, Jan 6, 2026 at 10:23=E2=80=AFPM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> On Tue, Jan 06, 2026 at 04:13:21PM +0530, Udipto Goswami wrote:
> > On Mon, Jan 5, 2026 at 9:25=E2=80=AFPM Alan Stern <stern@rowland.harvar=
d.edu> wrote:
> > >
> > > On Mon, Jan 05, 2026 at 10:37:24AM +0530, Udipto Goswami wrote:
> > > > When switching USB compositions while the camera is streaming, an S=
MMU
> > > > fault can occur because dwc3_remove_requests() unmaps buffers via
> > > > dwc3_gadget_giveback() while the controller hardware is still perfo=
rming
> > > > DMA operations on subsequent requests in the started_list.
> > > >
> > > > Fix this by adding a delay in uvc_video_complete() when handling th=
e first
> > > > -ESHUTDOWN event  (detected by checking !UVC_QUEUE_DISCONNECTED) to=
 allow
> > > > the controller to  complete in-flight DMA and drain its FIFO before
> > > > dwc3_remove_requests()  proceeds to unmap remaining buffers,
> > > > preventing the SMMU translation fault.
> > >
> > > Wouldn't it be better to wait for the in-flight URBs to complete, so
> > > that you _know_ the controller is finished with them, instead of
> > > delaying for some arbitrary and possibly too-short amount of time?
> > >
> > > Also, wouldn't it be better to avoid calling mdelay() while in interr=
upt
> > > or atomic context?
> > >
> > > Alan Stern
> >
> > Hi Alan,
> > True, but i think we wouldn't know for ISOC eps whether the TRB got
> > completed or not since CMDIOC isn't set for these,
>
> Look, you know a lot more about what's going on here than I do.
> Describing the details to me won't help because I hardly understand
> anything about how these drivers work to begin with.  I'm just trying to
> prevent you from applying a bad fix.
Hi Alan,
I understand, thanks for the review.
>
> Start by asking where the real problem begins.  Is the problem caused by
> the uvc driver skipping a step?  Or is there a bug in dwc3?  Either way,
> the problem should be cured at its source, not by adding some arbitrary
> delay later on.
I agree with you,
we started seeing this  when we tried switching for uvc,adb to mtp,adb
when stream off not done.
This is the starting point of our failure.


>
> > We also tried to address the same from the gadget.c dwc3_send_gadget_ep=
_cmd()
> > Something like this:
> >
> > - if (DWC3_DEPCMD_CMD(cmd) =3D=3D DWC3_DEPCMD_ENDTRANSFER &&
> >
> > -   !(cmd & DWC3_DEPCMD_CMDIOC))
> > - mdelay(1);
> > + if (DWC3_DEPCMD_CMD(cmd) =3D=3D DWC3_DEPCMD_ENDTRANSFER &&
> > +   !(cmd & DWC3_DEPCMD_CMDIOC)){
> > +   if(usb_endpoint_xfer_isoc(desc))
> > + mdelay(10);
> > + else
> > + mdelay(1);
> > + }
> > But this didn't help mitigate it.
>
> Again, the details mean nothing to me.  But delays are always
> suspicious, especially when there's no indication of how the delay's
> length was chosen.
got it.
>
> > mdelay is busy wait (without sleep) so I thought it should be fine,
> > but yah if you see any risk with this I can try removing these.
>
> It's okay in the sense that mdelay in interrupt or atomic context won't
> crash the kernel (whereas msleep() would), but it's still a bad idea
> unless it's totally unavoidable.  A delay causes the kernel to waste
> time when it could be busy doing something else -- not a good thing to
> do.  And if you really have no other choice, you should make sure that
> the delay is as short as possible -- say, no more than one or two
> milliseconds.  A 10-ms delay is pretty much unacceptable.
understood.
>
> > Moreover our problem here is no one from the userspace or the upper
> > layer called a streamoff which is why the requests are still in
> > flight.
>
> Then maybe the upper layer should be changed so that it does call
> streamoff?  While I'm not familiar with any of the details, it seems
> clear that an upper layer should tell a lower layer when it has finished
> using some resource that the lower layer provides.

Yah I think I can try to explore this option where we force streamoff.
>
> > We do not see this issue if a disconnect had been performed while in
> > flight, it seems there is a different approach which disconnect takes
> > to handle this.
>
> Probably a disconnect causes the transfer to be cancelled immediately
> rather than waiting around for it to finish by itself.
let me get these details on what happens when composition switches and
disconnects.
Thanks for the suggestion above, let me try that out with streamoff.

Thanks,
-Udipto

