Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E58B1130AA
	for <lists+linux-usb@lfdr.de>; Wed,  4 Dec 2019 18:19:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728142AbfLDRTE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Dec 2019 12:19:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:57132 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726934AbfLDRTE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 4 Dec 2019 12:19:04 -0500
Received: from localhost (unknown [217.68.49.72])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 536602073B;
        Wed,  4 Dec 2019 17:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575479943;
        bh=LpkBJRqlGFpEhqibsZPnh433kIeVDQm45qfIiUzRROc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IpppSis9yCeWRnPBBb5/AA2PW8ICGTMFwwU9u3NCkIf/JkvBcPrL7pO3mjloI3cF5
         xOxC14/h5bsmKIemliWM4tfhMsb/f3C/9+nwl50Qq6BDFkc8Ca2b9HAtjE2BhwG+m3
         z4gkvjMBJCuRb4qN3AKA4NWaJcKwqb5BbwKE46jw=
Date:   Wed, 4 Dec 2019 18:19:01 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Alexandre Torgue <alexandre.torgue@st.com>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] phy: core: Add consumer device link support
Message-ID: <20191204171901.GD3627415@kroah.com>
References: <20191104143713.11137-1-alexandre.torgue@st.com>
 <faff6224-11b6-b055-1a80-fda0ff7c1724@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <faff6224-11b6-b055-1a80-fda0ff7c1724@st.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Dec 04, 2019 at 04:33:14PM +0100, Alexandre Torgue wrote:
> Hi,
> 
> Gentle ping, in case you missed this.

It's the middle of the merge window, we can't add anything to our trees
at this point in time, sorry.

greg k-h
