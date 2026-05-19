Return-Path: <linux-usb+bounces-37667-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EEpCkQpDGq0XwUAu9opvQ
	(envelope-from <linux-usb+bounces-37667-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 11:11:32 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3E357AFB7
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 11:11:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 048653068F24
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 09:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DF483EFFDC;
	Tue, 19 May 2026 09:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Q9rXVWFq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EB13EF0BB
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 09:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779181295; cv=pass; b=kQyETOAc4gTMZOzzbNCgbfeuGL9XwSpBc7owWonok5sY76mWw4zeuNDWbhEPHk7WL0/WZzWC/9Fe9wT697dcrx53kg343x5r+PErL+BLTIaUQ3Alid2qEodyGy2SSn0mBQ05KJjx6Tw8C+7bB7lHmfUKj6R35/gtn3uzyT1Pb2A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779181295; c=relaxed/simple;
	bh=3MLNRSB6NxBQkDdihHMzZ+Q8AFRXQzwKZuUNMUGJ/1A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ppyWzTixk/eqUTlpiGWmfwDSI4/kmP0moAprLTnqu18vPC6efFn1DIp7tr18FEHLEasxzYdtc3kl42XSTHEIYUm3KliQdoC/wkihQk+etnh7WlSX0zQnJ/EfHTbXzick0PldfPQdlf695YkiyGZ/sfgI46E1SpEPrDwdo0MdV9k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Q9rXVWFq; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a88de2b52eso4444796e87.2
        for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 02:01:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779181292; cv=none;
        d=google.com; s=arc-20240605;
        b=CBWW+ERpqlKhXtvsZw7KuS45f7D83hT4ptBayG6xtDAjQ8TyBrY0EW7UsGMJ34ZJIm
         xicooyxPXY9CKZtBZgTkK92cUp2atBq5DLgdfJhQaAuKBPs9aYvltZJBYIYa1iQUhmnN
         fkJxL/N4li++hjZ6TUaA75nV/P/UtdW9UOyrjdSi7wvJR4bG/HzfGXfcnghDF6rKlnIb
         uTD7iqxZeoDaL2N6MwUiPxSrOtcGWHsD0816D+sE7QGWBE3YIvg6rmQTY4SG8rRklfPG
         MiTdrQNpmoI1gmRFLnoMV0SeCKNb7w/IaVUHo0yEXl0G+86+acduTSh8Lzrh7STP3lIa
         YmaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s8DrNQfN1ThqOW342Bv7RE4jPX0CtuKlGYtp32MlFk8=;
        fh=h58VIekmaL8rbslu4NJOnLJaWTdyIILM9E/ldynpp70=;
        b=i1vjq+KT9j9VQI07AC+CWHt+oZKRrr+pHXADjmLU0KzwyLY8TLyyC2KW5PQLwzyhta
         dbcah5F5VskmgTD5GAuA9ixXvN+/Nbb6vL9T729wG56hVWGiOrA8ZFEn6Dps50vVNCVD
         fvCGOtW2JEqgcVY6vwJykaB1kJLGsXZVsnDaxt3nAaSIRmyqiwQji/pXsB6ETXq3Suic
         iLD736rbLpSfNzsVobvgX2wGLZ6YVvJgIf0gJ/Q2S43XLPvEGsj8MuzZk4rwKEkAgH76
         578yhq/qDpZ8T55mlRzMKLW1pzUOFEPPT5Zw99RbkjC5xf13VwlRSMVvEL5FsPsZOIwp
         K4yg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779181292; x=1779786092; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s8DrNQfN1ThqOW342Bv7RE4jPX0CtuKlGYtp32MlFk8=;
        b=Q9rXVWFqojFhyRu8ClyisxJZfKdwcz5eGHqSeO3CzIaAgAP6BipC5M7V0u0oy1qkOF
         wqcZGAXhZhktXxwnYl21nqppFNj44F+PRUyJRaxB6TvXp1fEouc8y5seg02876Scc8j8
         SaNclbSiiKjnf44mq4fZTwxcitifVRbXB5eDLFUbVIh8nqZmOjh1W9rLSYbEY2EwZEP+
         oWoCidZrlsiVy3Dflu2MzQ+N6BxQZi7+figZn0hpz72ftWfycPwVhgfvVSerYZj9B7gw
         Ly924HDg/uFm5VbnI4z2tt9oSsKzx7H4IpuDB41DQEoqP05UPzevkBOxfO/F+vlDfgcX
         C/3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779181292; x=1779786092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s8DrNQfN1ThqOW342Bv7RE4jPX0CtuKlGYtp32MlFk8=;
        b=nBokmyNG5qL8TAsRnBi71V8c5dFgnafnvIwhcO6p3ZQf2WI+1K4HN4QmXpHfq4kDpN
         SzLiiwY9G2WxLA/qe2HeEAZbpuqikzDqNvZQhXUIp0C76xUrbQ2t5yuEQlqHGeehE1Ie
         9AGwfec/gQKvOzKe+aoRvNedQYjP/njvcVD4NbncN8XN+77mQTmUAytk5ohyzxxFDjWa
         4hopxsZaZ7m3yrArTUTaInT2t/TEJ21k4vPWUCjM2YFdpuzXPfc/4BO939lprrPX0iFR
         pEXb7RWKbzB3Wt/t48sGHL7FzIAcZYXmFNgKvhJYKvvq1L+hOZFD8HPX47Sn6IaJMNpn
         5gMw==
X-Forwarded-Encrypted: i=1; AFNElJ9MCi7l4GEB/JB3axe+wenOp74kJGZ4yXOAhHVe1Ba0N33tpLiG2F3m1GIkCm7vkQF+yIfx0Kq1vwo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8JNTAiRhbuZJgt9VEvAjk8jjtJBPn4PY58m0hTVDlgCfQth0k
	739SMVTnzpkQtoQeAiHi9Zx2Uv56vNe4HMuAqe5WcCpFcZ2iQ1lot7tPE0gLDQyGnm9fk4c4CZu
	1aJ0Kh/+Xo65LK8TUG1wWzNa4iGT6YjNoOvb3EjgbJA==
X-Gm-Gg: Acq92OHSiyLyROeoRAr+8J4/koTuwzIbcwa8aJ1gKbB2ccQACYRN+3OYwiT8jXUBZyC
	QFOdvRhTsDsLIUNNxyLqZTx5DCXMiEoj5885HlKrvLflzBLhoxufC1FRW5ZQgcSDWZy5GIVQHI8
	rjBadPYiJ9+opxnIDq3BwdaovDxmc37JWdMDLrFKmWbnmnGJXdLiP2zn727xIwUOXlOb98fV+5+
	sJ3v6XitVV1V3DZzP3znSqRxSMSOnxNRCgwt4/2V+2oqOpdoWai910luWkbVLEhRZCW0VZ9gfy0
	mgJQMkZM
X-Received: by 2002:a05:6512:6389:b0:5aa:144e:7cb0 with SMTP id
 2adb3069b0e04-5aa144e7d05mr3876561e87.32.1779181292516; Tue, 19 May 2026
 02:01:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508143853.330151-1-marco.crivellari@suse.com>
In-Reply-To: <20260508143853.330151-1-marco.crivellari@suse.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Tue, 19 May 2026 11:01:18 +0200
X-Gm-Features: AVHnY4Imo4Mfyytd8umJpmcnV8TJoXQWuPt7hZ-iOMCYoIjT-4rVAWPFXj2VqMw
Message-ID: <CAAofZF5xeDSV=YBQckRSKVgiNiM5RXshnR19DVOYmwgNxncB3w@mail.gmail.com>
Subject: Re: [RFC PATCH v2] usb: typec: ucsi: Move long delayed work on system_dfl_long_wq
To: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37667-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linutronix.de,suse.com,linux.intel.com,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marco.crivellari@suse.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[suse.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,suse.com:email,suse.com:dkim,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 9F3E357AFB7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 8, 2026 at 4:39=E2=80=AFPM Marco Crivellari
<marco.crivellari@suse.com> wrote:
> [...]
>  drivers/usb/typec/ucsi/ucsi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Gentle ping.

Thanks!

--=20

Marco Crivellari

SUSE Labs

