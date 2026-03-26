Return-Path: <linux-usb+bounces-35500-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MO/TEWoGxWnn5gQAu9opvQ
	(envelope-from <linux-usb+bounces-35500-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 11:11:54 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8EE3330B7
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 11:11:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D038D307CE3B
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 10:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47D1B3BE62B;
	Thu, 26 Mar 2026 10:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KgY1giiH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H2GhAEHn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7CD3A1A41
	for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2026 10:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774519789; cv=pass; b=MKU8wdUjYPUZidn4NGObMU9Yn5fzdL4IOP38ZSHb2QOJNIINnoD6vPPhHKQ69HMGi25BDB6xzEjHteY9hsNgqV/IoA8ilAQ1G9iJRATXO+vsVXPnnoK2lyKUq6gc5RlHgf2BOv2BpuSIDYTKEIxnoJNKqMZwWFL1Opbw0KSARXQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774519789; c=relaxed/simple;
	bh=skgUdY/qJbcGxUR9dQOLB+4Bt5AS05s4FTctmnMSjg4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RILz3+1/N4pccEv2jspTas30SfiepKO2sbmvhoKSpfKXyB2z0+7jxEoF1ExoWlay1Tl8ktmGoRMQyYOEkw9Lmn0dOaUAb02NDjOoFGi+Dchy1vkwB516+WDof/oi500P4iUsucnSPn14W4F6UQqx87+r1kkCwDXChWQZ6JOIX6g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KgY1giiH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H2GhAEHn; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q76IsP3070923
	for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2026 10:09:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	skgUdY/qJbcGxUR9dQOLB+4Bt5AS05s4FTctmnMSjg4=; b=KgY1giiHYXJcAZfz
	5W+R0ht2uQIeQGOBCWBu0hvRexTlAnbQ7NHX+rsmHyMPjoXi2VZYqOqp9zW8/qZy
	etutvF5bQ3Mk4lCjakh8s5pENXvAqIgcxLUbVvk5/Oez+3zq/WBije24Fk77TAxv
	HIV0PflWvxr8mYwI0aPaw0vEus08W3Vwee7kOvH0ZkAgTwm1ADU5oys0w7EK/pl1
	dRySGD/zctSw9kx+Kv6FznHDF9fpgMHtgk7feStGZKK91hmEkeko3JqKfHl86Acj
	EGeASrBQ/OpPkxFoDKK35LfQt99n5+e/La7cOJDUAvw5z7zBQoTifzyg4JoSaX3K
	NdRAdQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4rcn22mw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2026 10:09:47 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89c4a339b6bso24873516d6.0
        for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2026 03:09:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774519787; cv=none;
        d=google.com; s=arc-20240605;
        b=jLpZX3L//PenbKkRahvQvBbJiJ9Bjjpnv8W2IbHIHMkgg5+rFXyb7yw5U4cV9f7amk
         B64XPxZhE6dZQNEiuSUvEbQ5q27XlUGQ48RAyhxByv7r1ErGd7wkG528EuZvXcepgDtb
         rQJ5yTgn8I7kRbya1Heo1275tzH/guY7W+GbV4Am86rv+GIJC0cM7qkwyOegpztEoFYU
         QyCelHX/NrJY/8rENCNqPL9B2Nj5aOgBp7h7tjPFYqBb+PoXEqDnu7ZjuMrB9t1jCrb7
         wiKJKfRAZJmO8LUmLrnZY3uPPp/K1QLOVBMnMx5Z/mrdyzSgL5BRYsTJQlVuzo9fDOi/
         91BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=skgUdY/qJbcGxUR9dQOLB+4Bt5AS05s4FTctmnMSjg4=;
        fh=PSsxjoK3VAiR5IsBVYh+95FzACmLCCUk6G0JZ+8jPqw=;
        b=N8v5nkPmIRr9c7yb0w++j68ajxoVCR2jnexrFZilf4AjVwRnODUuFX3ztpT7X92jXw
         H0kPY8ovwhH5HtCnssc2zdTcJs6sge9M6ocFZUW3sZaw32bdo7Sh1+AVLJ5c7WwOv/D7
         sSr/bWC0VRLRwkACaVzmxafyJsQ4kGqSN5Es0nunEHwTM1iAe7jJLjoKzQ/Gx7R8jCoz
         bgDMvSYlj0Y1k6Uh790mrxHtwVvakew/hzL0Nh+4+EMS6IkR4FVNNOkAhYTUsb0yKcTC
         wxl8D67S4dGhC8npPPfJaGKPTFEPsdL+7+n+Vho4/5Hr6+nGkO3uI8/LczeH0n5gfV3K
         yoAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774519787; x=1775124587; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=skgUdY/qJbcGxUR9dQOLB+4Bt5AS05s4FTctmnMSjg4=;
        b=H2GhAEHnHj2lGGTI7K6lgw3vb1kqn85dZTXLt7Dm61Qe2oF/nM8o5MO4ZglOaIKzZ6
         crm8mqcfFMZAabBYT8PDnXU8vpMaryXEz/uSLDlFUZhhH8J/xciYgSzGqSkWm7PTsgcS
         8iAejihv6wVGIsSJ/9lpMdyFhfODKagLRWqXmtR/XJzGSzrFmHSOuSdqMzlIZ36xAmPI
         YFTFmbKNuYUD0mPfdpQAHqh+V7X9cDhYLnBM1IwZOaV7gqr+8W5fPNILq7N9nRx2cfVi
         a1m5N3TRyI6ggIwrEdX4aOu7FEoLAvO3qdaRbt6kPvLBptj9bwsMpSPfGAYFNma+1p/B
         Gheg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774519787; x=1775124587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=skgUdY/qJbcGxUR9dQOLB+4Bt5AS05s4FTctmnMSjg4=;
        b=NyRn1ADxLqsbDWzwGbkSP8ydztDUVLYslPRtOWCDXEfKPUqU0kCeTvI91zgngJR5Ed
         0ccfGVm9hjKk2htSB1bSrxMr9BUTDHKqtG7DT0xp3JLRDX3oUIiRjUyvPsaxMb3uo5Jy
         GIuTx5a+v7CE7dEStcjn3Kw0krm+s3JyUuNFTtHiS1152ECOGn2cjUi/ZzsQTE1jH2i7
         hbbrUmEbEagEPvY6WmP3kScYp6e139nlE+ApbCjCwbAWny7t2nfOJuKIQgq8ut9Cvm3S
         OK+tQZz+nlZrC5CWQ18Px4thP2T0TRKI73wGjATRHMT7YlFSKVph2LB01avmJG2whn8R
         7pqQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7Rb3YK90ABgvpCxNY+2Vd5KH4ECunOhP6poqqfQ1xAkii2+fEr48IisMnfAnrKijJNEyQ892R6/0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMvXqvCHpYA9qwXfxhBq0YATMnSx7UbkNiZ57ZEIVZm0WCjF7M
	H98SgVIt1PBK5pyfzlYuBb/XGO+4hFz0Bc5XkJUkoKrSWn61XvMJFMx2Cjo35YHm4RMh4Xp0y1f
	Z42PISSGGJ1+5QC7I+4FDJXaENie+WWuFLIXpFQ67mnYPYGjvcFdmCj6vAALQaQgrd/1ceco7tk
	Vz5A47ug3MyZJ/1UNSBCfsPfjoEr7FwmR9WPK1nQ==
X-Gm-Gg: ATEYQzwP/wXObYSlzbO5xAmyE8m5gteMue8zbXlD1DTYI/jU84aM5j2UGgUeu5xmjLD
	FPnzjzQpNGs+LagNitgWGBYh7mftT1+AHy01oYl1uYaa0/knD8EgCPaXn+0x0vNYTEfF/AMVS4o
	QAIifsGRG2cUDjl+RjrxW4VszKeOAmWLYmYyVnr5seJ0sUdun9vrCWC3/NW8PqjuPMwzjg5/qXj
	cEkYXw=
X-Received: by 2002:a05:6214:d81:b0:89c:866d:243d with SMTP id 6a1803df08f44-89cddf63383mr9217446d6.35.1774519786941;
        Thu, 26 Mar 2026 03:09:46 -0700 (PDT)
X-Received: by 2002:a05:6214:d81:b0:89c:866d:243d with SMTP id
 6a1803df08f44-89cddf63383mr9214636d6.35.1774519781777; Thu, 26 Mar 2026
 03:09:41 -0700 (PDT)
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
Date: Thu, 26 Mar 2026 15:39:30 +0530
X-Gm-Features: AQROBzCKNcMgzC1itNNe9U5zfG-CQ45Lu-HC814-XQT9cIrVkIQQGAkLeXVM0xg
Message-ID: <CAHz4bYuuhHYvmf4ZvaTrba3RAHJ6jMk9h=_DVZ2wwo-5PiaHSA@mail.gmail.com>
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
X-Authority-Analysis: v=2.4 cv=Vdr6/Vp9 c=1 sm=1 tr=0 ts=69c505eb cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=OjkoTXuNvuUHmlkjld8A:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: DVEwP3pL9uDcDjj2qsbZ3nTAf9Y7eXa_
X-Proofpoint-GUID: DVEwP3pL9uDcDjj2qsbZ3nTAf9Y7eXa_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA3MCBTYWx0ZWRfXxz9eTQFHrdrn
 X3bRuCYsC+L45iihWyEZrhaeGWC3LS+NAujQdBa1UHmw1qySDle34KCKFi4uCTwqUrkInZwzLzd
 rmJ4hrIEitCDu+4UL1S944ej71P9SQUGAxdS4UKxa3Xt4CpzEVCix0MON/sjYimAlhLtjjX+UgK
 kO4CHGaEk8zZA9iP1fLb30sFJWV8+xOp+B5TUPK9c/bVZ2WGere0R53HTHnP0v1YCI0DsVQG1p0
 /qdKYxpPiT1ul8ptnt5VnQm/sF91J1y0xMnfwDJHHpAjUMqhS8O4OhOsGMsb+bTQn2fC9c/Fa/g
 D/DdZ+5re+arxc5EBarVfNmpRB2z5iafg5dQ0p7PpUSr+g5DeOZ+ERw9kO6TIoA99BNlrU1LoTG
 YE1JnVl2CaAHZrom5ixhyA0sIhE6BSGZx4bJUnqmmVnX1vDPQ/SCtW8kkIsMfn7BtYVoYGeeIWf
 nEKWKmqCmKLwYWm+3QA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260070
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35500-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim]
X-Rspamd-Queue-Id: DA8EE3330B7
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
Hi Krysztof,
Sure, i will send a separate series for driver and DT.

Regards,
Swati
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
>
> Best regards,
> Krzysztof

