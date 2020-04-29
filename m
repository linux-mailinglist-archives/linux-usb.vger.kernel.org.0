Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9440D1BE02C
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2020 16:06:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727777AbgD2OGr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Apr 2020 10:06:47 -0400
Received: from netrider.rowland.org ([192.131.102.5]:36401 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726950AbgD2OGr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Apr 2020 10:06:47 -0400
Received: (qmail 29624 invoked by uid 500); 29 Apr 2020 10:06:46 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 29 Apr 2020 10:06:46 -0400
Date:   Wed, 29 Apr 2020 10:06:46 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Andrey Konovalov <andreyknvl@google.com>
cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>
Subject: Re: Testing endpoint halt support for raw-gadget
In-Reply-To: <CAAeHK+x7AK=D1TA+K6hosWA=0-z0pqGu0W0QEVeZwqGNdFMaMQ@mail.gmail.com>
Message-ID: <Pine.LNX.4.44L0.2004291005460.28180-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 29 Apr 2020, Andrey Konovalov wrote:

> On Fri, Apr 10, 2020 at 5:53 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> >
> > On Fri, 10 Apr 2020, Andrey Konovalov wrote:
> >
> > > On Fri, Apr 10, 2020 at 2:29 AM Alan Stern <stern@rowland.harvard.edu> wrote:
> >
> > > Something else: I've been testing raw-gadget with various UDCs that I
> > > have [1] and everything seems to work, except for emulating SuperSpeed
> > > devices with net2280. I've just found it out yesterday night, and
> > > haven't had a chance to debug that yet, but if you know about some
> > > potential issues I could encounter with SuperSpeed/USB3+, please let
> > > me know.
> >
> > Well, USB-3 has streams, unlike USB-2.  You may want to think about
> > supporting them.
> 
> Do I understand correctly, that to support streams I basically need to
> allow the user to set stream_id on the request being submitted?

Yes, for bulk endpoints.

Alan Stern


