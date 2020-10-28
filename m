Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BA5E29E07B
	for <lists+linux-usb@lfdr.de>; Thu, 29 Oct 2020 02:22:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729603AbgJ1WEx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Oct 2020 18:04:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:50716 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729507AbgJ1WCX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 28 Oct 2020 18:02:23 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6C8DC247C3;
        Wed, 28 Oct 2020 15:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603899607;
        bh=TOtjzMjlAn8lGAogMZV7LLBrFOTyqGQyEyv8QCWDJfA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=c+Pr7SPYBZubX2AcnRxqLtSD75us4g0ANpWOaWfihTN/eK0qbUxsh0lX1Etc8p6b+
         eWW+s76w+ax0pNaHh08THwKV6oSrflk6yjAMQZUuOh2cLyJHa7aSuYLH6AFFKPUxPO
         +vx6y0Mlh7qRM/STq3DQ0VtHgG2eDXQOSmhbOrsA=
Date:   Wed, 28 Oct 2020 16:40:58 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Amelie DELAUNAY <amelie.delaunay@st.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: typec: stusb160x: fix some signedness bugs
Message-ID: <20201028154058.GA2780014@kroah.com>
References: <20201023112412.GD282278@mwanda>
 <625bf21d-e3bb-f952-9368-d93bee05a461@st.com>
 <20201028132346.GP18329@kadam>
 <9e3c4790-13d5-371a-52c9-8945faff66ab@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e3c4790-13d5-371a-52c9-8945faff66ab@st.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Oct 28, 2020 at 03:38:54PM +0100, Amelie DELAUNAY wrote:
> Hi Greg,
> 
> I know I'm a bit late for the review, but is it still possible to fixup this
> patch in your usb-linus branch?

Send me a patch on top of the existing one and I will be glad to review
and take it if needed.

thanks,

greg k-h
