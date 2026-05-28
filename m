Return-Path: <linux-usb+bounces-38118-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEoWDwq6F2o8OwgAu9opvQ
	(envelope-from <linux-usb+bounces-38118-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2026 05:44:10 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA7B5EC457
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2026 05:44:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 16B99302D310
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2026 03:44:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B92430DD1F;
	Thu, 28 May 2026 03:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="po4ZdZ6P"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A566017A30A
	for <linux-usb@vger.kernel.org>; Thu, 28 May 2026 03:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779939843; cv=none; b=BUgk+QZx4HRcGSSpy+yPK3Phg1n9JdC6da/81ez2GSqrV/ku6UnHDxUazn0m25HoxlDfdTE/M0NeWUamYR1uJwNbj3kBkIM7MlmPbm9l+O3nd0USdcbRFBqwYodT8pGvn/b9rnB+FAyyF4F//01jODtP3EfG/XE4nxLQN0j6B6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779939843; c=relaxed/simple;
	bh=NsTIyMeXJn8h2xIDwOz+QGYKegXoQSBAwdhImJ+Ri0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O267yEQNX2owpL/EJPUjUgRc8iScMlgsiEsqgFnkP/SxlvdZuiYC90t6klYyWrecj9DS5QW2Im5h5to5uH+Ir79qJSEkGRCDYJKHBQ43jM0YhzlhQLCok/t7U/tjrhKsKCfHBR99fDFfBZsEhLumU99Z8gGzqFOOpNrwKqR+hzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=po4ZdZ6P; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D8B703F7FD
	for <linux-usb@vger.kernel.org>; Thu, 28 May 2026 03:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1779939838;
	bh=QVdeuz+QoVJvULpmGgf66uGnzncOj1822+cFm5CY+DQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=po4ZdZ6PGfCcFKltx2nL9fF0lLHgxeFWI654quInOV4En9YxkzZV8z24CxhVtXQ9P
	 fxLnUal5UG9LzVIDYcYsffFgMNe0iLE+UAl6Q/0EbOKnPJnO60IFCeLeef4hB98XC2
	 spOdDcowymVMes+PdZL2h4dt5zBHiVCIA7jp7He6fQSmsDxpLD/4T87D7troGMUaI+
	 n3VlsvbJQ50PEpoQM8pBLaQHBa1eM4xqu0CzrjoE3+hhvpirRriKkM2jhP798YhRyh
	 iqUrkv6BfgSUcjqB5aTHmOgiTauueZQZpKayP+PO0UZP65LGWA8U+SA1HxrO9LJhry
	 oiyiNPO6z/897peud3x9TvyD4ju4lAO9u6TNQHVvDE586aeddxB2ykglcRDCf1BEOc
	 uXXIvtCga1dmDp33JhtZxDkl/5wG54ezBGkyHuuLC5l1TrdjdoKd5rqOX9wTKEbXp5
	 J2UCvW6lGLjI0D2WnIYREbCPV2jMHTFh5V+osgo7evVoP1hjoSZeAUQrBdF3gAQbtY
	 MjNLu+VJpa0ySg0jM54oSsknp94hUViUIHwYuZf67qThYbrTBN91nK24GVOOiM2577
	 1cKveZkLe3I2yMq/qSrtKP/3ZYF1HMt3+5AavlRlcK4//9jXtTlbkapQQhHZkUHesm
	 wGpc/H4FsiImiHj0DoWjVCTw=
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7bdecb2f4a7so105650207b3.0
        for <linux-usb@vger.kernel.org>; Wed, 27 May 2026 20:43:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779939838; x=1780544638;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QVdeuz+QoVJvULpmGgf66uGnzncOj1822+cFm5CY+DQ=;
        b=kca/4F2ZbsmAkXn3ALKNhO0oqnuVNyHgGyvWYOUN1BhfGFtbxmE2+4JPAWkBsuaZxd
         qdkyDfOfq4WHUKiKUga4c/nylcCHVT338vGnp3tfoRw8XnhpptMxbo3rLqt8NBDPQ4Qs
         CfBY4pz/hR3ErSfkokTNJq5gzJ7h8QQInR8i4g8PUjvFp4cQ3D1MqPGoRwWbzIzL1cPn
         olPUdtZ1ktbSYnpPMewX3pcBfimRUDGtUSaIZwHDluaruPtdUmdzByfXywuWC56matmn
         nLFEJkE7tJ+cQvLHFtLBZe13FdSqbysz57nxy0iSRJbYCSiLtijeWxM7CTTOfjFUT0ZP
         WnJg==
X-Forwarded-Encrypted: i=1; AFNElJ94HD1PFmxod+BioSpjADXkhWYis85enNWCxc7ePK+bKA8/SUEXsER4p8zGDur0yyFE+70US3bDHIQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzP7uYlH6NLvVbJiCpjsldhYbBHeOsdzWgRiekwRnuVsKr9tjPN
	xCK6kW9Ao03xH0uwllCw+WxE+wkfIqjOzFr8zBbsIdLP/A+SdVCeGzmWBbSR3RBY1M5w2BE4XkC
	H4apjhsL1gGQQT9VkFsdy0oGZ7Z5K3QwTv9B20O0VSGA6/YxSu+6Efedo0Ba0XLFJqxDXnU8HNV
	CjJg==
X-Gm-Gg: Acq92OGbI5Ntg28FPxYZdanj3Ra8LlvPCaRqbxi8ZGiZkM8DHhPdOZzsAFevtXU/l6r
	9kSKcm/cUlpTiD2rOG70Bsd7SUgyhflEEJNbhoCm+auhl8fok/ko8eDfm4hz/PGvoPYtu3ydVhQ
	59xx8Z7mdTmfUYMlNvFKRNntUhM9OFuvZejETZ+6mlmuttjOnTki2fmeOX82C6hmx0N2LMfA4sj
	fJKOrKPqPU6oYMgn6dmpRmoMKh5eSg4oWjvMz46SLP8Efr0xTfwP9g4t34nieeV8TzXMTF6bku2
	2Uc3Moceag6qXcg2fuF2n0Sgi+R2Fhddi1k9EDATx7VGzXIL6ODeUWY/Iaw+BhSTfeoo6pnblJr
	qsO3XCkgeI707ztpvrJyAjeSVZiRXu4OH2hVoPVvDVKiH5z+PSeRcyJVm06iWQcMjYpC17kRr7+
	9eutgApsHjbtTm
X-Received: by 2002:a05:690c:6b04:b0:7d0:3bbc:c81 with SMTP id 00721157ae682-7d335fbcccamr275565677b3.13.1779939837824;
        Wed, 27 May 2026 20:43:57 -0700 (PDT)
X-Received: by 2002:a05:690c:6b04:b0:7d0:3bbc:c81 with SMTP id 00721157ae682-7d335fbcccamr275565467b3.13.1779939837459;
        Wed, 27 May 2026 20:43:57 -0700 (PDT)
Received: from acelan-Precision-5480 (211-75-139-220.hinet-ip.hinet.net. [211.75.139.220])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7dc3c8ec6dfsm7459867b3.22.2026.05.27.20.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 20:43:56 -0700 (PDT)
Date: Thu, 28 May 2026 11:43:47 +0800
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Mika Westerberg <westeri@kernel.org>, 
	Andreas Noever <andreas.noever@gmail.com>, Yehezkel Bernat <YehezkelShB@gmail.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/1] thunderbolt: Fix blank external display after HRR on
 USB4 v2
Message-ID: <ahe3zpDyPVj2QRcL@acelan-Precision-5480>
Mail-Followup-To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Mika Westerberg <westeri@kernel.org>, 
	Andreas Noever <andreas.noever@gmail.com>, Yehezkel Bernat <YehezkelShB@gmail.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260430073145.331419-1-acelan.kao@canonical.com>
 <20260430100311.GE557136@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260430100311.GE557136@black.igk.intel.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[canonical.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[canonical.com:s=20251003];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[canonical.com:server fail,tor.lore.kernel.org:server fail];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-38118-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[acelan.kao@canonical.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[canonical.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[canonical.com:url,canonical.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: AAA7B5EC457
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mika,

Sorry for the late reply — I was away for two weeks in early May.

On Thu, Apr 30, 2026 at 12:03:11PM +0200, Mika Westerberg wrote:
> Hi,
>
> On Thu, Apr 30, 2026 at 03:31:42PM +0800, Chia-Lin Kao (AceLan) wrote:
> > Hi,
> >
> > On Dell XPS 14 (Panther Lake) with a WD22TB4 Thunderbolt dock and BenQ
> > PD2725U external display, the display goes permanently blank on ~50% of
> > boots. The only way to recover is a full reboot — re-plugging the
> > monitor or dock does not help.
> >
> > The root cause is a race between the USB4 v2 Host Router Reset (HRR)
> > and the graphics driver initialization:
> >
> >   1. nhi_probe() performs HRR at ~t=1s, destroying BIOS-established
> >      DP tunnels.
> >   2. The Thunderbolt driver re-discovers the dock via hotplug at ~t=4s
> >      and attempts to re-create the DP tunnel.
> >   3. DPRX negotiation fails because the graphics driver (xe) is not yet
> >      ready — the 12-second timeout expires at ~t=18s.
> >   4. tb_dp_tunnel_active() permanently removes the DP IN adapter from
> >      available resources on the first failure, so the display never
> >      recovers.
> >
> > The fix adds a retry mechanism: on DPRX negotiation failure, the driver
> > retries up to 3 times with a 5-second delay, giving the graphics driver
> > time to come up.
> >
> > Tested with 13 boot cycles on the affected machine:
> >   - 6 boots hit the HRR + DPRX race: all recovered via retry, display
> >     came online after 3 retry attempts (~58s).
> >   - 5 clean boots (no HRR): DP tunnel established immediately.
> >   - 2 boots with HRR where DPRX succeeded on first try.
> >   - 0 teardowns: the retry mechanism was never exhausted.
> >
> > Full dmesg log - https://people.canonical.com/~acelan/bugs/dp-retry-on-hrr/
>
> I'm looking at that but the first thing that stands out is this:
>
> [    1.051684] thunderbolt: loading out-of-tree module taints kernel.
>
> Which tells me that this has some potential modifications outside of the
> mainline.
>
> Second thing is that it's missing "thunderbolt.dyndbg=+p" that could show
> what is going on there. I suggest adding that pretty much always.
>
> Yes, this can happen and the 12 s idea was that it accounts for the
> possible time that it takes to boot up (as well as the polling the i915
> does if it is runtime suspended). I would say that whatever is delaying the
> boot time should be investigated first because that's not really good user
> experience.
>
> Aside from that if you add "thunderbolt.dprx_timeout=-1" does it work? If
> really needed we can increase that a bit but I'm not too enthustiatic
> adding code for retrying this because we do have this timeout that we can
> adjust as needed (we can make the default higher).
Thank you for reviewing and for the helpful suggestions.

I have an update on this issue: we've since discovered that a BIOS update
(from 1.2.1/1.3.1 to 1.5.1) on this Dell XPS 14 (Panther Lake) appears to
have resolved the blank display problem.

Looking at what changed: with the old BIOS, the firmware pre-established
PCIe tunnels through the dock during early boot — the dock's xHCI
(07:00.0) and the OWC NVMe (18:00.0) were already enumerated by BIOS
before the kernel started. When nhi_probe() performed HRR at ~t=1s, it
destroyed those BIOS-established tunnels, killing xHCI mid-probe
("HC died; cleaning up") and causing the NVMe probe to fail with -EIO.
The subsequent DP tunnel re-creation then hit the DPRX timeout because
the graphics driver wasn't ready yet.

With BIOS 1.5.1, the firmware no longer pre-establishes PCIe tunnels to
dock devices — the TBT root port (00:07.0) doesn't even have IO port
space allocated anymore. This means HRR has nothing to destroy, and the
Thunderbolt driver handles all tunnel setup from scratch. We ran 30 reboot
cycles with the full device set (WD22TB4 dock, BenQ monitor, OWC Envoy
Express storage) and saw 0% blank display rate.

So it seems the root cause was the BIOS establishing tunnels that the
kernel's HRR would then tear down, creating the race condition. The BIOS
vendor fixed it by leaving tunnel establishment to the kernel entirely.

Given this, I think the retry patch is no longer needed for this specific
platform. That said, the underlying race (HRR destroying BIOS tunnels →
DPRX timeout → permanent DP IN removal) could still affect other USB4 v2
platforms where the BIOS does pre-establish tunnels. Would it still be
worth considering either:

  a) increasing the default dprx_timeout, or
  b) at minimum, not permanently removing the DP IN adapter on the first
     DPRX failure?

Thanks again for the guidance.

Best regards,
AceLan Kao.


