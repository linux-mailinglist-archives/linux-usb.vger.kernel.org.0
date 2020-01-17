Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E3701407B8
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2020 11:15:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726513AbgAQKPx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Jan 2020 05:15:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:50344 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726085AbgAQKPx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 17 Jan 2020 05:15:53 -0500
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C2C65206E6;
        Fri, 17 Jan 2020 10:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579256152;
        bh=pnNA3rr1eEYPMdAJ0/17c42CaUVzGdaRRYuWdAdXq2Q=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=NG2joGxm0DjeGmxPWaJMGSFDJfugSzD7JJa8Q9dleUq/YIpoCGE5N5tntccnj6pNe
         PlJgrR0nIjemyabxAzvk9uSBKA3xrwtV5UMgKIBOdjtXbY0eGCpMRGRjkqOEnfKJdC
         y4mKdBGb7ELzbbzXSpEf2sGskCDtCrVqnbYYdjpc=
Date:   Fri, 17 Jan 2020 11:15:49 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     "Johan Korsnes (jkorsnes)" <jkorsnes@cisco.com>
cc:     Alan Stern <stern@rowland.harvard.edu>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Armando Visconti <armando.visconti@st.com>
Subject: Re: [PATCH 2/2] HID: core: increase HID report buffer size to 8KiB
In-Reply-To: <c72e9cdd-5a1d-ed07-f8c2-de26e4181a39@cisco.com>
Message-ID: <nycvar.YFH.7.76.2001171115230.31058@cbobk.fhfr.pm>
References: <Pine.LNX.4.44L0.2001151017190.1788-100000@iolanthe.rowland.org> <c72e9cdd-5a1d-ed07-f8c2-de26e4181a39@cisco.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 15 Jan 2020, Johan Korsnes (jkorsnes) wrote:

> >> We have a touch device that reports its opens and shorts test results
> >> in HID buffers of size 8184 bytes. With this patch we're able to
> >> successfully obtain these reports.
> >>
> >> Alan Stern: Your commit 8ec321e96e05 ("HID: Fix slab-out-of-bounds
> >> read in hid_field_extract") states:
> >>
> >> "This patch fixes the problem by rejecting any report whose total
> >> length exceeds the HID_MAX_BUFFER_SIZE limit (minus one byte to allow
> >> for a possible report index). In theory a device could have a report
> >> longer than that, but if there was such a thing we wouldn't handle it
> >> correctly anyway."
> >>
> >> Is this something we have to worry about when increasing the buffer
> >> size? Or are you referring to the fact that we previously truncated
> >> the reports if they exceeded max buffer size?
> > 
> > The latter.  And after this patch we will still truncate reports that
> > exceed the max buffer size, no "previously" about it.
> > 
> > (Incidentally, these last three paragraphs don't belong in the patch
> > description; nobody will care about them once the patch has been
> > merged.  You should have put them below the "---" separator line.)
> > 
> 
> Right. If this patch is of interest I can submit a second version
> with a cleaned-up patch description.

Please do; I'll be happy to merge it afterwards together with the first 
fix.

Thanks,

-- 
Jiri Kosina
SUSE Labs

