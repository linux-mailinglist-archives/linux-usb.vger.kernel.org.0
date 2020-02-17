Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 901CC161B67
	for <lists+linux-usb@lfdr.de>; Mon, 17 Feb 2020 20:16:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729630AbgBQTQp convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Mon, 17 Feb 2020 14:16:45 -0500
Received: from 17.mo5.mail-out.ovh.net ([46.105.56.132]:36950 "EHLO
        17.mo5.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729477AbgBQTQo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Feb 2020 14:16:44 -0500
Received: from player159.ha.ovh.net (unknown [10.108.57.72])
        by mo5.mail-out.ovh.net (Postfix) with ESMTP id 4EA05269266
        for <linux-usb@vger.kernel.org>; Mon, 17 Feb 2020 17:46:56 +0100 (CET)
Received: from mattea.info (host221-23-dynamic.248-95-r.retail.telecomitalia.it [95.248.23.221])
        (Authenticated sender: relay@mattea.info)
        by player159.ha.ovh.net (Postfix) with ESMTPSA id CDC1CF726459;
        Mon, 17 Feb 2020 16:46:54 +0000 (UTC)
Received: from alby.localnet (unknown [IPv6:fc00::9dc0:b1ba:2995:58a5])
        by i-m-services.net (Postfix) with ESMTP id 7E3152CE3EF;
        Mon, 17 Feb 2020 17:46:46 +0100 (CET)
From:   Alberto Mattea <alberto@mattea.info>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: xhci: apply XHCI_SUSPEND_DELAY to AMD XHCI controller 1022:145c
Date:   Mon, 17 Feb 2020 17:46:46 +0100
Message-ID: <2527163.mvXUDI8C0e@alby>
In-Reply-To: <20200217163018.GD1502885@kroah.com>
References: <5340061.DvuYhMxLoT@alby> <5575017.lOV4Wx5bFT@alby> <20200217163018.GD1502885@kroah.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="iso-8859-1"
X-Ovh-Tracer-Id: 14087259635997671285
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrjeeigdelgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkjghfggfgtgesthhqredttddtudenucfhrhhomheptehlsggvrhhtohcuofgrthhtvggruceorghlsggvrhhtohesmhgrthhtvggrrdhinhhfoheqnecukfhppedtrddtrddtrddtpdhftgdttdemmeeluggttdemsgdusggrmedvleelheemheekrgehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrudehledrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegrlhgsvghrthhosehmrghtthgvrgdrihhnfhhopdhrtghpthhtoheplhhinhhugidquhhssgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In data lunedì 17 febbraio 2020 17:30:18 CET, Greg KH ha scritto:
> On Mon, Feb 17, 2020 at 05:07:17PM +0100, Alberto Mattea wrote:
> > In data lunedì 17 febbraio 2020 16:45:38 CET, hai scritto:
> > > On Mon, Feb 17, 2020 at 04:21:50PM +0100, Alberto Mattea wrote:
> > > > Fixes suspend/resume
> > > 
> > > We are going to need a lot more information here, sorry.  Please be
> > > explicit as to what you are doing and why.
> > > 
> > > thanks,
> > > 
> > > greg k-h
> > > 
> > 
> > Sure, what about
> > "This controller timeouts during suspend (S3) with 
> > [  240.521724] xhci_hcd 0000:30:00.3: WARN: xHC save state timeout
> > [  240.521729] xhci_hcd 0000:30:00.3: ERROR mismatched command completion event
> > thus preventing the system from entering S3. Moreover it remains in an undefined state
> > where some connected devices stop working until a reboot.
> > Apply the XHCI_SUSPEND_DELAY quirk to make it suspend properly."
> 
> I sure beats the original 3 words you wrote :)
> 
> 

Great, I'll fix the commit and resend the patch :)


