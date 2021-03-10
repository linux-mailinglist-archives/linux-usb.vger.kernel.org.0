Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 238E73337BE
	for <lists+linux-usb@lfdr.de>; Wed, 10 Mar 2021 09:46:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232338AbhCJIpd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Mar 2021 03:45:33 -0500
Received: from mx2.suse.de ([195.135.220.15]:48762 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232609AbhCJIpO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 10 Mar 2021 03:45:14 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1615365913; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nabgnor0m46WB3Mcv+7Bgr5OfmPsYe4vBUPM2CTLdyI=;
        b=Q/Vkl+olc9zqZB2/Ruka+uDGHt+cjP59vayq80U5vayh/Od9zch6OyWsL1qyvspVs03fqk
        H8L6Oku8w/R5cHT0UKqueUvys0MDJmSb6W91rQwV2IYqUxq9mkDBrTtZGQPnHLqKS5ltDn
        ChEkQpcAapjDSoEgTJGEOiZTjnc3BYs=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 11169ABD7;
        Wed, 10 Mar 2021 08:45:13 +0000 (UTC)
Message-ID: <d63ec5a9624d91ec1eb629cdc68349ede9e06c9c.camel@suse.com>
Subject: Re: cdc-acm cooldown + Cisco 2960-X = kernel warning + dead USB
From:   Oliver Neukum <oneukum@suse.com>
To:     "Ramsay, Lincoln" <Lincoln.Ramsay@digi.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Date:   Wed, 10 Mar 2021 09:45:10 +0100
In-Reply-To: <BN8PR10MB36988867624ADD97964F9EB3E8929@BN8PR10MB3698.namprd10.prod.outlook.com>
References: <BN8PR10MB36989D7DC6402FDB1256ADAAE8979@BN8PR10MB3698.namprd10.prod.outlook.com>
        ,<395fc28de485f33071d358abf74b70ed1bcbbbad.camel@suse.com>
         <BN8PR10MB36988867624ADD97964F9EB3E8929@BN8PR10MB3698.namprd10.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Mittwoch, den 10.03.2021, 01:30 +0000 schrieb Ramsay, Lincoln:
> > Am Donnerstag, den 04.03.2021, 22:59 +0000 schrieb Ramsay, Lincoln:
> > > 1. Connect the Cisco 2960-X console.
> > > 2. (Re)boot our device.
> > > 3. Open the Cisco's console device (/dev/ttyACM0) and write to it.
> > 
> > What exactly happens after that?
> 
> The kernel warning about the empty work on the queue is printed to the console (and journal) and then nothing. Reading/writing doesn't work (but it didn't work before the cooldown patch either). The system doesn't die (ie. networking is still going) but USB appears to be dead (though I only tested the same console being connected to different USB ports).
> 
> > Did your test kernel contain 38203b8385bf6283537162bde7d499f83096471 ?
> 
> No... our newest builds use kernel 5.8.18 and that commit seems to be in 5.10. But backporting that to our kernel seems like a much nicer fix than reverting the cooldown patch.

Good. So are the two failure modes identical now?

> I tried doing that and it is good. It doesn't make the Cisco magically work but there's no kernel warning and USB isn't dead so the console can be disconnected and re-connected and it works again. Nice.
> 
> Unless you've got any tips for dealing with the Cisco's brokenness, I guess we're all good.

You could try the reset utility from the newest set of usb tools.

	Regards
		Oliver


