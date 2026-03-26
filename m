Return-Path: <linux-usb+bounces-35480-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKprDuTbxGlf4gQAu9opvQ
	(envelope-from <linux-usb+bounces-35480-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 08:10:28 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C8A33046C
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 08:10:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2211530AAE5A
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 07:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BDFA393DFC;
	Thu, 26 Mar 2026 07:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OYqhxSCA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DXMBPdOS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D18F34E75C
	for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2026 07:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774508678; cv=pass; b=HV/fdWNWhw6mi1WzHpGJhfcIy+7lbadRMHAAm+sbN9bT+CE8Nc3NPhK9fPe4uFdkXxKo0mzSwhGvMdGQmi/79U6VlWqU3GJ3djzGGcFnExWg8Tfuwzy8Gmhu5kHKonaZujr4yg9DLBSCGvLVoP3XvEcigcvdv4LGD/g9mv0NSdk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774508678; c=relaxed/simple;
	bh=xi5NIAahgNef8wQN/SdnNgsW+wwbnYDjNGE/8YIg2rI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MC0EOh/RDss525eBBYdMPE6fkGN+EHAMY3G8pZgq1qN9T9FcS25hFdh2Co0mUev3pU2GaFRVmEgq57UTwShMY9RvTnxiidIOZKVTqY4xA7hVw5XF7eJuz9dIDGPIKvrVpN2OpfBFTMvZ5CLkmdsqKgZkR9/FZk9xdetg5MckL3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OYqhxSCA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DXMBPdOS; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q6LV8r1175513
	for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2026 07:04:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xi5NIAahgNef8wQN/SdnNgsW+wwbnYDjNGE/8YIg2rI=; b=OYqhxSCAp7T2l35L
	iae+xlTa2e9RLFYO8j/ejRRz8ydvBYN56F4AW2BrBGPrjMwgj99KZfnUiopnKw5S
	fYJJoAiQbjEMWUSsJLa1TTFKvpQ38Ehf+OZAsMb6QnWZZ/1drQs5EK0NoAb13+04
	UPoT1y0v/bDeWCNupjKv9v1DOhbvHxmhh4d6KuFlqtE4d5rFNdrREV7i+YpB49SO
	ESXnZiNG/pO1Qoz8TvLTxkNGjo41jgdnu7E1x2ZGSNOFSggh7aJAc67UaSREvw3J
	ssS7ZyuR7wpytge4Cj0AUVNkwRIkHDAbV7qKTo/6pdLtrb9a2sTMRzRawj8pbnoE
	zKdSEg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4q76smdu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2026 07:04:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cfd0a23243so284409485a.2
        for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2026 00:04:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774508676; cv=none;
        d=google.com; s=arc-20240605;
        b=KybsuanUN5YWEmbbsCpjQfXs+WiEYqrtXFp9vKwcQghBz3mx+nLvKo9Sz0xPvRlrhY
         SFDCCSh94zGYk1nl43dqhAd7R+Jav3CzjL1TtRlb4C64CC3TFtxLM4eX5qCC0rL6/rVC
         stIDzv2ey5vHvpfdn9awG9CoWspUe4Frt2ZmninPrijJMc+begzMupkw9AOHzVqRVAGd
         8XK+woNpHGIod5rxNw2pQi+gwbHpZTH6ARwzV+fTr0jVt9V53Tj9OxhmP7oAMsZ3RK/d
         0tJcWKqLKwz6Or4LFWrjuLAkpesn5Zl1uuHcxfhmfcGWLMtAvsaybVy1uEVbxD01lFAs
         NuKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xi5NIAahgNef8wQN/SdnNgsW+wwbnYDjNGE/8YIg2rI=;
        fh=8XhMqJs2uwEt3kvVOVPGiGJkHKtgZfGMD0tFjnbODzg=;
        b=GgldXyalmMLexqpj/rf7QZGjv7hz/C/gm5r9ZG55tT9z/WuFGcOFGbdX43wnd63H86
         8DvKZB+jWZVqnHGbVlH+XYEvUODAFL1UvHYCW8xbDVIChThOB7DL1mKQ9mHTZThxw2Jj
         nEB/0DBL4CPqs6HFDW/Z3+njzJubUdcotoe3VAQoB/tWl8ZOZeCB+i+QeLieDIoSrV9b
         84lkCclfgSOG/DZXnkPMNRfNU1AAOq5cpl1/LTmjGA47RJreawTL9AGvVMDFocFjJRYK
         Rplop3s9chOQYgkNBc/F62DSdMSswMzEsfYfnDvBVFiO5HXbTxNYQZjzpopiU5St1fJD
         8THQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774508676; x=1775113476; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xi5NIAahgNef8wQN/SdnNgsW+wwbnYDjNGE/8YIg2rI=;
        b=DXMBPdOSRhvFBYjjnrlzxvDxM+3ZchMskrRMfg5T8TQha/3abj9sPRiQjqtETswVOe
         ICeiXTfMJsy+enUjk8f1DOxcELtiR2eGh2KkCwHZ8VyHO5nHBw34luF2u6iSGGwHs7nU
         WUxQFDh+L0DP03dBNZyeTzjQZE393PDxsgvrtscomIjiqBfyUXEg2A9qW46p2JXzVP5s
         7cTju3TUY3fS39zTJzXXp3N85c2Xuj3sV0e3cB5MPdqaWEx3sau6hDM6/rkOTLrfB/dk
         Dd+IOOajdPvN+qmY26lRd6SPJrA6RDLJgBudAWZsiMiXI/B0o6xaKYt25PMh0q/A+iVM
         s5xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774508676; x=1775113476;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xi5NIAahgNef8wQN/SdnNgsW+wwbnYDjNGE/8YIg2rI=;
        b=Yh34tpCbO4kjr8pZWqWihxTTk26m3eYBb3kWRpfeAMu4uHJNEpv2y4d67KRfMcspXr
         RZJmLQFwFc8ikEzZ2ttlr0YKh45Ly/OzipfsmDk1oLVym4GsPHU8+2VwgDB8sU4zSwv/
         PrhrNq99htr55TfMwTZYKekyxbyAIjaj/i+n2bkDPlszyTu1GaRpFIV5mzm/GzyYNMHt
         UfO+ARfn2oW2YlIF85Iei4EpLbDx1Xn2NYTh4Qpux1Zz2uPSrEmw7TqhZSVHpYGIshID
         v3Lc/54xB+9dI6jhdrrnSlDZkqjrouDUMhi7LuJQ5/nU4NlO/BsGt0WRFtg3FQ/tawWu
         pAgA==
X-Forwarded-Encrypted: i=1; AJvYcCXbQ+C3jwwGBAfnZkziusCJ6aRyeDBeDhLfz5aRf5ZVFTIHxHu8wRXH2Xy/aSYu5YOEugJORGC+7as=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbxTIVDOWeU6OljSOYtrWlT3WernnD5FQbd8CE4mN2yWxtH1TD
	nm0/A2GosEF7Q9qOcYzjAgTZ0S0zlI5NHRN1KrNhL6sl++Vc/SlwR844yI1+Ph2KFTrJry+isyB
	kJdy8SEceqsOTKBo8WUCB3jYYDSibA2IBJ+I9MrvhjvFOSrrp+Db/ZYRWqRYxA27ewLzxjmxzNx
	i1qoN3e9zTKT1Ss0RQuiHSoVX8SkIOjclTuvai5Q==
X-Gm-Gg: ATEYQzysv+oAtUaDBK2+xpw8q2WOMBA+qru9udVaRTgM167EANFzbJ/ce0HorFeigei
	69p2GxnKLWxp6t2L+IGsGkxNx+Y1GDtEgRnxzQMlMNPb3vStiRRlqSbm3/rA/ZveawDwB0138nd
	0tRN7Hw3qN/NykxSkxQcOAK6cpK1l9/fi7dAEmp8rAaM03F7Ye6nd7wxeo/OM/c+W/VsTSuGuLK
	+pipsw=
X-Received: by 2002:a05:620a:568:b0:8d0:ad0:bfee with SMTP id af79cd13be357-8d00ad0c705mr420798585a.26.1774508675579;
        Thu, 26 Mar 2026 00:04:35 -0700 (PDT)
X-Received: by 2002:a05:620a:568:b0:8d0:ad0:bfee with SMTP id
 af79cd13be357-8d00ad0c705mr420795085a.26.1774508675045; Thu, 26 Mar 2026
 00:04:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318040644.3591478-1-swati.agarwal@oss.qualcomm.com>
 <20260318-neon-vigorous-prawn-dce7f3@quoll> <CAHz4bYvs9mnDwfkfjkebucZSQpugEqr6+sFf1-hgzNO8SodzQA@mail.gmail.com>
 <d44ec842-1763-4f5a-a987-f41a6e624e87@kernel.org>
In-Reply-To: <d44ec842-1763-4f5a-a987-f41a6e624e87@kernel.org>
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 12:34:23 +0530
X-Gm-Features: AaiRm53LgZwRC4-dZr8TZYUTH90mg7YLcB4GfdpJtgbwdJVo8pxW4uBCJ-w86qQ
Message-ID: <CAHz4bYvG-FE2bmN+VU6jM-x-j1pLz7DdYqub+=ek0P-zgU1X2A@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] Enable secondary USB controller in host mode
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Pin-yen Lin <treapking@chromium.org>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        =?UTF-8?B?SiAuIE5ldXNjaMOkZmVy?= <j.ne@posteo.net>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=NOPYOk6g c=1 sm=1 tr=0 ts=69c4da84 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=q5bItssymG7qwTykz4IA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: uNhhmc2m3P-km5sMCIYsx5NpPpCho5xM
X-Proofpoint-GUID: uNhhmc2m3P-km5sMCIYsx5NpPpCho5xM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA1MSBTYWx0ZWRfX+oO+cLAslDEc
 /NmNottG+rjdN3z6KkA8Wv7+J0t5Iro87s0UAHdvVBF6hwh9ZCc1RN3WqqbOXyBK8fPXCfqyvNW
 HLby56iS2T7W3e18wOM0/FfPMup14KFnuh0qfQ0Q+yOA2D2MYhSNP80Bm4GPNM0NA+JzJ/V2TJL
 ZpUvElWHir0RyAR6MCQloaXxYHTxGm96nogsxEH87k27O/e9x3z1SEYg2l7DOWk/HzZ3mbpp6Tt
 4wGqAoGeiaoYmLkmfA4X8N8tCt651eSKgIZaYOCMFbXVF0RN1+TLnsCfhIRSx6X/05Ui9SlMaME
 zAIBSf0YA/ymwtsxaojDm5hADltU+jj8Y4DOz8c7fZeEYyRgOXUAZjk0nC8JR01/aCGQcxGLDWr
 njuCRIuOOJ5tA4AS9Q5b/gWDB4G4NXhHPmZivLeCcvuYeXtH4zCOrvun/dHX6vsapuwXkz3GMoQ
 q1x8hOlGhTjuOPSCIgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260051
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35480-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim]
X-Rspamd-Queue-Id: D2C8A33046C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 1:12=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 23/03/2026 08:36, Swati Agarwal wrote:
> > On Wed, Mar 18, 2026 at 12:33=E2=80=AFPM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> >>
> >> On Wed, Mar 18, 2026 at 09:36:40AM +0530, Swati Agarwal wrote:
> >>> Enable secondary USB controller in host mode.
> >>>
> >>> This patch depends on:
> >>> https://lore.kernel.org/all/20260306091355.1178333-1-swati.agarwal@os=
s.qualcomm.com/
> >>
> >> Honestly? No. Drivers cannot depend on DTS.
> > Hi Krysztof,
> >
> > Here what i meant by dependency is that I have rebase this patch
> > series over below patch series. Below patch series is related to USB2
>
> And you should not. Drivers cannot be based on DTS branch.
>
> > micro USB controller support on lemans EVK.
> > https://lore.kernel.org/all/20260306091355.1178333-1-swati.agarwal@oss.=
qualcomm.com/
> >
> > There is no dependency of drivers on DT.
> >
> >>
> >> Also, combining here USB is a no-go. Do not combine independent
> >> patchsets into one patchset.
> >>
> >> I also do not see how you addressed my comments from previous version.
> >> You never bothered to respond and I do not see them implemented.
> >
> > Apologies if i missed replying any comments.
> > Regarding your comment on v3 series below:- GL3590 hub used in lemans
> > EVK requires only 1.2V and 3.3V supplies for operation, confirmes the
> > same from our internal HW team and update the same in thereafter patch
> > sets.
> > https://lore.kernel.org/all/20251220-economic-gay-firefly-1873a9@quoll/
>
> This does not address the feedback. I did not talk about Lemans EVK. I
> don't even have its datasheet. We speak here about GL3590. I found at
> least three supplies in datasheet. Your binding has only two.

Hi Krysztof,
For HUB GL3590, there are three supplies which are VP10, VP33 and
VP12. I have already used VP12 and VP33 in bindings. VP10 i have not
mentioned since its internal supply and other two are external
supplies to hub. VP10 is internal regulator and its pins just loop
back. Regarding AVDD10 and AVDD33, so AVDD10 is internal power hub
which is routed to several pins for different functions such as the
PLL and AVDD33 is external power hub where the external 3.3V gets
connected for multiple devices.

Regards,
Swati

