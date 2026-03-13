Return-Path: <linux-usb+bounces-34762-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMT3Bu5StGk4kAAAu9opvQ
	(envelope-from <linux-usb+bounces-34762-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 19:09:50 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7363B28885A
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 19:09:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E8177307EEE0
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 18:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F7503DBD51;
	Fri, 13 Mar 2026 18:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qpc4cbrb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eiLrf7c0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745733DC4A3
	for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 18:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773425365; cv=pass; b=BHhGuvTaWqXepUUpt8f+6WioHPjRc8yckGpLfnhYDk21vWTOIjgKlKuSYRGKm8OqscSC2CXActwxE0BnqZkcIhyMAicD5WHEjO0L17RWusFIeXRHcTHI5giYuXjge/e1RkqufMkKWfB3vsYeHnOkoF1/vP4UHYoZ/XavEGSUk+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773425365; c=relaxed/simple;
	bh=CM1/OeBtat5GnDJnc885RmcomrM2RhrQAwi+/VztlrU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p4WXFfj3tGOOelRsfDUDdVI3d+sF3qm+M6opqjpRLiSIVCaNFXO26PSsnyofOotjG++eWu2hhzt0a/y2a8ENKKlZzjSKjA6XFx35DGLv9pEwI1f3T/7l7RnapS1TJEp+gs1t8jh/yYpyQIvz6ni8rBUET7cATEXvleWUubHssyE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qpc4cbrb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eiLrf7c0; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DFXGa7437740
	for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 18:09:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6tUNwNgLtGLEP11l7mDOQLsW
	5fjth3Q78+rTCRsiYpM=; b=Qpc4cbrb+8V67fxcD3WHQK6H/nTnzVdFYglgzj3X
	hLwQD9MVKYI4wMhafhvbblOeObAU+5Isvlf+7Kf1ZOGLFcJzcs07IhgsLDXtXwkf
	dgQGM6mTtBGCuJ02DXdBLr5HBd352roMYUcKuBxs2kGdqcNLNYm+MCMH0r14ZddJ
	5oO5+M6Kf2o2GFB+ljfksG+XiA+TYk6FsC3tYIiXCJmXunyvjVatPHbVw8zEi55W
	9M1uuFaMd7Qo3DToo8MQyU/DqXTql7bSkD0M7mjbsu1jd99ZOKP1HBxeKzJfWATb
	ZxLsJnwJN1ZQ0tlhhkjd0vxP8YsmQ/v/jmXTPuRxvqkIjw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvnax8j6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 18:09:22 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35a0ee0fed2so2076377a91.0
        for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 11:09:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773425361; cv=none;
        d=google.com; s=arc-20240605;
        b=iZTYZlYPl8nZABlQ15cPflQqwhnIeNWVInD80Rw8gbeojKoBK0sp2gPXXIi3p1vePB
         Lk+MGBHxCDEU08xSAv3QbIrsYmaQy0eEoINvkP5mUk1kmpS4930KfaS2J1MyZYOk/uho
         4LE3MlPKao5/EtBKzbVpRKjFFpIot0nP0DBOHf9HKH4pu8tnO10EATpJlFvmWrEh/Twu
         ckJwUStuVPm8JgugpMTYVMAsAp9GRQdC1n7irS8y0A+b4/DPSd5Omr+R/CcnE3EN/Lzo
         YQSd59Z1mo60+JZmQgpRp93LrvuqKA40X99s+K5M0WrLspyB2QrsaoF1lrohuTOWSPnl
         x9pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6tUNwNgLtGLEP11l7mDOQLsW5fjth3Q78+rTCRsiYpM=;
        fh=sqRsJCqwYjE1l8heNuhrj98gHNN8zqG2y5Doev+WXxM=;
        b=hT+eU1yuC30Z56eAlK7W5NcrWerzSuUVk7mjjnSOqZ8ibOyO5jXAqTN8RRmJRONdC6
         VKmG8YAnrYZoS1kdqw3LvuBwWlsPmzeoX0WBHouTvdIK02I5QZE1cp3YJyKYXhi5X9ot
         /XDz0aYpMsjrX8a1KMzA6sruEOrx03wIzInRfxND4yfM7AONJ2w6aJExCttWo/7iKCHK
         YJONJ6v7kIkiPpnHUe49Q5EUfJ8w8fT3e7CMzfGh5C5d6uargVhbzlmPxuGM89BuU0Po
         +QhTCzPkyH6FRsAywVvYsi4v7MxX8Ne2Z6FI9sN9OD56k9HWwvNlVoQx9fVxgGtD/FQo
         YiqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773425361; x=1774030161; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6tUNwNgLtGLEP11l7mDOQLsW5fjth3Q78+rTCRsiYpM=;
        b=eiLrf7c0A61mC6d3z6PK8G/Fsr39X8vogTqPgrbq5CZ8R83lXl4jJPWX07GCdEHKhn
         qiEJ6s3q2p9Ua0m/4sh/Jwjxvd09t9sykZZpqbs5inPcungor9F2Tt+dU5seVF8988xX
         FRyQnndXzURPipulNBH+X+GdnzTBYAM/R16PLz/tiqt5z+Mmwu86Ommff8I/ij96O0wg
         1NG6f3cmaf8BLWYOz5b6kqaM/exe61bm5UIoGEuKRDGM+siipEwXrtAK9mu+zuWuoolT
         RMQTIcTCI/P5akQ81bXlDZSP0LKS9+eQFmpfleT08Kt5V620zQ5SjKykc2awUPY2iUQL
         95qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773425361; x=1774030161;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6tUNwNgLtGLEP11l7mDOQLsW5fjth3Q78+rTCRsiYpM=;
        b=itdhxg+zMBBMv/0EDelwtGViuvlPuN5/GAAxZsS7uREwJF2UsULYjsryvYaqSgBJ7p
         Xt2SSEHRbXebpLRH2VnQ+hztwwaAJfae2jTc7VIQ71oZnXL4nLed5EtJ6YiIWjbvEQt2
         vY5Uln2SsqBJSwHxaeL8ZfDls78p+61m9IVr6Vdnwdn766YU754Z6QPZrqOhQtcSFg36
         GrTsBxHc7fJFpnO2DqMCPdIWmLQRQPSzXnbvRmaoHeWMn5y/DaQIUh2r6oboH8sGRbkL
         Z/eaPy6Uh358N26ktji+gWmb4Eoo6XS7dAdoZoDj8qICZDp5yfirbLXIEP4Y2dOu6J+b
         2J7Q==
X-Forwarded-Encrypted: i=1; AJvYcCW05jQgd5MfW2w/mP6kOHCm4K6mZ0IEVlNwcALe88UZPzOlRRv3gm1nAsPl+PX6oT9UbJMCKlE7RiM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsU07W5H5HoX/ld+j6z8eEWANnFVJWbVeQE5LepCRddB3T+dhH
	vp81RF+9u0W4UauJaRYPzuxDb3+mjzl9Ulo1sVoCQtbhpf6RESfmxqeRaeLtz1HyibqhtfFXlut
	/u7rdDMbZWdbIWeRG0/DtGhlCa5bfQfRJeiJBxE3iIcCPd9t2JaNWCg/6okmidikRs1HtLR932r
	XBRCKUqBVgWyX0l9zh9em6IbvhpgmZGgh+P/fmF0FxH/9x6Q==
X-Gm-Gg: ATEYQzx0OwnL1JxgR3EV1qBs7hdNavb4EgIGqV1+aoOPuexNvEVvb0VgvsGMh1mxNwN
	sQUzVyWqUoERLslzwGiZ11OeIZ0/kS9D9pdYb+QbhypTdJB0m9MJuVe6cOPs8GZZPoRQfEgungU
	ZZ3uEGbnTJhd1yCC6sWUYPKlbsGqq7sBl+tzDQfEpwTevKA3EqoNrQtkdHg7gk1oC6mdT/n7w6C
	bqf7gQ=
X-Received: by 2002:a17:90b:1e45:b0:359:f2e1:5906 with SMTP id 98e67ed59e1d1-35a21e3958emr3787962a91.4.1773425360854;
        Fri, 13 Mar 2026 11:09:20 -0700 (PDT)
X-Received: by 2002:a17:90b:1e45:b0:359:f2e1:5906 with SMTP id
 98e67ed59e1d1-35a21e3958emr3787941a91.4.1773425360385; Fri, 13 Mar 2026
 11:09:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310-fusb302-drm-dp-hpd-bridge-v1-1-ffd41ef9afe3@collabora.com>
 <CABjd4YxCQw94qg30mC7a9CJWvYje_NrUkzw+gu5wzWx55SidEA@mail.gmail.com> <abQosjYhlkAEcTBI@venus>
In-Reply-To: <abQosjYhlkAEcTBI@venus>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 20:09:08 +0200
X-Gm-Features: AaiRm50E7HgSHCoCA92BAEMzmg2IGcPdzAkxmfqE6LouRti8ZKXAXfH_iOuk-Vc
Message-ID: <CAO9ioeUhJDAfL9Sm66vzZ0ifrBFAg6DJ9qXVt5Z5hUS2=renOA@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: fusb302: add DRM DP HPD bridge support
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Alexey Charkov <alchark@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: twPqSTak_zWPIJLoP5S4Mwj7exlMXaIl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDE0NCBTYWx0ZWRfX/LmsS625NzI0
 ilugtlijlAHPbxkSgk5EfqcoJYMyozGLpLGje3Z3H351y1fwsoDFMo3Fr4ss82tzSLIW9CTESG8
 XKv40pkDi/X6M0ZFbkNAgAaRasqHF3EINq1uJtfHeqqscpbHohnJAptWJGthjXW6GT4tSJftwPU
 hE9Ufv7ujBOUPSkPxju2MC1c6IQQjjoNSb3rtz9e86mTN1H79qBHv0YhJjiLyBOcuthBNFZpCVH
 jlYtdD3JDe6uZfL0NZCVNi01UhUgVQT8cVTRTAXu7XUbHXOnBzAdF1o7DUUecA8w8fDKkHKqouf
 tsmX59NuFj+Q9RGZI6rolb0bOmmM7W62dApVL3eCjIjHtH8OmW4ODLw7qWTRTRa1rxxTvk1Ucl9
 GV4VQ8TNIv2QJL/6jFY88jNmKrKXxpTlHkOKmWnMDD0NZ6VG6Onl/f7jqPR17gKbwjU/+J7WHHu
 7/z2W77h+44MK7K8jZA==
X-Authority-Analysis: v=2.4 cv=X5Ff6WTe c=1 sm=1 tr=0 ts=69b452d2 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=QX4gbG5DAAAA:8 a=4xobH3HWLgkHfRV-ek0A:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: twPqSTak_zWPIJLoP5S4Mwj7exlMXaIl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130144
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,linuxfoundation.org,kernel.org,vger.kernel.org,collabora.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-34762-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:email]
X-Rspamd-Queue-Id: 7363B28885A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 13 Mar 2026 at 17:23, Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> Hi,
>
> On Fri, Mar 13, 2026 at 12:15:08PM +0400, Alexey Charkov wrote:
> > [...]
> > > +       ret = devm_drm_dp_hpd_bridge_add(chip->dev, bridge_dev);
> > > +       if (ret)
> > > +               return ret;
> > > +
> > >         return ret;
> >
> > Nit: how about
> >
> > return devm_drm_dp_hpd_bridge_add(chip->dev, bridge_dev);
> >
> > Saves three lines :)
>
> The patch got queued already. I can provide a follow-up patch if
> that is something people want to see. Generally this is a style
> decision handled differently between subsystems. Your suggestion
> saves three lines and is more efficient (but compiler will optimize
> to that anyways). Meanwhile the version I provided results in
> smaller diff when more code is appended in the probe function or
> the order has to be changed for some reason.
>
> FWIW I would like to see this driver be more converted towards
> device managed resource and then use drm_dp_hpd_bridge_register()

This API is more fragile. Using it can result in various side effects,
starting from EPROBE_DEFER loops if it is used in a wrong place.
Other bridges might also get the pointed to the bridge and then
witness its disappearance.
I think in the long term we should remove that API completely.

> instead of doing the allocation and add step separetely. But I
> would wait with the cleanup until the 7.2 cycle as
> devm_alloc_ordered_workqueue() will land in 7.1.
>
> Greetings,
>
> -- Sebastian



-- 
With best wishes
Dmitry

