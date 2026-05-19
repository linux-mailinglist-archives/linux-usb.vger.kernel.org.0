Return-Path: <linux-usb+bounces-37739-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MGlLjzDDGqJlgUAu9opvQ
	(envelope-from <linux-usb+bounces-37739-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 22:08:28 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 411955847D8
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 22:08:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E3673090D9E
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 20:02:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A08293B8948;
	Tue, 19 May 2026 20:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="b61OS4N4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2D2369D67
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 20:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779220974; cv=pass; b=Cb5H0kjwj8hc1HYoAv7PPCUl9QIOwf++KLK7Cnt3Sf8cKN4KYiKWooE2lJpSFdqV1pLlQiTsm0OcVACl+KYgIs8hFUXWFyt/hwseznuuFtdF4tYchGk7dJjf8ydNzEMEirW9aln2ciEu/HxLrB93e4bgRhaMCs5aNbymHmkvIz8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779220974; c=relaxed/simple;
	bh=WIJ+j7SzrZVw+7zCthbiyNJd4eCo2uB2kaOxP5VMNhw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I9zQ7B7GzPkn4O5n11c14VRaEzixB8Nq+1h9UfpzSo4ma3OfX6sQuU1Pr/m0EgYE8/gOpJ+QbmR0qAUFuc7EkA4ImhblvGCd6RYvxZYJFI5i9vUzvzX1kB87tmgrv+OY+8qRTgjfc91kI27kzgV2XExyVDP+ZjCuKWjzz+gtV4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=b61OS4N4; arc=pass smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-36936dcf19dso1887398a91.0
        for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 13:02:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779220972; cv=none;
        d=google.com; s=arc-20240605;
        b=lQKJaMFrf1Ul1ixK5msLgKH0emZF0aLrSSuLTz4YFrumDv1Jksz8VTAcilzEmj/60w
         YCN9hDliiGIRe/LlbSxmNNN1xK3MGY8NrfpDvPuXet/Op5a4YKrVtkrUYjvVF2SNuWoH
         q4M8tky4cLqsSvMPtvmEPvG2hOUPJpzYWSnJhglm6B2Hr5cAh9U/N1RsBmhBs28bXrad
         I22jH7MwsbjmmqJGCoL2fgg7nxWbwZYGLyMZpaG/FwHO3IVWI7gtzwzFWIp2JJr7Vbgo
         g29hGwBqoF5q3qsPjSX6dJ7I+h69t3emTkt3CPg3dq+EIVSlxe9AjpyzmEweUvy2tyE5
         W3Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mqWgtavonb1xBohBQoh0lZ7/NXsbFMlc95RbQSJM8/w=;
        fh=TdA6/7x1xdw4RBSkJtvSpojpIff9RX3pZ/ghIz+ETfA=;
        b=MWPSbFNlodYD1z2nTRHl5+QREEZ6TxlqhTqmkhCUrjyr1nFGJkZqnm8VF9vBiJZS/U
         QrjwiuY8oMhQcpN8HofOAVuNBC0yumG1xx0JvY5HN41H+XeFj1ubtQlC+dPa6tmR4O9s
         K9ZTSZTU82l6B7TXmg51O+D1B1bZeORzX5UeLt3nLu9+rzMmjv9q5YC/z2i11B1e4VFV
         HCZEBUDqeWb1J0WtkjZqYynCyLDrwMwh4d3jDN6e8k1ExEUeEP5HaXcv9Xb0mcK5xeeE
         Z5jZSQZO1D9FbHiZ5UXLrokk53TfuZ8KFaZY9F398fxOhkV0qtZLPybjrWvv4HexyUdt
         GdVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1779220972; x=1779825772; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mqWgtavonb1xBohBQoh0lZ7/NXsbFMlc95RbQSJM8/w=;
        b=b61OS4N4pMV/rljoZnPrG06Y3mSMNzgUoUPwUgVMU0ekimBfIaQVlNdMb6AVZii4Sa
         QKN53lVcBdr2V6JXxi1X1DmmIbNvu2pR+4yRMzj8pvbPEZ/xeBixr6Hjdn3AfZVas7o7
         B8xbOOlyfzouKY+GUaMoj2/B2OctzKsLLD9bE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779220972; x=1779825772;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mqWgtavonb1xBohBQoh0lZ7/NXsbFMlc95RbQSJM8/w=;
        b=KLMgY/3HduBBbPIp5+kPReBpZjP7PzuUlw2LncBSYsLlN6M69wD8zU34PaoOAEn9db
         vx2/hAfu9rvi6XUFETDhn7awlr+I9w4cwpD6SB4ZE7+JERmfmFoaWJEiEbQ/h2hlx1gQ
         rZUI8DN50fXKgcMtG7KFyc+PhU/F02z88g0xD04IVyan7MV55n5YB3BRxOLGe9MB4oF1
         gkAHRoAFM32l8jEFv7cYaGqV7diFTdHkQXJeDZZTv064Ra/GmkHyfvlMmGLAdbNksUiS
         193Za9dTprT2SwSQlhr9ZkVmTP4fWadoPVkUNyPBRbju2LxgDNUeNV2QCznn4hIyj7zr
         D88w==
X-Gm-Message-State: AOJu0YxNmD3cpHrizIzBnTs7HTlk6HE4gG9+OQbzZdzc+XXECwb1qyky
	IglEjsCn6Q61sSoMAPKd4jF3i1OcXXi+2vo+Llid1Z15rHf60hjHB6kwcOhbmYyWZ53Ts67wuop
	Wpxi8LSB8WlYRYJCe8cyBtTqIGduINRYR4Oylxsl8
X-Gm-Gg: Acq92OHytWt7qQoOPKXUhueq+6yoxgxEFA21IYM0mlJQqevQ5o2hJrkbmTf3LpLLUG/
	LQnEQF1P0Pd38RdBHCu6YrPz1y0XFKkYbGehWZ/jHmJV3s0a56B8jeXKDLS1JiCNhkKlUrn3i9W
	Z9geHwHYrnWhrf7aiRaL/AdrxuumudiDAOu1JOaeV/tpwKnu3U6tFR29JHMsNxFmxuw2puqZSMU
	lssIB0bhL61a4g+XKpW86wCvv4HMU/KsZUEPuHKNESp22U4JwUjii5cr2LR5nqJksixxu67hpBo
	6J5JPVU=
X-Received: by 2002:a17:90b:1c0f:b0:366:4782:139a with SMTP id
 98e67ed59e1d1-36951a6c339mr19943112a91.17.1779220972406; Tue, 19 May 2026
 13:02:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2026051347-clustered-deflected-9543@gregkh> <2026051350-reacquire-sculpture-4244@gregkh>
In-Reply-To: <2026051350-reacquire-sculpture-4244@gregkh>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Tue, 19 May 2026 13:02:36 -0700
X-Gm-Features: AVHnY4J-uPC7UedCsxNOPs7U35wzpyG84O4lFz2Uy0n1uVoE1IldM25unTpehjE
Message-ID: <CANFp7mWHf1TUg20KoV7QAym=LenpAUSfr=P8gyamsHJog22aig@mail.gmail.com>
Subject: Re: [PATCH 2/8] usb: typec: altmodes/displayport: validate count
 before reading Status Update VDO
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, stable <stable@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37739-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhishekpandit@chromium.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:email,mail.gmail.com:mid,chromium.org:email,chromium.org:dkim]
X-Rspamd-Queue-Id: 411955847D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 13, 2026 at 9:14=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> A broken/malicious device can send the incorrect count for a status
> update VDO, which will cause the kernel to read uninitialized stack data
> and send it off elsewhere.
>
> Fix this up by correctly verifying the count for the update object.
>
> Assisted-by: gkh_clanker_t1000
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: stable <stable@kernel.org>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Reviewed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>

> ---
>  drivers/usb/typec/altmodes/displayport.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec=
/altmodes/displayport.c
> index 35d9c3086990..263a89c5f324 100644
> --- a/drivers/usb/typec/altmodes/displayport.c
> +++ b/drivers/usb/typec/altmodes/displayport.c
> @@ -405,6 +405,8 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
>                                 dp->state =3D DP_STATE_EXIT_PRIME;
>                         break;
>                 case DP_CMD_STATUS_UPDATE:
> +                       if (count < 2)
> +                               break;
>                         dp->data.status =3D *vdo;
>                         ret =3D dp_altmode_status_update(dp);
>                         break;
> --
> 2.54.0
>
>

