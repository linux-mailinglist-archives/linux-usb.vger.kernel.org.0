Return-Path: <linux-usb+bounces-24227-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B747CAC0B7E
	for <lists+linux-usb@lfdr.de>; Thu, 22 May 2025 14:18:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E840D18957FC
	for <lists+linux-usb@lfdr.de>; Thu, 22 May 2025 12:18:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0928F28A70A;
	Thu, 22 May 2025 12:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Aa9YyTqc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF0B2620FC
	for <linux-usb@vger.kernel.org>; Thu, 22 May 2025 12:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747916307; cv=none; b=FoSi2xV19AeKTkxw1FSqp2osGj4zA2E1LiS6gq/khVIQ62OTB7SosNx45VdqmgJ+mvo+koTqvCAwG+u/Q88aJ0WNMJl904lQ0DA/E+6oJBKXvY2gX7ZqGPnJ//V+bK0EYmJPru7Tf7uspYnEom7b5rQuyBEzP6Gu4Mk0z31SXRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747916307; c=relaxed/simple;
	bh=n5NvcF86AW6hY51Jx68o6/rnmz3zNVCds/LjSsBnAH8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p4x2MAKg2exhxGxOo4s5islyeBpjg+oFXoUn8Bm/fv8p+xI9IdGEiZbWuHxfT+FmOW/zXeQOCRXUSDF/W/jvP+zjhrUV3EjHcWUOfc/J7MYqFBkUNp0lMOgMmvbl5gwXFtMQix5VY1c4giGUrXoJ0qHM+UFw+zdBy3ejkrFCguY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Aa9YyTqc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M8NVxE027725
	for <linux-usb@vger.kernel.org>; Thu, 22 May 2025 12:18:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0lCT7OHY4qkgiQFGYQKA7CZb
	Akqwj5/9Vf4jfYRxp2w=; b=Aa9YyTqcmPha0q2DghHt2xtcU5SYpTQI+wn9JyNC
	TPmR/lWZKU1zGBkKvQl+rzqe05qy4HRdAZV+B3kZWUl4/udXyyDvY6/aJQyp5E9c
	PnvR/TqDIzEEHZj1YqRBOaYT8HaTg/C8PrY7Y9Cw179AUBE8TUvX63Onr2SovWxr
	6IEi+hF8cnpPoswawlLp1ruya8hMT4vsx/Rh8Ai/+QZVJWnDpk6FtY79pkseUoPc
	IPCL9eZHPBgHBaff/H9WiXFv/HAegnUtXq8jI2RrCFcxiKs360OkUIBxn+JMsXcj
	zVWU1JPyA2bUkkZpw68CKKht2EwzNIimJnvyVObqibnkxg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9e6hd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 22 May 2025 12:18:24 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-30e895056f0so8300400a91.3
        for <linux-usb@vger.kernel.org>; Thu, 22 May 2025 05:18:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747916303; x=1748521103;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0lCT7OHY4qkgiQFGYQKA7CZbAkqwj5/9Vf4jfYRxp2w=;
        b=D9KKHYzXd1K3H0ZRBJTKGpGruUYKaX3ykpkB3i6X0FeX+TOSl8K31M76WthbGOqsMZ
         cYHji9zEEJzhIE7ZWcGCJ8ZHqaY1zotoHx6odo7Gg44XnCNn/epf23IA4Nk5POGB4+XH
         XOwuTLnjUgkUU3/Pesbxv6/cRYyLj4iJeaQ2k0uEvv5Ky7vTAu1W2TzWYha0CtuQUePY
         /DC/3GGGIW3IlMG2DBH87Wk7EvNdk1u1VOUqq/XpQLa6gweA7umQEP71F5tLC90lFx+q
         dleflkCKwLVdRLRAi8o5oU0dy1pC5W2yPpwyX89AcX3X6hMrHf+8s1+MCzCfL7bxBUi0
         TVoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxYWbl90zBGz+OjJaXIOKWa0gDWFJtd+eKr1Otr+2s9r9JJr76wIpOLOLGySa0jhqtpEbtyDphFDk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwT0A815IkfIJjnmA20EYy0AI4CSiKCJ1fYXHi1R6J2mpQdM96d
	pfWILNOatB+ersgLyoXh43Jo76dUJ5BYZpVkP8j8UsgtRAjofJKJuJFwm+WcEEYBfH9LRD1Jpt+
	OzsTHWQxIhy47NF9oEdFZyt5cP9e+cf1+h5ZzFFevL3WLTHrguCj2rIsYNVtgQi1H7hd35M+khj
	mvaQWEEIDt5S403pYsZMkF5lagP+gVX6clK66mXAsPe+6QCA==
X-Gm-Gg: ASbGnculMHn2/T+SQtOne1sTLu7W/KN4uacQa9/t3xJ6ViGnSlj+728UONlXuO4pi5u
	aMnScoPtxc9MznsoSb4Is10gGHGVifRTt1AoAWUyXSik5xcTXc/GfCqSSb6xjULcZaP04cWrkH+
	vsv6eh49w=
X-Received: by 2002:a17:90b:2f08:b0:30e:6d3c:5992 with SMTP id 98e67ed59e1d1-30e7d5b7b2amr28763340a91.34.1747916302731;
        Thu, 22 May 2025 05:18:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVCBtSXCGrxGhOjYPLWJ1Pge+L+iUp5ZhWbLEtsrjwBVC47icKDyLQuongy1ue5r0NbqFAbpPouL6VSBeNM0U=
X-Received: by 2002:a17:902:e885:b0:22d:b2c9:7fd7 with SMTP id
 d9443c01a7336-231d43bda66mr369410555ad.21.1747916291391; Thu, 22 May 2025
 05:18:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
 <20250421-sm8750_usb_master-v5-6-25c79ed01d02@oss.qualcomm.com>
 <aAswZg9s41s/m/se@linaro.org> <f7de2bbc-4925-430c-b263-226a633e4bfb@kernel.org>
In-Reply-To: <f7de2bbc-4925-430c-b263-226a633e4bfb@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 15:18:00 +0300
X-Gm-Features: AX0GCFsGEs3QorxIOmjt3hRGNqdEtBYgdaIA34L_R3JHBLbT-M4cKvdAgLWPMNM
Message-ID: <CAO9ioeXzzSBy+wYFATeckKZ2641GaTA1dB_1HOb238DdB7ACoQ@mail.gmail.com>
Subject: Re: [PATCH v5 06/10] phy: qcom: Add M31 based eUSB2 PHY driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Abel Vesa <abel.vesa@linaro.org>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: 97IVGy5aMcj646r3RriqS4vwrVw8bbPb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDEyNCBTYWx0ZWRfXxqH32CsUrXA5
 MeJqmTpok1ltudiTg5CivCvDtFdBi0ykj0qjEi4FZAN/FDcjoLRpiYWexFkYkb84dIuS6R4rVVU
 HJ6X7i9rGobN2JM0CNf4Mo81NmgSnp6E6LBa4PA8ivhrIRDmr/eY0sQLnr43NdqXkzCSYBX0Y86
 gFTZNGmhIhFb63PBmigVKbzd66TJK36hkaFFkXqPBrwIW9FlLw/ZTgs6/bRG/rNafmIymqKf5Fz
 lvU4LdHzAS1pE1vy3ISPGBU72fFcR5D5hST8xmUoKUOsfsqidgU87J7h5IXu72uznHWUi5iSpSW
 brAaQQFJ+1ypvDEwHTR2I3Uoc8/V5c4l6ScVyKI383s7HBnFHxnCV7afnSGpHMRqgVpjxI4yhMl
 05cFmICY1g8IE+kSSEkFrcW2GA5GYr8v8kkYwHXQEVdHj03qD3WIchggu2UMMUdu7w83M/Tc
X-Authority-Analysis: v=2.4 cv=GawXnRXL c=1 sm=1 tr=0 ts=682f1610 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=aPcUfg5sKJd9qEyIwccA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 97IVGy5aMcj646r3RriqS4vwrVw8bbPb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=508 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220124

On Thu, 22 May 2025 at 14:05, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 25/04/2025 08:49, Abel Vesa wrote:
> > On 25-04-21 15:00:13, Melody Olvera wrote:
> >> From: Wesley Cheng <quic_wcheng@quicinc.com>
> >>
> >> SM8750 utilizes an eUSB2 PHY from M31.  Add the initialization
> >
> > Nitpick: Drop the double space from the beginning of each phrase.
>
> Sorry, but why? That's a correct grammar.


Being absolutely nitpicky, this depends on the country. In some cases
(US) typography settled on using double space after full-stop. In
other cases it's a normal space.


-- 
With best wishes
Dmitry

