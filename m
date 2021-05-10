Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0726377F28
	for <lists+linux-usb@lfdr.de>; Mon, 10 May 2021 11:12:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230093AbhEJJN6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 May 2021 05:13:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:55146 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229566AbhEJJN5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 10 May 2021 05:13:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 46D6461285;
        Mon, 10 May 2021 09:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620637973;
        bh=y0ZxSYKsC/RCeg8TZVoOU6sPquC+BgGJj97PI93F9Ig=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VUTuY7gdikgUdk9bT8vYnFa6ZupZYHskdbHFz1ycTy1v5zt5YYfngWXMo/a5TLcaC
         M3iequo4jJDHKT/vG8fNvw9tclMCIGQpFrjhnO9cqka08/szDZk9v+3UGKBHKMvDsF
         +R3wyv8AF4QKq8EW/HeJCbF2deLsNxXQkyRYaRGMWqSJv+X6hxAK/p8gGlXS1H1H4C
         zHYLkhFokgbnrfe0y67hQm0HXYq7P5kqe1MNz/QeaGZnkircw+Gb74ucxK9yiwvjdk
         6tnpimHR5nwr/0j0bhKmzzgA4NsYtDHMh1m2ymU6ZI7Yr3DSRWlQXIE1sjuc6PfX95
         odGt60cL7C9hQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1lg1yC-0005O9-Ab; Mon, 10 May 2021 11:12:56 +0200
Date:   Mon, 10 May 2021 11:12:56 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Sean MacLennan <seanm@seanm.ca>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb-serial: add support for startech.com serial to usb
 convertor
Message-ID: <YJj5GJUIdTLKJ+Kw@hovoldconsulting.com>
References: <20210501204045.19f84a19@zonker.seanm.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210501204045.19f84a19@zonker.seanm.ca>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, May 01, 2021 at 08:40:45PM -0400, Sean MacLennan wrote:
> This adds support for the Startech.com generic serial to USB
> convertor. It seems to be a bone stock TI_3410. I have been using this
> patch for years.
> Signed-off-by: Sean MacLennan <seanm@seanm.ca>

Now applied with an updated commit summary:

	USB: serial: ti_usb_3410_5052: add startech.com device id

Thanks.

Johan
