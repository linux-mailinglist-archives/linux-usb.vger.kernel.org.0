Return-Path: <linux-usb+bounces-32897-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBE0AxfXemnm+wEAu9opvQ
	(envelope-from <linux-usb+bounces-32897-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 29 Jan 2026 04:42:15 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 63626AB7B0
	for <lists+linux-usb@lfdr.de>; Thu, 29 Jan 2026 04:42:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DCC70301ABA1
	for <lists+linux-usb@lfdr.de>; Thu, 29 Jan 2026 03:42:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EDBD35CBD7;
	Thu, 29 Jan 2026 03:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fn9kYlC3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31121DDC2B
	for <linux-usb@vger.kernel.org>; Thu, 29 Jan 2026 03:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.195
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769658125; cv=pass; b=SARdASb8WURoLV6kKK2ywJMPnv3p8AThw+AsEWMxaBSxr3J/fsJTKDFgzVkhSAZSIy7IP139FuWD4W3YL0mo02NpJVbbvrsZ9/4seNIqtGcFdFtq3e3Ldbgogw1CBjnkt/eslHfngq8LR5bjpvOHJSLlmetF2EcfSOKdkfpnPmE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769658125; c=relaxed/simple;
	bh=BT2aLvHHSiaAITvo5ZaHcBXI+mS94zT/sODXHEZQDII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uET2emhAFhBlX56yJUqXofTRXs8LVHQvNI1qY/TMKVJdtR1PCPWY79zyyW8QZ9vCMedRqnI96qYq+FJ15Tr5YQlO35Ky6fjNUnYLJLctP/8HigooK6toqMa47a0bfVjBdM+oZD/sQP3lQCr+6DM4G80YpJ3Am+2U+3R+ALU0tMs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fn9kYlC3; arc=pass smtp.client-ip=209.85.160.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f195.google.com with SMTP id d75a77b69052e-501506f448bso3636751cf.3
        for <linux-usb@vger.kernel.org>; Wed, 28 Jan 2026 19:42:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769658123; cv=none;
        d=google.com; s=arc-20240605;
        b=PLmr69mi9kXTYqynN5KjTM+viTLit8cfpGswsDlJ6m8yz8MquxggrR4johyUfiPD2U
         zjIUHBy4AbvAA5O2RY2tdknU37S+AmLMsr/lasxJ1CyVeW8+DnyR16DwTKEXhvx7PI/l
         Ix1iANQ8UaGKvOCXwhOwg2F7rPqAxMXvNo/TT1l5a+OqEoZDpH+Q6pvnsv9Y7BFAaSC5
         wQSELNbvgcfF466awYnxHHwe3Vzyw7DFaz7+tJYFA45YhLZ9fPQLWKE4XZzii6qHbAEo
         +qESH9ssQABotMedupUVTDU7T7BgmFPuGKuEQog2dHGShRUY+yWCE8mVqhw8kTT87mR9
         0bsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BT2aLvHHSiaAITvo5ZaHcBXI+mS94zT/sODXHEZQDII=;
        fh=/p5HxER2KxfvG7bfN8uK247cpqmtiUa53ESU6UHTSSM=;
        b=EEv51+wJpEafz7VioZnVXHNKHj+rCLfhMjlqVi03g866JLo2RpkObHKg4O9rmCWUyV
         pCrgAZq1wYilNTiRspJaI7KN/LVFOpucSxGzqjxcApooMpN/vEJe2H9IUgChgu22qJ60
         +vHCdMMy25yjyocUtKBxo7TQefX3Q29bqDl4mmFRmWL2zYBt/AbswvxFy33yTO0JAwds
         +MnSQPHtVgosPXuT95aKpKtk0bAEBlfn4iPAiSpKixTuiM6zEYL1DqzpQQuo9Vv1DYam
         VFuLK5zub0u7oFTJFhDtwpiIu/9yBy0oXLZQSus9vLsSKKVuI1yDLPad6wmsViFMQFpA
         nlmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769658123; x=1770262923; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BT2aLvHHSiaAITvo5ZaHcBXI+mS94zT/sODXHEZQDII=;
        b=fn9kYlC3aHIDPccHOVfC3WQ+dbUHOteDGSp8kQy1d5LSUh5kIOl0kXcapdLsQGdgHf
         yLQyzi63zw+XBff6XK5sO5h8cfek8/tKhe9jTyJFwYVON6Rt3+sDnAQ8Xwy3fxbh16cM
         pKq4DLi0CqXNHLNdwKWrKRikIU35IOKFhOMRlBNny22N5IbFOAOHTJFQ550s1kXAS+Du
         JV9xWIOKk39MosOA2Vz96XGJjUwjruE9sMFrf1RCcLY+iW0i2D+AnM0LRyndaEBl49ma
         SJoXP2iYQJPBoWaQOvKzBECjBHz5OBoOR3ovHNi3eGJO5HI8Q+f7auPqejQjXUB95Wa5
         ddyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769658123; x=1770262923;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BT2aLvHHSiaAITvo5ZaHcBXI+mS94zT/sODXHEZQDII=;
        b=pUwR7ChcVLjkUFxMHsI+dqor59bib8pTUqtY/9M9avBa1TcxwHnuseVtQuNQ0E7cIa
         rNUTazNZAwUcZEGCRW2HLc3qFbq2suJY8f4CXlv7TNpoQw7QTGQWokLMtH/mp9FttMXJ
         mju7NYPO2ZSyya1gOzFCYLKUWqch9pV4NndOMpeAYKwMIaOSSWLW4dr+qFHu6H2qGVZX
         8lhDbIacfp6Z9zAsvGHZF2SymQVvCe1FSEiict9xkzIyYLUt8K2HS/CpnLt5g9DA8fTQ
         ZKLDNYj325GjnvWZl9QNDMSR+z+I2PRf9HG7D4avtT4cAnIGMhe06A77INXM7KFP0ZfX
         TcSQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6biGPIosG9X4WiXGZFnGy4NXlAnD00e/8xUC66DyuXtlbGhQmMCTxk2ph1acvPjg0cDkeEffUNo0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSsm7Q7yGgXyC1Gn28UYu9WHjPXKZhgNW6GpwpD3XHMAhvnwxS
	Ss45VLzPlxxJDehHN8RD/9uEuR4G9JP3peeik6T4Er+5U4LVXz1eZHn2l43VV2Ef5PItkr3cXy7
	a7itawIM2qKFp4hDds1DS2kwm8BrGge8=
X-Gm-Gg: AZuq6aIraApiu8/ySnLGCRODf7kw3fA3rx7BbaeQhcmSJLqCpTsNYBPTcd72/5bGhLC
	BEfH9QwNYgK0IKZV7hXq3eQVA5IOZdsM9kcOJtFbJBcgj5EuqZ9B4V3EJTK02V947Yry8memsnC
	6ohQgIJpRi0//XWbQtepCGEXJPRSgT/ojqt0FRwLZlXO2rUCG87d6x387Iru43KBik+cUQR4dJo
	TkJr7mth6PvfDUSYkO6BJGFsvvJKYYzj4BfGJ81r/1u+o+lewNEeFadRQ0JsFCrIhUn4rfESMAo
	8gOub48sOGdfJcqRmD3c/a5RkJjC2IsyE0Nn+itWLRVMQHnvrbATsXm+
X-Received: by 2002:a05:622a:44e:b0:4f1:bbaf:c5d3 with SMTP id
 d75a77b69052e-5032fa02866mr98189661cf.59.1769658122607; Wed, 28 Jan 2026
 19:42:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260125083501.34513-1-enelsonmoore@gmail.com>
 <20260125083501.34513-4-enelsonmoore@gmail.com> <9239ddef-c197-4fbd-8e88-691766bda3e2@suse.com>
 <CADkSEUjgRrC9eAQYOkaErd7wyXKkUs7+dG+Q1jz7VbqF+zxwuw@mail.gmail.com> <314effcc-5bf2-47c5-9757-aafd5b47fe65@suse.com>
In-Reply-To: <314effcc-5bf2-47c5-9757-aafd5b47fe65@suse.com>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Wed, 28 Jan 2026 19:41:51 -0800
X-Gm-Features: AZwV_Qg07bQCnu--MS7f_wI_CqnIpNU4ub0DGn0BDCXHfvCSOfyFVLIbfhWi6Ps
Message-ID: <CADkSEUjk3uE+vMOPw0u7MOc4+AN__LWsriWA9fVhm2C35gJ6MA@mail.gmail.com>
Subject: Re: [PATCH net-next 3/3] net: usb: kaweth: remove eth_addr_t typedef
 and bcast_addr definition
To: Oliver Neukum <oneukum@suse.com>
Cc: netdev@vger.kernel.org, linux-usb@vger.kernel.org, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32897-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[enelsonmoore@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,suse.com:email]
X-Rspamd-Queue-Id: 63626AB7B0
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 1:23=E2=80=AFAM Oliver Neukum <oneukum@suse.com> wr=
ote:
> yes I am aware of this. Yet there is no point in breaking
> existing setups. I would prefer this driver to get only
> clear fixes and adaptions to changes in API that are absolutely
> necessary.

Hi, Oliver,

That is exactly the point I was trying to make with those statistics -
I realized cleaning up kaweth was not worthwhile due to the lack of
users.
I wasn't proposing removing it; it is simple enough that it doesn't
really cause any maintenance workload.

Ethan

