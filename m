Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 872F12C22FB
	for <lists+linux-usb@lfdr.de>; Tue, 24 Nov 2020 11:32:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732049AbgKXKbN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Nov 2020 05:31:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33828 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731911AbgKXKbK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Nov 2020 05:31:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606213869;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=h+X/QM3LIRfUSG0/Ck2rlt3TvdbGoFO5E2DZVLdsfOw=;
        b=HvEJAyPC1/R73ThfmylcCNAWSReW1iSSdz26PtIW/g8lLgVLNKJRlNX/ekY3391vGNKVjn
        a778CODpHnApPCkM0D9neeQL8QQiibz5HlqmJ1LDZza06hiCEov4nDFE0QimWcS3fxWJ7p
        IvsAH+3PwUm0KHIUfht23rHKdMm+RSI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-elkM_xY5Prea8GyTj3XfQA-1; Tue, 24 Nov 2020 05:31:04 -0500
X-MC-Unique: elkM_xY5Prea8GyTj3XfQA-1
Received: by mail-ej1-f72.google.com with SMTP id k2so4913871eji.21
        for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2020 02:31:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=h+X/QM3LIRfUSG0/Ck2rlt3TvdbGoFO5E2DZVLdsfOw=;
        b=GUMNFi0B6709uR6E6Qo4HNQmL+8ro3PTqT/emQIw/Mh5coAsWbK7WXcRjn/J0Infe1
         +JaXpxiGYMpKbN+mij9UmpQ71cBEQcnMGltlEnen3y9li6trLCVBAqAUhob1otvh7h5p
         3IgF9PqHQ1mb2QvI+k9pAFeHBv6YatnZ2e+9N7FTFXuW8ritIuXnuh3+fhr/QCxkBVWc
         HF+7K/lXJPx5x32MokIdnExeEmbasbl3Hu5FEpd2RKRTwlglQSy9dBOvGQV863AHzWon
         oUXcZUgEE5IpWrfN8TkHE8zlGKlQf6vguyyS2ubXme9YFoZfbIEfkGT5Lm6OlT/D2LOH
         JEtg==
X-Gm-Message-State: AOAM532Q0orFfBwB3pygdo2IEocA/8zUafi4EGDgV3C195dDWZImq+RO
        UOwEGDGMuchiGYYBNc9z0yoY0n1ljj9aQ7DcPVurlI/zr0pFVTAMHg6dKJQFNJGO5qoPp7vQGGX
        x6s1Kl0ZBT/3pfOOPmDqa
X-Received: by 2002:a50:b584:: with SMTP id a4mr3303664ede.301.1606213863544;
        Tue, 24 Nov 2020 02:31:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx1j1BZSeJJvNp43wSQVFfTRwJU5DVEOcEbiKgJSh1BIM/Fcda7aNMf+62DHflzA3z3suVNBw==
X-Received: by 2002:a50:b584:: with SMTP id a4mr3303648ede.301.1606213863382;
        Tue, 24 Nov 2020 02:31:03 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id i13sm6517717ejv.84.2020.11.24.02.31.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2020 02:31:02 -0800 (PST)
Subject: Re: 5.10 regression, many XHCI swiotlb buffer is full / DMAR: Device
 bounce map failed errors on thunderbolt connected XHCI controller
To:     Christoph Hellwig <hch@lst.de>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-pci@vger.kernel.org
References: <b046dd04-ac4f-3c69-0602-af810fb1b365@redhat.com>
 <be031d15-201f-0e5c-8b0f-be030077141f@redhat.com>
 <20201124102715.GA16983@lst.de>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <f1bd62b4-a746-6b1c-08ee-6dd1982722b6@redhat.com>
Date:   Tue, 24 Nov 2020 11:31:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201124102715.GA16983@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 11/24/20 11:27 AM, Christoph Hellwig wrote:
> On Mon, Nov 23, 2020 at 03:49:09PM +0100, Hans de Goede wrote:
>> Hi,
>>
>> +Cc Christoph Hellwig <hch@lst.de>
>>
>> Christoph, this is still an issue, so I've been looking around a bit and think this
>> might have something to do with the dma-mapping-5.10 changes.
>>
>> Do you have any suggestions to debug this, or is it time to do a git bisect
>> on this before 5.10 ships with regression?
> 
> Given that DMAR prefix this seems to be about using intel-iommu + bounce
> buffering for external devices.  I can't really think of anything specific
> in 5.10 related to that, so maybe you'll need to bisect.
> 
> I doub this means we are actually leaking swiotlb buffers, so while
> I'm pretty sure we broke something in lower layers this also means
> xhci doesn't handle swiotlb operation very gracefully in general.

Ok, I've re-arranged my schedule a bit so that I have time to bisect this
tomorrow, so with some luck I will be able to provide info on which commit
introduced this issue tomorrow around the end of the day.

Regards,

Hans

