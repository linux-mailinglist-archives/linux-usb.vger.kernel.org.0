Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0CBA2480D1
	for <lists+linux-usb@lfdr.de>; Tue, 18 Aug 2020 10:39:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726569AbgHRIjY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Aug 2020 04:39:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:37540 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726341AbgHRIjX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 Aug 2020 04:39:23 -0400
Received: from localhost (unknown [122.171.38.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8DC7C20786;
        Tue, 18 Aug 2020 08:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597739963;
        bh=7pV59SB9n04H0f6KryAByeDc5tOOQm7mqaCtBRyVpRc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YBkux6EOMSLn4U5Y3kEsKi7f3hoXIEVAH32lViBvGkB9OIbd2jWBTjJadpwlCwKxN
         289uwO5eQPBHyk6JbYTJ9diQUdjZycRfimNfOGYJXXY7fUMfGTE8fy+lEyA9RQO0UH
         nkNp+ciUqVTHppxyD5hE97+s0DMe8GF49lgN4ov0=
Date:   Tue, 18 Aug 2020 14:09:19 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] usb: renesas-xhci: remove version check
Message-ID: <20200818083919.GY2639@vkoul-mobl>
References: <20200818071739.789720-1-vkoul@kernel.org>
 <20200818073108.GE9254@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200818073108.GE9254@kroah.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 18-08-20, 09:31, Greg Kroah-Hartman wrote:
> On Tue, Aug 18, 2020 at 12:47:39PM +0530, Vinod Koul wrote:
> > Some devices in wild are reporting bunch of firmware versions, so remove
> > the check for versions in driver
> > 
> > Reported by: Anastasios Vacharakis <vacharakis@gmail.com>
> > Reported by: Glen Journeay <journeay@gmail.com>
> > Fixes: 2478be82de44 ("usb: renesas-xhci: Add ROM loader for uPD720201")
> > Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=208911
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> > Changes in v3:
> >  - drop additional firmware versions and remove the check
> > 
> > Greg, this fixes regression for folks with preprogrammed controllers
> > please mark as stable material
> 
> You could have done so by putting "Cc: stable..." in the s-o-b of the
> kernel, why force me to do that by hand?

Oops, wasnt sure of your preference. Btw am sure you would have scripted
it :-)

Would you like me to send an update with stable tagged or this is fine
for now?

-- 
~Vinod
