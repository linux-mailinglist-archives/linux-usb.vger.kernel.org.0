Return-Path: <linux-usb+bounces-26276-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F841B15F84
	for <lists+linux-usb@lfdr.de>; Wed, 30 Jul 2025 13:33:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E7A65655D9
	for <lists+linux-usb@lfdr.de>; Wed, 30 Jul 2025 11:33:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 627D6293454;
	Wed, 30 Jul 2025 11:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EY0p8jSE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C36286416
	for <linux-usb@vger.kernel.org>; Wed, 30 Jul 2025 11:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753875177; cv=none; b=dKzjpA12uIU/3n6p8CYHQpT6CDYons8iXgEh5RwIilo+OkYYGyZl88V4N6g5lODlR6/l8vQIvowXsfDflZUFJiSXwTvTswm7uY0pcSzAkB2i18ADc+/sy9iwQDS822KvIcT8pl/mUFSrZPLbBGGbEw1GnZlcoc00OO3k2rofmaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753875177; c=relaxed/simple;
	bh=sA7CIKx9JtzmSMrlgZzAhDloWbQe41uj2nnOzD3lqC8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EvL97CQVAQ503xSzQ8OFTylCwGXOuR55bb74UkmhMg5PFnPUC628eitS34Os+A9icWtxR0f0X/x0tOTBtfIHATC61YG8lv1WrwWfBba/+S7yn9jzxUPQapMBAg0AZbv+TPVxgRZWt0iMu9/gwo4yK6+dV6AfdYU/S2aFPf0aC1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EY0p8jSE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56U479uu001568
	for <linux-usb@vger.kernel.org>; Wed, 30 Jul 2025 11:32:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QhSrLEfIXPGfZv83U+5DPeP/WgOAi6APpH7KJyBiwWM=; b=EY0p8jSEYUHt0xEM
	wT38sEMWwjirgHXIcobjApSZx0a1+N1tbZLT2A7ZKcSsI3yycqXLqVo1jLGTYjaX
	U7z1diKt688I3Q+7cKg7rrNBI8D5mQyqnG2KdqPz8aVYhX2XxQ0MJAqmbnwwE3i1
	alAfby0KBdYUN8kFRdhFeE2h8k9bkRatBrV8w9oibskcVFYaUquQ1Dl/lwr4rvrO
	UKwzWruk9hfsht3/eR2m0mUV3MMTQLLLikYdTSDMkkR29+W3QKbNm87RRMmA1xK6
	iFzzP2dTjORcAlDGygQrEln02qk9QJb+5kFRX0Hp41MCGH6zC6Q9El8wm6HhkQVR
	NjMyzQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pm2kfbx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 30 Jul 2025 11:32:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ab969af6e3so82085511cf.2
        for <linux-usb@vger.kernel.org>; Wed, 30 Jul 2025 04:32:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753875115; x=1754479915;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QhSrLEfIXPGfZv83U+5DPeP/WgOAi6APpH7KJyBiwWM=;
        b=pMPSfXqS+8gvfeapsUD07soz48TFHVwDHTszjXle5O4LFfe8KNYDQRp4HZ/0i8ANUc
         /2zva5woIp7oXQZDulZmb3pXp3w/borp5PcBp5FzI03zuhdVKI+2JShD7htxdB6oLT8c
         O53A08zxV8e23tG+tdR3IyHl4oxCmPdZiG1FKULVB0JoZtak/8sbm/6UOR0iKGv20Iok
         Y/XBW4ccF00q9LM9J6V7fiCLlSWXmBBBhQ5vfGHFPHL7HPaJFNjq67T5OR89bD67ZsGF
         2Y/zh1oNSud5uLBDDVWufz5xJCo0ANAtpnQqD0/87qnZdoolkVU2+ilfyzrRgGCj5Zxr
         LrRg==
X-Forwarded-Encrypted: i=1; AJvYcCXa3yLrgCuudiNaJVRwSXNCpqfcWYR06/4WQbI2S94V67GhACQFMbESE9PEI/r+keOAAYQG/LWZYBI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLr8FLKlLAmPsgq5Z+mx4mFeqoJ5N+D9eAW51W9Q5+4okoSMsF
	2mB8cRXUIkfdg3lXqRaQgRqr/VC5RWRsOOZjrGJ0tsFiKul3TAnLLLHSqYmXW2LBh7yYysxWvbv
	v0RH5ILvqnybMty8xcRZBmKfaJojTsjbueqP9gkM1fXjPpGN2S8HsQlBrhUjPrBowv1+bcwd924
	s5mMKK5tiZbAPLaMXoeDrauogA3h41XCsrMqVeAg==
X-Gm-Gg: ASbGnctzHxgxux9e/903CkO/zIaZ2YssbzhFEVSqs7B/xNF/TLJYk1iANt/ono13F6r
	rdxboBEF9irGuu5cFwjUij5TcenuRFKdiXB8pAkYdR2wwPo0oxN9WassFGmAG5SfrB2r8OXm1O2
	aP5pgispVCoxfKaNYJoQWChRk=
X-Received: by 2002:a05:622a:48:b0:4a9:cff3:68a2 with SMTP id d75a77b69052e-4aedbc3c0dbmr45844391cf.37.1753875115158;
        Wed, 30 Jul 2025 04:31:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgI5SCKV8YtZM/zSBddSyK33G/A0zZdCkH+fwXiqzGFN+iNvRWAG/BAy5IoAavwJ1ONWgDHWYMIrONjqdvfzY=
X-Received: by 2002:a05:622a:48:b0:4a9:cff3:68a2 with SMTP id
 d75a77b69052e-4aedbc3c0dbmr45843831cf.37.1753875114586; Wed, 30 Jul 2025
 04:31:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250722-eud_mode_manager_secure_access-v7-1-40e9a4569895@oss.qualcomm.com>
 <2025072446-ensnare-hardhead-12f5@gregkh> <CAPHGfUMnaJ8HPX=CC_q6m2nbq-ODP=MY_NkcvHjXR8mD9b=tBQ@mail.gmail.com>
 <fo4hek5twtgl7fa5ncqefatowz5nw64iwifaibl3yyzonucpqz@uwwxf5jdke2x>
 <CAPHGfUOusGDDumM81ZwfWCT+4H6ku2rTgYw4Wuz3KduZ96KhXg@mail.gmail.com> <2ee9a4c7-f971-4b73-8c83-cbb26c7072fd@oss.qualcomm.com>
In-Reply-To: <2ee9a4c7-f971-4b73-8c83-cbb26c7072fd@oss.qualcomm.com>
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Wed, 30 Jul 2025 17:01:43 +0530
X-Gm-Features: Ac12FXzgLcQ2yizHuwssmnQfXHgYZ2NUuPDYJso_5m2s0XS8PzpGLEfywe7jhjE
Message-ID: <CAPHGfUMcuXNtGiTmEFi0BvFkc9CvC9JfX8SFVKDg0-qytC2KPA@mail.gmail.com>
Subject: Re: [PATCH v7] usb: misc: qcom_eud: Access EUD_MODE_MANAGER2 through
 secure calls
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Melody Olvera <quic_molvera@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: xCoQC1dx52Hg4f1hBfqFcKHNnG76Qjsa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA4MSBTYWx0ZWRfX/uMohIpa6WjI
 ma+WfrA8gg2fI7uTR49DucTiIwZ+wOLBT+JogPZQ9l7pmbmAR7K72uJIzoVf7BL5crjPN3sYVrP
 ITjOKrn4nwTABJ2biUGre5EqCkHxymezATDsbkbJ+si5ZXP9hpXm3coCcnHHnlDdlMkF22gpwce
 jt6nZtvvMJKepiWpHGGpQ06fS/DFctbhG/7zAynovlAidEs+pxxOBq4Z3NFdGVTyopX321z6ML8
 OU8+EU8gO9qhODh287JnOxdfKZKkZNdfdKlNEmyJWwjgMCb76IuJWCOXZ2A1K4ThBz81bgO5lkF
 FflaUU5JlKexLFdQZnJX7WYAF5x6n9WeiMQLe1TmEg0Z5kohTVhxII1u2RSC2jfKPKnacn9lDgs
 ySpPDu22+VX4HiyFRSiy+vou4NHZZJP4qdtG4C90D7yMp1Io+t0+FBrWqWPq/IicgO1ops6k
X-Authority-Analysis: v=2.4 cv=HfYUTjE8 c=1 sm=1 tr=0 ts=688a02e6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=ag1SF4gXAAAA:8 a=COk6AnOGAAAA:8 a=nCA0bClemygIX1r7OBYA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=Yupwre4RP9_Eg_Bd0iYG:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: xCoQC1dx52Hg4f1hBfqFcKHNnG76Qjsa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_04,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=893 phishscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507300081

On Mon, Jul 28, 2025 at 4:00=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On 28/07/2025 13:19, Komal Bajaj wrote:
> > On Fri, Jul 25, 2025 at 7:07=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >>
> >> On Fri, Jul 25, 2025 at 06:19:21PM +0530, Komal Bajaj wrote:
> >>> On Thu, Jul 24, 2025 at 3:06=E2=80=AFPM Greg Kroah-Hartman
> >>> <gregkh@linuxfoundation.org> wrote:
> >>>>
> >>>> On Tue, Jul 22, 2025 at 05:01:53PM +0530, Komal Bajaj wrote:
> >>>>> EUD_MODE_MANAGER2 register is mapped to a memory region that is mar=
ked
> >>>>> as read-only for operating system running at EL1, enforcing access
> >>>>> restrictions that prohibit direct memory-mapped writes via writel()=
.
> >>>>>
> >>>>> Attempts to write to this region from HLOS can result in silent fai=
lures
> >>>>> or memory access violations, particularly when toggling EUD (Embedd=
ed
> >>>>> USB Debugger) state. To ensure secure register access, modify the d=
river
> >>>>> to use qcom_scm_io_writel(), which routes the write operation to Qu=
alcomm
> >>>>> Secure Channel Monitor (SCM). SCM has the necessary permissions to =
access
> >>>>> protected memory regions, enabling reliable control over EUD state.
> >>>>>
> >>>>> SC7280, the only user of EUD is also affected, indicating that this=
 could
> >>>>> never have worked on a properly fused device.
> >>>>>
> >>>>> Fixes: 9a1bf58ccd44 ("usb: misc: eud: Add driver support for Embedd=
ed USB Debugger(EUD)")
> >>>>> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> >>>>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> >>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>
> >> [...]
> >>
> >>>>> diff --git a/drivers/usb/misc/Kconfig b/drivers/usb/misc/Kconfig
> >>>>> index 6497c4e81e951a14201ad965dadc29f9888f8254..73ebd3257625e4567f3=
3636cdfd756344b9ed4e7 100644
> >>>>> --- a/drivers/usb/misc/Kconfig
> >>>>> +++ b/drivers/usb/misc/Kconfig
> >>>>> @@ -147,6 +147,7 @@ config USB_APPLEDISPLAY
> >>>>>   config USB_QCOM_EUD
> >>>>>        tristate "QCOM Embedded USB Debugger(EUD) Driver"
> >>>>>        depends on ARCH_QCOM || COMPILE_TEST
> >>>>> +     depends on QCOM_SCM
> >>>>
> >>>> You now are preventing this code from ever being able to be built in=
 any
> >>>> testing systems, including mine, so I don't even know if this patch
> >>>> builds or not.
> >>>>
> >>>> You did not even document this in the changelog :(
> >>>
> >>> QCOM_SCM is essential for QCOM_EUD for its functionality.
> >>> One option I'm considering is using select QCOM_SCM, which ensures
> >>> dependency is enabled when QCOM_EUD is selected. QCOM_SCM facilitates
> >>> communication with secure world, this approach should not cause issue=
s even
> >>> when COMPILE_TEST is enabled on non-ARCH_QCOM platforms.
> >>
> >> QCOM_SCM is not user-selectable, to it is not correct to depend on it.
> >> Have you had used `git grep`, you'd have seen that absolute majority o=
f
> >> the drivers uses `select QCOM_SCM`.
> >
> > I had initially used select QCOM_SCM in an earlier patch, but based on
> > the concern
> > raised about enabling it under COMPILE_TEST on non-ARCH_QCOM platforms,
> > I revised it to use a depends on condition.
>
> QCOM_SCM can be selected on non-QCOM platforms, so there should be no
> concerns for that.

Understood. I will update the next patch to use select QCOM_SCM accordingly=
.

Thanks
Komal

>
> >
> >>
> >>> Alternatively, I could use a conditional depends expression like:
> >>> depends on (ARCH_QCOM && QCOM_SCM) || COMPILE_TEST
> >>>
> >>> This would allow the driver to be built under COMPILE_TEST while ensu=
ring
> >>> QCOM_SCM is present on actual QCOM platforms. However, this would
> >>> require proper stubbing in the qcom_scm driver to avoid build failure=
s during
> >>> compile testing.
> >>
> >> --
> >> With best wishes
> >> Dmitry
>
>
> --
> With best wishes
> Dmitry

