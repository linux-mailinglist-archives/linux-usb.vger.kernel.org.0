Return-Path: <linux-usb+bounces-5327-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4CD83592E
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jan 2024 02:51:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0AFE81F21754
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jan 2024 01:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A0267FF;
	Mon, 22 Jan 2024 01:51:01 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mta21.hihonor.com (mta21.hihonor.com [81.70.160.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D3336B
	for <linux-usb@vger.kernel.org>; Mon, 22 Jan 2024 01:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.160.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705888261; cv=none; b=YdeUv+5OjslZSwwxj1s5zaP/yTAHmgvA7YtSVanf0rWYxtORscMLQUFKEiMyj8GhC0+7wU3yVCidurvtSLSecdk2QHR426/Ngc44k9XT3N6FyqN21HolgikvSF1uFiRa3tXyb0whtltezXDjPc/zjh53huTmgAW2pxzTSk77sWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705888261; c=relaxed/simple;
	bh=A2R2DEgT5PJzLodQjKWGDJXwNieqvO1rLDEtGC1wJSQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HERGtoGynro6FgzUU6aNUFZtXfJsX6DQquPFILKap4fC3k4mF71hgQvVFj3If8ad34kyt4ElaxFlmyF0aHAM6TD8q7Hi1ky8pVy+CA3q1LGpmCdZKvbLT6x20plFbrxZebA7T+1gJdWWQioDkBp3pGY1X+SWTNuXvDi7sSCl5dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hihonor.com; spf=pass smtp.mailfrom=hihonor.com; arc=none smtp.client-ip=81.70.160.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hihonor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hihonor.com
Received: from w002.hihonor.com (unknown [10.68.28.120])
	by mta21.hihonor.com (SkyGuard) with ESMTPS id 4TJCP50qqZzYl0sx;
	Mon, 22 Jan 2024 09:31:37 +0800 (CST)
Received: from a005.hihonor.com (10.68.18.24) by w002.hihonor.com
 (10.68.28.120) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.25; Mon, 22 Jan
 2024 09:32:40 +0800
Received: from w025.hihonor.com (10.68.28.69) by a005.hihonor.com
 (10.68.18.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.25; Mon, 22 Jan
 2024 09:32:39 +0800
Received: from w025.hihonor.com ([fe80::91d6:1999:eb63:3772]) by
 w025.hihonor.com ([fe80::91d6:1999:eb63:3772%14]) with mapi id
 15.02.1258.025; Mon, 22 Jan 2024 09:32:39 +0800
From: yuanlinyu 00030184 <yuanlinyu@hihonor.com>
To: Alan Stern <stern@rowland.harvard.edu>, Thinh Nguyen
	<Thinh.Nguyen@synopsys.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [RFC PATCH] usb: udc: run disconnect callback before pull up zero
Thread-Topic: [RFC PATCH] usb: udc: run disconnect callback before pull up
 zero
Thread-Index: AQHaSpss62X8RrDVzkesDebUFIcvcrDgsjeAgACt0QCAAOdoAIACxq2Q
Date: Mon, 22 Jan 2024 01:32:39 +0000
Message-ID: <1ac27ccf217d4a76bb5bb89a49c2ae4c@hihonor.com>
References: <20240119054813.2851201-1-yuanlinyu@hihonor.com>
 <9a483f40-83ef-4476-b94c-21506d94653a@rowland.harvard.edu>
 <20240120011149.fbrbunf4l7deckek@synopsys.com>
 <41dc2889-c087-4179-88a5-9af80064aa2b@rowland.harvard.edu>
In-Reply-To: <41dc2889-c087-4179-88a5-9af80064aa2b@rowland.harvard.edu>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

> From: Alan Stern <stern@rowland.harvard.edu>
> Sent: Saturday, January 20, 2024 11:00 PM
> To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Cc: yuanlinyu 00030184 <yuanlinyu@hihonor.com>; Greg Kroah-Hartman
> <gregkh@linuxfoundation.org>; linux-usb@vger.kernel.org
> Subject: Re: [RFC PATCH] usb: udc: run disconnect callback before pull up=
 zero
>=20
> On Sat, Jan 20, 2024 at 01:12:04AM +0000, Thinh Nguyen wrote:
> > On Fri, Jan 19, 2024, Alan Stern wrote:
> > > On Fri, Jan 19, 2024 at 01:48:13PM +0800, yuan linyu wrote:
> > > > When write UDC to empty and unbind gadget driver from gadget device=
, it
> is
> > > > possible that there are many queue failures for mass storage functi=
on.
> >
> > That's expected right?
>=20
> Certainly.  And not just for mass storage; for other gadget drivers too.
>=20
> > > > The root cause is on platform like dwc3, if pull down called first,=
 the
> > > > queue operation from mass storage main thread will fail as it is be=
long to
> > > > another thread context and always try to receive a command from hos=
t.
> > > >
> > > > In order to fix it, call gadget driver disconnect callback first, m=
ass
> > > > storage function driver will disable endpoints and clear running fl=
ag,
> > > > so there will be no request queue to UDC.
> > > >
> > > > One note is when call disconnect callback first, it mean function w=
ill
> > > > disable endpoints before stop UDC controller.
> > >
> > > Exactly.  So instead of getting a bunch of errors on the gadget, now
> > > you'll get a bunch of errors on the host.  I don't think that's any

What is host error ?
Seem when host do nothing, but mass storage driver try to queue request
which want to receive command from host.

> > > better.
> > >
> > > Why don't you change the dwc3 driver instead?  If it allowed ep_queue
> > > operations to succeed while the pull-up is off then this problem woul=
d
> > > go away.
> > >
> >
> > I don't think we should do that either. When pullup off occurs, the
> > device is disconnected for dwc3. usb_ep_queue() doc noted that we
> > should return error on disconnection.
>=20
> Oh yes, so it does.  Okay, forget that idea.
>=20
> >  Beside, it will add unnecessary
> > complication to dwc3 handling this.
>=20
> How about instead just reducing the visibility of these error messages

It is already change to dev_dbg() by Wesley Cheng for dwc3.
But it also can enable by change log level. Only delete it will not show ag=
ain.

this thread just want to discuss if disable eps first then pull up zero acc=
eptable or=20
good (reduce mode switch time ???) for all UDCs ?

> to make them less annoying?  They aren't very important, after all --
> they don't indicate that anything has gone seriously wrong.
>=20
> Alan Stern

