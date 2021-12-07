Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51A7746B8D4
	for <lists+linux-usb@lfdr.de>; Tue,  7 Dec 2021 11:24:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235052AbhLGK2E (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Dec 2021 05:28:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbhLGK2E (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Dec 2021 05:28:04 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2412C061574;
        Tue,  7 Dec 2021 02:24:33 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 21D8DB81745;
        Tue,  7 Dec 2021 10:24:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72707C341C1;
        Tue,  7 Dec 2021 10:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1638872670;
        bh=9ahqiQnK+XUhA9EIIT/TGdrSy4tuZAx3uq1IwEm+5tM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jPWOdYp5+K1lNv7qDqGhsu/fJ01du1Bjn7fIwNU2xSbeQHLuhRArQA5weqX/ymHtl
         1e10HIzATbAwtKnLFO9UO8QGazGbkq0aLV1pERsdqJfvJZfHRuIjcUOE+jvPT50tx+
         TJK5dHHrNC/BHvAhv5Qa35T2HKhcoewrVOVHGXYc=
Date:   Tue, 7 Dec 2021 11:24:28 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-usb@vger.kernel.org, linux-doc@vger.kernel.org,
        Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: Re: proposal to delete the skeleton driver
Message-ID: <Ya82XJcTPD2Dj605@kroah.com>
References: <df5bb0a6-e5f5-e062-5c02-e1de612058e2@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df5bb0a6-e5f5-e062-5c02-e1de612058e2@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Dec 07, 2021 at 11:16:37AM +0100, Oliver Neukum wrote:
> Hi,
> 
> it seems to me that the method of maintaining an example driver
> does not work because it will inevitably be
> 
> * untested
> 
> * out of date
> 
> Thus our documentation would be improved by replacing its examples
> with code from drivers for real hardware. Such code wouldn't be pretty
> or written for text books, but it would be tested.
> I could do it this week in a first proposal. But I don't want to start
> if somebody feels that the skeleton driver absolutely has to stay.

As the author of the skeleton driver, I have no objections to removing
it as it is showing its age and all of the problems that you mention
here are real.

So sure, delete away!

thanks,

greg k-h
