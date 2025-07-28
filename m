Return-Path: <linux-usb+bounces-26234-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEA1B138D0
	for <lists+linux-usb@lfdr.de>; Mon, 28 Jul 2025 12:20:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C05707AA620
	for <lists+linux-usb@lfdr.de>; Mon, 28 Jul 2025 10:19:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99A8325DB13;
	Mon, 28 Jul 2025 10:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AlawJk5M"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3230D25CC62
	for <linux-usb@vger.kernel.org>; Mon, 28 Jul 2025 10:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753697959; cv=none; b=PTy4gWNcX2IzqcLvVJbdyDXuc18qC9b0BbhneyUjxmqRzFmExnrhzkclzK2+aesIZoH38LW/mzIJazflRx2Kpr3csEJI7DQpICdCDsa8E46fDrkM5m3lQuf9eRsiFXlMTOPtRM1gD0OHMui7dvgI8ijxBYUIDy1Ro3VflKQrjTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753697959; c=relaxed/simple;
	bh=yNigUOA6pm0FmhyE2Az3PHx7BLDsPG5gveHCt4RTApI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KF6otqnhkEmO+8VG0j3fhiVZg3M7gpvI4UPMmeHCQ8CCbzV5k78LO8BptoD2A3ujuBxqqnGF6WVGHeSxLt52fMvFxYcBvOkN9EQ7u6+7PfLMvnTYIXyJfLsc88+ag8MiU/p+NksPNcV2ZnkjGhcXgSl+nozK+yUbKV61sGGuMH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AlawJk5M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56S4rJYt013104
	for <linux-usb@vger.kernel.org>; Mon, 28 Jul 2025 10:19:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qCAkqzNEArjyO8l+IqYZDgX3WVmNl4Qdxh+2kVLmr9k=; b=AlawJk5Mey8lU8ri
	JZYTT+2E88oP4S9b1Ad//c8Q2a/3gFsfVJzWsyA2Hh+KBMcfUu6YsfagdhzrY4Tf
	5qje1wJjl0b4PjzsdyXzdd6qAuZa3ga9+SX8K0iBzCvfMjVgpVrij7TgQ8wei3eU
	FgQX/QegXtaJMV073dzA2cD1Jge1fUbhXi/D0fy94JPgDxBJORpXzf0z7aIJtHn9
	0EOimrYZluoHNl/cdSV53kb7oTH7o2zw2+0bri6hbphgwnJY891nCP2dCXmUNWa1
	+7X6NlkrkZ97Yk2ZXOuUsbc1iO+OFQtIIH8bACv3Ig+zzXqrGBKLexpJqAOy2oTU
	IRfBcg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484q85v95y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 28 Jul 2025 10:19:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ab69fff4deso63440951cf.3
        for <linux-usb@vger.kernel.org>; Mon, 28 Jul 2025 03:19:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753697955; x=1754302755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qCAkqzNEArjyO8l+IqYZDgX3WVmNl4Qdxh+2kVLmr9k=;
        b=AdZr3GDzuXbox2vVRN4hPxd4UEqdFDuyixBreaEgC/isZu77bpiOjbIyz578KdTEc0
         hul3co4SfOIVbp0ilMUybANCstcIcfXj0kVVIzoeiKRARZwetbFCT4VqZomuhRoOsZlq
         bOv7Vz5IXPkzbzjT9tDQj3WvwXiwQsh0hNGB3bzatKqZvTEEUdpC2P9SeaEwMxqd3DqM
         1CXGITr1kLhfyU9qYIvJ8IqTGrC5OzjvtgfpxIGhlSIIuFgoTtFWclDLvQjZ8iylo8ht
         Z2x5qtxgpUMy7s9gmFLF1bfoniDd9z2vvSqfNze97wEEJ2Vl5wLYVKb+S05NFKLKM1Yu
         qQGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeionvxk1T6922UQgppG6NOrP6aZJikc9UGyzJXP1l6URQgjq4X5tPa5KndVHpdwF0bzwC30FA1ds=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnCmVE7biJ/8frNM10Bt0nGofJkr1kfnJuZytXx90wQeGQblLn
	rBYR9xeux+36z8egy/PuccKWnGjMNTV1IX/8D946/QVVQwsUrjJgmWVe3xN8RP7g1ixqEcOuE0u
	ivW2yBmMKPp45DAIER+aSORBhjpa1kzzB2XZsGzeAF+8RHJX+T1jpI/6qbxTBa1WY7iwaYW93HA
	y/La5f5O4+BifY6a5ygICKEGJW5gB0yiismemQHg==
X-Gm-Gg: ASbGncvGf3SaQUDj60j0S/HMKlcHBdBW45BJbroma3rcSzUdzBqylC0QzrVPTPdKE7Y
	Z/0yVEs1KXrTTFp9RMk1De2tbV9Rai0foD+6EHzaDSbH9d/KMzcUEKIxbia1r8W/Wi3CEmD97si
	B4vD5Oidlh5l5Fdvhf5c+5vHA=
X-Received: by 2002:ac8:5754:0:b0:4ab:6eef:315b with SMTP id d75a77b69052e-4ae8ef7e1cdmr169957091cf.23.1753697954846;
        Mon, 28 Jul 2025 03:19:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEN78DW4LBZE0r/NJmIp1+Eb4u/HsFKHPIwJ9DwJxNeoCH8vSbe82y+ipojmokYnEObzitbh04M93nPQwuZL3M=
X-Received: by 2002:ac8:5754:0:b0:4ab:6eef:315b with SMTP id
 d75a77b69052e-4ae8ef7e1cdmr169956831cf.23.1753697954376; Mon, 28 Jul 2025
 03:19:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250722-eud_mode_manager_secure_access-v7-1-40e9a4569895@oss.qualcomm.com>
 <2025072446-ensnare-hardhead-12f5@gregkh> <CAPHGfUMnaJ8HPX=CC_q6m2nbq-ODP=MY_NkcvHjXR8mD9b=tBQ@mail.gmail.com>
 <fo4hek5twtgl7fa5ncqefatowz5nw64iwifaibl3yyzonucpqz@uwwxf5jdke2x>
In-Reply-To: <fo4hek5twtgl7fa5ncqefatowz5nw64iwifaibl3yyzonucpqz@uwwxf5jdke2x>
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 28 Jul 2025 15:49:03 +0530
X-Gm-Features: Ac12FXzcjMs3ledjXLB2bivgGjtbaYbhCNNmEJxWDSmTRQHXrmyOKExQyuTlQ6Q
Message-ID: <CAPHGfUOusGDDumM81ZwfWCT+4H6ku2rTgYw4Wuz3KduZ96KhXg@mail.gmail.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDA3NCBTYWx0ZWRfX6wUVXMDJ8R4m
 RGHkcScLeAr5JkeT94z9yybOyoWfFSE+KmOJd+VQG1pAdnpxr4NniSq/xZ9KCpXMIeaPxndSSwy
 uogD6jq424Hc7uZq7+k8XWmTLPhOx2xrx/EB/4VY7AxX8ncUrpAM/v2lzlx5Zi/WUJe3cXmh4Bx
 OQLtjlszrUHIRwD/nDtg+WP6eJOS32V5McfLErOms0hLdBtbsWsfhh95MjV0BRhd07QbcYkZ0PQ
 apkk4jM3L8PaRWdFhGCFVUVdzSV1ghR6+knP6bLFjV58E6PsEZ+U9jc/er0wu6QwldUe1I0dswi
 lDutsuACJYwyKQ+IhIlHxxbPU/sk1vlV4M8z5hdENXZbXmPLriNdadzpeXNYtBBnx4MhoRiJKad
 7GzQ+t6AyrJdu5xva/WDRoUU7Io3e337zJY9FMvi0unmyOzYNkp00hQmFbml46UCqT10iKIX
X-Authority-Analysis: v=2.4 cv=TqLmhCXh c=1 sm=1 tr=0 ts=68874ea4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=ag1SF4gXAAAA:8 a=COk6AnOGAAAA:8 a=qPzGZKhM6qUPuxfXCfQA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=Yupwre4RP9_Eg_Bd0iYG:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: lMp5ZBTmRXZm0gKwB8pl1aDYdZXoj71y
X-Proofpoint-GUID: lMp5ZBTmRXZm0gKwB8pl1aDYdZXoj71y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 mlxlogscore=862 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507280074

On Fri, Jul 25, 2025 at 7:07=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Fri, Jul 25, 2025 at 06:19:21PM +0530, Komal Bajaj wrote:
> > On Thu, Jul 24, 2025 at 3:06=E2=80=AFPM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Tue, Jul 22, 2025 at 05:01:53PM +0530, Komal Bajaj wrote:
> > > > EUD_MODE_MANAGER2 register is mapped to a memory region that is mar=
ked
> > > > as read-only for operating system running at EL1, enforcing access
> > > > restrictions that prohibit direct memory-mapped writes via writel()=
.
> > > >
> > > > Attempts to write to this region from HLOS can result in silent fai=
lures
> > > > or memory access violations, particularly when toggling EUD (Embedd=
ed
> > > > USB Debugger) state. To ensure secure register access, modify the d=
river
> > > > to use qcom_scm_io_writel(), which routes the write operation to Qu=
alcomm
> > > > Secure Channel Monitor (SCM). SCM has the necessary permissions to =
access
> > > > protected memory regions, enabling reliable control over EUD state.
> > > >
> > > > SC7280, the only user of EUD is also affected, indicating that this=
 could
> > > > never have worked on a properly fused device.
> > > >
> > > > Fixes: 9a1bf58ccd44 ("usb: misc: eud: Add driver support for Embedd=
ed USB Debugger(EUD)")
> > > > Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> > > > Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> > > > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> [...]
>
> > > > diff --git a/drivers/usb/misc/Kconfig b/drivers/usb/misc/Kconfig
> > > > index 6497c4e81e951a14201ad965dadc29f9888f8254..73ebd3257625e4567f3=
3636cdfd756344b9ed4e7 100644
> > > > --- a/drivers/usb/misc/Kconfig
> > > > +++ b/drivers/usb/misc/Kconfig
> > > > @@ -147,6 +147,7 @@ config USB_APPLEDISPLAY
> > > >  config USB_QCOM_EUD
> > > >       tristate "QCOM Embedded USB Debugger(EUD) Driver"
> > > >       depends on ARCH_QCOM || COMPILE_TEST
> > > > +     depends on QCOM_SCM
> > >
> > > You now are preventing this code from ever being able to be built in =
any
> > > testing systems, including mine, so I don't even know if this patch
> > > builds or not.
> > >
> > > You did not even document this in the changelog :(
> >
> > QCOM_SCM is essential for QCOM_EUD for its functionality.
> > One option I'm considering is using select QCOM_SCM, which ensures
> > dependency is enabled when QCOM_EUD is selected. QCOM_SCM facilitates
> > communication with secure world, this approach should not cause issues =
even
> > when COMPILE_TEST is enabled on non-ARCH_QCOM platforms.
>
> QCOM_SCM is not user-selectable, to it is not correct to depend on it.
> Have you had used `git grep`, you'd have seen that absolute majority of
> the drivers uses `select QCOM_SCM`.

I had initially used select QCOM_SCM in an earlier patch, but based on
the concern
raised about enabling it under COMPILE_TEST on non-ARCH_QCOM platforms,
I revised it to use a depends on condition.

>
> > Alternatively, I could use a conditional depends expression like:
> > depends on (ARCH_QCOM && QCOM_SCM) || COMPILE_TEST
> >
> > This would allow the driver to be built under COMPILE_TEST while ensuri=
ng
> > QCOM_SCM is present on actual QCOM platforms. However, this would
> > require proper stubbing in the qcom_scm driver to avoid build failures =
during
> > compile testing.
>
> --
> With best wishes
> Dmitry

