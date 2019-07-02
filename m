Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BF4F5CFEE
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jul 2019 15:00:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726457AbfGBNAf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Jul 2019 09:00:35 -0400
Received: from mx2.suse.de ([195.135.220.15]:42440 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726167AbfGBNAf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 2 Jul 2019 09:00:35 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 341D6B9C6;
        Tue,  2 Jul 2019 13:00:34 +0000 (UTC)
Message-ID: <1562071602.5819.14.camel@suse.com>
Subject: Re: [PATCH] Fix chipmunk-like voice when using Logitech C270 for
 recording audio.
From:   Oliver Neukum <oneukum@suse.com>
To:     Aidan Thornton <makosoft@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>,
        Marco Zatta <marco@zatta.me>
Date:   Tue, 02 Jul 2019 14:46:42 +0200
In-Reply-To: <CAB=c7ToV==vGZWOXaRqRcoOb4TNeVqi4QNAvgtiN0K6JjoF8Tg@mail.gmail.com>
References: <20190601075257.GA24550@jimmy.localdomain>
         <1559555890.25071.5.camel@suse.com>
         <CAB=c7ToV==vGZWOXaRqRcoOb4TNeVqi4QNAvgtiN0K6JjoF8Tg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Donnerstag, den 20.06.2019, 21:19 +0100 schrieb Aidan Thornton:

> This doesn't make much sense though. e387ef5c47dd should apply this
> quirk to all Logitech UVC webcams, and this is definitely a UVC-based
> Logitech webcam with the appropriate VID and interface descriptor.
> Surely it shouldn't make any difference whether I add an entry for the
> specific VID+PID pair of my particular camera or not? The C270 is as
> well, I think.

Well, it is applied a little later.

> What's particularly annoying is that since this is an intermittent
> problem, it's hard to tell if I'm chasing a phantom solution for it
> again. Haven't managed to replicate it since applying this fix and did
> so pretty quickly before but you never know.

Should I just readd everything removed in e387ef5c47dd?

Greg, what do you think? This is hard to test, the hardware is old
and I want to avoid chasing them all separately.

	Regards
		Oliver

