Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA3FB1B7D6A
	for <lists+linux-usb@lfdr.de>; Fri, 24 Apr 2020 20:01:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728497AbgDXSBQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Apr 2020 14:01:16 -0400
Received: from ms.lwn.net ([45.79.88.28]:50058 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728119AbgDXSBQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 24 Apr 2020 14:01:16 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id E039A738;
        Fri, 24 Apr 2020 18:01:14 +0000 (UTC)
Date:   Fri, 24 Apr 2020 12:01:13 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Peter Lister <peter@bikeshed.quignogs.org.uk>
Cc:     Christoph Hellwig <hch@lst.de>,
        Matthew Wilcox <willy@infradead.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joel Becker <jlbec@evilplan.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 08/29] docs: filesystems: convert configfs.txt to
 ReST
Message-ID: <20200424120113.02cc4b81@lwn.net>
In-Reply-To: <894438a6-cd91-1728-a313-4bf4f8d5074d@bikeshed.quignogs.org.uk>
References: <cover.1587487612.git.mchehab+huawei@kernel.org>
        <278a9befc98b49ea866c9b687d070c70cde20628.1587487612.git.mchehab+huawei@kernel.org>
        <20200421165534.GA16511@lst.de>
        <20200421170223.GP5820@bombadil.infradead.org>
        <20200421172337.GA18305@lst.de>
        <894438a6-cd91-1728-a313-4bf4f8d5074d@bikeshed.quignogs.org.uk>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 24 Apr 2020 18:28:54 +0100
Peter Lister <peter@bikeshed.quignogs.org.uk> wrote:

> On 21/04/2020 18:23, Christoph Hellwig wrote:
> > It wasn't entirely uncommon, but that's not really the point.  The
> > Problem is all the weird ".." or "::" annotations that really kill
> > the flow, or things like "|copy|" that have no reason to exist.  
> 
> You aren't supposed to read REST documentation files - as opposed to 
> kerneldoc comments in the C source - any more than you read HTML.

I am sorry, but that is not the approach we take at all.  RST was chosen
*because* it is readable plain text, and the readability of the source
docs is of high importance; that's not going to change.

Thanks,

jon
