Return-Path: <linux-usb+bounces-23402-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF0BA9A8A1
	for <lists+linux-usb@lfdr.de>; Thu, 24 Apr 2025 11:45:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34A7D1B85940
	for <lists+linux-usb@lfdr.de>; Thu, 24 Apr 2025 09:45:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 053A6238D5A;
	Thu, 24 Apr 2025 09:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hp8m0nAX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB8F221F0F
	for <linux-usb@vger.kernel.org>; Thu, 24 Apr 2025 09:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487467; cv=none; b=kkMMTbEt8lVKnm2HQbxJFXpIiuZMH4nUDxHOJOZTsmGGFiQNOGk2z6qxI80R4VyT29siUcxivzsI30I9dS/ILdVD16jUVqWv/w5ixDcAJXR47ERIlAPDE+ZU5he1zFeSNWrcSJju7DZHO1p5h1M0t4e+FhPtETzl2jzz+AcuAbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487467; c=relaxed/simple;
	bh=US2PVtNLZaFkAuVXr5SpyazmZmP4+ZVR7PKcZZegtjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ClcQTHHDmfsl54upRFLcyD3pH9Rmej0I5l9QwhHi4wAnoUIOUN3nvyNaGj/jyWCTNQZYvRzN1vnyZ+h2ruD4dUdtiQNYiVZEhHfrr3eKus2FXOfAgtZQpCbFwqENsVtoa1dfwzdW2iZVaxaoVbOWB6PvRuUvQNSB3MSjA9oe96E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hp8m0nAX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F82B010284
	for <linux-usb@vger.kernel.org>; Thu, 24 Apr 2025 09:37:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DgOyK6Aj8y9bqEdW8CqXJdRw
	Zh5pW+vbS8PbU9FROaw=; b=hp8m0nAXnk4d4G02FKP6jguqp+UJUzC/82qow50d
	0L7MigqO8ITXrjG01Ox7yDCBSQMzPp6l8v3ZvSHeEqTiTX0L0jBwionjBfVRlCqZ
	sUwSw8jI5DLKU5IkJI/q4VZXIKW7BaVSbVObrfeAS8ZdP6oUnaM9W02ZgE2NA5pl
	GqOXFCdp1mmQ9J/Oziptyfj041KAOufp1hFq6dY8nshF5y/x4/efekkiqUbGLv7z
	BNVnAYRw4+WgrXvhPsJ2pmkkEdS6g+WlgyIzOuYO9oKFtI2AuThDuFWms17ecRwx
	1BnG3atS1yT9goBfnBj/5LnBzmk9UTOpkSk0bg8hiIRZDA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3n0j5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 24 Apr 2025 09:37:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-47ae7dd6217so16627941cf.3
        for <linux-usb@vger.kernel.org>; Thu, 24 Apr 2025 02:37:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487463; x=1746092263;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DgOyK6Aj8y9bqEdW8CqXJdRwZh5pW+vbS8PbU9FROaw=;
        b=YiThRgcjvDgH+HiU/+l/fGuAFsGhiBUWH+GBc+353bldrwByKqEab5OeRNVEsTEGl5
         U/hV+q5qr9pZWTJrbUnZGcjzAIrqbiRn2ZP9g4Q+ti4I926Lci7aXp3vK4BPjzXqae7h
         UiRziGySJ2hjOo3JDnSVvGbBsCCJlY89CftkDA4Q2Y3lUt6IwXUyJcSZncrVYqneYRlE
         zMtrS/oOtVQZww7bWT9h2mSJxF3DNRTfAxfzt+7OSAmgAwybbwn1sMSwYDvPcRkY7ATa
         g6mBuulZpuhTaJ9ZzT8j5giGcjj5thwIFxHmdIlaknHm78ZxLI/Iyp5OkNFNYdZhlrNr
         OLbw==
X-Forwarded-Encrypted: i=1; AJvYcCWIKtDnuIIEIvjJN19noqnxjDzBsnMHjM/ekv1stuoz61FZwnnMbsKVBJk2unZnEv+6bvAolOUP1XQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0NUlL+vc1yYyb3MKKkZgQjQx7X7cXuCWFOw8fmzR7X29IRX6O
	UXbM9dis9JAxJs8mhNG4nS+dQG/wPXxWgT3GkOiF6MGsG3cXTY5MWhR6WftrimBKytXM3NeyFXJ
	SbirlRzRBiHXmVaFlzDI39h77rHkLQvII0Yn9LArhoTQ5KuJeWQEkLc4fjjk=
X-Gm-Gg: ASbGncs/qYwO31NnHuxhUTTI7HiZZ5gI3kohltycJaHsHkL7sVYXw+wFYRQZpdrzp5o
	5F07CZKC7KntCq45+ReQZ+RUaIMqyvUfhLErL+xnjHy2z+BfWCt680rVyHRxqSfSFzbuQuxIh1l
	k+0jayHXvqNoQnY7DizCW87IePDRoc/jZsyinBtdHvFBJRYU4fse0jZFE1FDZJ/Md9HgFHMnwt3
	0TVFMXa7hTXjeNnWlKiwmgFlyfxV/aeaPceCXHJ+P8W/cqHL9N1oxhyPUPul9pWAF+u0EQ9gwf0
	6GVcPtUSiD/pTL52yi9wSjgN6zggd2BjqIhVrD9bXxIA13X4b1URLomAkRyxBatpb2X/AYD8P6A
	=
X-Received: by 2002:ac8:7e92:0:b0:476:850a:5b34 with SMTP id d75a77b69052e-47eb33a7730mr30466801cf.30.1745487463410;
        Thu, 24 Apr 2025 02:37:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1eEvXAeDIBJ+oaIV6NuXCx1ty2W8MF/z7TiaW3cFjO6fXs6cgqkeV3Jv4TZtIDAyz/pl37w==
X-Received: by 2002:ac8:7e92:0:b0:476:850a:5b34 with SMTP id d75a77b69052e-47eb33a7730mr30466451cf.30.1745487462999;
        Thu, 24 Apr 2025 02:37:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cc9ea4asm166075e87.149.2025.04.24.02.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:37:41 -0700 (PDT)
Date: Thu, 24 Apr 2025 12:37:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Melody Olvera <melody.olvera@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
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
Subject: Re: [PATCH v5 04/10] phy: qcom: qmp-combo: Add new PHY sequences for
 SM8750
Message-ID: <ayfgkx7ep3pglzydno3waipm4xqcbuj4v4go7tvm5j3hu7mswr@ceqbynkuidcb>
References: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
 <20250421-sm8750_usb_master-v5-4-25c79ed01d02@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421-sm8750_usb_master-v5-4-25c79ed01d02@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: UzHNeDTJr5AUOaYsARPDXbOx3PtB52AF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfX4sK0J3M5N4b4 JGrsG10Z9dZWtdekwMnguq+9/yqwmelnFi9nOLsgpyX6yXszusuMYpR/JJYFrdHp1of1JRaGSKS pegc7I175mevAy3pWDMeIbXttlTXaH6g9VxQGxgDrgjAo9g3lt4j2d8afaXJUc14XgWfC5JZhGB
 jkxLyfh5ILt2k8ruZPX6fOAlyQG0Wzd3d6MUvH6xNogVoLtVqh/kjT4VjrvXFFVsdP6NWayvqFh TyF5/pqQheTDXctWAeDEZQv6bU5W4KLyNWPni4HRG80bq3gUVomOqFC2mJYlk2q+vb5fXzEXyr8 MrWEUd2EG6KuDrVdeYmNbddan7ntEs8Msf01lOi4KhcAoVShMlo+G6GHxpcX9Pl3EY2zCCtxPMp
 h1UgMOuU5qCnNqzA5TnFy9Pg8iigthYjwDzq4gk47fnPQoLFQ44PlXYFx4o1Kr+TGyt1j1DP
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=680a0668 cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=9yGODh8E-QI5J-fucZYA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: UzHNeDTJr5AUOaYsARPDXbOx3PtB52AF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=796 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240063

On Mon, Apr 21, 2025 at 03:00:11PM -0700, Melody Olvera wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> Add new register offsets and PHY values for SM8750. Some of the previous
> definitions can be leveraged from older PHY versions as offsets within
> registers have not changed. This also updates the PHY sequence that is
> recommended after running hardware characterization.

What is updated? I see only additions.

> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 221 +++++++++++++++++++++
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v8.h     |  38 ++++
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-v8.h         |  32 +++
>  drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v8.h |  64 ++++++
>  .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v8.h    |  68 +++++++
>  drivers/phy/qualcomm/phy-qcom-qmp.h                |   5 +
>  6 files changed, 428 insertions(+)
> 

-- 
With best wishes
Dmitry

