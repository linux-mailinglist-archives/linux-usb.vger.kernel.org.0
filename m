Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AD58294D63
	for <lists+linux-usb@lfdr.de>; Wed, 21 Oct 2020 15:21:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395361AbgJUNVI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Oct 2020 09:21:08 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:57445 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390968AbgJUNVI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Oct 2020 09:21:08 -0400
X-Originating-IP: 82.255.60.242
Received: from [192.168.0.28] (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 8B0FEE0009;
        Wed, 21 Oct 2020 13:21:05 +0000 (UTC)
Message-ID: <bb7e56b6de3d6471c2294c3c99d945bd066829ff.camel@hadess.net>
Subject: Re: Bug caused by 53965c79c2db (USB: Fix device driver race)
From:   Bastien Nocera <hadess@hadess.net>
To:     "M. Vefa Bicakci" <m.v.b@runbox.com>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     Pany <pany@fedoraproject.org>, linux-usb@vger.kernel.org
Date:   Wed, 21 Oct 2020 15:21:05 +0200
In-Reply-To: <5d2dc161951d0717d1ccfc88049c241c8ce8d1e6.camel@hadess.net>
References: <CAE3RAxt0WhBEz8zkHrVO5RiyEOasayy1QUAjsv-pB0fAbY1GSw@mail.gmail.com>
         <20201017200200.GB842001@rowland.harvard.edu>
         <CAE3RAxvNUvzqKT+GK3A4cQ7Tm_tFRQJKfJ01r0ic-5066fikDA@mail.gmail.com>
         <20201019174028.GF898631@rowland.harvard.edu>
         <cf1e7059-e1d2-2e7a-89c1-0c162850fbb4@runbox.com>
         <20201020152859.GA945128@rowland.harvard.edu>
         <74e25095-53fa-b98c-6baf-c97eea574d1c@runbox.com>
         <e7ecea72755147dc3252e8d5c1735903993caa1e.camel@hadess.net>
         <83bd4ab7-15a6-73c2-decd-1da1c393bad0@runbox.com>
         <5d2dc161951d0717d1ccfc88049c241c8ce8d1e6.camel@hadess.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.1 (3.38.1-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 2020-10-21 at 15:18 +0200, Bastien Nocera wrote:
> On Wed, 2020-10-21 at 09:08 -0400, M. Vefa Bicakci wrote:
> > On 21/10/2020 07.53, Bastien Nocera wrote:
> > [Snipped by Vefa]
> > > 
> > > I have no idea why there isn't a match function. Patch v1 had a
> > > huge
> > > table:
> > > https://marc.info/?l=linux-usb&m=157062863431186&w=2
> > > and v2 already didn't had that comment, but no .match function:
> > > https://marc.info/?l=linux-usb&m=157114990905421&w=2
> > > 
> > > I'll prepare a patch that adds a match function. I'll let you
> > > (Vefa)
> > > look at which of your patches need backporting though, as I'm
> > > really
> > > quite a bit lost in the different patch sets and branches :/
> > 
> > Hello Bastien,
> > 
> > Having found the root cause of the issue by going through Pany's
> > logs and having proposed a solution, I was hoping to get credit
> > for the resolution of the issue by authoring the patch.
> 
> I don't care either way. Attached are the 2 patches I had made and
> was
> in the process of compiling and testing, feel free to adapt them,
> change the authorship, etc.

There are also "Co-developed-by", and "Suggested-by" tags which you can
use, as per Documentation/process/submitting-patches.rst

Cheers

