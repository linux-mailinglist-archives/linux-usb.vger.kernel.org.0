Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E677433F826
	for <lists+linux-usb@lfdr.de>; Wed, 17 Mar 2021 19:32:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232738AbhCQSbl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 Mar 2021 14:31:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56736 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232926AbhCQSbe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Mar 2021 14:31:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616005893;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9gy8ZFKN6JzJ/ukEL8m+IrAcLPJBLHNahMgLQSwItoA=;
        b=Zk9TZzHhnQM+1k0hJ+5Qsk4HgO8JeH9LCmU3HzZe7g9yFZppmy/UVh2BZ5D7UZCmvMCF+I
        FFRQfDPXbb2WxHnK77SmuwCqh+GG8G2a6wfjuvAqKmhte98ZQ+4g5w2xFSrd17Oi3CShuW
        HbvnDozS02AHlJmpCfeMEAK4Z97AElI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-F3NGJCJkMraH7rYJcqz6JQ-1; Wed, 17 Mar 2021 14:31:31 -0400
X-MC-Unique: F3NGJCJkMraH7rYJcqz6JQ-1
Received: by mail-ed1-f69.google.com with SMTP id q25so5119357eds.16
        for <linux-usb@vger.kernel.org>; Wed, 17 Mar 2021 11:31:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9gy8ZFKN6JzJ/ukEL8m+IrAcLPJBLHNahMgLQSwItoA=;
        b=ehxCCyfjorIDhHCV8y2JvGU6Qxaw0xalnPrRATIEQ5C/B9QRiJxhPvlbHU983zYRLw
         2CPU79VQ03HFaNiVJmtqhHHl+sGb5ATtxeteLpj8RDRrf2QNRnMTF3HmVrpb1ALST47k
         gcCeF/3631UpUBu4/Y2I1U2G2Xg6R4a5mm2gBe+TttongeCtkeaovmEThoyxiTVbnnts
         lvniHrOXYuiFOY2vD33Mgy4B9jCWSaFQkGCexQlfcSVfw3Be+ZH5eZInrwzcrX9EcUFS
         F5Y6zUiwE5N0sg//nEGaTPJcLDXS00YLVcbNpLxV5fhBVAtU9AavZenvwLEWqXn/CaTi
         wzHg==
X-Gm-Message-State: AOAM532F2W0wJq7ES71CuGa8kMYqTB9mR3WoD5c49bo84hIAIiMtzyPH
        pCATd0+qpZiSO5SVRRtbfMTr/t5qNGTc7RYjF6iSkGDqNQ99kSmktVp7jebL9JlAorN/CJwAZK0
        EgNwJOC+H21t6mFvZMSLp
X-Received: by 2002:aa7:cc03:: with SMTP id q3mr44651396edt.366.1616005889373;
        Wed, 17 Mar 2021 11:31:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLVvcsBcusDCkrWb7rHkulw57KTS+U/5uonphp+D3u9w0sRdUagxJWijT5WQHJkRxfB038vw==
X-Received: by 2002:aa7:cc03:: with SMTP id q3mr44651379edt.366.1616005889252;
        Wed, 17 Mar 2021 11:31:29 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id a9sm13985863edt.82.2021.03.17.11.31.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Mar 2021 11:31:28 -0700 (PDT)
Subject: Re: [systemd-devel] [usb-storage] Re: Amazon Kindle disconnect after
 Synchronize Cache
To:     Matthias Schwarzott <zzam@gentoo.org>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     usb-storage@lists.one-eyed-alien.net, linux-usb@vger.kernel.org,
        systemd-devel@lists.freedesktop.org, hirofumi@mail.parknet.co.jp
References: <20210309155046.GA176674@rowland.harvard.edu>
 <dfd2b281-3beb-9869-37b6-8bd48a6cf40f@gentoo.org>
 <20210310214648.GA236329@rowland.harvard.edu>
 <841a9a54-78ee-ffaa-fc3c-12defcf43b36@gentoo.org>
 <20210311143912.GA257360@rowland.harvard.edu>
 <f2acfeef-a81a-d7c0-90a8-b290a18cb742@gentoo.org>
 <20210316162650.GB448722@rowland.harvard.edu>
 <031a20c5-27c3-cc13-6e0b-a308644abce4@redhat.com>
 <20210316170433.GD448722@rowland.harvard.edu>
 <1d9f059e-8b21-0895-9a50-39b6b1a5cc5c@redhat.com>
 <20210317151746.GB488655@rowland.harvard.edu>
 <5f8c0755-0884-f505-c4e8-3a5e89001d58@gentoo.org>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <f3d9bd3e-760f-3708-5eca-91a23948c6b7@redhat.com>
Date:   Wed, 17 Mar 2021 19:31:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <5f8c0755-0884-f505-c4e8-3a5e89001d58@gentoo.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 3/17/21 6:56 PM, Matthias Schwarzott wrote:
> Am 17.03.21 um 16:17 schrieb Alan Stern:
>> On Wed, Mar 17, 2021 at 01:21:50PM +0100, Hans de Goede wrote:
>>> Hi,
>>>
>>> On 3/16/21 6:04 PM, Alan Stern wrote:
>>>> I think it would be mildly better, but not a whole lot.  Since the
>>>> Kindle describes itself as having removable media, the kernel normally
>>>> probes it periodically to make sure the media remains present.  The
>>>> default probing interval is 2 seconds.  Reducing it to 0.9 seconds
>>>> doesn't represent an exorbitant additional load IMO -- especially since
>>>> Kindles don't tend to spend huge amounts of time connected to computers.
>>>
>>> Ah, I did not know that the default polling interval was that low(ish),
>>> given that the default indeed is already that low, then changing it to
>>> 0.8 seconds would not be a big change.  And we probably have a lot of
>>> lower hanging fruit for unnecessary wakeups then that.
>>
>> So we need to make a decision: Should the patch be merged, or should we
>> punt the issue to userspace tools?
>>
>> On the plus side, the patch is rather small and non-invasive (although
>> it does allocate the last remaining bit in the 32-bit fflags field).
>> There's also the advantage of sending the extra command only when it is
>> needed, as opposed to increasing the overall frequency of TUR polling.
>>
>> Any opinions?
> 
> I would vote to do in kernel as that is a cleaner solution:
> 
> 1. It will work out of the box.
> 2. It only sends one extra command when needed.
> 3. It makes the block-device not break if user-space adjusts the poll interval to higher values.

FWIW my vote goes to the in kernel fix too.

Regards,

Hans

