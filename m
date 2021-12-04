Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75E5B468548
	for <lists+linux-usb@lfdr.de>; Sat,  4 Dec 2021 15:15:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1385180AbhLDOSp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 4 Dec 2021 09:18:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27571 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1385174AbhLDOSp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 4 Dec 2021 09:18:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1638627319;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=MuNOE6doDTD9xk58xHfitiv3Mg1xzmIbHjTNaGd29lQ=;
        b=W9/x/B1fEAXWbyErS10SRNjumbxsBhLkPDHmDZSe/wAkO6ndLPeqkZkKYpmPog3GqxCAHU
        zITpAX9j06pfQW4kK5I3xRf1adtYfkGCjoIRe6zp9rxv/G1fCpE/S3S+66IlwfVg+SQJa8
        b2AB0ihQoNquUgcvQJWTm5OlbJsquTM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-312-euAUY6PNMhetozjGDNz64w-1; Sat, 04 Dec 2021 09:15:18 -0500
X-MC-Unique: euAUY6PNMhetozjGDNz64w-1
Received: by mail-ed1-f69.google.com with SMTP id b15-20020aa7c6cf000000b003e7cf0f73daso4802900eds.22
        for <linux-usb@vger.kernel.org>; Sat, 04 Dec 2021 06:15:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:from:subject:cc:content-transfer-encoding;
        bh=MuNOE6doDTD9xk58xHfitiv3Mg1xzmIbHjTNaGd29lQ=;
        b=i4BPgniYLldPicaI6300UHxcWnpnaZIGwvZT8X5bSE2bw+shhpdnDgNbAVpemXczeG
         im3W7TAsKMF/S7QN8Ok/oZXU/E5kuU1W8RvTM7TlMtk4nK/wcpNGc+ZVV38CIRA9mA6+
         JcbBwyDiyO9+syWwCO1ek3Q+lQjtwSaiipSPjpn6HGxHDc3FWj8a/s5vpKcWzm6kwtFe
         PEGlr0vCdIzV+7cLVYpzBvbtpn22DUYGQ+T5u1KFtYWkVencivAtw3LrxR2cX+wC6pAU
         /hV9UHa/d5+uWMDrJXnQWEdutGSRySjOOyv4W+A3OR1BRWWBjvLF0BDSvUbMQS1nG5kK
         AJqA==
X-Gm-Message-State: AOAM531hvvTbmCiZBwuDP/Fk7m0jO/1icn0+zzFkCR5d7o2am3L0QqmH
        pT9R5Zztej0qx5rDRSpGKu7pr0+SWXnQmWrCiPYSAW/gMJTuC6KoqAta3zeskn2AkJcnK33O7e7
        yTEFR/064cXrOsA+Iyxaa
X-Received: by 2002:a05:6402:4396:: with SMTP id o22mr35823856edc.263.1638627317102;
        Sat, 04 Dec 2021 06:15:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwvJ88FavGx64SZMwZjbj6ztN7tcENnzGlhhK3iOAORm84vb55xBpDZPUvEgK2+o38m2tmJKQ==
X-Received: by 2002:a05:6402:4396:: with SMTP id o22mr35823827edc.263.1638627316894;
        Sat, 04 Dec 2021 06:15:16 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id u23sm3836068edi.88.2021.12.04.06.15.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Dec 2021 06:15:16 -0800 (PST)
Message-ID: <0a4d723c-221f-a42a-434c-34283a4cdab7@redhat.com>
Date:   Sat, 4 Dec 2021 15:15:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Pavankumar Kondeti <pkondeti@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From:   Hans de Goede <hdegoede@redhat.com>
Subject: Regression: "xhci: Fix command ring pointer corruption while aborting
 a command" breaks USB on Intel controllers
Cc:     linux-usb <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi All,

There are several bug reports (arch and Fedora) about USB problems
starting with kernel 5.14.14 (5.14.13 is ok):

https://bugzilla.redhat.com/show_bug.cgi?id=2019788
https://bbs.archlinux.org/viewtopic.php?pid=2006862

And 5.16.6, which has the hub address0_mutex fixes does not
fix these problems for some users.

Looking at the history between those 2 commit ff0e50d3564f
("xhci: Fix command ring pointer corruption while aborting a command"):
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ff0e50d3564f

stood out to me as a possible cause of this. So I've build
a test 5.15.6 kernel for Fedora users with that commit reverted
and 2 users have now reported that this fixes things for them
(see https://bugzilla.redhat.com/show_bug.cgi?id=2019788).

The reason why this stood out to me is because doing a 32 bit
write over a possibly 64 bit databus to the xHCI controller may
result in the hw doing a 64 bit read + modify 32 bit + 64 bit write,
so I think that the following is happening after the commit:

sw: read 32 bit
hw: read 64 bit, return 32 bit
sw: modify it
sw: write 32 bit
hw: read 64 bit
hw: modify 32 bit of 64 bit wor5d
hw: write 64 bit

Which actually makes the chances of hitting the problem the commit
tries to fix larger on controllers using a 64 bit data bus.

Note this is just a theory, but it seems plausible to me.

All problem reports are people using integrated Intel xHCI controllers
which I believe are likely to use a 64 bit data-bus.

Regards,

Hans

