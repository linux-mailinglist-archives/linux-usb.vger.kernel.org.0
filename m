Return-Path: <linux-usb+bounces-36458-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACBALJuI6mnU0QIAu9opvQ
	(envelope-from <linux-usb+bounces-36458-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 23:01:15 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DCC4578F0
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 23:01:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A5556303D2C2
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 20:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E06A3342C98;
	Thu, 23 Apr 2026 20:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l7H8dkLM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B44D264617
	for <linux-usb@vger.kernel.org>; Thu, 23 Apr 2026 20:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776977831; cv=pass; b=LBYmqc1h6qYxRuxMGKEzfM8oET6Y1a816IVoi3rLBJByE5grFMjxkWUtTsmjQflHdZuzZ3AyiS2Pti2W1BGyWYRepjJZe8a+emE1SNDqmIPNkc2JoW1zTH8WRQ+Bqby2+XPw2gVohCgU1B3oeGhOJlBbgN6Zld1GeHpjAIwv318=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776977831; c=relaxed/simple;
	bh=LyaJIDXm2QlUgI9uGT19f8zczrsBHR24jEhoDnlhqHQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oit8231+0qaoSPUgImjgpbkLdeKsHULzyK/25Lt5s8Igh1ISbQjO76jdrBOtmKizIb8quRUBnQ83Xo9MUYqzO+goAW2iASg4ot5/6J3+5WwwHM9kpsca/3YRwtx4DW4MZNjrr3LnPUe/bwyLNs77MQcM1gDTOKWL/OOGv9VfzVU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l7H8dkLM; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-6530287803cso6930614d50.1
        for <linux-usb@vger.kernel.org>; Thu, 23 Apr 2026 13:57:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776977829; cv=none;
        d=google.com; s=arc-20240605;
        b=kODiw65opxd/cRHiv8nVzuc9yag3nP8JyFiYicHsdHwWd/iWdWrtfdTlgEL8YRB5HW
         aEux1qm8Qdj2rtTsWyy5XS3oJkiQz04lkFtRBK1rP2yLV5OL7Plx3cRm2gDnmnsRVBM4
         68HqAqSfawLIL1I5e/uFQPKXTJCu4ZY9AO+rJqbpskgXtmGxJcNmSjnaxk/pqUMkf2qG
         Kmd93Fgyfbq93AUOoqYJsK3FOKhnmbterDIIwMU/YMsM3gy4f/rrzoCFJyUvGpHMJxaK
         qwA1u/o3vsIF7hJRYXVOZPQ2OXQ3GE5m8Q04PuZ+Hk6zojM/Z5pLaXxAqzibpzF5L09f
         YgEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LyaJIDXm2QlUgI9uGT19f8zczrsBHR24jEhoDnlhqHQ=;
        fh=lrKZi2x/u/+6Gqo4eSu0sQvnXX1EPRbK0q/+nsW1Q0Q=;
        b=CgMdmAH4kF8u6ILD9sVEK1jO45oC008pdbeuqTVe5Y5nxL7F/RFgLR4yrsfr9t92cM
         ppez47cTnvEzkIaEtfHZsivjKDo2a8bmpQ6Q10IOtvcPWGH3p7mINSuDX8OcEAUyS3Kv
         OI17S+hTvMKQLaB3Ou+sOfC5LNijIeKLZdb/gEhbMp9ztzxEGXjILbTD/SFzz1ThSYCm
         rniijueYjACHo2BGX1WB5HR+VxpnXvX0EkqRN2OKfDmLc+2/crSLjRDnCrzW8ZypBhSw
         oJ3jPIAsJ+KbMc3juNh1w0bYH88OMzDJ3Jrczk2cLTcozG94wEBz3osXUPhHWx4j1uHn
         mU/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776977829; x=1777582629; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LyaJIDXm2QlUgI9uGT19f8zczrsBHR24jEhoDnlhqHQ=;
        b=l7H8dkLMlytCC6nYxIlcHpYjBuohwxmKpXzJv9Mv+gjE3ZkHOvcqlxdwxMzsnEGTIH
         d1kR2xI2exN6OvjNzxArWD0woIJP0d1cGSGXKgtnuzkUKv81NgpH1RhwiXX9WCBtZFGJ
         M/K1bydGDR85yHFVFbiE7uvWAVxy12fJ8wLvcyaVQw83q/RH0vBI+V9RPo9RgmXHiUpI
         rs/DVefPoPNMbwf85rVzCX2L8iqYERWCGI7NDQdY1lp9kM8T8M/C8uUL1tstX3v+LtMs
         D4e2N8jILc74KenTZcuDGe1BFQ+ZNh+seaIla2TwAw84Lz1p3tUKNlwg92K+7HjT8LXM
         GPtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776977829; x=1777582629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LyaJIDXm2QlUgI9uGT19f8zczrsBHR24jEhoDnlhqHQ=;
        b=AWLrLBWHPwZ5X31uDCRqKPTV55NqTnQrCcQIbG9FlmqXrKMNCmwzsj/oUg25RecHHu
         ZorOvpwpHqOriGwxKYugZzZNrqNMH69frc/76Ivev6vmv35hyWU09HCO392ZpPZTPXfb
         4LxqWHda0/dj2shSliWxe6KaGJ1ypz3P4Q7CThHD/VsIdrWdWw3gKgqJo9ozEWU0KkO+
         IRNeY0dU7Q6o6wpkXMMFCO6Qt/pMW3ZWP2T4LBIFm33I+ZKckMgI5CfgiZSWV/iOSYrE
         qZGkei6QiDY3eI3keMquTB8FTZ0BeQ3GWla2tDcktpzglTkFGcI7JY73+haJ45XmuG15
         iaVw==
X-Forwarded-Encrypted: i=1; AFNElJ8Sd1wTlI1Gbxna86I/FPPYrJP2JcomjkJsSQ89KwdemeBjqyTLPty3hsAf1ULp2PgPeyyDH1j1+/I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj3UIc5E4e+YL2VHuoOZhxivW/9tM8JmS9qExI5tnWHU+kkyCJ
	k/gvjZyxuAS+UrDBp74w7/zqWsWmbtUB2IR4u9h0ieyQD2pFmj0bLmzx7d9QNuuBzt9UXMDpuTK
	gKO/2yyx7wypW0hY6N9p2G93zx6nqHbY=
X-Gm-Gg: AeBDievYfVnm65ITfvmn3jKNkqQbLaFtjCzvBTDf2DuKt86SVd7nBMc1S/sG9b8AaPV
	OIjTqiHnWDsMSJbZA7Apt9x420/lm/lXr+gl2VzkggSDdlNZ1dmPkScjJ8s7Ji9P4xjCIk/lSyc
	mwAsxYiNQ5BM3nn+JkIUpWvcCmiPF5WdeOo/pFxNI/LWIZy+YrhGVorPVVOp1/CZK0J7Q6rEZFy
	aq7ldmntFGSA46e8PIp/3pQOPj04BdF4BR1YAjaps9n95y6LNtmNpbLBIin2E32d7/fIkP/pSEI
	2n1dN8VALOwzUshwD8eCv7MmPiZu9roXyxzl72j8cQStr1kfk6DE
X-Received: by 2002:a53:d00a:0:b0:650:30be:e186 with SMTP id
 956f58d0204a3-65310afe342mr21440768d50.64.1776977829305; Thu, 23 Apr 2026
 13:57:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260419213638.38291-2-m32285159@gmail.com> <0643586e-e665-4592-b941-2868fca84322@google.com>
In-Reply-To: <0643586e-e665-4592-b941-2868fca84322@google.com>
From: Maxwell Doose <m32285159@gmail.com>
Date: Thu, 23 Apr 2026 15:56:58 -0500
X-Gm-Features: AQROBzCX6NtFbTn9N4W_KWDZj0XxrVjTRtbporKrtEfQzKlgfKcpI5_kO0KsJ-E
Message-ID: <CAKqfh0HOoLoQYv08sxdqbTaS1Y_iB+xTc=FEmpHW46yopURbCA@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: tcpm: replace strcpy with strscpy
To: Amit Sunil Dhamne <amitsd@google.com>
Cc: badhri@google.com, heikki.krogerus@linux.intel.com, 
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36458-lists,linux-usb=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m32285159@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,msgid.link:url]
X-Rspamd-Queue-Id: 08DCC4578F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 23, 2026 at 2:23=E2=80=AFPM Amit Sunil Dhamne <amitsd@google.co=
m> wrote:
>
> Hi Maxwell,
>
> This has already been fixed as part of [1].
>
> [1] https://patch.msgid.link/20260310094434.3639602-5-aichao@kylinos.cn
>

Ah, didn't see that. I'll go focus on other things for now then.

best regards,
maxwell

