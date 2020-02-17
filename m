Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B14B1616FB
	for <lists+linux-usb@lfdr.de>; Mon, 17 Feb 2020 17:07:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728651AbgBQQHa convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Mon, 17 Feb 2020 11:07:30 -0500
Received: from 8.mo69.mail-out.ovh.net ([46.105.56.233]:60056 "EHLO
        8.mo69.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728489AbgBQQHa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Feb 2020 11:07:30 -0500
X-Greylist: delayed 2227 seconds by postgrey-1.27 at vger.kernel.org; Mon, 17 Feb 2020 11:07:29 EST
Received: from player157.ha.ovh.net (unknown [10.108.42.192])
        by mo69.mail-out.ovh.net (Postfix) with ESMTP id 4F1E2830BB
        for <linux-usb@vger.kernel.org>; Mon, 17 Feb 2020 17:07:28 +0100 (CET)
Received: from mattea.info (host221-23-dynamic.248-95-r.retail.telecomitalia.it [95.248.23.221])
        (Authenticated sender: relay@mattea.info)
        by player157.ha.ovh.net (Postfix) with ESMTPSA id 03022F7842B5;
        Mon, 17 Feb 2020 16:07:26 +0000 (UTC)
Received: from alby.localnet (unknown [IPv6:fc00::9dc0:b1ba:2995:58a5])
        by i-m-services.net (Postfix) with ESMTP id C61A22CE3EF;
        Mon, 17 Feb 2020 17:07:17 +0100 (CET)
From:   Alberto Mattea <alberto@mattea.info>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: xhci: apply XHCI_SUSPEND_DELAY to AMD XHCI controller 1022:145c
Date:   Mon, 17 Feb 2020 17:07:17 +0100
Message-ID: <5575017.lOV4Wx5bFT@alby>
In-Reply-To: <20200217154538.GA1457504@kroah.com>
References: <5340061.DvuYhMxLoT@alby> <20200217154538.GA1457504@kroah.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="iso-8859-1"
X-Ovh-Tracer-Id: 13420726889642327925
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrjeeigdekhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkjghfggfgtgesthhqredttddtudenucfhrhhomheptehlsggvrhhtohcuofgrthhtvggruceorghlsggvrhhtohesmhgrthhtvggrrdhinhhfoheqnecukfhppedtrddtrddtrddtpdhftgdttdemmeeluggttdemsgdusggrmedvleelheemheekrgehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrudehjedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegrlhgsvghrthhosehmrghtthgvrgdrihhnfhhopdhrtghpthhtoheplhhinhhugidquhhssgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In data lunedì 17 febbraio 2020 16:45:38 CET, hai scritto:
> On Mon, Feb 17, 2020 at 04:21:50PM +0100, Alberto Mattea wrote:
> > Fixes suspend/resume
> 
> We are going to need a lot more information here, sorry.  Please be
> explicit as to what you are doing and why.
> 
> thanks,
> 
> greg k-h
> 

Sure, what about
"This controller timeouts during suspend (S3) with 
[  240.521724] xhci_hcd 0000:30:00.3: WARN: xHC save state timeout
[  240.521729] xhci_hcd 0000:30:00.3: ERROR mismatched command completion event
thus preventing the system from entering S3. Moreover it remains in an undefined state
where some connected devices stop working until a reboot.
Apply the XHCI_SUSPEND_DELAY quirk to make it suspend properly."

Thanks,

Alberto


