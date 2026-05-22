Return-Path: <linux-usb+bounces-37925-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDOpD2YkEGqsUAYAu9opvQ
	(envelope-from <linux-usb+bounces-37925-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2026 11:39:50 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B875B1575
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2026 11:39:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3782C3017EA9
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2026 09:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A6723B95E4;
	Fri, 22 May 2026 09:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="AntJKwdn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C3E39A053
	for <linux-usb@vger.kernel.org>; Fri, 22 May 2026 09:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779442057; cv=pass; b=UNLiQ52aFbXsZ9MRzCA0UDfrQyCiJP1zRZia3HToePvfXRdk7V9p1GWEEcqYaV113YaHlDxMatAXGjykYQxkI5mJ6L2nDWW3oHcM5Sw3qfp/IoykbL+QS60ACIqqbDqvQGiihaCylWqjvf0S66G1VgBc9GxUaiFnR5BjlMd9I7g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779442057; c=relaxed/simple;
	bh=lcrNu0fqymMeBVCldPdXcAVX5BxMEqfEDNTM8uFyLIE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PfoI61QQF6MJWFt5wvZk68+/ICA5pzFbLMjsoGPNCl7uApIbK7q3XpUXbgS9vuXdVO/SolIQaJnOG6lBS460Oe72+uWbG6chZBqjvLJh3KEQZofwt49L8JSzq1xr4s+S86NvEyqxZV7MfiJO+9DFTOIQJ96elzShGzsA2zYADc4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=AntJKwdn; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a746f9c092so10531540e87.1
        for <linux-usb@vger.kernel.org>; Fri, 22 May 2026 02:27:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779442054; cv=none;
        d=google.com; s=arc-20240605;
        b=C37nOR0i8BT+rzXQBYF1NpWiywcIm+IPU7HuxCcj9GYl8qX+eJ7MsOT2i+Fg0sPmty
         o5VT7mxS3fA61A8PmBsubIerynETQ18NoP0ZbfaE4V9UGJzX8bLxCVIcxxHkmeeI557c
         CGw4ikBLxvWsd3nWclWRjZZ2Z9DMHnOfWd0CkzpjdbIZZezx/c42vNTXic8ytxLpIMdG
         fFwjnZdHDX5PpntEAR3Qvi2hIu1sbfs+xjv3svskddWoVX2Cm5oT0hQmXqiTcubsDF1T
         vJMescIpTDS5U/TXe5jn6WGsdHd4Lw6AVVG1linfZ2cxdywfsCVFB1lbtGUjk8NCaNsT
         rdFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lcrNu0fqymMeBVCldPdXcAVX5BxMEqfEDNTM8uFyLIE=;
        fh=9M63a86k+hH2baCAR/xP9If2F5CVKnwhEavb3JiI1RM=;
        b=hX5f/ZIhq9PIVKWhcwyHJR0TnNi7PYjBm0cpJ+PYVpVWRwpt3O8LNLRWIm5hpmFpzc
         cwUBHMWwKA0TGvr0RJrCckNj88Y2xSQ8DYUQy36T4yp33/SbVSKD/3HmjRdAhyx9wwjn
         dGekyVCuh17mVF5FEd3kX4vU4HzKtiNrKIQ6p03glqUbtkjvJTeXY5k9Eq8Gv3Xa1JET
         W84FcOdyfQ0D3s/1f8xWJEtKTvrm8VZvacaIA1AD9/ogv3id/+EYCZaokVEKI81s5rTr
         6qMFKFseDZrHvl+n+uGoxb+pTTy59c/ot6tF64azDIevexorDEZg3iDoZw8uaUXcqYIj
         0CAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779442054; x=1780046854; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lcrNu0fqymMeBVCldPdXcAVX5BxMEqfEDNTM8uFyLIE=;
        b=AntJKwdnvE2UO0Yi6rjzyyOnxNCeMlGG+/LIVs8UVQPrqtYpKSyXy8KjrrtqEtBcuS
         WJzoflWcErUwYsbVeBeBVYDAwGRSYldO0JGePSsM1lNV/pU7K8BAfufP/B4QWB8tKk0d
         IVN3cRIlWj3N4yQuavsRXkuLNywsWNpDrU/vtzp9iU3m+tMV1EpFXPkS6QRhkzrvR73o
         uHDgBX/Xw5eCp+R/0vEzffzHiPP+7ekh2OIP8NqjETOXaVmayHZmHGtPU1draJqhhbWe
         g3y7sNwmiXs0IQHECBGUzh95qFiVK7Q9dWJX4N5jVaCGZ3rnc2zHxEP6GcRa8ymTbM3N
         7tkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779442054; x=1780046854;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lcrNu0fqymMeBVCldPdXcAVX5BxMEqfEDNTM8uFyLIE=;
        b=lYxo7eBZnSDNXRQiPrbyABNYZb3JWGmnOE7z/650uuYUW6aVCKKj1d1ql7q1xQA3B7
         zKaN5I5Z4HroivlKCIOMHUKrFjqsH8vIJpLg25LkcD/hfYBCZpHJalAZx23XFVsunKut
         f60fG3lXeYXm9sBeTwFCfpu3HfoZfFec9jZDQWh3HOCvPJOvLsHCPNn+VSFLEbHZMZvb
         pTklqKA21x4DzztJ8jdNdwM276K8DGMq+ROXBYjZykicegdzPk1uRaC5fkw0pws/Tf1R
         DTaxpCm9avIIqtO7p/9Voroxy+/tBZSJjZLoYj4U4BuhcWgkjXRCVGG4JjmLSgbGA/vE
         WuaQ==
X-Forwarded-Encrypted: i=1; AFNElJ/5WY/UXkYTbI9cXYTgEIMS85WIlXtUn9Qacv19V1ENBBG6npPiL/PNRDyZx84Y+4vq9aLVSX05F2Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy44zH8xtMHtIcxoX1lSuI9fjNcBTbg5whxIlJv6rYajs3weOIW
	+871w5WRJ+ywizIAH6tAwqY4Sj/smJvW7anJBb3k0dim7+DugwzRWJzlIzpiVy3jwsCAvs43L6O
	yvghFchdlCzte+lKeVSe4/kMTCDAjRyGTg3R6TnF45atpEROVRqVRWyo=
X-Gm-Gg: Acq92OHuvmULLxDnSOObJ6MUI8a7wKvcMbAO+nHS3WOQq9zm1iLlEEtdAWbaXA7srNh
	WFSOnh83YJp+0hYyLVL8N7JPTHzX3Md0mhUZR/adscEoU90MGJSWjEqhAsnC0SEDqeyIIyLPps4
	T9Vv5KuJVvTjos+IxfBHDATzwKpe9O1mLWZOY1QepW8+2tPI2gRNilO6rTa+U0BxTvM/L2hiSMO
	aZhkXKoTU/hEHwMWwIBwO4PMGTqfOMZIDMC1e+7tgNW+8V0vOn8c0uewmiA2l4sXwlCGx91mVEr
	3ajvKcI3LoV5Q/18HBE+18mJB17ehLV7Xexva9Ao
X-Received: by 2002:ac2:5606:0:b0:5a8:6ee0:ff40 with SMTP id
 2adb3069b0e04-5aa322c9b4fmr491944e87.7.1779442053944; Fri, 22 May 2026
 02:27:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508143853.330151-1-marco.crivellari@suse.com> <2026052234-rejoicing-agreeably-0fc5@gregkh>
In-Reply-To: <2026052234-rejoicing-agreeably-0fc5@gregkh>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Fri, 22 May 2026 11:27:22 +0200
X-Gm-Features: AVHnY4J20EFttEhMWSR6O1V0oSfX9egrWGUd1hz0rA-VlmGbSr6dGDjJW3fkFbg
Message-ID: <CAAofZF66esOcaaAM=vy5Pcko4-t+_pteFYa1om0vMyavKnNKkA@mail.gmail.com>
Subject: Re: [RFC PATCH v2] usb: typec: ucsi: Move long delayed work on system_dfl_long_wq
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linutronix.de,suse.com,linux.intel.com];
	TAGGED_FROM(0.00)[bounces-37925-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marco.crivellari@suse.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,suse.com:dkim,linuxfoundation.org:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 42B875B1575
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 10:37=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> [...]
> What "comments" do you need resolved here before submitting this as a
> real patch?
>
> thanks,

Ah, sorry, I forgot to remove the RFC. It is already fine like this.
Should i send a news version removing the RFC prefix or it is not needed?

Thanks!

--=20

Marco Crivellari

SUSE Labs

