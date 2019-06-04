Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36C75342F4
	for <lists+linux-usb@lfdr.de>; Tue,  4 Jun 2019 11:15:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727151AbfFDJOw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 Jun 2019 05:14:52 -0400
Received: from mx2.suse.de ([195.135.220.15]:60564 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727023AbfFDJOw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 4 Jun 2019 05:14:52 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 05D47AC54;
        Tue,  4 Jun 2019 09:14:50 +0000 (UTC)
Message-ID: <1559639677.21920.4.camel@suse.com>
Subject: Re: [PATCH] Fix chipmunk-like voice when using Logitech C270 for
 recording audio.
From:   Oliver Neukum <oneukum@suse.com>
To:     Marco Zatta <marco@zatta.me>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Date:   Tue, 04 Jun 2019 11:14:37 +0200
In-Reply-To: <20190603175540.GA4368@jimmy.localdomain>
References: <20190601075257.GA24550@jimmy.localdomain>
         <1559555890.25071.5.camel@suse.com>
         <20190603175540.GA4368@jimmy.localdomain>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Montag, den 03.06.2019, 19:55 +0200 schrieb Marco Zatta:
> On Mon, Jun 03, 2019 at 11:58:10AM +0200, Oliver Neukum wrote:
> > Are you sure only the C270 is affected?
> > 
> > 	Regards
> > 		Oliver
> 
> Hello Oliver,
> 
> No, unfortunately I am not sure but I am missing the hardware to
> properly test. I am quite sure that it fixes the problem in the C270
> though :)

Well, after all that time neither do I have the test hardware.
And I doubt that for some reason only the C270 should be affected.

> Thanks for that, since you were the author of the first commit.

I appreciate your patch, but I think teh safe option would be to do
it for all models.

	Regards
		Oliver

PS: Are you really in Montenegro or is that just a close address?

