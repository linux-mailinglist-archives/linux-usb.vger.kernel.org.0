Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69AB835EF66
	for <lists+linux-usb@lfdr.de>; Wed, 14 Apr 2021 10:25:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349841AbhDNISy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Apr 2021 04:18:54 -0400
Received: from mx2.suse.de ([195.135.220.15]:45470 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1349801AbhDNISs (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 14 Apr 2021 04:18:48 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1618388305; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WKdvHeLWAO5YKRAuChbZscXAPu15P8ZFz4OlLRoY4do=;
        b=eO8MTG1yC2aGK6kEo6cL9PkeMtgKuKqzYPMh+C+DaEZJ/AUYXuoAGnU4TsQIsqkSm/ySkE
        eDn9hm6nlAEaTNbRjY+6IECtNrGh5EUp+ZHSeQi6Ci/FpuJeT9ku9ax+8sFEzU2Dln3asK
        a1kMzqXh+4f/qrC679LZzW5dLqFrwOA=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id D8CC9AEC2;
        Wed, 14 Apr 2021 08:18:24 +0000 (UTC)
Message-ID: <cd40acd3374b8c5c637b7b09d5f15838e05a7f3f.camel@suse.com>
Subject: Re: USB port resume can take 60 seconds in worst case scenario
From:   Oliver Neukum <oneukum@suse.com>
To:     Pratham Pratap <prathampratap@codeaurora.org>,
        linux-usb@vger.kernel.org
Date:   Wed, 14 Apr 2021 10:18:24 +0200
In-Reply-To: <075be7a2-eb78-f6b0-6051-a83bc70955db@codeaurora.org>
References: <075be7a2-eb78-f6b0-6051-a83bc70955db@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Dienstag, den 13.04.2021, 00:29 +0530 schrieb Pratham Pratap:
> Hi,
> 
> The current implementation of usb_port_resume 
> (usb_reset_and_verify_device()) can take up-to 60 secs in worst-case 
> scenario if the device (let's say the device went bad and is 
> unresponsive to any setup packets) connected went into runtime suspend 
> and resumed back. Is it fine to have a configurable upper bound? Since 
> it can induce delay in the overall system resume if the host is waking 
> up from PM suspend.

Well, in that case you have bad hardware. Generally if hardware
does not behave like it should we ought to come up eventually,
but a delay is acceptable.
If however the device really takes almost the full timeout
it is technically withing spec.

We could say that we can configure that a device should get less
retries in that specific case, but a pure time limit looks
like not so good an idea to me.

	Regards
		Oliver


