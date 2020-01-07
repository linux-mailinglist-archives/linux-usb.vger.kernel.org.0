Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA0B2132294
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jan 2020 10:35:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727458AbgAGJfS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Jan 2020 04:35:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:39882 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727211AbgAGJfS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 7 Jan 2020 04:35:18 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BE7532080A;
        Tue,  7 Jan 2020 09:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578389716;
        bh=CADzdcsJlHi9/I7DfFgPwfG4CG1U6nzlIydQNgqVdOA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qzrd38X2sKSTlRzrhUrnYeqcz/PtvUEDeDNqvZnE3mZ7QqOc2oaEps4+V3y5eZAYB
         kaKJ17piKRUPejZfDdRKGrT4nOve+oMI0nN3451thYLLT4xfjLw9b+JW8/1xPBIM22
         6zxFRHrdN2C3i8j+wb+r59Y9If/EjJrxVhemTaOg=
Date:   Tue, 7 Jan 2020 10:35:08 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     linux-usb@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v3 0/6] Add Apple MFi fastcharge USB device driver
Message-ID: <20200107093508.GA1028311@kroah.com>
References: <20191016093933.693-1-hadess@hadess.net>
 <2f9b9dad3e8b390f70168b2fef1607f0b72ce7c3.camel@hadess.net>
 <a03988283e4858c0eb00e46bd9c41f52e356d1e0.camel@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a03988283e4858c0eb00e46bd9c41f52e356d1e0.camel@hadess.net>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jan 07, 2020 at 09:46:50AM +0100, Bastien Nocera wrote:
> Hey,
> 
> On Thu, 2019-11-21 at 16:20 +0100, Bastien Nocera wrote:
> > Hey,
> > 
> > Any updates on getting this into the USB tree?
> > 
> > Alan acked the patchset more than a month ago.
> 
> Thought I'd ask again, the 6 patches were acked by Alan, and tested by
> me. Is there any chance they could be considered for merging, or
> reviewed?

Ugh, sorry, these fell through the cracks.  They are still in my
"to-review" queue, I'll try to get to them by the end of the week.

thanks,

greg k-h
