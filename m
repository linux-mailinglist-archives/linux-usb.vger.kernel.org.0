Return-Path: <linux-usb+bounces-36184-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EC5aFwio3GkEUgkAu9opvQ
	(envelope-from <linux-usb+bounces-36184-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 10:23:36 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D21323E90F8
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 10:23:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E84D1301A3A8
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 08:19:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9670A2E4257;
	Mon, 13 Apr 2026 08:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pj9JS6R1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B402C0274
	for <linux-usb@vger.kernel.org>; Mon, 13 Apr 2026 08:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776068350; cv=pass; b=fn7ys24NMfiWSnIfk0YmskLp67us4uAg3mTqYw9lpS17ZTxViqgJVoljrva8Yh5ICZ3CGRp2FHjZ5Zya9uGL0vn5CaiTsI477Sm9CdrXcrFxaP/Zh6Oo5H8ePOKG481+Qjy2Yrs0EM05D0W3S6VOeBvfEPCN5GYZKlH+8b/XuTM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776068350; c=relaxed/simple;
	bh=46HqDL6Ak4KSaYR2Y3K1vjaVcy3H4RP3peTsPTQf3w4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XH6q63sRb2g4jLr1SaB0XyNpa9boOJbwd7+SgviDqh6ssPllaUJy3bzo8HkdudWFeIOIewouyA0I1n2NmEILPau4GpgH6OI6+n7cucYkuXxnG2AfRc6fBklc6PIhvB6XKefWib5DypDeAPaJiAXriuKeAAvT30ah+XjkW1tN3p4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pj9JS6R1; arc=pass smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-651c7ddf514so665319d50.1
        for <linux-usb@vger.kernel.org>; Mon, 13 Apr 2026 01:19:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776068348; cv=none;
        d=google.com; s=arc-20240605;
        b=egsUGp9bWDq09SDQgX+nKTxR2+CEMVn5+ZCMbtsHOY/xWS7hdwQ2XFJaBYZ1miZAR7
         Xqon5dsj2Lbt/0u9atw1pTXK/K8TbiAh1QbgqdKiqzn6vakrTZjEurXRPgV+w6z5ITlJ
         ItMeeafFSCVH6k8FoBujmtG2rTcZxuxeXHSeasVyAptt50Gbf1Hi3f/ZJLEHERX1VVBv
         nD3dwQqy1j6qhHGe80Lm2Mw2Rg+boZdOWlDbmNP7CHdUbW7nQ2Z8SxhJmp9UFbhrWTvk
         6xbGfS6A9Bt/bDLEDyiVoX4SkMPGLM+yqNYmtXBG1nDVMrppoCDuhpxwwwQ5x3S9SHrb
         SU0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=46HqDL6Ak4KSaYR2Y3K1vjaVcy3H4RP3peTsPTQf3w4=;
        fh=LBKNfXs3s5FFBi+gCo8GdOxajs/C9yig/lbFfN2U6Bo=;
        b=XEt0pofSf8SSV75uJOVyQOaq5vPoEodiV8d4CGR9pGZR6cgEocmv3TlEAqJhUBFxqN
         ytYhENDhKygzbEId/ewo8KynylJnLmkxqlLURwdyN9I6HfStxUgWkwTrfk5GRQp9C63N
         5uJVVimwnts18SFXOD+Bkkuta5NxARhi/77Mvf6zB70nAEIg97qHNZeHNXmQZItxQY+s
         16WD7NnI6dhez7yozNNCUkpkREhi9Y81xKZZtHvljCKyoupl/NuXL2hJQvJedyGeaR+a
         NUeVUvNWFdrV4UUskvlJQ5BdLPF446JuAmgzU1/mFRRuZVJOdoX95W7V3JhGwQNo/Q+3
         js5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776068348; x=1776673148; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=46HqDL6Ak4KSaYR2Y3K1vjaVcy3H4RP3peTsPTQf3w4=;
        b=Pj9JS6R1L1aV5FyJo1nN8RBxr8OUxFbIj2r7+iOA/49TRLja2nyS1ZoTDjrstWJR/D
         SrPiwl4NIh3lkSFMNux4ierow2tTfc9gNgQ1UhMfTkoNfCc+a7/e1XG/OowNS4ClIAoZ
         IvafDjfXFCsUhy9BIu4LCPOAn421yIVrjtqTCOQDb7u8V+p3bfCyQ7QbBrQVLBYErgli
         U3raVjCd6mC1/jzh1sozdPEwfyaasoFI8vLSL6C09loDuJu2tu0jEDGjustOYXppVa/D
         vNwzeLpQUpAxBfmwptAfdU1Kbd7Irpky4iGSd2iUgoqFyrwN0Fi34Sb2W3NOUe9w/6sJ
         K8rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776068348; x=1776673148;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=46HqDL6Ak4KSaYR2Y3K1vjaVcy3H4RP3peTsPTQf3w4=;
        b=mwBOhBQT1o+bzVKeccfyUEMkTBJ5eWALW6f7M+Bmip/JYPkHWQWh++NEwvKHtWtbhO
         bSXudcTRu1nvHYk5S6hv2QNzxnsEEPzyIx2er7uxVYs/ZzlCknt8xWSEqDQM2PsBndxR
         gkPemogxVi4aXSvwD1KuwYG/zAszeMuiVt46eCKBaTN8bW2ANgGlgPuIkoePyhy4kWLS
         HO/ywE4g4Uqsr9D/Wmu7IUzjZTyVCgCX6UdjkbkyYbXMQdscVMekAUKjEAT+tZ5dxsIV
         zHyOJiOM4y9J0dm2tQo1vPDGi7hU9XFR52Eh+tnQ695w3hlkZVx5b9gqUuWQ1jkoYeF+
         vM6g==
X-Forwarded-Encrypted: i=1; AFNElJ/mD4Oe/czJx16Y9aUCYqNGlttIr5cyJROVljk2cisew/07iVnq7RBxuziXa0iMngMfB0z1VNnsOyM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIeGdl3fWZB1JIrZiFdbTCXymhJPH4npBUnW2yUmNZfdEoRo7A
	0f+JONFsKGu53P/d+kltkiB8FMQj4AFJ1Ndu0GEvkRL4Fpt03wSnkUsjYKqIX9d2mAJe6rfbRyS
	wH+RbXixpKL6i5xezjUgi/2i2kSy1AiQ=
X-Gm-Gg: AeBDiesHt1X+KXOGbI5VACuiyZXb3lXGphi8RPkisr7r0C8V98fu4fPyFR84xwgcAAJ
	WBz45ME+EZIOaj96mxwGFhVjghPlwUEtPpnvUSsiejUPx1PwXGsAN57L7pn0GOhMVXiKJGmbTZm
	A5bLC93tq7bthOLcfh860Ao46ejB6e6niSfh3dp7e1U7t6VutS+Nttxfva2gJPrlswFcpMLvbbr
	Vu8Hj4e9oEm+1aAP1j7auCPo4CpLHwjvupY7kbzLX9FMX7ZWL8PDaHmzTyvOLBd2qe4MIJKmT1w
	CNiR6nh+
X-Received: by 2002:a53:ea4e:0:b0:650:13b8:5250 with SMTP id
 956f58d0204a3-65198a2c9a0mr8453117d50.8.1776068348079; Mon, 13 Apr 2026
 01:19:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260412165311.2578501-1-lgs201920130244@gmail.com>
 <adyT6oW0UgvcEQbX@hovoldconsulting.com> <CANUHTR80npU59MrNq=1nYnb-r1ASKv_nG7=NF_G_Ko9-V-XaVw@mail.gmail.com>
 <adylDj3ah4U3QcaK@hovoldconsulting.com>
In-Reply-To: <adylDj3ah4U3QcaK@hovoldconsulting.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Mon, 13 Apr 2026 16:18:59 +0800
X-Gm-Features: AQROBzAFTlnKKbTRuW98POx12UXkmxdQ6iAgqK8kqW6cFgZ4nnocojB5oLrgLik
Message-ID: <CANUHTR-i4wBn6DMoUuevwTKDbvhHW6Gh++nHjB3_2MUvuENr4g@mail.gmail.com>
Subject: Re: [PATCH] usb-serial: fix port device refcount leak when
 device_add() fails
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36184-lists,linux-usb=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: D21323E90F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Johan Hovold <johan@kernel.org> =E4=BA=8E2026=E5=B9=B44=E6=9C=8813=E6=97=A5=
=E5=91=A8=E4=B8=80 16:10=E5=86=99=E9=81=93=EF=BC=9A

> Please mention that in the commit messages.

Hi Johan,

Understood, thanks. I will mention that in the commit messages for
future reports found by my static analysis tool.

Best regards,
Guangshuo

