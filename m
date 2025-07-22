Return-Path: <linux-usb+bounces-26078-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0A1B0D6D2
	for <lists+linux-usb@lfdr.de>; Tue, 22 Jul 2025 12:06:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4291D54844D
	for <lists+linux-usb@lfdr.de>; Tue, 22 Jul 2025 10:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2783228B7FE;
	Tue, 22 Jul 2025 10:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AK7xyzVG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F31E2DFF28
	for <linux-usb@vger.kernel.org>; Tue, 22 Jul 2025 10:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753178426; cv=none; b=GuklnOuiJLxYFoYsJMxqF8wTUZC78uhFzDCXCEL6bNkDqSUTctXIImykhlnSl98UmA9bK9+2q6z0TxkW0+va4SKCYryydMa4ugjg0H11CQ9nvuldlyr6w0Tmlx1zKWGWuHdViEa87W77cufe52fVmuw8ffCHE6N4gtc6VQFOo4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753178426; c=relaxed/simple;
	bh=ZFUos+Yvil8dSKOPIWe/qIIyl/GJfQwWc76Kh9pE+Uc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nXd1Hw7xLw1/gYMo/numqjbD6ze3NYllidkAITMaAR7wygNt1QssLLWrtME8lpiXdKE1PQ+eWBno5onoSLb5554COD/yH+69JcZm2mvdSuvHsbfn76kh0I6V0aX4Y/b7/Fuchcd+XNW8mqTwVHr6yz9VUzrdgMRDFkb05/AHgjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AK7xyzVG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M8Pwhh012733
	for <linux-usb@vger.kernel.org>; Tue, 22 Jul 2025 10:00:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZFUos+Yvil8dSKOPIWe/qIIyl/GJfQwWc76Kh9pE+Uc=; b=AK7xyzVGs/M75xcM
	7HScBwdSKjWDXCteKO3Qijnnm6X5oKWJGNH6gmYAzu/OHpaxpgs5UeuuMFCbEKux
	dIAWqIdMH3rb6IOSjOr09BtaCZI6bxnoWDsO8ki9M6nTdxOPVUsiNzzBlqF9Dzss
	LSQZNJijCVFtLfJa0ODUa6LMN6/DSU12JlhUsnKZBxpjYqdG/RNPOU+g5YsNN3G4
	/s14+QMbGb/rhg3sMCviiq0rpBkm0jMcZ+6r0Db9zaM1az0c+2p/sdQRCaw119b3
	JYuqY9/6xKkV3+Lpt4FktOqkxO7HfzBqzl3oR2FoAulf20zfsNGGtWHTCdttq66n
	KlTKWA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481qh6kac8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 22 Jul 2025 10:00:24 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fe182a48acso106840856d6.1
        for <linux-usb@vger.kernel.org>; Tue, 22 Jul 2025 03:00:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753178423; x=1753783223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZFUos+Yvil8dSKOPIWe/qIIyl/GJfQwWc76Kh9pE+Uc=;
        b=o9HivQHt3FsgmaNQt+8vqy/W7idwKL9yRkAydqGZuyguMr7Nrhxv2XmJTYXjJogNUo
         nssgPxsrybNnJOS3Zi1jhvuT6UquENSl6gdovHdLIY/175vLk7ZAB6Sld62VCPSa6qRd
         F2qUo/GiDpN7GA6xfFqxXspRSyGNCJNsp8SvKRh1Hxoq2kjjFJWEotdo7R/UqNiIO7US
         qXXuHcOBW/B4TxyoUFxbk2ydc9H2D7/yILTrqpo/V7noneSc5F7iQdysoWi0IV9I9vHv
         TsZcv7pyYgizSVfZ4Bk8yNs2TW0D5obqFRlKjoA06Yn1LdJA9ayI02Uzk+dNUVIA331W
         N/iw==
X-Forwarded-Encrypted: i=1; AJvYcCVpldk5bUyxN48XralHlfP82LUq2KJ92vv5/f9L1id8qJPNxS1xBwVmXh88isCAu7JcGW7dMW+N6zs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYqfbpxU0hH4SRJ2w2W1ksW94qNAVJP3HAN3Kv+6q7V8qndZru
	/lMX6zgQ9rihlRaJk+44CSbrE/YSY0Ie1Db88Blzp7Nim5bOXTmYdaFTA2ZvqZ7jERW0BS+iGDx
	osypI/SpRsZpl794VLIHPSf6I48bI6mchlPlwJaQB/Q5t4VH+QKVc3OqdXm9rVoBSKSQYCzmFCS
	RwXK2m5UD1gut1XrGUG09nzJzda3WP+4WAyvYy9lKPn+kz3+e/77M=
X-Gm-Gg: ASbGncuDitFVUFqxxrq7erY/KDwppBjr0f3adnqflJnWXx/WlK79+MCIhnNoizjnb5M
	KZbf8PdtBjjpcZl831QT68zBkwkMLVrKHCufekVdZNVm9WVuYtzyzmcdpjSnL1umiMiptEgcXmk
	x5Cj8V9wLoJ6a32NsVwOIw7w==
X-Received: by 2002:a05:6214:d8d:b0:704:f7d8:efe9 with SMTP id 6a1803df08f44-706eb97e401mr41624726d6.24.1753178422965;
        Tue, 22 Jul 2025 03:00:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnslX1INMW1ZcfY8C65651NT2OJbOZR/zoQ6vqkmc1Rh6IlkIlO7GZRBmqwzeh82/rHsXodp0l07CU5wDGjxc=
X-Received: by 2002:a05:6214:d8d:b0:704:f7d8:efe9 with SMTP id
 6a1803df08f44-706eb97e401mr41624056d6.24.1753178422401; Tue, 22 Jul 2025
 03:00:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250721-eud_mode_manager_secure_access-v6-1-fe603325ac04@oss.qualcomm.com>
 <2025072141-anointer-venus-d99f@gregkh>
In-Reply-To: <2025072141-anointer-venus-d99f@gregkh>
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 15:30:11 +0530
X-Gm-Features: Ac12FXyseMee9ZgXxpNxNQGaZuoVfGDn4Cm07lYWSuBy4v2nvFb9hxkyxtZvFQw
Message-ID: <CAPHGfUOsk4BjhvGiN-b0UP-JZ48UvGeKFU=dhb=KOAvo8NCPZQ@mail.gmail.com>
Subject: Re: [PATCH v6] usb: misc: qcom_eud: Access EUD_MODE_MANAGER2 through
 secure calls
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Souradeep Chowdhury <quic_schowdhu@quicinc.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Melody Olvera <quic_molvera@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=CZ4I5Krl c=1 sm=1 tr=0 ts=687f6138 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=ag1SF4gXAAAA:8 a=HSf_CmxJb-FKQ9LhJsQA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-ORIG-GUID: G_POlkvkGN2k7z6Z-W5VhiuD3D3sXAK2
X-Proofpoint-GUID: G_POlkvkGN2k7z6Z-W5VhiuD3D3sXAK2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA4MiBTYWx0ZWRfX77jNLVd+zU+H
 VneMGI/j1GtILUiZgrDkBZ2N0V3E//9S290aXEFvGAga4lM3RYYLyBbVeXx6lsgWoEe4uL9CZHP
 2hPRjS4EWvkQnU3HVLKjp+VmSzQ31D13qKZd0c89p5eU/nP8/nt4J82qVGkrVVXQI+D+0D5gBaO
 oY9ROicSI0goieKKY8RQxg4yclCjFyKU2QboSYHwOX5qSAD0DMo5HVv/kTELruOFaEMzln8LPcA
 I0/Xw5ynBv9L/oXJGDAZu57aCVBuO4/QjLNv8J3ZQzjwddNqpo8hy5FmOvYvqbuA6+5fSUZ74Ee
 vdb753rrsreMDvxy25lZnctBkRMwqe2tCuR4pOuUWfTmbsBEda6wnl3MsEC1Pztgic3KBpQ+7rH
 +FhoqHuRjQm+9NKsYAmLiADrasTUzwnk8bBMfV1nY0w3oIBBrcHBG7j15rbgfPIPN1y/FuQ7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 mlxlogscore=711 impostorscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 bulkscore=0 spamscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220082

On Mon, Jul 21, 2025 at 12:23=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Jul 21, 2025 at 12:08:41PM +0530, Komal Bajaj wrote:
> > EUD_MODE_MANAGER2 register is mapped to a memory region that is marked
> > as read-only for HLOS, enforcing access restrictions that prohibit
> > direct memory-mapped writes via writel().
>
> What is "HLOS"?
>

By HLOS, I meant operating system running at EL1. Do you want me to
change this in the patch?

