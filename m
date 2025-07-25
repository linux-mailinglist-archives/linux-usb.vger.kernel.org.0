Return-Path: <linux-usb+bounces-26174-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A69B11F04
	for <lists+linux-usb@lfdr.de>; Fri, 25 Jul 2025 14:49:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8E623ADFF6
	for <lists+linux-usb@lfdr.de>; Fri, 25 Jul 2025 12:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73CE12ECD2A;
	Fri, 25 Jul 2025 12:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ABPYm67S"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC3F274FC8
	for <linux-usb@vger.kernel.org>; Fri, 25 Jul 2025 12:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753447779; cv=none; b=IATb8yj+C9MoLtslPlOebPTxX6i3Gc4NjYrzlEjWMUvjOnBrtOKQHBXOoWFZYk2Q//L5ACmWw1KqH/84oHHcrYt4tex4Eeh+z7RyuuunbuC5p2P0hrJxiDzlHf7LKrmzTabeRKwne3M1q1Ok2ChgKSAPpSJICylpiFqLIBd2ccQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753447779; c=relaxed/simple;
	bh=xYpnLtBmmYFoV2Wf0O8DUo26fff34+DluhVeQud508o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l+9pch7TD9v1iFYWQRgZWDuCgAaKTyNt+dOoK527+qmFzJV1PrQHnLpNJQY1006dBJ3kmUq4EJ9zDh5i89y1J3/8bq32TybMYY44XiQC/5kktbYlrswy4pgNhDDx+7r7e4ZDw0Ohpc7afj6I8k1xhzonjj3kiHTdHRDWDUoxExo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ABPYm67S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56P91Lgl004371
	for <linux-usb@vger.kernel.org>; Fri, 25 Jul 2025 12:49:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ktB9Clt7XUZb4vphTZxcSmXCe8grqlTXO7tGnfUfWKA=; b=ABPYm67SexCdXRE7
	rcMnk/on0toglwEoaYQKB198Ypn89/FV8NC945mpZLg47U/m3vFEIhmwQm16SrcN
	lPf4nBQ0qGIWkPZiLoO8WTB6+V90LSfOgD1I0ftRePM3lW/KFJdrfgqlPy+FmG4y
	yZaFV8afFWKkOXqsXdn9SZ4UUVXLR1+REpRL8gPD+oBvE4g9OvUdr/D9vHuA/rhK
	tv37xQQGdloIw70oko1Co3P51ZjLS6S4cOMTcmipMdxmITsNoDArGztfbj8F8UyK
	TO1NkwNg8m6Mtadzc5i3TKPydl6xk1VtS49qxFPtbp9RGjuNWa+NF4yj3UoWHu+l
	vsERoA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w2kt55q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 25 Jul 2025 12:49:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e269587d8eso389996885a.3
        for <linux-usb@vger.kernel.org>; Fri, 25 Jul 2025 05:49:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753447773; x=1754052573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ktB9Clt7XUZb4vphTZxcSmXCe8grqlTXO7tGnfUfWKA=;
        b=dYDQJXLFRnkYdUKh3Zja1ydVnidld9K/mUC2Q4UjUVNH7IYqKV4O8UnNgRqf11OpjO
         BjVAachij9uMmX3uBV75lWJ+iamjoVOgfMIczhK8rIarXKBLUMO4JI1AivocKTNvlNZc
         EvWKyIe5NycjPHXaeFrlhENGZM96l9e8UQdYTPqflEcCSU8/k7Y25CeYWGdPYkwgRdq/
         EP3QchwIQxIQnhcF6szzKTm6/LJIjLfpDJOdC6HBW904i7OUfRv14jvAZUFg2rY0AB34
         qoYlHG6xu9/5ivZsLJjHyBqVPrR0jEarRdEi2Umf8f34mM76q/YHNiTPXbWS81g4TMcB
         ++Ew==
X-Forwarded-Encrypted: i=1; AJvYcCUheALvsFceXMa4z/pEORVqBYM4r55s6e7359ho0aongUlqoPQHIQ5AXPhfCAtrtva9m0DwpDcNlKA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkA/8NAkZke2FjSx5o5a2GbZZGFyOFHbVQAsHLvGazgB5kfHQK
	qOuq721L8j10+NCxRbNqSmtMBTFHz84Oiqtr21xdLqAlqUWD5S601Suh/isVzHT6NbaEnyEIEbL
	n4yEXoIAliV+Hcl35SHgabjYsjEqfz4XCs98J4jyFO2LQVUIwWo42fKLbG0URtw6nylEd4ho93d
	Pl0UIeyfe9oaVf38U2VQZu0VOtBut2fPDtliu7qg==
X-Gm-Gg: ASbGnctIshxJ7kO9nm7aY4Eux/2tOzu7nR58SsFNyLViBYOi4S33YD0GFSymBN7uojS
	1HGZA1CrONypqx0KTE56W0LIMeOTIhucBOKrtnadffDw6zf46SBzGu3dyfwjz6i4/abWw2WEl5C
	RilODlJ/iXCux74k6d3PafNg==
X-Received: by 2002:a05:620a:390f:b0:7d0:9782:9b05 with SMTP id af79cd13be357-7e63bf95349mr242089485a.25.1753447773408;
        Fri, 25 Jul 2025 05:49:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3B3Slxw3dmstEGvQ2lqJWGYuHcRhehYoPFna2fVt6rcGfPvfJfwPkWozxxa+WwxMVWoB4203Tnjs2zKJO99o=
X-Received: by 2002:a05:620a:390f:b0:7d0:9782:9b05 with SMTP id
 af79cd13be357-7e63bf95349mr242084785a.25.1753447772817; Fri, 25 Jul 2025
 05:49:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250722-eud_mode_manager_secure_access-v7-1-40e9a4569895@oss.qualcomm.com>
 <2025072446-ensnare-hardhead-12f5@gregkh>
In-Reply-To: <2025072446-ensnare-hardhead-12f5@gregkh>
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Fri, 25 Jul 2025 18:19:21 +0530
X-Gm-Features: Ac12FXxPQD_LsGbXmGNASbWosoLHJRg9wgIWhieGk75R8qev9bW7u1QVAGGMa3c
Message-ID: <CAPHGfUMnaJ8HPX=CC_q6m2nbq-ODP=MY_NkcvHjXR8mD9b=tBQ@mail.gmail.com>
Subject: Re: [PATCH v7] usb: misc: qcom_eud: Access EUD_MODE_MANAGER2 through
 secure calls
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Souradeep Chowdhury <quic_schowdhu@quicinc.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Melody Olvera <quic_molvera@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: pqWiLk3sFJez-K769sLeeSVFIgWdbZV1
X-Proofpoint-ORIG-GUID: pqWiLk3sFJez-K769sLeeSVFIgWdbZV1
X-Authority-Analysis: v=2.4 cv=QNtoRhLL c=1 sm=1 tr=0 ts=68837d5e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=ag1SF4gXAAAA:8
 a=PQXWc0QCHC5KbQU7H1QA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=TjNXssC_j7lpFel5tvFf:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDEwOSBTYWx0ZWRfX2CiBiRtEoxYf
 bIag+5prCKqkWFUIDbRdTbplMBT+x47uM7gBLQHz5DfrAipzIQofVU/wHeBz1mC34cBhXWKM29b
 WraIrf3HnBbVIqOo0S/2HfBUR9Vde5FQlYK/1PgI9DCbFbJ4TO2SemBd6UqLNGtNBQzzsgqXw/t
 KrsJJMCIAw5JYmeEyN/BaKOQOSxlOkCMRCm50CrQLr8EwkjRH1pkNtKgQu2ljgPxv6tOOv7nA8D
 ARKfuBUGaP/obDbiBXRLakOVFMM2SZqqrSAqUIVuafoIpfEdmDVx9VtK2ZxXked45gLtK2hPTKa
 YO35IR01YHlarxExgprJG+hiHkkImAjag4m9nCBF2frFquu1W1wg/d0g7WduDkLSMXZaKZqzROe
 wOIC9gWUN1QqTKQv+qym2Zivj0M/Y2bhP8tAw51ypueouh52EdpXhuICQFhV7q58AghAEF55
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 suspectscore=0
 spamscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507250109

On Thu, Jul 24, 2025 at 3:06=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Jul 22, 2025 at 05:01:53PM +0530, Komal Bajaj wrote:
> > EUD_MODE_MANAGER2 register is mapped to a memory region that is marked
> > as read-only for operating system running at EL1, enforcing access
> > restrictions that prohibit direct memory-mapped writes via writel().
> >
> > Attempts to write to this region from HLOS can result in silent failure=
s
> > or memory access violations, particularly when toggling EUD (Embedded
> > USB Debugger) state. To ensure secure register access, modify the drive=
r
> > to use qcom_scm_io_writel(), which routes the write operation to Qualco=
mm
> > Secure Channel Monitor (SCM). SCM has the necessary permissions to acce=
ss
> > protected memory regions, enabling reliable control over EUD state.
> >
> > SC7280, the only user of EUD is also affected, indicating that this cou=
ld
> > never have worked on a properly fused device.
> >
> > Fixes: 9a1bf58ccd44 ("usb: misc: eud: Add driver support for Embedded U=
SB Debugger(EUD)")
> > Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> > Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > ---
> > Changes in v7:
> > - Updated the commit message as per Greg's comment
> > - Link to v6: https://lore.kernel.org/r/20250721-eud_mode_manager_secur=
e_access-v6-1-fe603325ac04@oss.qualcomm.com
> >
> > Changes in v6:
> > - Propagating the error code from disable_eud(), per Dmitry's suggestio=
n
> > - Link to v5: https://lore.kernel.org/r/20250715-eud_mode_manager_secur=
e_access-v5-1-e769be308d4a@oss.qualcomm.com
> >
> > usb: misc: qcom_eud: Access EUD_MODE_MANAGER2 through secure calls
> >
> > Changes in v5:
> > * Changed select QCOM_SCM to depends on QCOM_SCM in Kconfig per Greg's =
review
> > * Link to v4: https://lore.kernel.org/all/20250709065533.25724-1-komal.=
bajaj@oss.qualcomm.com/
> >
> > Changes in v4:
> > * Added error logging in disable_eud() for SCM write failures, per Konr=
ad=E2=80=99s suggestion
> > * Link to v3: https://lore.kernel.org/all/20250708085208.19089-1-komal.=
bajaj@oss.qualcomm.com/
> >
> > Changes in v3:
> > * Moved secure write before normal writes
> > * Added error checking in disable_eud()
> > * Use ENOMEM error code if platform_get_resource() fails
> > * Select QCOM_SCM driver if USB_QCOM_EUD is enabled
> > * Link to v2: https://lore.kernel.org/all/20250627125131.27606-1-komal.=
bajaj@oss.qualcomm.com/
> >
> > Changes in v2:
> > * Drop separate compatible to be added for secure eud
> > * Use secure call to access EUD mode manager register
> > * Link to v1: https://lore.kernel.org/all/20240807183205.803847-1-quic_=
molvera@quicinc.com/
> > ---
> >  drivers/usb/misc/Kconfig    |  1 +
> >  drivers/usb/misc/qcom_eud.c | 33 ++++++++++++++++++++++++---------
> >  2 files changed, 25 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/usb/misc/Kconfig b/drivers/usb/misc/Kconfig
> > index 6497c4e81e951a14201ad965dadc29f9888f8254..73ebd3257625e4567f33636=
cdfd756344b9ed4e7 100644
> > --- a/drivers/usb/misc/Kconfig
> > +++ b/drivers/usb/misc/Kconfig
> > @@ -147,6 +147,7 @@ config USB_APPLEDISPLAY
> >  config USB_QCOM_EUD
> >       tristate "QCOM Embedded USB Debugger(EUD) Driver"
> >       depends on ARCH_QCOM || COMPILE_TEST
> > +     depends on QCOM_SCM
>
> You now are preventing this code from ever being able to be built in any
> testing systems, including mine, so I don't even know if this patch
> builds or not.
>
> You did not even document this in the changelog :(

QCOM_SCM is essential for QCOM_EUD for its functionality.
One option I'm considering is using select QCOM_SCM, which ensures
dependency is enabled when QCOM_EUD is selected. QCOM_SCM facilitates
communication with secure world, this approach should not cause issues even
when COMPILE_TEST is enabled on non-ARCH_QCOM platforms.

Alternatively, I could use a conditional depends expression like:
depends on (ARCH_QCOM && QCOM_SCM) || COMPILE_TEST

This would allow the driver to be built under COMPILE_TEST while ensuring
QCOM_SCM is present on actual QCOM platforms. However, this would
require proper stubbing in the qcom_scm driver to avoid build failures duri=
ng
compile testing.

Thanks
Komal

>
> {sigh}
>
> greg k-h

