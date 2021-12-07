Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F84046C7A6
	for <lists+linux-usb@lfdr.de>; Tue,  7 Dec 2021 23:44:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242229AbhLGWri (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Dec 2021 17:47:38 -0500
Received: from outgoing-auth-1.mit.edu ([18.9.28.11]:33198 "EHLO
        outgoing.mit.edu" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S238778AbhLGWrh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Dec 2021 17:47:37 -0500
Received: from callcc.thunk.org (guestnat-104-133-8-106.corp.google.com [104.133.8.106] (may be forged))
        (authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
        by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 1B7MhxcT030893
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 7 Dec 2021 17:44:00 -0500
Received: by callcc.thunk.org (Postfix, from userid 15806)
        id 8D8F14205DB; Tue,  7 Dec 2021 17:43:58 -0500 (EST)
Date:   Tue, 7 Dec 2021 17:43:58 -0500
From:   "Theodore Y. Ts'o" <tytso@mit.edu>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-usb@vger.kernel.org, linux-doc@vger.kernel.org,
        Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: Re: proposal to delete the skeleton driver
Message-ID: <Ya/jrm59Ai226JtE@mit.edu>
References: <df5bb0a6-e5f5-e062-5c02-e1de612058e2@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df5bb0a6-e5f5-e062-5c02-e1de612058e2@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Dec 07, 2021 at 11:16:37AM +0100, Oliver Neukum wrote:
> 
> Thus our documentation would be improved by replacing its examples
> with code from drivers for real hardware. Such code wouldn't be pretty
> or written for text books, but it would be tested.
> I could do it this week in a first proposal. But I don't want to start
> if somebody feels that the skeleton driver absolutely has to stay.

In addition to your idea, I wonder if we could point people at some
simple "real world" drivers that people could look at which are (a)
simple, and (b) relatively clean and free of anti-patterns that we
don't want driver authors to copy pasta into their drivers.

Sort of like how we have the "minix" and "ext2" file systems as
examples that we will sometimes point people to who want to understand
how to do their own new file systems.

       	  	    	     - Ted
