Return-Path: <linux-usb+bounces-37912-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIxyLgEMEGpqSwYAu9opvQ
	(envelope-from <linux-usb+bounces-37912-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2026 09:55:45 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C755B0432
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2026 09:55:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D6973053E8D
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2026 07:49:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41C7936DA03;
	Fri, 22 May 2026 07:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ikYKBMbL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7B6358360
	for <linux-usb@vger.kernel.org>; Fri, 22 May 2026 07:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779436174; cv=pass; b=k+apdJHzu5dnDUFh1iKM+bCPhaSZzP8jyN335aBCQRvO1mZWkvjG+SoeQs03K3EhwQ9Tddh35rDYSsKLTs23KumTWjKY8pSnN90Xu7UCPuYie2zjGG4TUnwLc54zILz4JUfF9/SsZMmmpl0weEAGf8Jy0nQIzukfRemnQR6MCpg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779436174; c=relaxed/simple;
	bh=XpYp58nbcVbA7p4ipX8PRfW/gS/Gc/RvUnfJZ0GHHGk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P15HpdjU03zC5IIngoyafhy2bGtYksfsc2HEb4U3NntJc/HMrM4YrSJH7kTaoBZhQsuy6oLjkKvZQVVJ5lhXQ+wdzP+1ec9837Y6ZQ5Pvyltb/d40KFa79919MdYuRWqMG32NcdTei8Otv1xKayOs5i4smXwLoNXJrjk8NiDbwU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ikYKBMbL; arc=pass smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4903997fcb5so15304765e9.2
        for <linux-usb@vger.kernel.org>; Fri, 22 May 2026 00:49:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779436172; cv=none;
        d=google.com; s=arc-20240605;
        b=FSfkSTx7ag9R9J6fZAGa6y8+E2rsfPBxKie1U/yq6+8XZ6j5PcnhXxmT2tnDaPkxbR
         wM56RSmlgv7d8OWVuo65wcHQ+v+aR0fo8zBRAN9ruBKU09y6bfWuMj+HntB+cYm1GmS8
         hGhLGLslOm999Vl9SqSI5zUuuj6fzTrZ8xZgApmi5LZRD00r7GMDfieLIsGUOZR446py
         lIRrvFU9ph8nB3srYtfLiqmXlBklHKWD/3qq4LA/ymuPnPcdJVuLdvET/tiNGCJxorkN
         alCVJQis8O/aVbhPSsiJvmPOJ7bZ+FUk7eagyFP7cVzR0iOntqxHkbLGLOFMphx9kgbS
         JfIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XpYp58nbcVbA7p4ipX8PRfW/gS/Gc/RvUnfJZ0GHHGk=;
        fh=LA48uVgTGZF73JkX4BVTcCPqtDgTuXG+agd9QfHV7gM=;
        b=WjtvsKOrUc7knHw8ojULWjGoLrSj914+rdamAENeSPgxuuNA7GIDhbmsZ5obMglzGu
         cTet+vPWDGnhtap9hgDUT93B+pu/sA1v9CL9kSgvsxSajAQ2p6HNDjejFNaTdce2mspi
         qfljMYwxL5cNSMz+UqvDbEUtlBwvZiO6SOHdddPcoGRw6N7t5EJNutT5w0mGf4WkuC2j
         V6rtU6B+zmN/DhIAhJayc1QZimtbtXUC2BUkBtQUCOTfpSliyWDdyoK2VX9Oj19ut1nu
         tghbNM+kq7DvAMPQL0ImD+4t7cYhfWCyOXXhvnsIFaaHGidIYareRSlONo0GYpuZbzkw
         sMUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779436172; x=1780040972; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XpYp58nbcVbA7p4ipX8PRfW/gS/Gc/RvUnfJZ0GHHGk=;
        b=ikYKBMbLt1EKkIKdCKu7s+p2LFqeDJeip/FeV6HE2NI4tYE9KMzASmhlLEfjtG5KE3
         tm+EaziRmKc8K0xpIBJcQAbB1opimrgBkwE/vXC6cQMsNuowAWw5VK7zHySfyn/N1/cF
         aAAKHEMzHo/XE6qxSpw9L/F6jKSh3ltKEX9qNJAf5mfnGs0c8mC6KC32JHUik9JHfHlJ
         teQ36BLkJ8joQkBPqjajIVLIM+5nc0MXdwvCICBWUFt7jEpS+TqMuzwX/WeybXO4Bssb
         zrE1294sQryr1xKzL4n0OTfAk1TAIjpu0dDpkBiehuanXMwx8yArx1c8KFDBxLNr0+jh
         GC5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779436172; x=1780040972;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XpYp58nbcVbA7p4ipX8PRfW/gS/Gc/RvUnfJZ0GHHGk=;
        b=IYWOUijdFD7H6EfLgsYcQMlq20SUH8mUhG1Nx2/EZr95bOChm+9paMOqbm7sXpde3Y
         whJVYaLkLOr0NJtszYb1FJpe949V7aPDkPpAx0jO5s7J/fV3kMaNbqqkPCJ81pY5aO4x
         3aRX2ZUw+TWHN9TYXFP6oJYNass0jNIjT8LwkHp2Why/iUiA2EfpY5Zj740+dW0kxw17
         Z5SNFpbl033l4WF2MdMwldZ1wZEERDhuDI7lHKSII0ckLJUU/LJIXUGYKNSCFcZqD80D
         CTufNyIIHBq3ZUM3etuxSqirHccs2l1mvqO+sMZ1GARs8ACeBAIIopkh6+0J2SeQJWa2
         xk2A==
X-Forwarded-Encrypted: i=1; AFNElJ+FfB1JzJUgQIxerzOLVJTCoBxBej1xd4olTwlJZyt+iOPRZC806l8zcUuqyyiGvmWVT1eQSKlMPeA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZOfB5aYemyvyEdghpjm7na+45HvexsQg5LVPyNPYT9Qma+DTC
	RFsW/CSgpC2SFcpA7NqXmCdv3LKGljaonZz6XSCN+Ls8JT1C7CgK6bNmln6/8Of+w3v3d640307
	ljTEU66Yq6O5kCreIQNb3ADUKyTchyvA=
X-Gm-Gg: Acq92OFQCV+0OSanytO8NuKBHEN+tXCoQZPAJ/f4u3nyKtAO7KiV6TUUat9u8LpcAjT
	H3UCUzcdLuSamkZ3hIJ/166rJYWZVULHecbftDideAvj3lcC6kQCuwxEh7V6UnS9n6Isns40DPL
	EUOJy7xr+ANg+a9gE0xPcJY55i4UBX/JI40fOANe1PXg666WcoRkJwlQB3GZlqpAmbl+CMTI2Q/
	se5ooIeL9ucFLsMCx0LYGBLAi4X9ktt7UNZ7blzC7jHJ4XWfYi5ZAkTGq4/OyH0HIiaQi2wz3Xq
	BM2C4+6M
X-Received: by 2002:a05:600c:4510:b0:48f:e230:c3fa with SMTP id
 5b1f17b1804b1-490428ddc9fmr29245475e9.32.1779436171434; Fri, 22 May 2026
 00:49:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260325120123.1989-1-charlesyeh522@gmail.com>
 <2026032549-zodiac-navigator-23ac@gregkh> <CAAZvQQ4r+5ZGDp=V3k0hU2qUpS7pta2CfmPCf=qSoBU7r4WEsA@mail.gmail.com>
In-Reply-To: <CAAZvQQ4r+5ZGDp=V3k0hU2qUpS7pta2CfmPCf=qSoBU7r4WEsA@mail.gmail.com>
From: Charles Yeh <charlesyeh522@gmail.com>
Date: Fri, 22 May 2026 15:49:20 +0800
X-Gm-Features: AVHnY4IvTtIezk47W2-x3TM09QgkjQanLpIK3Y-skVMCs3odfvHcSOktCM9tW_w
Message-ID: <CAAZvQQ6aM73++Hs5ajRgVKnWEOpRCGT0Oe8nyLm1fDBqS5C-5A@mail.gmail.com>
Subject: Re: [PATCH 2/2] USB: serial: pl2303: add new PID to support PL256X (TYPE_MP)
To: Greg KH <gregkh@linuxfoundation.org>
Cc: johan@kernel.org, linux-usb@vger.kernel.org, charles-yeh@prolific.com.tw, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37912-lists,linux-usb=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[charlesyeh522@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: 48C755B0432
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sir,

I am just following up on this v2 patch.
Please let me know if you have any comments or if there is anything
else I need to update.

Thank you for your time.

Charles




Charles Yeh <charlesyeh522@gmail.com> =E6=96=BC 2026=E5=B9=B43=E6=9C=8827=
=E6=97=A5=E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=8810:29=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> > just redo the original patch and send it as a v2 as the documentation d=
escribes
> > how to do.
>
> Thanks for the guidance.
> I have updated the original patch and submitted it as v2 as requested.
>
> Thanks,
> Charles.

