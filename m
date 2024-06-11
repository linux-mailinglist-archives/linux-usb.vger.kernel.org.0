Return-Path: <linux-usb+bounces-11141-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F8C903DDD
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jun 2024 15:46:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3361281E8E
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jun 2024 13:46:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EAA117D340;
	Tue, 11 Jun 2024 13:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="Kw1mLAgi";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="pLsfWM60"
X-Original-To: linux-usb@vger.kernel.org
Received: from fout1-smtp.messagingengine.com (fout1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329291E4AF
	for <linux-usb@vger.kernel.org>; Tue, 11 Jun 2024 13:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718113601; cv=none; b=OV62QFYbnkHO9zP/8yNGnpDI3vAKs4TQILkfktIUamDKZiaD1PR92HIpZ+ES683BNxETJ2uwY7CqhPTFHk+baRJWfYLlWPUnp0DLFruzaOw4WvkoN2yE202vIF+pORcjP0/wGZwz+DAs36tfp43DTV0rLcrrKD5cV6SkpOZPV1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718113601; c=relaxed/simple;
	bh=76ptH/qYi77K1Rn3hUQStoGKrUhyC8+pzisMx5uy7aI=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=IABCdT+IxvW3kiKUpCLLhyAsyMaVT5Q/vuBQWzT/8AtLvtx44NJ56GBDoo7x9frWVOGMit9i8mEx5o/cJsMbf7LTXZd+3a7TwBaevaR0NirFAa1K88sbiHRgDlpR9gNub0dp4To54+nu/Un60W6AijckZagIrSL/61Ke5eT2tFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=Kw1mLAgi; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=pLsfWM60; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfout.nyi.internal (Postfix) with ESMTP id 39FA81380032;
	Tue, 11 Jun 2024 09:46:38 -0400 (EDT)
Received: from imap52 ([10.202.2.102])
  by compute3.internal (MEProxy); Tue, 11 Jun 2024 09:46:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1718113598;
	 x=1718199998; bh=ebol4PNrVnvrg4J4Q/frAXjxsZKfo7LibMkXMw0VUYs=; b=
	Kw1mLAgipLu95DZu9ljeZ59TGKZ2kNfiN/FNHLF6HFHCTyCPBuPtFrVWBrEcBd+E
	5b4WtelbWnVAUiVUrEHSjU1+QQMTvQl+pzH7VL7BTpI2+8t4EH7Z6md0dVmYAA4v
	KkyouEHW/rYrBwBQzo7iWetpMsHNWpZ5ub6jpMknsTdQJazltHjdoLgXhvQI/PrK
	aUDBuPEReV7x3G4E3f2/XB2/qVraAcL/qliD5jpoZG9pFLKTOwbaBJZZfChQHLJY
	EPAPoSk60Ukzm9orKyBRRoUkzmO5kUIQ000bzDT9+OVBTxzwXTYOhzklPxNSB+i5
	cvOCkyD7uh4ap6t39sPasQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718113598; x=
	1718199998; bh=ebol4PNrVnvrg4J4Q/frAXjxsZKfo7LibMkXMw0VUYs=; b=p
	LsfWM60bu281TSkPlhHed2ekWyrj2kNFwyn7rVOCdBmepJLr3GHsQ2PHMCty/jDD
	2fmwbX6xNuy1pXUGHG3OMZ/zjCaOvlyMpS4jGYzjRxkD/KMW/QNmB4u1Mxc3zPeS
	nNl+ofYZIVCRgARX5/DRz8kk7qQirX/BHj4e6q/Y6ZklSiXUZrC/qokg0Ux4Oxy4
	nKjA+I1OwQl/z0xvh21Yj6KLFLXsW6tXLNqD1O767mUL4RVAtvSeIGTE9Zp257Y9
	J91iZ0qVco1c7XF5WH3URw46thKBSkH1OOe9DZ0BHO+JWxyogrQsAd8YhK4QXfF0
	CaK6oizGon4Zw/aZ8l0Xw==
X-ME-Sender: <xms:PVVoZi_iGeIVJNCFH0x8otKYkulJSVH9zNfJd4tLkSbhBI6PhH5KPQ>
    <xme:PVVoZiukhROlmloAhlCS2hHv7_BnrYOLp1mzqdIQzW4qpYKl7A_ofzn-zbOm8g6NA
    HSQprTdpc2XssUaK1U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeduvddgieejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdfo
    rghrkhcurfgvrghrshhonhdfuceomhhpvggrrhhsohhnsehsqhhuvggssgdrtggrqeenuc
    ggtffrrghtthgvrhhnpeekueehfeefteeiheeljeetheevtdfgueehtedvveeuudektddv
    hfdthedvtedvleenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhhpvggrrhhsohhnsehsqhhu
    vggssgdrtggr
X-ME-Proxy: <xmx:PlVoZoDgafruaRVW7WA6HHUFPzuSWCXbmqpq8QqRFdina9TvrJcOkg>
    <xmx:PlVoZqcCq_myaaHnZbMTx2BLi26aZM6w5g7wR7iRQF6ExFzSBwqP9g>
    <xmx:PlVoZnPvaXJaKWzYhqovG7mvBhAdDEXlQZD7Q3ohE4WyIahxX0t7pg>
    <xmx:PlVoZkniJt0ylrS9w-yfctCkoNDYk6JTSwE-bLZwGYa_MW_qNHaSxA>
    <xmx:PlVoZgrow5nLzeoV07dZFvCQ3Vq3UYwLW44r8-GsmtYZ-qQhzAgi-oS8>
Feedback-ID: ic2b14614:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id E2639C60097; Tue, 11 Jun 2024 09:46:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-515-g87b2bad5a-fm-20240604.001-g87b2bad5
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <15c51516-5aaa-47d5-bce9-7b260f6562ed@app.fastmail.com>
In-Reply-To: 
 <CADS+iDU-nrGeHiQkzJDEch3mq+sH31Q7T=Xjy_CQxSvrhcX13Q@mail.gmail.com>
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
 <e588d4ac-7acf-4b10-b368-93d01a2c4620@app.fastmail.com>
 <CADS+iDU-nrGeHiQkzJDEch3mq+sH31Q7T=Xjy_CQxSvrhcX13Q@mail.gmail.com>
Date: Tue, 11 Jun 2024 09:46:17 -0400
From: "Mark Pearson" <mpearson@squebb.ca>
To: "Yaroslav Isakov" <yaroslav.isakov@gmail.com>
Cc: "Heikki Krogerus" <heikki.krogerus@linux.intel.com>,
 dgilbert@interlog.com, linux-usb@vger.kernel.org
Subject: Re: type-c subsystem is empty on Thinkpad T14 Gen 4 AMD
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



On Tue, Jun 11, 2024, at 8:45 AM, Yaroslav Isakov wrote:
> Hello, Mark!
> =D0=B2=D1=82, 11 =D0=B8=D1=8E=D0=BD. 2024=E2=80=AF=D0=B3. =D0=B2 14:39=
, Mark Pearson <mpearson@squebb.ca>:
>>
>> Hi
>>
>> On Wed, Mar 20, 2024, at 2:38 PM, Yaroslav Isakov wrote:
>> > Hello, Mark!
>> >
>> > =D0=BF=D0=BD, 18 =D0=BC=D0=B0=D1=80. 2024=E2=80=AF=D0=B3. =D0=B2 20=
:42, Mark Pearson <mpearson@squebb.ca>:
>> >>
>> >>
>> >>
>> >> On Mon, Mar 18, 2024, at 3:22 PM, Yaroslav Isakov wrote:
>> >> > Hello, Mark!
>> >> >
>> >> > =D0=BF=D0=BD, 18 =D0=BC=D0=B0=D1=80. 2024=E2=80=AF=D0=B3. =D0=B2=
 19:48, Mark Pearson <mpearson@squebb.ca>:
>> >> >>
>> >> >> On Thu, Feb 22, 2024, at 9:30 AM, Mark Pearson wrote:
>> >> >> > Hi,
>> >> >> >
>> >> >> Just to confirm that I've tested a trial BIOS from the FW team =
and it fixes the issue (shows up under /sys/class/typec
>> >> > Great to hear, thank you!
>> >> >
>> >> >> If there's anything in particular you'd like me to confirm let =
me know.
>> >> >
>> >> > If /sys/class/typec is populated, I think it should be enough...=
 Just
>> >> > to double check, is /sys/class/usb_power_delivery populated, too=
, now?
>> >>
>> >> Yes. From my system:
>> >>
>> >> # ls /sys/class/typec
>> >> port0  port0-partner  port1
>> >> # ls /sys/class/usb_power_delivery
>> >> pd0  pd1  pd2
>> >>
>> >
>> > Great! These are the ones I saw with my workaround, too.
>> >> >
>> >> > I also did not manage to see anything in /sys/class/usb_role or
>> >> > /sys/class/typec_mux, even with my hack - is it expected on AMD,
>> >> > because of lack of appropriate mux/role switch drivers?
>> >>
>> >> I'm not seeing anything under those with this BIOS either
>> >>
>> >> I checked on an Intel platform on my desk (P14s G3) and those aren=
't populated there either...so not sure this is AMD specific.
>> >> I'm being lazy and not looking at the kernel code - what would we =
expect to see in those entries?
>> >
>> > According to
>> > https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-class-us=
b_role,
>> > with /sys/class/usb_role, we can switch between host and device mod=
es.
>> > My main interest there is typec_displayport driver - to be able to =
see
>> > altmode info (not sure, though, in which /sys directory). With my
>> > workaround, I failed to see this driver detecting my dock, so, I was
>> > wondering, if it's caused by wrong UCSI version reported, or some
>> > other driver missing (DP altmode is working with the doc, just no i=
nfo
>> > from typec_displayport driver)
>> >
>> > BTW, what is the version of ucsi reported from firmware? I wonder, =
if
>> > it will work with this change
>> > https://lore.kernel.org/linux-usb/20240209223824.622869-1-abhishekp=
andit@chromium.org/
>> >
>> Just as a note - BIOS 1.36 was released with the fix. Available on LV=
FS.
> I tried 1.36 (R2FET56W) when it was released, but it did not fix my
> issue. I have it installed, for sure:
> sudo dmidecode | grep 1.36
>     Version: R2FET56W (1.36 )
> but kernel still sees result of ret =3D ucsi->ops->read(ucsi,
> UCSI_VERSION, &ucsi->version, sizeof(ucsi->version)); as 0
>
> I also have latest EC firmware, too (corresponding to BIOS version)
> I'll try to reset BIOS to default setting, to check if it will help.

Strange - let me check. I did test the trial FW on my system but haven't=
 updated to the release version yet.
Thanks for letting me know

