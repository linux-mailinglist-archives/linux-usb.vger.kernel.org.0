Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4F592AF8D7
	for <lists+linux-usb@lfdr.de>; Wed, 11 Nov 2020 20:18:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727553AbgKKTSX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Nov 2020 14:18:23 -0500
Received: from mx2.suse.de ([195.135.220.15]:47452 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726136AbgKKTSX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 11 Nov 2020 14:18:23 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1605122302;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QHgRPIMtcy17xhn9X3s828vny5UIkgxUh3q6K1pxBqE=;
        b=ioCmu/WKPbQ+BH93Qoy/S8E8jXPbBWUT30oqxLfoL6kfJ8G1li9xCarnkWuV7UFz5NqXrR
        lQrY2u4/jy/W/IEH+K/Vco/TVt2PJNplfApF/fM9vy/hK6LgwopoqzFFQIgAu7dLq2j43T
        5VNdEgxnzOJGC1m9sqqHyC37QO2pcmo=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 7F823AD46;
        Wed, 11 Nov 2020 19:18:22 +0000 (UTC)
Message-ID: <041a2141dd5c2fa15f47930b2be0a8c7e2c3c262.camel@suse.com>
Subject: Re: Issues with LaCie USB3 drive and UAS
From:   Oliver Neukum <oneukum@suse.com>
To:     "David C. Partridge" <david.partridge@perdrix.co.uk>,
        linux-usb@vger.kernel.org
Date:   Wed, 11 Nov 2020 20:18:20 +0100
In-Reply-To: <00e801d6b842$583be180$08b3a480$@perdrix.co.uk>
References: <004f01d6b5bd$d4f08ff0$7ed1afd0$@perdrix.co.uk>
                      <eceedea7ca5d950eb8ea4d186a6b01a04d0a804f.camel@suse.com>
                       <001601d6b67d$e97a1e30$bc6e5a90$@perdrix.co.uk>
                 <aebf92944c1ecb256d21108ce092165a0fd904db.camel@suse.com>
               <001b01d6b68a$79937fa0$6cba7ee0$@perdrix.co.uk>
                 <007901d6b6ab$f0f66230$d2e32690$@perdrix.co.uk>
         <43abe2af0352f17f93e2453a86e2ed47b9913b6a.camel@suse.com>
         <00e801d6b842$583be180$08b3a480$@perdrix.co.uk>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Mittwoch, den 11.11.2020, 15:50 +0000 schrieb David C. Partridge:
> Oliver I'd love to test your patch - theres only one catch - I haven't a clue how to begin to do that.
> 
> I managed to install LUbuntu 20.04.1 but applying source patches to the kernel is a bit beyond my skill level.

Hi,

do you need general help building a kernel or is there a specific
issue?

> PS out of curiosity why 'k' for doesn't support Write Same?

We are running out of letters for quirks.

	Regards
		Oliver


