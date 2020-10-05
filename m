Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04EA228353C
	for <lists+linux-usb@lfdr.de>; Mon,  5 Oct 2020 13:59:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726049AbgJEL7m (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Oct 2020 07:59:42 -0400
Received: from mx2.suse.de ([195.135.220.15]:43090 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725891AbgJEL7l (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 5 Oct 2020 07:59:41 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1601899180;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SScanxZ5VNIAu3lbs8XLikqWk8zNAf7wdO5MiLcPSqI=;
        b=Wu7JTwV7a8rD7bKtueEYq8FnnnvV5BX7psAmwkVAtkMY2LMCFSMgUBLwZfuqU2tq1h5mfd
        N6Coc6FbHgJl+gLlsQm4f/N1+Nra8hUIzEnYw7iLNoEWCJbhHloNMA9jj/adNpbCZ9fB4N
        HluYsF0/3HXuSEShVL4yIj5EPN9NSmw=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 8311CB352;
        Mon,  5 Oct 2020 11:59:40 +0000 (UTC)
Message-ID: <a508a6edf303180e5fb7c5ff6f29d25df7771791.camel@suse.com>
Subject: Re: [RFT] implementation of O_NONBLOCK for chaoskey
From:   Oliver Neukum <oneukum@suse.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     keithp@keithp.com, linux-usb@vger.kernel.org
Date:   Mon, 05 Oct 2020 13:59:36 +0200
In-Reply-To: <20201002092249.GA1934427@kroah.com>
References: <20200921113732.11524-1-oneukum@suse.com>
         <20201002092249.GA1934427@kroah.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Freitag, den 02.10.2020, 11:22 +0200 schrieb Greg KH:
> On Mon, Sep 21, 2020 at 01:37:28PM +0200, Oliver Neukum wrote:
> > This should implement O_NONBLOCK for chaoskey devices, but I need
> > a tester.
> > 
> 
> I have one of these somewhere, what type of testing is needed?

Hi,

can you open the device with O_NONBLOCK and read from it?
And did I butcher the normal case?

	Regards
		Oliver


