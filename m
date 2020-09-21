Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DCF92726CA
	for <lists+linux-usb@lfdr.de>; Mon, 21 Sep 2020 16:17:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726883AbgIUORN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Sep 2020 10:17:13 -0400
Received: from mx2.suse.de ([195.135.220.15]:60408 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726395AbgIUORM (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 21 Sep 2020 10:17:12 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1600697831;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kFX5SIh3GGfiL7kRvaY1jUoMqNUmXB4nwp0VhaZHW2o=;
        b=aAeR286SuQ87dGEDWOahQBMMOIxGpvOLgHlqONO7w43j8dqOdacrb3ub/1DU8u5y+LLwt5
        Xpoyq+f0le2qo7/Z+Mcdtswm+aNz4t9YRszN5wGVug1HB0zUZQ3QcQAC8pJwQuOzLR1p6x
        eOT7Y8U8PxQtGQEqqd4/o8Jg0s9GSJ4=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id F19D3B24F;
        Mon, 21 Sep 2020 14:17:47 +0000 (UTC)
Message-ID: <1600697816.2424.102.camel@suse.com>
Subject: Re: [PATCH v2 4/4] USB: cdc-acm: clean up no-union-descriptor
 handling
From:   Oliver Neukum <oneukum@suse.com>
To:     Johan Hovold <johan@kernel.org>, Erik Slagter <erik@slagter.name>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Daniel Caujolle-Bert <f1rmb.daniel@gmail.com>
Date:   Mon, 21 Sep 2020 16:16:56 +0200
In-Reply-To: <20200921135951.24045-5-johan@kernel.org>
References: <20200921135951.24045-1-johan@kernel.org>
         <20200921135951.24045-5-johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Montag, den 21.09.2020, 15:59 +0200 schrieb Johan Hovold:
> For interfaces that lack a union descriptor, probe for a
> "combined-interface" before falling back to the call-management
> descriptor instead of the other way round.

Hi,

the more I look at this the more it seems to me like the
device that has the quirk does NOT have a collapsed interface
but two interfaces and just a lack of a union descriptor.
I am taking the original author into CC (hoping it still workd)

Johan, would just taking the first three patches of the series work for
now?

	Regards
		Oliver

