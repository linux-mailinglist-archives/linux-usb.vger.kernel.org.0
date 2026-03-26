Return-Path: <linux-usb+bounces-35498-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPUaGCYGxWnZ5gQAu9opvQ
	(envelope-from <linux-usb+bounces-35498-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 11:10:46 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA98733305B
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 11:10:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 958613075013
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 10:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC5EC3BE646;
	Thu, 26 Mar 2026 10:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gVauT+Jv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kMdv2SQL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3602731F9AC
	for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2026 10:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774519672; cv=pass; b=LihHndo12bzB/uOYUI90dsYRPAMLIYGHB0PAWsaywBW3G7j7OsOljNSo3iGzDao7unQ8WlxbszgBU/ZguW0FVwTSCpxMr+dYum7Jx3LOuf9v13dGL+aXfW+nc+RM5wuxcWKVRiqAW4SpD5mfOV62pNYdnW56xDDV6tKJJyeF224=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774519672; c=relaxed/simple;
	bh=lqaeI3ynPbRJKQe5PDeB9VaBQLaANlhTZEkq73SPjeY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n7DPC7BRnbv+FCwN0AmvM7A0ZPoO15dG1YiY79vgpdCgZIYfF3IAxLE8eBbHUNwvHlzGzil93nl1k3kzul44jmmLmTpvSFSa2lr+wt+S87nVbpyVapxrIH9tEmxCioxbC5RqLeitjtjZYgvexw1smtxsyss8hz0W5N0/DUvDeCc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gVauT+Jv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kMdv2SQL; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q6e96I1060684
	for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2026 10:07:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dnMavv9VcWVUyZA6Ex4ByNZK75MDVF8digB1PwkBNzg=; b=gVauT+Jvzf4P/isc
	y/2dyX8RuxmQPASHXtfsNXVjOqQBoEGQ/nTinY2ccG3c6iJyo7W42gxAg8h63oRw
	CYW2N0kdLalzBeVllX5sEhtX0GdSJm/vLXEr0X2wFU70axClCyk7IrK3udbBriQo
	qBqGAsAp8wN9Svk92fiSkCjpiBttcYw4xP6X+yEdEFE8SO6zNY05+KsJ7KNDEpLl
	00qknhLZp9Yt1DgPp63ZHYrA2IqcPEy27u0xzG69fbudHQx75ovm4eNqxefG9F0n
	AVRaPSlNvOsUqc7dmDYYX1eLaBAPc/jeWnGzn5U1NLCKQCbOxLSIwIdbTqMe5Pqy
	Sth0BA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4qkst64h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2026 10:07:49 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89cda8de681so14530196d6.2
        for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2026 03:07:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774519668; cv=none;
        d=google.com; s=arc-20240605;
        b=cA43BrXEcLVJxRpN3XW1e+58cb6NrtPT+Vxgo4b/3hc1mLdv7SOB+7hH7pG3CjWiBx
         /mR5xnTttVK9VXqbjaJR6KFKHL57OczkzV359FOrvvpTFvPBiX6lYchbYnUOokPHIUDk
         ht/cqtbBbqTg6eUb2jhOWEQ1c9OSPhRFcSaf90x/l7EHP8FdXorNIxA9waO3CgYPr0W1
         MK++vqIyV08hFzWf7Ym6JPXlFr+3oSDWLP0odVYp/GL8x3+/QsN1uV1Z7IRP6Gvpj176
         xO1bEVwPjCwT8ElSu22TDvqqwDH7eAIWvL1rPM3mZpTLO/tOxl2Ud2enqRMA/mfP9etZ
         j+fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dnMavv9VcWVUyZA6Ex4ByNZK75MDVF8digB1PwkBNzg=;
        fh=4hByx3Lc4dNi3l2RNNxVPS20pdmNOHHLh7Ujf/nuMpA=;
        b=HxrqOql4JzoMfmjYfO0gtk3OWOsINqWMhvDYiuOrldnAjeT7zpmDnwzJ81wPHNId6K
         z1ro5qzvWQe56kFKQaPE1T6LAqz9WEtDz47AujLVoJU0tRpF3XPUn9mjiC0jAAcF7rm4
         GYUa1prdlbA7u6MfhSquEbH0fiGx4u9kAoSK5rey0p1s5r24rS3TCmZ6YL0GVyh1IHUM
         NRfbGYIvvwDGN12tggpeHZcWuKXIK6D5Z6URtsKwWS+Zs3LJURXAGpe2JvN8h4TesL6/
         ZqJMvf8OL/zvzq35srcG2g7XgulUogr9/T5IDo95ZiQp2VWQ37lONn052/7qUMzDyZ0J
         yKig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774519668; x=1775124468; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dnMavv9VcWVUyZA6Ex4ByNZK75MDVF8digB1PwkBNzg=;
        b=kMdv2SQLCJw5MBvaFsfhvwANke14fmFNraGxkXyv3ylVTKt/rNVszCc1aR6kB91HXk
         +Q4EJ78ywvyNoipSNTxDE1u3730AJ0d1MVkkkfFje2qn2SVf1Q0WOwkHY9OYfA9LDA2B
         XRl6INrZRYlWXWl6UZ7X6p2BWQQZhULnQPejBOH0xliHzF2aZUj1GEzoqjYoP8DKWzgY
         pcuSu0OK6Qj6gByxv7JBcyC3j+UePM+wzaQ8VU2j96leZrPHDQbdP1JyieSMTv7exa93
         NHFvn3CXULmcibJ7jwk4Ui+bLghh0vt85nuWyQv8+GkD0sycYlHxYeQaetfrqRWgc/yH
         OekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774519668; x=1775124468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dnMavv9VcWVUyZA6Ex4ByNZK75MDVF8digB1PwkBNzg=;
        b=YF2hkQdQx72U+VoksbIP9FvzdZohSZa/CUyazeifkzj87cYzTPojltPj4l0RWW7h5C
         q4Ie8QLeGroYNKe5Z7qoqzv2RSm+VD7mKrqubqkmbD5vGhPLmEf4KLirc1g72BZH41hD
         1LlNFCVWkRSfjcuCE+pP67biNGogQy1cFDKAvsKswXpWqe7dOo1NVSzgtYrmelaczN8U
         eHirhSCzJcnbrVUzZCOMEV2B/AZfU3/618gwfG0fmycC9DHAbWsW6uTFLR0kwpznoqRs
         P6TrhFYcedps001uRFwRuFsqx8N/ciWBx0sz1FuBfNoL7XMWBLJ/yFEsaNBEv03orGuz
         nLIQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6jMBHMCy4FFfpGj2zAPIRIaljjnxJNFgzUr6DagXMBu2WLoSKtQNv/Him5tZ2S790YZ5MCN2sLRQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLoswAFw3WB16YO3+6WDld0gO4gaNiNGhwhtYfwpf845AKGO1A
	PI87tF4pq+rOTK4QW6+mKAOM6YBJFYDKlp55zNZqVa6/4niANz5dOQDZI/oVwL3Hz4paVJRU2en
	/q3Cdtzwk2vJYxBTn/86ltANKjztwTSpeWwXjxwowGTpbeyM+CvnbxHwrqQGGbmUzg/iBEO35wX
	SFQfxWE0BWIKQcMQD/t8x0rZpCR15b18oGvq9w/Q==
X-Gm-Gg: ATEYQzwmNtOhCdxdC0FQz02RBPmeazCnye5xF08Go57R4YYmxkCSUEzmXgMybFxY5rc
	ShHVbBrHJI5q4wpoGjajWO5azG2mGZovpik2hnm+MOTaK6ko9grgNUGx1NX1dtRTxZrKipYAbsd
	3KepheZttyi3eNjv1Ik0IeKg82Hhy7eBjhmwB/xo/tuxb1UsQqRm+Q3ay3hsn67cZqM9H/zfgre
	VFcofk=
X-Received: by 2002:a05:6214:400b:b0:89c:da4d:de26 with SMTP id 6a1803df08f44-89cda4ddf32mr20561456d6.17.1774519668544;
        Thu, 26 Mar 2026 03:07:48 -0700 (PDT)
X-Received: by 2002:a05:6214:400b:b0:89c:da4d:de26 with SMTP id
 6a1803df08f44-89cda4ddf32mr20561006d6.17.1774519668124; Thu, 26 Mar 2026
 03:07:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318040644.3591478-1-swati.agarwal@oss.qualcomm.com>
 <20260318040644.3591478-2-swati.agarwal@oss.qualcomm.com> <20260318-devious-spider-of-endurance-ede46f@quoll>
In-Reply-To: <20260318-devious-spider-of-endurance-ede46f@quoll>
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 15:37:36 +0530
X-Gm-Features: AQROBzDyOqDscpM1Qp598tIiy0z_Urr2uTYFmuTrlyekpsKSj5Jbxn8BdIURSw4
Message-ID: <CAHz4bYsUAojfB3BCHVoc8PMQBrjme6grdEnkxu7KhTQ+sxOf0A@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] dt-bindings: usb: Add binding for Genesys Logic
 GL3590 hub
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA3MCBTYWx0ZWRfX7ghyUwOD3Ov7
 kehMK4N0ysyEl9YGW5otH6vSLx+l42GyZ63OmLoVHddBnOKGhYH7pCmQ8wwC8BUuEjQSrQns0i4
 RHOfOBFt8YMRsXvN2HbUgpQKCKMBPI82d0CuO3DChbaDanMKkcMT+qS16O5Th9XnvWfUXjj/A70
 reKVLZX9RrvVfM6C/LhrszIBeQUGqArXYwBHU2vZCPLejEmKqeYfGIyhUnKMPjcsxSK1dESkmu6
 ewrKD4qeG1vYBaTm3kHUGMjNl8oixb9yJPMtoSWq/qticX51uAk5Qj7KaEL6ml90TvlpCgI6QLa
 mGliSN3vwvY1iHU0qM4He6pRfL2FJVxfhCLMxgqGPkEND+v9CI9yzwtfhki4A5s856GRJJGbhl0
 rxXJzn4UxyjNkbo2wwUSkUuc4jrvQPLBk2+K9lRmrzp9pehXDPw+hkaPTaDQjm3nIqAwUoQWT2C
 jI8i5I3EXmlRpB4hVmw==
X-Proofpoint-ORIG-GUID: xiXqzRP1eCpZYhiqTcawWmAC36048mfD
X-Authority-Analysis: v=2.4 cv=eOMeTXp1 c=1 sm=1 tr=0 ts=69c50575 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=P-IC7800AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=yKxla6SPEuOvPVJYePEA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: xiXqzRP1eCpZYhiqTcawWmAC36048mfD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
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
	TAGGED_FROM(0.00)[bounces-35498-lists,linux-usb=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,bootlin.com:url]
X-Rspamd-Queue-Id: EA98733305B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 12:31=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On Wed, Mar 18, 2026 at 09:36:41AM +0530, Swati Agarwal wrote:
>
> A nit, subject: drop second/last, redundant "binding fir". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetre=
e/bindings/submitting-patches.rst#L18
>
> >    reg: true
> > @@ -26,6 +27,10 @@ properties:
> >      description:
> >        The regulator that provides 3.3V or 5.0V core power to the hub.
> >
> > +  vdd12-supply:
> > +    description:
> > +      The regulator that provides 1.2V power to the hub.
> > +
> >    peer-hub: true
> >
> >    ports:
> > @@ -69,6 +74,17 @@ allOf:
> >          peer-hub: true
> >          vdd-supply: true
>
> Here and in other cases you forgot to forbid new property (: false).
Hi Krysztof,
My v5 patch series address this thing as follows:-
https://lore.kernel.org/all/20260122092852.887624-2-swati.agarwal@oss.qualc=
omm.com/

But as per feedback from Rob on v4 and v5 series, i address it as per
his comment.

https://lore.kernel.org/all/20260122170651.GA2632938-robh@kernel.org/#t
https://lore.kernel.org/all/20260121022449.GA1804139-robh@kernel.org/#t

Let me know how we should proceed further on this @Rob Herring
@Krzysztof Kozlowski .

Regards,
Swati

