Return-Path: <linux-usb+bounces-33421-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGDTK+QllWlxMAIAu9opvQ
	(envelope-from <linux-usb+bounces-33421-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 03:37:24 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4174B152B33
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 03:37:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 31D50303A87E
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 02:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49AF12DEA64;
	Wed, 18 Feb 2026 02:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AB/155v4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8962B286430
	for <linux-usb@vger.kernel.org>; Wed, 18 Feb 2026 02:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771382239; cv=pass; b=FwFjIHi8iILe8bFMCUyO667wjsvziZpqh1IN5yNWNgh34Ook/SqZw4Q/jLHUG7Cya8+hPbehscLA6CWD21yVKnalDwMV0T/DDvgnLTylgatiO7JS4OCNzhJtE+AsLjGroNVO7j09ykRJJTAjZNgpzEwJX+gVi3e+hXN7Q+CkiEM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771382239; c=relaxed/simple;
	bh=9Ha+cuwcwU3y6CVi1cBDm+BovtXpItKwgdZFezz+LIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p7IkoWoP5EpJkFxuQKBXHtEzcu2fYHsiUi4HWd1P7skL00LyXaWyFRil4jitIee1kJQ4aM71dJ3MlqyqqIE676lVlf9N4fynvPgQ8VF+NvjyalwDNU6pQxa0lhMN9BMuAgqTDjc+dsKdZNZDuYLMyoKL+KR4r+MSsBYLX5XbsoM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AB/155v4; arc=pass smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-46391f4c1f9so2664929b6e.0
        for <linux-usb@vger.kernel.org>; Tue, 17 Feb 2026 18:37:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771382237; cv=none;
        d=google.com; s=arc-20240605;
        b=AoGxsGtPyG/oDPVhgWQoUav379svZrrjCDOFMqweL0OpgwAm1TW6vYOlehbRkNxiWe
         Hv/WU1fPEd1QkE9cXKDU4mlqtnwNxytg+ioNQuypr1FkHILlCIbdwuHgdSadTaD5FTGV
         k6Ctmz2U/kbZWzazqOb+t+5/QHyt2dMivJjGs7nHQlVugdzoYEHUbbcHftwtQ1PKkl79
         46krIoebS4/o7HylP2VXL75s8Qi4aWXokdddPDb6EDF070sxr7DJhZk4VLRATtfVct7i
         S81EhUG/xvYouwAIwx6qLAYciQK9vl9kY+Qi8yMPV7kLjxGCEQVU0ZwX3iTDgca4OztS
         hZNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hsPuhhMpsrso8VFo0Lj113iRta/WI0rwpL2g+4IcqvA=;
        fh=sZtb+2b36MtZV4p1GhFJ60zK7pWLOvkZFZR3e6S5vRY=;
        b=YM0lEK+mekeIqnU+NHgaUayfd5vfPDh91RhOdP3Wqp74CMc7+1z/k3qLu+17QWGh0S
         /wPnjJkDo1zKHpbEYepe0WgvakkwpCBNNhNNDMRJyW1W0XUU1lX4/CQkN8OlKfZe0GIC
         GLny1pPzvWHN9V3thPJIu2e+zGHAuYTBIjbnvpyBcf+dCVHObgRuOTNYGiEe4t+4hIIU
         pqOM8BqFwbFgo8zVxqd33gkmkOt6c86m3odJSh1ecLkxV/5+P4YHsjizzeYpKu0TxiF3
         4GddiukAAurPX0aAoSEVMaShcLPOeDiOl9+iDRfnbKgM/ctS1ZRqImytSpuCbkuwdWYM
         hvYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771382237; x=1771987037; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hsPuhhMpsrso8VFo0Lj113iRta/WI0rwpL2g+4IcqvA=;
        b=AB/155v4bIiqddWGmgbLMX6gpbe8BzdZ+rn7N0E7WJArAED9+O0zuB/z/trCaqs/AD
         3mbIdxU9KfllQwOEt0MaXLwW3WxfWwIedp1iwJi2MkH0jicYIJaivDAT4UrT4VrCFPdQ
         UP8sP15KWKwk7DHXqkP2ScS2nNMS34JFhhMZ1IwbSPqS+jXRji0rVXModaldhRg7HRqP
         FwQa/0fbnDiNdpoJiF27YoZG+Jm/JHj3q2T0hjDpZ1IXyZE/50wM6H0n1Ncg1xlHbzKN
         m2qV8ss0uZS11mccsDtLMFYWN01O1BCvR3gVnoRs3TTpK2mXfHsX56Ns/7vIpMqGcQNl
         NbVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771382237; x=1771987037;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hsPuhhMpsrso8VFo0Lj113iRta/WI0rwpL2g+4IcqvA=;
        b=lvgbol5eUxjUKAO6eV+joL9OolE/x/VliKKFAj84l7xYfimujjunK3ZQ8f8sOpampo
         dmpUvYnsbv9TNl6Fr1kFEilxaO5XWXD80dHXvQSXeRskfOJbuiZRF2NgXoHOWQ1mBeMk
         YSXtRkPkEqCeo9otfUELPuVsclEgJPuLETXat4lErDohTF5/ksWDhry21RunzxBmNqzS
         a+eP6h1gzBNcQ6rRmWwSsb+8HMLOqSXUGvf9YTq0GGfmPBSLvN/XG06TuaVacfiu3LyT
         fHW01yeYG7/vb0TbPUf0eE8Nbr0SfI/MGS3yl60SVm/S/dDNGd5VtcjdfCfGz929bges
         mxjA==
X-Forwarded-Encrypted: i=1; AJvYcCWvXvNUYQuXv2rUDhRsrpt/6v/wxm2NQpVk63JWQfUIzVe2ItQ5h0KW7JHcnTgAATULf+gnUD4uUFY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzITLpJxj5qXwVfgh7WwF7VutQGYwD9F4emXb/HEaLukMj7j+Y
	GAjxVI6KHaLlxFA3BTAmMTzNRJOt9h/2NaCmjXUbbtJT4yauViT+SJP01DS//5Y1Hm37+FwsEbJ
	rNXgsQr+A86fmYfuvP/4AHama2XH8bRxykZ1vhIMD
X-Gm-Gg: AZuq6aKq/htFfjy2UumLrfPV1SUMHglWK6N7bXc/eQDAfMKdaI0SAtv2ZYfc/avKP3X
	/QvVWjQ3wEQfiMSP6NdWt7d1ifE1r9exnJ3pkPqQZXznbwVnWPRg553KDxg8FyuluyYshMiZCy6
	OdhtNO645iprbgczUafhxyLkYWBHuFgh0vJxH2CX5uXQKsKEG09JeValnoaRsRGTjPnEt6FCvLx
	nlJMIfAMHQbOfeLyWicV0bE2XwlNypIrsLoqdPcHKjDGcM6+laTE4ETQ2Q3JMbijw2sfStrBjIR
	Lu0jsHAK5oOURsslrL3MPcHRXDXhDO35uERJxw==
X-Received: by 2002:a4a:e90e:0:b0:676:bfb4:d239 with SMTP id
 006d021491bc7-679a71ed131mr338198eaf.22.1771382236791; Tue, 17 Feb 2026
 18:37:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260213-tcpm-discover-modes-nak-fix-v1-0-9bcb5adb4ef6@collabora.com>
In-Reply-To: <20260213-tcpm-discover-modes-nak-fix-v1-0-9bcb5adb4ef6@collabora.com>
From: Badhri Jagan Sridharan <badhri@google.com>
Date: Tue, 17 Feb 2026 18:36:40 -0800
X-Gm-Features: AaiRm53cRbmSSsMRoXZGEmVq1S0GMRvkKaAsN2ixA4XynKss_UMAdCYIKI1wOHI
Message-ID: <CAPTae5+P9JUFkgZLhJHd-zGfjSRjXBM1RGqcgGRaHyevpeH7xA@mail.gmail.com>
Subject: Re: [PATCH 0/2] usb: typec: tcpm: improve handling of DISCOVER_MODES failures
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_NEQ_ENVFROM(0.00)[badhri@google.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCVD_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,collabora.com:email];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-33421-lists,linux-usb=lfdr.de];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[google.com:+]
X-Rspamd-Queue-Id: 4174B152B33
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 11:48=E2=80=AFAM Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> UGREEN USB-C Multifunction Adapter Model CM512 (AKA "Revodok 107")
> exposes two SVIDs: 0xff01 (DP Alt Mode) and 0x1d5c. The DISCOVER_MODES
> step succeeds for 0xff01 and gets a NAK for 0x1d5c. Currently this
> results in DP Alt Mode not being registered either, since the modes
> are only registered once all of them have been discovered. The NAK
> results in the processing being stopped and thus no Alt modes being
> registered.
>
> Improve the situation by handling the NAK gracefully and continue
> processing the other modes.
>
> The second patch moves the discover modes handling for ACK and NAK cases
> into its own function to avoid code duplication and having less code in
> total. If this is considered cleaner, I can send a v2 with it squashed


Thanks for sending the fix for this issue Sebastian !
Although the argument list is long, moving it to its own function
makes sense to avoid code duplication.
Feel free to send out the v2 as the squashed patch.

Also, when you send the v2, can you include the TCPM log stubs in the
commit message, both with and without the fix?

I am also leaving some comments for "usb: typec: tcpm: create helper
function for DISCOVER_MODES" which perhaps we can sort out before
sending out v2.

Regards,
Badhri

>
> into the first patch. I've not done so in v1, so that you can see both
> versions as I'm not sure which one is better. So far the processing
> logic is fully contained within tcpm_pd_svdm(), which would no longer
> be the case after the new function is added. Also the function itself
> is quite ugly with the huge amount of arguments.
>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
> Sebastian Reichel (2):
>       usb: typec: tcpm: improve handling of DISCOVER_MODES failures
>       usb: typec: tcpm: create helper function for DISCOVER_MODES
>
>  drivers/usb/typec/tcpm/tcpm.c | 99 +++++++++++++++++++++++++++----------=
------
>  1 file changed, 63 insertions(+), 36 deletions(-)
> ---
> base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
> change-id: 20260213-tcpm-discover-modes-nak-fix-09070bb529c5
>
> Best regards,
> --
> Sebastian Reichel <sebastian.reichel@collabora.com>
>

