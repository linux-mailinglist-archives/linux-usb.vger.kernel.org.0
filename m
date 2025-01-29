Return-Path: <linux-usb+bounces-19832-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 887F8A21B28
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jan 2025 11:45:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD120165156
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jan 2025 10:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 252E71B4121;
	Wed, 29 Jan 2025 10:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="dhiTEzjf"
X-Original-To: linux-usb@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FB3192D63;
	Wed, 29 Jan 2025 10:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738147542; cv=none; b=bHmFhnAj98jXwY1ICaKyIDDFMRzDHgqEljuuQ5Bo54MLe4r3ziVZSIRkLtfmkg12U3CsbbIRFeS75sQ8UxagCKuQBScofX2ngRRe228+JSK6oDIwM4n68jB+Be3hRBO7W3U+MKDdUJvK38orNh+EtQ8QTo6AktldsR0QkbVJhTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738147542; c=relaxed/simple;
	bh=fnZB+WHIeCVcb+2DB4NU8Zo9150QatZFoj/9+nCMf/o=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=CxjAYSHorxLdzjt/selfIMKAb9DcuvbpystkQJ5pImpy77pgxZ7YEkGBqaFE7Ml7zja3wQwRmqpCHR+04ywwgPQJiUvkvrCjXeEQtFDTqL2rJ+9LuKyz+oW7QbQn6h2HylwQzPzYcEjdjWs8zJBRpFHg0a8wR4izf0QRtXu8Ptg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=dhiTEzjf; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id BED2E43301;
	Wed, 29 Jan 2025 10:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738147532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0gWsT2QUtcIY6qzXcxBzojVwLzUzymdMjkB+76pdjF4=;
	b=dhiTEzjfelUuJcSJBmmydfSW8+l/e7M62Q9nECqQqEm0G95IP+L+DqZhhiHC+GeTWTGzQo
	dibUXuSrtCkPeFNpZFsMPgmm8xt5HObOa/4BD6aeR9mnZLS44Y/LjR28GvlnWyGwjc9p7g
	MC5kBhOAUsvlAdec+mYMd4A7HGySZAbmDoUt9oqgvnq4YnpdQaIu0+MNKt2QiwEYcGU+gM
	wGOgzlBe4r3U4qZyTQayU4qnzKYCwlp4LQ9tx/AcIbzggzPreh3h/HOOqZjnRAJyettq/+
	I2Mk4T3eQgacZ79Ea8E5K74VO7WSR/Ut9Eqk2M1PuBfLSVSDNh89N5YT+Tp1Zg==
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Jan 2025 11:45:31 +0100
Message-Id: <D7EHVKGXIFM4.3IDSI7TDG85AV@bootlin.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH v6 4/5] xhci: introduce xhci->lost_power flag
Cc: =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, <linux-usb@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Mathias Nyman" <mathias.nyman@linux.intel.com>, "Roger Quadros"
 <rogerq@kernel.org>, "Peter Chen" <peter.chen@kernel.org>, "Pawel Laszczak"
 <pawell@cadence.com>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Mathias Nyman" <mathias.nyman@intel.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241210-s2r-cdns-v6-0-28a17f9715a2@bootlin.com>
 <20241210-s2r-cdns-v6-4-28a17f9715a2@bootlin.com>
 <70aced7f-0311-43b9-96af-c8325c39ff2b@kernel.org>
 <D6AP7JCNSME9.3FS7XCZJ37GM8@bootlin.com>
 <ed77988a-ba26-4a71-a8cf-b1e5a6425a2e@kernel.org>
 <D6F0L2L02YIS.3D2DW1P7691L4@bootlin.com>
 <D6WN0T0DLMFJ.30GP099520IHT@bootlin.com>
 <e181717a-8b3f-4ad4-b075-95c95888ce5c@linux.intel.com>
In-Reply-To: <e181717a-8b3f-4ad4-b075-95c95888ce5c@linux.intel.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvjeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkhffuvefvofhfjgesthhqredtredtjeenucfhrhhomhepvfhhrohoucfnvggsrhhunhcuoehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeluefgiefgtdegfeehjeetteevveejkefgiedtkeefteejgfdvkeffgeejhfduieenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeiieegsgemfhdtfhhfmehfvgdutdemlegvfhgunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeiieegsgemfhdtfhhfmehfvgdutdemlegvfhgupdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopehmrghthhhirghsrdhnhihmrghnsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheprhhoghgvrhhqsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehpvghtvghrrdgthhgvnheskhgvrhhnvghlr
 dhorhhgpdhrtghpthhtohepphgrfigvlhhlsegtrgguvghntggvrdgtohhmpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepmhgrthhhihgrshdrnhihmhgrnhesihhnthgvlhdrtghomhdprhgtphhtthhopehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: theo.lebrun@bootlin.com

Hello Mathias,

On Wed Jan 8, 2025 at 7:43 PM CET, Mathias Nyman wrote:
> This would be a fourth way the upper layers inform xhci_resume() that the
> xHC host should be reset instead of restoring the registers.
>
> option 1 creates the first dynamic xhci->quirk flag,
> option 2 adds a xhci->lost_power flag that is touched outside of xhci dri=
ver.
>
> Neither seem like a good idea just to get rid of a dev_warn() message.
>
> Maybe its time to split xhci_resume() into xhci_reset_resume()
> and xhci_restore_resume(), and let those upper layers decide what they ne=
ed.
>
> Doesn't cdns driver already have a xhci_plat_priv resume_quirk() function
> called  during xhci_plat_resume(), before xhci_resume()?
> Can that be used?

I agree with your feeling: another solution is needed. Discussing the
topic gave some new ideas and I have a new solution that feels much
more appropriate.

### Opinion on splitting xhci_resume() into two implementations

About splitting xhci_resume() into two different implementations that is
picked by above layer: I am not convinced.

What would go into xhci_reset_resume() and xhci_restore_resume()? There
isn't a clear cut inbetween the reset procedure and the normal restore
procedure, as we might do a reset if the normal restore procedure
fails (with some logging that reset was unexpected).

We would probably end up with many small functions called by either,
which would blur the overall step sequence.

### Proposal

Instead, I propose we keep xhci_resume() as a single function but change
its signature from the current:

   int xhci_resume(struct xhci_hcd *xhci, pm_message_t msg);

To this:

   int xhci_resume(struct xhci_hcd *xhci, bool power_lost,
                   bool is_auto_resume);

The key insight is that xhci_resume() extracts two information out of
the message:
 - whether we are after hibernation: msg.event =3D=3D PM_EVENT_RESTORE,
 - whether this is an auto resume: msg.event =3D=3D PM_EVENT_AUTO_RESUME.

First bulletpoint is somewhat wrong: driver wants to know if the device
did lose power, it doesn't care about hibernation per se. It just
happened to be that hibernation was the only case of power loss.
Knowing that, we can refactor to ask upper layers the right questions:
(1) "did we lose power?" and, (2) "is this an auto resume?".

Then, each caller is responsible for handing those booleans. If they
themselves receive pm_message_t messages (eg xhci-pci), then they do
the simple conversion:

      bool power_lost =3D msg.event =3D=3D PM_EVENT_RESTORE;
      bool is_auto_resume =3D msg.event =3D=3D PM_EVENT_AUTO_RESUME;

Others can do more more or less computation to pick a power_lost value.

### About xhci-plat power_lost value

In the case of xhci-plat, I think it will be:
 - A new power_lost field in `struct xhci_plat_priv`.
 - That gets set inside the cdns_role_driver::resume() callback of
   drivers/usb/cdns3/host.c.
 - Then xhci_plat_resume_common() computes power_lost being:
      power_lost =3D is_restore || priv->power_lost;

### About xhci_plat_priv::resume_quirk()

It isn't really useful to use. drivers/usb/cdns3/host.c can know whether
power was lost through its USB role resume() callback. From there to
the resume_quirk(), the boolean must be stored somewhere. That
somewhere can only be... inside xhci_plat_priv. So it is simpler if
xhci-plat retrieves the boolean directly.

xhci_plat_priv::resume_quirk() can change the power_lost value if it
wants to, that is fine. But in our case, the info isn't available from
there.

###

I am unsure if the above explanation is clear, so I'll be sending my
current work-in-progress series as an answer to this. The goal being
that you can give me your opinion on the proposal: ACK and we continue
in this direction, NACK and we keep digging.

I'll wait for the merge window to end before sending a proper revision.

Thanks!

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


