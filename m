Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B43AA642B
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2019 10:46:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728122AbfICIqR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Sep 2019 04:46:17 -0400
Received: from mx2.suse.de ([195.135.220.15]:45422 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725888AbfICIqR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 3 Sep 2019 04:46:17 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 990FBAF62;
        Tue,  3 Sep 2019 08:46:15 +0000 (UTC)
Message-ID: <1567500374.2878.2.camel@suse.com>
Subject: Re: [PATCH] usb: storage: Add ums-cros-aoa driver
From:   Oliver Neukum <oneukum@suse.com>
To:     Greg KH <greg@kroah.com>, Alan Stern <stern@rowland.harvard.edu>
Cc:     Julius Werner <jwerner@chromium.org>,
        USB Storage list <usb-storage@lists.one-eyed-alien.net>,
        Dan Williams <dcbw@redhat.com>,
        Kernel development list <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>
Date:   Tue, 03 Sep 2019 10:46:14 +0200
In-Reply-To: <20190902164724.GA22619@kroah.com>
References: <CAODwPW8gTZ_2WEc9n=WJ2PEmQk2anTQYfwQ-898+kOq6wsjnZw@mail.gmail.com>
         <Pine.LNX.4.44L0.1908301337150.1459-100000@iolanthe.rowland.org>
         <20190902164724.GA22619@kroah.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Montag, den 02.09.2019, 18:47 +0200 schrieb Greg KH:
> 
> This should work just fine today.  Add a new device id to the "new_id"
> file and then tell the driver to bind.  That's pretty much the same as a
> "force_bind", right?

That looks like a race condition by design to me.

	Regards
		Oliver

