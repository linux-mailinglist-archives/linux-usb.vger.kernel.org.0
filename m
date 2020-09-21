Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEFE927295F
	for <lists+linux-usb@lfdr.de>; Mon, 21 Sep 2020 17:04:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727350AbgIUPEv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Sep 2020 11:04:51 -0400
Received: from mx2.suse.de ([195.135.220.15]:41714 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726471AbgIUPEv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 21 Sep 2020 11:04:51 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1600700690;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nLkecd6xnTnpNhHCpBmUPI8EDJF6pLFpCtGPZmWJnfM=;
        b=dCKFH1UU6/bKiUe8JwUxHUcjJASXsgaFVb0o3oaSLudzKDhMc0L8j1J13sEzjmAQgL33FL
        /dn67cZeNKx4OUpoPDxXbnmBgaTNYQbpBYHU1m8owhmzXAphCH4zUAvSvTFL+AdOYF78vm
        YOeimMU5PpNxyq6XQbOJNKDB5iY2S28=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id AAA62AC4C;
        Mon, 21 Sep 2020 15:05:26 +0000 (UTC)
Message-ID: <1600700674.2424.105.camel@suse.com>
Subject: Re: [PATCH v2 4/4] USB: cdc-acm: clean up no-union-descriptor
 handling
From:   Oliver Neukum <oneukum@suse.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     Erik Slagter <erik@slagter.name>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Daniel Caujolle-Bert <f1rmb.daniel@gmail.com>
Date:   Mon, 21 Sep 2020 17:04:34 +0200
In-Reply-To: <20200921142806.GX24441@localhost>
References: <20200921135951.24045-1-johan@kernel.org>
         <20200921135951.24045-5-johan@kernel.org>
         <1600697816.2424.102.camel@suse.com> <20200921142806.GX24441@localhost>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Montag, den 21.09.2020, 16:28 +0200 schrieb Johan Hovold:
> On Mon, Sep 21, 2020 at 04:16:56PM +0200, Oliver Neukum wrote:
> > Am Montag, den 21.09.2020, 15:59 +0200 schrieb Johan Hovold:
> > > For interfaces that lack a union descriptor, probe for a
> > > "combined-interface" before falling back to the call-management
> > > descriptor instead of the other way round.
> > 
> > Hi,

Hi,

> > 
> > the more I look at this the more it seems to me like the
> > device that has the quirk does NOT have a collapsed interface
> > but two interfaces and just a lack of a union descriptor.
> 
> But then why name the quirk NO_DATA_INTERFACE if it has a data

In hindsight that seems not the best name.

> interface? By hardcoding the data-interface number to be the one and
> only interface, you'd end up probing for a "combined" interface also
> with a broken call-management descriptor.

Well, by the changelog assuming a combined interface caused an oops.
Thence I am forced to conclude that the davices _has_ a separate
data interface, but no union descriptor.

> Side note: I really think we should start mandating lsusb output to go
> along with any patch for quirky devices.

Good idea. Convince Greg.

	Regards
		Oliver

