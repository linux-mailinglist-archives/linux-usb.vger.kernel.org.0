Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B2102D40BF
	for <lists+linux-usb@lfdr.de>; Wed,  9 Dec 2020 12:15:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730484AbgLILMg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Dec 2020 06:12:36 -0500
Received: from mx2.suse.de ([195.135.220.15]:34126 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726526AbgLILMf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 9 Dec 2020 06:12:35 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1607512309; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=m3C0yP7Fd2Fvj0zf5Av0GGiQV+FVjCvgQXoaJnwRtlo=;
        b=DwmFLGiCjQroZ5CWxI2F/h/dZhBpSor+eSRa+QemINdOYC2VPic/0KFw8QJ1TaAER7vKuZ
        /n3KZQCNDRr8bebFrDzm0evJ8vXppA5T+HvPaZJipbX7MwkhqwDGgMggDnKqSSlLnS8yx7
        5oA++8MOES6P6VwfpQJ2IVg0/K+rOY8=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id B2333ADCD;
        Wed,  9 Dec 2020 11:11:49 +0000 (UTC)
Message-ID: <30fecc08789d7ac759fc7aa87eaafedf803ec0d1.camel@suse.com>
Subject: Re: Issues with LaCie USB3 drive and UAS
From:   Oliver Neukum <oneukum@suse.com>
To:     "David C. Partridge" <david.partridge@perdrix.co.uk>,
        'Alan Stern' <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
Date:   Wed, 09 Dec 2020 12:11:31 +0100
In-Reply-To: <003e01d6cd9c$d8777cf0$896676d0$@perdrix.co.uk>
References: <11ea70180f52b4965a451b3970891e0f547c777b.camel@suse.com>
         <000001d6c89c$086812e0$193838a0$@perdrix.co.uk>
         <000301d6c919$af7a94e0$0e6fbea0$@perdrix.co.uk>
         <918e298941f820a7cc3310c95dc211cca7596dba.camel@suse.com>
         <000e01d6c980$d9a75f70$8cf61e50$@perdrix.co.uk>
         <005601d6cc87$2fa608f0$8ef21ad0$@perdrix.co.uk>
         <36ac7a79c4b24f9f68b3543d18a51ec9af0a4933.camel@suse.com>
         <000701d6cd7c$236ec8b0$6a4c5a10$@perdrix.co.uk>
         <20201208162722.GC1298255@rowland.harvard.edu>
         <000801d6cd81$dc303370$94909a50$@perdrix.co.uk>
         <20201208174515.GG1298255@rowland.harvard.edu>
         <003e01d6cd9c$d8777cf0$896676d0$@perdrix.co.uk>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Dienstag, den 08.12.2020, 20:00 +0000 schrieb David C. Partridge:

Hi,

> I'll chase up the supplier over the cable.

What we have often seen is that cables go right to the edge of what is
allowed and so do devices and - lo and behold - the combination does
not work.

> Would I be right to assume that this LaCie device (and other Seagate USB
> devices) will the added to the database of quirks? So that when Oliver's fix
> goes "mainstream" no-one will need to add options for modprobe?

Yes. I have submitted it.

> Hmm I wonder how long it will take the Ubuntu Kernel to catch up with
> Olivers patch?

Greg usually applies such patches to the stable tree. Weeks to a few 
months or so I'd say. I cannot comment on Ubuntu's update policies.

	Regards
		Oliver


