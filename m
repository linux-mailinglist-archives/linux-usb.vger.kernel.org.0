Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A644EEA4D6
	for <lists+linux-usb@lfdr.de>; Wed, 30 Oct 2019 21:35:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726912AbfJ3UfN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Oct 2019 16:35:13 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:33889 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726671AbfJ3UfN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Oct 2019 16:35:13 -0400
Received: by mail-wr1-f67.google.com with SMTP id e6so1990712wrw.1
        for <linux-usb@vger.kernel.org>; Wed, 30 Oct 2019 13:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GKB6Sx/IUizZ9IZiRwVYRZ7sZESLZmd5Upv0GbKgvpI=;
        b=h6STLAlgZAIHahRpiOqt75+7YPhEervlfOHpzdNopczUpjoi/cznwsqOZegaIuJ4TM
         zdwrYQypkfpFaKGT8vusv604I2nbF1GOJZlwrB9ZKBgTEBjDOpLU6TSZRH/roP8sxwT+
         LZ6HXtPlhEH+GSsavlv45TTL5baI9xO8kN71I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GKB6Sx/IUizZ9IZiRwVYRZ7sZESLZmd5Upv0GbKgvpI=;
        b=HEk0O/LP/h3ngt3Pr8iUgVrUBwC5Jwt4I1FwM7ON3yimwiMSebzzoF1ZpF0/HusVCt
         3mLQ0GZ9R67yB9Fypk267lyBdZ9pq73/xlGe5i0Opxwme1me6C+UcJg6xyzwizvBp2h5
         VV4oLhZ9sxtPJXFJ2DhrMGBh4QdOBaJJvni1ROTaKxLMM//8DM+ITOoLAh3RyJla/moC
         SPfsoIWtSSll4IK/b5Ppso6Jp4jloVF2NHuYrIC8NkmqMvvfzt+HbqaON9tDOpBha9+s
         jzWS27IJKnb8sMilMJQDd2cEO+QupCWPHcA5ik9oD7SAHnOtaSZGXB7hTrLXNVtz0+Q0
         BfMA==
X-Gm-Message-State: APjAAAXf49Vpj8ml3apvSrZFm7ZsOTtmYlvprqW8PeJRgCHkDQmyNvYX
        Atn/EZtq5hl+be8YN5or3EhPlA==
X-Google-Smtp-Source: APXvYqwZ8L7WBUXKpllPra1iDKCIj9jTGodgQKb31qnM478jp8ypjhyOfCzrMdjpE9K/VYB36AzGxg==
X-Received: by 2002:adf:d18b:: with SMTP id v11mr1782349wrc.308.1572467711910;
        Wed, 30 Oct 2019 13:35:11 -0700 (PDT)
Received: from [192.168.1.149] (ip-5-186-115-54.cgn.fibianet.dk. [5.186.115.54])
        by smtp.gmail.com with ESMTPSA id a7sm1633681wrr.89.2019.10.30.13.35.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 30 Oct 2019 13:35:10 -0700 (PDT)
Subject: Re: [RFC PATCH 04/10] pipe: Use head and tail pointers for the ring,
 not cursor and length [ver #2]
To:     Ilya Dryomov <idryomov@gmail.com>,
        David Howells <dhowells@redhat.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Zijlstra <peterz@infradead.org>,
        nicolas.dichtel@6wind.com, raven@themaw.net,
        Christian Brauner <christian@brauner.io>,
        keyrings@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-block <linux-block@vger.kernel.org>,
        linux-security-module@vger.kernel.org,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        linux-api@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <157186182463.3995.13922458878706311997.stgit@warthog.procyon.org.uk>
 <157186186167.3995.7568100174393739543.stgit@warthog.procyon.org.uk>
 <CAOi1vP97DMX8zweOLfBDOFstrjC78=6RgxK3PPj_mehCOSeoaw@mail.gmail.com>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <4892d186-8eb0-a282-e7e6-e79958431a54@rasmusvillemoes.dk>
Date:   Wed, 30 Oct 2019 21:35:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAOi1vP97DMX8zweOLfBDOFstrjC78=6RgxK3PPj_mehCOSeoaw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 30/10/2019 17.19, Ilya Dryomov wrote:
> On Thu, Oct 24, 2019 at 11:49 AM David Howells <dhowells@redhat.com> wrote:
>>  /*
>> - * We use a start+len construction, which provides full use of the
>> - * allocated memory.
>> - * -- Florian Coosmann (FGC)
>> - *
>> + * We use head and tail indices that aren't masked off, except at the point of
>> + * dereference, but rather they're allowed to wrap naturally.  This means there
>> + * isn't a dead spot in the buffer, provided the ring size < INT_MAX.
>> + * -- David Howells 2019-09-23.
> 
> Hi David,
> 
> Is "ring size < INT_MAX" constraint correct?

No. As long as one always uses a[idx % size] to access the array, the
only requirement is that size is representable in an unsigned int. Then
because one also wants to do the % using simple bitmasking, that further
restricts one to sizes that are a power of 2, so the end result is that
the max size is 2^31 (aka INT_MAX+1).

> I've never had to implement this free running indices scheme, but
> the way I've always visualized it is that the top bit of the index is
> used as a lap (as in a race) indicator, leaving 31 bits to work with
> (in case of unsigned ints).  Should that be
> 
>   ring size <= 2^31
> 
> or more precisely
> 
>   ring size is a power of two <= 2^31

Exactly. But it's kind of moot since the ring size would never be
allowed to grow anywhere near that.

Rasmus
