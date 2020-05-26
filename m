Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6E101BA3DF
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2020 14:51:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727794AbgD0Mvh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Apr 2020 08:51:37 -0400
Received: from verein.lst.de ([213.95.11.211]:47806 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726769AbgD0Mvg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 27 Apr 2020 08:51:36 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 6DBF768CF0; Mon, 27 Apr 2020 14:51:32 +0200 (CEST)
Date:   Mon, 27 Apr 2020 14:51:32 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Peter Lister <peter@bikeshed.quignogs.org.uk>
Cc:     Christoph Hellwig <hch@lst.de>,
        Matthew Wilcox <willy@infradead.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joel Becker <jlbec@evilplan.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 08/29] docs: filesystems: convert configfs.txt to
 ReST
Message-ID: <20200427125132.GB31904@lst.de>
References: <cover.1587487612.git.mchehab+huawei@kernel.org> <278a9befc98b49ea866c9b687d070c70cde20628.1587487612.git.mchehab+huawei@kernel.org> <20200421165534.GA16511@lst.de> <20200421170223.GP5820@bombadil.infradead.org> <20200421172337.GA18305@lst.de> <894438a6-cd91-1728-a313-4bf4f8d5074d@bikeshed.quignogs.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <894438a6-cd91-1728-a313-4bf4f8d5074d@bikeshed.quignogs.org.uk>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Apr 24, 2020 at 06:28:54PM +0100, Peter Lister wrote:
> On 21/04/2020 18:23, Christoph Hellwig wrote:
>> It wasn't entirely uncommon, but that's not really the point.  The
>> Problem is all the weird ".." or "::" annotations that really kill
>> the flow, or things like "|copy|" that have no reason to exist.
>
> You aren't supposed to read REST documentation files - as opposed to 
> kerneldoc comments in the C source - any more than you read HTML.

And that is the whole problem.  Optimizing for reading in a browser might
be an okay tradeoff for end-user documentation.  But it is absolutely
the wrong thing for internal API documentation where you want to jump
to them by opening them in the same text editor.

