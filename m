Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8A4A36B05C
	for <lists+linux-usb@lfdr.de>; Mon, 26 Apr 2021 11:17:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232161AbhDZJSi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Apr 2021 05:18:38 -0400
Received: from mx2.suse.de ([195.135.220.15]:36440 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232068AbhDZJSi (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 26 Apr 2021 05:18:38 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1619428676; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hrg7AMV+7rYgMp/sWT7sYVVl5b0i7bxim4baIGgjLfA=;
        b=BIg6kp+QShcj4f0H2geX+CUJOJk6AqkAtSK5O1EWT3QpkGUZ+tx2jP9F7z40Mrgcpr8xbA
        BXidXsI5VSxt9geNyYcr8BSW9UC4IWjEisL1s9V8px23jMcR2nYLteGY2+IusKN61EyfMZ
        RgRVbYyHsETUotdCvQKMudpZaxriuQc=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id F3EC6B180;
        Mon, 26 Apr 2021 09:17:55 +0000 (UTC)
Message-ID: <a4d03dacd19f28bc8f78fa936b01974519ba081a.camel@suse.com>
Subject: Re: [PATCH] cdc-wdm: untangle a circular dependency between
 callback and softint
From:   Oliver Neukum <oneukum@suse.com>
To:     Felipe Balbi <balbi@kernel.org>, gregKHusb@linuxfoundation.org,
        linux-usb@vger.kernel.org
Date:   Mon, 26 Apr 2021 11:17:54 +0200
In-Reply-To: <87a6pqmn8t.fsf@kernel.org>
References: <20210422134555.6510-1-oneukum@suse.com>
         <87a6pqmn8t.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Donnerstag, den 22.04.2021, 17:01 +0300 schrieb Felipe Balbi:
> Hi Oliver,
> 
> Oliver Neukum <oneukum@suse.com> writes:
> 
> > We have a cycle of callbacks scheduling works which submit
> > URBs with thos callbacks. This needs to be blocked, stopped
>             ^^^^
>             those
> 
> > and unblocked to untangle the circle..
>                                       ^^
>                                       .
> 
> that's all, just minor nitpicking in the commit log :)

Hi,

I sent out a V2.

	Regards
		Oliver


