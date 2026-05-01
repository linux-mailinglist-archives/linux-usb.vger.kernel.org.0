Return-Path: <linux-usb+bounces-36815-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MC2aEq5m9GmkBAIAu9opvQ
	(envelope-from <linux-usb+bounces-36815-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 01 May 2026 10:39:10 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A16004AB190
	for <lists+linux-usb@lfdr.de>; Fri, 01 May 2026 10:39:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 17B9F301BCD3
	for <lists+linux-usb@lfdr.de>; Fri,  1 May 2026 08:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E560636B044;
	Fri,  1 May 2026 08:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gXxHeq9D"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19E513777E
	for <linux-usb@vger.kernel.org>; Fri,  1 May 2026 08:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777624722; cv=pass; b=Y5GIvF7IufDIOcPgaqBYEVNgJEb3Fx7pcweoPy04rPcUrAnnQKFw5sQrnkFap40gqAPkA+V64IBdWnByrN/3DqhTYNorLjpK3AyOaZd3xms6YB7fniQfzEj75Vs1uaqE2lsNapsXH2InCIbbGdmMy8qLgkhsFpzoY5IcEaGBNJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777624722; c=relaxed/simple;
	bh=/MwKAeqxZ5oj4aK7GraK1ijhDUC3Gz9ljyCvcXTrl4E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=DQ+8aC+DDqyG04XfqxNKr60TObDpATo+wZnoSWzo/R4GvK2o92RItwjPA9yD9EnpirBWowEmlXGDbZtwILaZVyRxfmrCqQHSIRzEuz6X2nSUWahuv0YSt4WRJzm51S2Sku4DxVNW0bGOA0AQ3N8LOUgatGw1K8oC3UOGD1OJHlU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gXxHeq9D; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-6501725d888so1483550d50.0
        for <linux-usb@vger.kernel.org>; Fri, 01 May 2026 01:38:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777624719; cv=none;
        d=google.com; s=arc-20240605;
        b=F73Tr4MuBZ8Hyj7sRiUQAFGDiuOZUof3BlnSgNVi4BeWO05/ik8KdD2lnS4g2UD50g
         qjQDsclqU+XpaKohUOLF3HIEah0QoI2JTUEcQ66rGpcDLD8SRXjK4Kwla9ZKgrqr0mH0
         iW+kFVlcSv4/6tHvc56HHAUaTswda0NKnYOZNVylrs+AIqslN+TKXGf2XBOiEl6bXjMP
         dn+raedNJpzQucNRj0DIy11KHNEKuzoiNDpZOh8K46iOxkv1trarmBoTfaMeFouMgn/8
         RJjo0rmXildyNgqk1g8+T9rNpgE7a4vXLuuISxEf300R8zOgPGIE2OxCimxPO2QMGnna
         YpTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=th/5KxEMyktHeD5pvjd6Ekw28jr4W4TCSOTFdFHN2fE=;
        fh=zUzYV5iv53PdCRarkZLUbyvzn80v2D0pVod7D/v+yEM=;
        b=jUk0jxyFEUmt9zq/30aISHuEky3IZfZYbiiBupzREsvQSVwG+2JgQJNGDLDgYckM1J
         stqNebpDHVpW9VqW+r00jiPt4xnpPtfaohz2550d4KlR0yntNWcMhteDJLGQTAQDFOqS
         aMmzzAELHtJsYPBuf4yC1Df4/kyNNzDhFZwYkI6IccSAuBLtri+imeaPVXNnmsfu/64B
         XxhOPQF+mqyU6MG397Y2V6o0pE8UcCxnYGfh1nFFGZgnHSam8FdRTOLFnHkdVVVfiZbY
         T9fE1w/CV+OPs3vr0pXWpZPHds7/n4hBQTbMqr2so20BcOCnnmSaB5WwTrSX/smIZpLK
         MNmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777624719; x=1778229519; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=th/5KxEMyktHeD5pvjd6Ekw28jr4W4TCSOTFdFHN2fE=;
        b=gXxHeq9DfGa7eUKOXE8TROsbiSzfAycrZ7fmB83B4eqjh+nzRRs1MieqfiENsnlLa3
         T+1zaqk/k1gh1VJEVwcnz32n2fDfRC6J89zr87GqUse6mF/d0wlB7FajZMGTmaA9EBXm
         zQfKAnWj7uzPASo3/jAE+7K0Z6p7jE/zqSZx/h2uCJlFeSGoy9o9wQ0YCwrMeZbq091u
         IhcHs/+2GvT5ptAvIxOO42c3tDacNJywsUG3V4TvdYYL0xU5yhrFwzIjaAqZ61ZEPiVw
         ZGfcLjt0jeJXRWOAIg0QQ2yPGZ8iVIokTbf8uySR8+dWmnMDF50lDuk5YGnyIGvq3q/B
         UR2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777624719; x=1778229519;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=th/5KxEMyktHeD5pvjd6Ekw28jr4W4TCSOTFdFHN2fE=;
        b=STB0bb5/1hvPgkkwf4x7RfcjOM1Z4mFlrxvlCCorUvosGtRXoXAJPkfcd4yvbuoNGm
         sPGWOEmU5wSIzq0bhXXWkAiPIRsIJnSWCJeQud3uMM61Z+8bNBFzoxmAI37FMDJ2p/vi
         L3oafo+r9+U1G1q3lJ9dStwybqkEow8oth6FT6N8E36CE3jvMsNBQy4Ig+Re9Q9cDQiC
         kBmom6Pg3RV4Clm+il78BJvh/zjOzQ0qBIrC+6zdK8WXZF5jtNhsdZdYvQuVzsFgB5Ub
         liMZxF0g0abLpHHoYq64E/yPtyB9hWD5UA/8wAqLaOYK4AVwEf6lb/ZrEb2p45VgLeys
         +OMg==
X-Forwarded-Encrypted: i=1; AFNElJ+EDsJHfjrTRm2ZvV2pOgm3OGisY1IezJwlT8qjBE9Ksn4ick+NF3561qh5h5pHSAJ8FjSPpscaw7E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2bz1LFmO0T81yMWQGOwBH6SVb9/XSCMGqmyxC/NXS/TZsXxiE
	RccT23ZYGw8XyngCIlq4kGZJZAI9XerjSpsaCEKRKzCFl7sP79IjcE5O1Z4En5bMC5oEEoBxt+T
	aVUVAeteaICYaV2xgv22+2QK5uiCeRuI=
X-Gm-Gg: AeBDiet+wf1+s7lOMuBor/Qgq6pueAB9QaSvrRnOP15SBB1SBUT7rK9rcaECa6nlwVx
	A7VcJEWqSmHis35RPltm1ReDbQ+DXLd1vXn/yz+eeJKWRa8Bvu+8y59+Tx6eocQjk0LxlpCFWtH
	Eh1Zxx3D6OZBWgn14om63Q9nfl/opGYypNUKlFxQY16buEA210X0wuVFOMYTUur9aQHQKb29Xez
	rgMp1axRWFFOk8fQ/U7syHvRfTo509TjUf+AQKOp42G1mrKgmRcKhxEsACzuEav9hs4hSE83Tkm
	D/J7/dqdHQv1jMqm4Q==
X-Received: by 2002:a05:690e:58a:b0:651:8944:c0ba with SMTP id
 956f58d0204a3-65c18fce8c8mr3957316d50.63.1777624718708; Fri, 01 May 2026
 01:38:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260501045113.484207-1-lgs201920130244@gmail.com>
In-Reply-To: <20260501045113.484207-1-lgs201920130244@gmail.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Fri, 1 May 2026 16:38:26 +0800
X-Gm-Features: AVHnY4KH017fOumnkX6bqJdacIeuzBq0p64I5HHnVhrGh-iOMua7TxQHf2z0ttc
Message-ID: <CANUHTR8b=JN8Q+G+Oi-4V-Yfdut-+MSLNecLVE_k7EcQsFN1vg@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: goku_udc: avoid double-free in error path
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guangshuo Li <lgs201920130244@gmail.com>, 
	Kees Cook <kees@kernel.org>, Felipe Balbi <felipe.balbi@linux.intel.com>, 
	Alexey Khoroshilov <khoroshilov@ispras.ru>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: A16004AB190
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36815-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,gmail.com,kernel.org,linux.intel.com,ispras.ru,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]

Hi,

Please ignore this patch.

On Fri, 1 May 2026 at 12:51, Guangshuo Li <lgs201920130244@gmail.com> wrote:
>
> goku_probe() allocates struct goku_udc and passes &dev->gadget to
> usb_add_gadget_udc_release() with gadget_release() as the release
> callback. usb_add_gadget_udc_release() initializes the gadget device with
> that release callback before calling usb_add_gadget().
>
> If usb_add_gadget() fails, usb_add_gadget_udc_release() calls
> usb_put_gadget(), which invokes gadget_release() and frees dev. The
> current error path then falls through to kfree(dev), freeing the same
> object again.
>
> Set dev to NULL before jumping to the common error path so the explicit
> kfree(dev) is skipped after ownership has already been dropped by the
> gadget core.
>
> This issue was found by a static analysis tool I am developing.
>
> Fixes: 2a334cfaf393 ("usb: gadget: goku_udc: fix memory leak in goku_probe()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  drivers/usb/gadget/udc/goku_udc.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/usb/gadget/udc/goku_udc.c b/drivers/usb/gadget/udc/goku_udc.c
> index db42a5e3e805..46a7e0f6541e 100644
> --- a/drivers/usb/gadget/udc/goku_udc.c
> +++ b/drivers/usb/gadget/udc/goku_udc.c
> @@ -1819,15 +1819,20 @@ static int goku_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>
>         retval = usb_add_gadget_udc_release(&pdev->dev, &dev->gadget,
>                         gadget_release);
> -       if (retval)
> +       if (retval) {
> +               /*
> +                * usb_add_gadget_udc_release() calls the gadget release
> +                * function on failure, and gadget_release() frees dev.
> +                */
> +               dev = NULL;
>                 goto err;
> +       }
>
>         return 0;
>
>  err:
>         if (dev)
>                 goku_remove (pdev);
> -       /* gadget_release is not registered yet, kfree explicitly */
>         kfree(dev);
>         return retval;
>  }
> --
> 2.43.0
>

After taking a closer look, this appears to be a false positive. The
release callback passed to usb_add_gadget_udc_release() is installed on
the gadget device, so gadget_release() is called with &dev->gadget.dev,
not with the PCI device &pdev->dev.

goku_probe() only sets driver data on the PCI device via
pci_set_drvdata(pdev, dev). It does not set driver data on
&dev->gadget.dev. Therefore, dev_get_drvdata() in gadget_release() is
not proven to return the allocated struct goku_udc, and the reported
double-free is not valid.

Sorry for the noise.

Best regards,
Guangshuo

