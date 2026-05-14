Return-Path: <linux-usb+bounces-37451-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEW8MGFIBmo3hwIAu9opvQ
	(envelope-from <linux-usb+bounces-37451-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 00:10:41 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 472E65475AA
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 00:10:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 90854300A123
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2026 22:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57D4A3A719B;
	Thu, 14 May 2026 22:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=motu.com header.i=@motu.com header.b="An0PHfzc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B1C34B183
	for <linux-usb@vger.kernel.org>; Thu, 14 May 2026 22:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778796636; cv=pass; b=l/49Wbmd71SFNj7n7Ymr7yHoQNg6DmG1+6n+bL3yxdhQciaHcvE4JDulxpvS8rcd71BR21+P4xMDNl/EW0rtCiAD3l5LfbnPUCYZma5pS3EgHWlE//zRGnazoQIAKu3BipkGs2jLctGNGw/n7c9RX5SRfB3ZKLeHjXbByJUjwEs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778796636; c=relaxed/simple;
	bh=prYYiHjJJLt9l4vZUGNgLBCvZgXxWClHD+ok0RrFzpA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sX04GdMZliAGAqLjsWj7dN9yKmj6EubzkDK/d6pDv7u+caO0nOrFv3wQXLBz5OczHliaSrwH2WLhfwhgbfjogesOEgufI7ysTK+mr2RRUEq1DSNNYmAyNLw2Kd2lgYcMJosE2qWn70nix1cG2lKXpDzIclDpFHOcenxq+ufzPE8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motu.com; spf=pass smtp.mailfrom=motu.com; dkim=pass (1024-bit key) header.d=motu.com header.i=@motu.com header.b=An0PHfzc; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=motu.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-67bb5ad91bfso15905117a12.0
        for <linux-usb@vger.kernel.org>; Thu, 14 May 2026 15:10:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778796634; cv=none;
        d=google.com; s=arc-20240605;
        b=cVrYUHtq+NF7dPBMz30ExaWwu7pk0GRUfyw/JG4k1ZOCrWVuuO3cgMZP3SbpciUvHF
         dwHMG0cVaY9CxrbMaAlocD0mBKBGOAarg8nH3HBRbAqpIAb5qYxl8UJlVzmb+GsK6jkQ
         jtu05z3/hAzhZTfHmk0IHtL0faLUZoGlCq2ahoDqNb35pZijnPEBfp0ZjaZfbCqFqrsy
         sXvAKwyhxdkz7Up25GYRhFjd3ABFyAj7EcCVFwoHLhNmaBsHT66Yfw8ecZnF2uZLMRD7
         V1oO5EDGGvBtFMyqULAOAPxgi7rW5C3cEFKAuy1DDlPO3NrRU7UkHqzQLXq/PvUouMFv
         UCMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=prYYiHjJJLt9l4vZUGNgLBCvZgXxWClHD+ok0RrFzpA=;
        fh=jA9VJ+uTtbvzISnzOXt6TMstsHaDJBK4obk0VKr51Ho=;
        b=iRBsK2ro7yp4befKZt7aDxci9BzhRSVc2TDaynCLFTwaw7/iHQRWfgjhTc4behUgho
         s5JmG6h9VXMumtn+EEokdrDlBCnG06txcIIqZUo/YsksgAARcqbchN45fLP7+USujsJw
         RJTXAfajoqOJtSr/l6MoL7VeItzNsvgHuS+XXBkztEWReCGHlDe9I7ZxueLyWjIJskSN
         4qaTCzBFmvJXYuAcLtLIQ6i0AJbHrz+DndxyLj1K1G1LEP2p3gOVo29ILhXaV3T82cZW
         rITZUbArs0OfJLosHt5L0nxWW/0kJXr5FHOo1K8kZbKfErbIa+HZw+FqM3677vhsuq8c
         Yerw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=motu.com; s=google; t=1778796634; x=1779401434; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=prYYiHjJJLt9l4vZUGNgLBCvZgXxWClHD+ok0RrFzpA=;
        b=An0PHfzcTQJyaT9Ekk3gDe7V4CjC63/zIMI4oFpdAnTuCl5jNLO9gnhpU6mwTg2Oe+
         f73wIHqFM/suVQaQPKGL2sV3YwDUYBvSF8DDs5APkB2b8NmQa9oKiZgS6IeE3m0Afocn
         u2k7Msu6pNJbule6rozFGiU2VWPbZG8Qbj2Ms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778796634; x=1779401434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=prYYiHjJJLt9l4vZUGNgLBCvZgXxWClHD+ok0RrFzpA=;
        b=EH/cgeL79DYFrb3CVVjGr9fUbRQADA4MTMgHPv4Cks1qzyGMS7f5T6pEDvKav3pLwF
         taFNkRtGIe7GKMcI/ud49gNFkGxUTpN6RoczmeBO97Ao5TV/WtrgcJqf0BoQgUGTMosM
         sXqueW2ZFkBB0KFOVPBUW37OJxKXkCRjZ5iOxXbirOXXB8yjnuqyZ/LQCXtkETKtRWh5
         JeywgyFG/rykbpkN058YwUKyt8ABSJHiSzpjKCsnHZjpL+J3MQuk0qCxE/faTMoOrOAU
         BtFjBnxBC4CvamMyU65cgbeg+3QnRU3VDJJG3Zqq5M1sykRZC65QPgn6nEwp+Pk27VHy
         oKKw==
X-Forwarded-Encrypted: i=1; AFNElJ95i/IXJwRiQsKcEnUkwTBSARhASp8M9Ta07cw6NfEkFAg7d1/vOwzj3hYA6qOXcsB0iuFC75Jx5CA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEo6A6HVnPjx6zvVBxWTBQBvW3os3LuIdzc8kt1ENUAnuBPaQV
	1R/wUaKNuyA5Zj6rv1bu3IwR1Ru7BSF5+9UxeRY6Fa5FodvwRHqNtbbUleIaGACM/85DwQNj63T
	Ra+yxZH5WhKnRq09mDsCs/2AIZPiEk4Q90FPs7yLPCg==
X-Gm-Gg: Acq92OFN76SeYTR93doGuPZjFks50xchzqBUyAarNqHBHR7DOW5jqUyu+rrjccadq42
	leeS97OlF92cTzOaUYe7CmLsUAURKXvy+N6djvW6cfPYgLm72fuhTuUfnyLX31Py/d4WcNwgoPK
	uvQZCVbl40NB1hGvFVM1XdfXq5ZLxJYy/cRyKMe+DoKuN5YmwkOC7+AahTC50XlizyNv2X4H4GJ
	mPD1sO8jM1D1jFfqajy7pR4HLYRR4BlmPcu0lLnC1dGu8fDIjq++e+cdCgrAcHtBR4vOUzzZSR2
	JGRemSBZzo8b+6IS/S4G9RU6L+WuO9N8ALq50o/jwQ==
X-Received: by 2002:a05:6402:4342:b0:672:bdaa:3e75 with SMTP id
 4fb4d7f45d1cf-683bcc9e48fmr588019a12.9.1778796633840; Thu, 14 May 2026
 15:10:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+Df+jeoj_QL6XNzUyP963HF7ngCWoAs0MjqQXPr3Fa6VW3rXw@mail.gmail.com>
 <20260511192105.3756809-1-mathias.nyman@linux.intel.com> <20260512110810.17fbde0a.michal.pecio@gmail.com>
 <85f8441d-d6c0-4607-9269-d80b1294afbd@linux.intel.com> <CA+Df+jf79bnONyXUnf0_zAUrqNAVzy1zt9VCivbxYvkedfGHRQ@mail.gmail.com>
In-Reply-To: <CA+Df+jf79bnONyXUnf0_zAUrqNAVzy1zt9VCivbxYvkedfGHRQ@mail.gmail.com>
From: Dylan Robinson <dylan_robinson@motu.com>
Date: Thu, 14 May 2026 18:10:22 -0400
X-Gm-Features: AVHnY4IxcnYmJUBCXVlGZe4UJP93VxDr4pbevnH5FXgzJ5Fhixy8hLiOTu6HQ_w
Message-ID: <CA+Df+jfB1PnvTgDcNJpXraLr2H9L44TgUPwy03hf-zAPWsdvdw@mail.gmail.com>
Subject: Re: [RFT PATCH] xhci: fix frame id calculation for isoc transfer
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Michal Pecio <michal.pecio@gmail.com>, linux-usb@vger.kernel.org, 
	mathias.nyman@intel.com, stern@rowland.harvard.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 472E65475AA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[motu.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[motu.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37451-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,intel.com,rowland.harvard.edu];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dylan_robinson@motu.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[motu.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Thu, May 14, 2026 at 5:16=E2=80=AFPM Dylan Robinson wrote:
> Testing this patch on a non-CFC host with a bInterval =3D 1 device

That email was about v2 of the patch. Just realizing I responded on
the v1 thread.

