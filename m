Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D8921B32CC
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2020 00:53:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726358AbgDUWxU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Apr 2020 18:53:20 -0400
Received: from ms.lwn.net ([45.79.88.28]:58748 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726294AbgDUWxT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 21 Apr 2020 18:53:19 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id CB82D378;
        Tue, 21 Apr 2020 22:53:18 +0000 (UTC)
Date:   Tue, 21 Apr 2020 16:53:17 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Matthew Wilcox <willy@infradead.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joel Becker <jlbec@evilplan.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 08/29] docs: filesystems: convert configfs.txt to
 ReST
Message-ID: <20200421165317.277f52ee@lwn.net>
In-Reply-To: <20200421172337.GA18305@lst.de>
References: <cover.1587487612.git.mchehab+huawei@kernel.org>
        <278a9befc98b49ea866c9b687d070c70cde20628.1587487612.git.mchehab+huawei@kernel.org>
        <20200421165534.GA16511@lst.de>
        <20200421170223.GP5820@bombadil.infradead.org>
        <20200421172337.GA18305@lst.de>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 21 Apr 2020 19:23:37 +0200
Christoph Hellwig <hch@lst.de> wrote:

> On Tue, Apr 21, 2020 at 10:02:23AM -0700, Matthew Wilcox wrote:
> > On Tue, Apr 21, 2020 at 06:55:34PM +0200, Christoph Hellwig wrote:  
> > > NAK, this makes the document significantly harder to read.  
> > 
> > Really?  It reads more easily to me in the new format.  Enclosing
> > section headers in [] is really weird.  
> 
> It wasn't entirely uncommon, but that's not really the point.  The
> Problem is all the weird ".." or "::" annotations that really kill
> the flow, or things like "|copy|" that have no reason to exist.

This sounds sort of like "my markup is good, yours is bad", honestly.  If
somebody were trying to add bracketed headings to a new document, I
suspect we'd get similar complaints.

The markup can certainly be toned down.  If you don't like |copy|, it can
just as easily remain "(c)" or become ©, or just go away entirely.  That
would get rid of the ".. include:: <isonum.txt>" line too.  I would
happily make a rule that we don't bother with markup like |copy|
anywhere in the kernel docs.

The SPDX line is supposed to exist in all files, of course.

If Mauro does that, can you live with "::" to mark a literal block?  It
doesn't seem like a whole lot of noise...?

Thanks,

jon
