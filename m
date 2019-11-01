Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AE57ECB1F
	for <lists+linux-usb@lfdr.de>; Fri,  1 Nov 2019 23:13:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728094AbfKAWMo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 1 Nov 2019 18:12:44 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:38331 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728079AbfKAWMn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 1 Nov 2019 18:12:43 -0400
Received: by mail-lj1-f193.google.com with SMTP id y23so11286653ljc.5
        for <linux-usb@vger.kernel.org>; Fri, 01 Nov 2019 15:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sgYt+P3xDWHpqkCDVDLjgLKgMrsRwGebg6HQkCjAc5w=;
        b=O3mYYvlU9vmiWCuVM7D5zeynWjET9sBTNe2UP3ZA3GeXbBriHFMqoPk2kJgyTgcAeI
         BstBtBLU16kkJaWSMcP9+57VaYHHgUIqojJCqULremk/l27m2Dlyko2Sd9hhC3Y74UKd
         ZPG4og+yRVtEHOd/O+5D/qMCxYtxUKUSxHi24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sgYt+P3xDWHpqkCDVDLjgLKgMrsRwGebg6HQkCjAc5w=;
        b=SkG8/qg2HPvp5eJ5smz/WUe/5PmCrFtQmrPlJzohVAWu0QmTfSty1wD4SJTN+rTLFu
         K7JFJti8Y8gmV758eW+VtY2HULiYrCht+JHZ6a8f7jrx2SXAVcWe+zjRV3uDZdragNEk
         ajDvb0pzVrxwCHD3MJDR0z5bXoTtpVl+LpITAghE2dkXPBP2yIa4w2YB0rjBTc2jmP1F
         8xXTDaJEOw6ZGrz4blQMxuE1+4pftaG0Vn5Vlldyxv93KMB5A5mWV+gjZnqs7jMHKXB2
         WoS3U8EazNcHCeVVgKs5cUU9qJ1jBaWY+Lvj1+TbIpTydl40DPRbomPPTpugkTcCNS/H
         RCHA==
X-Gm-Message-State: APjAAAXxmGqEzkC1InIgw+9hXX+8JNV309gZU9luWo06wMJVYCqCG6q+
        PzdxA6hUM3wn5zJiN6YXJSszQFxVIko=
X-Google-Smtp-Source: APXvYqxQqKu+Q82BL33Ct8BFeFtL0n8vPhwwPExz306qNVV1okSDB15XitiO2AygSK3sGb3oIm98OA==
X-Received: by 2002:a2e:b4d3:: with SMTP id r19mr9927863ljm.143.1572646361035;
        Fri, 01 Nov 2019 15:12:41 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id e2sm3034675ljp.48.2019.11.01.15.12.39
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Nov 2019 15:12:40 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id v8so8211005lfa.12
        for <linux-usb@vger.kernel.org>; Fri, 01 Nov 2019 15:12:39 -0700 (PDT)
X-Received: by 2002:a19:6f0e:: with SMTP id k14mr8678681lfc.79.1572646359613;
 Fri, 01 Nov 2019 15:12:39 -0700 (PDT)
MIME-Version: 1.0
References: <157262963995.13142.5568934007158044624.stgit@warthog.procyon.org.uk>
 <CAHk-=wjqx4j2vqg-tAwthNP1gcAcj1x4B7sq6Npbi8QJTUMd-A@mail.gmail.com> <13964.1572645926@warthog.procyon.org.uk>
In-Reply-To: <13964.1572645926@warthog.procyon.org.uk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 1 Nov 2019 15:12:23 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg_Fb-WdcD-cbJjwZaPCNK4WZ+Ak4KTSDhopD-_=+t=9Q@mail.gmail.com>
Message-ID: <CAHk-=wg_Fb-WdcD-cbJjwZaPCNK4WZ+Ak4KTSDhopD-_=+t=9Q@mail.gmail.com>
Subject: Re: [RFC PATCH 00/11] pipe: Notification queue preparation [ver #3]
To:     David Howells <dhowells@redhat.com>
Cc:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Nicolas Dichtel <nicolas.dichtel@6wind.com>, raven@themaw.net,
        Christian Brauner <christian@brauner.io>,
        keyrings@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-block <linux-block@vger.kernel.org>,
        LSM List <linux-security-module@vger.kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Nov 1, 2019 at 3:05 PM David Howells <dhowells@redhat.com> wrote:
>
> Changing those to non-sync:

Your benchmark seems very insensitive to just about any changes.

I suspect it is because you only test throughput. Latency is what the
pipe wakeup has been optimized for, and which tends to be much more
sensitive to other changes too (eg locking).

That said, I'm not convinced a latency test would show much either.

               Linus
