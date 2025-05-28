Return-Path: <linux-usb+bounces-24370-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EC19BAC6F8F
	for <lists+linux-usb@lfdr.de>; Wed, 28 May 2025 19:42:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A7FD188D024
	for <lists+linux-usb@lfdr.de>; Wed, 28 May 2025 17:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A415F28DF52;
	Wed, 28 May 2025 17:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LwSquHgZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2B01F582E
	for <linux-usb@vger.kernel.org>; Wed, 28 May 2025 17:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748454171; cv=none; b=FTMCCC7+UwHla/ZdmVVN4lOcJ9EpwbRvquSv7VyYj7dAEOKHkBM0qHz1utRoCGxFc9a/CjJZBONQmn4p07cHSNvU20lMP9+a3hwQbrXnvxqsIRqNNnyrz0UUhi/t31ZuBIDJtN+dLyaYbfQX9GjGq1lKJYcgLIYa0HFNMsrQfqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748454171; c=relaxed/simple;
	bh=xHB11S55vbBCSjXZFfgzt/20X/DoOIfaYi1A/IhnDBI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NeFoWhhy2IsnsVWzJdbEMCAfTLYK84boVHMSn5jGa1secfCwKNg38IuHJQ1jjwuMJZRJrJ/KF7xO9qRGCTkLgJMSO/oZG1UDhE4mkdCB6jQWgMvC6SzLqpr3IsbfLTqQpf1albmIsMhN4s4NawZwSQ29OZYATLUhDWwLcialCbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LwSquHgZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SDpSYM029130
	for <linux-usb@vger.kernel.org>; Wed, 28 May 2025 17:42:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gkJ+K1owqVTCltsNXWWOly4cngF2CqphP5rA+v7Jo/A=; b=LwSquHgZC2/RHb/4
	f1cy9txM9mcVsCwWdlKRR3CVQVmYcuqpJORPRS6oAUI4QXntAruTqmzUW7vqCYna
	MQqPv5mUk6eFQh5d3o27J+rxHU/dYR5B/Hu5QY5ntkcfYKLMd0QCHqkX3MmNpjeo
	HygR5ajbfWZp3jot5dmydi+9TPKqPkc89HgeoigAhrMrMn4gR1bHpMj/R9OqWc3Z
	u8bODXgnDX3eWj6UfO3hlSPZ7W6VNR3LPlC991gdInW8ReJmMutagn5GNGUvxkxw
	lyXCQ+RdfEqSRFsB/JLK0iTWevxXZwdLGe7qQjjSaCdSwyQu6UaNVEtIzEi/9ZSf
	CEaQcA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w992n4w3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 28 May 2025 17:42:48 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-31215090074so47364a91.0
        for <linux-usb@vger.kernel.org>; Wed, 28 May 2025 10:42:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748454168; x=1749058968;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gkJ+K1owqVTCltsNXWWOly4cngF2CqphP5rA+v7Jo/A=;
        b=G/p5+sCXcr2TmDI0koQFiOhiWUsaiU7+OgTplxeKyG956M3tlp8nzQU7qp+PJfZcOt
         YebXhQme1H7+iD2OCBZNYJpp/oTl5JEy+tMyZj/o+iYASFyFgNFLJHgvpTVHIuu8gVpw
         +zi/GqLJJLdv9eX0BtgpTVjUxT5R7zFEYa4+KwaoxwZp5e41mGvoaq28s7IuxpngzdRG
         cAG1aB27Qu7AILkNFvMKjEmzAA5/p7YSgyHIhqJ3NC6TXopIzr+wYv4wqIrIDI2jQvEJ
         nTD4rfi9QVg29hmWgU8T2rxPf+P3XfjCq4O8tJwXzV5ZSIyTZYeSNEy7w72BVrzdfis7
         m67A==
X-Forwarded-Encrypted: i=1; AJvYcCXSkY8nufVssuJmLU8MOLuNpB1uMTHK1P0V7q+MKQpvYFSuTAKPbicgJjAhESsTr4la5N+ifsctiHI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnCr9v4s79xlDog4j1BysAcZgQygpsptc/znhMnS9ys/dxJhjz
	PILnxNOu+UmBQZBtLvfSBtkhmed9SOam4XnrYT/HJV0S52qVaUlzRBJM+qlZ5R+oAgXS3I2Q7+A
	8+0jPOEC8IlPKfw9dT9fUUsslRwREegwULx3lRMx+zKPWDyh7JdfeXS8l/opGu90O937wAwruFa
	yRY0bj8TS1aQgPVuwZt0VH62635cXIEBmPKfA2sw==
X-Gm-Gg: ASbGnctVX+Ywy6TNM8VvCZABO4ZlgqePbO1bVuId03ov/fXMB/MEwAKW8WDBvGx78Op
	98l4/8Gv9KpnfHdc0bzRjZmQXP/keKVy+Iy3nUCs0uAOJRjSvrqPGEMJlNoocw/vofHCrmIVczy
	LoIeTyOkvtu4dl+FR5PasvIwXG
X-Received: by 2002:a17:90b:1b0f:b0:30c:52c5:3dc4 with SMTP id 98e67ed59e1d1-31111c49d25mr29158171a91.24.1748454167788;
        Wed, 28 May 2025 10:42:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElJOznSIDBxQNtBqnZZvLZ0mXq7SapcvIwfl9dqbmTLqAGbsjluuJN1LIxWmG/4IMkLD9QesITMfYmRatftoQ=
X-Received: by 2002:a17:90b:1b0f:b0:30c:52c5:3dc4 with SMTP id
 98e67ed59e1d1-31111c49d25mr29158130a91.24.1748454167347; Wed, 28 May 2025
 10:42:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250524-tb16-dt-v4-0-2c1e6018d3f0@oldschoolsolutions.biz>
 <20250524-tb16-dt-v4-5-2c1e6018d3f0@oldschoolsolutions.biz>
 <g7vlyqma6ow6tdsaqt2rfwvblxqwbqlwmoueio7i4vqvjy76kw@5bz4g33pq4t7>
 <CAMcHhXoYkQru_0n5siMGGkTcHu8yWRZWfT4ByiD8D0ieZHF+wQ@mail.gmail.com>
 <vwoixgdyjjzcjlv4muwrzv7wztnqyidtj7ghacgkjg6hgkkyl7@ji53bhiltaef>
 <CAMcHhXqDFuo+x99KOK0pQFj-FyTdQoZS_JvehNE2AC_JSoQ2gQ@mail.gmail.com>
 <rvyfkow43atquc64p6slck6lpfsot67v47ngvfnuhxqo222h6k@kdvbsmf3fwsr>
 <CAF6AEGvr_foMVwaE_VSVWLT50cbGi8i3UGwo2e=rORD-1JmTmA@mail.gmail.com>
 <152f5150-30b0-400c-9816-13e4710a4156@oss.qualcomm.com> <kbmqr7gjkd72hgorbhbwb7ttvmecfbb6pg72st7zwt5ogxju6p@itycxk6vriy5>
 <CAF6AEGsTtEA=So1CDhvg8H5+Z-RJ9OnhgSzDoa+zkWSPO3cvnA@mail.gmail.com>
In-Reply-To: <CAF6AEGsTtEA=So1CDhvg8H5+Z-RJ9OnhgSzDoa+zkWSPO3cvnA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 28 May 2025 20:42:36 +0300
X-Gm-Features: AX0GCFvWYL_b4RjTkVuHpDMO4jnqnz8wYBbed_Z--BZyI6lmIjmBVVwjVONW_Uc
Message-ID: <CAO9ioeWk1-dUQYDS1oQNc-QaRu5MG_C=JRx6RPiFE-OQjB7g3g@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: Add Lenovo ThinkBook 16 G7 QOY
 device tree
To: Rob Clark <robdclark@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>,
        linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDE1MyBTYWx0ZWRfX04/1aY3a/K1i
 X3/fkWH3wwyuXMP5refU8YR+irucqytoX7W2d+kjxKE7BHvMYjzE/2VQms9AzhUqVrZGje9omzq
 3yMlodOXQkqGe1nlWYliE2tzCnEt5bnJNy0jjvdq6MntFwsNL1rLSZ2izXsY4wnf+bXvRUQVK1r
 I//7iGsZYq1Mcgn79+fV9tsk/9dzv6vfvfo2Kw2GZMagsMmGSfUR7z1qetu1bbvzgpXVusn6Ffm
 Gihu6LkaUe67aw+plbV6r6PqsemYJoMUL4n4BveOjz4UAVjXdOnfakB16lIVA5Ch8iw9vzgzCRs
 LCJhlQ58caE8JFWCjPj2bUUimIeRwSSTMrbMyLeuta7icgvDECBKCohY6awWdjm19pSt2DEjn81
 QEomTRQHfjiA0KVi76f35VDRgcDV/YcnEQdOpKpD3yKxMHCITv9bYAxdAKjQo4FuRhGqFGHv
X-Authority-Analysis: v=2.4 cv=Fes3xI+6 c=1 sm=1 tr=0 ts=68374b18 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=yeHvZfB8xrJCexBfAjMA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: lYxzKE1o2KueM2CsKMa0FMZPEiB7m_o7
X-Proofpoint-ORIG-GUID: lYxzKE1o2KueM2CsKMa0FMZPEiB7m_o7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_08,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=827 spamscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280153

On Wed, 28 May 2025 at 19:50, Rob Clark <robdclark@gmail.com> wrote:
>
> On Tue, May 27, 2025 at 11:18=E2=80=AFAM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Tue, May 27, 2025 at 12:55:06PM +0200, Konrad Dybcio wrote:
> > > On 5/26/25 5:28 PM, Rob Clark wrote:
> > > > On Mon, May 26, 2025 at 1:36=E2=80=AFAM Dmitry Baryshkov
> > > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > >>
> > > >> On Sun, May 25, 2025 at 09:43:36PM +0200, Aleksandrs Vinarskis wro=
te:
> > > >>> On Sun, 25 May 2025 at 15:33, Dmitry Baryshkov
> > > >>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > >>>>
> > >
> > > [...]
> > >
> > > >> Yes, please. Don't set okay status for the GPU until it gets enabl=
ed.
> > > >
> > > > Drive-by: Shouldn't the dtb describe the hw and not the state of th=
e
> > > > linux kernel's support for the hw?  Ie. if bad things happen if we
> > > > describe hw which is missing driver support, shouldn't we fix that =
in
> > > > the driver.
> > > >
> > > > (In the case of the GPU there is the slight wrinkle that we don't h=
ave
> > > > a gpu-id yet so there is no compatible in the dtb yet.)
> > >
> > > My two cents are that it's okay to enable it, at least in this case..
> >
> > That would most likely make display unavailable as DPU driver uses GPU
> > as one of the components.
>
> Hmm, perhaps we should allow the gpu to probe, but just fail to create
> priv->gpu, similarly to how we handle missing firmware?

Ack from my side. I'd also like to remind you about my split-GPU-from
display series.

>
> BR,
> -R



--=20
With best wishes
Dmitry

