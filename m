Return-Path: <linux-usb+bounces-29805-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E6DC162CE
	for <lists+linux-usb@lfdr.de>; Tue, 28 Oct 2025 18:34:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 362EC50303B
	for <lists+linux-usb@lfdr.de>; Tue, 28 Oct 2025 17:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D441B34C804;
	Tue, 28 Oct 2025 17:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d8k2hGCv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JinWhdWT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CA43314CB
	for <linux-usb@vger.kernel.org>; Tue, 28 Oct 2025 17:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761672578; cv=none; b=BkQ73exPszTsmr9MO9f6Zv+31DuncOnKh5UYbaDgOaQa8jfgZ7hF52HGx6RkMTfXouWNpJu2cMTBJbfk8Qu7hPs7Kj/7aLfRzpL6N5Vplhj5s+1RzIpHkxH0vhGtTnuOHrixvoaDD+mCWXkTimVfrLZWQmRXQlFivF3IH0eq1iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761672578; c=relaxed/simple;
	bh=dzrdypjDdI9BaFh8MW/rjARSFEX5Ei1R7Hyon2nGXrk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BuvGSepRrHNRsurgkkzEVVto3WpBrIxMD3HlrySC0RhWKm1rSOG9jPo3p9NDoFehJkJXFptsAAJQAuzBYsYSIbler3D6lpZq0VSWGaESKeRtHnUEMmcw9wDH170gtopKSdujGYjM8MRUIyOrK8wKBgePmcKW9fa1aJ+Vh7lfaKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d8k2hGCv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JinWhdWT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SEoPhq1861208
	for <linux-usb@vger.kernel.org>; Tue, 28 Oct 2025 17:29:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YcEIxv6xzNhfpt+eGv7mAmYS
	pcQLvpmjqaWEZFzMSIc=; b=d8k2hGCvbD5kSIlr6DE+5tCp7djDhYO9XnigazLB
	k+FJqQBGE/lG0EdngQiTZM132pNRB/+AdWrMKjqb/bwoZw0oyheTgw+V0kaF921s
	r7BOYGWCnii7TkEcfMhEEBoe7aM82x2kOl0GTf3D2OFVsLh0wSrfFehmuiwUn8HV
	Kk7RlHfj3uU661mo6DkVojGlRIUv7mWjTL9OBavDYu8lHjlMfMf3UKR4bAigtbiF
	eQxWBRbvUWkbPY+OXm3W5vwA3BlL4wsHEOAsGcJJr8QYb9ti0I4PPNOfqA+sqSoM
	nRsFAW+yk+z9j5/w6DRSqUuzpH83mhG8RAum6oLm6LHung==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2ur3hcrx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 28 Oct 2025 17:29:35 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-33bb3b235ebso12960698a91.1
        for <linux-usb@vger.kernel.org>; Tue, 28 Oct 2025 10:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761672574; x=1762277374; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YcEIxv6xzNhfpt+eGv7mAmYSpcQLvpmjqaWEZFzMSIc=;
        b=JinWhdWTxJO6EP++nbRTFOad2sQbRJIbsoEgKQDbgZuF/+v3Xiddi2XN4ZaWr9rf3K
         tqEr8MWBwL/B3RfpWic4TQlQ+ZsODQr3Ru/Ih3OG62jxAaaKoyyMTxA2PMlCR7pEX1nn
         T4qZ+bQBxMe2gpHkvh3Ww+2b8VltyVQkzAIFVuiSuEDS6BiGovFrcyRNRdDQ+ndTJY3X
         OdgiMGw4hi9ZMo9gxmfISVkoAOxukAmLAnTCRT9MkUXG3UPaq6WTnM4MMIeCuX+ctoBI
         OTp6v2ZwnRWeZE2SflYMu1W83Jg3fF3TLLxlAKp1dQXrRz023EMd1wp9STZ25BnQoUro
         D8oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761672574; x=1762277374;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YcEIxv6xzNhfpt+eGv7mAmYSpcQLvpmjqaWEZFzMSIc=;
        b=M6CDLLJvHZedQkfxtUdumd/erGlHfcCcgJJeT0Ydu1zMvDrHzXFjxdFnJOJuccd73W
         bN+OSZ7Uw8NR69WGRDjGUbqYgyJcJVI9VgGmr3M1Vp6pdE+GPPVw/o1Tv6HHlnimyNd3
         PuadTrPO5CaW+wh8KCbCe3PAaysgI0FGsMxCr2qZ1Bple9qsQIloDdWS1GCnLeC884f5
         Dri3vRx7J5UZRKW75xvUEPfOjIPWSjLRmW7GQv2wWnlns114JhypTDYKbwp8rNH3+giT
         uh0zetoQ4MeciiWgveYOBKlu5lHuA3eebxaciPfly71YgsCAiLerbzhLQqH+YNu7jUOk
         jTHw==
X-Forwarded-Encrypted: i=1; AJvYcCVVwJ8L/Ni4s/hcttQnd00Zl4El/sYwesQtoAC6rU3zj58LFLgcQN45j+IdWCiazHDvBUUvSssRhRI=@vger.kernel.org
X-Gm-Message-State: AOJu0YymF2uJUKAp09AZMsMxYQ2cQbyms/KIZWJt1lPSgPtr/ep59/0p
	zo21WNvyrQnqX8cDlL5LM1Gcv5y+9ncPPueHxsdgXOMI7PVp5UvwCwUSsWzOE2vtTuFdPK1lVxo
	z6FPcTGCwayOxlhDLXMAOYaZUrgs3uP33YlENuD5ribnuZBs2sT1XTMlLsYlu+XdIhvKrvW0X4k
	SMn+HHP0cP/qvo8XP/oxxQdaBR8pubH+THc5Ncxw==
X-Gm-Gg: ASbGncstBXsASSFk9vHZJ+BDTd4lyxJ6AwizVMi6Jc0A3YN1Ej6hmZD4eNe4gMd533v
	K0aytd+x1RLMBzatbjzYVhl/k74YosyAwd2mo6TJj9o7Q4kA0UuQ8/PWZ28bo6AZ9k0jMcZHgvV
	Ofn/qWiHIrPUpBGLalLf+UKnb3IK5TvwxhMicVFHM6rAh5VrxAodlLeL6LbTHQU1FOdSrMIA==
X-Received: by 2002:a17:90a:c2c8:b0:33e:2d0f:478e with SMTP id 98e67ed59e1d1-340279a5b99mr4558772a91.3.1761672574395;
        Tue, 28 Oct 2025 10:29:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdYrmicv2eZNY3GKoo9XHhj8ktJZgS7y8xrT3uPmuQ3m5G40CVeKo9xG6neVRImwKDpVIHSqI+Qcu29t28g4U=
X-Received: by 2002:a17:90a:c2c8:b0:33e:2d0f:478e with SMTP id
 98e67ed59e1d1-340279a5b99mr4558744a91.3.1761672573908; Tue, 28 Oct 2025
 10:29:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251028-b4-ucsi-set-orientation-aware-on-version-2-and-above-v1-1-d3425f5679af@linaro.org>
 <23b6e21b-40e1-419f-9314-97eb685b9aef@oss.qualcomm.com> <7jpghdq6so4mxarb22r75gxwxxutcixzkxdshfeyvvfbsazn2l@4mpklf2xw3ww>
In-Reply-To: <7jpghdq6so4mxarb22r75gxwxxutcixzkxdshfeyvvfbsazn2l@4mpklf2xw3ww>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 19:29:22 +0200
X-Gm-Features: AWmQ_bl4ZvJ8ex2hZhS6G55zCnGqonBxDaiNnTPSaY04wIF3M7LVnGBySRasZRE
Message-ID: <CAO9ioeWvTO=ujvKuXJk4=FsL2MDVkx_u9gDV3eXr=mJDA-qmhA@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: ucsi: Set orientation_aware if UCSI version
 is 2.x and above
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE0OCBTYWx0ZWRfX1lRHcFJKLTQ1
 tlp3e90LyjYGOTwPaqPHcrg766/V0ZqyfxPMbj/yhLQPYzjARYnD8WsnkSPfUdgHzpv1PIbJ7Ze
 12F24Aaux+gZBY1N3379hIzRE3X685rRjPHUhV8xvMlKaQ3rgN1aXK9anPK5RSwQOZFLaS3/g01
 WXL0pCmGQOc3XY68fejQAzH2BC2vnEs2iCjlg2P+QP4ioCvHhShjO0RfO1POFIQqtelrEbo7rKA
 dr3vJ8azwUXaWqs4q6cS+tjjqkSXItwD1hDJ9ykgVqbzVH1xAIPtGYzYxHC4KeA86oqQoUmKp1n
 HWdEdcfgOwoATyWS55eWSmtGkYnR36SZxqClOgl3GUWPAhkIGyRuYF+eQISgao92YyapEEi/81w
 J+cxA6AGz3Nia6+W7acKU3hikw0S3Q==
X-Authority-Analysis: v=2.4 cv=Jub8bc4C c=1 sm=1 tr=0 ts=6900fd7f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=P0PNh8tqm69XtUyo1CMA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: DaUgfiPqt-wmExfdGe1Zt4byloBD8aMf
X-Proofpoint-ORIG-GUID: DaUgfiPqt-wmExfdGe1Zt4byloBD8aMf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_06,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280148

On Tue, 28 Oct 2025 at 18:39, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> On 25-10-28 18:24:21, Dmitry Baryshkov wrote:
> > On 28/10/2025 17:43, Abel Vesa wrote:
> > > For UCSI 2.0 and above, since the orientation is part of the paylad,
> > > set the orientation_aware by default and let the implementation specific
> > > update_connector op override if necessary.
> > >
> > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > ---
> > >   drivers/usb/typec/ucsi/ucsi.c | 3 +++
> > >   1 file changed, 3 insertions(+)
> > >
> > > diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> > > index ed23edab776354f08452c539d75d27132b8c44dd..84afa9bfc65b6e6ad0a8c1856252299c16562baf 100644
> > > --- a/drivers/usb/typec/ucsi/ucsi.c
> > > +++ b/drivers/usb/typec/ucsi/ucsi.c
> > > @@ -1637,6 +1637,9 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
> > >     cap->driver_data = con;
> > >     cap->ops = &ucsi_ops;
> > > +   if (ucsi->version >= UCSI_VERSION_2_0)
> > > +           con->typec_cap.orientation_aware = true;
> >
> > This is not enough. You should also parse the data and call
> > typec_set_orientation().
>
> Actually no. That is done by the following patch:
>
> https://lore.kernel.org/all/20251028-usb-typec-ucsi-orientation-v2-1-9330478bb6c1@linaro.org
>
> Which has been already applied.
>
> And no, we don't need Fixes tag as this is an improvement.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

