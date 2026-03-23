Return-Path: <linux-usb+bounces-35302-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FkyGD3uwGm3OgQAu9opvQ
	(envelope-from <linux-usb+bounces-35302-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 08:39:41 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C665C2EDAEE
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 08:39:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4ED63303E2FB
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 07:36:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11BBC361DBE;
	Mon, 23 Mar 2026 07:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FWTZeROD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CirH1nMX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB7A35F61A
	for <linux-usb@vger.kernel.org>; Mon, 23 Mar 2026 07:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774251411; cv=pass; b=aXG5l13RIV12Gehcc+5IA0bsC1aP3xWrvIwCkOxw3qirqUd0xeuH/2TQJnckHYsMZtaw9WRmYu1qdes6CeOWbKbiy8LtX1F4wkUeG6W5Qwb6ESnmLc3TtNJmIcWLrxOn0zcEIHYHyKULjMFkHkNIb8jYliZ1OqcUsn+9MMTEblc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774251411; c=relaxed/simple;
	bh=dE3eHD/xH3GbKQZD3wXfKMDB+XRJOlJRRKpaBH+I6gg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H6mEsX6sU0ShGjuBCXzchkYdKJRR4z+2nbovdqOJEEKo+XKLi79Gljzn4lIkb9SliFBLXr0h1/fmmYvqI4DBp05XmfFzi0d9lQzPMbjFqk4ufG7dHtavl9+NhnuHX14kZaIdCJ5zDl1Z5OWtZI3KG0Md64YZl2PyiCxBtJlCdFs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FWTZeROD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CirH1nMX; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N72lmX3295180
	for <linux-usb@vger.kernel.org>; Mon, 23 Mar 2026 07:36:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dE3eHD/xH3GbKQZD3wXfKMDB+XRJOlJRRKpaBH+I6gg=; b=FWTZeRODWjifBRIm
	Qt7LIqjlby6QBv7fVstfT7yzb/FCwWNXnDBzEHoTkXmMzz5bS7hZECFF2Oyqf9JC
	TpW4xcJB7J64UXQDwIuVbWWQLh6TKLYzUZELLsLsFB1CN7ZrWud8wUN+ruWiXndZ
	ddiwhvGKv5euag37IWPj2vc1/KAL8oPTgzftbUZSkHcyAAlQFh9M+tnvxV8wsPGq
	LECKqFyk2o8ZsREkUM9sGFoQS2PNmVuJLxC2u7RZawBE5JwAR83f0i3QN+L32Yxa
	/fLf6Jm91hhxD6V5iUgRh/plBiqO1M5xN/zT4tgWGr0WMA95LsvfvrYGQutj92pT
	I0BhRw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d2ca8j92c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 23 Mar 2026 07:36:49 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89c514077a6so255057106d6.1
        for <linux-usb@vger.kernel.org>; Mon, 23 Mar 2026 00:36:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774251409; cv=none;
        d=google.com; s=arc-20240605;
        b=K/J5yooPd+6f1pvDGavEZe/q0N26M8koELcyGKqcGtPJ3mnFRl1kKt8dlfWkQ78Jg1
         Ps5gmWjX9hEOOMkBdkVnYL32tYEyQyUndK7ZDtZnopBBHQkitw1id3jZXJZ1rHnLzO6+
         pMax5ixJx3yMcAfsJqz3pB0rhYr8cT03i25vDBwNBZpxKfi3eB2Q/XOTsIy8mBabk0il
         wLusNPmtbzuIwiTxrkq4aL5I9gFckDRBKqNUdqUZOkK8yler6T7DAnkf0RaFRyv2kyJl
         W0fQN5/52S+tqsii7lZnMybOP6ahGOI+BVNGPAQh/wPZpNAcfPEMhcgByqcVQbN6HEJt
         qz8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dE3eHD/xH3GbKQZD3wXfKMDB+XRJOlJRRKpaBH+I6gg=;
        fh=LuVt8RkYoeZEiLrJWqxGxo4IFfmVsHiWU5qGBG9qd4o=;
        b=dOSjAlnkU6jGnE9VODj8FBE/OMbjaRC5AyUgtaN9BlN1XhQMb7kQIMskRruFipefZp
         dhcij+S+oKnT+xThjYaViOi8GpyFNPCHX2L2XMFyqKdArRpyapEDuK3i5EumTu2u0Zlj
         S4H9Ml36B/NCpDu2ep7d4iBqhCqAIn+CG4JYjY5CRqjmkhWEZhi3W++DHtCaz1ij1oLq
         pUgLdIV1OoeDl8ajzCZ1ifhKd/yaltZC2ToiopKwb9K9IK5nyQpsAH6yzGeaYTILAUM1
         /96Yq5fwU1YHjOkY++M+DeYOFQkrjnWal3mpjo19+mumwFkZND6cfofr7BIMLpjO35rn
         0Z/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774251409; x=1774856209; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dE3eHD/xH3GbKQZD3wXfKMDB+XRJOlJRRKpaBH+I6gg=;
        b=CirH1nMXtnzg2jAONlFvQDjpggNuKvyE+jS94pZOzkG6g6kzP+sFJp8CjtIxnLe5li
         yN+MbrJcjuDzwBG2t8BN/HbBk5mM0lLtO6gCe0NdBtd0508zT+DcxKbFM32iXSuI47XA
         hB1jzAMNDuzJFt2bhaUsS/dUzzZlrS4DFzW9QCZ9zQs94p+IvNleXg34R9AMIS5jQBd1
         qTBoXBvB9pztqMo5ZFT7nR1AOesxJmnFnqFavX1KDX7kqw1ru/IY2Y+zTijiGqzggfUq
         MB6wYCcqazH9sRr4KTEVY5dLcx88i8hvDjmEBYyZJ44urY+e875Wrdj7cjdAvR+eTQoi
         lBDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774251409; x=1774856209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dE3eHD/xH3GbKQZD3wXfKMDB+XRJOlJRRKpaBH+I6gg=;
        b=j+bWtoyNdUXXJN/3HXt35FLE/UmrfSX37gZufLFpvRtJMg6xc1SiBxQRaD3tY/2te0
         mJSlRVkb0qrxOkh2E65gmPd6faCMYaeUNFLOxkOvysSDQpDhlcDkjY6ao2r0i9JZQWbr
         PtpTharVmH89gATeaDBjIiHiv09gsCgVdRJWdjjixyl6QK8Fi547VqEmU4H7R73dXVoc
         Ptd6sYme2BhbXllY95ZoOEbelz+0qek0SV7HLqtQuNA3ASVUD3dPdxMgQ3JbyWZvRAV/
         9v9H1xhvQ6dapO/W+ym9dnfF8dLGvN8DSWgCVC0sJkNyTPXgoW+TxzSystemQDLUGq7e
         RPBg==
X-Forwarded-Encrypted: i=1; AJvYcCVsi1/YDaaTEZcPlpjOc5zLXJ/udFI4cVFkXF+FbpVz00PW6HjfbmjT0Y+rU+J5E8t5LSBG4G2w1wc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTpEWY4QLA5bflyYB3hsMjA5kpgqAqYQ5I2x8dgPPJar3sWDKN
	VtrZFL9YhQxKR0sHiNhDztVj52K8AiRV1zQlbKjwNpHzsWojACFKeDJhQNsNyRZ7vC/XkmxmN/A
	dOTXT9Lr7GNCDpsrdYr4YfOEZ9IKNgNZBCtdf8i3jjEGCdz9T2xvrlOhlJ7TkuP4Xf6dShNvXWG
	piKZUvZ0gMAwiT1eKHXwC9RVE/Bn7JFCK+L5h8jQ==
X-Gm-Gg: ATEYQzyQVQ4BIUYL+iZTdnp3Iynj4+nu6pJ/pElbqhoXmn80dCZL6XQQ1RTfHcxxhnW
	WmADDOxQdXE41C2jAEQqFn2R524+liJHkO4NArqwONQ6fb86cfj6XwsN3endd6pc7VyIXVxDtxZ
	p3WqwmDkhJpKNQp4PsGA28iiwbLbzsjuITi/w/7nZcXtDRayy1VdVovE8aYtEBII9MGuV6DJnwl
	G7LDiE=
X-Received: by 2002:a05:6214:5984:b0:89c:5f6e:451a with SMTP id 6a1803df08f44-89c859e9734mr188298266d6.21.1774251408773;
        Mon, 23 Mar 2026 00:36:48 -0700 (PDT)
X-Received: by 2002:a05:6214:5984:b0:89c:5f6e:451a with SMTP id
 6a1803df08f44-89c859e9734mr188297976d6.21.1774251408357; Mon, 23 Mar 2026
 00:36:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318040644.3591478-1-swati.agarwal@oss.qualcomm.com> <20260318-neon-vigorous-prawn-dce7f3@quoll>
In-Reply-To: <20260318-neon-vigorous-prawn-dce7f3@quoll>
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 13:06:36 +0530
X-Gm-Features: AaiRm52HLt66wHK0FqCRZAm7RWW-bc3MWhfzPCBrm6w6z19W9eTDZ_q3Njv0RbQ
Message-ID: <CAHz4bYvs9mnDwfkfjkebucZSQpugEqr6+sFf1-hgzNO8SodzQA@mail.gmail.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA1NyBTYWx0ZWRfX/2RGednWnVio
 Ed/I5/Tnt7paVRXoPZF6gfYrwPK8AFlJJ2xpaFyIWPpdSj9tSDZ78AkXp9yEIywyVnFK9TIxPP7
 3fNDKi25qY9RZfxoTnNKxAxOYwFrjEKnChH95+RYYiY/vUbv8YAxeAgPOj3LqNNfP15zbqli7qu
 AHqONCcIgYX4iJztqBMFQxMbkexdcqBhOsnZlabsdo8EhI1OLh03cCjbZk6zIWvDbnAsrB9HiiA
 rjNF34eXxKxvpafPAW6AUcE4FPSFWUoGsSZvkxQwYJk3sB/Pl1j7KRFLlDYEe2N8IeEzQJ2N468
 6BluwnQG5as7SDV4DA3nA0wtxcpCJzx7QRDRURzaG4WBhIfl4Mc4zyMzMlQQ/wtgbmwkTFWmGSY
 hDx2XAoGCOho/WKF6ID8zd/zB9jtRftRDQG/PYszsSHQUOCkVQwAHFmDGKPmjdRxXpSu5jB5opk
 Y71eKizjqTvgOF7nvHw==
X-Authority-Analysis: v=2.4 cv=cf3fb3DM c=1 sm=1 tr=0 ts=69c0ed91 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=pPiH1uhGe7me3s5KK7EA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: 85UGdX9TymJAC_KIz0C6sw93ZTO_nLvA
X-Proofpoint-GUID: 85UGdX9TymJAC_KIz0C6sw93ZTO_nLvA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230057
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35302-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,mail.gmail.com:mid]
X-Rspamd-Queue-Id: C665C2EDAEE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 12:33=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On Wed, Mar 18, 2026 at 09:36:40AM +0530, Swati Agarwal wrote:
> > Enable secondary USB controller in host mode.
> >
> > This patch depends on:
> > https://lore.kernel.org/all/20260306091355.1178333-1-swati.agarwal@oss.=
qualcomm.com/
>
> Honestly? No. Drivers cannot depend on DTS.
Hi Krysztof,

Here what i meant by dependency is that I have rebase this patch
series over below patch series. Below patch series is related to USB2
micro USB controller support on lemans EVK.
https://lore.kernel.org/all/20260306091355.1178333-1-swati.agarwal@oss.qual=
comm.com/

There is no dependency of drivers on DT.

>
> Also, combining here USB is a no-go. Do not combine independent
> patchsets into one patchset.
>
> I also do not see how you addressed my comments from previous version.
> You never bothered to respond and I do not see them implemented.

Apologies if i missed replying any comments.
Regarding your comment on v3 series below:- GL3590 hub used in lemans
EVK requires only 1.2V and 3.3V supplies for operation, confirmes the
same from our internal HW team and update the same in thereafter patch
sets.
https://lore.kernel.org/all/20251220-economic-gay-firefly-1873a9@quoll/

Regards,
Swati

