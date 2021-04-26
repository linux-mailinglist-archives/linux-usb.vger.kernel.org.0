Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F20636B001
	for <lists+linux-usb@lfdr.de>; Mon, 26 Apr 2021 10:52:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232112AbhDZIwx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Apr 2021 04:52:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26885 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232068AbhDZIwx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Apr 2021 04:52:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1619427131;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mR9kBwfjPD2WdOx1UrS9vgDOicoGDNzV5OxoVxBVVQc=;
        b=jCoCfTItFYLY+Kpk6SH4u15UG7Bt0M4v6zhoSBmZzvuRsNvcU3QCiyVy+JTxPjzUFIthsJ
        HvGYpANQuhOoAonIYUjm/6KFe6/dbcnn6b18SSyYwX3Mepn+CClGIMsUKk+EOCVAL3+QcY
        J6NEX9qUIsx0EWbZYLBNvNk6hDZjXlM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-B1B1CqEvOJWtRQAPiADZOQ-1; Mon, 26 Apr 2021 04:52:08 -0400
X-MC-Unique: B1B1CqEvOJWtRQAPiADZOQ-1
Received: by mail-ed1-f72.google.com with SMTP id z3-20020a05640240c3b029037fb0c2bd3bso22803197edb.23
        for <linux-usb@vger.kernel.org>; Mon, 26 Apr 2021 01:52:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mR9kBwfjPD2WdOx1UrS9vgDOicoGDNzV5OxoVxBVVQc=;
        b=VfqUEHkjk+o51DyRx1KazOGyBuMDCQx9sx4jYbHMVly1kJRTIhzKEm5NPIf+zdHKYa
         hX8txXqOZjsd2RATlwtSDzhUnn4iSsEirNRFFDvE2uHvqwyeag1ZkCceXkHmT3Tk1Bws
         WL4JZiZtyvYsTF19dCA5OImpLIFDyTQyHCQTI5OFr+9bbOaT4bYxIeU2+ElO5ug4ei7P
         2kWrWy/XVVuJ4Jx5nb89cF/4hZZGJs5Gp9xHhStuW40x79SIK6so22fXNDfxnYtgXI0o
         aS9Y0iaJ2NVAOuuYkf9rDk7ot9e64BnkesGE442TE+3CeBzl1EQeHxz4k7iMS3ko7wR+
         BhwA==
X-Gm-Message-State: AOAM5314lHZYkQNU2XgRZiwLPXcImfscLq+iZKot8qCRxoj4UlxGKVn9
        RUbstHTMLFQ/stEH2wx8HpM8TBzbClNIYEf98+9dDyXFpgzBKF+DDaX3YKDVUCn0yTFQUyQcTOo
        3Ks7tlAPNIy/SqE2NA8k7
X-Received: by 2002:a17:906:270a:: with SMTP id z10mr9431521ejc.204.1619427126861;
        Mon, 26 Apr 2021 01:52:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxppiLSDd2fFmaVkJ4HMdxt1U42TvsJkiEgquj79528WT3MNtJXVOD+gVKQ0Klmhb0A+rW10A==
X-Received: by 2002:a17:906:270a:: with SMTP id z10mr9431505ejc.204.1619427126693;
        Mon, 26 Apr 2021 01:52:06 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id n11sm11262559ejg.43.2021.04.26.01.52.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Apr 2021 01:52:06 -0700 (PDT)
Subject: Re: [PATCH] unbreak all modern Seagate ATA pass-through for SMART
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?Q?Ren=c3=a9_Rebe?= <rene@exactcode.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net
References: <YIVZ2l9qUfkcyPpG@kroah.com>
 <20210425.141536.1295354861910527121.rene@exactcode.com>
 <20210425144531.GA336783@rowland.harvard.edu>
 <20210425.170224.894337589208455353.rene@exactcode.com>
 <0e698ca2-06e6-6ee7-1c39-a4352207a40e@redhat.com>
 <83FED4AF-2078-43BA-95A8-1EB44C13329D@exactcode.com>
 <c7f619f8-b5c5-2a27-9a9e-e757c5cf5802@redhat.com>
Message-ID: <41e49952-e3e8-5e66-d04a-047bd6d914e4@redhat.com>
Date:   Mon, 26 Apr 2021 10:52:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <c7f619f8-b5c5-2a27-9a9e-e757c5cf5802@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 4/26/21 10:16 AM, Hans de Goede wrote:

<snip>

>> 	https://www.smartmontools.org/wiki/SAT-with-UAS-Linux
> 
> Thank you, that is another interesting link. Note that the page does
> acknowledge that the problem with Seagate enclosures is real and
> that in many cases the choice is falling back to usb-storage support
> with working ATA pass-through, or UAS without ATA pass-through.
> 
> Given the huge performance advantages of UAS, especially with SSDs,
> IMHO it is better to go with UAS in this case. But I guess in some
> scenarios SMART support may be more important then UAS support.
> 
> I'll contact the author of that wiki page to discuss this further
> with him and see if he has any good ideas for this problem.

Done:

https://listi.jpberlin.de/pipermail/smartmontools-support/2021-April/000670.html

Note I wasn't sure if I should add any of the people here to the Cc.
I've chosen not to do that. Let me know if you want me to add you
to the Cc in my next email in that thread.

Alternatively you can temporarily subscribe to the list:
https://listi.jpberlin.de/mailman/listinfo/smartmontools-support
it is very low traffic.

Regards,

Hans

