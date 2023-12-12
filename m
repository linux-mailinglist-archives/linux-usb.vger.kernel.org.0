Return-Path: <linux-usb+bounces-4075-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF7280F576
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 19:26:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 16DD2B20D79
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 18:26:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F2677E79E;
	Tue, 12 Dec 2023 18:26:10 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EEB8CD
	for <linux-usb@vger.kernel.org>; Tue, 12 Dec 2023 10:26:07 -0800 (PST)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-28ad848d9b4so174643a91.2
        for <linux-usb@vger.kernel.org>; Tue, 12 Dec 2023 10:26:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702405566; x=1703010366;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9lX++N5VCWclr3d1h9X3xvVDF9stHF9vZ8hPgWWAfgI=;
        b=pZv2WIonn41tKs0284CMPqGy5d2YK+1rxu5mrHx4L/U7nJc4WLOus8XN22nGoQ0BPO
         Pa7QRVEYr3j7f9bbnUANnkJYIu/Mqy7lbiQXRFyb0+Ngn4TC7pZyWqP9YznERcL7Ew1S
         zrPh1efVi7sW52ZQGXlnmKFUxrTZS1p6SvcBAtvLjt3lJS30P19JAL8L8QBm7VRbQL5q
         xNRNf8QIL7lrVtHFsaKeOWdaTyuGohoU2LxKXb/XsXnfQ0QgyNB9PvwlF6MCRvH4/8N9
         5RFK/8yFyM/9aA/1mrKBO4ruKYJ1y1/XYICbqldr87DmJ14lB76SMtMYi1zBkitJVam9
         Bl5A==
X-Gm-Message-State: AOJu0Yx7oZDu8fOPapQsS7B/o2z3eRGru5+peRdPnSxBiBQkvEv8eM+I
	qFjvfXPc4bogtkn1sVoYg0iiRw==
X-Google-Smtp-Source: AGHT+IHXCRJ5ZJEeDDrwJnt6AcXXLGoPeX/dvnSsoC0qb9tX2LLEt4DQy55A5U2kLu55LSGfolR+qA==
X-Received: by 2002:a17:90a:f30e:b0:286:a2a3:1e4f with SMTP id ca14-20020a17090af30e00b00286a2a31e4fmr3120316pjb.64.1702405566516;
        Tue, 12 Dec 2023 10:26:06 -0800 (PST)
Received: from localhost (75-172-121-199.tukw.qwest.net. [75.172.121.199])
        by smtp.gmail.com with ESMTPSA id q30-20020a17090a17a100b0028ac663af16sm1585825pja.23.2023.12.12.10.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 10:26:05 -0800 (PST)
From: Kevin Hilman <khilman@kernel.org>
To: =?utf-8?Q?Th=C3=A9o?= Lebrun <theo.lebrun@bootlin.com>, Roger Quadros
 <rogerq@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero
 Kristo <kristo@kernel.org>, "Vardhan, Vibhore" <vibhore@ti.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 =?utf-8?Q?Gr=C3=A9gory?= Clement <gregory.clement@bootlin.com>, Thomas
 Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 3/6] usb: cdns3-ti: add suspend/resume procedures for J7200
In-Reply-To: <CX9MMPFL7HAY.NGULD1FN5WPN@tleb-bootlin-xps13-01>
References: <20231113-j7200-usb-suspend-v1-0-ad1ee714835c@bootlin.com>
 <20231113-j7200-usb-suspend-v1-3-ad1ee714835c@bootlin.com>
 <5080372b-1f48-4cbc-a6c4-8689c28983cb@kernel.org>
 <CWZH66HQZNYM.T623ZOEEE0BK@tleb-bootlin-xps13-01>
 <dad980f3-e032-41e4-a1e4-a16a7f45ff95@kernel.org>
 <CX0GOP07I40N.198G7LJ0HYDBG@tleb-bootlin-xps13-01>
 <bdea68ad-7523-4738-8fa1-b670d81a6b93@kernel.org>
 <CX10D9YX1O1C.30PF317AG065N@tleb-bootlin-xps13-01>
 <3e00b2ad-b58f-4b09-9230-683c58d3bb92@kernel.org>
 <CX15J7B8F8HH.1WZ10OOW31X1H@tleb-bootlin-xps13-01>
 <7h34wxfmwn.fsf@baylibre.com>
 <CX63KP2UPL1N.J9Q344Q06IGP@tleb-bootlin-xps13-01>
 <7hil5odtwl.fsf@baylibre.com>
 <CX9MMPFL7HAY.NGULD1FN5WPN@tleb-bootlin-xps13-01>
Date: Tue, 12 Dec 2023 10:26:05 -0800
Message-ID: <7h7cljcm6a.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Th=C3=A9o Lebrun <theo.lebrun@bootlin.com> writes:

> Hello,
>
> On Sun Nov 26, 2023 at 11:36 PM CET, Kevin Hilman wrote:
>> Th=C3=A9o Lebrun <theo.lebrun@bootlin.com> writes:
>> > On Wed Nov 22, 2023 at 11:23 PM CET, Kevin Hilman wrote:
>> >> Th=C3=A9o Lebrun <theo.lebrun@bootlin.com> writes:
>> >> The point is to signal to the power domain the device is in that it c=
an
>> >> power on/off.  These IP blocks are (re)used on many different SoCs, so
>> >> the driver should not make any assumptions about what power domain it=
 is
>> >> in (if any.)
>> >
>> > On my platform, when the device is attached to the PD it gets turned o=
n.
>> > That feels logical to me: if a driver is not RPM aware it "just works".
>>
>> It "just works"... until the domain gets turned off.
>>
>> > Are there platforms where RPM must get enabled for the attached
>> > power-domains to be turned on?
>>
>> Yes, but but more importantly, there are platforms where RPM must get
>> enabled for the power domain to *stay* on.  For example, the power
>> domain might get turned on due to devices probing etc, but as soon as
>> all the RPM-enabled drivers drop their refcount, the domain will turn
>> off.  If there is a device in that domain with a non-RPM enabled driver,
>> that device will be powered off anc cause a crash.
>
> OK, that makes sense, thanks for taking the time to explain. This topic
> makes me see two things that I feel are close to being bugs. I'd be
> curious to get your view on both.

TL;DR; they are features, not bugs.  ;)

>  - If a device does not use RPM but its children do, it might get its
>    associated power-domain turned off. That forces every single driver
>    that want to stay alive to enable & increment RPM.
>
>    What I naively expect: a genpd with a device attached to it that is
>    not using RPM should mean that it should not be powered off at
>    runtime_suspend. Benefit: no RPM calls in drivers that do not use
>    it, and the behavior is that the genpd associated stays alive "as
>    expected".

Your expectation makes sense, but unfortunately, that's not how RPM was
designed.

Also remember that we don't really want specific device drivers to know
which PM domain they are in, or whether they are in a PM domain at
all. The same IP block can be integrated in different ways across
different SoCs, even within the same SoC family, and we want the device
driver to just work.=20=20

For that to work well, any driver that might be in any PM domain should
add RPM calls.

>  - If a device uses RPM & has a refcount strictly positive, its
>    associated power-domain gets turned off either way at suspend_noirq.
>    That feels non-intuitive as well.
>
>    What I naively expect: check for RPM refcounts of attached devices
>    when doing suspend_noirq of power-domains. Benefit: control of what
>    power-domains do from attached devices is done through the RPM API.

I agree that this is non-intuitive from an RPM PoV, but remember that
RPM was added on top of existing system-wide suspend support.  And from
a system-wide suspend PoV, it might be non-intuitive that a driver
thinks it should be active (non-zero refcount) when user just requested
a system-wide suspend.  Traditionally, when a user requests a
system-wide suspend, they expect the whole system to shut down.

On real SoCs in real products, power management is not so black and
white, and I fully understand that, and personally, I'm definitely open
to not forcing RPM-active devices off in suspend, but that would require
changes to core code, and remove some assumptions of core code that
would need to be validated/tested.

Kevin

