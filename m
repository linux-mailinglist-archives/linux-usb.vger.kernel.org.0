Return-Path: <linux-usb+bounces-15350-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E259841D2
	for <lists+linux-usb@lfdr.de>; Tue, 24 Sep 2024 11:16:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95F2A285C4B
	for <lists+linux-usb@lfdr.de>; Tue, 24 Sep 2024 09:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FFCE150981;
	Tue, 24 Sep 2024 09:16:10 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A658839F4
	for <linux-usb@vger.kernel.org>; Tue, 24 Sep 2024 09:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727169370; cv=none; b=NZntuIhTBAUpwEsH9RU8vo4bvfN1P79IluFDtFBgF4LnU1YCSfWoZ88nOu0KoizKwxQcFFIzjrFNq/zIBS8uyy6nwQev45IE4QXIWXvtpjNVf49UcAq3yN98ak5BSl+Zfjl1CU1ZWsGT1xYG5f+4d1lpJaPQ6ee7Lyb80GsvHZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727169370; c=relaxed/simple;
	bh=9MiJvEl6JwaKymL0CdKN1ckrEVQ+QTEnKrcWM3BO1s4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QGQ+Gpbhf/dm/Dz0EnSBfUz1EkvzVnTpv7XZR84AQKTRBcuPuzWNQ1c9EZbgzJA+qaUPabRhgtRReMoYQcmBEYhNT5Fh3jQP5QxouASw/zzeyAO1MZXIzDagWIEiUp3zKg8doJ/a5gBwixDJzFLJ6Y7Zbdyulbj6xZOgOba0+g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1st1eA-00018k-37; Tue, 24 Sep 2024 11:15:50 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1st1e8-001Axq-DO; Tue, 24 Sep 2024 11:15:48 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1st1e8-009OzZ-0z;
	Tue, 24 Sep 2024 11:15:48 +0200
Date: Tue, 24 Sep 2024 11:15:48 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michal =?utf-8?B?Vm9rw6HEjQ==?= <michal.vokac@ysoft.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>, Petr Benes <petr.benes@ysoft.com>,
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>, imx@lists.linux.dev,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Mathieu Othacehe <m.othacehe@gmail.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	linux-kernel@vger.kernel.org,
	Hiago De Franco <hiago.franco@toradex.com>,
	Herburger <gregor.herburger@ew.tq-group.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Joao Paulo Goncalves <joao.goncalves@toradex.com>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 3/4] dt-bindings: usb: Add Diodes Incorporated
 PI5USB30213A Type-C Controller
Message-ID: <20240924091548.zekl4tmxbnnusjpx@pengutronix.de>
References: <20240923151417.1665431-1-michal.vokac@ysoft.com>
 <20240923151417.1665431-4-michal.vokac@ysoft.com>
 <20240924072436.gya7hvmlpb7fk5ou@pengutronix.de>
 <6hy6sl53ducvdjuppzg3xebh6oyxvs75vz4ua2qe2jhuuoowhp@h5jbfu2wqysc>
 <2ee4d89e-ad8e-49ff-9121-feab57e2acf1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2ee4d89e-ad8e-49ff-9121-feab57e2acf1@kernel.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org

On 24-09-24, Krzysztof Kozlowski wrote:
> On 24/09/2024 10:21, Krzysztof Kozlowski wrote:
> > On Tue, Sep 24, 2024 at 09:24:36AM +0200, Marco Felsch wrote:
> >> On 24-09-23, Michal Vokáč wrote:
> >>> From: Petr Benes <petr.benes@ysoft.com>
> >>>
> >>> Diodes Incorporated PI5USB30213A Type-C Controller supports host,
> >>> device, and dual-role mode based on voltage levels detected on CC
> >>> pin. Supports dual differential channel, 2:1 USB 3.0 Mux/Demux,
> >>> USB Type-C specification 1.1.
> >>>
> >>> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> >>> Signed-off-by: Petr Benes <petr.benes@ysoft.com>
> >>> Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
> >>> ---
> >>> v3:
> >>> - Collected R-b tag from Krzysztof.
> >>> v2:
> >>> - Moved maintainers before description: block.
> >>> - Used full paths for references.
> >>> - Removed unneeded items form connector property.
> >>> - Fixed example.
> >>>
> >>>  .../bindings/usb/diodes,pi5usb30213a.yaml     | 88 +++++++++++++++++++
> >>
> >> I suppose the driver is part of an other patchset?
> > 
> > Hm, indeed, where is the driver?
> > 
> > This patch should not be here.
> 
> I found remark in the cover letter. It's fine.

Thanks for the hint, should have read the cover letter more carefully :/

Regards,
  Marco

