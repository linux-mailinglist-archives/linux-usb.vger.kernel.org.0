Return-Path: <linux-usb+bounces-32620-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFEZH5b7cWmvZwAAu9opvQ
	(envelope-from <linux-usb+bounces-32620-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 11:27:34 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E79653E7
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 11:27:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 96DDB4FA2C0
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 10:21:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8116425CDB;
	Thu, 22 Jan 2026 10:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hkfIYQnN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB06D1B81D3
	for <linux-usb@vger.kernel.org>; Thu, 22 Jan 2026 10:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769076982; cv=pass; b=CLbab8S/omBSqlH86ugrGJUwqxRRXIzxpDoIrLVirvzGNW+JEs7+aP8S4cT9VP679jqoH3FpK/eSEoUiHcj6hezPxWqqkpadJiYwSAcJLc9E9GoBz9cY5Qv2tXKU5arry6q9F3kw8w4Dm31cqUZY2bhEuWL2kNiE4VbxRIQaUNI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769076982; c=relaxed/simple;
	bh=s9tqoB/cbLZ1iTV1D/ZuZzApE9r/adjnSteJr+92cZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MkBoE6sNoSP2L/hCSH9ri8HulApDEhA6mS3IE1jJzYHyGEOxyazBUtNqoHui8JsEEfJ5b3InYDZkzLYiv8cvlgyHlBHGYiDgJCFUcZHaTdHZPkvtgonp2/zKPjq9JwM+bqfZAYHcMrb6kqKjidVAJGVwk3D3w6M5osNcWPOg05Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hkfIYQnN; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5013c912f9fso7780641cf.2
        for <linux-usb@vger.kernel.org>; Thu, 22 Jan 2026 02:16:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769076978; cv=none;
        d=google.com; s=arc-20240605;
        b=exZVnN94XjViXgXZBogR5hOdNDzRVbRZIxk9NrTqOhB/d1oW7MRk80EqbfL/wUFb0+
         hoHQlGz6oE16lI0i5W+z9mgVmVh5ugtCiWyR8khUoqrLBki99XrrvbFpUnD9mAXv3siq
         FYv4o/k4w95X7qymWDcsia5GvNFGySpHYxYLn5JCh7BUAGcOs0gibGOG0YTStnmzI/Hx
         k3UWWAWyvA5kc1iH1ZFTMo5jwMlYPIo7NvKiAZuZyc/wV53hRtM3aYDUrpcKRDiEdM6R
         yj1tWyHFRIfJ+FwBL4/bUfEStxs6rclomQH0XHXgmecrZ2njduGx3wEwrx4vzQDNMEJV
         qpTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s9tqoB/cbLZ1iTV1D/ZuZzApE9r/adjnSteJr+92cZI=;
        fh=cv++AHJbSqcGy0wCuqOke3fO00RYylArp/mST2Gm7bw=;
        b=OdKr9ZcjaMLfwkwpiK44zW1JsTOtKqdn0ussTGn5D5e5MJKJDMOM9QN844BTvjUIOX
         Tjx1wSOWYRFiKVuBeYVGBo5CEXnLfmqJrkTt6+mfENl3iToYc7r6RKgK2vqyJuryPIat
         tt+GiWj2ONSiy2D2ONOEQgdH+qwi/RNu1miLoxfPJkZvcPv3o2zEnBn+gIaP/jY6K+uV
         twpnF2HIwdftYmWEq1ueP8cyP6uWI34FrMSbpoFJl2F3phyQjVCOpQkoZpTBZBTKnfdM
         EqonMBABnpXPSsd/0L5YR0U9pvptNBtiEbiRLgJHhknlLx6w5YnKVa8PbpqKJZFfiVjz
         teIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769076978; x=1769681778; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s9tqoB/cbLZ1iTV1D/ZuZzApE9r/adjnSteJr+92cZI=;
        b=hkfIYQnNdAoj9N9KJxUfYAKkZx2rFPxUc9534UtCCI52EU1vxRCUBfATt6J9eynOTC
         2g5UW/jGcCT1Zqphq87JbOd9eA/NNew0AakH726p6NsYVlFrBOXSSX7ACjAlWmFEA67p
         m2PUJsWeIbPc/Q1MELCT36MouHNqZWqI3I23URp3JpnB/ZsRYNahy4LX+PBDc4GyV9MJ
         xstjFc6ePM5nqd/L/VnrAEZG9AeTJAO3CTVoyn+HxDW8MUTsAklbnVQHV7SUewRqbYIA
         mw13JayhWq87UX9sZ5gwuiHhMRzbF8IfMNvDbCEotdcXKDj9c0gQ/ywpdOTIUCZRqHvQ
         9vkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769076978; x=1769681778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s9tqoB/cbLZ1iTV1D/ZuZzApE9r/adjnSteJr+92cZI=;
        b=I9a+yJ32W8WtZ7ov73BjToFenXTZJ0t/lbLLnfg8/eO8GBSGONXH1gFvlQxhlglHAQ
         asJp6+m68Atd5QnsHhOVYkppBf0yqy4RkwatmQnF/WT1WYn8PXUuXCTK+cB0Jk+tEpOp
         cvC3DUdGc03UFoCt2gj61+bfqrxIUjyqezfPWlUHP6DaPCexkU4pOhf9OyqbA/eJ32MG
         yziU2/7qEgGNJQkKD7how7vMp8AmgbQ36dJSMPV8exhzG6blu8ggZSSbaFLpLlBvYIgw
         hTg0zJ3VzPaqD0/4bCM+MrLSPB/lmVzzDXJFynEfBpStfEwJoUfyhCi+Pk6HzZQLKrHE
         tTxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVu/nAjPL5UcpvAAJbcEpRQJDzmLAEIbL85+mrHX8daKeDPKV+K4U8QxIvRrRsRhGAlnoLirfOJtRM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSBwv0MrKtfMAjYrOA2yw89vR2sVFxBCzTsNiqeXZMQqIqvAwv
	6588Lmq44KDe+y9UB+Z9O8q5OPJobR/S5EQFO+kybRi54gIow6qrnQC7M2D0w3aq/4G5JkkSH7c
	bYrcfJ29Bq4wnAFDayI0eOm1ARQEcyw==
X-Gm-Gg: AZuq6aLlQ4Hm3pefzdk555cTQscGFPaUit8TMMRBOi/M2S+rWTrq97MxMqwAYA8871Z
	SSnFCXHXqfefnFp2l1mdpMcvM3jPwXOfkCNPruuEQUK0/Ksd0pm+1pNjS9Z4HdLnxzdMWM8kzNS
	tir9dtPegvT5PlVW9wNUYPEoCHJR7VHyyyVJB7V86b/9e3OxwR/Gbcw1+8cFBjhOQwqVBrLmEqc
	CmsIYgGGZxxiXGi5IWsr3BRzdkOqe4zt5Fa8emsFX5Kv7QOfBeoqmyjRFUF6Uz1StjZRg==
X-Received: by 2002:ac8:5d8d:0:b0:501:4a67:971b with SMTP id
 d75a77b69052e-502a1e3bf18mr287775021cf.36.1769076978228; Thu, 22 Jan 2026
 02:16:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121203944.1898-2-qikeyu2017@gmail.com> <2026012246-yeast-attempt-1ca1@gregkh>
In-Reply-To: <2026012246-yeast-attempt-1ca1@gregkh>
From: Kery Qi <qikeyu2017@gmail.com>
Date: Thu, 22 Jan 2026 18:16:08 +0800
X-Gm-Features: AZwV_QiZTX4OFxqObb5yNEoPi40Bd-NImbnswG1uvUO-WlQIODwEgF2JiMyeb8s
Message-ID: <CALEuBanDC_8YfPsbh6P-S4aBwih3WqofOg+3oN6PwF+noeyRdg@mail.gmail.com>
Subject: Re: [PATCH] USB: gadget: validate endpoint index for max3420 udc
To: Greg KH <gregkh@linuxfoundation.org>
Cc: balbi@kernel.org, jaswinder.singh@linaro.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32620-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qikeyu2017@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:email,mail.gmail.com:mid,dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns]
X-Rspamd-Queue-Id: 11E79653E7
X-Rspamd-Action: no action

Hi greg k-h,

Thank you for your response.

I'd like to clarify that I found this issue by performing variant analysis
based on commit 7f14c7227f342d9932f9b918893c8814f86d2a0d ("USB: gadget:
validate endpoint index for xilinx udc"). That commit fixed the missing
endpoint index validation in udc-xilinx.c before accessing the endpoint
array, and was accepted into the kernel. I searched for similar patterns
in other UDC drivers and found that max3420_udc.c has the same issue -
MAX3420_MAX_EPS is only 4 while USB_ENDPOINT_NUMBER_MASK allows values
0-15, so both max3420_getstatus() and max3420_set_clear_feature() can
access udc->ep[] out of bounds without validation.

If there was a previous discussion about this specific driver that I
missed, I would appreciate a pointer to that thread.

Thanks,

Kery

Greg KH <gregkh@linuxfoundation.org> =E4=BA=8E2026=E5=B9=B41=E6=9C=8822=E6=
=97=A5=E5=91=A8=E5=9B=9B 13:32=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, Jan 22, 2026 at 04:39:45AM +0800, Kery Qi wrote:
> > The max3420_getstatus() and max3420_set_clear_feature() functions use
> > the endpoint index from USB setup packet's wIndex field to access the
> > endpoint array. The index is masked with USB_ENDPOINT_NUMBER_MASK (0x0f=
),
> > which allows values 0-15, but the endpoint array (udc->ep) only has
> > MAX3420_MAX_EPS (4) elements.
> >
> > A malicious USB host can send a specially crafted control request with
> > an invalid endpoint index (>=3D 4) to trigger an out-of-bounds array ac=
cess,
> > potentially leading to information disclosure or kernel memory corrupti=
on.
> >
> > Add validation to ensure the endpoint index is within bounds before
> > accessing the endpoint array.
>
> We've been through this before, please read the archives for the last
> time this was attempted to be submitted, and go and fix the tool you are
> using to find these.
>
> thanks,
>
> greg k-h

