Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 954E837A8CA
	for <lists+linux-usb@lfdr.de>; Tue, 11 May 2021 16:16:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231802AbhEKORm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 May 2021 10:17:42 -0400
Received: from mx2.suse.de ([195.135.220.15]:59014 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231639AbhEKORh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 11 May 2021 10:17:37 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1620742589; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=TF85mffwHcqfPxtyx1foj5nyXnm+UTg1cpW7wSbxq9s=;
        b=jI22Tw32Cwu6LbjeSR7LfDyBIRKmI7j6v5LdHQFoFFAv8V1X3ad3QfvDykub4SFS6AMWkO
        P3Za2tIs+nhmaDkM0QpjrO6oi4XLdCXMbiaBh3h8qP8+Sh/IW9B1wJMLB0YNxrNr7cOPzF
        zLxWJk8Udgfkvfzb+oHXTcXeOj9U1Nw=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 23685B077;
        Tue, 11 May 2021 14:16:29 +0000 (UTC)
Date:   Tue, 11 May 2021 16:16:28 +0200
From:   Petr Mladek <pmladek@suse.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     JC Kuo <jckuo@nvidia.com>, Joe Perches <joe@perches.com>,
        Sumit Garg <sumit.garg@linaro.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-nilfs@vger.kernel.org,
        kgdb-bugreport@lists.sourceforge.net,
        Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Jonathan Corbet <corbet@lwn.net>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Ryusuke Konishi <konishi.ryusuke@gmail.com>,
        Jason Wessel <jason.wessel@windriver.com>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v1 3/4] nilfs2: Switch to use %ptTs
Message-ID: <YJqRvJDvddqI61Lj@alley>
References: <20210510150413.59356-1-andriy.shevchenko@linux.intel.com>
 <20210510150413.59356-3-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210510150413.59356-3-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon 2021-05-10 18:04:12, Andy Shevchenko wrote:
> Use %ptTs instead of open coded variant to print contents
> of time64_t type in human readable form.
> 
> Use sysfs_emit() at the same time in the changed functions.
> 
> Cc: Ryusuke Konishi <konishi.ryusuke@gmail.com>
> Cc: linux-nilfs@vger.kernel.org
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
