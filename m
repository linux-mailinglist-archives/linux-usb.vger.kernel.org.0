Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A48F08724B
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2019 08:36:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405413AbfHIGgY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Aug 2019 02:36:24 -0400
Received: from gate.crashing.org ([63.228.1.57]:48910 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725879AbfHIGgY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 9 Aug 2019 02:36:24 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x796aICl009809;
        Fri, 9 Aug 2019 01:36:20 -0500
Message-ID: <e326f0a27c04a5f23cee5ef36f38e3ddf11bbf5d.camel@kernel.crashing.org>
Subject: Re: [PATCH] [RFC] usb: gadget: hid: Add "single_ep" option
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org
Date:   Fri, 09 Aug 2019 16:36:17 +1000
In-Reply-To: <8736iagb11.fsf@gmail.com>
References: <5db94157b9b3b89b2874a4f91505e4b860903ac6.camel@kernel.crashing.org>
         <8736iagb11.fsf@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 2019-08-09 at 08:31 +0300, Felipe Balbi wrote:
> Hi,
> 
> Benjamin Herrenschmidt <benh@kernel.crashing.org> writes:
> 
> > Some host drivers really do not like keyboards having an OUT
> > endpoint.
> > 
> > For example, most UEFI forked from EDK2 before 2006 (or was it 2008
> > ?)
> > have a bug, they'll try to use the *last* interrupt EP in the
> > descriptor list and just assume it's an IN endpoint. Newer UEFIs
> > use the *first* interrupt endpoint instead. None of them checks the
> > direction :-(
> > 
> > This adds a "single_ep" option to f_hid which allows to specify
> > that
> > only the IN path should be created. This should be used for
> > keyboards
> > if they are ever to be used with such systems as host.
> > 
> > Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> 
> Could you come up with a slightly more descriptive name? single_ep
> doesn't give me any hint of which endpoint will be left around.
> 
> Perhaps call it 'disable_output_report'?

Sure. Or more concice "input_only" maybe ?

Cheers,
Ben.

