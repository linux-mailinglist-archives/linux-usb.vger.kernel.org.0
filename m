Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 300EE275EAE
	for <lists+linux-usb@lfdr.de>; Wed, 23 Sep 2020 19:32:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726515AbgIWRcd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Sep 2020 13:32:33 -0400
Received: from mx2.suse.de ([195.135.220.15]:43980 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726360AbgIWRcd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 23 Sep 2020 13:32:33 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1600882352;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=anbFVmLj+aj57nVEQqa3W6eiGVkOhYhc6g+yVQ2hPN0=;
        b=Y+dFofFSaLAjt3HMb52W/OuuqN4EsB549xGoXMJ86KMSFAuNglbdNZNFHKIwGtxR3AOUXC
        eQ6dZbvz6KwQWnKLpx0eotVMYumHXQUj9g6GpubI1KiAazXLlDxH/p3CE/u1+5D9prWT9M
        9F1qBCRrElckFsh0J2QIxh3ampwagOQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 9F60BB109;
        Wed, 23 Sep 2020 17:33:09 +0000 (UTC)
Message-ID: <1600882331.29329.0.camel@suse.com>
Subject: Re: [RFC] change the new message to provide for memory allocations
From:   Oliver Neukum <oneukum@suse.com>
To:     Greg KH <gregKH@linuxfoundation.org>
Cc:     himadrispandya@gmail.com, stern@rowland.harvard.edu,
        linux-usb@vger.kernel.org
Date:   Wed, 23 Sep 2020 19:32:11 +0200
In-Reply-To: <20200923172103.GC3732240@kroah.com>
References: <20200923134348.23862-1-oneukum@suse.com>
         <20200923172103.GC3732240@kroah.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Mittwoch, den 23.09.2020, 19:21 +0200 schrieb Greg KH:
> On Wed, Sep 23, 2020 at 03:43:34PM +0200, Oliver Neukum wrote:
> > Control messages have to work in situtaions where you need to
> > use GFP_NOIO. Hence wrappers for them that allocate memory must have
> > an API that allows for that.
> > 
> > Signed-off-by: Oliver Neukum <oneukum@suse.com>
> > 
> 
> So you unwind my mess and then fix it back up, nice, no objections from
> me, thanks for doing this.
> 
> You sent this as "RFC", but it seems sane, want me to take this as-is or
> do you want to wait to send a "real" set of patches?

Hi,

this is a fairly fundamental API. If we overlooked something the first
time I would hate to see it happen twice. Are you in a hurry?

	Regards
		Oliver

