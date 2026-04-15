Return-Path: <linux-usb+bounces-36247-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJExNQZ632nFTgAAu9opvQ
	(envelope-from <linux-usb+bounces-36247-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 15 Apr 2026 13:44:06 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39276403F8C
	for <lists+linux-usb@lfdr.de>; Wed, 15 Apr 2026 13:44:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6743D3014BEB
	for <lists+linux-usb@lfdr.de>; Wed, 15 Apr 2026 11:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 665E534A3DB;
	Wed, 15 Apr 2026 11:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rnomJd9M"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A8D33EB0E
	for <linux-usb@vger.kernel.org>; Wed, 15 Apr 2026 11:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776253293; cv=pass; b=Gmws4o9Sj1mDIREZnYgv+CfaLwhPAmLJSlExukTCJvLkjQNp/ItEcaZWrCn0rLVcndz3oBuK7+BYIMuSbdgpnO+ZJ+UEcfWzZj1OyWtB/YyyP4gnCbAh9Kz3IyyMzi8Szce3hS182BTtOgBjpAcsl2HE7MBfz8+umINPMnwAkms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776253293; c=relaxed/simple;
	bh=XtvTXhSZYqUwWyop+bM9L7kSLPdbl+twBxtseI9Z8Zg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AZev5rOx1Ng7QFiXqiKtjtGDpNYPzseJXBvOLxvsX9Xc+AP1AeQKxrD+NHsRJzKVwsTumCQO2lTzrrnPe7rv8SOG31i0tOv5w/vGaZkI2SzD23UXHx8g4aMLu6aAUcH8mHVH8SuKoVrLgmm+HrodUMsjD/V/lW89RJI+epmt91U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rnomJd9M; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-651bf4a4140so3955553d50.0
        for <linux-usb@vger.kernel.org>; Wed, 15 Apr 2026 04:41:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776253291; cv=none;
        d=google.com; s=arc-20240605;
        b=YDGQd8/6AEP2brJMB/NDF6ZPx6KjQ1FRr2cf79e5NXeBS49Qp9mZezIAqthi7ANivQ
         P3otmHBGfURrJdarbSJH2u/uISGZhIUpHB1w1eLSnaEvLlROizuzOZkqzm3skXybP3M5
         Xn2yzEYU2dFA8QN1mh+TCFBJMprC9VuXFyOoVnGDhjc6NFeT8fq+ZeOoeRhiHOsQCKxv
         QFU9D3oOAONTWaHPVWcbhpKq1eH8kURS+mYQNn+qHTMQJuty8iGmfgD2WGpLwGaYEsGn
         hCd0b0uEKkBu6PhYjfC4Fh3yDHtCgHLVk4+IDAkeWHs3wyxmDbMguckWOkK4TCkV6czg
         dPWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h2zOB9TAg/s8m5HPIg6Gu5ZC7aBbUnPW4iigiNwSb9k=;
        fh=m3kMK+8hLg7Az/x45Jz+UYr6QDJ69x+rnefpMpYOQJY=;
        b=XwVIFsn7ktQwVNOVH5xbFLAQbAlEZqc/AgfNU6l59/ITm/ZExzzb/l/nN/4svXaTGM
         9HY7f2dlx/4du94qxKmN/tNkcvmzmMn6rxagVwbgwgyZwkVBrUqaKHeCmtGB4DoAR2M7
         N/Hf69jVxrI3tUgKN0A8zuPGZesZowARrpPZhPxZ/y8PTyBvSLrR0HHhSoXoKWEMQghh
         jO1OswvTcp/8phpvb3+c2Qd4EGksXFnQ9PGbQ8TRmeTRri0uVQtCrVs+Y9F6tt4ffyK6
         lbXrj94Wra1qju+S5fHqODBPZS0dZXC3YMhrGvVNYO4aAJbOREFzRbffZi5fjFg/PJ9j
         cDnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776253291; x=1776858091; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h2zOB9TAg/s8m5HPIg6Gu5ZC7aBbUnPW4iigiNwSb9k=;
        b=rnomJd9MMJKYtKg7kuGDO8nEsS3VWRlvGHj0yt7ySsqUM3x6q0V6yX3PFc78oytbq/
         GcfO9YJNJVwsr2Lq6CgrHnx7Z2BBGCdbSmlQC9liUC4IwkfJepot5IbNehBXsJMb/05Z
         gsa+sWEyq24A7Ewn5J7AcFmKnZe4Htaw26Ne1xxfHkg8yOZhINWFLXmdomfiRrc5Wg38
         BbiZQ1XQjb/aY9cEczcP4GCm1KW+m3TrX8Jjp29vL/q8/xe2lMeBAG9achzjNEPhM8ha
         CiIrwqAE/Oam+x10t18OQJrUybdPT4m8G3jzNny3GlpbxgKQ9BGTTGaD8Ue6Hs+GEqxi
         tNCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776253291; x=1776858091;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h2zOB9TAg/s8m5HPIg6Gu5ZC7aBbUnPW4iigiNwSb9k=;
        b=YUYGNNgLX13q/VvnxJl8Qetk1m6VkudZO7eovaiC0Y3+rpftW8XVYtmvM1QpvdWNBv
         EZYK6oapbB4PJJGdcLiNaG1YkDFeSaX71AlUgueVfdLksJCgAoXX0M3TcydruwphscmD
         jl/kLyK51SPzc2eND1/awqH81ZQkWElIvWWPzz716hyO7PyGpNH2k/OVU+tDnpriKu6e
         52D7l7A9sEnEsFDtpOWB3/vTr+xm9b2QwZ//7ZnqGBg388iObjdGR8ybgrIoIGLgYQYC
         m1xwF8jrLxGr4K3URnBxLFIii/yqQQx25Le6M2nxJFtjPPjxMBWAgpuOcr5aERHe191K
         NfgQ==
X-Gm-Message-State: AOJu0YyFLDI+mj1k/41J/qc5+FMHJu34GxwNbraJSAL8ReWqeRRNQm/f
	MjlRW7pXQVOO1n2vM3NTZyQoAKZLhAGufEPbg67h7VyO3NQskJEClpQ/y535xUO12f/P/LVcwqG
	J2d75lKEFXDCb2zSOTStn1XTirLgt21Y=
X-Gm-Gg: AeBDiesATHq+Oh+I9+R/ObMatQ7NfGmEGfO7GOvkLOkaBXYFLyf3wxjNkcWzLRRYMjB
	iMZxZf1l5/h8WMYNdpFQNHYnjk2YKrOE6YJu0s9lrf6rfRIG8OcLjOKuAZYHFydayR+4LJgXg9p
	/eHl6Z6VpytM/dmGDkmqUhwe+qMkWeGRKIBMxgtBFcMgDn7A98VDajmaW5VICvQrf5KkSyBcWg6
	M37U6BUrjiiHoddQ/cv5J5+oTwUWIavNJerdMrStz9vKmcPq2Yr4uvbcS46Gbcc4gV+vveFSxwA
	TMDlHbXXU4hD+9xCCC+RIPfOcdZWOIjlt8f6LB1Y3lyrV5o=
X-Received: by 2002:a05:690e:4087:b0:651:b774:5f65 with SMTP id
 956f58d0204a3-651b77469eamr14707540d50.57.1776253290931; Wed, 15 Apr 2026
 04:41:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260415032335.2826412-1-michael.bommarito@gmail.com>
 <20260415032335.2826412-2-michael.bommarito@gmail.com> <20260415045246.GR3552@black.igk.intel.com>
In-Reply-To: <20260415045246.GR3552@black.igk.intel.com>
From: Michael Bommarito <michael.bommarito@gmail.com>
Date: Wed, 15 Apr 2026 07:41:19 -0400
X-Gm-Features: AQROBzBiK2K2kOfuGetdT2HWOxscLehtzCui_N48TT7VXvWcAO_8-a8BpIp726w
Message-ID: <CAJJ9bXwb+de7k3cYZ2nbX1bBFjLC_qJVS36UNfxwGBuPd_DM4w@mail.gmail.com>
Subject: Re: [PATCH 1/2] thunderbolt: property: harden XDomain property parser
 against crafted peer
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org, Mika Westerberg <westeri@kernel.org>, 
	Andreas Noever <andreas.noever@gmail.com>, Yehezkel Bernat <YehezkelShB@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linuxfoundation.org];
	TAGGED_FROM(0.00)[bounces-36247-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michaelbommarito@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: 39276403F8C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 15, 2026 at 12:52=E2=80=AFAM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> Please split this patch into 3 patches that all deal with one issue at th=
e
> time.

Will do.  Sorry for the verbosity and bus confusion!  Look for another vers=
ion
shortly.

