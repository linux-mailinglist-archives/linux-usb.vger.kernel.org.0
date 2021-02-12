Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8470A31A038
	for <lists+linux-usb@lfdr.de>; Fri, 12 Feb 2021 15:02:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230336AbhBLOBi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 12 Feb 2021 09:01:38 -0500
Received: from mx2.suse.de ([195.135.220.15]:36210 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230249AbhBLOBc (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 12 Feb 2021 09:01:32 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1613138446; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SKXrot/Q/SPNyYSDzL5B5k1UaU4JyYHyYD+KZTKMXj8=;
        b=iZTMNQSo87zbA+XHECAuSmFtPmlkbML8i+6FLWp4NlF63NyI00Mwk1W/PAsnKHVKXcYvWH
        WF+BvU4vCe/a5ZEUGmZIMMT+C8O3vPYEDtvJ43dDHNqsviTnZokM5KRUePFKDkFbpwTcfF
        EeSWjctcXprJfgdSvoddFbcmiGVoNyM=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 458E4B029;
        Fri, 12 Feb 2021 14:00:46 +0000 (UTC)
Message-ID: <6da4b774afccbd0ad2f9727800164728130a67f6.camel@suse.com>
Subject: Re: [PATCH v3] Goodix Fingerprint device is not a modem
From:   Oliver Neukum <oneukum@suse.com>
To:     Yorick de Wid <ydewid@gmail.com>
Cc:     linux-usb@vger.kernel.org
Date:   Fri, 12 Feb 2021 15:00:40 +0100
In-Reply-To: <CAGDk_A8kZZiGTdx+JGZDRu5ibOcy8VPYDaqeQtbHfc3wCsjG4A@mail.gmail.com>
References: <20210212110738.169808-1-ydewid@gmail.com>
         <20210212111046.170342-1-ydewid@gmail.com>
         <88cbbc09e998761097677111b9d166fc1f677026.camel@suse.com>
         <CAGDk_A8kZZiGTdx+JGZDRu5ibOcy8VPYDaqeQtbHfc3wCsjG4A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Freitag, den 12.02.2021, 12:59 +0100 schrieb Yorick de Wid:
> > what else is it?
> 
> It's a fingerprint device/biometrics that should be handled by the
> Goodix MOC driver in libfprint. libfprint supports some Goodix devices
> but not all. I _suspect_ that other PID's from the same VID and
> class/subclass/protocol will also match the ACM driver.

Hi,
thank you. That is a very good answer. Now could you include
it into the patch description and resend it?

	Regards
		Oliver


