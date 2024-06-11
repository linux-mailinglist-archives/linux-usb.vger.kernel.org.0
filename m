Return-Path: <linux-usb+bounces-11138-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 380A8903C14
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jun 2024 14:39:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2851E1C21DD3
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jun 2024 12:39:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A32617BB25;
	Tue, 11 Jun 2024 12:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="JTSezT+a";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="HG9ufXET"
X-Original-To: linux-usb@vger.kernel.org
Received: from fhigh7-smtp.messagingengine.com (fhigh7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B654CDE0
	for <linux-usb@vger.kernel.org>; Tue, 11 Jun 2024 12:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718109553; cv=none; b=tciM3XuGOgvbDiYvUpl6j3bradkLwHKfEpduqszx4iSYxswN++qGoBH5POQDTa1kmuJH87xXM1W5MEgrQr8Y3babbgFN2o3NGPJmAQgij6jP+jquV2u0dQLWeZHYx3I0E7yBhv6C08acLVS4SyxsmIFJVdyhjklKK+iAFg1Uj5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718109553; c=relaxed/simple;
	bh=ufEvUS3a63KMvfo4Q671voEa8lvczhWK+JCuZNzFw6k=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=LM2+/GlpwMpF05ak5MIPk2nqpX+iuff75DXa//K9gdV+lKjfAJefQuN83RsnHA2+ccrs4C8qzAmo+0izdldlyxs4F4+l1szQGI1dedNprEOQem7rQM8wIOpc5UPf8P/uRNfKKOdv0oHY9DpLBj6mJayp5xDtCYgB4mg/AGXHTPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=JTSezT+a; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=HG9ufXET; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 6437C1140218;
	Tue, 11 Jun 2024 08:39:10 -0400 (EDT)
Received: from imap52 ([10.202.2.102])
  by compute3.internal (MEProxy); Tue, 11 Jun 2024 08:39:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1718109550;
	 x=1718195950; bh=5WybzRkJBx0Q/rjltVQImjPuxRVRZt8zOvpHfoIWt84=; b=
	JTSezT+amppi4vXSvl9Jjqs0BVFvW+FveN2XRNiINhsYHMN9vSUsw9zZEiuhwMjq
	Fbj3BFi5ovZbdkkbUnHT6H/CJIXFrpLEY+jdFZoQq9vuoBi7r9OV+mEhP4gZmqRh
	Tf/ZX/1k32iEdN4loM2QBYmzaAVUUY/CHbconMU3ZxSYeJRpdyWUakKawHrEMIGV
	+iBBwl9shVtQP8iQ/IvAXzsFdRHrX79e/RyxoxGKi8GaOsPT5AQPrYPOyMR39T4c
	g7iPJ1p2ZaNh4K81GA68sEmaP7GmVXub5+m5eOuO63Nx9gi+BSvFCE9TZXhlUiRn
	DOEJ7+BLE2Q342u1FxOJow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718109550; x=
	1718195950; bh=5WybzRkJBx0Q/rjltVQImjPuxRVRZt8zOvpHfoIWt84=; b=H
	G9ufXETmtpzDSykSXb542bKvYzdnjUTHNT+bl8Vd6aMEVAiS7wOU79rOxOYHwp0p
	sJWIQOImdQGR7w3RZSeHodKXN2wz7zF4e1k+BoH2prOlwOI8qTaZj32g9LGS4O1G
	yPZYXo8H5IcS9fAHxDbS1FfcUTLcK4Jz1rluxWhYe334SSYfeSs08fdNLtgS28DO
	gXcxdpUND+a+nYrUpcq+QVLW9EnBdxa95LCq2SuqIw6i39O1oHL3iF04EUs4SXKf
	JMPFC75nGCBPHiIU3ophrOIv047aty5tSHu8+mj0uZnvo5MaN5uo1hdVm2pO7quW
	W024Fd57USKGHNt0dCTfA==
X-ME-Sender: <xms:bUVoZtZjFRzh7rdaOOo2HiV8o_bxzI7ZmEn8NqmUlsUN-RuT6lUZaA>
    <xme:bUVoZkbiCxL7RGwMC-4_CAEGFeu7lu6aSx-pkwtZUOrHj83eswhcZoQt4eYpXHyL1
    bF7P6InmM0Gj2I-ySc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeduvddgheegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdfo
    rghrkhcurfgvrghrshhonhdfuceomhhpvggrrhhsohhnsehsqhhuvggssgdrtggrqeenuc
    ggtffrrghtthgvrhhnpeekueehfeefteeiheeljeetheevtdfgueehtedvveeuudektddv
    hfdthedvtedvleenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhhpvggrrhhsohhnsehsqhhu
    vggssgdrtggr
X-ME-Proxy: <xmx:bUVoZv-TQqDq9rUkerRaMV3KPakwFD8l6ez8wLpHYcNcqIbXi_SM0g>
    <xmx:bUVoZrqJR-OzDE_Y6C0Y2VmA5bRhcKl8ldMSxHDYTApvRNktQeTaMg>
    <xmx:bUVoZoqE7orf0iiKy4BxNqJNCiHpBPM1Zk_N-BXTb6EnTOPPAm_A1g>
    <xmx:bUVoZhQHwc504QfawuKRw2OImUa7iVFHd-OrZ0WJVSGEn_dZkf6AXw>
    <xmx:bkVoZjW70-FNdbsNp4Rtys-OSLPozgcZ52gOAhKYkkwRahEEXBG21hS0>
Feedback-ID: ic2b14614:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id A32EBC60098; Tue, 11 Jun 2024 08:39:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-515-g87b2bad5a-fm-20240604.001-g87b2bad5
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <e588d4ac-7acf-4b10-b368-93d01a2c4620@app.fastmail.com>
In-Reply-To: 
 <CADS+iDVSKJZUMSxWE=NOTtyRR8+VBj1mJ5LvaRLAO-yeZ2NBTA@mail.gmail.com>
References: 
 <CADS+iDWFVZp81Ck48wQjzh--n_7Z-bV2u0SR4Z6-OZOMBLeMKw@mail.gmail.com>
 <520bd89d-b6e4-4654-adcd-8bb884802f56@interlog.com>
 <CADS+iDVhNzAHfbW+Nks_29rgJXwFTCsTU93XHQpCYBCW6cvxzQ@mail.gmail.com>
 <e7257a7a-1391-47e7-9702-d7c9ec3ff338@interlog.com>
 <CADS+iDWM8czf-D8D8H1gx2YBPCYbO4cexO83dUQ6-H8KKQSx4g@mail.gmail.com>
 <CADS+iDWSsLA+HrFLsD4nvo5KCRJTdiuZKp5cYVkXBnkC_nTfRw@mail.gmail.com>
 <eff9a939-cd38-4cbd-89a4-faebc0de67e6@interlog.com>
 <CADS+iDVAyUXQ-KXHgSgJkO=t3msGs5MhyVkBqcaV_N6SSw4EdQ@mail.gmail.com>
 <ZYFqS+QAl6ZKdPQ5@kuha.fi.intel.com>
 <b696742d-82a5-4882-8997-6acb8cec28e4@app.fastmail.com>
 <64479f78-4359-4eb5-9367-257b24f62ccd@app.fastmail.com>
 <CADS+iDWQxsgvAnkfu8Nukjw5E3d49pwBsWZScyc_HQLGKLwbgg@mail.gmail.com>
 <03dbee0a-09e3-4ef4-ad19-c8c4280f2707@app.fastmail.com>
 <CADS+iDVSKJZUMSxWE=NOTtyRR8+VBj1mJ5LvaRLAO-yeZ2NBTA@mail.gmail.com>
Date: Tue, 11 Jun 2024 08:38:49 -0400
From: "Mark Pearson" <mpearson@squebb.ca>
To: "Yaroslav Isakov" <yaroslav.isakov@gmail.com>
Cc: "Heikki Krogerus" <heikki.krogerus@linux.intel.com>,
 dgilbert@interlog.com, linux-usb@vger.kernel.org
Subject: Re: type-c subsystem is empty on Thinkpad T14 Gen 4 AMD
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Mar 20, 2024, at 2:38 PM, Yaroslav Isakov wrote:
> Hello, Mark!
>
> =D0=BF=D0=BD, 18 =D0=BC=D0=B0=D1=80. 2024=E2=80=AF=D0=B3. =D0=B2 20:42=
, Mark Pearson <mpearson@squebb.ca>:
>>
>>
>>
>> On Mon, Mar 18, 2024, at 3:22 PM, Yaroslav Isakov wrote:
>> > Hello, Mark!
>> >
>> > =D0=BF=D0=BD, 18 =D0=BC=D0=B0=D1=80. 2024=E2=80=AF=D0=B3. =D0=B2 19=
:48, Mark Pearson <mpearson@squebb.ca>:
>> >>
>> >> On Thu, Feb 22, 2024, at 9:30 AM, Mark Pearson wrote:
>> >> > Hi,
>> >> >
>> >> Just to confirm that I've tested a trial BIOS from the FW team and=
 it fixes the issue (shows up under /sys/class/typec
>> > Great to hear, thank you!
>> >
>> >> If there's anything in particular you'd like me to confirm let me =
know.
>> >
>> > If /sys/class/typec is populated, I think it should be enough... Ju=
st
>> > to double check, is /sys/class/usb_power_delivery populated, too, n=
ow?
>>
>> Yes. From my system:
>>
>> # ls /sys/class/typec
>> port0  port0-partner  port1
>> # ls /sys/class/usb_power_delivery
>> pd0  pd1  pd2
>>
>
> Great! These are the ones I saw with my workaround, too.
>> >
>> > I also did not manage to see anything in /sys/class/usb_role or
>> > /sys/class/typec_mux, even with my hack - is it expected on AMD,
>> > because of lack of appropriate mux/role switch drivers?
>>
>> I'm not seeing anything under those with this BIOS either
>>
>> I checked on an Intel platform on my desk (P14s G3) and those aren't =
populated there either...so not sure this is AMD specific.
>> I'm being lazy and not looking at the kernel code - what would we exp=
ect to see in those entries?
>
> According to=20
> https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-class-usb_r=
ole,
> with /sys/class/usb_role, we can switch between host and device modes.
> My main interest there is typec_displayport driver - to be able to see
> altmode info (not sure, though, in which /sys directory). With my
> workaround, I failed to see this driver detecting my dock, so, I was
> wondering, if it's caused by wrong UCSI version reported, or some
> other driver missing (DP altmode is working with the doc, just no info
> from typec_displayport driver)
>
> BTW, what is the version of ucsi reported from firmware? I wonder, if
> it will work with this change
> https://lore.kernel.org/linux-usb/20240209223824.622869-1-abhishekpand=
it@chromium.org/
>
Just as a note - BIOS 1.36 was released with the fix. Available on LVFS.

Mark

