Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1206913CDF9
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2020 21:18:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729045AbgAOUSF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jan 2020 15:18:05 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:37448 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726220AbgAOUSE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jan 2020 15:18:04 -0500
Received: by mail-lj1-f195.google.com with SMTP id o13so19985345ljg.4
        for <linux-usb@vger.kernel.org>; Wed, 15 Jan 2020 12:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V37Vo/FBhU5kltccCSOcOaOV/u6sTU75u7lgAerRHWk=;
        b=OrYEwmU6lkXsGZWCHNNhtVtpsE6fs3wEj0m6dC3WrtWTeidQt6E9H+zSvKowaPh1ec
         ugRczy3F4djq+5tAM9KSePUrrGy8RTZj+3Nsfw0drc5nlDq0wGY+b9DTqALVC2112QUl
         PU4s1hiA953qkOxsAyvqyWsjNb5gpuGJJ8PeA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V37Vo/FBhU5kltccCSOcOaOV/u6sTU75u7lgAerRHWk=;
        b=JBERA+AdxWXDaNiKztVj1WDCYHwE/vwYEtxX9CkwTkImTg72kHSLChBSumnxKEcyPc
         BrLF3LRmxNBrg0fsKIKNWpstg9IRJXIAS4E8j/5WiXdCIBNou9QgEL4/xFBupt3KZvFi
         bC6DOy7z8KPOfmqYXKaoIbTxCkxvYIJTQ85GD091snrH0AxLWNGZbruP163MOZVwXryV
         yY0YpKQMPz9SlYG+ntGY3HaWqFTlWsE4SUSO9PuNv8GfkOeLVRjgBe4wDTPjaiD+RMn9
         B5jtkKspGr30bozWVFAfO7HGVT/5Fiyidvay3dRcLhMqWKESrz7/YloNdbN1aH5GwtqB
         syRg==
X-Gm-Message-State: APjAAAWKVWlzUrZFhdYY6ssU9tmbpb8AMkHixDw9MSX7METnNo8vYrlk
        /HRec9JJpM01SYNuIM2DoJp0P8v/nm0=
X-Google-Smtp-Source: APXvYqxffEu5eFVmV9+Mw7XrOfK6/xCY4ZBMrqKuNgk0O+vYAAxgNoVOkMeMTpkHJLDADDCMz8QB4Q==
X-Received: by 2002:a2e:8119:: with SMTP id d25mr102214ljg.76.1579119483008;
        Wed, 15 Jan 2020 12:18:03 -0800 (PST)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id s2sm9617827lji.53.2020.01.15.12.18.02
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2020 12:18:02 -0800 (PST)
Received: by mail-lj1-f172.google.com with SMTP id j1so19986812lja.2
        for <linux-usb@vger.kernel.org>; Wed, 15 Jan 2020 12:18:02 -0800 (PST)
X-Received: by 2002:a2e:990e:: with SMTP id v14mr74215lji.23.1579119048131;
 Wed, 15 Jan 2020 12:10:48 -0800 (PST)
MIME-Version: 1.0
References: <157909503552.20155.3030058841911628518.stgit@warthog.procyon.org.uk>
In-Reply-To: <157909503552.20155.3030058841911628518.stgit@warthog.procyon.org.uk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 15 Jan 2020 12:10:32 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjrrOgznCy3yUmcmQY1z_7vXVr6GbvKiy8cLvWbxpmzcw@mail.gmail.com>
Message-ID: <CAHk-=wjrrOgznCy3yUmcmQY1z_7vXVr6GbvKiy8cLvWbxpmzcw@mail.gmail.com>
Subject: Re: [RFC PATCH 00/14] pipe: Keyrings, Block and USB notifications
 [ver #3]
To:     David Howells <dhowells@redhat.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Casey Schaufler <casey@schaufler-ca.com>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        Nicolas Dichtel <nicolas.dichtel@6wind.com>,
        Ian Kent <raven@themaw.net>,
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

So I no longer hate the implementation, but I do want to see the
actual user space users come out of the woodwork and try this out for
their use cases.

I'd hate to see a new event queue interface that people then can't
really use due to it not fulfilling their needs, or can't use for some
other reason.

We've had a fair number of kernel interfaces that ended up not being
used all that much, but had one or two minor users and ended up being
nasty long-term maintenance issues.. I don't want this to become yet
another such one.

                 Linus
