Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8EAB1BA402
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2020 14:53:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727932AbgD0MxN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Apr 2020 08:53:13 -0400
Received: from verein.lst.de ([213.95.11.211]:47815 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727029AbgD0MxN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 27 Apr 2020 08:53:13 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 49F0A68CF0; Mon, 27 Apr 2020 14:53:11 +0200 (CEST)
Date:   Mon, 27 Apr 2020 14:53:10 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Christoph Hellwig <hch@lst.de>,
        Matthew Wilcox <willy@infradead.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joel Becker <jlbec@evilplan.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 08/29] docs: filesystems: convert configfs.txt to
 ReST
Message-ID: <20200427125310.GC31904@lst.de>
References: <cover.1587487612.git.mchehab+huawei@kernel.org> <278a9befc98b49ea866c9b687d070c70cde20628.1587487612.git.mchehab+huawei@kernel.org> <20200421165534.GA16511@lst.de> <20200421170223.GP5820@bombadil.infradead.org> <20200421172337.GA18305@lst.de> <20200421165317.277f52ee@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200421165317.277f52ee@lwn.net>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 21, 2020 at 04:53:17PM -0600, Jonathan Corbet wrote:
> > It wasn't entirely uncommon, but that's not really the point.  The
> > Problem is all the weird ".." or "::" annotations that really kill
> > the flow, or things like "|copy|" that have no reason to exist.
> 
> This sounds sort of like "my markup is good, yours is bad", honestly.  If
> somebody were trying to add bracketed headings to a new document, I
> suspect we'd get similar complaints.

Not really.  It is a "less markup is better". 

> The markup can certainly be toned down.  If you don't like |copy|, it can
> just as easily remain "(c)" or become �, or just go away entirely.  That
> would get rid of the ".. include:: <isonum.txt>" line too.  I would
> happily make a rule that we don't bother with markup like |copy|
> anywhere in the kernel docs.

That is a good start.

> The SPDX line is supposed to exist in all files, of course.

No problem with that.  I'll happily take a SPDX patch any time.

> If Mauro does that, can you live with "::" to mark a literal block?  It
> doesn't seem like a whole lot of noise...?

That is in fact one of my favourite pet pevees with the whole RST
thing.
